#!/bin/bash

# Claude Code Agents Uninstallation Script
# Removes only the agents and workflow commands installed by this repository

set -e

AGENTS_DIR="$HOME/.claude/agents"
COMMANDS_DIR="$HOME/.claude/commands"
REPO_URL="https://github.com/rcdelacruz/claude-code-agents.git"

# List of agents to remove (relative paths from .claude/agents/)
AGENTS_TO_REMOVE=(
    "cross-cutting/architect.md"
    "cross-cutting/code-reviewer.md"
    "cross-cutting/database.md"
    "cross-cutting/deployment.md"
    "cross-cutting/monitoring.md"
    "cross-cutting/performance.md"
    "cross-cutting/product-manager.md"
    "cross-cutting/qa-tester.md"
    "cross-cutting/security.md"
    "cross-cutting/task-planner.md"
    "cross-cutting/tech-writer.md"
    "cross-cutting/test-planner.md"
    "javascript/backend-api.md"
    "javascript/frontend-ui.md"
    "javascript/fullstack-nextjs.md"
    "savants/savant-flutter.md"
    "savants/savant-fullstack-js.md"
    "savants/savant-java-spring.md"
    "savants/savant-react-native.md"
)

# List of commands to remove (relative paths from .claude/commands/)
COMMANDS_TO_REMOVE=(
    "workflow-deploy.md"
    "workflow-design-architecture.md"
    "workflow-design-nextjs.md"
    "workflow-implement-backend.md"
    "workflow-implement-frontend.md"
    "workflow-implement-fullstack.md"
    "workflow-qa-e2e.md"
    "workflow-review-code.md"
    "workflow-review-performance.md"
    "workflow-review-security.md"
    "workflow-write-docs.md"
)

echo "🗑️  Claude Code Agents Uninstaller"
echo ""

# Count what will be removed
found_agents=0
found_commands=0

for agent in "${AGENTS_TO_REMOVE[@]}"; do
    if [ -f "$AGENTS_DIR/$agent" ]; then
        ((found_agents++))
    fi
done

for command in "${COMMANDS_TO_REMOVE[@]}"; do
    if [ -f "$COMMANDS_DIR/$command" ]; then
        ((found_commands++))
    fi
done

echo "📋 This script will remove only the files installed by this repository:"
echo ""
echo "   • $found_agents agents (from ${#AGENTS_TO_REMOVE[@]} installed)"
echo "   • $found_commands commands (from ${#COMMANDS_TO_REMOVE[@]} installed)"
echo ""

if [ $found_agents -eq 0 ] && [ $found_commands -eq 0 ]; then
    echo "ℹ️  No files from this repository found. Nothing to remove."
    exit 0
fi

echo "⚠️  WARNING: This will permanently delete these files"
echo "   Your other custom agents and commands will be preserved"
echo ""
read -p "Continue with uninstallation? (y/N) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Uninstallation cancelled"
    exit 0
fi

echo ""
echo "🗑️  Removing Claude Code Agents files..."

# Remove agents
removed_agents=0
if [ -d "$AGENTS_DIR" ]; then
    echo "   Removing agents..."
    for agent in "${AGENTS_TO_REMOVE[@]}"; do
        if [ -f "$AGENTS_DIR/$agent" ]; then
            rm -f "$AGENTS_DIR/$agent"
            ((removed_agents++))
        fi
    done
    
    # Remove empty directories
    find "$AGENTS_DIR" -type d -empty -delete 2>/dev/null || true
    
    echo "   ✅ Removed $removed_agents agent(s)"
else
    echo "   ⏭️  Agents directory not found, skipping"
fi

# Remove commands
removed_commands=0
if [ -d "$COMMANDS_DIR" ]; then
    echo "   Removing commands..."
    for command in "${COMMANDS_TO_REMOVE[@]}"; do
        if [ -f "$COMMANDS_DIR/$command" ]; then
            rm -f "$COMMANDS_DIR/$command"
            ((removed_commands++))
        fi
    done
    
    # Remove empty directories
    find "$COMMANDS_DIR" -type d -empty -delete 2>/dev/null || true
    
    echo "   ✅ Removed $removed_commands command(s)"
else
    echo "   ⏭️  Commands directory not found, skipping"
fi

echo ""
echo "✅ Uninstallation complete!"
echo ""
echo "📊 Summary:"
echo "   • Removed $removed_agents agent(s)"
echo "   • Removed $removed_commands command(s)"
echo "   • Your other custom files were preserved"
echo ""
echo " To reinstall, run:"
echo "   bash <(curl -sSL https://raw.githubusercontent.com/rcdelacruz/claude-code-agents/main/install.sh)"
echo ""
