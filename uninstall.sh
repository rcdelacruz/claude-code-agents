#!/bin/bash

# Claude Code Agents Uninstallation Script
# Removes all agents and workflow commands from Claude Code

set -e

AGENTS_DIR="$HOME/.claude/agents"
COMMANDS_DIR="$HOME/.claude/commands"

echo "🗑️  Claude Code Agents Uninstaller"
echo ""

# Check what will be removed
echo "📋 The following will be removed:"
echo ""

if [ -d "$AGENTS_DIR" ]; then
    agent_count=$(find "$AGENTS_DIR" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
    echo "   • Agents directory: $AGENTS_DIR"
    echo "     ($agent_count agents)"
else
    echo "   • Agents directory: Not found"
fi

if [ -d "$COMMANDS_DIR" ]; then
    command_count=$(find "$COMMANDS_DIR" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
    echo "   • Commands directory: $COMMANDS_DIR"
    echo "     ($command_count commands)"
else
    echo "   • Commands directory: Not found"
fi

echo ""
echo "⚠️  WARNING: This will permanently delete all Claude Code Agents"
echo ""
read -p "Continue with uninstallation? (y/N) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Uninstallation cancelled"
    exit 0
fi

echo ""
echo "🗑️  Removing Claude Code Agents..."

# Remove agents
if [ -d "$AGENTS_DIR" ]; then
    echo "   Removing agents..."
    rm -rf "$AGENTS_DIR"
    echo "   ✅ Agents removed"
else
    echo "   ⏭️  Agents directory not found, skipping"
fi

# Remove commands
if [ -d "$COMMANDS_DIR" ]; then
    echo "   Removing commands..."
    rm -rf "$COMMANDS_DIR"
    echo "   ✅ Commands removed"
else
    echo "   ⏭️  Commands directory not found, skipping"
fi

echo ""
echo "✅ Uninstallation complete!"
echo ""
echo "💡 To reinstall, run:"
echo "   ./install.sh"
echo ""
