# Hybrid Workflow Commands Reference

This guide explains the hybrid slash commands that combine development workflow stages with technology expertise.

## Overview

Workflow commands provide **structured, guided development** through each stage of the software development lifecycle. Each command invokes the appropriate agents and provides checklists, best practices, and step-by-step guidance.

## Command Structure

```
/[stage]-[technology]
```

Examples:
- `/design-architecture` - General architecture design
- `/design-nextjs` - Next.js-specific design
- `/implement-fullstack` - Full-stack implementation
- `/review-security` - Security-focused review

## Complete Command Reference

### 🎨 Design Phase

#### `/design-architecture`
**Use when:** Starting a new project or major feature
**Invokes:** `architect` agent
**Output:** Architecture design document with diagrams, technology stack, ADRs

**Covers:**
- Requirements analysis
- System architecture design
- Technology selection
- Scalability planning
- Documentation

**Time:** 30-45 mins

#### `/design-nextjs`
**Use when:** Designing a Next.js application structure
**Invokes:** `fullstack-js-savant` agent
**Output:** Next.js project structure, routing plan, data flow diagrams

**Covers:**
- App Router structure
- Server/Client Component strategy
- Data fetching patterns
- API layer design
- Authentication flow
- UI component hierarchy
- Performance planning

**Time:** 20-30 mins

### 💻 Implementation Phase

#### `/implement-fullstack`
**Use when:** Building a complete feature end-to-end
**Invokes:** Multiple agents orchestrated by `fullstack-js-savant`
**Output:** Complete feature implementation (DB → API → Server Components → UI)

**Workflow:**
1. Database schema (with `database` agent)
2. Backend API (with `backend-api` agent)
3. Server Components & Actions (with `fullstack-nextjs` agent)
4. UI Components (with `frontend-ui` agent)
5. Integration & testing
6. Security review

**Time:** 60-90 mins

#### `/implement-frontend`
**Use when:** Building UI components and client-side features
**Invokes:** `frontend-ui` agent
**Output:** React components with shadcn/ui, forms, interactions

**Covers:**
- Component planning (Server vs Client)
- shadcn/ui installation
- Form components with react-hook-form + Zod
- Display components
- Client-side features (optimistic updates, pagination)
- Responsive design
- Accessibility (WCAG AA)
- Animations & polish

**Time:** 30-45 mins

#### `/implement-backend`
**Use when:** Building APIs, business logic, and data layer
**Invokes:** `backend-api` and `database` agents
**Output:** tRPC routers or Route Handlers, Server Actions, business logic

**Covers:**
- Database schema with Prisma
- Input validation with Zod
- tRPC routers OR Route Handlers
- Server Actions for mutations
- Business logic layer
- Error handling
- Authorization checks

**Time:** 30-45 mins

### 🔍 Review Phase

#### `/review-code`
**Use when:** After implementing features, before merging
**Invokes:** `code-reviewer` agent
**Output:** Code quality report with issues, improvements, and approval status

**Reviews:**
- Architecture (Component patterns, data flow)
- TypeScript (Type safety, no `any`)
- React/Next.js best practices
- Security (Authentication, input validation)
- Performance (N+1 queries, memoization)
- Error handling
- Code quality (DRY, clean code)

**Time:** 15-25 mins

#### `/review-security`
**Use when:** Before deploying to production, or after auth changes
**Invokes:** `security` agent
**Output:** Security audit report with critical/high/medium issues

**Audits:**
- OWASP Top 10 compliance
- Authentication & authorization
- Input validation & sanitization
- Cryptographic failures
- Security misconfiguration
- Vulnerable dependencies
- Logging & monitoring
- Data protection

**Time:** 30-45 mins

#### `/review-performance`
**Use when:** Performance issues or before major releases
**Invokes:** `performance` agent
**Output:** Performance audit with Core Web Vitals scores and optimization recommendations

**Analyzes:**
- Core Web Vitals (LCP, FID/INP, CLS)
- Bundle size
- Database queries (N+1 prevention)
- Caching strategy
- Image optimization
- Font optimization
- Code splitting & lazy loading
- Runtime performance

**Time:** 20-30 mins

### ✅ QA Phase

#### `/qa-e2e`
**Use when:** Need end-to-end tests for critical user flows
**Invokes:** `qa-tester` agent
**Output:** Playwright E2E tests with Page Object Model

**Creates:**
- Test planning (critical flows, scenarios)
- Playwright setup
- Page Object Model
- Authentication helpers
- E2E tests (auth, CRUD, forms, errors)
- Test data management
- Running instructions

**Time:** 45-60 mins

### 📝 Documentation Phase

