# Getting Started with MCP Sub-Agents in a New Project

This guide explains how to use MCP Sub-Agents when starting a new project, whether you're building from scratch or integrating into an existing codebase.

## Table of Contents

1. [Quick Start](#quick-start)
2. [Understanding Agent Scope](#understanding-agent-scope)
3. [New Project Setup](#new-project-setup)
4. [Existing Project Integration](#existing-project-integration)
5. [Complete Workflow Example](#complete-workflow-example)
6. [Project Organization](#project-organization)
7. [Best Practices](#best-practices)

## Quick Start

### Step 1: Install MCP Sub-Agents (One-time)

Agents are installed **globally** to `~/.claude/agents/` and can be used across all your projects.

```bash
# Run from any directory
curl -sSL https://raw.githubusercontent.com/rcdelacruz/mcp-sub-agents/main/install.sh | bash

# Or clone and run locally
git clone https://github.com/rcdelacruz/mcp-sub-agents.git
cd mcp-sub-agents
./install.sh
```

**What gets installed**:
- **Savant Agents** (orchestrators) → `~/.claude/agents/savants/`
- **Specialist Agents** (implementers) → `~/.claude/agents/cross-cutting/`
- **Workflow Commands** → `~/.claude/commands/`

### Step 2: Set Up Your Project

Navigate to your project directory and create the documents structure:

```bash
cd /path/to/your-project

# Create documents directory structure
mkdir -p documents/{01-prds,02-dev-tasks,03-test-cases}
```

### Step 3: Start the Workflow

Use Claude Code to begin the Requirements → Implementation workflow:

```bash
# In Claude Code, in your project directory
Use product-manager to create a PRD for [your feature]
```

That's it! You're ready to use the complete workflow.

## Understanding Agent Scope

### Global Agents (Installed Once)

**Location**: `~/.claude/agents/` and `~/.claude/commands/`

**Accessibility**: Available in **all** Claude Code sessions, regardless of directory

**Agents Include**:
- All 4 Savant Agents (fullstack-js-savant, java-spring-savant, react-native-savant, flutter-savant)
- All 12 Cross-Cutting Specialists (product-manager, task-planner, test-planner, etc.)
- All Workflow Commands (/mcp-design-architecture, /mcp-implement-fullstack, etc.)

**Why Global?**:
- Install once, use everywhere
- No need to copy agents to each project
- Consistent behavior across projects
- Easy updates via re-running install.sh

### Project-Specific Artifacts

**Location**: `your-project/documents/`

**What's Stored**:
- PRDs (Product Requirements Documents)
- Development tasks (JSON + CSV)
- Test cases (JSON + CSV)
- Project-specific documentation

**Why Project-Specific?**:
- Each project has unique requirements
- Version control with your code
- Team collaboration via git
- Traceability from requirements to implementation

## New Project Setup

### Scenario 1: Brand New Project

Starting a project from scratch:

```bash
# 1. Create project directory
mkdir my-new-project
cd my-new-project

# 2. Initialize git (optional but recommended)
git init

# 3. Create documents structure
mkdir -p documents/{00-references,01-prds,02-dev-tasks,03-test-cases}

# 4. Create .gitignore to exclude temporary files
cat > .gitignore << 'EOF'
# MCP Sub-Agents temporary files
tmp/

# Node modules (if using Node.js)
node_modules/

# Environment files
.env
.env.local
EOF

# 5. Start Claude Code and begin workflow
# Use product-manager to create a PRD for user authentication
```

**Directory structure after setup**:
```
my-new-project/
├── .git/
├── .gitignore
└── documents/
    ├── 00-references/     # Input docs (BRDs, specs, research)
    ├── 01-prds/          # PRDs will be created here
    ├── 02-dev-tasks/      # Tasks (JSON/CSV) will be created here
    └── 03-test-cases/     # Test cases (JSON/CSV) will be created here
```

### Scenario 2: Next.js Project

Setting up MCP Sub-Agents for a Next.js project:

```bash
# 1. Create Next.js project
npx create-next-app@latest my-nextjs-app
cd my-nextjs-app

# 2. Add documents structure
mkdir -p documents/{00-references,01-prds,02-dev-tasks,03-test-cases}

# 3. Update .gitignore
echo "" >> .gitignore
echo "# MCP Sub-Agents" >> .gitignore
echo "tmp/" >> .gitignore

# 4. Start workflow with Next.js context
# In Claude Code:
# Use product-manager to create a PRD for dashboard feature.
#
# Tech stack: Next.js 15, App Router, Server Components, tRPC, Prisma, PostgreSQL
```

**Directory structure**:
```
my-nextjs-app/
├── app/
├── public/
├── documents/              # ← Added for MCP Sub-Agents
│   ├── 00-references/      # Input docs (BRDs, specs, research)
│   ├── 01-prds/
│   ├── 02-dev-tasks/
│   └── 03-test-cases/
├── package.json
└── tsconfig.json
```

### Scenario 3: React Native Project

Setting up for mobile development:

```bash
# 1. Create React Native project
npx react-native init MyMobileApp
cd MyMobileApp

# 2. Add documents structure
mkdir -p documents/{00-references,01-prds,02-dev-tasks,03-test-cases}

# 3. Update .gitignore
echo "" >> .gitignore
echo "# MCP Sub-Agents" >> .gitignore
echo "tmp/" >> .gitignore

# 4. Start with React Native savant
# In Claude Code:
# Use react-native-savant to design the app architecture for a social media app
```

## Existing Project Integration

### Adding to an Established Codebase

If you have an existing project and want to add MCP Sub-Agents workflow:

```bash
# 1. Navigate to existing project
cd /path/to/existing-project

# 2. Create documents structure
mkdir -p documents/{00-references,01-prds,02-dev-tasks,03-test-cases}

# 3. Add to .gitignore (if not already present)
echo "" >> .gitignore
echo "# MCP Sub-Agents" >> .gitignore
echo "documents/" >> .gitignore  # Or commit documents/ if you want version control
echo "tmp/" >> .gitignore

# 4. Optional: Create initial PRD for existing feature
# In Claude Code:
# Use product-manager to create a PRD for refactoring the authentication system.
#
# Current implementation: [describe current system]
# Goal: Migrate to NextAuth.js v5
```

### Should You Commit documents/?

**Option 1: Commit documents/ (Recommended)**

**Pros**:
- Full traceability from requirements to code
- Team can see PRDs, tasks, and test cases
- Version history of requirements changes
- Easy onboarding for new team members

**Cons**:
- Slightly larger repository
- Need to update when requirements change

**When to Use**: Most projects, especially team projects

```bash
# Keep documents/ in git
git add documents/
git commit -m "Add MCP Sub-Agents workflow artifacts"
```

**Option 2: Exclude documents/ (.gitignore)**

**Pros**:
- Smaller repository
- Artifacts regenerated as needed
- No version control overhead

**Cons**:
- Lose traceability
- Team can't see artifacts without regenerating

**When to Use**: Solo projects, experimental work, or when using external tools (Jira, TestRail) as source of truth

```bash
# Exclude documents/ from git
echo "documents/" >> .gitignore
```

## Complete Workflow Example

Let's walk through a complete example: Building a blog platform feature.

### Step 1: Create PRD

```bash
# In Claude Code, in your project directory
Use product-manager to create a PRD for blog post management feature.

Context:
- Users can create, edit, delete blog posts
- Rich text editor with markdown support
- Draft and publish workflow
- SEO optimization (meta tags, slugs)
- Image uploads and management
- Categories and tags

Tech stack: Next.js 15, Prisma, PostgreSQL, tRPC
```

**Output**: `documents/01-prds/blog-post-management-prd.md`

### Step 2: Generate Development Tasks

```bash
Use task-planner to generate development tasks from documents/01-prds/blog-post-management-prd.md

Team structure:
- 2 Backend developers (Node.js/TypeScript)
- 2 Frontend developers (React/Next.js)
- 1 QA engineer
- 1 DevOps engineer

Timeline: 4 weeks
```

**Output**:
- `documents/02-dev-tasks/blog-post-management-tasks.json` (35-45 tasks)
- `documents/02-dev-tasks/blog-post-management-tasks.csv`

### Step 3: Generate Test Cases

```bash
Use test-planner to generate test cases from documents/01-prds/blog-post-management-prd.md

Focus areas:
- Functional testing (CRUD operations, draft workflow)
- Security testing (authentication, authorization, XSS prevention)
- Performance testing (load times, image optimization)
- Integration testing (database, file storage)
```

**Output**:
- `documents/03-test-cases/blog-post-management-tests.json` (60-80 test cases)
- `documents/03-test-cases/blog-post-management-tests.csv`

### Step 4: Import to Project Tools

**Import Tasks to Jira**:
```bash
# Option 1: CSV import (Manual)
# 1. Open Jira → Projects → Your Project → "..." → Import
# 2. Select: documents/02-dev-tasks/blog-post-management-tasks.csv
# 3. Map columns and import

# Option 2: JSON import (API)
curl -X POST https://your-domain.atlassian.net/rest/api/3/issue/bulk \
  -H "Content-Type: application/json" \
  -d @documents/02-dev-tasks/blog-post-management-tasks.json
```

**Import Test Cases to TestRail**:
```bash
# Option 1: CSV import (Manual)
# 1. TestRail → Test Cases → Import → Import from CSV
# 2. Select: documents/03-test-cases/blog-post-management-tests.csv
# 3. Map columns and import

# Option 2: JSON import (API)
curl -X POST https://your-domain.testrail.io/index.php?/api/v2/add_cases/1 \
  -H "Content-Type: application/json" \
  -d @documents/03-test-cases/blog-post-management-tests.json
```

### Step 5: Implementation

Now your team has:
- ✅ Clear requirements (PRD)
- ✅ Actionable tasks in Jira (with estimates and dependencies)
- ✅ Comprehensive test cases in TestRail

**Sprint Planning**:
1. Review tasks in Jira, assign to team members
2. Follow dependency chains (TASK-001 → TASK-002 → TASK-003)
3. Track progress via Jira board
4. Execute tests from TestRail as features complete

## Project Organization

### Recommended Directory Structure

```
your-project/
├── src/                          # Your application code
│   ├── app/                      # Next.js App Router
│   ├── components/               # React components
│   ├── lib/                      # Utilities
│   └── server/                   # Backend code
├── documents/                    # MCP Sub-Agents artifacts
│   ├── README.md                 # Workflow guide
│   ├── 00-references/            # Input documents
│   │   ├── README.md
│   │   ├── brds/                 # Business Requirements
│   │   ├── tech-specs/           # Technical specs
│   │   └── user-research/        # User research
│   ├── 01-prds/                  # Product Requirements
│   │   ├── README.md
│   │   ├── blog-posts-prd.md
│   │   └── user-auth-prd.md
│   ├── 02-dev-tasks/             # Development tasks
│   │   ├── README.md
│   │   ├── blog-posts-tasks.json
│   │   ├── blog-posts-tasks.csv
│   │   ├── user-auth-tasks.json
│   │   └── user-auth-tasks.csv
│   └── 03-test-cases/            # Test cases
│       ├── README.md
│       ├── blog-posts-tests.json
│       ├── blog-posts-tests.csv
│       ├── user-auth-tests.json
│       └── user-auth-tests.csv
├── tests/                        # Actual test code
│   ├── e2e/                      # Playwright E2E tests
│   └── unit/                     # Unit tests
├── .gitignore
├── package.json
└── README.md
```

### Linking Artifacts to Code

**Best Practice**: Reference PRD and task IDs in commit messages and pull requests

**Example commit message**:
```
feat: implement blog post editor (TASK-015)

- Add rich text editor component
- Implement markdown preview
- Add image upload functionality

Related PRD: documents/01-prds/blog-post-management-prd.md
Task: TASK-015 (documents/02-dev-tasks/blog-post-management-tasks.csv)
Tests: TEST-023, TEST-024, TEST-025
```

**Example pull request**:
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

## Test Coverage
- Unit tests: `tests/unit/blog-editor.test.ts`
- E2E tests: `tests/e2e/blog-posts.spec.ts`
- TestRail: TEST-023 to TEST-030 (all passing)
```

## Best Practices

### 1. Start with PRD for Every Feature

Always begin with a PRD, even for small features:

```bash
# Good: Start with requirements
Use product-manager to create a PRD for password reset feature

# Less ideal: Jump straight to implementation
Use fullstack-nextjs to build a password reset feature
```

**Why?**: PRDs force you to think through requirements, edge cases, and success metrics before coding.

### 2. Use Consistent Naming

Follow kebab-case naming convention across all artifacts:

```
✅ Good:
- user-authentication-prd.md
- user-authentication-tasks.json
- user-authentication-tests.csv

❌ Bad:
- UserAuth-PRD.md
- user_auth_tasks.json
- UserAuthenticationTests.csv
```

### 3. Keep documents/ in Version Control

Commit documents/ to git for:
- Traceability from requirements to code
- Team collaboration and visibility
- Historical record of requirement changes
- Onboarding new team members

```bash
git add documents/
git commit -m "Add PRD and tasks for blog post feature"
git push
```

### 4. Regenerate When Requirements Change

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

### 5. Use Savants for Architecture, Specialists for Implementation

**When to use Savants**:
- Architectural decisions
- Technology selection
- Complex problem-solving
- Multi-domain coordination

```bash
Use fullstack-js-savant to design a real-time notification system
Use react-native-savant to choose state management for mobile app
Use java-spring-savant to design microservices architecture
```

**When to use Specialists**:
- Focused implementation tasks
- Specific technology implementation
- Code reviews and quality checks

```bash
Use fullstack-nextjs to build the notification UI with Server Components
Use backend-api to implement the tRPC router for notifications
Use code-reviewer to review the notification implementation
```

### 6. Review and Adjust Generated Artifacts

Generated tasks and test cases are a starting point. Review and adjust based on:
- Team velocity and capacity
- Technical constraints
- Business priorities
- Available resources

```bash
# After generation, review in Excel/Google Sheets
open documents/02-dev-tasks/blog-post-management-tasks.csv

# Make adjustments:
# - Refine effort estimates
# - Adjust priorities
# - Fix dependency chains
# - Break down large tasks (>40 hours)
```

### 7. Maintain Traceability Links

Create clear links between artifacts:

```markdown
# In your PRD (documents/01-prds/blog-post-management-prd.md)

## Related Artifacts
- **Tasks**: `documents/02-dev-tasks/blog-post-management-tasks.json`
- **Tests**: `documents/03-test-cases/blog-post-management-tests.json`
- **Jira Epic**: PROJ-123
- **TestRail Suite**: TS-456
```

### 8. Use Both JSON and CSV Formats

Both formats serve different purposes:

**JSON** → API integration, automation
```bash
# Import to Jira via API
curl -X POST https://your-domain.atlassian.net/rest/api/3/issue/bulk \
  -d @documents/02-dev-tasks/blog-post-management-tasks.json
```

**CSV** → Manual review, spreadsheet editing
```bash
# Open in Excel for review and adjustments
open documents/02-dev-tasks/blog-post-management-tasks.csv
```

## Troubleshooting

### Issue: "Agents not found"

**Problem**: Claude Code doesn't recognize agents like `product-manager` or `fullstack-js-savant`

**Solution**:
```bash
# 1. Verify agents are installed
ls -la ~/.claude/agents/

# 2. If empty, run install script
curl -sSL https://raw.githubusercontent.com/rcdelacruz/mcp-sub-agents/main/install.sh | bash

# 3. Restart Claude Code
# Exit and relaunch Claude Code
```

### Issue: "documents/ directory not found"

**Problem**: Agents fail because documents/ structure doesn't exist

**Solution**:
```bash
# Create the structure in your project directory
cd /path/to/your-project
mkdir -p documents/{01-prds,02-dev-tasks,03-test-cases}
```

### Issue: "Feature name mismatch across files"

**Problem**: PRD is `user-auth-prd.md` but tasks are `authentication-tasks.json`

**Solution**: Use consistent naming from the start
```bash
# Use the same feature name for all artifacts:
# ✅ user-authentication-prd.md
# ✅ user-authentication-tasks.json
# ✅ user-authentication-tests.csv
```

### Issue: "Tasks have invalid dependencies"

**Problem**: TASK-005 depends on TASK-099 which doesn't exist

**Solution**: Review and fix dependency chains manually
```bash
# 1. Open CSV in spreadsheet app
open documents/02-dev-tasks/user-authentication-tasks.csv

# 2. Check all dependencies reference valid task IDs
# 3. Fix circular dependencies
# 4. Ensure dependency chains flow logically
```

## Next Steps

After setting up your project with MCP Sub-Agents:

1. **Create Your First PRD**
   ```bash
   Use product-manager to create a PRD for [your first feature]
   ```

2. **Generate Tasks and Tests**
   ```bash
   Use task-planner to generate tasks from documents/01-prds/[feature]-prd.md
   Use test-planner to generate test cases from documents/01-prds/[feature]-prd.md
   ```

3. **Import to Project Tools**
   - Import tasks to Jira/Linear/GitHub Issues
   - Import test cases to TestRail/Zephyr/qTest

4. **Begin Implementation**
   - Assign tasks to team members
   - Execute tests as features complete
   - Track progress in project tools

5. **Iterate and Refine**
   - Update PRDs when requirements change
   - Regenerate tasks and tests
   - Gather feedback and improve workflow

## Related Documentation

- **[WORKFLOW-GUIDE.md](WORKFLOW-GUIDE.md)** - Complete Requirements → Implementation workflow
- **[SAVANT-ARCHITECTURE.md](SAVANT-ARCHITECTURE.md)** - Two-tier agent architecture
- **[WORKFLOW-COMMANDS.md](WORKFLOW-COMMANDS.md)** - Slash command reference
- **[documents/README.md](documents/README.md)** - Document organization guide
- **[README.md](README.md)** - Main project documentation

## Support and Feedback

- **Issues**: Report problems at https://github.com/rcdelacruz/mcp-sub-agents/issues
- **Discussions**: Ask questions in GitHub Discussions
- **Documentation**: All guides are in the mcp-sub-agents repository

---

**Happy building with MCP Sub-Agents!** 🚀
