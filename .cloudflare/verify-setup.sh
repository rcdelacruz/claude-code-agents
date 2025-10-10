#!/bin/bash

# Cloudflare Pages Setup Verification Script
# Checks if all required files and configurations are in place

set -e

echo "========================================"
echo "Cloudflare Pages Setup Verification"
echo "========================================"
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

# Function to check file exists
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} Found: $1"
        return 0
    else
        echo -e "${RED}✗${NC} Missing: $1"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

# Function to check directory exists
check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} Found: $1"
        return 0
    else
        echo -e "${RED}✗${NC} Missing: $1"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

# Function to check command exists
check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} Command available: $1"
        return 0
    else
        echo -e "${YELLOW}⚠${NC} Command not found: $1 (optional)"
        WARNINGS=$((WARNINGS + 1))
        return 1
    fi
}

echo "Checking configuration files..."
echo "--------------------------------"
check_file "mkdocs.yml"
check_file "wrangler.toml"
check_file "package.json"
check_file ".gitignore"
echo ""

echo "Checking documentation files..."
echo "--------------------------------"
check_file "CLOUDFLARE-DEPLOYMENT.md"
check_file "QUICK-START-CLOUDFLARE.md"
check_file "CLOUDFLARE-SETUP-SUMMARY.md"
check_file "DOCUMENTATION.md"
echo ""

echo "Checking GitHub Actions workflow..."
echo "--------------------------------"
check_dir ".github/workflows"
check_file ".github/workflows/cloudflare-pages.yml"
echo ""

echo "Checking deployment scripts..."
echo "--------------------------------"
check_dir ".cloudflare"
check_file ".cloudflare/deploy.sh"
check_file ".cloudflare/README.md"
check_file ".cloudflare/DEPLOYMENT-FLOW.md"

if [ -f ".cloudflare/deploy.sh" ]; then
    if [ -x ".cloudflare/deploy.sh" ]; then
        echo -e "${GREEN}✓${NC} deploy.sh is executable"
    else
        echo -e "${YELLOW}⚠${NC} deploy.sh is not executable (run: chmod +x .cloudflare/deploy.sh)"
        WARNINGS=$((WARNINGS + 1))
    fi
fi
echo ""

echo "Checking documentation source..."
echo "--------------------------------"
check_dir "docs"
check_file "docs/index.md"
echo ""

echo "Checking required commands..."
echo "--------------------------------"
check_command "python3" || check_command "python"
check_command "pip" || check_command "pip3"
check_command "mkdocs"
check_command "wrangler"
check_command "npm"
echo ""

echo "Checking MkDocs build..."
echo "--------------------------------"
if command -v mkdocs &> /dev/null; then
    if mkdocs build --quiet 2>&1; then
        echo -e "${GREEN}✓${NC} MkDocs build successful"
        if [ -d "site" ]; then
            echo -e "${GREEN}✓${NC} Build output directory exists: site/"
            FILE_COUNT=$(find site -type f | wc -l)
            echo -e "${GREEN}✓${NC} Generated $FILE_COUNT files"
        fi
    else
        echo -e "${RED}✗${NC} MkDocs build failed"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo -e "${YELLOW}⚠${NC} MkDocs not installed - skipping build test"
    echo "    Install with: pip install mkdocs mkdocs-material"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

echo "Checking .gitignore..."
echo "--------------------------------"
if grep -q "site/" .gitignore 2>/dev/null; then
    echo -e "${GREEN}✓${NC} site/ directory is in .gitignore"
else
    echo -e "${YELLOW}⚠${NC} site/ directory not in .gitignore"
    WARNINGS=$((WARNINGS + 1))
fi

if grep -q "node_modules/" .gitignore 2>/dev/null; then
    echo -e "${GREEN}✓${NC} node_modules/ is in .gitignore"
else
    echo -e "${YELLOW}⚠${NC} node_modules/ not in .gitignore"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

echo "========================================"
echo "Verification Summary"
echo "========================================"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ Perfect!${NC} All checks passed."
    echo ""
    echo "You're ready to deploy to Cloudflare Pages!"
    echo ""
    echo "Next steps:"
    echo "  1. Get Cloudflare API token and Account ID"
    echo "  2. Add GitHub secrets (for automated deployment)"
    echo "  3. Push to main branch OR deploy manually with Wrangler"
    echo ""
    echo "Documentation:"
    echo "  - Quick Start: QUICK-START-CLOUDFLARE.md"
    echo "  - Full Guide: CLOUDFLARE-DEPLOYMENT.md"
    echo "  - Setup Summary: CLOUDFLARE-SETUP-SUMMARY.md"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ Setup complete with $WARNINGS warning(s)${NC}"
    echo ""
    echo "Warnings are optional items. You can still deploy."
    echo ""
    echo "To install optional tools:"
    echo "  - MkDocs: pip install mkdocs mkdocs-material"
    echo "  - Wrangler: npm install -g wrangler"
    exit 0
else
    echo -e "${RED}✗ Setup incomplete${NC}"
    echo "  Errors: $ERRORS"
    echo "  Warnings: $WARNINGS"
    echo ""
    echo "Please fix the errors above before deploying."
    exit 1
fi
