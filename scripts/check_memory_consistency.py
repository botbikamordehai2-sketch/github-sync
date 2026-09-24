"""Check that repository status sources agree; do not contact external services."""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
STATUS = ROOT / "STATUS.md"
INDEX = ROOT / "PROJECT_INDEX.md"
TOPOLOGY = ROOT / "docs" / "SYSTEM_TOPOLOGY_AND_MEMORY.md"

def entries(path, column):
    if not path.is_file():
        raise ValueError(f"Missing source: {path.relative_to(ROOT)}")
    result = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("| **"):
            continue
        cells = [cell.strip() for cell in line.strip("|").split("|")]
        if len(cells) <= column:
            raise ValueError(f"Malformed project row in {path.name}: {line}")
        name = re.fullmatch(r"\*\*(.+)\*\*", cells[0])
        if not name:
            continue
        project = name.group(1)
        if project in result:
            raise ValueError(f"Duplicate project in {path.name}: {project}")
        result[project] = cells[column]
    if not result:
        raise ValueError(f"No project rows in {path.name}")
    return result

def main():
    status = entries(STATUS, 1)
    index = entries(INDEX, 2)
    errors = []
    for project in sorted(status.keys() | index.keys()):
        if status.get(project) != index.get(project):
            errors.append(
                f"{project}: STATUS.md={status.get(project, 'MISSING')}, "
                f"PROJECT_INDEX.md={index.get(project, 'MISSING')}"
            )
    if TOPOLOGY.is_file():
        content = TOPOLOGY.read_text(encoding="utf-8")
        if "STATUS.md" not in content or "PROJECT_INDEX.md" not in content:
            errors.append("Topology must reference both official status documents")
        if "קובץ זה ב-GitHub הוא הסמכות לקביעת סטטוס הפרויקטים" in content:
            errors.append("Topology contradicts official status documents")
    if errors:
        print("Memory consistency failed:\n" + "\n".join(errors), file=sys.stderr)
        return 1
    print(f"Memory consistency passed: {len(status)} matching project statuses")
    return 0

if __name__ == "__main__":
    sys.exit(main())
