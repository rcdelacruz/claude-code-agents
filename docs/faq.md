# Frequently Asked Questions

Common questions about MCP Sub-Agents installation, usage, and troubleshooting.

## Installation

### Q: Where should I install the agents?

**A:** You have two options:

1. **Global installation** (`~/.claude/agents/`) - Available across all projects
2. **Project-specific** (`.claude/agents/`) - Only for specific project

Most users prefer global installation for convenience.

### Q: Do I need to clone the repository?

**A:** No! Use the one-line remote installation:

```bash
curl -fsSL https://raw.githubusercontent.com/rcdelacruz/mcp-sub-agents/main/install.sh | bash
```

The script handles everything automatically.

### Q: How do I verify agents are installed correctly?

**A:** Run the verification script:

```bash
cd mcp-sub-agents
./verify-agents.sh
```

You should see 14 agents and 11 commands.

### Q: Can I use both global and project-specific agents?

**A:** Yes, Claude Code searches both locations. Project-specific agents take precedence if there are naming conflicts.

### Q: How do I update agents to the latest version?

**A:** For global installation:

```bash
cd ~/mcp-sub-agents
git pull origin main
cp -r agents/* ~/.claude/agents/
cp -r .claude/commands/* ~/.claude/commands/
```

For symlinked installation, just `git pull`.

## Agent Discovery

### Q: Claude Code says "Agent not found" - what's wrong?

**A:** Check these common issues:

1. **Verify installation location:**
   ```bash
   ls -R ~/.claude/agents/
   ```

2. **Check agent name in frontmatter:**
   ```bash
   grep "^name:" ~/.claude/agents/**/*.md
   ```

3. **Restart Claude Code** - Agents are loaded at startup

4. **Check frontmatter format:**
   ```markdown
   ---
   name: agent-name    # Must be exactly this format
   description: ...
   ---
   ```

### Q: Do subdirectories work?

**A:** Yes! Claude Code recursively searches all subdirectories in `~/.claude/agents/`. The organized structure (savants/, javascript/, cross-cutting/) is fully supported.

### Q: How does Claude Code find agents?

**A:** By the `name:` field in the frontmatter, not the file path. The file can be anywhere in `~/.claude/agents/`.

## Usage

### Q: When should I use a savant vs a specialist?

**A:**

**Use savants for:**
- Architecture decisions
- Technology selection
- Complex problems
- Full-stack coordination

**Use specialists for:**
- Specific implementations
- Framework details
- Focused tasks
- Domain expertise

### Q: When should I use workflow commands?

**A:** Use workflow commands when you want:

- Step-by-step guidance
- Comprehensive checklists
- Learning new patterns
- Ensuring completeness
- Structured development

Use direct agent invocation for quick, specific tasks.

### Q: Can I chain multiple agents?

**A:** Yes! This is recommended for complex tasks:

```bash
# 1. Design
Use architect to design system

# 2. Database
Use database to create schema

# 3. API
Use backend-api to implement API

# 4. UI
Use frontend-ui to create components

# 5. Review
Use code-reviewer to review code
```

### Q: How specific should my requests be?

**A:** Be as specific as possible:

```bash
# Good
Use frontend-ui to create a multi-step wizard form with validation, progress indicator, and ability to navigate between steps

# Less effective
Use frontend-ui to create a form
```

## Workflow Commands

### Q: Workflow commands don't work - why?

**A:** Check:

1. **Commands directory exists:**
   ```bash
   ls ~/.claude/commands/
   ```

2. **Files have .md extension:**
   ```bash
   ls ~/.claude/commands/*.md
   ```

3. **Restart Claude Code** - Commands loaded at startup

### Q: Can I create custom workflow commands?

**A:** Yes! Add markdown files to `.claude/commands/`:

```markdown
---
description: Your custom workflow
---

# Custom Workflow

Your guidance here...
```

### Q: What's the difference between `/mcp-implement-fullstack` and `/mcp-implement-frontend`?

**A:**

- `/mcp-implement-fullstack` - Complete feature (database → API → UI)
- `/mcp-implement-frontend` - UI components only

Choose based on scope of work.

## Agents

### Q: Which agent should I use for Next.js?

**A:** Depends on the task:

- **fullstack-nextjs** - Server Components, routing, data fetching
- **frontend-ui** - UI components, forms, layouts
- **backend-api** - APIs, authentication
- **fullstack-js-savant** - Architecture, complex decisions

### Q: Can I use multiple agents for one task?

**A:** Yes! Combine agents:

```bash
Use database to create schema
Use backend-api to create API
Use fullstack-nextjs to build pages
Use frontend-ui to create forms
```

### Q: What's the difference between fullstack-nextjs and fullstack-js-savant?

**A:**

- **fullstack-nextjs** - Specialist in Next.js 15+ implementation
- **fullstack-js-savant** - Master orchestrator for entire JS ecosystem, makes architectural decisions

Use savant for decisions, specialist for implementation.

## Technology Stack

### Q: What version of Next.js is supported?

**A:** Next.js 15+ with App Router. The agents focus on modern patterns with Server Components and Server Actions.

### Q: Can I use these agents with Pages Router?

**A:** The agents are optimized for App Router. For Pages Router, you'll need to adapt the guidance.

### Q: Is TypeScript required?

**A:** While not strictly required, all agents assume TypeScript usage and provide TypeScript examples. JavaScript users can adapt the patterns.

### Q: What about Python, Java, or other languages?

**A:** Currently focused on JavaScript/TypeScript. Java Spring savant is available. More language savants can be added (see contributing guide).

