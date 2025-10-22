# Document Organization Guide

This guide explains how to organize and manage documents in the Claude Code Agents workflow system.

## Directory Structure

```
documents/
├── README.md                 # Main workflow documentation
├── 00-references/            # Input documents
│   ├── README.md
│   ├── brds/                 # Business Requirements Documents
│   ├── tech-specs/           # Technical specifications
│   ├── user-research/        # User research, interviews, surveys
│   ├── designs/              # UI/UX designs, wireframes, mockups
│   └── compliance/           # Legal, security, compliance docs
├── 01-prds/                  # Product Requirements Documents
│   ├── README.md
│   ├── user-authentication-prd.md
│   └── payment-processing-prd.md
├── 02-dev-tasks/             # Development tasks
│   ├── README.md
│   ├── user-authentication-tasks.json
│   ├── user-authentication-tasks.csv
│   ├── payment-processing-tasks.json
│   └── payment-processing-tasks.csv
└── 03-test-cases/            # Test cases
    ├── README.md
    ├── user-authentication-tests.json
    ├── user-authentication-tests.csv
    ├── payment-processing-tests.json
    └── payment-processing-tests.csv
```

## Reference Documents (00-references/)

### Purpose

Store input documents that inform PRD creation:

- Business Requirements Documents (BRDs)
- Technical specifications
- User research findings
- UI/UX designs and wireframes
- Compliance and security requirements
- Market research and competitive analysis

### Organization Strategies

#### By Document Type (Recommended)

```
00-references/
├── brds/                    # Business Requirements Documents
│   ├── user-auth-brd.md
│   └── payment-brd.pdf
├── tech-specs/              # Technical specifications
│   ├── api-documentation.md
│   └── architecture-diagram.png
├── user-research/           # User research materials
│   ├── user-interviews.pdf
│   ├── survey-results.csv
│   └── personas.md
├── market-research/         # Market and competitive analysis
│   └── competitor-analysis.md
├── designs/                 # UI/UX designs
│   ├── wireframes/
│   └── mockups/
├── manuals/                 # User manuals and guides
│   └── existing-user-guide.pdf
└── compliance/              # Legal and compliance docs
    ├── gdpr-requirements.md
    └── security-standards.pdf
```

#### By Feature (Alternative)

For projects with many reference docs per feature:

```
00-references/
├── user-authentication/
│   ├── brd.md
│   ├── security-requirements.pdf
│   ├── user-flows.png
│   └── competitor-analysis.md
├── payment-processing/
│   ├── brd.md
│   ├── stripe-api-docs.pdf
│   ├── compliance-requirements.md
│   └── user-research.pdf
└── dashboard-analytics/
    ├── brd.md
    ├── data-requirements.md
    └── wireframes.png
```

### Usage

Reference input documents when creating PRDs:

```bash
Use product-manager to create a PRD for user authentication feature.

Input documents:
- BRD: documents/00-references/brds/user-auth-brd.md
- Security requirements: documents/00-references/compliance/security-standards.pdf
- User research: documents/00-references/user-research/user-interviews.pdf
```

### Best Practices

1. **Keep originals intact** - Never modify original reference documents
2. **Version control** - Commit reference docs to git for team access
3. **Descriptive names** - Use clear, descriptive filenames with dates
4. **Link in PRDs** - Reference input docs in generated PRDs for traceability

## Product Requirements Documents (01-prds/)

### Purpose

PRDs are the foundation for all implementation artifacts:

- Created by the `product-manager` agent
- Input for `task-planner` and `test-planner` agents
- Single source of truth for feature requirements

### File Naming Convention

Pattern: `[feature-name]-prd.md`

Examples:

- `user-authentication-prd.md`
- `payment-processing-prd.md`
- `dashboard-analytics-prd.md`

Use kebab-case (lowercase with hyphens).

### PRD Structure

All PRDs follow a consistent 5-section structure:

1. **Objective & Success Metrics**

   - Problem statementmcp
   - Goals (SMART)
   - Success metrics with baselines

2. **Features & Requirements**

   - Prioritized features (P0, P1, P2)
   - User stories
   - Functional requirements
   - Acceptance criteria

3. **User Experience Flow**

   - Primary user flows
   - Key interactions
   - Design considerations
   - Error states

4. **Technical Context**

   - System & environment requirements
   - Dependencies & integrations
   - Technical constraints
   - Assumptions

5. **Open Questions & Next Steps**

   - Unresolved questions
   - Risks & mitigation
   - Timeline
   - Next steps

### Creating a PRD

```bash
Use product-manager to create a PRD for [feature name]

Input documents (optional):
- BRD: documents/00-references/brds/[feature]-brd.md
- User research: documents/00-references/user-research/[feature]-research.pdf
```

### Best Practices

1. **Keep focused** - 3-8 pages per PRD
2. **Update when needed** - Regenerate tasks/tests when PRD changes
3. **Version control** - Track changes over time
4. **Link artifacts** - Reference PRD in tasks, tests, and commits

## Development Tasks (02-dev-tasks/)

### Purpose

