# Reference Documents

This directory contains input documents and reference materials used to create PRDs.

## Purpose

The `00-references/` directory stores:
- **Business Requirements Documents (BRDs)** - High-level business needs and objectives
- **Technical Specifications** - Existing system documentation, API specs, architecture diagrams
- **User Research** - User interviews, surveys, personas, user journeys
- **Market Research** - Competitive analysis, market trends, industry reports
- **Design Documents** - UI/UX designs, wireframes, mockups, style guides
- **User Manuals** - Existing product documentation, help guides
- **Meeting Notes** - Stakeholder meetings, requirement gathering sessions
- **Compliance Documents** - Legal requirements, security standards, regulations

## Workflow Position

```
00-references/        ← Input documents (BRDs, research, specs)
      ↓
01-prds/             ← PRDs created from reference materials
      ↓
02-dev-tasks/        ← Tasks generated from PRDs
      ↓
03-test-cases/       ← Test cases generated from PRDs
```

## File Organization

### By Document Type

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
├── compliance/              # Legal and compliance docs
│   ├── gdpr-requirements.md
│   └── security-standards.pdf
└── meetings/                # Meeting notes
    └── stakeholder-kickoff.md
```

### By Feature

Alternatively, organize by feature if you have many reference docs:

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

## Using Reference Documents

### When Creating a PRD

Reference input documents when using the product-manager agent:

```bash
Use product-manager to create a PRD for user authentication feature.

Input documents:
- BRD: documents/00-references/user-authentication/brd.md
- Security requirements: documents/00-references/user-authentication/security-requirements.pdf
- User research: documents/00-references/user-authentication/user-research.pdf

Additional context:
- Must comply with GDPR and SOC 2
- Target: Enterprise customers
- Timeline: 6 weeks
```

### Linking References in PRDs

In your generated PRD, include a "Reference Documents" section:

```markdown
# User Authentication Feature - PRD

## Reference Documents

This PRD was created using the following reference materials:

- **BRD**: `documents/00-references/user-authentication/brd.md`
- **Security Requirements**: `documents/00-references/compliance/security-standards.pdf`
- **User Research**: `documents/00-references/user-research/user-interviews.pdf`
- **Competitor Analysis**: `documents/00-references/market-research/auth-competitors.md`
- **Technical Specs**: `documents/00-references/tech-specs/current-auth-system.md`
```

## File Formats Supported

The product-manager agent can process various file formats:

- **Markdown** (`.md`) - Preferred for text documents
- **PDF** (`.pdf`) - BRDs, research reports, compliance docs
- **Word** (`.docx`) - Business documents
- **Images** (`.png`, `.jpg`, `.svg`) - Diagrams, wireframes, mockups
- **CSV** (`.csv`) - Survey data, analytics
- **JSON** (`.json`) - API specifications, data schemas

## Best Practices

### 1. Version Control

Commit reference documents to git for team access and history:

```bash
git add documents/00-references/
git commit -m "Add reference docs for user authentication feature"
```

### 2. Keep Original Files

Never modify original reference documents. If you need to make changes:
- Create a new version with a date suffix
- Add notes in a separate markdown file
- Reference the original in your notes

```
✅ Good:
- user-auth-brd-v1.0-2024-01-15.pdf (original)
- user-auth-brd-v2.0-2024-02-20.pdf (updated)
- notes-on-brd-changes.md (change notes)

❌ Bad:
- user-auth-brd.pdf (overwritten original, no history)
```

### 3. Use Descriptive Names

Use clear, descriptive filenames with dates when relevant:

```
✅ Good:
- payment-brd-enterprise-plan-2024-01.pdf
- user-interview-summary-feb-2024.md
- stripe-api-integration-spec.pdf

❌ Bad:
- brd.pdf
- interview.md
- spec.pdf
```

### 4. Organize by Project Phase

For large projects, organize by implementation phase:

```
00-references/
├── phase-1-mvp/
│   ├── brd.md
│   ├── user-research.pdf
│   └── wireframes/
├── phase-2-enterprise/
│   ├── enterprise-requirements.md
│   └── security-audit.pdf
└── phase-3-scale/
    ├── performance-requirements.md
    └── architecture-options.md
```

### 5. Create Index Files

For large reference libraries, create index files:

```markdown
# Reference Documents Index

## User Authentication
- BRD: `00-references/user-authentication/brd.md`
- Security: `00-references/compliance/security-standards.pdf`
- Research: `00-references/user-research/auth-user-interviews.pdf`

## Payment Processing
- BRD: `00-references/payment-processing/brd.md`
- Stripe Docs: `00-references/tech-specs/stripe-api.pdf`
- Compliance: `00-references/compliance/pci-dss.pdf`
```

## Common Use Cases

### Use Case 1: BRD to PRD Conversion

Starting with a Business Requirements Document:

```bash
# 1. Add BRD to references
cp ~/Downloads/user-auth-brd.pdf documents/00-references/brds/

# 2. Create PRD from BRD
Use product-manager to create a PRD for user authentication feature.

