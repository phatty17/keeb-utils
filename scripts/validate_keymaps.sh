#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
KEYBOARDS_DIR="$ROOT_DIR/keyboards"

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required. Install jq and re-run."
  exit 2
fi

error_count=0

print_err() {
  local file="$1"; shift
  local msg="$*"
  printf ' - %s: %s\n' "$file" "$msg"
}

validate_json() {
  local file="$1"
  if ! jq -e . "$file" >/dev/null 2>&1; then
    print_err "$file" "Invalid JSON"
    error_count=$((error_count+1))
    return 1
  fi
  return 0
}

validate_via() {
  local file="$1"

  # Must be object
  if ! jq -e 'type=="object"' "$file" >/dev/null; then
    print_err "$file" "Top-level JSON must be an object"
    error_count=$((error_count+1))
    return
  fi

  # layers must exist and be a non-empty array
  if ! jq -e '.layers and (.layers|type=="array" and length>0)' "$file" >/dev/null; then
    print_err "$file" "layers must be a non-empty array"
    error_count=$((error_count+1))
    return
  fi

  # each layer must be an array and contain only strings
  if ! jq -e 'all(.layers[]; (type=="array") and (all(.[]; type=="string")))' "$file" >/dev/null; then
    print_err "$file" "each layer must be an array of string keycodes"
    error_count=$((error_count+1))
  fi

  # name, if present, must be string
  if ! jq -e '(has("name")|not) or ( .name|type=="string" )' "$file" >/dev/null; then
    print_err "$file" "name must be a string when present"
    error_count=$((error_count+1))
  fi
}

validate_vial() {
  local file="$1"

  # Be lenient: must be object and have at least one of common keys
  if ! jq -e 'type=="object" and (has("layers") or has("layouts") or has("matrix") or has("name"))' "$file" >/dev/null; then
    print_err "$file" "Expected one of keys: layers, layouts, matrix, name"
    ((error_count++))
  fi
}

discover_files() {
  local files=()
  if [[ -d "$KEYBOARDS_DIR" ]]; then
    while IFS= read -r -d '' f; do files+=("$f"); done < <(find "$KEYBOARDS_DIR" -type f -path '*/keymaps/via/*.json' -print0)
    while IFS= read -r -d '' f; do files+=("$f"); done < <(find "$KEYBOARDS_DIR" -type f -path '*/keymaps/vial/*.json' -print0)
    # legacy: allow JSON directly under keymaps/
    while IFS= read -r -d '' f; do files+=("$f"); done < <(find "$KEYBOARDS_DIR" -type f -path '*/keymaps/*.json' -print0)
  fi
  printf '%s\n' "${files[@]}"
}

main() {
  mapfile -t files < <(discover_files)
  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No keymap files found under keyboards/*/*/keymaps."
    exit 0
  fi

  via_count=0
  vial_count=0
  for f in "${files[@]}"; do
    case "$f" in
      */keymaps/via/*) via_count=$((via_count+1)) ;;
      */keymaps/vial/*) vial_count=$((vial_count+1)) ;;
    esac
  done
  echo "Discovered ${#files[@]} keymap file(s): VIA=$via_count, Vial=$vial_count"

  for f in "${files[@]}"; do
    validate_json "$f" || continue
    if [[ "$f" == */keymaps/via/* ]]; then
      validate_via "$f"
    elif [[ "$f" == */keymaps/vial/* ]]; then
      validate_vial "$f"
    else
      # legacy: if it has layers, apply VIA-like validation; otherwise only JSON parse
      if jq -e 'has("layers")' "$f" >/dev/null; then
        validate_via "$f"
      fi
    fi
  done

  if [[ $error_count -gt 0 ]]; then
    echo "Failed with $error_count validation error(s)."
    exit 1
  fi
  echo "All keymap files passed validation."
}

main "$@"
