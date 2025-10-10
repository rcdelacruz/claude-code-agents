# Workflow Commands

Workflow commands provide structured, step-by-step guidance through each stage of the software development lifecycle. Each command invokes appropriate agents and provides checklists, best practices, and comprehensive guidance.

## Command Structure

All workflow commands follow this pattern:

```
/mcp-[stage]-[technology]
```

Examples:

- `/mcp-design-architecture` - General architecture design
- `/mcp-design-nextjs` - Next.js-specific design
- `/mcp-implement-fullstack` - Full-stack implementation
- `/mcp-review-security` - Security-focused review

## Complete Command Reference

### Design Phase

#### /mcp-design-architecture

**Purpose:** Design system architecture and make high-level technical decisions

**Invokes:** `architect` agent

**Time:** 30-45 minutes

**Covers:**

- Requirements analysis
- System architecture design
- Technology stack selection
- Scalability planning
- Security considerations
- Documentation generation

**Output:**

- Architecture diagrams
- Technology stack decisions
- Architecture Decision Records (ADRs)
- Component diagrams
- Integration patterns

**Use when:**

- Starting a new project
- Adding major features
- Refactoring architecture
- Making technology decisions

#### /mcp-design-nextjs

**Purpose:** Design Next.js application structure with modern patterns

**Invokes:** `fullstack-js-savant` agent

**Time:** 20-30 minutes

**Covers:**

- App Router structure and organization
- Server vs Client Component strategy
- Data fetching patterns
- API layer design (tRPC vs Route Handlers)
- Authentication flow
- UI component hierarchy
- Performance planning
- SEO considerations

**Output:**

- File structure plan
- Route organization
- Component hierarchy
- Data flow diagrams
- API contract definitions

**Use when:**

- Starting a Next.js project
- Planning new features
- Refactoring application structure
- Optimizing architecture

### Implementation Phase

#### /mcp-implement-fullstack

**Purpose:** Build complete features end-to-end with full-stack orchestration

**Invokes:** Multiple agents orchestrated by `fullstack-js-savant`

**Time:** 60-90 minutes

**Workflow:**

1. Database schema design (with `database` agent)
2. Backend API implementation (with `backend-api` agent)
3. Server Components creation (with `fullstack-nextjs` agent)
4. UI components development (with `frontend-ui` agent)
5. Integration and testing
6. Security review

**Covers:**

- Prisma schema and migrations
- tRPC routers or Route Handlers
- Server Actions for mutations
- Server Components for data fetching
- Client Components for interactivity
- Form handling with validation
- Error handling
- Loading states

**Use when:**

- Building complete features
- Need end-to-end implementation
- Want orchestrated development
- Learning full-stack patterns

#### /mcp-implement-frontend

**Purpose:** Build UI components and client-side features

**Invokes:** `frontend-ui` agent

**Time:** 30-45 minutes

**Covers:**

- Component planning (Server vs Client)
- shadcn/ui component installation
- Form components with react-hook-form and Zod
- Display components and layouts
- Client-side features (optimistic updates, pagination)
- Responsive design
- Accessibility (WCAG AA compliance)
- Animations and polish

**Output:**

- React components
- Form validation schemas
- Responsive layouts
- Accessibility features
- Loading and error states

**Use when:**

- Building UI components
- Creating forms
- Implementing client features
- Ensuring accessibility

#### /mcp-implement-backend

**Purpose:** Build APIs, business logic, and data layer

**Invokes:** `backend-api` and `database` agents

**Time:** 30-45 minutes

**Covers:**

- Database schema with Prisma
- Input validation with Zod
- tRPC routers OR Route Handlers
- Server Actions for mutations
- Business logic layer
- Error handling
- Authorization checks
- Query optimization

**Output:**

- Prisma schema
- API endpoints (tRPC or REST)
- Server Actions
- Validation schemas
- Authorization middleware

**Use when:**

- Creating APIs
- Implementing business logic
- Database operations
- Authentication/authorization

### Review Phase

#### /mcp-review-code

**Purpose:** Comprehensive code quality review

**Invokes:** `code-reviewer` agent

**Time:** 15-25 minutes

**Reviews:**

- **Architecture**
    - Component patterns
    - Data flow
    - Separation of concerns
    - Server vs Client components

- **TypeScript**
    - Type safety
    - No `any` usage
    - Proper interfaces
    - Generic usage

- **React/Next.js Best Practices**
    - Hook rules
    - Component composition
    - Performance patterns
    - Caching strategies

- **Security**
    - Authentication checks
    - Input validation
    - XSS prevention
    - CSRF protection

- **Performance**
    - N+1 query prevention
    - Unnecessary re-renders
    - Code splitting
    - Caching

- **Error Handling**
    - Try-catch blocks
    - Error boundaries
    - User-friendly messages
    - Logging

- **Code Quality**
    - DRY principle
    - Clean code
    - Naming conventions
    - Comments

**Output:**

- Issues list with severity
- Improvement suggestions
- Refactoring recommendations
- Approval status

