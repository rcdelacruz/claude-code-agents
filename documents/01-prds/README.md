# Product Requirements Documents (PRDs)

This directory contains all generated Product Requirements Documents.

## Purpose

PRDs are created by the **product-manager** agent and serve as the foundation for:
- Development task breakdown (task-planner)
- Test case generation (test-planner)
- Implementation planning

## File Naming Convention

Files follow the pattern: `[feature-name]-prd.md`

Examples:
- `user-authentication-prd.md`
- `payment-processing-prd.md`
- `dashboard-analytics-prd.md`

Use kebab-case (lowercase with hyphens) for feature names.

## Creating a PRD

Use the **product-manager** agent:

```bash
Use product-manager to create a PRD for [feature name]

Input documents (optional):
- BRD: /path/to/business-requirements.md
- User research: /path/to/research.pdf
- Technical specs: /path/to/specs.md
```

Or provide context directly:

```bash
Use product-manager to create a PRD for a real-time chat feature.

Context:
- Users need to send messages in real-time
- Must support file attachments (images, PDFs)
- Should show typing indicators
- Mobile-first design
```

## PRD Structure

All PRDs follow a consistent 5-section structure:

1. **Objective & Success Metrics**
   - Problem statement
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

## Next Steps After Creating PRD

1. **Generate Development Tasks**:
   ```bash
   Use task-planner to generate tasks from documents/01-prds/[your-prd].md
   ```

2. **Generate Test Cases**:
   ```bash
   Use test-planner to generate test cases from documents/01-prds/[your-prd].md
   ```

3. **Begin Implementation**:
   - Import tasks into Jira/Linear
   - Import tests into TestRail/Zephyr
   - Start development and testing

## Tips

- Keep PRDs focused and actionable (3-8 pages)
- Update PRD when requirements change
- Version control PRDs in git
- Archive old versions instead of deleting
- Link PRD to tasks and test cases for traceability
