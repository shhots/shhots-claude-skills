#!/usr/bin/env bash
# Build claude.ai-uploadable skill ZIPs into dist/.
#
# claude.ai validates uploaded skills: the ZIP root must contain the skill
# folder (named exactly like the skill's `name` field), the folder must hold
# SKILL.md, and the frontmatter description must be at most 200 characters.
# The plugin versions in plugins/ keep longer, trigger-rich descriptions
# (Claude Code allows 1024), so this script swaps in the condensed
# descriptions from scripts/claude-ai-descriptions.json before zipping.
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
dist="$repo_root/dist"
staging="$(mktemp -d)"
trap 'rm -rf "$staging"' EXIT

rm -rf "$dist"
mkdir -p "$dist"

for skill_dir in "$repo_root"/plugins/*/skills/*/; do
  name="$(basename "$skill_dir")"
  # Each skill exists twice (in the shhots bundle plugin and in its own
  # plugin); the copies are identical, so build each name only once.
  if [ -e "$staging/$name" ]; then
    continue
  fi
  cp -R "$skill_dir" "$staging/$name"

  python3 - "$staging/$name/SKILL.md" "$repo_root/scripts/claude-ai-descriptions.json" "$name" <<'PY'
import json, re, sys

skill_md, descs_path, name = sys.argv[1], sys.argv[2], sys.argv[3]
descs = json.load(open(descs_path))

if name not in descs:
    sys.exit(f"ERROR: no condensed description for '{name}' in {descs_path}")
desc = descs[name]
if len(desc) > 200:
    sys.exit(f"ERROR: condensed description for '{name}' is {len(desc)} chars (max 200)")

text = open(skill_md).read()
m = re.search(r"^name:\s*(\S+)\s*$", text, re.M)
if not m or m.group(1) != name:
    sys.exit(f"ERROR: SKILL.md name '{m.group(1) if m else None}' does not match folder '{name}'")

text, n = re.subn(r"^description:.*$", f"description: {desc}", text, count=1, flags=re.M)
if n != 1:
    sys.exit(f"ERROR: could not find description line in {skill_md}")
open(skill_md, "w").write(text)
print(f"  {name}: description {len(desc)} chars")
PY

  (cd "$staging" && zip -qr "$dist/$name.zip" "$name")
  echo "built dist/$name.zip"
done

echo "done: $(ls "$dist" | wc -l | tr -d ' ') zips in dist/"
