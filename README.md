# MCP Sub-Agents for Enterprise Development

A comprehensive collection of specialized Claude Code subagents with **domain expert savants** and **hybrid workflow commands** for building production-ready, enterprise-grade applications.

## 🎯 Overview

This repository implements a **two-tier agent architecture**:

### Tier 1: Savant Agents (Orchestrators)
Master experts with broad, deep knowledge across entire technology ecosystems. Savants make architectural decisions, choose technologies, and orchestrate specialist agents.

### Tier 2: Specialist Agents (Implementers)
Deep domain experts focusing on specific frameworks, tools, and practices within a stack.

### Hybrid Workflow Commands
Slash commands that combine development workflow stages (design, implement, review, qa, deploy) with technology expertise for guided, structured development.

## 🏗️ Agent Architecture

### Savant Agents (Technology Stack Experts)
- **fullstack-js-savant** - JavaScript/TypeScript ecosystem master
- **java-spring-savant** - Spring ecosystem master
- *(More savants can be added: Python, Go, .NET, Mobile)*

### Specialist Agents by Stack

#### JavaScript/TypeScript Specialists
- **fullstack-nextjs** - Next.js 15, App Router, Server Components, Server Actions
- **frontend-ui** - shadcn/ui, Tailwind CSS, Radix UI, Accessibility
- **backend-api** - tRPC, REST APIs, NextAuth.js, Authentication

#### Cross-Stack Specialists (Work with all stacks)
- **database** - PostgreSQL, Prisma ORM, Migrations, Optimization
- **code-reviewer** - Code Quality, Best Practices, Refactoring
- **qa-tester** - Playwright E2E, Vitest Unit Tests, Testing Strategy
- **performance** - Core Web Vitals, Bundle Size, Caching
- **security** - OWASP Top 10, Authentication, Authorization
- **deployment** - Vercel, Docker, Kubernetes, CI/CD
- **monitoring** - Sentry, OpenTelemetry, Logging, Metrics
- **architect** - System Design, Scalability, Design Patterns
- **tech-writer** - Technical Documentation, MkDocs Material, API Docs

## 🚀 Hybrid Workflow Commands

Structured slash commands that guide you through development stages:

### Design Phase
- `/mcp-design-architecture` - System architecture and high-level decisions
- `/mcp-design-nextjs` - Next.js application architecture with modern patterns

### Implementation Phase
- `/mcp-implement-fullstack` - Full-stack feature implementation end-to-end
- `/mcp-implement-frontend` - Frontend UI components and client features
- `/mcp-implement-backend` - Backend API, business logic, and data layer

### Review Phase
- `/mcp-review-code` - Comprehensive code quality review
- `/mcp-review-security` - Security audit (OWASP Top 10)
- `/mcp-review-performance` - Performance optimization (Core Web Vitals)

### QA Phase
- `/mcp-qa-e2e` - End-to-end testing with Playwright

### Documentation Phase
- `/mcp-write-docs` - Create comprehensive technical documentation with MkDocs Material

### Deployment Phase
- `/mcp-deploy` - Production deployment with CI/CD

## 🚀 Installation

> **Note:** Claude Code automatically discovers agents in subdirectories! Agents are identified by their `name:` in frontmatter, not by file path. See [INSTALLATION-GUIDE.md](./INSTALLATION-GUIDE.md) for details.

### Quick Install (Recommended)
```bash
# One-line remote installation (no git clone needed)
curl -fsSL https://raw.githubusercontent.com/rcdelacruz/mcp-sub-agents/main/install.sh | bash

# This will:
# 1. Auto-download the repository to a temp directory
# 2. Install all agents to ~/.claude/agents/
# 3. Install all commands to ~/.claude/commands/
# 4. Clean up temp files
```

### Manual Installation
```bash
# Clone the repository
git clone https://github.com/rcdelacruz/mcp-sub-agents.git
cd mcp-sub-agents

# Copy all agents (preserves subdirectories)
mkdir -p ~/.claude/agents
cp -r agents/* ~/.claude/agents/

# Copy workflow commands
mkdir -p ~/.claude/commands
cp -r .claude/commands/* ~/.claude/commands/

# Verify installation (should show 14 agents, 11 commands)
./verify-agents.sh
```

### Project-Specific Installation
```bash
# For project-specific agents and commands
mkdir -p .claude/agents .claude/commands
cp -r agents/* .claude/agents/
cp -r .claude/commands/* .claude/commands/

# Verify
ls -R .claude/agents/
ls .claude/commands/
```

> 📖 **Detailed Installation Guide:** See [INSTALLATION-GUIDE.md](./INSTALLATION-GUIDE.md) for troubleshooting, platform-specific notes, and more installation methods.

