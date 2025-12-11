#!/bin/bash

set -e

echo "Installing oh-my-cli..."

# Define installation directory
INSTALL_DIR="$HOME/.oh-my-cli"

# Clone repository (or copy if local, but installer implies pulling from remote usually)
# Since we are creating the installer for the repo itself, we assume this runs via curl | bash
# which means we need to git clone.

if [ -d "$INSTALL_DIR" ]; then
    echo "Updating existing installation..."
    cd "$INSTALL_DIR"
    git pull
else
    echo "Cloning repository..."
    git clone https://github.com/isshiki-dev/oh-my-cli.git "$INSTALL_DIR"
fi

# Add to PATH in .zshrc or .bashrc
SHELL_RC=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    # Fallback to .bashrc if unknown or check default shell
    if [[ "$SHELL" == *"zsh"* ]]; then
        SHELL_RC="$HOME/.zshrc"
    else
        SHELL_RC="$HOME/.bashrc"
    fi
fi

if [ -f "$SHELL_RC" ]; then
    if ! grep -q "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" "$SHELL_RC"; then
        echo "Adding to PATH in $SHELL_RC..."
        echo "" >> "$SHELL_RC"
        echo "# oh-my-cli" >> "$SHELL_RC"
        echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> "$SHELL_RC"
        echo "source \"$INSTALL_DIR/config/aliases.sh\"" >> "$SHELL_RC"
    else
        echo "Already in PATH."
    fi
else
    echo "No shell RC file found. Please manually add $INSTALL_DIR/bin to your PATH."
fi

echo "Installation complete!"
echo "Please restart your terminal or run 'source $SHELL_RC'"