**Use when:**

- After implementing features
- Before merging PRs
- Ensuring code quality
- Learning best practices

#### /mcp-review-security

**Purpose:** Security audit based on OWASP Top 10

**Invokes:** `security` agent

**Time:** 30-45 minutes

**Audits:**

- **OWASP Top 10 Compliance**
    - Broken Access Control
    - Cryptographic Failures
    - Injection
    - Insecure Design
    - Security Misconfiguration
    - Vulnerable Components
    - Authentication Failures
    - Software and Data Integrity Failures
    - Security Logging Failures
    - Server-Side Request Forgery

- **Authentication & Authorization**
    - Session management
    - Password security
    - OAuth implementation
    - JWT validation
    - Role-based access control

- **Input Validation**
    - SQL injection prevention
    - XSS prevention
    - Command injection
    - Path traversal

- **Data Protection**
    - Encryption at rest
    - Encryption in transit
    - Sensitive data exposure
    - PII handling

**Output:**

- Security issues by severity (Critical, High, Medium, Low)
- Remediation steps
- Code examples for fixes
- Compliance checklist

**Use when:**

- Before production deployment
- After authentication changes
- Regular security audits
- Compliance requirements

#### /mcp-review-performance

**Purpose:** Performance audit and Core Web Vitals optimization

**Invokes:** `performance` agent

**Time:** 20-30 minutes

**Analyzes:**

- **Core Web Vitals**
    - Largest Contentful Paint (LCP)
    - First Input Delay (FID) / Interaction to Next Paint (INP)
    - Cumulative Layout Shift (CLS)

- **Bundle Size**
    - JavaScript bundle analysis
    - CSS bundle size
    - Third-party dependencies
    - Code splitting opportunities

- **Database Performance**
    - Query optimization
    - N+1 query detection
    - Index recommendations
    - Connection pooling

- **Caching Strategy**
    - Browser caching
    - CDN caching
    - Server-side caching
    - Redis usage

- **Image Optimization**
    - Image format recommendations
    - Lazy loading
    - Responsive images
    - next/image usage

- **Font Optimization**
    - Font loading strategy
    - next/font usage
    - Font subsetting

- **Code Splitting**
    - Dynamic imports
    - Route-based splitting
    - Component lazy loading

**Output:**

- Performance scores
- Bottleneck identification
- Optimization recommendations
- Implementation examples

**Use when:**

- Performance issues detected
- Before major releases
- Regular optimization cycles
- Improving user experience

### QA Phase

#### /mcp-qa-e2e

**Purpose:** Create comprehensive end-to-end tests with Playwright

**Invokes:** `qa-tester` agent

**Time:** 45-60 minutes

**Creates:**

- **Test Planning**
    - Critical user flows
    - Test scenarios
    - Edge cases
    - Error conditions

- **Playwright Setup**
    - Configuration
    - Browser setup
    - Test utilities
    - CI integration

- **Page Object Model**
    - Page objects
    - Locator strategies
    - Reusable components
    - Helper methods

- **Authentication Helpers**
    - Login utilities
    - Session management
    - Role-based testing
    - Token handling

- **E2E Tests**
    - Authentication flows
    - CRUD operations
    - Form submissions
    - Error handling
    - Edge cases

- **Test Data Management**
    - Test fixtures
    - Database seeding
    - Cleanup strategies

**Output:**

- Playwright configuration
- Page object models
- Test suites
- CI/CD integration
- Running instructions

**Use when:**

- Need automated testing
- Testing critical flows
- Regression prevention
- CI/CD pipeline setup

### Documentation Phase

#### /mcp-write-docs

**Purpose:** Create comprehensive technical documentation

**Invokes:** `tech-writer` agent

**Time:** 60-90 minutes

**Creates:**

- **Documentation Planning**
    - README structure
    - API documentation
    - User guides
    - Architecture docs

- **MkDocs Material Setup**
    - Configuration
    - Theme customization
    - Navigation structure
    - Search setup

- **README.md**
    - Project overview
    - Quick start
    - Installation
    - Usage examples

- **API Reference**
    - Endpoint documentation
    - Request/response examples
    - Error codes
    - Authentication

- **User Guides**
    - Getting started
    - Feature tutorials
    - How-to guides
    - Troubleshooting

- **Architecture Documentation**
    - System diagrams (Mermaid)
    - Component diagrams
    - Data flow
    - Deployment architecture

**Output:**

- Complete documentation site
- README.md
- API reference
- User guides
- Architecture docs

**Use when:**

- Documenting projects
- Creating API docs
- Building documentation sites
- Onboarding documentation

### Deployment Phase

#### /mcp-deploy

**Purpose:** Production deployment with CI/CD pipeline

**Invokes:** `deployment` agent

**Time:** 30-45 minutes

**Handles:**

- **Pre-deployment Checklist**
    - Environment variables
    - Database migrations
    - Build verification
    - Security audit

- **Vercel Deployment** (Recommended)
    - Project setup
    - Environment configuration
    - Domain setup
    - Preview deployments

