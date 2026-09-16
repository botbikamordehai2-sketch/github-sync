#!/usr/bin/env bash
# scan_memory_for_all.sh <path-to-cloned-memory-for-all>
#
# Extra checks specific to the memory-for-all repo, on top of the generic
# scan (scan_repo_generic.sh should be run separately for syntax/JSON/YAML).
# 1. Required structure present.
# 2. The scheduler actually runs end-to-end (--once, against a throwaway
#    shared_memory/data store).

set -uo pipefail

REPO_PATH="${1:?usage: scan_memory_for_all.sh <repo-path>}"
FAIL=0

echo "## 🩺 Scan: memory-for-all (extra checks)"
cd "$REPO_PATH" || { echo "❌ path not found: $REPO_PATH"; exit 1; }

echo "### Required structure"
required=(
  "README.md" "LICENSE" ".gitignore" "requirements.txt"
  "docs/ARCHITECTURE.md" "docs/INTERFACES.md" "docs/DECISIONS.md"
  "models/base/adapter.py" "models/claude/adapter.py" "models/gpt/adapter.py" "models/deepseek/adapter.py"
  "shared_memory/store.py" "shared_memory/schema/memory_entry.schema.json"
  "schedules/scheduler.py" "schedules/config/schedule.yaml"
  "scripts/setup.sh" "scripts/run_scheduler.sh"
)
for f in "${required[@]}"; do
  if [ ! -e "$f" ]; then
    echo "❌ MISSING: $f"
    FAIL=1
  fi
done
[ "$FAIL" -eq 0 ] && echo "✅ all required files/dirs present"
echo
echo "### Scheduler smoke test (--once)"
pip install --quiet --break-system-packages PyYAML 2>/dev/null || pip install --quiet PyYAML 2>/dev/null
if python3 schedules/scheduler.py --once > /tmp/sched_out_$$ 2>&1; then
  echo "✅ scheduler ran cleanly"
  sed 's/^/    /' /tmp/sched_out_$$
else
  echo "❌ scheduler FAILED"
  sed 's/^/    /' /tmp/sched_out_$$
  FAIL=1
fi
rm -f /tmp/sched_out_$$
rm -f shared_memory/data/store.json
echo

if [ "$FAIL" -eq 1 ]; then
  echo "### ❌ RESULT: memory-for-all extra checks FAILED"
else
  echo "### ✅ RESULT: memory-for-all extra checks clean"
fi

exit $FAIL
