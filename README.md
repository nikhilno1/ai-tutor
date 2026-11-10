# AI tutor for Claude Code

A Claude Code plugin that turns Claude into a patient, rigorous tutor for any subject. Tell it what you want
to learn, or hand it the study plan you already have. It agrees a map of topics with you, teaches one idea at
a time, and saves everything to plain Markdown files as it goes. Come back tomorrow or next month, say
**"continue"**, and it picks up exactly where you stopped.

## Two ways to start

**1. From a topic: "Teach me X."**

> Teach me how databases handle transactions.

1. It asks six short questions in one message: why you're learning it, the standard you're aiming for, what
   you already know, how you like to learn, what "doing it" means for you, and any book or course you want
   used. Answer briefly, or say **"just start"** and it uses sensible defaults.
2. It researches how the subject is taught today (syllabi, courses, standard textbooks) and drafts a map:
   modules, topics, and the prerequisites between them, sized to the subject. A narrow topic gets a handful
   of topics; a whole field gets a full curriculum.
3. **You review the draft.** Say what to change, or **"yes"**. Nothing is written until you approve.
4. It writes your files and starts teaching the first topic straight away.

**2. From your own plan: "Teach me from this."**

> Teach me from my plan in notes/ml-study-plan.md

Point it at a file, a folder, a link, or paste the plan into the chat: a syllabus, a course outline, a
book's contents, your own list.

1. It reads the whole plan, then asks only what the plan doesn't already answer.
2. It builds the map **from your plan**: your sections, your order, your wording. It adds the prerequisites
   between topics and splits an item only if it's too big for one sitting.
3. It lists any gaps it found (a prerequisite the plan assumes, an area your goal needs) as numbered
   suggestions. **None are added unless you accept them.**
4. You approve, it writes your files and starts teaching. If the plan has dates, it records them and tells
   you where you stand against them when you ask "where am I?". Your plan file is never edited.

## Then, just say "continue"

| Say | It does |
|---|---|
| "continue" | picks up where you stopped, or offers a parked thread or a review that's due |
| "teach me <anything>", or just ask a question | finds the topic, checks the basics under it, teaches toward your next level |
| "switch to <topic>" | saves where you are, parks it, starts the new one |
| "what did we cover on <topic>?" | shows what it taught, from your notes, and which file it's in |
| "review" | one quick question on a topic that's due for review |
| "challenge me on <topic>" | an expert role-play that pushes on your answer (Level 4) |
| "where am I?" | your level across every area |
| "help" | a one-page summary and what to do right now |

Every reply ends with one line telling you what to say next, so there's nothing to memorise.

## How it teaches

- **Questions before answers.** It asks you to predict, then explains, then checks. Wrong answers are the
  point: that's where the gaps show. Say **"pass"** to get the answer straight away.
- **One idea at a time, explained fully.** Every term defined the first time it appears, every rule with its
  reason, every formula walked through with a real example.
- **Prerequisites first.** If a foundation is shaky, it says so, covers it, and comes back.
- **Levels on evidence, not on talk.** L1 you can explain it · L2 you know how it works and where it breaks ·
  L3 you did it for real · L4 you defended it under an expert's hard questions. Saying "I know this" doesn't
  raise a level.
- **Your path, not a syllabus.** Start anywhere, wander off, come back in a month. It never calls a detour
  "drift".
- **Spaced reviews** (+3, +10, +30, +90 days) so you keep what you learn.
- **Nothing is lost.** Every reply that teaches something is written to your notes in the same turn, before
  the reply is sent. You never have to say "save".

## Install

