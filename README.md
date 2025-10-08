# MCP Sub-Agents for Enterprise Web Development

A collection of specialized Claude Code subagents for building enterprise-grade web applications that can be deployed on cloud or on-premises infrastructure.

## 🎯 Overview

This repository contains 6 expert subagents, each specialized in a critical area of enterprise web application development:

1. **architect** - Architecture & Design Expert
2. **cloud-infra** - Cloud Infrastructure Expert
3. **onprem-infra** - On-Premises Infrastructure Expert
4. **security** - Security & Compliance Expert
5. **devops-cicd** - DevOps & CI/CD Expert
6. **database** - Database Design & Optimization Expert

## 🚀 Installation

### Global Installation (Recommended)

```bash
# Clone the repository
git clone https://github.com/rcdelacruz/mcp-sub-agents.git
cd mcp-sub-agents

# Copy subagents to Claude Code's global directory
mkdir -p ~/.claude/agents
cp agents/*.md ~/.claude/agents/

# Verify installation
ls -la ~/.claude/agents/
```

## 💡 Usage

### Explicit Invocation

```
Use architect to design the system architecture
Use cloud-infra to help me deploy to AWS
Use security to review this code for vulnerabilities
Use database to optimize my PostgreSQL schema
```

### Automatic Suggestion

Claude Code will automatically suggest the appropriate subagent based on your context.

## 📦 Subagents

### 1. Architecture & Design Expert (`architect.md`)
System architecture, design patterns, API design, microservices, DDD

### 2. Cloud Infrastructure Expert (`cloud-infra.md`)
AWS, Azure, GCP, Kubernetes, Terraform, cloud cost optimization

### 3. On-Premises Infrastructure Expert (`onprem-infra.md`)
Self-hosted Kubernetes, VMware, networking, storage, hybrid cloud

### 4. Security Expert (`security.md`)
Authentication, OWASP Top 10, secrets management, compliance

### 5. DevOps & CI/CD Expert (`devops-cicd.md`)
CI/CD pipelines, deployment strategies, monitoring, automation

### 6. Database Expert (`database.md`)
SQL/NoSQL databases, query optimization, replication, sharding

## 📄 License

MIT License

## 👨‍💻 Author

**Ronald DC**
- GitHub: [@rcdelacruz](https://github.com/rcdelacruz)
- Email: rcdelacruz@gmail.com

---

Built for the enterprise web development community.
