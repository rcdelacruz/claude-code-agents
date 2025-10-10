# Quick Start

Get started with MCP Sub-Agents in minutes. This guide walks you through your first workflows and basic usage patterns.

## Prerequisites

- Claude Code installed
- MCP Sub-Agents installed ([installation guide](installation.md))
- Basic understanding of Next.js and TypeScript

## Your First Workflow

Let's build a simple blog post feature using the two-tier agent system.

### Step 1: Architecture Design

Use a savant agent to design the architecture:

```bash
Use fullstack-js-savant to design a blog post feature with create, read, and list functionality
```

**What the savant will provide:**

- Database schema design
- API architecture decisions
- Component structure
- Authentication requirements
- Technology recommendations

**Expected output:**

```markdown
## Blog Feature Architecture

### Database Schema (Prisma)
- Post table with id, title, content, authorId, published, createdAt
- Relations to User table

### API Layer
- tRPC router for type-safe API
- Server Actions for mutations
- Route Handlers for REST endpoints (optional)

### Frontend Components
- Server Components for listing and displaying posts
- Client Components for interactive forms
- Optimistic updates for better UX

### Pages Structure
- /blog - List all posts (Server Component)
- /blog/[slug] - Single post page (Server Component)
- /blog/new - Create post form (Client Component)
```

### Step 2: Implement Database Schema

Use the database specialist:

```bash
Use database to implement the blog post Prisma schema with User relation
```

**What you'll get:**

```prisma
// prisma/schema.prisma
model Post {
  id          String   @id @default(cuid())
  title       String
  slug        String   @unique
  content     String   @db.Text
  excerpt     String?
  published   Boolean  @default(false)
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  authorId    String
  author      User     @relation(fields: [authorId], references: [id])

  @@index([authorId])
  @@index([published])
}
```

### Step 3: Build the UI

Use the frontend-ui specialist:

```bash
Use frontend-ui to create a blog post form with shadcn/ui using react-hook-form and Zod validation
```

**What you'll get:**

- Form component with shadcn/ui
- Zod validation schema
- Accessible form fields
- Loading and error states
- Responsive design

### Step 4: Create the API

Use the backend-api specialist:

```bash
Use backend-api to create a tRPC router for blog posts with create, list, and get by slug
```

**What you'll get:**

- Type-safe tRPC router
- Input validation with Zod
- Authorization checks
- Error handling

### Step 5: Code Review

Use the code-reviewer specialist:

```bash
Use code-reviewer to review my blog post implementation for best practices and security
```

**What you'll get:**

- Code quality assessment
- Security vulnerability checks
- Performance recommendations
- Best practice suggestions
- Refactoring opportunities

## Using Workflow Commands

For a more guided experience, use workflow commands:

### Design Phase

```bash
/mcp-design-nextjs
```

This command will guide you through:

1. Requirements analysis
2. Route structure planning
3. Component hierarchy design
4. Data flow architecture
5. API design
6. Authentication planning

**Time:** 20-30 minutes

### Implementation Phase

```bash
/mcp-implement-fullstack
```

This command orchestrates:

1. Database schema creation
2. API implementation
3. Server Component development
4. Client Component creation
5. Integration testing

**Time:** 60-90 minutes

### Review Phase

```bash
/mcp-review-code
```

Comprehensive code review covering:

- Architecture patterns
- Type safety
- Security issues
- Performance problems
- Code quality

**Time:** 15-25 minutes

### QA Phase

```bash
/mcp-qa-e2e
```

Creates E2E tests with Playwright:

- Critical user flows
- Authentication tests
- CRUD operations
- Error handling
- Edge cases

**Time:** 45-60 minutes

## Common Usage Patterns

### Pattern 1: Quick Implementation

For experienced developers who know what they want:

```bash
# Direct specialist usage
Use fullstack-nextjs to build a user profile page with Server Components
Use frontend-ui to create a settings form with shadcn/ui
Use backend-api to add a PUT /api/user endpoint
```

### Pattern 2: Guided Development

For learning or ensuring best practices:

```bash
# Use workflow commands
/mcp-design-nextjs          # Plan first
/mcp-implement-frontend     # Build step-by-step
/mcp-review-code           # Ensure quality
```

### Pattern 3: Architecture-First

For complex features:

```bash
# Start with savant
Use fullstack-js-savant to design a real-time chat system

# Implement with specialists
Use backend-api to implement WebSocket server
Use frontend-ui to create chat UI components
Use database to design message storage

# Review with specialists
Use security to audit the chat implementation
Use performance to optimize real-time updates
```

### Pattern 4: Problem-Solving

For debugging or optimization:

```bash
# Identify issues
Use code-reviewer to find issues in my authentication flow
Use performance to analyze slow database queries

# Fix issues
Use backend-api to optimize the query
Use security to fix authentication vulnerabilities

# Verify fixes
Use qa-tester to write tests for the fixed code
```

