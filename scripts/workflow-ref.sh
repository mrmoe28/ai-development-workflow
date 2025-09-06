#!/bin/bash

# Workflow Reference Tool
# Use this from any directory to reference workflow files without adding them to your app

WORKFLOW_DIR="/Users/ekodevapps/Documents/ai-development-workflow"

# Function to show file content
show_file() {
    local filename="$1"
    local filepath="$WORKFLOW_DIR/$filename"
    
    if [ -f "$filepath" ]; then
        echo "📄 Content of $filename:"
        echo "=================================="
        cat "$filepath"
    else
        echo "❌ File not found: $filename"
        echo "Available files:"
        find "$WORKFLOW_DIR" -name "*.md" -type f | sed 's|.*/||' | sort
    fi
}

# Quick access functions
case "$1" in
    "memory"|"claude-memory")
        show_file "CLAUDE_MEMORY_CARD.md"
        ;;
    "error"|"errors"|"prevention")
        show_file "templates/ERROR_PREVENTION_GUIDE.md"
        ;;
    "status"|"dev-status")
        show_file "templates/DEVELOPMENT_STATUS.md"
        ;;
    "setup"|"workflow")
        show_file "CLAUDE_WORKFLOW_SETUP.md"
        ;;
    "readme"|"docs")
        show_file "README.md"
        ;;
    "list"|"ls")
        echo "📁 Available workflow files:"
        find "$WORKFLOW_DIR" -name "*.md" -type f | sed 's|.*/||' | sort
        ;;
    *)
        if [ -z "$1" ]; then
            echo "🤖 Workflow Reference Tool"
            echo "========================="
            echo ""
            echo "Quick access to workflow files without adding them to your app!"
            echo ""
            echo "Usage: $0 <command>"
            echo ""
            echo "Commands:"
            echo "  memory     - Show Claude memory card"
            echo "  error      - Show error prevention guide"
            echo "  status     - Show development status template"
            echo "  setup      - Show workflow setup guide"
            echo "  readme     - Show main documentation"
            echo "  list       - List all available files"
            echo ""
            echo "Examples:"
            echo "  $0 memory  - Show Claude memory card"
            echo "  $0 error   - Show error prevention guide"
        else
            show_file "$1"
        fi
        ;;
esac
