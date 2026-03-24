# Agent Teams for Claude Code

Parallel agent teams for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) that dispatch specialist squads simultaneously in isolated git worktrees.

Each team has an orchestrator that reads your project context, captures your conversation as a mission briefing, dispatches specialists in parallel, merges all their work, and reports back.

## Teams

### A-Team `/a-team`
**Trigger:** "bring in the a-team"

Full-stack development team for building features, fixing bugs, and shipping code.

```
Orchestrator
├── Frontend Dev → UI components, pages, client logic
├── Backend Dev  → API routes, database, auth, server logic
└── QA           → Build validation, tests, integration checks
```

| Agent | Role | Writes Code? |
|-------|------|-------------|
| Orchestrator | Plans, delegates, merges, validates | No |
| Frontend Dev | UI, components, pages, styling, animations | Yes |
| Backend Dev | APIs, database, auth, server-side logic | Yes |
| QA | Tests, build checks, integration validation | Tests only |

### Content Team `/content-team`
**Trigger:** `/content-team`

Content creation team for writing, polishing, and optimizing written content.

```
Orchestrator
├── Writer → Blog posts, landing copy, emails, scripts
├── Editor → Grammar, clarity, voice consistency, fact-checking
└── SEO    → Keywords, meta tags, headers, linking strategy
```

| Agent | Role | Writes Content? |
|-------|------|----------------|
| Orchestrator | Plans content strategy, delegates, merges | No |
| Writer | Creates original content matched to brand voice | Yes |
| Editor | Polishes to publication quality | Edits only |
| SEO | Optimizes for search visibility | Metadata only |

### DevOps Team `/devops-team`
**Trigger:** `/devops-team`

Infrastructure team for configuration, deployment, and monitoring.

```
Orchestrator
├── Infra   → Configuration, environment setup, security
├── Deploy  → CI/CD pipelines, build optimization, releases
└── Monitor → Health checks, alerts, logging, error tracking
```

| Agent | Role | Writes Code? |
|-------|------|-------------|
| Orchestrator | Plans ops work, delegates, merges | No |
| Infra | Configuration, env vars, security hardening | Config files |
| Deploy | CI/CD pipelines, build scripts, deployment | Pipeline files |
| Monitor | Health checks, logging, alerting | Observability code |

## How It Works

1. Open a project in Claude Code
2. Discuss what you need done
3. Invoke a team: say "bring in the a-team", type `/content-team`, or `/devops-team`
4. The orchestrator:
   - Reads your project's config files, structure, and documentation
   - Captures your conversation as a mission briefing
   - Creates 3 isolated git worktrees on separate branches
   - Dispatches all 3 specialists simultaneously
   - Merges all branches back (resolving conflicts)
   - Runs post-merge validation
   - Cleans up worktrees and branches
   - Reports results

## Stack Agnostic

All agents detect your project's stack from its config files and existing code. They work with any language, framework, or toolchain.

## Install

### Quick Install (all teams)

```bash
git clone https://github.com/Isaac-Walden21/a-team-agents.git
cd a-team-agents
bash install.sh
```

### Manual Install

```bash
# Copy all agents
cp a-team-agents/agents/*.md ~/.claude/agents/

# Copy slash commands (optional)
cp -r a-team-agents/skills/* ~/.claude/skills/
```

### Install a Single Team

```bash
# A-Team only
cp a-team-agents/agents/a-team*.md ~/.claude/agents/

# Content Team only
cp a-team-agents/agents/content-team*.md ~/.claude/agents/

# DevOps Team only
cp a-team-agents/agents/devops-team*.md ~/.claude/agents/
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI
- A git repository (worktrees require git)
- Claude API access with Opus model

## Customization

### Change the Model

Edit the `model:` field in each agent's frontmatter:

```yaml
model: opus    # Claude Opus 4.6 (default — most capable)
model: sonnet  # Claude Sonnet 4.6 (faster, cheaper)
```

### Add Your Conventions

Fork the repo and add your team's conventions to each agent's system prompt — preferred frameworks, commit message format, testing patterns, style guides, etc.

### Modify Agent Tools

Edit the `tools:` list in each agent's frontmatter to add or remove tool access.

## File Structure

```
a-team-agents/
├── agents/
│   ├── a-team.md                # A-Team Orchestrator
│   ├── a-team-frontend.md       # A-Team Frontend Dev
│   ├── a-team-backend.md        # A-Team Backend Dev
│   ├── a-team-qa.md             # A-Team QA
│   ├── content-team.md          # Content Team Orchestrator
│   ├── content-team-writer.md   # Content Team Writer
│   ├── content-team-editor.md   # Content Team Editor
│   ├── content-team-seo.md      # Content Team SEO
│   ├── devops-team.md           # DevOps Team Orchestrator
│   ├── devops-team-infra.md     # DevOps Team Infra
│   ├── devops-team-deploy.md    # DevOps Team Deploy
│   └── devops-team-monitor.md   # DevOps Team Monitor
├── skills/
│   ├── a-team/
│   │   └── SKILL.md             # /a-team slash command
│   ├── content-team/
│   │   └── SKILL.md             # /content-team slash command
│   └── devops-team/
│       └── SKILL.md             # /devops-team slash command
├── install.sh
├── LICENSE
└── README.md
```

## License

MIT
