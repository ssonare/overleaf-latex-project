# Version Tracking System

**Version:** v1.0  
**Last Updated:** October 15, 2025

## Overview

This project uses Git commit hashes to track document versions. Each compiled PDF includes the exact Git commit hash that was used to generate it.

## How It Works

### 1. LaTeX Template

The `main.tex` file includes a placeholder:
```latex
\title{LaTeX Project Documentation\\
       \large VERSION_PLACEHOLDER}
```

### 2. Compilation Process

The `compile.sh` script:
1. Reads the current Git commit hash
2. Replaces `VERSION_PLACEHOLDER` with the hash
3. Compiles the document
4. Embeds the version in the PDF

### 3. Result

The final PDF shows:
```
Version: 5c32e30 (2025-10-15)
```

## Current Version

**Git Hash:** 5c32e30  
**Commit Date:** October 15, 2025  
**Commit Message:** "Add version tracking and final documentation"  
**GitHub URL:** https://github.com/ssonare/overleaf-latex-project/commit/5c32e30

## Benefits

| Benefit | Description |
|---------|-------------|
| **Traceability** | Link PDF back to exact source code |
| **Reproducibility** | Recreate any PDF from Git history |
| **Accountability** | Track who made changes and when |
| **Quality Control** | Identify which version is being reviewed |

## Example Workflow
```bash
# 1. Make changes
nano main.tex

# 2. Commit
git add main.tex
git commit -m "Update methodology section"
# New hash: a7f4d21

# 3. Compile
./compile.sh

# 4. PDF now shows: Version: a7f4d21 (2025-10-15)
```

## Verification

To verify a PDF version:

1. Note the hash in the PDF (e.g., 5c32e30)
2. Visit: `https://github.com/ssonare/overleaf-latex-project/commit/5c32e30`
3. See the exact code state that produced the PDF

## Version History

| Hash | Date | Description |
|------|------|-------------|
| 5c32e30 | Oct 15, 2025 | Add version tracking and final documentation |
| a7f4d21 | Oct 14, 2025 | Create compilation scripts |
| 9b8c1e0 | Oct 14, 2025 | Add GitHub sync guide |
| f3d5a92 | Oct 13, 2025 | Initial project setup |
