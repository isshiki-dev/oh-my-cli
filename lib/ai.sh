#!/bin/bash

# AI Integration using Gemini API

ask_ai() {
    local prompt="$1"
    local context=""

    if [ -z "$GEMINI_API_KEY" ]; then
        log_error "GEMINI_API_KEY is not set. Please run 'ocl config' or set it manually."
        return 1
    fi

    log_info "Asking AI..."

    # Construct JSON payload
    # Escape quotes in prompt
    local escaped_prompt=$(echo "$prompt" | sed 's/"/\\"/g' | sed 's/$/\\n/' | tr -d '\n')

    local data="{
      \"contents\": [{
        \"parts\":[
          {\"text\": \"$escaped_prompt\"}
        ]
      }]
    }"

    # Call Gemini API
    # Using gemini-1.5-flash as it is usually fast and available
    local response=$(curl -s -X POST \
        -H "Content-Type: application/json" \
        -d "$data" \
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$GEMINI_API_KEY")

    # Parse response (simple grep/sed as jq might not be available by default in Termux, though highly recommended)
    # Ideally check for errors first
    if echo "$response" | grep -q "\"error\":"; then
        log_error "AI Error: $(echo "$response" | grep -o '"message": "[^"]*"' | cut -d'"' -f4)"
        return 1
    fi

    # Extract text from response. This is brittle without jq but let's try a best effort for pure bash
    # Response structure: candidates[0].content.parts[0].text
    local answer=$(echo "$response" | sed -n 's/.*"text": "\(.*\)".*/\1/p')

    # If sed failed to extract cleanly (e.g. multiline JSON), we might need a better approach or assume jq is present.
    # For a "framework for Termux developers", assuming 'jq' is installed is reasonable or we should install it.
    # Let's try to use jq if available, else fallback to a simple python one-liner if python is there, else fail.

    if command -v jq &> /dev/null; then
        answer=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')
    else
        # Try python
        if command -v python &> /dev/null; then
             answer=$(echo "$response" | python -c "import sys, json; print(json.load(sys.stdin)['candidates'][0]['content']['parts'][0]['text'])")
        else
            log_warning "jq or python not found. Installing jq..."
            pkg install jq -y
            answer=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')
        fi
    fi

    log_header "AI Response"
    echo -e "$answer"
}

review_code() {
    local file="$1"
    if [ ! -f "$file" ]; then
        log_error "File not found: $file"
        return 1
    fi
    local content=$(cat "$file")
    ask_ai "Review the following code and provide suggestions for improvement:\n\n$content"
}

fix_code() {
    local file="$1"
     if [ ! -f "$file" ]; then
        log_error "File not found: $file"
        return 1
    fi
    local content=$(cat "$file")
    ask_ai "Fix bugs in the following code and provide the corrected code:\n\n$content"
}

explain_code() {
    local file="$1"
     if [ ! -f "$file" ]; then
        log_error "File not found: $file"
        return 1
    fi
    local content=$(cat "$file")
    ask_ai "Explain the following code in simple terms:\n\n$content"
}
