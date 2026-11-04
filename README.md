# tutor

A Claude Code plugin that turns Claude into a tutor who is always there. You say "continue"; it knows where
you are in every area of the subject and how you learn, and it teaches you until you understand.

- **Questions before answers.** It asks you to predict, then explains, then checks. Wrong answers are the
  point: that's where the gaps show. Say "pass" to get the answer straight away.
- **Prerequisites first.** Every topic lists what it needs. If a foundation is shaky, it stops, covers it, and
  comes back.
- **Levels on evidence, not on talk.** L1 you can explain it · L2 you know how it works and breaks · L3 you
  did it for real · L4 you defended it under an expert's hard questions. Discussing a topic doesn't raise it.
- **Your path, not a syllabus.** Start anywhere, wander off, come back in a month. It parks threads, never
  calls a detour "drift", and picks up exactly where you stopped.
- **Nothing is lost.** Every reply that teaches something writes it to your notes first, in the same turn.
  You never have to say "save". Ask "what did we cover on X?" and it answers from your notes, not from memory.
- **It comes back.** Spaced reviews (+3, +10, +30, +90 days) so you keep what you learn.

## Before you start

- [Claude Code](https://docs.claude.com/en/docs/claude-code/overview), installed and logged in. The tutor
  uses your normal Claude Code plan or API usage; it adds no cost of its own.
- macOS, Linux, or Windows with Git Bash (which Claude Code on Windows already needs). The session-start hook
  is a small `sh` script using `grep`, `sed` and `awk`.

## Install

Inside Claude Code (type these at the prompt):

```
/plugin marketplace add nikhilno1/ai-tutor
/plugin install tutor@tutor
```

The first line adds this repo as a plugin source (a "marketplace" named `tutor`); the second installs the
plugin `tutor` from it. Restart Claude Code, then check it's there: `/plugin` lists **tutor** as installed,
and typing `/tutor:` shows its three skills (`learn`, `new-subject`, `challenge`).

To try it without installing, clone it and point Claude Code at the folder:

```
git clone https://github.com/nikhilno1/ai-tutor.git
claude --plugin-dir ./ai-tutor
```

**Update:** `/plugin marketplace update tutor`, then restart. **Remove:** `/plugin uninstall tutor@tutor`.
Removing the plugin leaves your `learning/` notes untouched.

## Start

Open a terminal in the folder where you want your notes (any folder; an Obsidian vault works well), run
`claude`, and say:

> I want to learn <subject>.

It asks six short questions (why, the standard you're aiming for, what you already know, how you like to
learn, what "doing it" means here, sources you have), drafts a map of modules and topics with their
prerequisites, checks it with you, and writes it down. From then on, say **"continue"**.

| Say | It does |
|---|---|
| "continue" | picks up where you stopped, or offers a parked thread or a review that's due |
| "teach me <anything>", or just ask | finds the topic, checks the basics under it, teaches toward your next level |
| "switch to <topic>" | parks the current one with where you stopped, starts the new one |
| "what did we cover on <topic>?" | shows what it taught, from your notes, and which file |
| "review" / "challenge me on <topic>" | a quick spaced review, or an expert role-play for Level 4 |
| "where am I?" | your level across every area |

## Your files

Everything is plain Markdown in `learning/<subject>/`, yours to read, edit, back up or put in git:

```
learning/<subject>/
  charter.md     how you want to be taught: goal, standard, levels, stages (yours to edit)
  map.md         where you are: Now, Parked, Suggested next; every topic's level, evidence, review date
  learner.md     how you learn: preferences, what works, strengths, mistakes that recur
  topics/        one note per topic: everything taught, your words, corrections, practice, evidence
  log.md         one line per topic per conversation
  how-to-use.md  this, on one page
```

At the start of each session a small hook reads the maps (it never writes) and tells Claude where you are in
each subject, so "continue" works in a fresh conversation. One topic per conversation keeps the tutor sharp;
the files carry everything between them.

## What's inside

| Part | What it does |
|---|---|
| `skills/learn` | the tutor: resume, prerequisites, teaching, look-ups, saving every reply |
| `skills/new-subject` | the interview, the map, the files (templates in `templates/`) |
| `skills/challenge` | spaced reviews and Level 4 challenges |
| `hooks/hooks.json`, `scripts/where-we-are.sh` | the session-start summary (shell, reads only) |

## Privacy

Your notes are plain files on your machine, and the plugin itself sends nothing anywhere. Like any Claude
Code session, what the tutor reads (your notes, your replies) goes to Claude to produce its answers, under
your Claude Code account's terms. The tutor searches the web to check facts that change, and says when it's
unsure.

## If something's off

| Symptom | Fix |
|---|---|
| "continue" doesn't know where you were | Start `claude` in the folder that contains `learning/`; the hook looks there only |
| `/tutor:` shows nothing | Restart Claude Code after installing; check `/plugin` lists it as enabled |
| The tutor drifts or forgets mid-conversation | Start a fresh conversation per topic; the files carry everything over |
| You want it taught differently | Edit `learning/<subject>/charter.md` or `learner.md`; it reads them every time |

## Licence

MIT. See `LICENSE`.
