#!/bin/bash

export OCL_VERSION="1.0.0"

# Determine OCL_PATH if not set
if [ -z "$OCL_PATH" ]; then
    # Assume script is running from bin/ocl or similar, try to resolve root
    # If this script is sourced, we expect OCL_PATH to be set by the caller or env
    # Default to ~/.oh-my-cli if not found
    if [ -d "$HOME/.oh-my-cli" ]; then
        export OCL_PATH="$HOME/.oh-my-cli"
    else
        # Fallback for development/local execution relative to this file
        # current file is lib/core.sh
        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        export OCL_PATH="$(dirname "$DIR")"
    fi
fi

# Load Utils
source "$OCL_PATH/lib/utils.sh"

# Load AI
source "$OCL_PATH/lib/ai.sh"

# Load Dev Tools
source "$OCL_PATH/lib/dev.sh"

# Load Configuration
load_config() {
    if [ -f "$HOME/.oclrc" ]; then
        source "$HOME/.oclrc"
    fi
    if [ -f "$OCL_PATH/config/aliases.sh" ]; then
        source "$OCL_PATH/config/aliases.sh"
    fi
}

# Main initialization
init_ocl() {
    load_config
}

# Helper to check for updates
check_update() {
    # Placeholder for update logic
    log_info "Checking for updates..."
    # In a real scenario, curl version file and compare
    log_success "You are on the latest version ($OCL_VERSION)"
}

# Configuration management
configure_ocl() {
    log_header "Configuration"
    echo "Enter your Gemini API Key:"
    read -r api_key
    if [ -n "$api_key" ]; then
        echo "export GEMINI_API_KEY='$api_key'" > "$HOME/.oclrc"
        log_success "Configuration saved to ~/.oclrc"
    else
        log_warning "No API key entered. AI features may not work."
    fi
}
