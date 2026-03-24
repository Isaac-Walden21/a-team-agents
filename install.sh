#!/bin/bash
# Agent Teams Installer for Claude Code

set -e

AGENTS_DIR="$HOME/.claude/agents"
SKILLS_DIR="$HOME/.claude/skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Agent Teams for Claude Code..."
echo ""

# Create directories
mkdir -p "$AGENTS_DIR"

# Copy all agent files
cp "$SCRIPT_DIR"/agents/*.md "$AGENTS_DIR/"
echo "  Agents installed to $AGENTS_DIR"

# Copy all skill files
for team_dir in "$SCRIPT_DIR"/skills/*/; do
  team_name=$(basename "$team_dir")
  mkdir -p "$SKILLS_DIR/$team_name"
  cp "$team_dir"SKILL.md "$SKILLS_DIR/$team_name/"
done
echo "  Slash commands installed to $SKILLS_DIR"

echo ""
echo "Installed teams:"
echo "  /a-team        — Frontend Dev + Backend Dev + QA"
echo "  /content-team  — Writer + Editor + SEO"
echo "  /devops-team   — Infra + Deploy + Monitor"
echo ""
echo "Open any project in Claude Code and invoke a team to get started."