### Directory Structure
```
~/.claude/
├── agents/
│   ├── savants/
│   │   ├── fullstack-js-savant.md
│   │   └── java-spring-savant.md
│   ├── javascript/
│   │   ├── fullstack-nextjs.md
│   │   ├── frontend-ui.md
│   │   └── backend-api.md
│   └── cross-cutting/
│       ├── code-reviewer.md
│       ├── qa-tester.md
│       ├── performance.md
│       ├── security.md
│       ├── deployment.md
│       ├── monitoring.md
│       ├── architect.md
│       ├── database.md
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

## 💡 Usage

### Using Savant Agents (For Architecture & Complex Tasks)
```bash
# Use savant for architecture and technology decisions
Use fullstack-js-savant to design a real-time collaborative app

# Savant will:
# 1. Analyze requirements
# 2. Design architecture
# 3. Choose tech stack
# 4. Delegate to specialists for implementation
# 5. Review integration
```

### Using Specialist Agents (For Focused Implementation)
```bash
# Use specialists for specific implementation tasks
Use fullstack-nextjs to build the dashboard with Server Components
Use frontend-ui to create an accessible navigation menu with shadcn/ui
Use backend-api to create a tRPC router for posts
Use code-reviewer to review my authentication implementation
Use qa-tester to write E2E tests for the checkout flow
```

### Using Workflow Commands (For Guided Development)
```bash
# Follow structured development workflow
/mcp-design-nextjs           # Design Next.js application architecture
/mcp-implement-fullstack     # Implement feature end-to-end
/mcp-review-code            # Review code quality
/mcp-review-security        # Security audit
/mcp-qa-e2e                 # Write E2E tests
/mcp-deploy                 # Deploy to production
```

### Workflow Example: Building a Blog Feature
```bash
1. /mcp-design-nextjs
   → Design blog architecture (routes, components, data flow)

2. /mcp-implement-fullstack
   → Implement database schema
   → Create tRPC router
   → Build Server Components
   → Create UI with shadcn/ui

3. /mcp-review-code
   → Review code quality and best practices

4. /mcp-review-security
   → Audit authentication and input validation

5. /mcp-review-performance
   → Optimize Core Web Vitals

6. /mcp-qa-e2e
   → Write Playwright E2E tests

7. /mcp-write-docs
   → Create API docs, user guides, and README

8. /mcp-deploy
   → Deploy with CI/CD pipeline
