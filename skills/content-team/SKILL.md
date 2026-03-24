---
name: content-team
description: Dispatch the Content Team — a parallel squad of Writer, Editor, and SEO agents in isolated worktrees. Use /content-team to activate.
user_invocable: true
---

# Content Team Dispatch

You have been asked to bring in the Content Team. Dispatch the `content-team` agent immediately.

## What To Do

1. **Capture context**: Synthesize everything discussed in this conversation so far into a clear content objective.

2. **Dispatch the orchestrator**: Use the Agent tool to launch the `content-team` agent with `subagent_type: "content-team"`. Pass it a prompt that includes:
   - The current working directory
   - A summary of the content objective from conversation context
   - Target audience, tone, and any specific requirements mentioned

3. **Let the orchestrator handle the rest**: The Content Team orchestrator will read project context, write a content brief, dispatch Writer + Editor + SEO in parallel, merge all work, and report back.

## Dispatch Template

```
Content objective: [synthesized from conversation]
Working directory: [current project path]
Key requirements:
- [requirement 1 from conversation]
- [requirement 2 from conversation]
Audience: [target audience if discussed]
```

Do NOT ask additional questions. The user invoked the content team — that means go.
