#!/bin/bash

# Deployment Status Checker
# Helps coordinate between parallel AI development

echo "🚀 Checking Deployment Status..."
echo "=================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not in a git repository"
    exit 1
fi

# Check recent deployments (if Vercel is available)
if command -v vercel &> /dev/null; then
    echo "📊 Vercel Deployments:"
    echo "======================"
    vercel ls --limit=3
    echo ""
else
    echo "⚠️  Vercel CLI not found - skipping deployment check"
    echo ""
fi

echo "📊 Recent Git Activity:"
echo "======================"
git log --oneline -3

echo ""
echo "🔍 Current Branch Status:"
echo "========================"
git status --short

echo ""
echo "📝 Development Status:"
echo "====================="
if [ -f "DEVELOPMENT_STATUS.md" ]; then
    echo "✅ Development status file exists"
    echo "Last 5 lines:"
    tail -5 DEVELOPMENT_STATUS.md
else
    echo "❌ Development status file not found"
    echo "💡 Run: cp templates/DEVELOPMENT_STATUS.md ."
fi

echo ""
echo "🛠️  Project Status:"
echo "=================="
if [ -f "package.json" ]; then
    echo "✅ Node.js project detected"
    if [ -f "node_modules" ]; then
        echo "✅ Dependencies installed"
    else
        echo "⚠️  Dependencies not installed - run: npm install"
    fi
else
    echo "⚠️  No package.json found"
fi

echo ""
echo "🔄 Next Steps:"
echo "=============="
echo "1. Check if deployment is successful"
echo "2. Update DEVELOPMENT_STATUS.md if needed"
echo "3. Continue development or fix any issues"
echo "4. Run 'npm run build' to test locally"

echo ""
echo "📞 Quick Commands:"
echo "=================="
echo "• Check status: ./scripts/check-deployment.sh"
echo "• Update status: nano DEVELOPMENT_STATUS.md"
echo "• Test build: npm run build"
echo "• Deploy: git add . && git commit -m 'message' && git push"