## Best Practices

### Q: Should I review code after every implementation?

**A:** Yes! Use `/mcp-review-code` proactively:

```bash
/mcp-implement-fullstack
/mcp-review-code    # Review immediately
```

### Q: How often should I run security audits?

**A:** Recommended schedule:

- Before production deployment (always)
- Monthly during active development
- After authentication changes
- When handling sensitive data

### Q: When should I optimize performance?

**A:** Follow this approach:

1. Build feature first
2. Run `/mcp-review-performance` to measure
3. Optimize identified issues
4. Re-measure to verify improvements

Don't optimize prematurely.

### Q: Should I write tests as I code or after?

**A:** Write tests alongside code:

```bash
/mcp-implement-fullstack   # Build feature
/mcp-qa-e2e               # Write tests immediately
```

This prevents bugs and ensures testability.

## Troubleshooting

### Q: Agents give outdated advice

**A:** Update to latest version:

```bash
cd ~/mcp-sub-agents
git pull origin main
# Copy updated agents
```

### Q: Workflow command gives error

**A:** Common issues:

1. Command file missing or corrupted
2. Frontmatter malformed
3. Referenced agent not installed
4. Need to restart Claude Code

### Q: Agent response seems generic

**A:** Provide more specific context:

```bash
# Instead of
Use frontend-ui to create a form

# Try
Use frontend-ui to create a multi-step registration form with email, password, and profile fields. Include Zod validation and error display.
```

### Q: Different agents give conflicting advice

**A:** Use savant to clarify:

```bash
Use fullstack-js-savant to explain the tradeoffs between [approach A] and [approach B] for my use case
```

## Performance

### Q: Are agents slow to respond?

**A:** Response time depends on:

- Complexity of request
- Agent being used (savants do more analysis)
- Claude API performance

For faster responses, be specific about what you need.

### Q: Can I run multiple agents in parallel?

**A:** Yes, you can invoke multiple agents sequentially. They don't run in parallel but you can chain them efficiently.

## Platform-Specific

### Q: Does this work on Windows?

**A:** Yes, but use PowerShell:

```powershell
Copy-Item -Recurse agents\* $env:USERPROFILE\.claude\agents\
Copy-Item -Recurse .claude\commands\* $env:USERPROFILE\.claude\commands\
```

### Q: Any issues on macOS?

**A:** No known issues. Installation script works perfectly on macOS.

### Q: Linux support?

**A:** Fully supported. Same as macOS installation.

## Team Usage

### Q: How do teams use MCP Sub-Agents?

**A:** Use project-specific installation:

```bash
# In project repo
mkdir -p .claude/agents .claude/commands
cp -r agents/* .claude/agents/
```

Commit `.claude/` to version control for team consistency.

### Q: Can we customize agents for our team?

**A:** Yes! Fork the repository and modify agents to match your:

- Tech stack
- Coding standards
- Best practices
- Company policies

### Q: How to ensure consistency across team?

**A:** Use workflow commands:

```bash
# Everyone uses same workflows
/mcp-implement-fullstack
/mcp-review-code
```

This ensures consistent patterns.

## Advanced Usage

### Q: Can I create my own agents?

**A:** Yes! See the [Contributing Guide](contributing.md) for agent template and guidelines.

### Q: Can agents modify multiple files?

**A:** Yes, agents can read, write, and edit multiple files as needed for implementation.

### Q: Do agents remember context between invocations?

**A:** Within a single conversation, yes. Context is maintained throughout the session.

### Q: Can I use agents for non-Next.js projects?

**A:** Yes! Use:

- **fullstack-js-savant** for JavaScript/TypeScript projects
- **Cross-cutting specialists** (security, performance, etc.) work with any stack
- More framework-specific agents can be added

## Getting Help

### Q: Where can I get help?

**A:** Multiple options:

1. [Documentation](https://rcdelacruz.github.io/mcp-sub-agents)
2. [GitHub Issues](https://github.com/rcdelacruz/mcp-sub-agents/issues)
3. [GitHub Discussions](https://github.com/rcdelacruz/mcp-sub-agents/discussions)
4. Read existing agent documentation in `agents/` directories

### Q: How do I report a bug?

**A:** Open a [GitHub Issue](https://github.com/rcdelacruz/mcp-sub-agents/issues) with:

- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Agent/command used
- Environment details

### Q: Can I request new features?

**A:** Yes! Open a GitHub Issue with:

- Feature description
- Use case explanation
- Why it's valuable
- Proposed implementation (optional)

## Contributing

### Q: How can I contribute?

**A:** Multiple ways:

- Report bugs and issues
- Improve documentation
- Add new agents
- Create workflow commands
- Enhance existing agents
- Share feedback

See [Contributing Guide](contributing.md) for details.

### Q: What makes a good agent?

**A:** Good agents have:

- Clear, specific focus
- Comprehensive guidance (800+ lines)
- Production-ready code examples
- Best practices
- When to use guidance
- Common patterns
- Well-structured organization

## Still Have Questions?

If your question isn't answered here:

1. Check the [documentation](https://rcdelacruz.github.io/mcp-sub-agents)
2. Search [closed issues](https://github.com/rcdelacruz/mcp-sub-agents/issues?q=is%3Aissue+is%3Aclosed)
3. Ask in [GitHub Discussions](https://github.com/rcdelacruz/mcp-sub-agents/discussions)
4. Create a [new issue](https://github.com/rcdelacruz/mcp-sub-agents/issues/new)
