#!/bin/bash
# Pre-deploy check script for Sabatech.dev
# This script verifies that everything is ready for deployment to Cloudflare Pages

set -e

echo "🔍 Pre-deploy Check for Sabatech.dev"
echo "======================================"
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check 1: Node.js version
echo "📦 Check 1: Node.js version"
NODE_VERSION=$(node --version)
echo "Node version: $NODE_VERSION"
if [[ $NODE_VERSION == "v18"* ]] || [[ $NODE_VERSION == "v20"* ]] || [[ $NODE_VERSION == "v22"* ]]; then
    echo -e "${GREEN}✓ Node version compatible${NC}"
else
    echo -e "${RED}✗ Node version may not be compatible (recommended: 18, 20, or 22)${NC}"
fi
echo ""

# Check 2: Dependencies installed
echo "📦 Check 2: Dependencies installed"
if [ -d "node_modules" ]; then
    DEPS_COUNT=$(ls -1 node_modules | wc -l)
    echo -e "${GREEN}✓ Dependencies installed ($DEPS_COUNT packages)${NC}"
else
    echo -e "${RED}✗ Dependencies not installed. Run: npm install${NC}"
    exit 1
fi
echo ""

# Check 3: Build succeeds
echo "🔨 Check 3: Build test"
echo "Running: npm run build..."
if npm run build --silent; then
    BUILD_SIZE=$(du -sh dist | cut -f1)
    FILE_COUNT=$(find dist -type f | wc -l)
    echo -e "${GREEN}✓ Build successful${NC}"
    echo "  - Output size: $BUILD_SIZE"
    echo "  - Files created: $FILE_COUNT"
else
    echo -e "${RED}✗ Build failed${NC}"
    exit 1
fi
echo ""

# Check 4: Essential pages exist
echo "📄 Check 4: Essential pages exist"
REQUIRED_PAGES=(
    "dist/index.html"
    "dist/about/index.html"
    "dist/security/index.html"
    "dist/orquestacion/index.html"
    "dist/qa-framework/index.html"
    "dist/team/index.html"
    "dist/contact/index.html"
    "dist/blog/index.html"
)

MISSING_PAGES=0
for page in "${REQUIRED_PAGES[@]}"; do
    if [ -f "$page" ]; then
        echo -e "${GREEN}✓${NC} $page"
    else
        echo -e "${RED}✗${NC} $page (MISSING)"
        MISSING_PAGES=$((MISSING_PAGES + 1))
    fi
done

if [ $MISSING_PAGES -eq 0 ]; then
    echo -e "${GREEN}✓ All essential pages exist${NC}"
else
    echo -e "${RED}✗ $MISSING_PAGES pages missing${NC}"
    exit 1
fi
echo ""

# Check 5: Assets optimized
echo "🖼️  Check 5: Assets optimized"
TOTAL_SIZE=$(du -sb dist | cut -f1)
TOTAL_SIZE_MB=$(echo "scale=2; $TOTAL_SIZE / 1024 / 1024" | bc)

if (( $(echo "$TOTAL_SIZE_MB < 5" | bc -l) )); then
    echo -e "${GREEN}✓ Total size optimal: ${TOTAL_SIZE_MB}MB${NC}"
else
    echo -e "${YELLOW}⚠ Total size: ${TOTAL_SIZE_MB}MB (consider optimization)${NC}"
fi
echo ""

# Check 6: HTML structure valid
echo "🏗️  Check 6: HTML structure validation"
HTML_FILES=$(find dist -name "*.html" | head -5)
VALID_HTML=0

for html in $HTML_FILES; do
    if grep -q "<html" "$html" && grep -q "</html>" "$html"; then
        VALID_HTML=$((VALID_HTML + 1))
    else
        echo -e "${RED}✗ Invalid HTML structure in $html${NC}"
    fi
done

if [ $VALID_HTML -eq 5 ]; then
    echo -e "${GREEN}✓ HTML structure looks valid${NC}"
fi
echo ""

# Check 7: Git status
echo "📊 Check 7: Git status"
if [ -d ".git" ]; then
    BRANCH=$(git branch --show-current)
    COMMITS_BEHIND=$(git rev-list --count HEAD..origin/main 2>/dev/null || echo "0")
    COMMITS_AHEAD=$(git rev-list --count origin/main..HEAD 2>/dev/null || echo "0")

    echo "  - Current branch: $BRANCH"
    echo "  - Commits behind origin: $COMMITS_BEHIND"
    echo "  - Commits ahead of origin: $COMMITS_AHEAD"

    if [ $COMMITS_BEHIND -eq 0 ]; then
        echo -e "${GREEN}✓ Git is up to date${NC}"
    else
        echo -e "${YELLOW}⚠ You are $COMMITS_BEHIND commits behind. Run: git pull${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Git repository not initialized${NC}"
fi
echo ""

# Summary
echo "======================================"
echo "✅ Pre-deploy check PASSED"
echo ""
echo "Ready to deploy to Cloudflare Pages!"
echo "1. Push to GitHub (if not already done)"
echo "2. Cloudflare Pages will auto-deploy"
echo "3. Verify at https://sabatech.dev"
echo ""
