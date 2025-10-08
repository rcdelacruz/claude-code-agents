#!/bin/bash

# MCP Sub-Agents Installation Script
# Installs all 6 enterprise web development subagents for Claude Code

set -e

AGENTS_DIR="$HOME/.claude/agents"

echo "🚀 Installing MCP Sub-Agents for Claude Code..."
echo ""

# Create agents directory
mkdir -p "$AGENTS_DIR"

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy all agent files
echo "📦 Copying subagent files..."
cp "$SCRIPT_DIR/agents/"*.md "$AGENTS_DIR/"

echo ""
echo "✅ Installation complete!"
echo ""
echo "📚 Installed subagents:"
echo "   • architect.md - Architecture & Design Expert"
echo "   • cloud-infra.md - Cloud Infrastructure Expert"
echo "   • onprem-infra.md - On-Premises Infrastructure Expert"
echo "   • security.md - Security & Compliance Expert"
echo "   • devops-cicd.md - DevOps & CI/CD Expert"
echo "   • database.md - Database Expert"
echo ""
echo "💡 Usage:"
echo "   Use architect to design system architecture"
echo "   Use cloud-infra to deploy to AWS/Azure/GCP"
echo "   Use security to review code for vulnerabilities"
echo ""
echo "📖 For more information, see README.md"
