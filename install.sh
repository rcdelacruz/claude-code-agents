#!/bin/bash

# MCP Sub-Agents Installation Script
# Installs savant agents, specialist agents, and workflow commands for Claude Code
# Version: 2.0 - Two-Tier Architecture with Hybrid Workflow Commands

set -e

AGENTS_DIR="$HOME/.claude/agents"
COMMANDS_DIR="$HOME/.claude/commands"
REPO_URL="https://github.com/rcdelacruz/mcp-sub-agents.git"
CLEANUP_TEMP=false

echo "🚀 Installing MCP Sub-Agents for Claude Code..."
echo ""
echo "📦 Two-Tier Architecture:"
echo "   • Savant Agents (Orchestrators)"
echo "   • Specialist Agents (Implementers)"
echo "   • Hybrid Workflow Commands"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if source directories exist
if [ ! -d "$SCRIPT_DIR/agents" ]; then
    echo "📥 Source files not found locally. Cloning repository..."
    echo ""

    # Check if git is installed
    if ! command -v git &> /dev/null; then
        echo "❌ Error: git is not installed"
        echo "   Please install git first:"
        echo "   • macOS: brew install git"
        echo "   • Ubuntu/Debian: sudo apt-get install git"
        echo "   • Windows: https://git-scm.com/download/win"
        exit 1
    fi

    # Clone to temporary directory
    TEMP_DIR=$(mktemp -d)
    CLEANUP_TEMP=true
    echo "📦 Downloading from $REPO_URL..."
    git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>&1 | grep -v "Cloning into" || true
    SCRIPT_DIR="$TEMP_DIR"
    echo "✅ Repository downloaded"
    echo ""
fi

# Verify required directories exist
if [ ! -d "$SCRIPT_DIR/agents" ]; then
    echo "❌ Error: agents/ directory not found in $SCRIPT_DIR"
    exit 1
fi

if [ ! -d "$SCRIPT_DIR/.claude/commands" ]; then
    echo "❌ Error: .claude/commands/ directory not found in $SCRIPT_DIR"
    exit 1
fi

# Create directories
echo "📁 Creating directories..."
mkdir -p "$AGENTS_DIR"
mkdir -p "$COMMANDS_DIR"

# Copy agents (preserves subdirectory structure)
echo "📦 Installing agents..."
cp -r "$SCRIPT_DIR/agents/"* "$AGENTS_DIR/"

# Copy workflow commands
echo "🔧 Installing workflow commands..."
cp -r "$SCRIPT_DIR/.claude/commands/"* "$COMMANDS_DIR/"

echo ""
echo "✅ Installation complete!"
echo ""

# Count installed agents and commands
agent_count=$(find "$AGENTS_DIR" -name "*.md" -type f | wc -l | tr -d ' ')
command_count=$(find "$COMMANDS_DIR" -name "*.md" -type f | wc -l | tr -d ' ')

echo "📊 Installation Summary:"
echo "   • Agents installed: $agent_count"
echo "   • Commands installed: $command_count"
echo ""

echo "🏗️ Installed Architecture:"
echo ""
echo "   Savant Agents (Orchestrators):"
echo "      • fullstack-js-savant - JavaScript/TypeScript ecosystem master"
echo "      • java-spring-savant - Spring ecosystem master"
echo ""
echo "   Specialist Agents (JavaScript/TypeScript):"
echo "      • fullstack-nextjs - Next.js 15, App Router, Server Components"
echo "      • frontend-ui - shadcn/ui, Tailwind CSS, Accessibility"
echo "      • backend-api - tRPC, REST APIs, NextAuth.js"
echo ""
echo "   Cross-Stack Specialists:"
echo "      • architect - System Design, Scalability"
echo "      • code-reviewer - Code Quality, Best Practices"
echo "      • qa-tester - Playwright E2E, Vitest"
echo "      • performance - Core Web Vitals, Optimization"
echo "      • security - OWASP Top 10, Authentication"
echo "      • deployment - Vercel, Docker, Kubernetes, CI/CD"
echo "      • monitoring - Sentry, OpenTelemetry, Logging"
echo "      • database - PostgreSQL, Prisma ORM"
echo "      • tech-writer - MkDocs Material, API Docs"
echo ""
echo "   Workflow Commands:"
echo "      Design Phase:"
echo "         /mcp-design-architecture - System architecture design"
echo "         /mcp-design-nextjs - Next.js application architecture"
echo ""
echo "      Implementation Phase:"
echo "         /mcp-implement-fullstack - Full-stack feature (DB → API → UI)"
echo "         /mcp-implement-frontend - Frontend components"
echo "         /mcp-implement-backend - Backend API & business logic"
echo ""
echo "      Review Phase:"
echo "         /mcp-review-code - Code quality review"
echo "         /mcp-review-security - Security audit (OWASP Top 10)"
echo "         /mcp-review-performance - Performance optimization"
echo ""
echo "      QA & Documentation:"
echo "         /mcp-qa-e2e - End-to-end testing with Playwright"
echo "         /mcp-write-docs - Technical documentation with MkDocs"
echo ""
echo "      Deployment:"
echo "         /mcp-deploy - Production deployment with CI/CD"
echo ""

echo "💡 Usage Examples:"
echo ""
echo "   Using Savant Agents (for architecture & complex tasks):"
echo "      Use fullstack-js-savant to design a real-time chat app"
echo ""
echo "   Using Specialist Agents (for focused implementation):"
echo "      Use fullstack-nextjs to build a dashboard with Server Components"
echo "      Use frontend-ui to create a form with shadcn/ui"
echo "      Use backend-api to create a tRPC router"
echo ""
echo "   Using Workflow Commands (for guided development):"
echo "      /mcp-design-nextjs"
echo "      /mcp-implement-fullstack"
echo "      /mcp-review-code"
echo "      /mcp-review-security"
echo "      /mcp-qa-e2e"
echo "      /mcp-write-docs"
echo "      /mcp-deploy"
echo ""

echo "📖 Documentation:"
echo "   • README.md - Main documentation"
echo "   • SAVANT-ARCHITECTURE.md - Two-tier architecture guide"
echo "   • WORKFLOW-COMMANDS.md - Complete workflow reference"
echo "   • INSTALLATION-GUIDE.md - Detailed installation guide"
echo ""

echo "🔍 Verify Installation:"
if [ "$CLEANUP_TEMP" = true ]; then
    echo "   In Claude Code, test with:"
    echo "   Use fullstack-js-savant to explain the architecture"
    echo "   /mcp-design-nextjs"
else
    echo "   cd $SCRIPT_DIR"
    echo "   ./verify-agents.sh"
fi
echo ""

# Cleanup temporary directory if created
if [ "$CLEANUP_TEMP" = true ] && [ -d "$TEMP_DIR" ]; then
    echo "🧹 Cleaning up temporary files..."
    rm -rf "$TEMP_DIR"
fi

echo "✨ Happy coding with MCP Sub-Agents!"
