#!/bin/bash

# Load theme
if [ -f "$OCL_PATH/config/theme.sh" ]; then
    source "$OCL_PATH/config/theme.sh"
fi

# Logging functions
log_info() {
    echo -e "${OCL_THEME_INFO}${OCL_ICON_INFO} $1${OCL_COLOR_RESET}"
}

log_success() {
    echo -e "${OCL_THEME_SUCCESS}${OCL_ICON_SUCCESS} $1${OCL_COLOR_RESET}"
}

log_warning() {
    echo -e "${OCL_THEME_WARNING}${OCL_ICON_WARNING} $1${OCL_COLOR_RESET}"
}

log_error() {
    echo -e "${OCL_THEME_ERROR}${OCL_ICON_ERROR} $1${OCL_COLOR_RESET}" >&2
}

log_header() {
    echo -e "\n${OCL_THEME_PRIMARY}${OCL_ICON_ROCKET} $1${OCL_COLOR_RESET}\n"
}

# Spinner
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Input
prompt_confirm() {
    while true; do
        read -r -p "$1 [y/N]: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) return 1;;
        esac
    done
}

# Check dependencies
check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        log_error "$1 is not installed."
        return 1
    fi
    return 0
}
