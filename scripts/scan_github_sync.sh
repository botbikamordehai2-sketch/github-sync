#!/usr/bin/env bash
# scan_github_sync.sh <path-to-github-sync-checkout>
#
# Extra checks specific to the github-sync repo itself, on top of the
# generic syntax/JSON/YAML scan (scan_repo_generic.sh). Checks that the
# documented governance structure (README/GOVERNANCE/SAFETY_RULES/STATUS/
# PROJECT_INDEX/PLATFORM_MAP/MULTI_AGENT_COORDINATION/REPOSITORIES + the
# per-folder README stubs) is still present. SAFETY_RULES.md rule #8 says
# repo structure changes need human approval — this only flags drift,
# it never changes anything itself.

set -uo pipefail

REPO_PATH="${1:?usage: scan_github_sync.sh <repo-path>}"
FAIL=0

echo "## 🩺 Scan: github-sync (governance structure)"
cd "$REPO_PATH" || { echo "❌ path not found: $REPO_PATH"; exit 1; }

echo "### Required governance files"
required=(
  "README.md" "GOVERNANCE.md" "SAFETY_RULES.md" "STATUS.md" "PROJECT_INDEX.md"
  "PLATFORM_MAP.md" "MULTI_AGENT_COORDINATION.md" "REPOSITORIES.md"
  "docs/architecture.md" "docs/sync-contract-template.md"
  "agents/README.md" "apps/README.md" "connectors/README.md"
  "mappings/README.md" "models/README.md" "tests/README.md" "workflows/README.md"
)
for f in "${required[@]}"; do
  if [ ! -e "$f" ]; then
    echo "❌ MISSING: $f"
    FAIL=1
  fi
done
[ "$FAIL" -eq 0 ] && echo "✅ all documented governance files/dirs present"
echo
echo "### STATUS.md project table sanity check"
# Flag if memory-for-all is not yet listed anywhere in STATUS.md / PROJECT_INDEX.md —
# informational only (not a failure): this repo's own rule says every project must
# appear in PROJECT_INDEX.md, but adding it is a human/governance decision, not
# something this scan does on its own.
if ! grep -qi "memory-for-all" STATUS.md PROJECT_INDEX.md 2>/dev/null; then
  echo "ℹ️  NOTE: 'memory-for-all' is not yet listed in STATUS.md / PROJECT_INDEX.md (informational only, not a failure)"
fi
echo

if [ "$FAIL" -eq 1 ]; then
  echo "### ❌ RESULT: github-sync governance structure FAILED"
else
  echo "### ✅ RESULT: github-sync governance structure clean"
fi

exit $FAIL
