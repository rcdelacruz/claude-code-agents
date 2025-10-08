# MCP Sub-Agents Installation Guide

Quick guide for installing the enterprise web development subagents.

## Quick Install (Global)

```bash
# Clone the repository
git clone https://github.com/rcdelacruz/mcp-sub-agents.git
cd mcp-sub-agents

# Copy to Claude Code global directory
mkdir -p ~/.claude/agents
cp agents/*.md ~/.claude/agents/

# Verify
ls -la ~/.claude/agents/
```

## Subagents Included

1. **architect.md** - Architecture & Design
2. **cloud-infra.md** - Cloud Infrastructure
3. **onprem-infra.md** - On-Premises Infrastructure
4. **security.md** - Security & Compliance
5. **devops-cicd.md** - DevOps & CI/CD
6. **database.md** - Database Design & Optimization

## Usage Examples

```
Use architect to design a microservices architecture
Use cloud-infra to deploy to AWS EKS
Use security to review this auth code
Use database to optimize my queries
```

See full README.md for detailed documentation.
