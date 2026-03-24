---
name: devops-team
description: Dispatch the DevOps Team — a parallel squad of Infra, Deploy, and Monitor agents in isolated worktrees. Use /devops-team to activate.
user_invocable: true
---

# DevOps Team Dispatch

You have been asked to bring in the DevOps Team. Dispatch the `devops-team` agent immediately.

## What To Do

1. **Capture context**: Synthesize everything discussed in this conversation so far into a clear infrastructure objective.

2. **Dispatch the orchestrator**: Use the Agent tool to launch the `devops-team` agent with `subagent_type: "devops-team"`. Pass it a prompt that includes:
   - The current working directory
   - A summary of the infrastructure objective from conversation context
   - Current hosting platform, CI/CD setup, and any specific requirements mentioned

3. **Let the orchestrator handle the rest**: The DevOps Team orchestrator will read project config, write an ops brief, dispatch Infra + Deploy + Monitor in parallel, merge all work, and report back.

## Dispatch Template

```
Infrastructure objective: [synthesized from conversation]
Working directory: [current project path]
Key requirements:
- [requirement 1 from conversation]
- [requirement 2 from conversation]
Platform: [hosting/CI platform if discussed]
```

Do NOT ask additional questions. The user invoked the devops team — that means go.
