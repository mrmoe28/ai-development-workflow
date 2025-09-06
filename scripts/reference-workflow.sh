#!/bin/bash

# Workflow Reference Script
# Allows referencing workflow files without adding them to the app

WORKFLOW_DIR="/Users/ekodevapps/Documents/ai-development-workflow"
CURRENT_DIR=$(pwd)

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
        echo "Available files in workflow repository:"
        find "$WORKFLOW_DIR" -name "*.md" -type f | sed 's|.*/||' | sort
    fi
}

# Function to show file list
list_files() {
    echo "📁 Available workflow files:"
    echo "============================"
    find "$WORKFLOW_DIR" -name "*.md" -type f | while read -r file; do
        filename=$(basename "$file")
        echo "• $filename"
    done
}

# Function to search in files
search_files() {
    local search_term="$1"
    echo "🔍 Searching for '$search_term' in workflow files:"
    echo "=================================================="
    find "$WORKFLOW_DIR" -name "*.md" -type f -exec grep -l "$search_term" {} \; | while read -r file; do
        filename=$(basename "$file")
        echo "📄 Found in: $filename"
        grep -n "$search_term" "$file" | head -3
        echo ""
    done
}

# Main script logic
case "$1" in
    "list"|"ls")
        list_files
        ;;
    "search"|"find")
        if [ -z "$2" ]; then
            echo "Usage: $0 search <term>"
            exit 1
        fi
        search_files "$2"
        ;;
    "show"|"cat")
        if [ -z "$2" ]; then
            echo "Usage: $0 show <filename>"
            echo "Available files:"
            list_files
            exit 1
        fi
        show_file "$2"
        ;;
    "memory"|"claude-memory")
        show_file "CLAUDE_MEMORY_CARD.md"
        ;;
    "error"|"errors"|"prevention")
        show_file "templates/ERROR_PREVENTION_GUIDE.md"
        ;;
    "status"|"development-status")
        show_file "templates/DEVELOPMENT_STATUS.md"
        ;;
    "setup"|"workflow-setup")
        show_file "CLAUDE_WORKFLOW_SETUP.md"
        ;;
    "help"|"-h"|"--help")
        echo "🤖 Workflow Reference Tool"
        echo "========================="
        echo ""
        echo "Usage: $0 <command> [options]"
        echo ""
        echo "Commands:"
        echo "  list, ls                    - List all available workflow files"
        echo "  show <filename>             - Show content of specific file"
        echo "  search <term>               - Search for term in all files"
        echo "  memory, claude-memory       - Show Claude memory card"
        echo "  error, errors, prevention   - Show error prevention guide"
        echo "  status, development-status  - Show development status template"
        echo "  setup, workflow-setup       - Show workflow setup guide"
        echo "  help, -h, --help           - Show this help"
        echo ""
        echo "Examples:"
        echo "  $0 memory                   - Show Claude memory card"
        echo "  $0 error                    - Show error prevention guide"
        echo "  $0 search 'TypeScript'      - Search for TypeScript in all files"
        echo "  $0 show README.md           - Show README content"
        ;;
    *)
        if [ -z "$1" ]; then
            echo "🤖 Workflow Reference Tool"
            echo "========================="
            echo ""
            echo "Quick access to workflow files without adding them to your app!"
            echo ""
            echo "Try:"
            echo "  $0 memory     - Show Claude memory card"
            echo "  $0 error      - Show error prevention guide"
            echo "  $0 list       - List all available files"
            echo "  $0 help       - Show full help"
        else
            # Try to show the file directly
            show_file "$1"
        fi
        ;;
esac
