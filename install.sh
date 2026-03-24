#!/bin/bash
# A-Team Agents Installer for Claude Code

set -e

AGENTS_DIR="$HOME/.claude/agents"
SKILLS_DIR="$HOME/.claude/skills/a-team"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing A-Team Agents for Claude Code..."

# Create directories
mkdir -p "$AGENTS_DIR"
mkdir -p "$SKILLS_DIR"

# Copy agent files
cp "$SCRIPT_DIR/agents/a-team.md" "$AGENTS_DIR/"
cp "$SCRIPT_DIR/agents/a-team-frontend.md" "$AGENTS_DIR/"
cp "$SCRIPT_DIR/agents/a-team-backend.md" "$AGENTS_DIR/"
cp "$SCRIPT_DIR/agents/a-team-qa.md" "$AGENTS_DIR/"

echo "  Agents installed to $AGENTS_DIR"

# Copy skill file
cp "$SCRIPT_DIR/skills/a-team/SKILL.md" "$SKILLS_DIR/"

echo "  Slash command installed to $SKILLS_DIR"

echo ""
echo "Done. Open any project in Claude Code and say 'bring in the a-team'"
