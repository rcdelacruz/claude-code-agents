# Development Tasks

This directory contains generated development task breakdowns in JSON and CSV formats.

## Purpose

Development tasks are created by the **task-planner** agent and provide:
- Actionable work items for development teams
- Effort estimates for sprint planning
- Dependencies for task sequencing
- Role assignments for team coordination

## File Naming Convention

Files follow the pattern: `[feature-name]-tasks.[ext]`

Examples:
- `user-authentication-tasks.json`
- `user-authentication-tasks.csv`
- `payment-processing-tasks.json`
- `payment-processing-tasks.csv`

## File Formats

### JSON Format (`*.json`)

**Use for**:
- Jira API import
- Linear API import
- GitHub Issues API import
- Custom tooling

**Structure**:
```json
[
  {
    "task_id": "TASK-001",
    "title": "Setup project repository",
    "description": "Initialize Git repository, setup branch protection, configure CI/CD pipeline",
    "priority": "High",
    "effort": 4,
    "role": "DevOps",
    "dependencies": "None"
  }
]
```

### CSV Format (`*.csv`)

**Use for**:
- Excel/Google Sheets import
- Manual project tool import
- Easy viewing and editing

**Structure**:
```csv
task_id,title,description,priority,effort,role,dependencies
TASK-001,Setup project repository,"Initialize Git repository, setup branch protection, configure CI/CD pipeline",High,4,DevOps,None
```

## Generating Tasks

Use the **task-planner** agent:

```bash
Use task-planner to generate development tasks from documents/01-prds/[feature-name]-prd.md
```

**Optional context**:
```bash
Use task-planner to generate tasks from documents/01-prds/payment-processing-prd.md

Team structure:
- 2 Backend developers (Node.js)
- 2 Frontend developers (React)
- 1 QA engineer
- 1 DevOps engineer

Tech stack: Next.js 15, tRPC, Prisma, PostgreSQL
Timeline: 4 weeks
```

## Task Fields

- **task_id**: Unique identifier (TASK-001, TASK-002, etc.)
- **title**: Brief action-oriented summary (5-10 words)
- **description**: Detailed explanation with technical specifics
- **priority**: `High` (P0), `Medium` (P1), `Low` (P2)
- **effort**: Estimated hours (1-40 hours)
- **role**: `Frontend`, `Backend`, `Fullstack`, `QA`, `DevOps`, `Mobile`, `Security`
- **dependencies**: Comma-separated task IDs or `None`

## Task Phases

Generated tasks cover all implementation phases:

1. **Project Setup** - Repository, environment, CI/CD, database
2. **Backend Development** - Database schema, APIs, business logic
3. **Frontend Development** - UI components, state management, API integration
4. **Integration** - Frontend-backend integration, third-party services
5. **Testing & QA** - Integration tests, E2E tests, performance, security
6. **Deployment** - Production setup, deployment pipeline, monitoring

## Importing into Project Tools

### Jira

**Via API (JSON)**:
```bash
# Use Jira REST API to import JSON
curl -X POST https://your-domain.atlassian.net/rest/api/3/issue/bulk \
  -H "Content-Type: application/json" \
  -d @user-authentication-tasks.json
```

**Via CSV**:
1. Open Jira → Projects → Your Project
2. Click "..." → Import
3. Select CSV file
4. Map columns to Jira fields

### Linear

**Via CSV**:
1. Open Linear → Import
2. Select CSV file
3. Map columns to Linear fields
4. Import tasks

### GitHub Issues

**Via CLI (JSON)**:
```bash
# Use gh CLI to create issues from JSON
cat user-authentication-tasks.json | jq -r '.[] | "gh issue create --title \"\(.title)\" --body \"\(.description)\""' | bash
```

**Via CSV**:
Use GitHub's CSV import feature in repository settings.

## Tips

- Review and adjust effort estimates based on team velocity
- Check dependency chains for accuracy
- Assign tasks to team members based on role field
- Break down tasks >40 hours into smaller subtasks
- Update tasks when PRD changes
- Archive completed task lists for historical reference
