"""Demo SQL lint: every model starts with a '-- grain:' line and never uses select *."""
import pathlib
import re
import sys

bad = []
for p in sorted(pathlib.Path("models").rglob("*.sql")):
    text = p.read_text()
    if not text.startswith("-- grain:"):
        bad.append(f"{p}: the first line must be '-- grain: ...'")
    if re.search(r"select\s+\*", text, re.IGNORECASE):
        bad.append(f"{p}: select * is not allowed")
print("\n".join(bad) or "ok")
sys.exit(1 if bad else 0)
