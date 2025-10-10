# Technology Stack Reference

Complete reference of technologies covered by MCP Sub-Agents with version information and expertise areas.

## Frontend Technologies

### Frameworks

#### React

**Versions:** React 18+

**Expertise:**

- **Hooks** - useState, useEffect, useReducer, useContext, custom hooks
- **Server Components** - RSC architecture, server-first rendering
- **Suspense** - Loading states, streaming, concurrent features
- **Error Boundaries** - Error handling, fallback UI
- **Context** - State management, prop drilling prevention
- **Portals** - Modal dialogs, tooltips
- **Refs** - DOM manipulation, component instances

**Agents:** fullstack-nextjs, frontend-ui, fullstack-js-savant

#### Next.js

**Versions:** Next.js 15+

**Expertise:**

- **App Router** - File-based routing, layouts, route groups
- **Server Components** - Default server-side rendering
- **Client Components** - Interactive UI with 'use client'
- **Server Actions** - Form handling, mutations, 'use server'
- **Streaming** - Progressive rendering, Suspense integration
- **Metadata** - Static and dynamic SEO metadata
- **Image Optimization** - next/image, automatic optimization
- **Font Optimization** - next/font, Google Fonts
- **Route Handlers** - API endpoints, REST APIs
- **Middleware** - Authentication, rate limiting, redirects
- **Edge Runtime** - Edge functions, global distribution

**Agents:** fullstack-nextjs, fullstack-js-savant

### UI Libraries

#### shadcn/ui

**Expertise:**

- Component installation and customization
- Radix UI primitives integration
- Tailwind CSS styling
- Accessibility features
- Dark mode support
- Theme customization

**Components:**

- Forms (Input, Textarea, Select, Checkbox, Radio)
- Data display (Table, Card, Badge, Avatar)
- Feedback (Alert, Toast, Dialog, Popover)
- Navigation (Tabs, Dropdown Menu, Command)
- Layout (Sheet, Separator, Aspect Ratio)

**Agents:** frontend-ui, fullstack-nextjs

#### Tailwind CSS

**Versions:** Tailwind CSS 3.x

**Expertise:**

- Utility-first CSS
- Responsive design (mobile-first)
- Custom themes
- Dark mode
- JIT compiler
- Plugin system
- Custom utilities

**Agents:** frontend-ui, fullstack-nextjs

#### Radix UI

**Expertise:**

- Accessible primitives
- Unstyled components
- Keyboard navigation
- ARIA attributes
- Focus management
- Screen reader support

**Agents:** frontend-ui

### Forms & Validation

#### React Hook Form

**Versions:** 7.x

**Expertise:**

- Form state management
- Validation
- Error handling
- Field arrays
- Controlled/uncontrolled inputs
- TypeScript integration

**Agents:** frontend-ui

#### Zod

**Versions:** 3.x

**Expertise:**

- Schema validation
- Type inference
- Runtime validation
- Error messages
- Transformations
- Composition

**Agents:** frontend-ui, backend-api, fullstack-nextjs

### Animation

#### Framer Motion

**Versions:** 10.x

**Expertise:**

- Component animations
- Page transitions
- Gestures
- Scroll animations
- Layout animations
- SVG animations

**Agents:** frontend-ui

## Backend Technologies

### Node.js Frameworks

#### Express.js

**Versions:** 4.x

**Expertise:**

- Middleware architecture
- Routing
- REST APIs
- Error handling
- Request/response handling
- Cookie parsing
- Session management

**Agents:** backend-api, fullstack-js-savant

#### NestJS

**Versions:** 10.x

**Expertise:**

- Dependency injection
- Decorators
- Modules
- Controllers and services
- GraphQL integration
- Microservices
- WebSockets
- Testing

**Agents:** fullstack-js-savant

#### Fastify

**Versions:** 4.x

**Expertise:**

- High performance
- Schema validation
- Plugin architecture
- TypeScript support
- Async/await
- Logging

**Agents:** fullstack-js-savant

### API Technologies

#### tRPC

**Versions:** 10.x

**Expertise:**

- End-to-end type safety
- React Query integration
- Input validation with Zod
- Middleware
- Context
- Subscriptions
- Error handling

**Agents:** backend-api, fullstack-nextjs, fullstack-js-savant

#### GraphQL

**Expertise:**

- Schema definition
- Resolvers
- Apollo Server
- Subscriptions
- DataLoader
- Schema stitching
- Federation

**Agents:** fullstack-js-savant

### Authentication

#### NextAuth.js

**Versions:** 5.x (Auth.js)

**Expertise:**

- OAuth providers (GitHub, Google, etc.)
- Credentials provider
- Email provider
- JWT strategy
- Session strategy
- Database adapters
- Callbacks and events
- Middleware integration

**Agents:** backend-api, fullstack-nextjs

## Database Technologies

### Databases

#### PostgreSQL

**Versions:** 14+

**Expertise:**

- Advanced queries
- Indexing strategies
- Full-text search
- JSONB
- Partitioning
- Replication
- Extensions
- Performance tuning

**Agents:** database

#### Redis

**Versions:** 7.x

**Expertise:**

