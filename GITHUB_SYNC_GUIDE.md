# GitHub Synchronization Guide

**Version:** v1.0  
**Last Updated:** October 15, 2025

## Repository Information

- **GitHub URL:** https://github.com/ssonare/overleaf-latex-project
- **Branch:** main
- **Local Path:** ~/overleaf-latex-project

## Initial Setup

### 1. Configure Git
```bash
git config --global user.name "ssonare"
git config --global user.email "ssonare@stevens.edu"
```

### 2. Initialize Repository
```bash
cd ~/overleaf-latex-project
git init
git remote add origin https://github.com/ssonare/overleaf-latex-project.git
git branch -M main
```

## Synchronization Workflows

### Push Changes to GitHub
```bash
# Navigate to project directory
cd ~/overleaf-latex-project

# Check status
git status

# Stage all changes
git add .

# Commit with message
git commit -m "Description of changes"

# Push to GitHub
git push origin main
```

### Pull Changes from GitHub
```bash
# Navigate to project directory
cd ~/overleaf-latex-project

# Pull latest changes
git pull origin main
```

## File Structure
```
overleaf-latex-project/
├── main.tex                 # Main LaTeX document
├── compile.sh               # Compilation script
├── get-version.sh           # Version extraction script
├── README.md                # Project overview
├── GITHUB_SYNC_GUIDE.md     # This file
├── COMPILATION_GUIDE.md     # Compilation instructions
├── DOMAIN_SETUP.md          # Domain configuration
├── SSL_CONFIGURATION.md     # SSL setup
├── VERSION_TRACKING.md      # Version control info
└── .gitignore               # Git ignore rules
```

## Best Practices

1. **Always commit before making major changes**
2. **Write descriptive commit messages**
3. **Pull before pushing to avoid conflicts**
4. **Keep documentation up to date**

## Common Commands
```bash
# View commit history
git log --oneline

# Check current branch
git branch

# View remote URL
git remote -v

# Check file differences
git diff main.tex
```
