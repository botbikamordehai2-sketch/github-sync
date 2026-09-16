#!/usr/bin/env bash
# scan_repo_generic.sh <path-to-repo> <label>
#
# Generic, repo-agnostic health scan: validates every .py/.sh/.json/.yml/.yaml
# file it finds, lists the last 5 commits, flags oversized files, and prints
# a summary block. Exits 1 if it found a real problem (syntax error / invalid
# file), so the calling workflow step can propagate failure.

set -uo pipefail

REPO_PATH="${1:?usage: scan_repo_generic.sh <repo-path> <label>}"
LABEL="${2:-repo}"
FAIL=0

echo "## 🩺 Scan: $LABEL"
echo "path: $REPO_PATH"
echo

cd "$REPO_PATH" || { echo "❌ path not found: $REPO_PATH"; exit 1; }

echo "### Structure (depth 2)"
find . -maxdepth 2 -not -path '*/.git*' | sort
echo
echo "### Python syntax check"
py_files=$(find . -name '*.py' -not -path '*/.git/*')
if [ -z "$py_files" ]; then
  echo "(no .py files)"
else
  while IFS= read -r f; do
    if ! python3 -m py_compile "$f" 2>/tmp/pyerr_$$; then
      echo "❌ SYNTAX ERROR: $f"
      cat /tmp/pyerr_$$
      FAIL=1
    fi
    rm -f /tmp/pyerr_$$
  done <<< "$py_files"
  [ "$FAIL" -eq 0 ] && echo "✅ all Python files compile"
fi
echo

echo "### Shell syntax check"
sh_files=$(find . -name '*.sh' -not -path '*/.git/*')
if [ -z "$sh_files" ]; then
  echo "(no .sh files)"
else
  while IFS= read -r f; do
    if ! bash -n "$f" 2>/tmp/sherr_$$; then
      echo "❌ SYNTAX ERROR: $f"
      cat /tmp/sherr_$$
      FAIL=1
    fi
    rm -f /tmp/sherr_$$
  done <<< "$sh_files"
  [ "$FAIL" -eq 0 ] && echo "✅ all shell scripts parse"
fi
echo
echo "### JSON validity"
json_files=$(find . -name '*.json' -not -path '*/.git/*')
if [ -z "$json_files" ]; then
  echo "(no .json files)"
else
  while IFS= read -r f; do
    if ! python3 -m json.tool "$f" >/dev/null 2>/tmp/jsonerr_$$; then
      echo "❌ INVALID JSON: $f"
      cat /tmp/jsonerr_$$
      FAIL=1
    fi
    rm -f /tmp/jsonerr_$$
  done <<< "$json_files"
  [ "$FAIL" -eq 0 ] && echo "✅ all JSON files valid"
fi
echo

echo "### YAML validity"
yaml_files=$(find . \( -name '*.yml' -o -name '*.yaml' \) -not -path '*/.git/*')
if [ -z "$yaml_files" ]; then
  echo "(no .yml/.yaml files)"
else
  while IFS= read -r f; do
    if ! python3 -c "import yaml,sys; yaml.safe_load(open(sys.argv[1]))" "$f" 2>/tmp/yamlerr_$$; then
      echo "❌ INVALID YAML: $f"
      cat /tmp/yamlerr_$$
      FAIL=1
    fi
    rm -f /tmp/yamlerr_$$
  done <<< "$yaml_files"
  [ "$FAIL" -eq 0 ] && echo "✅ all YAML files valid"
fi
echo
echo "### Oversized files (>5MB)"
big=$(find . -not -path '*/.git/*' -type f -size +5M)
if [ -z "$big" ]; then
  echo "(none)"
else
  echo "$big"
fi
echo

echo "### Last 5 commits"
git log -5 --date=short --pretty=format:'%h  %ad  %s' 2>/dev/null || echo "(not a git checkout / no history)"
echo
echo

if [ "$FAIL" -eq 1 ]; then
  echo "### ❌ RESULT: problems found in $LABEL"
else
  echo "### ✅ RESULT: $LABEL clean"
fi

exit $FAIL
