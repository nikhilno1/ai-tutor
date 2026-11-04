---
name: new-subject
description: Set up a new subject to learn with the tutor - a short interview, then a charter, a map of topics with prerequisites, a learner profile and a guide, as Markdown files under learning/<subject>/. Use when the user says "I want to learn X", "set up a new subject", "start learning X", or asks to learn something that has no folder under learning/ yet.
---

# Set up a subject

The output is a folder the tutor (`tutor:learn`) works from: `learning/<subject-slug>/` in the folder Claude
Code runs in. The templates are in this skill's folder, under `templates/`. Check `learning/` first: if the
subject exists, say so and hand over to `tutor:learn`. If `learning/` holds other subjects, copy their
`learner.md` preferences into the new one (how someone learns rarely depends on the subject).

## 1. The interview (one message, then follow-ups only where an answer is thin)

Ask these together, numbered, and say they can answer by voice, in any order, briefly:
1. **What and why:** the subject, and what learning it will let you do.
2. **The standard:** who do you want to hold your own with (an interviewer, a senior practitioner, an exam,
   a client)? Any date that matters, or none?
3. **What you already know:** your background, and anything near this subject you know well. (The tutor builds
   on it and won't re-teach it.)
4. **How you like to learn:** e.g. questions before answers, breadth before depth, analogies to your field,
   voice, short sessions. "Don't know yet" is fine.
5. **What "doing it" looks like here:** building, solving problems, writing, speaking, practising a skill.
   That becomes Level 3.
6. **Sources:** a syllabus, a book, a course, notes or a plan you already have (paste it or name the file).

If they gave a plan or syllabus, it is the starting point, not the limit: cover everything in it, and add what
it misses, marked as extensions.

## 2. Draft the map, then check it with them

Break the subject into **modules** (typically 6–17) and each module into **topics** (3–8), each with an ID
(`3.2`), a one-line title, its **Needs** (prerequisite IDs, so the tutor can walk the chain), and a target per
module (L3 or L4). Group the modules into 3–6 **dimensions** (the broad areas that together mean "no major
gaps"). Order is a suggestion only. Search to check that the breakdown matches how the field is actually
taught and practised today, even when they have no sources of their own, and say where you're unsure.

Show it compactly (modules with topic counts, the dimensions, two or three sample prerequisite chains) and ask
for changes in one round. Don't ask for approval topic by topic.

## 3. Write the files

From `templates/`, filled in from the interview:
- `charter.md` (their goal, standard, background, levels, teaching stages, three questions, ground rules; in
  their words where they gave them).
- `map.md` (Where we are: Now "nothing yet", Suggested next: the first topic whose Needs are met, starting
  with a one-question diagnostic; the dimensions; one table per module).
- `learner.md` (their answer to question 4, dated; question 3 under strengths).
- `topics/_template.md`, `log.md`, `how-to-use.md` (copied as they are, with the subject's name filled in).

Don't invent anything about them: what they didn't say stays empty.

## 4. Hand over

In at most 6 lines: the folder you made, how many modules and topics, where you suggest starting and why, and
the one thing to remember: "Say *continue* any time; I save as we go." Then ask whether to start now.