#### `/write-docs`
**Use when:** Need comprehensive technical documentation
**Invokes:** `tech-writer` agent
**Output:** Professional documentation with MkDocs Material, README, API docs, user guides

**Creates:**
- Documentation planning (README, API, guides)
- MkDocs Material setup
- README.md with quick start
- API reference documentation
- User guides and tutorials
- Architecture documentation
- Deployment documentation

**Covers:**
- README.md creation
- MkDocs Material configuration
- API documentation (REST/tRPC)
- Getting started guides
- Tutorials and how-tos
- Architecture diagrams (Mermaid)
- Build and deployment

**Time:** 60-90 mins

### 🚀 Deployment Phase

#### `/deploy`
**Use when:** Ready to deploy to production
**Invokes:** `deployment` agent
**Output:** Production deployment with CI/CD pipeline

**Handles:**
- Pre-deployment checklist
- Database migrations
- Vercel deployment (recommended)
- GitHub Actions CI/CD
- Docker deployment (alternative)
- Post-deployment verification
- Rollback plan
- Monitoring setup

**Time:** 30-45 mins

## Workflow Patterns

### Pattern 1: New Feature Development
```bash
/design-nextjs              # Design the feature
/implement-fullstack        # Build it end-to-end
/review-code               # Review quality
/review-security           # Audit security
/qa-e2e                    # Write tests
/write-docs                # Document the feature
```

### Pattern 2: Frontend-Only Feature
```bash
/design-nextjs              # Design UI structure
/implement-frontend         # Build components
/review-code               # Review quality
/qa-e2e                    # Write tests
```

### Pattern 3: Backend API Development
```bash
/design-architecture        # Design API architecture
/implement-backend          # Build API
/review-code               # Review quality
/review-security           # Security audit
```

### Pattern 4: New Project Setup
```bash
/design-architecture        # System architecture
/design-nextjs             # Next.js structure
/implement-fullstack       # Build initial features
/review-code              # Review quality
/review-security          # Security audit
/review-performance       # Performance check
/qa-e2e                   # Write tests
/write-docs               # Create comprehensive docs
/deploy                   # Deploy to production
```

### Pattern 5: Performance Optimization
```bash
/review-performance        # Identify issues
/implement-frontend        # Optimize UI (if needed)
/implement-backend         # Optimize queries (if needed)
/review-performance        # Verify improvements
```

### Pattern 6: Security Hardening
```bash
/review-security           # Audit current state
/implement-backend         # Fix backend issues
/implement-frontend        # Fix frontend issues
/review-security          # Re-audit
```

## Best Practices

### When to Use Commands vs Direct Agent Invocation

**Use Workflow Commands When:**
- ✅ You want structured, step-by-step guidance
- ✅ You're new to a technology or pattern
- ✅ You want comprehensive checklists
- ✅ You're building a complete feature
- ✅ You want to ensure nothing is missed

**Use Direct Agent Invocation When:**
- ✅ You need quick, specific help
- ✅ You know exactly what you need
- ✅ You're experienced with the workflow
- ✅ You're fixing a small issue
- ✅ You're exploring or prototyping

### Command Sequencing

**✅ Good Sequencing:**
```bash
/design-nextjs → /implement-fullstack → /review-code
```
(Design first, implement, then review)

**❌ Poor Sequencing:**
```bash
/implement-fullstack → /design-nextjs
```
(Don't implement before designing)

### Iterative Development

Commands can be run multiple times:
```bash
/implement-frontend        # First iteration
/review-code              # Find issues
/implement-frontend        # Fix issues
/review-code              # Verify fixes
```

## Tips for Effective Usage

1. **Read the Checklist** - Each command provides a comprehensive checklist
2. **Follow the Time Estimates** - Budget appropriate time
3. **Use Multiple Review Commands** - Security, performance, and code quality are all important
4. **Run Tests After Implementation** - Use `/qa-e2e` after `/implement-*` commands
5. **Document as You Go** - Use agents to generate documentation during development
6. **Deploy Early and Often** - Use `/deploy` to set up CI/CD early

## Customization

You can create your own workflow commands by adding markdown files to `.claude/commands/`:

```markdown
---
description: Your custom workflow command
---

Your workflow steps here...
```

See existing commands in `.claude/commands/` for examples.

## Related Documentation

- [SAVANT-ARCHITECTURE.md](./SAVANT-ARCHITECTURE.md) - Learn about savant vs specialist agents
- [README.md](./README.md) - Main documentation
- [agents/](./agents/) - Individual agent documentation

## Support

For issues or questions:
- GitHub Issues: https://github.com/rcdelacruz/mcp-sub-agents/issues
- Read agent documentation in `agents/` directories
