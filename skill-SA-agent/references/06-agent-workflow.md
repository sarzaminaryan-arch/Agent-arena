# 06 — Agent workflow, project config & release procedure

Sources: `zebbern/skills` (claude-code-project: CLAUDE.md rules; goal-creator: `/goal` template,
gold patterns, anti-patterns), `zebbern/claude-code-guide` (skills/agents layout, plan mode,
worktrees), `WordPress/agent-skills/docs` (principles: small composable skills, short SKILL.md,
deterministic scripts, eval scenarios), `repo-audit` (secret scanning).

## A. Project configuration (for Claude Code / Cursor / Codex)

```
S.A.1/
├── CLAUDE.md                 # ≤200 lines: commands, stack, rules; imports @AGENTS.md
├── AGENTS.md                 # shared agent conventions (hard rules incl. GitHub-only delivery)
├── .claude/skills/skill-SA-agent -> ../../skill-SA-agent   (or copy)
├── .claude/agents/*.md       # role cards from references/07-agents-roster.md
└── .claude/rules/            # path-scoped rules, e.g. wp-content/themes/**: PHP standards
```
Template: `assets/CLAUDE.md.template`. Keep personal prefs in `CLAUDE.local.md` (gitignored).
Install skill elsewhere: copy `skill-SA-agent/` into `~/.claude/skills/` or run
`npx skills add sarzaminaryan-arch/S.A.1 --skill skill-SA-agent` (if the repo is public).

## B. Working loop (plan → build → verify → release)

1. **Plan mode first** for anything touching > 3 files: list files, risks, verification.
2. **Small commits** with conventional messages: `feat(child): …`, `fix(parent): …`,
   `docs(model): …`, `chore(release): …`.
3. **Verify** with deterministic checks before claiming done: `php -l`, grep for unescaped
   `echo $`, grep for missing text domain, `git diff --stat` scoped to intended files.
4. **Report** using the SKILL.md verification checklist, findings by severity, links to commits.
5. **Isolation**: for risky refactors use a git worktree/branch, merge via PR.

## C. `/goal` directive (goal-creator master template)

```
## /goal: <Short Name>
**Category**: EXPLORE | DEFINE | PLAN | BUILD | VERIFY | DEPLOY | MONITOR | REFLECT
**Scope**: one line — covers / excludes
### Objective*  one observable end-state sentence
### Success Criteria*  pass/fail bullets (≥3)
### Constraints*  MUST NOT / MUST / LIMIT
### Output Specification*  exact files, formats, names
### Verification Method*  how a second agent confirms without redoing the work
### Failure Modes to Prevent  mode → prevention
```
Gold patterns: end-state first; structured output contract; constraint-first safety; second-agent
test; Given/When/Then for multi-step. Anti-patterns: vague aspiration, process-as-goal,
unverifiable criteria, kitchen-sink scope. Ready-made goals: `assets/goal-templates.md`.

## D. Release procedure (GitHub-only delivery — HARD RULE)

The active repository is `sarzaminaryan-arch/Agent-arena`; `S.A.1` is historical.
Work only on the Arena-assigned session branch. Never switch branches or push to main.

1. Bump `style.css` Version and `SA_CHILD_VERSION` together, then update CHANGELOG/readme.
2. Run offline pipeline tests and PHP lint (GitHub Actions provides PHP when unavailable locally).
3. Commit reviewed paths and push the session branch only:

```bash
SESSION_BRANCH="$(git branch --show-current)"
case "$SESSION_BRANCH" in arena/*) ;; *) echo 'Not an Arena session branch' >&2; exit 1;; esac
git push origin "$SESSION_BRANCH"
```

4. `.github/workflows/release-child-theme.yml` validates versions, PHP and credentials,
   creates the standard ZIP + SHA-256 and publishes the child-theme Release.
5. Wait for the workflow result before claiming publication. Never reuse a published version
   with different theme files. Data-only changes do not require a theme version bump.
6. Return the GitHub Release link:
   `https://github.com/sarzaminaryan-arch/Agent-arena/releases/tag/sarzaminaryan-child-vX.Y.Z`.

The owner checks “نمایش ← به‌روزرسان گیت‌هاب” and installs through WordPress Updates.
Manual ZIP/cPanel is a fallback, not required for each update. Bulk data is applied separately
through “پوشش شهرستان‌ها”; preview first and never recommend a blind overwrite.

## E. Secrets & tokens

The sandbox GitHub connection is already configured: use `git`/`gh`, not a token pasted in chat.
Never request/store GitHub passwords, PATs, OAuth tokens or 2FA codes. If authentication fails,
ask the owner to reconnect GitHub in Arena. Never print actual credential values.

WordPress uses its own **read-only** token scoped to `Agent-arena`, stored only on the WordPress
server (`wp-config.php` or the updater option). Never copy it into code, ZIPs, this repository or
chat. Reading a Release successfully is not proof the agent has WordPress admin access.
