---
name: new-subject
description: Set up a new subject to learn with the tutor, in one of two ways - from a topic (research it, draft a map of topics with prerequisites) or from a study plan, syllabus or course outline the learner already has (follow it) - then get the learner's approval, write the files under learning/<subject>/ and start teaching. Use when the user says "I want to learn X", "teach me X" and X has no folder under learning/, "teach me from this plan", "here's my syllabus", points to a plan file or link, or says "set up a new subject".
---

# Set up a subject

The output is a folder the tutor (`tutor:learn`) works from: `learning/<subject-slug>/` in the folder Claude
Code runs in. The templates are in this skill's folder, under `templates/`: open them with the Read tool, not
shell commands (the shell may be limited to the learner's folder). The plugin's own files are your business,
not the learner's: don't mention them unless something actually fails.

**Before anything:** look in `learning/`. If this subject is already there, say so in one line and continue
with `tutor:learn` (if they brought a plan, offer to add its missing items to that map: show them first). If
`learning/` holds other subjects, copy their `learner.md` preferences into the new one later (how someone
learns rarely depends on the subject).

**Two ways in.** Pick from what they said; if unclear, ask in one line ("Do you have a plan or syllabus you
want to follow, or shall I build one?").
- **A. From a topic:** "teach me X", "I want to learn X". You research the subject and draft the map.
- **B. From their plan:** they point to a file, a folder, a link, or paste a plan, syllabus, course outline or
  book contents. The map follows their plan.

Both end the same way: **show the draft, write nothing until they approve, then write the files and start
teaching.**

## 1. The interview: one message

Ask these together, numbered, and say they can answer briefly, in any order, by voice, or say **"just
start"** to use the defaults (shown in brackets; tell them afterwards which defaults you used).
1. **Why:** what learning this will let you do. [general understanding]
2. **The standard and the depth:** who you want to hold your own with (an interviewer, a senior
   practitioner, an exam, a client), any date that matters, and how deep you want to go overall: **overview**
   (explain it simply), **working knowledge** (how it works and where it breaks), **practitioner** (do it for
   real) or **expert** (defend it under hard questions). Some parts can go deeper or lighter than others.
   [a capable practitioner; no deadline; working knowledge]
3. **What you already know:** your background, and anything near this subject you know well. [ask one
   diagnostic question when teaching starts]
4. **How you like to learn:** e.g. questions before answers, analogies to your field, short sessions. [the
   tutor's defaults]
5. **What "doing it" means here:** building, solving problems, writing, speaking, practising a skill. This
   becomes Level 3. [what practitioners of this subject actually do]

**Way A** adds a sixth: **Sources:** a book, course or notes you want used. [none: I'll research it]
**Way B:** read the plan first (step 2B), then ask only what the plan doesn't already answer. A plan with
dates answers part of question 2; a plan from a course often answers question 5.

Follow up only where an answer is too thin to build on, once. Don't invent anything about them: what they
didn't say stays empty or takes the default, and you say which.

## 2A. From a topic: research, then draft

**Size the map to the subject.** A single concept or tool ("how DNS works", "git rebase") is one module of
3–8 topics. A skill or a field ("Spanish to B1", "machine learning", "corporate finance") is 6–15 modules of
3–8 topics each. In between, in between. Say which size you chose and why, in one line.

**Research before you draft**, so the map matches how the field is taught and practised now, not only what
you remember:
- Search for how it is taught: two or three well-regarded syllabi or courses (university, certification,
  standard bootcamp), the standard textbooks' contents, and for a fast-moving field, what changed recently.
- Look for the order practitioners agree on (what must come first) and the common sticking points.
- Keep 3–6 sources to cite: the ones the map actually draws on, with links.
- No web search available: say so, build from what you know, and write "Not checked against current
  sources" in the charter's Sources.

**Draft the map:** modules, each with topics. Every topic gets an ID (`3.2`), a one-line title and its
**Needs** (prerequisite IDs, so the tutor can walk the chain).

**Set the depth:** every module gets a target, and every topic in it a Target cell (the module's, unless they
asked otherwise for that topic): `L1` overview, `L2` working knowledge, `L3` practitioner, `L4` expert. Start
from the overall depth they chose, then go lighter on background modules that only support their goal and deeper
where their standard demands it, and say which modules you moved and why.

**Group the modules into 2–6 dimensions:** the broad areas that together mean "no major gaps" (a one-module map
has one). The order is a suggestion; the learner can start anywhere.

## 2B. From their plan: follow it

**Read all of it first.** A file or folder: read every file (PDFs too). A link: fetch it. Pasted: use it as
given. If you can't read it (a login wall, a scanned image you can't make out), say exactly what failed and
ask them to paste it. If it is far too large to read in full, read its contents pages and headings, say what
you skipped, and continue.

**Their plan is the map's backbone:**
- Their sections become modules, their items become topics, in their order and their wording. Keep their
  numbering if it has one.
- Split an item only when it can't be taught in one conversation (a whole book chapter, "learn statistics");
  its parts sit under it (`3.2a`, `3.2b`) and you say which items you split.
- Add the **Needs** from the content; plans rarely state them.
- **Depth:** the overall depth from the interview, except items the plan marks optional, "skim", "read only"
  or "background" (L1, overview), and items whose plan asks for a build, project or problem set (at least L3).
- **Dates or weeks in the plan:** record them in the charter (Sources, "Schedule"). The suggested order is the
  plan's. The learner can still wander; the tutor reports where they stand against the schedule only when
  asked "where am I?".

**Then look for gaps**, separately: prerequisites the plan assumes but never covers, and areas the standard
needs that the plan leaves out. Search to check where you aren't sure. Propose them as a short numbered list,
each with one line of why. **Nothing is added unless they accept it.** Accepted items go into the map marked
`(extension)` after the title, placed before whatever needs them. A plan with no real gaps: say so; don't
invent some.

**Keep the plan:** a file or link is recorded in the charter's Sources by its path or URL, and never edited. A
pasted plan is saved as `learning/<subject>/source-plan.md`, word for word, so it isn't lost with the chat.

## 3. Show the draft and get approval

Show it compactly, in one message:
- The size and the source: "From your plan: 9 modules, 41 topics, 2 split" or "Researched: 7 modules, 34
  topics, drawn mainly on <2–3 sources>".
- The modules with their topic counts and depth (by name: "overview", "practitioner"), and the dimensions.
  Say they can change the depth of any module or topic now or later ("overview only for module 5").
- Two or three prerequisite chains, so they see the order of foundations (`4.3 needs 2.1, 3.2`).
- Way B: the proposed additions, numbered, each acceptable on its own ("accept 1 and 3").
- Where you're unsure, in one line.
- Where you'd start, and why.

Then ask: **"Shall I set this up? Say *yes*, or tell me what to change."** Ask for changes in one round, not
topic by topic; they can ask to see every topic of a module. Changes: redraft, show only what changed, and ask
again. **Write no files until they say yes** (or "go", "looks good", "fine"). A question or a change request
isn't a yes.

## 4. Write the files

From `templates/`, filled in from the interview and the approved draft:
- `charter.md`: their goal, standard, background, levels (Level 3 from question 5), teaching stages, three
  questions, ground rules, and Sources: their plan (or "none: researched by the tutor"), any schedule, and the
  references you used (Way B: those that checked the gaps, or "none: the map follows the plan"). In their
  words where they gave them.
- `map.md`: Where we are (In progress and Waiting: none yet; Rhythm: none; Suggested next: the first topic
  whose Needs are met, starting with a one-question diagnostic), the dimensions, one table per module.
- `learner.md`: their answer to question 4, dated; question 3 under strengths.
- `topics/_template.md`, `log.md`, `how-to-use.md`: copied as they are, with the subject's name filled in.
- `source-plan.md`: only for a pasted plan (step 2B).

Fill every `<placeholder>` or delete its line, except in `topics/_template.md`, which stays a template. If a
write fails, say which file and stop: never say it's set up when it isn't.

## 5. Hand over, and start

In at most 4 lines: the folder you made, how many modules and topics, and the one thing to remember: "Say
*continue* any time; I save as we go." Then **start teaching at once** with `tutor:learn`, from its step 2
with the suggested topic (its first move is the diagnostic question). If they said they want to start
somewhere else, or not now, do that instead.