## Example Workflows

### Building a Login System

```bash
# 1. Architecture
Use fullstack-js-savant to design authentication with NextAuth.js and GitHub OAuth

# 2. Implementation
Use backend-api to implement NextAuth.js configuration
Use frontend-ui to create login and signup forms

# 3. Security Review
/mcp-review-security

# 4. Testing
Use qa-tester to write E2E tests for authentication flow
```

### Creating a Dashboard

```bash
# 1. Design
/mcp-design-nextjs

# 2. Build Components
Use fullstack-nextjs to create the dashboard layout with App Router
Use frontend-ui to build data visualization components with charts

# 3. Add Data Layer
Use database to create analytics schema
Use backend-api to create analytics API endpoints

# 4. Review
/mcp-review-code
/mcp-review-performance
```

### Optimizing Performance

```bash
# 1. Audit
/mcp-review-performance

# 2. Fix Issues
Use fullstack-nextjs to implement Suspense and streaming
Use performance to optimize Core Web Vitals
Use database to add database indexes

# 3. Verify
/mcp-review-performance
```

## Understanding Agent Responses

### Savant Responses

Savants provide:

- High-level architecture decisions
- Technology comparisons and recommendations
- Integration guidance
- When to use which specialist
- Best practices for the ecosystem

**Example response structure:**

```markdown
## Architecture Recommendation

### Technology Stack
- Next.js 15 with App Router
- PostgreSQL with Prisma
- NextAuth.js for authentication
- tRPC for API layer

### Reasoning
[Detailed explanation of why each technology was chosen]

### Implementation Plan
1. Database schema design
2. Authentication setup
3. API layer creation
4. Frontend implementation

### Delegation Strategy
- Use database specialist for Prisma schema
- Use backend-api for tRPC routers
- Use frontend-ui for components
```

### Specialist Responses

Specialists provide:

- Detailed implementation code
- Framework-specific patterns
- Configuration files
- Testing examples
- Best practices for their domain

**Example response structure:**

```markdown
## Implementation

### Code
[Complete, production-ready code]

### Explanation
[How the code works]

### Best Practices
[Domain-specific best practices]

### Testing
[How to test this implementation]

### Next Steps
[What to do after implementation]
```

### Workflow Command Responses

Workflow commands provide:

- Step-by-step checklists
- Guided questions
- Code examples
- Links to relevant documentation
- Next phase recommendations

## Tips for Effective Usage

### 1. Be Specific

**Good:**
```bash
Use frontend-ui to create a multi-step form with validation using react-hook-form and Zod
```

**Not as good:**
```bash
Use frontend-ui to create a form
```

### 2. Provide Context

**Good:**
```bash
Use backend-api to add authentication to the posts API. Users should only be able to edit their own posts.
```

**Not as good:**
```bash
Use backend-api to add authentication
```

### 3. Chain Agents for Complex Tasks

```bash
# First, design
Use architect to design a scalable notification system

# Then, implement
Use backend-api to implement the notification API
Use frontend-ui to create notification UI components
Use database to design notification storage

# Finally, ensure quality
Use code-reviewer to review the implementation
Use qa-tester to write comprehensive tests
```

### 4. Use Workflow Commands for Learning

If you're new to a pattern or technology, use workflow commands:

```bash
/mcp-implement-fullstack  # Provides step-by-step guidance
```

If you're experienced, use direct agent invocation:

```bash
Use fullstack-nextjs to build the feature  # Faster for experts
```

### 5. Review Proactively

Don't wait until the end to review:

```bash
# After each major feature
/mcp-review-code
/mcp-review-security

# Before deployment
/mcp-review-performance
/mcp-deploy
```

## Common Commands Reference

### Design Commands

```bash
/mcp-design-architecture    # General system architecture
/mcp-design-nextjs         # Next.js specific design
```

### Implementation Commands

```bash
/mcp-implement-fullstack   # Complete feature end-to-end
/mcp-implement-frontend    # UI components and client features
/mcp-implement-backend     # API and business logic
```

### Review Commands

```bash
/mcp-review-code           # Code quality review
/mcp-review-security       # Security audit
/mcp-review-performance    # Performance optimization
```

### QA and Deployment

```bash
/mcp-qa-e2e               # End-to-end testing
/mcp-write-docs           # Technical documentation
/mcp-deploy               # Production deployment
```

## Next Steps

Now that you understand the basics:

1. [Learn about the architecture](../architecture/overview.md)
2. [Explore workflow commands in detail](../architecture/workflow-commands.md)
3. [Read best practices](../guides/best-practices.md)
4. [View real-world workflows](../guides/workflows.md)
5. [Explore individual agents](../agents/savants.md)

## Getting Help

- [FAQ](../faq.md) - Common questions
- [Best Practices](../guides/best-practices.md) - Effective patterns
- [GitHub Issues](https://github.com/rcdelacruz/mcp-sub-agents/issues) - Report problems
