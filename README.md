# AI tutor for Claude Code

A Claude Code plugin that turns Claude into a patient, rigorous tutor for any subject. Tell it what you want
to learn, or hand it the study plan you already have. It agrees a map of topics with you, researches each
topic before teaching it, teaches one idea at a time, and saves everything to plain Markdown files as it goes.
Come back tomorrow or next month, say **"continue"**, and it picks up exactly where you stopped.

## Install

You need [Claude Code](https://code.claude.com/docs/en/overview), installed and logged in. Inside Claude Code,
type:

```
/plugin marketplace add nikhilno1/ai-tutor
/plugin install tutor@ai-tutor
```

The first line adds this repository as a plugin source (a "marketplace" called `ai-tutor`); the second
installs the plugin `tutor` from it. **Restart Claude Code.** To check: `/plugin` lists **tutor** as
installed, and typing `/tutor:` shows its three skills, `learn`, `new-subject` and `challenge`. You never need
to type those: plain sentences like the ones below are enough.

**Update:** `/plugin marketplace update ai-tutor`, then restart. **Remove:** `/plugin uninstall tutor@ai-tutor`.
Removing the plugin leaves your notes untouched.

**Try it without installing:** `git clone https://github.com/nikhilno1/ai-tutor.git`, then
`claude --plugin-dir ./ai-tutor`.

## Your first session

1. **Make a folder for your notes** (any folder; an [Obsidian](https://obsidian.md) vault works well) and
   open a terminal there. Your notes will live in `learning/` inside it.
2. **Start Claude Code so it can save notes without asking each time:**
   ```
   claude --permission-mode acceptEdits
   ```
   Or start plain `claude` and, the first time it asks to edit a file, allow edits for the session. The tutor
   saves on almost every reply, so per-edit prompts get tedious fast. It also asks to **search the web and
   fetch pages**; allow both for the session: that is how it teaches from current sources.
3. **Say what you want to learn**, in one of the two ways below.
4. **Next time:** open a terminal in the **same folder**, start `claude`, and say **"continue"**.

## Two ways to start

**1. From a topic: "Teach me X."**

> Teach me how databases handle transactions.

1. It asks six short questions in one message: why you're learning it; the standard you're aiming for and how
   deep you want to go; what you already know; how you like to learn (including broad first or one topic at a
   time); what "doing it" means for you; any book or course you want used. Answer briefly, or say **"just start"** and it uses sensible defaults.
2. It researches how the subject is taught today (syllabi, courses, standard textbooks) and drafts a map:
   modules, topics, the prerequisites between them, and how deep to go on each. A narrow topic gets a handful
   of topics; a whole field gets a full curriculum.
3. **You review the draft.** Say what to change, or **"yes"**. Nothing is written until you approve.
4. It writes your files and starts teaching the first topic straight away.

**2. From your own plan: "Teach me from this."**

> Teach me from my plan in notes/ml-study-plan.md

Point it at a file, a folder or a link, or paste the plan into the chat: a syllabus, a course outline, a book's
contents, your own list.

1. It reads the whole plan, then asks only what the plan doesn't already answer.
2. It builds the map **from your plan**: your sections, your order, your wording. It adds the prerequisites
   between topics and splits an item only if it's too big for one sitting.
3. It lists any gaps it found (a prerequisite the plan assumes, an area your goal needs) as numbered
   suggestions. **None are added unless you accept them.**
4. You approve; it writes your files and starts teaching. If the plan has dates, it records them and tells you
   where you stand against them when you ask "where am I?". Your plan file is never edited.

## What it looks like

From a real first session ("Teach me how DNS works", then "just start"), shortened:

> **Draft plan: DNS.** One module, 8 topics: "how DNS works" is one concept, not a whole field. I checked the
> order against several current DNS courses; they agree: name tree, lookup path, records, caching, security.
>
> | ID | Topic | Needs |
> |---|---|---|
> | 1.1 | Names vs. addresses: why DNS exists, and the name tree | |
> | 1.2 | How a lookup travels: device → resolver → root → `.com` → the domain's name server | 1.1 |
> | … | … | … |
> | 1.7 | Troubleshooting: NXDOMAIN, SERVFAIL, stale answers, broken delegation | 1.5, 1.6 |
>
> **Shall I set this up? Say *yes*, or tell me what to change.**

After "yes", it writes the files and asks one diagnostic question to find where to start. Each lesson after
that begins by saying what it's teaching from ("Teaching from: *the sources it read*, checked today") and
ends with one line telling you what to say next.

## Then, just say "continue"

| Say | It does |
|---|---|
| "continue" | picks up where you stopped; with several topics on the go, lists them and starts the best one |
| "continue *topic*" | goes back to that topic, exactly where it stopped |
| "teach me *anything*", or just ask a question | finds the topic, checks the basics under it, teaches toward your next level |
| "switch to *topic*" | saves exactly where you are in this one, starts the other |
| "alternate between *A* and *B*" / "finish *A*, then *B*" | sets a rhythm; it suggests the next topic to match |
| "just the gist of *topic*" / "go deep on *topic*" | changes how far it takes that topic, or a whole module |
| "go broad first" / "go topic by topic" | switches between a quick pass over everything then deeper passes, and each topic to its target in turn |
| "pass" | skips the question: it gives you the answer and moves on |
| "what did we cover on *topic*?" | shows what it taught, from your notes, and which file it's in |
| "review" | one quick question on a topic that's due for review |
| "challenge me on *topic*" | an expert role-play that pushes on your answer (Level 4) |
| "where am I?" | which pass you're on, how many topics have reached your target, and every topic in progress |
| "help" | a one-page summary and what to do right now |

Every reply ends with one line telling you what to say next, so there's nothing to memorise.

## How it teaches

- **Taught from current sources, not from memory.** A model's knowledge stops months before today. So before
  the first lesson on each topic, the tutor searches the web, reads the best current sources (official docs,
  standards, the current textbook, recognised experts) and teaches from them. Each topic's note lists its
  sources with the date they were checked; they're re-checked after 30 days. A fact it can't source is marked
  as such. This adds about a minute at the start of each topic.
- **Broad first, then deeper.** By default it learns the subject in passes: first every topic to level 1
  (short lessons: what it is, why it matters, an example), so you see the whole map early and every later
  detail has somewhere to attach; then level 2 where your targets ask for it; then practice projects that span
  several topics; then expert challenges. Coming back to a topic on the next pass doubles as a review. Prefer
  to take each topic all the way before the next? Say "go topic by topic". Want one topic deep right now? "Go
  deep on *topic*" works in either mode.
- **As deep as you want, topic by topic.** Every topic has a target: **overview** (explain it simply),
  **working knowledge** (how it works and where it breaks), **practitioner** (do it for real) or **expert**
  (defend it under hard questions). You set the overall depth when you start, adjust any module in the draft,
  and change any topic later. The tutor stops at the target and offers to go further.
- **Questions before answers.** It asks you to predict, then explains, then checks. Wrong answers are the
  point: that's where the gaps show.
- **One idea at a time, explained fully.** Every term defined the first time it appears, every rule with its
  reason, every formula walked through with a real example.
- **Prerequisites first.** If a foundation is shaky, it says so, covers it, and comes back.
- **Levels on evidence, not on talk.** The four depths are four levels: L1 you explained it back · L2 you
  answered how it works and where it breaks · L3 you showed a real result · L4 you defended it under an
  expert's hard questions. Saying "I know this" doesn't raise a level.
- **Spaced reviews** (+3, +10, +30, +90 days) so you keep what you learn.
- **Nothing is lost.** Every reply that teaches something is written to your notes in the same turn, before
  the reply is sent. You never have to say "save".

## Several topics at once

Learn as many topics as you like side by side, in one subject or several: one after the other, alternating,
or switching whenever you feel like it. Every topic you've started has its own line in the map saying exactly
where it stopped, so nothing is ever "parked" or "unfinished". It's simply in progress.

- **"Continue"** with one topic on the go resumes it. With several, it lists them (most recent first, with
  where each stopped), starts the one that fits best, and tells you how to pick another.
- **Set a rhythm** if you want one: "alternate between transactions and indexes", "finish SQL joins, then
  window functions". It's saved, and at the end of each session it suggests the next topic to match. Whatever
  you ask for wins.
- **Two conversations at once** (two terminals, same folder) are fine: each one writes only its own topic's
  line, row and note.

One topic per conversation keeps the tutor sharp: when a topic reaches its target or a chat gets long, start
a fresh conversation (`/clear`) and say "continue". The files carry everything over.

## Your files

Everything is plain Markdown in `learning/<subject>/` inside the folder you started in. Read it, edit it, back
it up, put it in git.

```
learning/<subject>/
  charter.md       how you want to be taught: goal, standard, depth, levels, sources (yours to edit)
  map.md           where you are: approach and pass, topics in progress, rhythm, suggested next;
                   every topic's target, level, evidence and review date
  learner.md       how you learn: preferences, what works, strengths, mistakes that recur
  topics/          one note per topic: everything taught, its sources, your own words, corrections, evidence
  log.md           one line per topic per session
  how-to-use.md    a one-page guide
  source-plan.md   only if you pasted a plan into the chat: kept word for word
```

When a session starts, a small script reads your maps (it never writes) and tells Claude which topics are in
progress, how many reviews are due and how far the current pass has got, so "continue" works in a brand-new conversation.

## Requirements and costs

- **Claude Code** on macOS, Linux or Windows. The session-start script is a few lines of `sh`; on Windows it
  runs through Git Bash. Without it, everything still works: the tutor reads your map when you say
  "continue".
- **Web search and web fetch** in Claude Code. Not every provider offers web search. Without it, the tutor
  says so at the start of each topic, teaches from the model's own knowledge, and marks the topic's sources
  "not checked".
- **Cost:** none beyond your Claude Code plan or API usage. Research at the start of each topic uses a little
  more of it than plain chat.

## Privacy

Your notes are plain files on your machine, and the plugin sends nothing anywhere itself. As with any Claude
Code session, what the tutor reads (your notes, your replies, your plan, the pages it researches) goes to
Claude to produce its answers, under your Claude Code account's terms. Web pages are treated as material to
learn from, never as instructions.

## If something's off

| Symptom | Fix |
|---|---|
| "continue" doesn't know where you were | Start `claude` in the folder that contains `learning/`; it only looks there |
| `/tutor:` shows nothing | Restart Claude Code after installing; check `/plugin` lists tutor as enabled |
| It asks permission for every note it saves | Start with `claude --permission-mode acceptEdits`, or allow edits for the session when asked |
| A topic's sources say "not checked" | Web search wasn't available or failed; allow web search and fetch, then say "re-research this topic" |
| It can't read your plan (a login page, a scanned PDF) | Paste the plan's text into the chat; it saves a copy as `source-plan.md` |
| It goes deeper than you want, or not deep enough | "just the gist of *topic*", "go deep on *topic*", or edit the Target column in `map.md` |
| It drifts or forgets mid-conversation | Start a fresh conversation (`/clear`) and say "continue"; the files carry everything over |
| You want it to teach differently | Tell it ("shorter messages", "more analogies"), or edit `charter.md` or `learner.md`; it reads them every session |

## What's inside

| Part | What it does |
|---|---|
| `skills/new-subject` | the two ways in: the interview, research or your plan, the map you approve, the files (templates in `templates/`) |
| `skills/learn` | the tutor: resuming, prerequisites, research, teaching to your target, look-ups, saving every reply |
| `skills/challenge` | spaced reviews and Level 4 challenges |
| `hooks/hooks.json`, `scripts/where-we-are.sh` | the session-start summary (a read-only shell script) |

Changes are listed in [CHANGELOG.md](CHANGELOG.md). Issues and suggestions:
[github.com/nikhilno1/ai-tutor/issues](https://github.com/nikhilno1/ai-tutor/issues).

## Licence

MIT. See [LICENSE](LICENSE).
