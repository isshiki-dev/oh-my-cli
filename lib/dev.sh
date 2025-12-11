#!/bin/bash

# Developer Tools

new_project() {
    local project_name="$1"
    if [ -z "$project_name" ]; then
        log_error "Please specify a project name."
        return 1
    fi

    log_header "Create New Project: $project_name"
    echo "Select project type:"
    echo "1) React (Vite)"
    echo "2) Node.js (Express)"
    echo "3) Next.js"
    echo "4) Solidity (Hardhat)"

    read -r -p "Choice [1-4]: " choice

    case $choice in
        1)
            log_info "Creating React project..."
            if command -v pnpm &> /dev/null; then
                pnpm create vite "$project_name" --template react
            else
                npm create vite@latest "$project_name" -- --template react
            fi
            ;;
        2)
            log_info "Creating Node.js project..."
            mkdir -p "$project_name"
            cd "$project_name"
            npm init -y
            npm install express
            echo -e "const express = require('express');\nconst app = express();\nconst port = 3000;\n\napp.get('/', (req, res) => res.send('Hello World!'));\n\napp.listen(port, () => console.log(\`Example app listening on port \${port}\`));" > index.js
            ;;
        3)
            log_info "Creating Next.js project..."
            npx create-next-app@latest "$project_name"
            ;;
        4)
            log_info "Creating Solidity project..."
            mkdir -p "$project_name"
            cd "$project_name"
            npx hardhat init
            ;;
        *)
            log_error "Invalid choice."
            return 1
            ;;
    esac

    log_success "Project $project_name created successfully!"
}

dev_server() {
    log_info "Starting development server..."
    if [ -f "package.json" ]; then
        if command -v pnpm &> /dev/null; then
            pnpm dev
        else
            npm run dev
        fi
    else
        log_error "No package.json found."
    fi
}

build_project() {
    log_info "Building project..."
     if [ -f "package.json" ]; then
        if command -v pnpm &> /dev/null; then
            pnpm build
        else
            npm run build
        fi
    else
        log_error "No package.json found."
    fi
}

deploy_project() {
    log_info "Deploying project..."
    # Placeholder for deployment logic (e.g., Vercel, Netlify)
    if command -v vercel &> /dev/null; then
        vercel
    else
        log_warning "Vercel CLI not found. Please install it to deploy."
    fi
}

sync_git() {
    log_info "Syncing with git..."
    git pull && git push
}

scan_security() {
    log_info "Scanning for security vulnerabilities..."
    if command -v npm &> /dev/null; then
        npm audit
    else
        log_warning "npm not found."
    fi
}
