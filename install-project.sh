#!/bin/bash
# Project-Specific Installation Script for Claude Code Agents
# Installs agents and commands to .claude/ directory in your project

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}📦 Claude Code Agents - Project-Specific Installation${NC}"
echo ""

# Check if we're in a git repository (recommended but not required)
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} Git repository detected"
    IN_GIT_REPO=true
else
    echo -e "${YELLOW}⚠${NC}  Not in a git repository (optional)"
    IN_GIT_REPO=false
fi

# Create temporary directory
TEMP_DIR=$(mktemp -d)
echo -e "${BLUE}Creating temporary directory: ${TEMP_DIR}${NC}"

# Cleanup function
cleanup() {
    echo -e "${BLUE}Cleaning up temporary files...${NC}"
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

# Download repository
echo -e "${BLUE}Downloading Claude Code Agents repository...${NC}"
cd "$TEMP_DIR"
git clone --depth 1 https://github.com/rcdelacruz/claude-code-agents.git
cd claude-code-agents

# Get the project directory (where the script was called from)
PROJECT_DIR="$OLDPWD"
echo -e "${BLUE}Installing to project: ${PROJECT_DIR}${NC}"

# Create .claude directory structure in project
echo -e "${BLUE}Creating .claude directory structure...${NC}"
mkdir -p "$PROJECT_DIR/.claude/agents"
mkdir -p "$PROJECT_DIR/.claude/commands"

# Copy agents (preserving subdirectory structure)
echo -e "${BLUE}Installing agents to .claude/agents/...${NC}"
cp -r agents/* "$PROJECT_DIR/.claude/agents/"

# Copy workflow commands
echo -e "${BLUE}Installing workflow commands to .claude/commands/...${NC}"
cp -r .claude/commands/* "$PROJECT_DIR/.claude/commands/"

# Count installed files
AGENT_COUNT=$(find "$PROJECT_DIR/.claude/agents" -name "*.md" | wc -l | tr -d ' ')
COMMAND_COUNT=$(find "$PROJECT_DIR/.claude/commands" -name "*.md" | wc -l | tr -d ' ')

echo ""
echo -e "${GREEN}✅ Installation Complete!${NC}"
echo ""
echo -e "${GREEN}Installed:${NC}"
echo -e "  • ${AGENT_COUNT} agents in .claude/agents/"
echo -e "  • ${COMMAND_COUNT} commands in .claude/commands/"
echo ""

# Update .gitignore if in git repo
if [ "$IN_GIT_REPO" = true ]; then
    GITIGNORE_FILE="$PROJECT_DIR/.gitignore"

    # Check if .gitignore exists
    if [ -f "$GITIGNORE_FILE" ]; then
        # Check if .claude/ is already ignored
        if grep -q "^\.claude/$" "$GITIGNORE_FILE" 2>/dev/null; then
            echo -e "${GREEN}✓${NC} .claude/ already in .gitignore"
        else
            echo -e "${YELLOW}📝 Recommendation: Add .claude/ to .gitignore${NC}"
            echo ""
            read -p "   Add .claude/ to .gitignore now? (y/N) " -n 1 -r
            echo ""
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                echo "" >> "$GITIGNORE_FILE"
                echo "# Claude Code Agents (project-specific installation)" >> "$GITIGNORE_FILE"
                echo ".claude/" >> "$GITIGNORE_FILE"
                echo -e "${GREEN}✓${NC} Added .claude/ to .gitignore"
            else
                echo -e "${YELLOW}⚠${NC}  Skipped. Remember to add .claude/ to .gitignore manually"
                echo "   Add this line to .gitignore:"
                echo "   .claude/"
            fi
        fi
    else
        echo -e "${YELLOW}📝 Recommendation: Create .gitignore and add .claude/${NC}"
        echo ""
        read -p "   Create .gitignore with .claude/ entry? (y/N) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "# Claude Code Agents (project-specific installation)" > "$GITIGNORE_FILE"
            echo ".claude/" >> "$GITIGNORE_FILE"
            echo -e "${GREEN}✓${NC} Created .gitignore with .claude/ entry"
        else
            echo -e "${YELLOW}⚠${NC}  Skipped"
        fi
    fi
fi

echo ""
echo -e "${BLUE}📂 Installation Location:${NC}"
echo "   $PROJECT_DIR/.claude/"
echo ""
echo -e "${BLUE}📋 Directory Structure:${NC}"
echo "   .claude/"
echo "   ├── agents/"
echo "   │   ├── savants/"
echo "   │   ├── javascript/"
echo "   │   └── cross-cutting/"
echo "   └── commands/"
echo ""

echo -e "${BLUE}🎯 Next Steps:${NC}"
echo "   1. Navigate to your project directory"
echo "   2. Open Claude Code in this project"
echo "   3. Test agent: Use fullstack-js-savant to explain the architecture"
echo "   4. Test command: /workflow-design-nextjs"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}"
