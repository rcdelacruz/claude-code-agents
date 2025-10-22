# Installation Guide

This guide explains how to install the Claude Code Agents system with the two-tier architecture.

## Understanding the Installation

### Directory Structure
```
~/.claude/
├── agents/                    # Claude Code searches recursively here
│   ├── savants/              # Savant agents (orchestrators)
│   │   ├── fullstack-js-savant.md
│   │   └── java-spring-savant.md
│   ├── javascript/           # JavaScript specialists
│   │   ├── fullstack-nextjs.md
│   │   ├── frontend-ui.md
│   │   └── backend-api.md
│   └── cross-cutting/        # Universal specialists
│       ├── code-reviewer.md
│       ├── qa-tester.md
│       └── [9 more agents]
└── commands/                  # Slash commands
    ├── design-architecture.md
    ├── implement-fullstack.md
    └── [9 more commands]
```

### How Agent Discovery Works

**✅ Claude Code finds agents by NAME, not by file path**

```markdown
---
name: fullstack-js-savant    ← This is what matters
description: Master expert...
---
```

**Location doesn't matter:**
- `agents/fullstack-js-savant.md` ✅ Works
- `agents/savants/savant-fullstack-js.md` ✅ Works
- `agents/any/nested/path/agent.md` ✅ Works

Claude Code recursively searches all subdirectories in `~/.claude/agents/`.

## Installation Methods

### Method 1: Remote Install (Recommended - No Clone Needed)

```bash
# One-line installation
curl -fsSL https://raw.githubusercontent.com/rcdelacruz/claude-code-agents/main/install.sh | bash
```

**What it does:**
1. Auto-downloads the repository to a temporary directory
2. Copies agents to `~/.claude/agents/` (preserving directory structure)
3. Copies commands to `~/.claude/commands/`
4. Cleans up temporary files
5. Shows installation summary

**Requirements:**
- Git must be installed on your system
- Internet connection

**No repository clone required!** The script handles everything automatically.

### Method 2: Manual Installation (Global)

```bash
# Clone repository
git clone https://github.com/rcdelacruz/claude-code-agents.git
cd claude-code-agents

# Copy agents (preserves subdirectories)
mkdir -p ~/.claude/agents
cp -r agents/* ~/.claude/agents/

# Copy commands
mkdir -p ~/.claude/commands
cp -r .claude/commands/* ~/.claude/commands/

# Verify installation
ls -R ~/.claude/agents/
ls ~/.claude/commands/
```

### Method 3: Project-Specific Installation

```bash
# In your project directory
git clone https://github.com/rcdelacruz/claude-code-agents.git
cd claude-code-agents

# Copy to project's .claude directory
mkdir -p .claude/agents .claude/commands
cp -r agents/* .claude/agents/
cp -r .claude/commands/* .claude/commands/

# Verify
ls -R .claude/agents/
ls .claude/commands/
```

### Method 4: Symlink (For Development)

```bash
# Clone repository
git clone https://github.com/rcdelacruz/claude-code-agents.git
cd claude-code-agents

# Create symlinks (changes sync automatically)
mkdir -p ~/.claude
ln -s "$(pwd)/agents" ~/.claude/agents
ln -s "$(pwd)/.claude/commands" ~/.claude/commands

# Verify
ls -la ~/.claude/
```

## Verification

### Run Verification Script

```bash
./verify-agents.sh
```

**Expected Output:**
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
  [... more agents ...]

✅ Found 11 workflow commands
  ✓ /workflow-design-architecture
  ✓ /workflow-design-nextjs
  ✓ /workflow-implement-fullstack
  [... more commands ...]

✅ Verification complete!
```

### Manual Verification

```bash
# Check agents are installed
ls -R ~/.claude/agents/

# Check commands are installed
ls ~/.claude/commands/

# Count agents
find ~/.claude/agents -name "*.md" | wc -l
# Should show: 14

# Count commands
find ~/.claude/commands -name "*.md" | wc -l
# Should show: 11
```

### Test in Claude Code

```bash
# Test agent invocation
Use fullstack-js-savant to explain the architecture

