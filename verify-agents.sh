#!/bin/bash

# Verification script for agent installation

echo "🔍 Verifying Agent Installation..."
echo ""

# Check if agents directory exists
if [ ! -d "agents" ]; then
    echo "❌ agents/ directory not found"
    exit 1
fi

echo "✅ agents/ directory exists"
echo ""

# Count total agents
total_agents=$(find agents -name "*.md" -type f | wc -l | tr -d ' ')
echo "📊 Total agents found: $total_agents"
echo ""

# List all agents by name (from frontmatter)
echo "📋 Agent Names (from frontmatter):"
echo ""

find agents -name "*.md" -type f | while read file; do
    # Extract name from frontmatter
    name=$(grep "^name:" "$file" | head -1 | cut -d':' -f2 | tr -d ' ')
    location=$(echo "$file" | sed 's/agents\///')

    if [ -n "$name" ]; then
        echo "  ✓ $name"
        echo "    Location: $location"
    else
        echo "  ⚠️  No name found in: $file"
    fi
done

echo ""
echo "🔍 Checking for commands..."

if [ ! -d ".claude/commands" ]; then
    echo "❌ .claude/commands/ directory not found"
    exit 1
fi

commands_count=$(find .claude/commands -name "*.md" -type f | wc -l | tr -d ' ')
echo "✅ Found $commands_count workflow commands"
echo ""

echo "📋 Workflow Commands:"
find .claude/commands -name "*.md" -type f | while read file; do
    cmd_name=$(basename "$file" .md)
    echo "  ✓ /$cmd_name"
done

echo ""
echo "✅ Verification complete!"
echo ""
echo "To install globally:"
echo "  cp -r agents/* ~/.claude/agents/"
echo "  cp -r .claude/commands ~/.claude/"
echo ""
echo "To verify installation:"
echo "  ls -R ~/.claude/agents/"
echo "  ls ~/.claude/commands/"
