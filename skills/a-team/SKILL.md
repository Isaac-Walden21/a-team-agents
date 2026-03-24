---
name: a-team
description: Dispatch the A-Team — a parallel squad of Frontend Dev, Backend Dev, and QA agents in isolated worktrees. Say "bring in the a-team" or use /a-team to activate.
user_invocable: true
---

# A-Team Dispatch

You have been asked to bring in the A-Team. Dispatch the `a-team` agent immediately.

## What To Do

1. **Capture context**: Synthesize everything discussed in this conversation so far into a clear mission objective. The user has been talking about what they want built or fixed — that IS the mission.

2. **Dispatch the orchestrator**: Use the Agent tool to launch the `a-team` agent with `subagent_type: "a-team"`. Pass it a prompt that includes:
   - The current working directory
   - A summary of the mission objective from conversation context
   - Any specific files, features, or requirements the user mentioned

3. **Let the orchestrator handle the rest**: The A-Team orchestrator will read project context, write a mission briefing, create worktrees, dispatch Frontend Dev + Backend Dev + QA in parallel, merge all work, validate the build, and report back.

## Dispatch Template

```
Mission objective: [synthesized from conversation]
Working directory: [current project path]
Key requirements:
- [requirement 1 from conversation]
- [requirement 2 from conversation]
Files discussed: [any specific files mentioned]
```

Do NOT ask additional questions. The user said "bring in the a-team" — that means go.
