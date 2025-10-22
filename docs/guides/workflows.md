# Workflow Examples

This guide provides real-world workflow examples showing how to use Claude Code Agents effectively for common development tasks.

## Building a Blog Feature

Complete end-to-end blog feature with posts, comments, and likes.

### Step 1: Design Architecture

```bash
/workflow-design-nextjs
```

**Questions to answer:**

- Where will blog routes live? (`/blog`, `/blog/[slug]`, `/blog/new`)
- Server or Client Components for each page?
- tRPC or Route Handlers for API?
- How to handle authentication?

**Output:**

- Route structure plan
- Component hierarchy
- Data flow diagrams
- API design

**Time:** 20-30 minutes

### Step 2: Create Database Schema

```bash
Use database to create a blog schema with Post, Comment, and Like models related to User
```

**Implementation:**

```prisma
model Post {
  id        String    @id @default(cuid())
  title     String
  slug      String    @unique
  content   String    @db.Text
  excerpt   String?
  published Boolean   @default(false)
  authorId  String
  author    User      @relation(fields: [authorId], references: [id])
  comments  Comment[]
  likes     Like[]
  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt

  @@index([authorId])
  @@index([published])
  @@index([createdAt])
}
```

**Time:** 15-20 minutes

### Step 3: Implement Backend API

```bash
Use backend-api to create a tRPC router for blog posts with CRUD operations and authorization
```

**Features:**

- List posts (public)
- Get post by slug (public)
- Create post (authenticated)
- Update post (owner only)
- Delete post (owner only)

**Time:** 30-45 minutes

### Step 4: Build Server Components

```bash
Use fullstack-nextjs to create blog listing and detail pages with Server Components
```

**Pages:**

- `/blog` - List all published posts
- `/blog/[slug]` - Single post view

**Time:** 20-30 minutes

### Step 5: Create UI Components

```bash
Use frontend-ui to create blog post forms and comment sections with shadcn/ui
```

**Components:**

- Create post form with rich text editor
- Comment submission form
- Like button with optimistic updates

**Time:** 30-45 minutes

### Step 6: Review and Test

```bash
/workflow-review-code
/workflow-review-security
/workflow-qa-e2e
```

**Reviews:**

- Code quality check
- Security audit (input validation, authorization)
- E2E tests for critical flows

**Time:** 45-60 minutes

### Total Time: 3-4 hours

---

## Adding Authentication

Implement complete authentication system with email/password and OAuth.

### Step 1: Design Authentication Flow

```bash
Use fullstack-js-savant to design authentication with NextAuth.js supporting email/password and GitHub OAuth
```

**Decisions:**

- NextAuth.js v5 configuration
- Session vs JWT strategy
- Protected route middleware
- OAuth provider setup

**Time:** 15-20 minutes

### Step 2: Implement NextAuth.js

```bash
Use backend-api to implement NextAuth.js with email credentials and GitHub OAuth provider
```

**Configuration:**

- Auth.js v5 setup
- Prisma adapter
- Email provider
- GitHub OAuth
- Protected API routes

**Time:** 30-40 minutes

### Step 3: Build Auth UI

```bash
Use frontend-ui to create login, signup, and profile pages with shadcn/ui
```

**Pages:**

- Login form
- Signup form
- Password reset
- User profile

**Time:** 30-45 minutes

### Step 4: Add Protected Routes

```bash
Use fullstack-nextjs to implement middleware for protecting routes and pages
```

**Implementation:**

- Middleware configuration
- Redirect logic
- Session handling

**Time:** 15-20 minutes

### Step 5: Security Review

```bash
/workflow-review-security
```

**Focus areas:**

- Password hashing
- CSRF protection
- Session management
- OAuth implementation

**Time:** 20-30 minutes

### Total Time: 2-3 hours

---

## Performance Optimization

Optimize an existing application for better Core Web Vitals.

### Step 1: Performance Audit

```bash
/workflow-review-performance
```

**Analysis:**

- Core Web Vitals scores
- Bundle size analysis
- Database query performance
- Caching effectiveness

**Time:** 20-30 minutes

### Step 2: Optimize Frontend

```bash
Use fullstack-nextjs to implement Suspense, streaming, and code splitting for better LCP and FID
```

**Optimizations:**

- Streaming with Suspense
- Dynamic imports
- Image optimization
- Font optimization

**Time:** 30-45 minutes

### Step 3: Optimize Database

```bash
Use database to add indexes and optimize slow queries
```

**Improvements:**

- Add missing indexes
- Optimize N+1 queries
- Implement connection pooling

