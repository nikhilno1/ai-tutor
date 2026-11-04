#!/bin/sh
# SessionStart: tell the tutor where the learner is in each subject, so "continue" works in a fresh
# conversation. Prints nothing when there is no learning/ folder. Reads files only; writes nothing.
dir="${CLAUDE_PROJECT_DIR:-.}/learning"
[ -d "$dir" ] || exit 0
today=$(date +%F)
out=""
for map in "$dir"/*/map.md; do
  [ -f "$map" ] || continue
  subject=$(basename "$(dirname "$map")")
  now=$(grep -m1 '^- \*\*Now:\*\*' "$map" | sed 's/^- \*\*Now:\*\* *//' | cut -c1-200)
  due=$(awk -F'|' -v t="$today" 'NF>=8 && $2 ~ /[0-9]/ { r=$7; gsub(/ /,"",r); if (r ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ && r <= t) n++ } END { print n+0 }' "$map")
  out="$out
- learning/$subject: Now: ${now:-not set} · reviews due: $due"
done
[ -n "$out" ] || exit 0
printf 'Tutor (plugin): subjects under learning/, today %s.%s\nIf the user says "continue" or asks about one of these, use skill tutor:learn; it reads the files before answering.\n' "$today" "$out"
