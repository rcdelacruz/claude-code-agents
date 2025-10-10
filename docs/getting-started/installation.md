# Installation

This guide explains how to install the MCP Sub-Agents system with the two-tier architecture.

## Quick Install (Recommended)

Install all agents and workflow commands with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/rcdelacruz/mcp-sub-agents/main/install.sh | bash
```

This will:

1. Auto-download the repository to a temporary directory
2. Copy agents to `~/.claude/agents/` (preserving directory structure)
3. Copy workflow commands to `~/.claude/commands/`
4. Clean up temporary files
5. Show installation summary

!!! success "No Repository Clone Required"
    The installation script handles everything automatically. You don't need to clone the repository manually.

## Installation Methods

### Method 1: Remote Install (No Clone)

The recommended one-line installation:

```bash
curl -fsSL https://raw.githubusercontent.com/rcdelacruz/mcp-sub-agents/main/install.sh | bash
```

**Requirements:**

- Git installed on your system
- Internet connection
- Bash shell

### Method 2: Manual Installation (Global)

For more control over the installation process:

```bash
# Clone repository
git clone https://github.com/rcdelacruz/mcp-sub-agents.git
cd mcp-sub-agents

# Copy agents (preserves subdirectories)
mkdir -p ~/.claude/agents
cp -r agents/* ~/.claude/agents/

# Copy workflow commands
mkdir -p ~/.claude/commands
cp -r .claude/commands/* ~/.claude/commands/

# Verify installation
ls -R ~/.claude/agents/
ls ~/.claude/commands/
```

### Method 3: Project-Specific Installation

Install agents for a specific project only:

```bash
# In your project directory
git clone https://github.com/rcdelacruz/mcp-sub-agents.git
cd mcp-sub-agents

# Copy to project's .claude directory
mkdir -p .claude/agents .claude/commands
cp -r agents/* .claude/agents/
cp -r .claude/commands/* .claude/commands/

# Verify
ls -R .claude/agents/
ls .claude/commands/
```

### Method 4: Symlink (Development)

For development or to auto-sync with updates:

```bash
# Clone repository
git clone https://github.com/rcdelacruz/mcp-sub-agents.git
cd mcp-sub-agents

# Create symlinks (changes sync automatically)
mkdir -p ~/.claude
ln -s "$(pwd)/agents" ~/.claude/agents
ln -s "$(pwd)/.claude/commands" ~/.claude/commands

# Verify
ls -la ~/.claude/
```

## Directory Structure

After installation, your directory structure should look like this:

```
~/.claude/
├── agents/
│   ├── savants/
│   │   ├── savant-fullstack-js.md
│   │   └── savant-java-spring.md
│   ├── javascript/
│   │   ├── fullstack-nextjs.md
│   │   ├── frontend-ui.md
│   │   └── backend-api.md
│   └── cross-cutting/
│       ├── architect.md
│       ├── code-reviewer.md
│       ├── database.md
│       ├── deployment.md
│       ├── monitoring.md
│       ├── performance.md
│       ├── qa-tester.md
│       ├── security.md
│       └── tech-writer.md
└── commands/
    ├── mcp-design-architecture.md
    ├── mcp-design-nextjs.md
    ├── mcp-implement-fullstack.md
    ├── mcp-implement-frontend.md
    ├── mcp-implement-backend.md
    ├── mcp-review-code.md
    ├── mcp-review-security.md
    ├── mcp-review-performance.md
    ├── mcp-qa-e2e.md
    ├── mcp-write-docs.md
    └── mcp-deploy.md
```

## Understanding Agent Discovery

!!! info "How Agent Discovery Works"
    Claude Code finds agents by the `name:` field in their frontmatter, not by file path. It recursively searches all subdirectories in `~/.claude/agents/`.

**Agent frontmatter example:**

```markdown
---
name: fullstack-js-savant
description: Master expert in fullstack JavaScript/TypeScript...
---
```

The agent can be located anywhere:

- `agents/fullstack-js-savant.md` - Works
- `agents/savants/savant-fullstack-js.md` - Works
- `agents/any/nested/path/agent.md` - Works

What matters is the `name` field in the frontmatter.

## Verification

### Run Verification Script

After installation, verify that all agents and commands are properly installed:

```bash
cd mcp-sub-agents
./verify-agents.sh
```

**Expected output:**

```
🔍 Verifying Agent Installation...
✅ agents/ directory exists
📊 Total agents found: 14

📋 Agent Names (from frontmatter):
  ✓ fullstack-js-savant
  ✓ java-spring-savant
  ✓ fullstack-nextjs
  ✓ frontend-ui
  ✓ backend-api
  ✓ code-reviewer
  ✓ qa-tester
  ✓ architect
  ✓ performance
  ✓ security
  ✓ deployment
  ✓ monitoring
  ✓ database
  ✓ tech-writer

✅ Found 11 workflow commands
  ✓ /mcp-design-architecture
  ✓ /mcp-design-nextjs
  ✓ /mcp-implement-fullstack
  ✓ /mcp-implement-frontend
  ✓ /mcp-implement-backend
  ✓ /mcp-review-code
  ✓ /mcp-review-security
  ✓ /mcp-review-performance
  ✓ /mcp-qa-e2e
  ✓ /mcp-write-docs
  ✓ /mcp-deploy

✅ Verification complete!
```

### Manual Verification

Check installation manually:

```bash
# Check agents are installed
ls -R ~/.claude/agents/

# Check commands are installed
ls ~/.claude/commands/

# Count agents (should show 14)
find ~/.claude/agents -name "*.md" | wc -l

# Count commands (should show 11)
find ~/.claude/commands -name "*.md" | wc -l
```

### Test in Claude Code

Test that agents and commands are accessible:

```bash
# Test agent invocation
Use fullstack-js-savant to explain the two-tier architecture

# Test workflow command
/mcp-design-nextjs
```

## Troubleshooting

### Agents Not Found

**Problem:** Claude Code says "Agent not found"

**Solutions:**

1. Check installation location:
    ```bash
    ls -R ~/.claude/agents/
    ```
    Should show agents in subdirectories.

2. Verify agent names in frontmatter:
    ```bash
    grep "^name:" ~/.claude/agents/**/*.md
    ```
    Agent names must match what commands reference.

3. Check frontmatter format:
    ```markdown
    ---
    name: agent-name      # Must be on its own line
    description: ...
    ---
    ```

4. Reinstall:
    ```bash
    rm -rf ~/.claude/agents ~/.claude/commands
    # Run installation again
    ```

### Commands Not Working

**Problem:** `/command-name` doesn't work

**Solutions:**

1. Check commands directory:
    ```bash
    ls ~/.claude/commands/
    ```

2. Verify command files have `.md` extension:
    ```bash
    ls ~/.claude/commands/*.md
    ```

3. Check frontmatter format:
    ```markdown
    ---
    description: Command description
    ---
    ```

4. Restart Claude Code (commands are loaded at startup)

### Permission Issues

**Problem:** Permission denied during installation

**Solutions:**

```bash
# Fix permissions for Claude directory
chmod -R 755 ~/.claude/

# If using symlinks, verify source directory permissions
chmod -R 755 /path/to/mcp-sub-agents/
```

### Subdirectory Issues

**Problem:** Agents in subdirectories not working

**Solution:** Claude Code DOES support subdirectories. If having issues:

1. Check file permissions:
    ```bash
    chmod -R 755 ~/.claude/agents
    ```

2. Verify no broken symlinks:
    ```bash
    find ~/.claude/agents -type l -exec test ! -e {} \; -print
    ```

3. Alternative - flatten structure (if needed):
    ```bash
    mkdir -p ~/.claude/agents-flat
    find agents -name "*.md" -exec cp {} ~/.claude/agents-flat/ \;
    mv ~/.claude/agents-flat ~/.claude/agents
    ```

## Updating Agents

### Update Global Installation

```bash
cd mcp-sub-agents
git pull origin main
cp -r agents/* ~/.claude/agents/
cp -r .claude/commands/* ~/.claude/commands/
```

### Update with Symlinks

```bash
cd mcp-sub-agents
git pull origin main
# Changes automatically reflected via symlinks
```

### Create Update Alias

Add to your shell profile (`~/.bashrc` or `~/.zshrc`):

```bash
alias update-agents='cd ~/mcp-sub-agents && git pull && cp -r agents/* ~/.claude/agents/ && cp -r .claude/commands/* ~/.claude/commands/'
```

Then just run:

```bash
update-agents
```

## Uninstallation

### Remove Global Installation

```bash
rm -rf ~/.claude/agents
rm -rf ~/.claude/commands
```

### Remove Project-Specific Installation

```bash
rm -rf .claude/agents
rm -rf .claude/commands
```

### Remove Symlinks

```bash
rm ~/.claude/agents
rm ~/.claude/commands
```

## Platform-Specific Notes

### macOS

Default location works out of the box:

```bash
~/.claude/
```

### Linux

Same as macOS:

```bash
~/.claude/
```

### Windows

Use PowerShell:

```powershell
# Installation location
$env:USERPROFILE\.claude\

# Copy agents
Copy-Item -Recurse agents\* $env:USERPROFILE\.claude\agents\

# Copy commands
Copy-Item -Recurse .claude\commands\* $env:USERPROFILE\.claude\commands\
```

## Best Practices

### Global vs Project-Specific

**Use Global Installation When:**

- You want agents available across all projects
- You're the only developer
- You want consistent agent versions

**Use Project-Specific Installation When:**

- Team needs same agent versions
- Project has custom agents
- Different projects need different agents
- Version control for agents is needed

### Keeping Agents Updated

Regularly update to get the latest improvements:

```bash
# Weekly update
cd ~/mcp-sub-agents
git pull
cp -r agents/* ~/.claude/agents/
cp -r .claude/commands/* ~/.claude/commands/
```

## Next Steps

After installation:

1. [Quick Start Guide](quick-start.md) - Learn basic usage
2. [Architecture Overview](../architecture/overview.md) - Understand the system
3. [Workflow Commands](../architecture/workflow-commands.md) - Learn guided workflows
4. [Best Practices](../guides/best-practices.md) - Effective usage patterns

## Support

If you encounter issues:

1. Run verification script: `./verify-agents.sh`
2. Check [FAQ](../faq.md) for common questions
3. Review [troubleshooting section](#troubleshooting)
4. Open an issue: [GitHub Issues](https://github.com/rcdelacruz/mcp-sub-agents/issues)
