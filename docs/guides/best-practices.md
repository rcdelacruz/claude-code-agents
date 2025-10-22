# Best Practices

This guide provides best practices for using Claude Code Agents effectively to build high-quality, production-ready applications.

## Agent Selection

### Choosing the Right Agent

#### Use Savants For:

- Architecture decisions and system design
- Technology stack selection
- Complex cross-cutting problems
- Full-stack feature coordination
- Making tradeoffs between options
- Learning about entire ecosystems

**Example:**
```bash
# Good savant usage
Use fullstack-js-savant to design an e-commerce platform architecture

# Not ideal for savant
Use fullstack-js-savant to create a button component
```

#### Use Specialists For:

- Framework-specific implementation
- Detailed code generation
- UI component development
- API endpoint creation
- Domain-specific optimization
- Focused tasks with clear scope

**Example:**
```bash
# Good specialist usage
Use frontend-ui to create a product card component with shadcn/ui

# Better handled by savant
Use frontend-ui to design entire application architecture
```

### Agent Chaining

Chain agents for complex tasks:

```bash
# 1. Architecture
Use architect to design system architecture

# 2. Database
Use database to create Prisma schema

# 3. API
Use backend-api to implement tRPC routers

# 4. UI
Use frontend-ui to create components

# 5. Review
Use code-reviewer to review implementation
```

## Communication with Agents

### Be Specific

Provide detailed context and requirements:

```bash
# Good - specific and detailed
Use frontend-ui to create a multi-step checkout form with steps for shipping, payment, and confirmation. Include Zod validation, progress indicator, and ability to navigate between steps.

# Less effective - vague
Use frontend-ui to create a form
```

### Provide Context

Include relevant information:

```bash
# Good - includes context
Use backend-api to create a posts API. Users should only be able to edit their own posts. Include pagination with cursor-based approach for infinite scroll.

# Less effective - missing context
Use backend-api to create a posts API
```

### Ask for Explanations

Request explanations for learning:

```bash
Use fullstack-nextjs to explain when to use Server Components vs Client Components with examples
```

### Request Best Practices

Ask about recommended approaches:

```bash
Use security to explain OWASP Top 10 vulnerabilities and prevention strategies for Next.js applications
```

## Workflow Commands

### When to Use Workflow Commands

Use workflow commands when:

- **Learning** - New to a pattern or technology
- **Completeness** - Want comprehensive checklists
- **Structure** - Need step-by-step guidance
- **Quality** - Ensuring nothing is missed
- **Onboarding** - Training new team members

### When to Use Direct Invocation

Use direct agent invocation when:

- **Speed** - Quick, specific tasks
- **Experience** - Familiar with the workflow
- **Precision** - Know exactly what's needed
- **Iteration** - Small fixes or changes

### Effective Command Sequencing

Follow logical progression:

```bash
# Recommended sequence
/workflow-design-nextjs          # 1. Design
/workflow-implement-fullstack    # 2. Implement
/workflow-review-code           # 3. Review
/workflow-review-security       # 4. Security
/workflow-qa-e2e               # 5. Test
/workflow-deploy               # 6. Deploy
```

Avoid skipping design:

```bash
# Avoid this
/workflow-implement-fullstack    # Implementing without design
/workflow-design-nextjs         # Design should come first
```

## Code Quality

### Review Proactively

Review code regularly, not just at the end:

```bash
# After each feature
/workflow-implement-fullstack
/workflow-review-code

# Not just at the end
# ... multiple features ...
/workflow-review-code  # Too late
```

### Multi-Aspect Review

Use multiple review specialists:

```bash
/workflow-review-code          # Code quality
/workflow-review-security     # Security
/workflow-review-performance  # Performance
```

### Iterate on Feedback

Address issues and re-review:

```bash
/workflow-review-code                 # Review
Use code-reviewer to fix issues  # Address feedback
/workflow-review-code                # Verify fixes
```

## Testing

### Test as You Build

Write tests alongside implementation:

```bash
/workflow-implement-fullstack   # Build feature
/workflow-qa-e2e               # Write tests immediately
```

### Comprehensive Test Coverage

Cover multiple testing layers:

```bash
# Unit tests
Use qa-tester to write Vitest unit tests for utility functions

# Integration tests
Use qa-tester to write integration tests for API routes

# E2E tests
/workflow-qa-e2e
```

### Test Critical Paths

Focus on high-value test coverage:

- Authentication flows
- Payment processing
- Data mutations
- User workflows
- Error handling

## Performance

### Optimize Early

Consider performance from the start:

```bash
# During design
/workflow-design-nextjs
# Ask about performance considerations

# During implementation
Use fullstack-nextjs with focus on Core Web Vitals optimization
```