Break down PRD into actionable work items:

- Created by the `task-planner` agent
- Dual format: JSON (API import) + CSV (manual import)
- Ready for Jira, Linear, GitHub Issues

### File Naming Convention

Pattern: `[feature-name]-tasks.[ext]`

Examples:

- `user-authentication-tasks.json`
- `user-authentication-tasks.csv`
- `payment-processing-tasks.json`
- `payment-processing-tasks.csv`

### Task Fields

- **task_id**: Unique identifier (TASK-001, TASK-002, etc.)
- **title**: Brief action-oriented summary (5-10 words)
- **description**: Detailed explanation with technical specifics
- **priority**: `High` (P0), `Medium` (P1), `Low` (P2)
- **effort**: Estimated hours (1-40 hours)
- **role**: `Frontend`, `Backend`, `Fullstack`, `QA`, `DevOps`, `Mobile`, `Security`
- **dependencies**: Comma-separated task IDs or `None`

### Task Phases

Generated tasks cover all implementation phases:

1. **Project Setup** - Repository, environment, CI/CD, database
2. **Backend Development** - Database schema, APIs, business logic
3. **Frontend Development** - UI components, state management, API integration
4. **Integration** - Frontend-backend integration, third-party services
5. **Testing & QA** - Integration tests, E2E tests, performance, security
6. **Deployment** - Production setup, deployment pipeline, monitoring

### Generating Tasks

```bash
Use task-planner to generate development tasks from documents/01-prds/[feature-name]-prd.md

Team structure (optional):
- 2 Backend developers (Node.js)
- 2 Frontend developers (React)
- 1 QA engineer
- 1 DevOps engineer

Tech stack: Next.js 15, tRPC, Prisma, PostgreSQL
Timeline: 4 weeks
```

### Importing Tasks

#### Jira

**Via API (JSON)**:

```bash
curl -X POST https://your-domain.atlassian.net/rest/api/3/issue/bulk \
  -H "Content-Type: application/json" \
  -d @user-authentication-tasks.json
```

**Via CSV**:

1. Open Jira → Projects → Your Project
2. Click "..." → Import
3. Select CSV file
4. Map columns to Jira fields

#### Linear

**Via CSV**:

1. Open Linear → Import
2. Select CSV file
3. Map columns to Linear fields
4. Import tasks

#### GitHub Issues

**Via CLI (JSON)**:

```bash
cat user-authentication-tasks.json | jq -r '.[] | "gh issue create --title \"\\(.title)\" --body \"\\(.description)\""' | bash
```

### Best Practices

1. **Review estimates** - Adjust based on team velocity
2. **Validate dependencies** - Check dependency chains for accuracy
3. **Assign by role** - Use role field for team assignment
4. **Break down large tasks** - Tasks >40 hours should be split
5. **Update when PRD changes** - Regenerate when requirements evolve

## Test Cases (03-test-cases/)

### Purpose

Comprehensive test coverage for all PRD requirements:

- Created by the `test-planner` agent
- Dual format: JSON (API import) + CSV (manual import)
- Ready for TestRail, Zephyr, qTest

### File Naming Convention

Pattern: `[feature-name]-tests.[ext]`

Examples:

- `user-authentication-tests.json`
- `user-authentication-tests.csv`
- `payment-processing-tests.json`
- `payment-processing-tests.csv`

### Test Case Fields

- **test_id**: Unique identifier (TEST-001, TEST-002, etc.)
- **scenario**: Clear description of what is being tested (10-15 words)
- **steps**: Numbered, step-by-step instructions (use `\n` for line breaks)
- **expected**: Specific, measurable expected behavior
- **priority**: `High` (critical), `Medium` (important), `Low` (nice-to-have)
- **type**: `Functional`, `Integration`, `E2E`, `Performance`, `Security`, `Usability`, `Boundary`, `Negative`
- **prerequisites**: Conditions required before test execution or `None`

### Test Types

- **Functional (60-70%)**: Tests specific feature functionality
- **Integration (15-20%)**: Tests component interactions
- **E2E (10-15%)**: Tests complete user journeys
- **Performance (5-10%)**: Tests speed, load, scalability
- **Security (5-10%)**: Tests authentication, authorization, vulnerabilities
- **Usability (5%)**: Tests user experience, accessibility
- **Boundary**: Tests limits and edge cases
- **Negative**: Tests error handling and invalid inputs

### Test Coverage

Comprehensive test suite includes:

- **50-60%** Positive tests (happy paths)
- **20-30%** Negative tests (error handling)
- **10-15%** Boundary tests (edge cases)
- **5-10%** Integration tests
- **5-10%** Security tests
- **5%** Usability/Accessibility tests

### Generating Test Cases

```bash
Use test-planner to generate test cases from documents/01-prds/[feature-name]-prd.md

Focus areas (optional):
- Security testing (authentication, authorization)
- Performance testing (load times, concurrent users)
- Integration testing (payment gateway, email service)
```

### Importing Test Cases

#### TestRail

**Via CSV**:

