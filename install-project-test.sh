#!/bin/bash
# TEST VERSION - Project-Specific Installation Script
# This version works with THIS repository structure (mcp-sub-agents)
# For testing purposes only

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}📦 Claude Code Agents - Project-Specific Installation (TEST)${NC}"
echo ""

# Determine installation directory
if [ -n "$1" ]; then
    PROJECT_DIR="$1"
    echo -e "${BLUE}Installing to specified directory: ${PROJECT_DIR}${NC}"
elif [ -n "$INSTALL_DIR" ]; then
    PROJECT_DIR="$INSTALL_DIR"
    echo -e "${BLUE}Installing to INSTALL_DIR: ${PROJECT_DIR}${NC}"
else
    echo -e "${YELLOW}Please enter the full path to your project directory:${NC}"
    echo -e "${YELLOW}(or press Ctrl+C to cancel)${NC}"
    read -p "Project path: " PROJECT_DIR
    PROJECT_DIR="${PROJECT_DIR/#\~/$HOME}"
fi

# Validate directory exists
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${RED}❌ Error: Directory does not exist: ${PROJECT_DIR}${NC}"
    exit 1
fi

# Make path absolute
PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
echo -e "${GREEN}✓${NC} Installing to: ${PROJECT_DIR}"

# Use current repository (for testing)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo -e "${BLUE}Using agents from: ${SCRIPT_DIR}/.claude/${NC}"

# Check if .claude/agents exists in current repo
if [ ! -d "$SCRIPT_DIR/.claude/agents" ]; then
    echo -e "${RED}❌ Error: Cannot find agents in ${SCRIPT_DIR}/.claude/agents${NC}"
    exit 1
fi

# Create .claude directory structure in project
echo -e "${BLUE}Creating .claude directory structure...${NC}"
mkdir -p "$PROJECT_DIR/.claude/agents"
mkdir -p "$PROJECT_DIR/.claude/commands"

# Copy agents (from this repo's .claude directory)
echo -e "${BLUE}Installing agents to .claude/agents/...${NC}"
cp -r "$SCRIPT_DIR/.claude/agents/"* "$PROJECT_DIR/.claude/agents/"

# Copy workflow commands
echo -e "${BLUE}Installing workflow commands to .claude/commands/...${NC}"
cp -r "$SCRIPT_DIR/.claude/commands/"* "$PROJECT_DIR/.claude/commands/"

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
echo -e "${BLUE}📂 Installation Location:${NC}"
echo "   $PROJECT_DIR/.claude/"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}"