- Caching strategies
- Pub/Sub
- Data structures
- Session storage
- Rate limiting
- Queue implementation

**Agents:** database, performance

### ORMs

#### Prisma

**Versions:** 5.x

**Expertise:**

- Schema design
- Migrations
- Type-safe queries
- Relations
- Transactions
- Seeding
- Query optimization
- Connection pooling

**Agents:** database, fullstack-nextjs, backend-api

#### Drizzle

**Expertise:**

- Type-safe ORM
- SQL-like syntax
- Migrations
- Relations
- TypeScript integration

**Agents:** database

## Testing Technologies

### E2E Testing

#### Playwright

**Versions:** 1.40+

**Expertise:**

- Cross-browser testing
- Page Object Model
- API testing
- Visual regression
- Mobile testing
- Debugging tools
- CI integration
- Parallel execution

**Agents:** qa-tester

### Unit Testing

#### Vitest

**Versions:** 1.x

**Expertise:**

- Fast unit tests
- Jest-compatible API
- ESM support
- TypeScript support
- Coverage reporting
- Mocking
- Snapshot testing

**Agents:** qa-tester

#### Testing Library

**Expertise:**

- Component testing
- User-centric queries
- Accessibility testing
- React Testing Library
- Async utilities
- Custom matchers

**Agents:** qa-tester

## DevOps & Deployment

### Platforms

#### Vercel

**Expertise:**

- Next.js deployment
- Serverless functions
- Edge functions
- Preview deployments
- Environment variables
- Custom domains
- Analytics

**Agents:** deployment

#### Docker

**Expertise:**

- Containerization
- Multi-stage builds
- Docker Compose
- Volume management
- Networking
- Security best practices

**Agents:** deployment

#### Kubernetes

**Expertise:**

- Container orchestration
- Deployments
- Services
- Ingress
- ConfigMaps and Secrets
- Scaling
- Health checks

**Agents:** deployment

### CI/CD

#### GitHub Actions

**Expertise:**

- Workflow automation
- Build pipelines
- Testing automation
- Deployment automation
- Secret management
- Matrix builds
- Caching

**Agents:** deployment

## Monitoring & Observability

### Error Tracking

#### Sentry

**Expertise:**

- Error tracking
- Performance monitoring
- Release tracking
- User feedback
- Source maps
- Alerts
- Integrations

**Agents:** monitoring

### Tracing

#### OpenTelemetry

**Expertise:**

- Distributed tracing
- Metrics collection
- Log correlation
- Context propagation
- Instrumentation

**Agents:** monitoring

### Logging

#### Pino

**Expertise:**

- Structured logging
- High performance
- JSON output
- Child loggers
- Redaction

**Agents:** monitoring

## Code Quality

### Linting

#### ESLint

**Versions:** 8.x

**Expertise:**

- Code linting
- Custom rules
- Plugin configuration
- Next.js integration
- TypeScript support

**Agents:** code-reviewer

### Formatting

#### Prettier

**Versions:** 3.x

**Expertise:**

- Code formatting
- Configuration
- Editor integration
- Pre-commit hooks

**Agents:** code-reviewer

## TypeScript

**Versions:** 5.x

**Expertise:**

- Strict mode
- Advanced types (generics, conditionals, mapped types)
- Type guards
- Utility types
- Template literal types
- Decorators
- Module resolution
- tsconfig configuration

**Agents:** All agents (TypeScript-first approach)

## Build Tools

### Vite

**Versions:** 5.x

**Expertise:**

- Fast development server
- HMR
- Optimized builds
- Plugin system
- ESM-first

**Agents:** fullstack-js-savant

### Turbopack

**Expertise:**

- Next.js bundler
- Incremental compilation
- Fast builds
- Development mode

**Agents:** fullstack-nextjs

## Version Requirements

| Technology | Minimum Version | Recommended Version |
|-----------|----------------|---------------------|
| Node.js | 18.x | 20.x LTS |
| Next.js | 15.0 | Latest 15.x |
| React | 18.0 | Latest 18.x |
| TypeScript | 5.0 | Latest 5.x |
| Prisma | 5.0 | Latest 5.x |
| PostgreSQL | 14.0 | Latest 16.x |
| Playwright | 1.40 | Latest 1.x |
| Vitest | 1.0 | Latest 1.x |

## Technology Selection Guidelines

### Small Projects (MVP, Prototypes)

- Next.js + Vercel + Supabase
- shadcn/ui + Tailwind CSS
- NextAuth.js
- Minimal setup, fast deployment

### Medium Projects (SaaS, B2B)

- Next.js + tRPC + Prisma + PostgreSQL
- shadcn/ui + Tailwind CSS
- NextAuth.js v5
- Redis for caching
- Playwright for testing
- GitHub Actions CI/CD

### Large Projects (Enterprise, High-Scale)

- Microservices with NestJS
- Next.js frontend
- PostgreSQL with read replicas
- Redis cluster
- Kubernetes deployment
- Comprehensive monitoring
- Advanced security

## Next Steps

- [View agent capabilities](../agents/savants.md)
- [Learn workflows](../guides/workflows.md)
- [Read best practices](../guides/best-practices.md)