### Regular Performance Checks

Monitor performance continuously:

```bash
# Weekly or bi-weekly
/workflow-review-performance
```

### Measure Before Optimizing

Always audit before optimizing:

```bash
# Good approach
/workflow-review-performance     # Identify issues
Use performance to fix      # Address specific problems
/workflow-review-performance    # Verify improvements

# Avoid premature optimization
Use performance to optimize  # Without measuring first
```

## Security

### Security First

Consider security from day one:

```bash
# Early in development
/workflow-review-security
```

### Regular Security Audits

Schedule regular security reviews:

```bash
# Monthly security audits
/workflow-review-security
```

### Defense in Depth

Apply security at multiple layers:

- Input validation (client and server)
- Authentication and authorization
- Data encryption
- Security headers
- Rate limiting
- Audit logging

## Documentation

### Document as You Build

Create documentation alongside code:

```bash
/workflow-implement-fullstack   # Build feature
/workflow-write-docs           # Document it
```

### Comprehensive Documentation

Cover all aspects:

- README with quick start
- API reference
- Architecture documentation
- User guides
- Deployment instructions

### Keep Documentation Updated

Update docs when code changes:

```bash
# After significant changes
Use tech-writer to update documentation for new API endpoints
```

## Deployment

### Automate Early

Set up CI/CD from the start:

```bash
# Early in project
/workflow-deploy
```

### Multiple Environments

Use staging before production:

```bash
Use deployment to set up staging and production environments with GitHub Actions
```

### Deployment Checklist

Always use pre-deployment checklist:

- Code review complete
- Security audit passed
- Performance verified
- Tests passing
- Documentation updated
- Database migrations ready
- Monitoring configured

## Project Organization

### Consistent Structure

Use consistent project structure:

```
app/
├── (auth)/
├── (dashboard)/
├── api/
├── actions/
components/
├── ui/
├── forms/
lib/
├── db.ts
├── auth.ts
```

### Type Safety

Maximize type safety:

- Use TypeScript strict mode
- Zod for runtime validation
- tRPC for type-safe APIs
- Prisma for type-safe database

### Separation of Concerns

Keep concerns separated:

- Server Components for data fetching
- Client Components for interactivity
- Server Actions for mutations
- Route Handlers for external APIs

## Team Collaboration

### Shared Agent Usage

Use project-specific installation:

```bash
# In project .claude directory
mkdir -p .claude/agents .claude/commands
cp -r agents/* .claude/agents/
```

### Consistent Patterns

Use workflow commands for consistency:

```bash
# Team uses same workflows
/workflow-implement-fullstack
/workflow-review-code
```

### Code Review with Agents

Use code-reviewer before human review:

```bash
# Automated pre-review
/workflow-review-code
# Then human review
```

## Continuous Improvement

### Learn from Reviews

Study agent feedback to improve:

```bash
Use code-reviewer to review my implementation
# Read feedback carefully
# Understand recommendations
# Apply learnings to future code
```

### Regular Audits

Schedule regular comprehensive audits:

```bash
# Monthly comprehensive review
/workflow-review-code
/workflow-review-security
/workflow-review-performance
```

### Stay Updated

Keep agents and practices current:

```bash
# Regular updates
cd ~/claude-code-agents
git pull
```

## Common Pitfalls to Avoid

### Don't Skip Design

```bash
# Avoid
/workflow-implement-fullstack  # Without design

# Better
/workflow-design-nextjs
/workflow-implement-fullstack
```

### Don't Ignore Security

```bash
# Avoid
# ... build entire app ...
/workflow-review-security  # Too late

# Better
/workflow-review-security  # Regular audits during development
```

### Don't Skip Testing

```bash
# Avoid
/workflow-implement-fullstack
# Move to next feature without tests

# Better
/workflow-implement-fullstack
/workflow-qa-e2e
```

### Don't Optimize Prematurely

```bash
# Avoid
Use performance to optimize  # Without measuring

# Better
/workflow-review-performance  # Measure first
Use performance to fix issues  # Then optimize
```

## Summary

Key best practices:

1. **Choose the right agent** - Savants for architecture, specialists for implementation
2. **Be specific** - Provide detailed context and requirements
3. **Review proactively** - Regular code, security, and performance reviews
4. **Test continuously** - Write tests as you build
5. **Document thoroughly** - Keep documentation updated
6. **Automate deployment** - CI/CD from the start
7. **Prioritize security** - Security-first approach
8. **Optimize wisely** - Measure before optimizing

## Next Steps

- [View workflow examples](workflows.md)
- [Learn about agents](../agents/savants.md)
- [Explore workflow commands](../architecture/workflow-commands.md)
- [Read FAQ](../faq.md)
