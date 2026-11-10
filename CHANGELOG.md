# Changelog

## 1.2.0 · 2026-11-10

- **Taught from current sources.** Before the first lesson on each topic the tutor searches, reads the best
  2–4 current sources and teaches from them; they're listed in the note's new `## Sources` with the date
  checked, and re-checked after 30 days. Facts come from sources, not the model's memory; unsourced facts are
  marked. Without web search it says so and marks the topic "not checked".
- **Depth per topic.** A Target column in the map: overview (L1), working knowledge (L2), practitioner (L3) or
  expert (L4). Set overall in the interview, per module in the draft, per topic any time ("just the gist of
  X", "go deep on Y"). The tutor stops at the target; "where am I?" counts topics at target; challenges are
  for expert topics.
- **Several topics at once.** "Now" and "Parked" become an "In progress" list: one line per topic with its
  exact resume point, so you can learn topics one after another, alternate, or switch freely. "Continue"
  lists them when there are several; "continue <topic>" resumes that one; "alternate between A and B" sets a
  rhythm the tutor follows when it suggests what's next. Each conversation edits only its own topic's line,
  so two conversations side by side are safe. Older maps are converted on first edit.
- The session-start hook reports every topic in progress, and finds the Review column by its header, so maps
  with or without Target both work.

## 1.1.0 · 2026-11-10

- **Two ways to start.** "Teach me X" researches how the subject is taught and drafts a map sized to it (a
  narrow topic gets one module, a field gets a full curriculum). "Teach me from this plan" builds the map from
  your plan (your sections, order and wording), proposes gaps separately, and adds only those you accept.
- **Nothing is written until you approve the draft**, and teaching starts as soon as you do.
- "Just start" skips the interview with stated defaults. A pasted plan is kept as `source-plan.md`; a plan's
  dates are recorded and reported on "where am I?".
- The charter has a Sources section (your plan, the references used, any schedule).
- The marketplace is now `ai-tutor`, matching the repository: install with `tutor@ai-tutor`.
- README rewritten around the two ways in; first-session steps; permission tips; an icon.

## 1.0.0 · 2026-11-04

- First release: the `learn`, `new-subject` and `challenge` skills, subject templates, and the session-start
  hook.