# Test workflow command
/workflow-design-nextjs
```

## Troubleshooting

### Agents Not Found

**Problem:** Claude Code says "Agent not found"

**Solutions:**

1. **Check installation location:**
   ```bash
   ls -R ~/.claude/agents/
   ```
   Should show agents in subdirectories.

2. **Verify agent names:**
   ```bash
   grep "^name:" ~/.claude/agents/**/*.md
   ```
   Agent names must match what commands reference.

3. **Check frontmatter format:**
   ```markdown
   ---
   name: agent-name      ← Must be on its own line
   description: ...
   ---
   ```

4. **Reinstall:**
   ```bash
   rm -rf ~/.claude/agents ~/.claude/commands
   # Run installation again
   ```

### Commands Not Working

**Problem:** `/command-name` doesn't work

**Solutions:**

1. **Check commands directory:**
   ```bash
   ls ~/.claude/commands/
   ```

2. **Verify command files have `.md` extension:**
   ```bash
   ls ~/.claude/commands/*.md
   ```

3. **Check frontmatter:**
   ```markdown
   ---
   description: Command description
   ---
   ```

4. **Restart Claude Code** (commands loaded at startup)

### Directory Structure Issues

**Problem:** Subdirectories not working

**Solution:** Claude Code DOES support subdirectories! If having issues:

1. **Check file permissions:**
   ```bash
   chmod -R 755 ~/.claude/agents
   ```

2. **Verify no broken symlinks:**
   ```bash
   find ~/.claude/agents -type l -exec test ! -e {} \; -print
   ```

3. **Alternative: Flatten structure** (if needed):
   ```bash
   mkdir -p ~/.claude/agents-flat
   find agents -name "*.md" -exec cp {} ~/.claude/agents-flat/ \;
   mv ~/.claude/agents-flat ~/.claude/agents
   ```

## Updating Agents

### Update Global Installation

```bash
cd claude-code-agents
git pull origin main
cp -r agents/* ~/.claude/agents/
cp -r .claude/commands/* ~/.claude/commands/
```

### Update with Symlinks

```bash
cd claude-code-agents
git pull origin main
# Changes automatically reflected via symlinks!
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

## Best Practices

### Global vs Project-Specific

**Use Global Installation When:**
- ✅ You want agents available across all projects
- ✅ You're the only developer
- ✅ You want consistent agent versions

**Use Project-Specific Installation When:**
- ✅ Team needs same agent versions
- ✅ Project has custom agents
- ✅ Different projects need different agents
- ✅ Version control for agents needed

### Keeping Agents Updated

```bash
# Add to your shell profile (~/.bashrc or ~/.zshrc)
alias update-agents='cd ~/claude-code-agents && git pull && cp -r agents/* ~/.claude/agents/ && cp -r .claude/commands/* ~/.claude/commands/'

# Then just run:
update-agents
```

## Platform-Specific Notes

### macOS
```bash
# Default location works out of the box
~/.claude/
```

### Linux
```bash
# Same as macOS
~/.claude/
```

### Windows
```powershell
# PowerShell commands
$env:USERPROFILE\.claude\

# Copy agents
Copy-Item -Recurse agents\* $env:USERPROFILE\.claude\agents\
Copy-Item -Recurse .claude\commands\* $env:USERPROFILE\.claude\commands\
```

## Support

If you encounter issues:

1. Run verification script: `./verify-agents.sh`
2. Check GitHub Issues: https://github.com/rcdelacruz/claude-code-agents/issues
3. Read documentation: README.md, SAVANT-ARCHITECTURE.md, WORKFLOW-COMMANDS.md

## Summary

✅ **Subdirectories ARE supported** - Claude Code searches recursively
✅ **Agent names matter, not paths** - Use correct name in frontmatter
✅ **Multiple installation methods** - Choose what works for you
✅ **Verification tools provided** - Use `verify-agents.sh`
✅ **Easy updates** - Just copy or pull latest

The organized directory structure (savants/, javascript/, cross-cutting/) is **fully compatible** with Claude Code's agent discovery system! 🎉
