#!/bin/bash

# Project Setup Script
# Initializes a new project with AI development workflow

echo "🚀 Setting up AI Development Workflow..."
echo "========================================"

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not in a git repository"
    echo "💡 Run: git init"
    exit 1
fi

# Create scripts directory if it doesn't exist
mkdir -p scripts

# Copy workflow files
echo "📁 Copying workflow files..."

if [ -f "../templates/DEVELOPMENT_STATUS.md" ]; then
    cp ../templates/DEVELOPMENT_STATUS.md .
    echo "✅ DEVELOPMENT_STATUS.md copied"
else
    echo "⚠️  DEVELOPMENT_STATUS.md template not found"
fi

if [ -f "../templates/ERROR_PREVENTION_GUIDE.md" ]; then
    cp ../templates/ERROR_PREVENTION_GUIDE.md .
    echo "✅ ERROR_PREVENTION_GUIDE.md copied"
else
    echo "⚠️  ERROR_PREVENTION_GUIDE.md template not found"
fi

if [ -f "../scripts/check-deployment.sh" ]; then
    cp ../scripts/check-deployment.sh scripts/
    chmod +x scripts/check-deployment.sh
    echo "✅ check-deployment.sh copied and made executable"
else
    echo "⚠️  check-deployment.sh script not found"
fi

# Update DEVELOPMENT_STATUS.md with project info
if [ -f "DEVELOPMENT_STATUS.md" ]; then
    # Get project name from package.json or directory name
    if [ -f "package.json" ]; then
        PROJECT_NAME=$(grep '"name"' package.json | cut -d'"' -f4)
    else
        PROJECT_NAME=$(basename $(pwd))
    fi
    
    # Update the template with project name
    sed -i.bak "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" DEVELOPMENT_STATUS.md
    rm DEVELOPMENT_STATUS.md.bak
    echo "✅ DEVELOPMENT_STATUS.md updated with project name: $PROJECT_NAME"
fi

# Check for common project types and add specific configurations
if [ -f "package.json" ]; then
    echo ""
    echo "🔍 Detecting project type..."
    
    if grep -q "next" package.json; then
        echo "✅ Next.js project detected"
        echo "💡 Add to package.json scripts:"
        echo "   \"check-deployment\": \"./scripts/check-deployment.sh\""
    fi
    
    if grep -q "react" package.json; then
        echo "✅ React project detected"
    fi
    
    if grep -q "prisma" package.json; then
        echo "✅ Prisma project detected"
        echo "💡 Make sure to run: npm run db:generate"
    fi
fi

echo ""
echo "🎉 Setup Complete!"
echo "=================="
echo ""
echo "Next steps:"
echo "1. Update DEVELOPMENT_STATUS.md with your current task"
echo "2. Copy CLAUDE_MEMORY_CARD.md content to Claude Code memory"
echo "3. Run: ./scripts/check-deployment.sh"
echo "4. Start developing with parallel AI workflow!"
echo ""
echo "📚 Documentation:"
echo "• README.md - Complete setup guide"
echo "• CLAUDE_MEMORY_CARD.md - Copy to Claude Code memory"
echo "• DEVELOPMENT_STATUS.md - Communication hub"
echo "• ERROR_PREVENTION_GUIDE.md - Error solutions"