**Time:** 20-30 minutes

### Step 4: Implement Caching

```bash
Use performance to implement multi-layer caching strategy with Redis
```

**Caching layers:**

- Browser caching
- CDN caching
- Server-side caching
- Database query caching

**Time:** 30-40 minutes

### Step 5: Verify Improvements

```bash
/workflow-review-performance
```

**Verification:**

- Re-check Core Web Vitals
- Confirm improvements
- Identify remaining issues

**Time:** 15-20 minutes

### Total Time: 2-3 hours

---

## Setting Up CI/CD

Complete CI/CD pipeline from scratch.

### Step 1: Plan Deployment Strategy

```bash
/workflow-deploy
```

**Planning:**

- Deployment platform (Vercel/Docker)
- Environment management
- Database migration strategy
- Rollback procedures

**Time:** 15-20 minutes

### Step 2: Configure Deployment

**For Vercel:**

```bash
Use deployment to configure Vercel deployment with environment variables and custom domains
```

**For Docker:**

```bash
Use deployment to create Dockerfile and docker-compose.yml for production deployment
```

**Time:** 20-30 minutes

### Step 3: Create CI/CD Pipeline

```bash
Use deployment to create GitHub Actions workflow for testing, building, and deploying
```

**Pipeline stages:**

- Lint and type check
- Run tests
- Build application
- Deploy to staging
- Deploy to production

**Time:** 30-40 minutes

### Step 4: Set Up Monitoring

```bash
Use monitoring to configure Sentry for error tracking and set up health checks
```

**Monitoring:**

- Error tracking
- Performance monitoring
- Uptime checks
- Alerting

**Time:** 20-30 minutes

### Total Time: 1.5-2 hours

---

## Building a Real-Time Chat

Complex feature with WebSockets and real-time updates.

### Step 1: Architecture Design

```bash
Use fullstack-js-savant to design a real-time chat system with WebSockets, message persistence, and typing indicators
```

**Architecture:**

- WebSocket server (Socket.io)
- Message storage (PostgreSQL)
- Real-time presence (Redis)
- Client synchronization

**Time:** 30-45 minutes

### Step 2: Database Schema

```bash
Use database to create schema for chat rooms, messages, and participants
```

**Models:**

- Room
- Message
- Participant
- TypingIndicator

**Time:** 20-30 minutes

### Step 3: WebSocket Server

```bash
Use backend-api to implement Socket.io server with authentication and room management
```

**Features:**

- Socket authentication
- Room join/leave
- Message broadcasting
- Typing indicators
- Online presence

**Time:** 45-60 minutes

### Step 4: Chat UI

```bash
Use frontend-ui to create chat interface with message list, input, and real-time updates
```

**Components:**

- Room list
- Message thread
- Message input
- Typing indicator
- Online status

**Time:** 45-60 minutes

### Step 5: Testing and Review

```bash
/workflow-review-code
/workflow-qa-e2e
```

**Testing:**

- E2E tests for chat flows
- Connection handling
- Message delivery
- Error scenarios

**Time:** 30-45 minutes

### Total Time: 3-4 hours

---

## Best Practices

### 1. Start with Design

Always begin with architecture or design commands:

```bash
# Good workflow
/workflow-design-nextjs
/workflow-implement-fullstack

# Avoid starting with implementation
/workflow-implement-fullstack  # Without design first
```

### 2. Review Frequently

Review after each major implementation:

```bash
/workflow-implement-fullstack
/workflow-review-code        # Immediate review
/workflow-review-security   # Before moving on
```

### 3. Iterate on Feedback

Use review feedback to improve:

```bash
/workflow-review-code                    # First review
Use code-reviewer to fix issues     # Address problems
/workflow-review-code                    # Verify fixes
```

### 4. Combine Commands and Direct Invocation

Mix workflow commands with direct agent calls:

```bash
/workflow-implement-fullstack           # Structured implementation
Use performance to optimize query  # Quick optimization
/workflow-review-code                  # Final review
```

### 5. Document as You Build

Create documentation alongside development:

```bash
/workflow-implement-fullstack  # Build feature
/workflow-write-docs          # Document it
```

## Summary

Effective workflows:

- **Start with design** - Plan before building
- **Implement incrementally** - Build in stages
- **Review frequently** - Catch issues early
- **Test thoroughly** - Ensure quality
- **Document continuously** - Keep docs updated

## Next Steps

- [Best Practices Guide](best-practices.md)
- [Architecture Overview](../architecture/overview.md)
- [Workflow Commands Reference](../architecture/workflow-commands.md)
