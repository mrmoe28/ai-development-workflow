#!/bin/bash

# Setup aliases for easy workflow file access
# Run this once to add aliases to your shell profile

WORKFLOW_DIR="/Users/ekodevapps/Documents/ai-development-workflow"
SHELL_PROFILE=""

# Detect shell and set profile file
if [ -n "$ZSH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_PROFILE="$HOME/.bashrc"
else
    SHELL_PROFILE="$HOME/.profile"
fi

echo "🔧 Setting up workflow aliases..."
echo "Shell profile: $SHELL_PROFILE"

# Create aliases
cat >> "$SHELL_PROFILE" << 'EOF'

# AI Development Workflow Aliases
# Quick access to workflow files without adding them to your app
alias workflow-memory='/Users/ekodevapps/Documents/ai-development-workflow/scripts/workflow-ref.sh memory'
alias workflow-error='/Users/ekodevapps/Documents/ai-development-workflow/scripts/workflow-ref.sh error'
alias workflow-status='/Users/ekodevapps/Documents/ai-development-workflow/scripts/workflow-ref.sh status'
alias workflow-setup='/Users/ekodevapps/Documents/ai-development-workflow/scripts/workflow-ref.sh setup'
alias workflow-docs='/Users/ekodevapps/Documents/ai-development-workflow/scripts/workflow-ref.sh readme'
alias workflow-list='/Users/ekodevapps/Documents/ai-development-workflow/scripts/workflow-ref.sh list'

EOF

echo "✅ Aliases added to $SHELL_PROFILE"
echo ""
echo "🎉 Setup complete! Now you can use:"
echo "  workflow-memory  - Show Claude memory card"
echo "  workflow-error   - Show error prevention guide"
echo "  workflow-status  - Show development status template"
echo "  workflow-setup   - Show workflow setup guide"
echo "  workflow-docs    - Show main documentation"
echo "  workflow-list    - List all available files"
echo ""
echo "💡 Run 'source $SHELL_PROFILE' or restart your terminal to use the aliases"
