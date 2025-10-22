# Test Cases

This directory contains generated test case suites in JSON and CSV formats.

## Purpose

Test cases are created by the **test-planner** agent and provide:
- Comprehensive test coverage for all PRD requirements
- Manual test scripts for QA teams
- Test case import for test management tools
- Coverage across functional, integration, E2E, security, and performance testing

## File Naming Convention

Files follow the pattern: `[feature-name]-tests.[ext]`

Examples:
- `user-authentication-tests.json`
- `user-authentication-tests.csv`
- `payment-processing-tests.json`
- `payment-processing-tests.csv`

## File Formats

### JSON Format (`*.json`)

**Use for**:
- TestRail API import
- Zephyr API import
- qTest API import
- Custom test automation

**Structure**:
```json
[
  {
    "test_id": "TEST-001",
    "scenario": "User successfully registers with valid email and password",
    "steps": "1. Navigate to registration page\n2. Enter valid email address\n3. Enter password (min 8 chars)\n4. Click Register button",
    "expected": "User account created successfully, confirmation email sent, user redirected to dashboard",
    "priority": "High",
    "type": "Functional",
    "prerequisites": "None"
  }
]
```

### CSV Format (`*.csv`)

**Use for**:
- Excel/Google Sheets import
- Manual test management tool import
- Easy viewing and editing

**Structure**:
```csv
test_id,scenario,steps,expected,priority,type,prerequisites
TEST-001,User successfully registers with valid email and password,"1. Navigate to registration page
2. Enter valid email address
3. Enter password (min 8 chars)
4. Click Register button","User account created successfully, confirmation email sent, user redirected to dashboard",High,Functional,None
```

## Generating Test Cases

Use the **test-planner** agent:

```bash
Use test-planner to generate test cases from documents/01-prds/[feature-name]-prd.md
```

**With focus areas**:
```bash
Use test-planner to generate test cases from documents/01-prds/payment-processing-prd.md

Focus on:
- Security testing (authentication, authorization)
- Performance testing (load times, concurrent users)
- Integration testing (payment gateway, email service)
```

## Test Case Fields

- **test_id**: Unique identifier (TEST-001, TEST-002, etc.)
- **scenario**: Clear description of what is being tested (10-15 words)
- **steps**: Numbered, step-by-step instructions (use `\n` for line breaks)
- **expected**: Specific, measurable expected behavior
- **priority**: `High` (critical), `Medium` (important), `Low` (nice-to-have)
- **type**: `Functional`, `Integration`, `E2E`, `Performance`, `Security`, `Usability`, `Boundary`, `Negative`
- **prerequisites**: Conditions required before test execution or `None`

## Test Types

- **Functional (60-70%)**: Tests specific feature functionality
- **Integration (15-20%)**: Tests component interactions
- **E2E (10-15%)**: Tests complete user journeys
- **Performance (5-10%)**: Tests speed, load, scalability
- **Security (5-10%)**: Tests authentication, authorization, vulnerabilities
- **Usability (5%)**: Tests user experience, accessibility
- **Boundary**: Tests limits and edge cases
- **Negative**: Tests error handling and invalid inputs

## Test Coverage

Comprehensive test suite includes:
- **50-60%** Positive tests (happy paths)
- **20-30%** Negative tests (error handling)
- **10-15%** Boundary tests (edge cases)
- **5-10%** Integration tests
- **5-10%** Security tests
- **5%** Usability/Accessibility tests

## Importing into Test Management Tools

### TestRail

**Via CSV**:
1. Open TestRail → Test Cases
2. Click "Import" → "Import from CSV"
3. Select CSV file
4. Map columns to TestRail fields
5. Import test cases

**Via API (JSON)**:
```bash
# Use TestRail API to import JSON
curl -X POST https://your-domain.testrail.io/index.php?/api/v2/add_cases/1 \
  -H "Content-Type: application/json" \
  -d @user-authentication-tests.json
```

### Zephyr

**Via CSV**:
1. Open Zephyr → Test Repository
2. Click "Import"
3. Select CSV file
4. Map columns and import

**Via API (JSON)**:
Use Zephyr API to import JSON test cases programmatically.

### qTest

**Via CSV**:
1. Open qTest → Test Design
2. Click "Import" → "Import Test Cases"
3. Select CSV file
4. Map columns to qTest fields
5. Import test cases

## Using Test Cases

### Manual Testing
1. Open CSV in Excel/Google Sheets
2. Add "Status" and "Notes" columns
3. Execute tests following the steps
4. Record results and findings

### Automated Testing
1. Use JSON as specification for automated tests
2. Generate Playwright/Cypress tests from test cases
3. Use **qa-tester** agent to implement automation

## Tips

- Review test cases for completeness and accuracy
- Prioritize High priority tests for first execution
- Execute tests in logical order (setup → functional → integration → E2E)
- Update test cases when requirements change
- Track test execution results separately
- Create test execution runs in test management tools
- Link test cases back to PRD requirements for traceability
