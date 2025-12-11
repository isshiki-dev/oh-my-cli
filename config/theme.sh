#!/bin/bash

# Solarized Dark Theme Colors
export OCL_COLOR_BASE03='\033[1;30m'  # brblack
export OCL_COLOR_BASE02='\033[0;30m'  # black
export OCL_COLOR_BASE01='\033[1;32m'  # brgreen
export OCL_COLOR_BASE00='\033[1;33m'  # bryellow
export OCL_COLOR_BASE0='\033[1;34m'   # brblue
export OCL_COLOR_BASE1='\033[1;36m'   # brcyan
export OCL_COLOR_BASE2='\033[0;37m'   # white
export OCL_COLOR_BASE3='\033[1;37m'   # brwhite
export OCL_COLOR_YELLOW='\033[0;33m'  # yellow
export OCL_COLOR_ORANGE='\033[1;31m'  # brred
export OCL_COLOR_RED='\033[0;31m'     # red
export OCL_COLOR_MAGENTA='\033[0;35m' # magenta
export OCL_COLOR_VIOLET='\033[1;35m'  # brmagenta
export OCL_COLOR_BLUE='\033[0;34m'    # blue
export OCL_COLOR_CYAN='\033[0;36m'    # cyan
export OCL_COLOR_GREEN='\033[0;32m'   # green
export OCL_COLOR_RESET='\033[0m'

# Theme Definitions
export OCL_THEME_PRIMARY="$OCL_COLOR_BLUE"
export OCL_THEME_SECONDARY="$OCL_COLOR_CYAN"
export OCL_THEME_SUCCESS="$OCL_COLOR_GREEN"
export OCL_THEME_WARNING="$OCL_COLOR_YELLOW"
export OCL_THEME_ERROR="$OCL_COLOR_RED"
export OCL_THEME_INFO="$OCL_COLOR_VIOLET"
export OCL_THEME_TEXT="$OCL_COLOR_BASE0"

# Icons
export OCL_ICON_SUCCESS="✓"
export OCL_ICON_ERROR="✗"
export OCL_ICON_WARNING="!"
export OCL_ICON_INFO="ℹ"
export OCL_ICON_ROCKET="🚀"
export OCL_ICON_AI="🤖"
