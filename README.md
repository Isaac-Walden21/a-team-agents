# A-Team Agents for Claude Code

A parallel agent team for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) that dispatches Frontend Dev, Backend Dev, and QA specialists simultaneously in isolated git worktrees.

Say **"bring in the a-team"** and an orchestrator reads your project context, creates a mission briefing from your conversation, dispatches three specialist agents in parallel, merges all their work, validates the build, and reports back.

## How It Works

```
You: "I need a new user settings page with API endpoints and tests"
You: "bring in the a-team"

Orchestrator
├── Reads project context (README, config files, structure)
├── Captures your conversation as a mission briefing
├── Creates 3 isolated git worktrees
├── Dispatches in parallel:
│   ├── Frontend Dev → UI components, pages, client logic
│   ├── Backend Dev  → API routes, database, auth, server logic
│   └── QA           → Build validation, tests, integration checks
├── Merges all branches back
├── Runs post-merge validation
└── Reports results
```

## The Team

| Agent | Role | Writes Code? |
|-------|------|-------------|
| **Orchestrator** | Plans, delegates, merges, validates | No |
| **Frontend Dev** | UI, components, pages, styling, animations | Yes |
| **Backend Dev** | APIs, database, auth, server-side logic | Yes |
| **QA** | Tests, build checks, integration validation | Tests only |

## Stack Agnostic

The agents detect your project's stack from its config files and existing code. They work with any language, framework, or toolchain — React, Vue, Django, Rails, Go, Rust, whatever your project uses.

## Install

### Quick Install

```bash
# Clone the repo
git clone https://github.com/waldoshoots/a-team-agents.git

# Copy agents to your Claude Code config
cp a-team-agents/agents/*.md ~/.claude/agents/

# Done. Open any project and say "bring in the a-team"
```

### Manual Install

1. Copy the 4 files from `agents/` into `~/.claude/agents/`:
   - `a-team.md` — Orchestrator
   - `a-team-frontend.md` — Frontend Dev
   - `a-team-backend.md` — Backend Dev
   - `a-team-qa.md` — QA

2. That's it. The agents are available in every Claude Code session.

### Optional: Add the Slash Command

To trigger the team with `/a-team`:

```bash
mkdir -p ~/.claude/skills/a-team
cp a-team-agents/skills/a-team/SKILL.md ~/.claude/skills/a-team/SKILL.md
```

## Usage

1. Open a project in Claude Code
2. Discuss what you want to build or fix
3. Say **"bring in the a-team"** or type `/a-team`
4. The orchestrator handles the rest

### What Happens Under the Hood

1. **Reconnaissance** — Reads your project's config files, structure, and documentation
2. **Mission Briefing** — Writes `.claude/a-team-briefing.md` with assignments for each agent
3. **Worktree Setup** — Creates 3 isolated git worktrees on separate branches
4. **Parallel Dispatch** — All 3 agents work simultaneously in their own worktrees
5. **Merge** — Branches merged back with `--no-ff`, conflicts resolved
6. **Validation** — Post-merge build and test run
7. **Cleanup** — Worktrees and branches removed
8. **Report** — Summary of what was done, files changed, test results

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI
- A git repository (worktrees require git)
- Claude API access with Opus model

## Customization

### Change the Model

Edit the `model:` field in each agent's frontmatter:

```yaml
model: opus    # Claude Opus 4.6 (default)
model: sonnet  # Claude Sonnet 4.6 (faster, cheaper)
```

### Add Stack-Specific Instructions

Fork the repo and add your team's conventions to each agent's system prompt. For example, add your preferred CSS framework, commit message format, or testing patterns.

### Modify Agent Tools

Edit the `tools:` list in each agent's frontmatter to add or remove tool access.

## File Structure

```
a-team-agents/
├── agents/
│   ├── a-team.md              # Orchestrator
│   ├── a-team-frontend.md     # Frontend Dev
│   ├── a-team-backend.md      # Backend Dev
│   └── a-team-qa.md           # QA
├── skills/
│   └── a-team/
│       └── SKILL.md           # /a-team slash command
├── install.sh                 # Quick install script
└── README.md
```

## License

MIT
