# Documents Directory

This directory contains all generated documents from the Claude Code Agents workflow.

## Directory Structure

```
documents/
├── 00-references/    # Input documents (BRDs, specs, research, designs)
├── 01-prds/          # Product Requirements Documents (PRDs)
├── 02-dev-tasks/     # Development task breakdowns
└── 03-test-cases/    # Test case suites
```

## Workflow

### 0. Add Reference Documents (`00-references/`) - Optional

Store input documents for PRD creation:

```bash
# Organize reference documents by type
documents/00-references/
├── brds/              # Business Requirements Documents
├── tech-specs/        # Technical specifications
├── user-research/     # User research, interviews, surveys
├── designs/           # UI/UX designs, wireframes, mockups
└── compliance/        # Legal, security, compliance docs
```

See `00-references/README.md` for detailed organization guide.

### 1. Generate PRD (`01-prds/`)

Use the **product-manager** agent to create PRDs:

```bash
Use product-manager to create a PRD for [feature name]

Input documents (optional):
- BRD: documents/00-references/brds/[feature]-brd.md
- User research: documents/00-references/user-research/[feature]-research.pdf
- Tech specs: documents/00-references/tech-specs/current-system.md
```

**Output**: PRD saved to `documents/01-prds/[feature-name]-prd.md`

### 2. Generate Development Tasks (`02-dev-tasks/`)

Use the **task-planner** agent to break down PRD into tasks:

```bash
Use task-planner to generate development tasks from documents/01-prds/[feature-name]-prd.md
```

**Outputs**:
- `documents/02-dev-tasks/[feature-name]-tasks.json` (for Jira, Linear, GitHub Issues)
- `documents/02-dev-tasks/[feature-name]-tasks.csv` (for Excel, Google Sheets)

### 3. Generate Test Cases (`03-test-cases/`)

Use the **test-planner** agent to generate test cases from PRD:

```bash
Use test-planner to generate test cases from documents/01-prds/[feature-name]-prd.md
```

**Outputs**:
- `documents/03-test-cases/[feature-name]-tests.json` (for TestRail, Zephyr, qTest)
- `documents/03-test-cases/[feature-name]-tests.csv` (for Excel, Google Sheets)

## File Naming Convention

All files follow the naming pattern: `[feature-name]-[type].[ext]`

Examples:
- `user-authentication-prd.md`
- `user-authentication-tasks.json`
- `user-authentication-tasks.csv`
- `user-authentication-tests.json`
- `user-authentication-tests.csv`

## Importing into Project Tools

### Development Tasks

**Jira**:
1. Use the JSON file: `02-dev-tasks/[feature]-tasks.json`
2. Import via Jira API or CSV import (use the CSV file)

**Linear**:
1. Use the CSV file: `02-dev-tasks/[feature]-tasks.csv`
2. Import via Linear's CSV import feature

**GitHub Issues**:
1. Use the JSON file with GitHub CLI or API
2. Or convert to CSV for manual import

### Test Cases

**TestRail**:
1. Use the CSV file: `03-test-cases/[feature]-tests.csv`
2. Import via TestRail's CSV import

**Zephyr**:
1. Use the JSON file for API import
2. Or use the CSV file for manual import

**qTest**:
1. Use the CSV file: `03-test-cases/[feature]-tests.csv`
2. Import via qTest's import feature

## Tips

1. **Keep PRDs in version control**: Track changes to requirements over time
2. **Regenerate tasks/tests**: When PRD changes, regenerate tasks and tests
3. **Archive old versions**: Move outdated files to an `archive/` subdirectory
4. **Use meaningful names**: Use kebab-case for feature names (e.g., `user-authentication`, `payment-processing`)

## Example Workflow

```bash
# Step 0: Optional - Add reference documents
# Copy BRD, research, specs to documents/00-references/
cp ~/Downloads/auth-brd.pdf documents/00-references/brds/
cp ~/Downloads/user-research.pdf documents/00-references/user-research/

# Step 1: Create PRD
Use product-manager to create a PRD for user authentication feature

Input documents:
- BRD: documents/00-references/brds/auth-brd.pdf
- User research: documents/00-references/user-research/user-research.pdf

# Saves to: documents/01-prds/user-authentication-prd.md

# Step 2: Generate tasks
Use task-planner to generate tasks from documents/01-prds/user-authentication-prd.md
# Saves to:
#   - documents/02-dev-tasks/user-authentication-tasks.json
#   - documents/02-dev-tasks/user-authentication-tasks.csv

# Step 3: Generate test cases
Use test-planner to generate test cases from documents/01-prds/user-authentication-prd.md
# Saves to:
#   - documents/03-test-cases/user-authentication-tests.json
#   - documents/03-test-cases/user-authentication-tests.csv

# Step 4: Import into tools
# - Import JSON to Jira/Linear
# - Import CSV to TestRail
# - Start development and testing!
```
