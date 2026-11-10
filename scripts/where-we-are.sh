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
  # Topics in progress: the lines under "In progress" (up to 5); older maps have one "Now" line instead.
  now=$(awk '/^- \*\*In progress/ { on = 1; next } on && /^(- \*\*|## )/ { exit }
    on && /^  - / && !/none yet/ && k < 5 { sub(/^  - /, ""); printf "%s%s", (k++ ? "\n    " : ""), substr($0, 1, 180) }' "$map")
  [ -n "$now" ] && now="
    $now"
  [ -n "$now" ] || now=$(grep -m1 '^- \*\*Now:\*\*' "$map" | sed 's/^- \*\*Now:\*\* *//' | cut -c1-200)
  # The Review column is found by its header, so maps with or without a Target column both work.
  due=$(awk -F'|' -v t="$today" '
    /^\|/ { for (i = 2; i < NF; i++) { c = $i; gsub(/ /, "", c); if (c == "Review") { rc = i; next } } }
    rc && $2 ~ /[0-9]/ { r = $rc; gsub(/ /, "", r); if (r ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ && r <= t) n++ }
    END { print n+0 }' "$map")
  # Broad first: how many topics are done for the current pass (level >= the pass, or the topic's target if
  # lower). The target is the row's Target cell, else the module heading's "target L<n>" or "(L<n>)".
  pass=$(awk -F'|' '
    /^- \*\*Approach:\*\*/ { if ($0 ~ /broad/ && match($0, /pass [1-4]/)) p = substr($0, RSTART+5, 1)+0 }
    /^## / { ht = 0; if (match($0, /target L[1-4]/)) ht = substr($0, RSTART+8, 1)+0
             else if (match($0, /\(L[1-4]\)/)) ht = substr($0, RSTART+2, 1)+0 }
    /^\|/ { hdr = 0; tt = 0; for (i = 2; i < NF; i++) { c = $i; gsub(/ /, "", c)
        if (c == "Level") { lc = i; hdr = 1 } else if (c == "Target") tt = i }
      if (hdr) { tc = tt; next } }
    lc && $2 ~ /[0-9]/ { t = ht; if (tc) { x = $tc; gsub(/ /, "", x); if (x ~ /^L[1-4]$/) t = substr(x,2)+0 }
      if (!t) t = 2; l = $lc; gsub(/ /, "", l); v = (l ~ /^L[0-4]$/) ? substr(l,2)+0 : 0
      n++; need = (p < t) ? p : t; if (v >= need) d++ }
    END { if (p) printf "broad first, pass %d: %d of %d topics done", p, d, n }' "$map")
  out="$out
- learning/$subject (reviews due: $due${pass:+; $pass}). In progress: ${now:-none}"
done
[ -n "$out" ] || exit 0
printf 'Tutor (plugin): subjects under learning/, today %s.%s\nIf the user says "continue" (with or without a topic) or asks about one of these, use skill tutor:learn; it reads the files before answering.\n' "$today" "$out"