You need [Claude Code](https://docs.claude.com/en/docs/claude-code/overview), installed and logged in, on
macOS, Linux, or Windows (with Git Bash, which Claude Code on Windows already uses). The tutor runs on your
normal Claude Code plan or API usage; it costs nothing extra.

Inside Claude Code, type:

```
/plugin marketplace add nikhilno1/ai-tutor
/plugin install tutor@ai-tutor
```

The first line adds this repository as a plugin source (a "marketplace" called `ai-tutor`); the second
installs the plugin `tutor` from it. **Restart Claude Code.** To check: `/plugin` lists **tutor** as
installed, and typing `/tutor:` shows its three skills, `learn`, `new-subject` and `challenge`. You don't
need to type those yourself: plain sentences like the ones above are enough.

**Update:** `/plugin marketplace update ai-tutor`, then restart. **Remove:** `/plugin uninstall tutor@ai-tutor`.
Removing the plugin leaves your notes untouched.

**Try it without installing:**

```
git clone https://github.com/nikhilno1/ai-tutor.git
claude --plugin-dir ./ai-tutor
```

## First session, step by step

1. Make a folder for your notes (any folder; an [Obsidian](https://obsidian.md) vault works well) and open a
   terminal there.
2. Start Claude Code so it can save notes without asking each time:
   ```
   claude --permission-mode acceptEdits
   ```
   Or start plain `claude` and, the first time it asks to edit a file, choose to allow edits for the session.
   The tutor writes your notes on almost every reply, so per-edit prompts get tedious fast. It also asks to
   search the web while building a map; allow that too.
3. Say "Teach me <topic>" or "Teach me from <your plan>".
4. Next time: open a terminal in the **same folder**, start `claude`, and say **"continue"**.

## Your files

Everything is plain Markdown in `learning/<subject>/` inside the folder you started in. Read it, edit it, back
it up, put it in git.

```
learning/<subject>/
  charter.md       how you want to be taught: goal, standard, levels, sources (yours to edit)
  map.md           where you are: Now, Parked, Suggested next; every topic's level, evidence, review date
  learner.md       how you learn: preferences, what works, strengths, mistakes that recur
  topics/          one note per topic: everything taught, your own words, corrections, practice, evidence
  log.md           one line per topic per session
  how-to-use.md    a one-page guide
  source-plan.md   only if you pasted a plan into the chat: kept word for word
```

When a session starts, a small script reads your maps (it never writes) and tells Claude where you are in each
subject, so "continue" works in a brand-new conversation. One topic per conversation keeps the tutor sharp;
the files carry everything between them. You can study several subjects side by side.

## Privacy

Your notes are plain files on your machine, and the plugin sends nothing anywhere itself. As with any Claude
Code session, what the tutor reads (your notes, your replies, your plan) goes to Claude to produce its answers,
under your Claude Code account's terms. It searches the web to build maps and to check facts that change, and
says when it's unsure.

## If something's off

| Symptom | Fix |
|---|---|
| "continue" doesn't know where you were | Start `claude` in the folder that contains `learning/`; it only looks there |
| `/tutor:` shows nothing | Restart Claude Code after installing; check `/plugin` lists tutor as enabled |
| It asks permission for every note it saves | Start with `claude --permission-mode acceptEdits`, or allow edits for the session when asked |
| It can't read your plan (a login page, a scanned PDF) | Paste the plan's text into the chat; it saves a copy as `source-plan.md` |
| It drifts or forgets mid-conversation | Start a fresh conversation (`/clear`) and say "continue"; the files carry everything over |
| You want it to teach differently | Tell it ("shorter messages", "more analogies"), or edit `charter.md` or `learner.md`; it reads them every session |

## What's inside

| Part | What it does |
|---|---|
| `skills/new-subject` | the two ways in: the interview, research or your plan, the map you approve, the files (templates in `templates/`) |
| `skills/learn` | the tutor: resuming, prerequisites, teaching, look-ups, saving every reply |
| `skills/challenge` | spaced reviews and Level 4 challenges |
| `hooks/hooks.json`, `scripts/where-we-are.sh` | the session-start summary (a read-only shell script) |

Changes are listed in [CHANGELOG.md](CHANGELOG.md).

## Licence

MIT. See [LICENSE](LICENSE).
