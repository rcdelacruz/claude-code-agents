# MCP Sub-Agents for Enterprise Next.js Development

A comprehensive collection of specialized Claude Code subagents for building production-ready, enterprise-grade Next.js applications with modern best practices.

## 🎯 Overview

This repository contains **12 expert subagents**, each specializing in a critical aspect of modern fullstack JavaScript development. These agents help you build scalable, secure, performant, and maintainable applications using Next.js 15+, React, TypeScript, PostgreSQL, Prisma, shadcn/ui, and the latest web development tools.

### 🛠️ **Development Agents**
1. **fullstack-nextjs** - Next.js 15, App Router, Server Components, Server Actions, Streaming
2. **frontend-ui** - shadcn/ui, Tailwind CSS, Radix UI, Accessibility, Responsive Design
3. **backend-api** - tRPC, REST APIs, NextAuth.js, Authentication, Middleware
4. **database** - PostgreSQL, Prisma ORM, Migrations, Query Optimization, Indexing

### ✅ **Quality Assurance Agents**
5. **code-reviewer** - Code Quality, Best Practices, Design Patterns, Refactoring
6. **qa-tester** - Playwright E2E, Vitest Unit Tests, React Testing Library, Coverage
7. **performance** - Core Web Vitals, Bundle Size, Caching, Image Optimization
8. **security** - OWASP Top 10, Authentication, Authorization, Input Validation

### 🚀 **Operations Agents**
9. **deployment** - Vercel, Docker, Kubernetes, GitHub Actions, CI/CD Pipelines
10. **monitoring** - Sentry, OpenTelemetry, Logging, Metrics, Alerting

### 🏗️ **Architecture Agent**
11. **architect** - System Design, Scalability, Design Patterns, Future-Proofing

### 📝 **Documentation Agent**
12. **tech-writer** - Technical Documentation, MkDocs Material, API Docs, User Guides

## 🚀 Installation

### Quick Install (Recommended)
```bash
# Run the installation script
curl -fsSL https://raw.githubusercontent.com/rcdelacruz/mcp-sub-agents/main/install.sh | bash
```

### Manual Installation
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

### Project-Specific Installation
```bash
# For project-specific agents
mkdir -p .claude/agents
cp agents/*.md .claude/agents/
```

## 💡 Usage

### Explicit Invocation
```
Use fullstack-nextjs to build the user dashboard with Server Components
Use frontend-ui to create an accessible navigation menu with shadcn/ui
Use database to design a scalable schema with Prisma
Use code-reviewer to review my authentication implementation
Use qa-tester to write E2E tests for the checkout flow
Use performance to optimize Core Web Vitals
Use security to implement OWASP-compliant authentication
Use deployment to set up CI/CD with GitHub Actions
Use monitoring to configure Sentry error tracking
Use backend-api to create a tRPC router for posts
Use architect to design a scalable multi-tenant architecture
Use tech-writer to create MkDocs documentation for the API
```

### Automatic Suggestion
Claude Code will automatically suggest the most appropriate subagent based on your request context.

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