```

## 📦 Agent Details

### 1. fullstack-nextjs
**Expertise:** Next.js 15+ development with App Router and Server Components

**Key Features:**
- Next.js 15 App Router patterns
- Server Components and Client Components
- Server Actions with progressive enhancement
- Streaming with Suspense
- Data fetching and caching strategies
- Metadata and SEO optimization
- Route Handlers and Middleware

**When to use:** Building any Next.js feature, routing, data fetching, or full-stack implementation

---

### 2. frontend-ui
**Expertise:** Modern UI/UX with shadcn/ui and accessibility

**Key Features:**
- shadcn/ui component integration
- Tailwind CSS responsive design
- Radix UI primitives
- Form design with react-hook-form + Zod
- Data tables with TanStack Table
- Accessibility (WCAG AA compliance)
- Dark mode implementation
- Framer Motion animations

**When to use:** Building UI components, forms, layouts, or ensuring accessibility

---

### 3. backend-api
**Expertise:** Type-safe APIs with tRPC and authentication

**Key Features:**
- tRPC end-to-end type safety
- REST API design with Route Handlers
- NextAuth.js v5 authentication
- OAuth providers (GitHub, Google)
- JWT and session management
- API middleware (rate limiting, CORS)
- Input validation with Zod

**When to use:** Creating APIs, implementing authentication, or setting up middleware

---

### 4. database
**Expertise:** PostgreSQL and Prisma ORM

**Key Features:**
- Prisma schema design
- Complex queries and relations
- Migrations and versioning
- Query optimization and indexing
- Transactions and batch operations
- N+1 query prevention
- Connection pooling
- Full-text search

**When to use:** Database design, schema migrations, query optimization, or data modeling

---

### 5. code-reviewer
**Expertise:** Code quality and best practices enforcement

**Key Features:**
- TypeScript type safety review
- React and Next.js best practices
- Server vs Client Component patterns
- Error handling patterns
- Security vulnerability detection
- Performance anti-patterns
- Code smell identification
- Refactoring suggestions

**When to use:** Reviewing code, ensuring quality, or getting refactoring recommendations

---

### 6. qa-tester
**Expertise:** Comprehensive testing strategies

**Key Features:**
- Playwright E2E testing
- Vitest unit and integration tests
- React Testing Library
- Server Actions testing
- Test coverage analysis
- Page Object Model patterns
- API testing
- Accessibility testing

**When to use:** Writing tests, improving coverage, or debugging test failures

---

### 7. performance
**Expertise:** Web performance optimization

**Key Features:**
- Core Web Vitals optimization (LCP, FID/INP, CLS)
- Bundle size reduction
- Code splitting and lazy loading
- Image optimization with next/image
- Font optimization with next/font
- Caching strategies (browser, CDN, server)
- Database query optimization
- Streaming and Suspense patterns

**When to use:** Improving performance metrics, reducing bundle size, or optimizing load times

---

### 8. security
**Expertise:** Application security and OWASP compliance

**Key Features:**
- OWASP Top 10 protection
- Authentication and authorization
- Input validation and sanitization
- XSS and CSRF prevention
- Security headers and CSP
- Encryption and password hashing
- Rate limiting
- Audit logging
- Multi-factor authentication

**When to use:** Implementing security features, reviewing vulnerabilities, or ensuring compliance

---

### 9. deployment
**Expertise:** Deployment and CI/CD pipelines

**Key Features:**
- Vercel deployment configuration
- Docker containerization
- Kubernetes orchestration
- GitHub Actions workflows
- Environment management
- Database migrations in CI/CD
- Blue-green deployments
- Rollback strategies
- Health checks

**When to use:** Setting up deployments, creating CI/CD pipelines, or configuring infrastructure

---

### 10. monitoring
**Expertise:** Observability and error tracking

**Key Features:**
- Sentry error tracking
- OpenTelemetry tracing
- Structured logging with Pino
- Metrics and dashboards
- Uptime monitoring
- Performance monitoring (APM)
- Real User Monitoring (RUM)
- Alerting and notifications
- Health checks

**When to use:** Setting up monitoring, tracking errors, or creating dashboards

---

### 11. architect
**Expertise:** System architecture and scalability

**Key Features:**
- Monolith vs microservices decisions
- Scalability patterns
- Design patterns (Repository, Service, Factory)
- Event-driven architecture
- Caching strategies (multi-layer)
- Database scaling (read replicas, sharding)
- API design (REST, tRPC, GraphQL)
- Resilience patterns (circuit breaker, retry)
- Future-proofing strategies

**When to use:** Designing architecture, planning scalability, or making technology decisions

---

### 12. tech-writer
**Expertise:** Technical documentation with MkDocs Material

**Key Features:**
- MkDocs Material documentation sites
- Professional styling with custom CSS
- API reference documentation
- User guides and tutorials
- README and architecture docs
- Mermaid diagrams for visualizations
- Code documentation with examples
- Deployment documentation
- Accessibility-first navigation

**When to use:** Creating documentation, API references, user guides, or MkDocs sites

## 🎓 Best Practices

### Agent Workflow Example
```
1. Use architect to design the system architecture
2. Use database to create the Prisma schema
3. Use fullstack-nextjs to build Server Components
4. Use frontend-ui to create the UI with shadcn/ui
5. Use backend-api to implement tRPC routes
6. Use security to add authentication and authorization
7. Use code-reviewer to review the implementation
8. Use qa-tester to write comprehensive tests
9. Use performance to optimize Core Web Vitals
10. Use deployment to set up CI/CD pipeline
11. Use monitoring to configure error tracking
```

### Tips for Effective Usage
- **Be specific** in your requests (mention frameworks, libraries, patterns)
- **Chain agents** for complex tasks (architect → database → fullstack-nextjs)
- **Use code-reviewer** proactively after implementing features
- **Leverage qa-tester** to maintain high test coverage
- **Apply security agent** early in development, not as an afterthought

## 🛠️ Tech Stack Covered

### Frontend
- Next.js 15+ (App Router)
- React 18+ (Server Components)
- TypeScript
- Tailwind CSS
- shadcn/ui
- Radix UI
- React Hook Form
- Zod
- TanStack Query
- Framer Motion

### Backend
- Next.js API Routes / Route Handlers
- tRPC
- NextAuth.js v5
- Server Actions

### Database
- PostgreSQL
- Prisma ORM
- Redis (caching)

### Testing
- Playwright
- Vitest
- React Testing Library

### DevOps
- Vercel
- Docker
- Kubernetes
- GitHub Actions
- Sentry
- OpenTelemetry

## 📊 Comparison with Original Agents

| Feature | Old Agents | New Agents |
|---------|-----------|------------|
| Focus | Infrastructure-heavy | Fullstack JavaScript |
| Next.js Version | Generic | Next.js 15+ specific |
| UI Framework | None | shadcn/ui + Tailwind |
| Database | Generic SQL | PostgreSQL + Prisma |
| Auth | Generic | NextAuth.js v5 |
| Testing | Minimal | Comprehensive (Playwright, Vitest) |
| Type Safety | Limited | End-to-end (tRPC + TypeScript) |
| Performance | Basic | Core Web Vitals focused |
| Quality Assurance | None | Code Review + QA Testing |

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## 📝 License

MIT License - feel free to use these agents in your projects.

## 👨‍💻 Author

**Ronald DC**
- GitHub: [@rcdelacruz](https://github.com/rcdelacruz)
- Email: rcdelacruz@gmail.com

---

**Built for modern fullstack JavaScript developers who want to build production-ready, enterprise-grade applications with Next.js.**

⭐ If you find these agents helpful, please star the repository!