1. Open TestRail → Test Cases
2. Click "Import" → "Import from CSV"
3. Select CSV file
4. Map columns to TestRail fields
5. Import test cases

**Via API (JSON)**:

```bash
curl -X POST https://your-domain.testrail.io/index.php?/api/v2/add_cases/1 \
  -H "Content-Type: application/json" \
  -d @user-authentication-tests.json
```

#### Zephyr

**Via CSV**:

1. Open Zephyr → Test Repository
2. Click "Import"
3. Select CSV file
4. Map columns and import

#### qTest

**Via CSV**:

1. Open qTest → Test Design
2. Click "Import" → "Import Test Cases"
3. Select CSV file
4. Map columns to qTest fields
5. Import test cases

### Best Practices

1. **Review for completeness** - Ensure all requirements are covered
2. **Prioritize high-priority tests** - Execute critical tests first
3. **Logical order** - Setup → functional → integration → E2E
4. **Update with PRD** - Regenerate when requirements change
5. **Track execution separately** - Use test management tools for results

## File Naming Conventions

### Consistent Naming

All files follow kebab-case naming: `[feature-name]-[type].[ext]`

**Examples**:

```
✅ Good:
- user-authentication-prd.md
- user-authentication-tasks.json
- user-authentication-tasks.csv
- user-authentication-tests.json
- user-authentication-tests.csv

❌ Bad:
- UserAuth-PRD.md
- user_auth_tasks.json
- UserAuthenticationTests.csv
```

### Feature Naming

Use descriptive, concise feature names:

- `user-authentication` (not just `auth`)
- `payment-processing` (not `payments`)
- `dashboard-analytics` (not `dashboard`)
- `blog-post-management` (not `blog`)

## File Formats

### JSON Format

**Advantages**:

- Programmable (API import)
- Type-safe
- Machine-readable
- Structured data

**Use for**:

- Jira API import
- Linear API import
- GitHub Issues API import
- TestRail API import
- Custom automation scripts

### CSV Format

**Advantages**:

- Human-readable
- Excel/Google Sheets compatible
- Easy manual editing
- Universal import support

**Use for**:

- Manual import into project tools
- Excel/Sheets viewing and editing
- Quick review and adjustments
- Sharing with non-technical stakeholders

## Version Control

### What to Commit

**Recommended**:

```bash
# Commit all documents for traceability
git add documents/
git commit -m "Add PRD and artifacts for user authentication feature"
```

**Benefits**:

- Full traceability from requirements to code
- Team can see PRDs, tasks, and test cases
- Version history of requirements changes
- Easy onboarding for new team members

### What to Exclude (Optional)

**For solo projects or when using external tools as source of truth**:

```bash
# Add to .gitignore
echo "documents/" >> .gitignore
```

**Benefits**:

- Smaller repository
- Artifacts regenerated as needed
- No version control overhead

## Linking Artifacts

### In PRDs

```markdown
# User Authentication Feature - PRD

## Related Artifacts

- **Tasks**: `documents/02-dev-tasks/user-authentication-tasks.json`
- **Tests**: `documents/03-test-cases/user-authentication-tests.json`
- **Jira Epic**: PROJ-123
- **TestRail Suite**: TS-456
```

### In Commit Messages

```
feat: implement blog post editor (TASK-015)

- Add rich text editor component
- Implement markdown preview
- Add image upload functionality

Related PRD: documents/01-prds/blog-post-management-prd.md
Task: TASK-015 (documents/02-dev-tasks/blog-post-management-tasks.csv)
Tests: TEST-023, TEST-024, TEST-025
```

### In Pull Requests

```markdown
## Description
Implements the blog post rich text editor with markdown support.

## Related Artifacts
- **PRD**: `documents/01-prds/blog-post-management-prd.md` (Section 2.1: Content Editor)
- **Tasks**: TASK-015, TASK-016 (Blog editor implementation)
- **Tests**: TEST-023 to TEST-030 (Editor functionality tests)

## Acceptance Criteria
- [x] Users can create blog posts with rich text
- [x] Markdown preview works correctly
- [x] Images can be uploaded and embedded
- [x] Draft saving works automatically
```

## Maintenance

### Regenerating Artifacts

When a PRD is updated, regenerate tasks and tests:

```bash
# 1. Update PRD
# Edit documents/01-prds/blog-post-management-prd.md

# 2. Regenerate tasks
Use task-planner to generate development tasks from documents/01-prds/blog-post-management-prd.md

# 3. Regenerate test cases
Use test-planner to generate test cases from documents/01-prds/blog-post-management-prd.md

# 4. Commit changes
git add documents/
git commit -m "Update blog post feature requirements and tasks"
```

### Archiving Old Versions

Instead of deleting, archive outdated files:

```bash
# Create archive directory
mkdir -p documents/archive/

# Move old versions
mv documents/01-prds/old-feature-prd.md documents/archive/
```

## Related Documentation

- [New Project Setup](new-project-setup.md) - Setting up documents/ in a new project
- [Requirements Workflow](requirements-workflow.md) - Complete workflow from PRD to implementation
- [Best Practices](best-practices.md) - Development workflow best practices
