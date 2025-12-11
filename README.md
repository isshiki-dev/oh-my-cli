# oh-my-cli

> A modern, AI-powered terminal framework for Termux developers

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## 🚀 Features

- **AI Integration** - Built-in Gemini AI for code review, fixes, and explanations
- **Developer Tools** - One-command project setup for React, Node.js, Next.js, and Solidity
- **Smart Aliases** - Productivity-boosting shortcuts for Git, Node, and system commands
- **Beautiful Terminal** - Solarized Dark theme with custom prompts and syntax highlighting
- **Termux Native** - Optimized specifically for Android/Termux environments

## 📦 Installation

```bash
curl -fsSL https://raw.githubusercontent.com/isshiki-dev/oh-my-cli/main/install.sh | bash
source ~/.zshrc
```

## 🎮 Commands

### Development
```bash
ocl new <project>    # Create new project (React, Node, Next.js, etc.)
ocl dev              # Start development server
ocl build            # Build for production
ocl deploy           # Deploy project
ocl sync             # Sync with git repository
```

### AI Assistant
```bash
ocl ask <question>   # Ask AI anything
ocl review [file]    # Get AI code review
ocl fix <file>       # AI-powered bug fixing
ocl explain <file>   # Get code explanation
```

### Utilities
```bash
ocl scan             # Security vulnerability scan
ocl config           # Configure oh-my-cli
ocl update           # Update to latest version
ocl help             # Show help
```

## 🔧 Configuration

### Set Gemini API Key

```bash
export GEMINI_API_KEY='your-api-key-here'
# Add to ~/.zshrc for persistence
```

Or use the config command:

```bash
ocl config
```

## 🎨 Aliases

oh-my-cli includes productivity aliases:

**Git**
- `gs` - git status
- `ga` - git add
- `gc` - git commit -m
- `gp` - git push
- `gl` - git pull

**Node/PNPM**
- `ni` - pnpm install
- `nd` - pnpm dev
- `nb` - pnpm build
- `nt` - pnpm test

**oh-my-cli shortcuts**
- `o` - ocl
- `oa` - ocl ask
- `or` - ocl review
- `on` - ocl new

## 🛠️ Development

### Project Structure

```
oh-my-cli/
├── install.sh           # Installation script
├── bin/
│   └── ocl             # Main executable
├── lib/
│   ├── core.sh         # Core functions
│   ├── ai.sh           # AI integration
│   ├── dev.sh          # Dev tools
│   └── utils.sh        # Utilities
├── config/
│   ├── aliases.sh      # Custom aliases
│   └── theme.sh        # Terminal theme
└── README.md
```

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📝 Examples

**Create a new React app**
```bash
ocl new my-app
cd my-app
ocl dev
```

**Get AI code review**
```bash
ocl review src/App.js
```

**Ask AI a question**
```bash
ocl ask "how do I optimize this react component for performance?"
```

**Fix bugs automatically**
```bash
ocl fix buggy-code.js
```

## 🌟 Why oh-my-cli?

- **Mobile-First**: Built specifically for Termux/Android development
- **AI-Powered**: Gemini integration for intelligent assistance
- **Zero Config**: Works out of the box with sensible defaults
- **Developer UX**: Beautiful, productive terminal environment
- **Extensible**: Easy to customize and extend

## 📜 License

MIT License - feel free to use in your projects!

## 🤝 Support

- GitHub Issues: [Report bugs](https://github.com/isshiki-dev/oh-my-cli/issues)
- Discussions: [Ask questions](https://github.com/isshiki-dev/oh-my-cli/discussions)

---

Made with 💙 by developers, for developers