- **Docker Deployment** (Alternative)
    - Dockerfile creation
    - Docker Compose
    - Multi-stage builds
    - Container registry

- **GitHub Actions CI/CD**
    - Workflow configuration
    - Build pipeline
    - Test automation
    - Deployment automation

- **Database Migrations**
    - Migration strategy
    - Rollback plan
    - Zero-downtime migrations
    - Data validation

- **Post-deployment**
    - Verification steps
    - Smoke tests
    - Monitoring setup
    - Rollback procedure

**Output:**

- Deployment configuration
- CI/CD pipelines
- Environment setup
- Deployment documentation
- Rollback procedures

**Use when:**

- Deploying to production
- Setting up CI/CD
- Infrastructure as code
- Automation setup

## Workflow Patterns

### Pattern 1: New Feature Development

Complete feature from design to deployment:

```bash
/mcp-design-nextjs              # Design architecture
/mcp-implement-fullstack        # Build feature
/mcp-review-code               # Review quality
/mcp-review-security           # Security audit
/mcp-qa-e2e                    # Write tests
/mcp-write-docs                # Document feature
/mcp-deploy                    # Deploy to production
```

**Time:** 4-6 hours

### Pattern 2: Frontend-Only Feature

UI-focused development:

```bash
/mcp-design-nextjs              # Plan UI structure
/mcp-implement-frontend         # Build components
/mcp-review-code               # Review quality
/mcp-qa-e2e                    # Test UI flows
```

**Time:** 2-3 hours

### Pattern 3: Backend API Development

API-focused development:

```bash
/mcp-design-architecture        # Design API architecture
/mcp-implement-backend          # Build API
/mcp-review-code               # Review quality
/mcp-review-security           # Security audit
```

**Time:** 2-3 hours

### Pattern 4: Performance Optimization

Optimize existing application:

```bash
/mcp-review-performance        # Identify issues
/mcp-implement-frontend        # Optimize UI (if needed)
/mcp-implement-backend         # Optimize queries (if needed)
/mcp-review-performance        # Verify improvements
```

**Time:** 2-4 hours

### Pattern 5: Security Hardening

Security improvement cycle:

```bash
/mcp-review-security           # Audit current state
/mcp-implement-backend         # Fix backend issues
/mcp-implement-frontend        # Fix frontend issues
/mcp-review-security          # Re-audit
/mcp-qa-e2e                   # Test security features
```

**Time:** 3-4 hours

## Command Sequencing Best Practices

### Good Sequencing

Always design before implementing:

```bash
# Good
/mcp-design-nextjs
/mcp-implement-fullstack
/mcp-review-code

# Not ideal
/mcp-implement-fullstack    # Implementing without design
/mcp-design-nextjs         # Design should come first
```

### Iterative Development

Commands can be run multiple times:

```bash
/mcp-implement-frontend        # First iteration
/mcp-review-code              # Find issues
/mcp-implement-frontend        # Fix issues
/mcp-review-code              # Verify fixes
```

### Multi-Review Approach

Use multiple review commands:

```bash
/mcp-implement-fullstack       # Implementation
/mcp-review-code              # Code quality
/mcp-review-security          # Security
/mcp-review-performance       # Performance
```

## Tips for Effective Usage

### 1. Read the Checklist

Each command provides comprehensive checklists. Review them before starting.

### 2. Budget Time

Commands include time estimates. Plan accordingly.

### 3. Follow the Flow

Use commands in logical sequence (design → implement → review → test → deploy).

### 4. Iterate as Needed

Don't hesitate to repeat commands to improve quality.

### 5. Combine with Direct Invocation

Mix workflow commands with direct agent invocation:

```bash
/mcp-implement-fullstack       # Guided implementation
Use performance to optimize specific query  # Direct optimization
/mcp-review-code              # Final review
```

## When to Use Commands vs Direct Agent Invocation

### Use Workflow Commands When:

- Learning new patterns or technologies
- Want comprehensive checklists
- Ensuring nothing is missed
- Need structured guidance
- Building complete features
- Onboarding new developers

### Use Direct Agent Invocation When:

- Quick, specific tasks
- Experienced with the workflow
- Know exactly what's needed
- Small fixes or changes
- Prototyping or exploring

## Customization

You can create custom workflow commands by adding markdown files to `.claude/commands/`:

```markdown
---
description: Your custom workflow command
---

# Custom Workflow

Your step-by-step guidance here...

## Checklist

- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

## Agents to Use

- Use agent-name for specific task
```

See existing commands in `.claude/commands/` for examples.

## Summary

Workflow commands provide:

- **Structure**: Step-by-step guidance
- **Completeness**: Comprehensive checklists
- **Quality**: Built-in best practices
- **Efficiency**: Faster than manual steps
- **Learning**: Educational for new patterns

## Next Steps

- [View workflow examples](../guides/workflows.md)
- [Learn best practices](../guides/best-practices.md)
- [Explore agents](../agents/savants.md)
- [See architecture overview](overview.md)
