---
name: challenge
description: Spaced reviews and Level 4 challenges for a subject studied with the tutor. Use when the user says "review", "quiz me", "what's due", "challenge me on <topic>", or a topic is at L3 and they want L4.
---

# Review and challenge

Read the subject's `map.md`, `charter.md` (its standard: who the learner wants to hold their own with) and
`learner.md` (strengths, and recurring mistakes worth probing) under `learning/<subject>/`, and the topic's
note, with its `## Sources`.

## A review (minutes)

Take the map's oldest row with Review on or before today, or the one they name. Several due: one mixed
scenario can review several topics at once. Ask one question at the topic's current level, no notes. They
answer first; no hints.
- **Pass:** move Review out (+10, then +30, then +90 days on successive passes).
- **Fail:** drop the level by one, set Review +3 days, name the gap, and offer to re-teach it (`tutor:learn`).
- A topic marked `taught` (no level yet): a solid answer earns L1 or L2 with "review" as evidence.

## A Level 4 challenge

1. Pick the role from the charter's standard that tests the topic hardest (by default: a sceptical senior
   practitioner, a researcher looking for the hole, a decision-maker asking about cost and risk, a team asking
   how exactly to do it).
2. Set a concrete scenario in 3–5 lines, with a real constraint. Use what the learner has built or done when
   it fits.
3. They design or answer first. You don't hint. Facts you push back with come from the note's sources, or a
   fresh search; never challenge a correct answer with an outdated fact.
4. Push back in character, 2–4 rounds, one hard question at a time: a case that breaks their answer, a
   trade-off they skipped, a number they haven't got, a claim they accepted without evidence. Stay realistic.
5. Step out of character and grade four things, 0–2 each: **mechanism** (real understanding, not buzzwords),
   **failure modes** (what goes wrong and why), **design** (an answer that would hold, with its trade-offs),
   **under pressure** (held, or changed their mind for good reasons). Give the score out of 8, the strongest
   point, the two gaps, and a tightened version of their answer in their own terms.

Offer a challenge only on a topic whose Target is L4; on a lower target, say it's beyond what they asked for
and offer it anyway if they want it.

**7–8/8:** the topic reaches L4 (needs L3 first, unless the charter calls it a design-only topic). Less: the
level stays; the gaps go in the note's `## Open questions`, and offer to teach the weakest.

## Record it, in the same turn

Before you send the grade or the review result (the chat can be reset at any moment): the map row (Level,
Evidence such as `L4 2026-12-01 defended vs <role>, 7/8`, Review), the note's `## Evidence`, a line in
`log.md`, the topic's line under "In progress" if what's next for it changed, and `learner.md` if a gap
recurs across topics. Re-read every file right before editing it.

Don't soften a challenge to be kind; be fair and specific. End with one line saying what to do or say next.