Input documents:
- BRD: documents/00-references/brds/user-auth-brd.pdf

Tech stack: Next.js 15, NextAuth.js v5, Prisma, PostgreSQL
```

### Use Case 2: Multiple Reference Documents

Combining multiple sources:

```bash
Use product-manager to create a PRD for payment processing feature.

Input documents:
- BRD: documents/00-references/payment-processing/brd.md
- User research: documents/00-references/user-research/payment-preferences.pdf
- Compliance: documents/00-references/compliance/pci-dss.pdf
- Tech specs: documents/00-references/tech-specs/stripe-integration.md
- Competitor analysis: documents/00-references/market-research/payment-competitors.md

Additional context:
- Must support Stripe, PayPal, and Apple Pay
- Target: B2C SaaS product
- Compliance: PCI DSS Level 1
```

### Use Case 3: Migrating Existing Documentation

Converting existing documentation into MCP Sub-Agents workflow:

```bash
# 1. Copy all existing docs to 00-references
cp -r ~/old-project/docs/* documents/00-references/

# 2. Organize by type
# Move BRDs to brds/, specs to tech-specs/, etc.

# 3. Create PRDs from existing documentation
Use product-manager to create a PRD for refactoring the authentication system.

Input documents:
- Current system docs: documents/00-references/tech-specs/current-auth.md
- User feedback: documents/00-references/user-research/auth-feedback.pdf
- Security audit: documents/00-references/compliance/security-audit-2024.pdf

Goal: Migrate to NextAuth.js v5 with enhanced security
```

## Reference Document Templates

### BRD Template (Markdown)

Save as: `00-references/brds/[feature]-brd.md`

```markdown
# Business Requirements Document: [Feature Name]

## 1. Executive Summary
- Business problem
- Proposed solution
- Expected outcomes

## 2. Business Objectives
- Strategic goals
- Success metrics
- Target audience

## 3. Functional Requirements
- Must-have features (P0)
- Should-have features (P1)
- Nice-to-have features (P2)

## 4. Constraints
- Budget
- Timeline
- Resources
- Technical limitations

## 5. Stakeholders
- Business owner
- Product manager
- Development team
- End users

## 6. Success Criteria
- KPIs
- Acceptance criteria
- Launch criteria

## 7. Risks and Dependencies
- Identified risks
- Mitigation strategies
- External dependencies
```

### User Research Template (Markdown)

Save as: `00-references/user-research/[feature]-research.md`

```markdown
# User Research: [Feature Name]

## Research Methodology
- Interview dates: [dates]
- Participants: [number]
- Methodology: [qualitative/quantitative]

## Key Findings
1. Finding 1
2. Finding 2
3. Finding 3

## User Personas
### Persona 1: [Name]
- Demographics
- Goals
- Pain points
- Behaviors

## User Journeys
### Journey 1: [Scenario]
- Steps
- Pain points
- Opportunities

## Recommendations
- Priority 1
- Priority 2
- Priority 3

## Supporting Data
- Survey results
- Interview transcripts
- Analytics data
```

## Tips

- **Keep reference docs organized** - Use consistent structure and naming
- **Link to references in PRDs** - Maintain traceability
- **Version control reference docs** - Track changes over time
- **Archive old versions** - Don't delete, archive for history
- **Create README files** - Document what each reference contains
- **Use relative paths** - Makes references portable across environments
- **Compress large files** - Keep repository size manageable

## Example Workflow

Complete workflow showing how reference documents flow through the system:

```bash
# 1. Gather reference documents
# - Receive BRD from product team
# - Collect user research from UX team
# - Get technical specs from engineering
# - Review compliance requirements

# 2. Organize in 00-references/
documents/00-references/
├── brds/payment-brd.pdf
├── user-research/payment-preferences.pdf
├── tech-specs/stripe-api.md
└── compliance/pci-dss.pdf

# 3. Create PRD using references
Use product-manager to create a PRD for payment processing.

Input documents:
- BRD: documents/00-references/brds/payment-brd.pdf
- User research: documents/00-references/user-research/payment-preferences.pdf
- Tech specs: documents/00-references/tech-specs/stripe-api.md
- Compliance: documents/00-references/compliance/pci-dss.pdf

# 4. PRD generated → documents/01-prds/payment-processing-prd.md

# 5. Generate tasks from PRD
Use task-planner to generate tasks from documents/01-prds/payment-processing-prd.md

# 6. Generate test cases from PRD
Use test-planner to generate test cases from documents/01-prds/payment-processing-prd.md

# 7. Import to project tools and implement
```

## Related Documentation

- **[documents/README.md](../README.md)** - Main workflow documentation
- **[documents/01-prds/README.md](../01-prds/README.md)** - PRD creation guide
- **[WORKFLOW-GUIDE.md](../../WORKFLOW-GUIDE.md)** - Complete workflow guide
- **[NEW-PROJECT-GUIDE.md](../../NEW-PROJECT-GUIDE.md)** - New project setup guide
