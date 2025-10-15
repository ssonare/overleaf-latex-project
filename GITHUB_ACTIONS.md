# GitHub Actions Automated LaTeX Compilation

**Student:** Samruddhi Sonare  
**Email:** ssonare@stevens.edu  
**Repository:** https://github.com/ssonare/overleaf-latex-project  
**Date:** October 15, 2025  

## Overview

This project implements automated LaTeX document compilation using GitHub Actions. Every push to the repository triggers an automatic build process that compiles the LaTeX document and stores the resulting PDF as an artifact.

## Features Implemented

### 1. Automatic Compilation Trigger
- Workflow runs on every push to main branch
- Can also be triggered manually from Actions tab
- Supports pull request builds

### 2. Git Version Embedding
- Current Git commit hash is extracted
- Commit date is recorded
- Version information added to document as comment
- Creates traceable link between PDF and source code

### 3. GitHub Runner Compilation
- Uses ubuntu-latest runner
- Fresh build environment for each compilation
- LaTeX packages installed automatically
- Two-pass compilation for proper references

### 4. Artifact Storage
- PDF saved as downloadable artifact
- BUILD_INFO.txt created with metadata
- ZIP archive includes both PDF and build info
- 90-day retention period

## How to Access Compiled PDFs

### Method 1: Download from Actions Tab

1. Go to repository: https://github.com/ssonare/overleaf-latex-project
2. Click **Actions** tab
3. Click on any completed workflow (green checkmark)
4. Scroll to **Artifacts** section
5. Download `compiled-pdf-XXXXX` or `compiled-latex-zip-XXXXX`
6. Unzip and open main.pdf

### Method 2: Check Latest Build

1. Actions tab shows all workflow runs
2. Most recent run is at the top
3. Click to view details
4. Download artifacts from that specific build

## Workflow Configuration

**File Location:** `.github/workflows/compile-latex.yml`

**GitHub Actions Version:**
- `actions/checkout@v4`
- `actions/upload-artifact@v4`

**Runner:** ubuntu-latest (GitHub-hosted)

**LaTeX Packages:**
- texlive-latex-base
- texlive-latex-extra
- texlive-fonts-recommended
- texlive-latex-recommended

## Workflow Steps

1. **Checkout Repository** - Clone the code with full history
2. **Get Git Version Info** - Extract commit hash and date
3. **Install LaTeX** - Install required LaTeX packages
4. **Check for Placeholder** - Verify VERSION_PLACEHOLDER exists
5. **Prepare Document** - Add version info to document
6. **Compile (Pass 1)** - First LaTeX compilation
7. **Compile (Pass 2)** - Second compilation for references
8. **Verify PDF** - Check that PDF was created successfully
9. **Create Changelog** - Generate BUILD_INFO.txt
10. **Upload Artifacts** - Save PDF and info file
11. **Create ZIP** - Package files together
12. **Upload ZIP** - Save ZIP archive

## Version Information

Git version information is added to the document as a comment:
```latex
% Git Version: abc123d (2025-10-15)
```

Where:
- `abc123d` = Git commit hash (7 characters)
- `2025-10-15` = Commit date

## BUILD_INFO.txt Contents

Each artifact includes a BUILD_INFO.txt file with:
- Build date and time
- Git commit hash (short and full)
- Commit date
- Last commit author
- Last commit message

## Testing the Workflow

To test automatic compilation:
```bash
# Make any change to main.tex
nano main.tex

# Commit the change
git add main.tex
git commit -m "Test automatic compilation"

# Push to GitHub
git push origin main
```

The workflow will trigger automatically within seconds.

## Troubleshooting

### Workflow Fails to Start
- Verify workflow file exists: `.github/workflows/compile-latex.yml`
- Check that push was to main branch
- Ensure GitHub Actions is enabled in repository settings

### Compilation Errors
- Check the workflow logs for specific LaTeX errors
- Verify document compiles locally first
- Look for missing packages in error messages

### Artifacts Not Available
- Artifacts expire after 90 days
- Must be logged into GitHub to download
- Check that workflow completed successfully (green checkmark)

### Version 3 Deprecation Error
- Updated to `actions/upload-artifact@v4`
- Updated to `actions/checkout@v4`
- Fixed in latest workflow version

## Success Metrics

✅ Workflow triggers automatically on push  
✅ LaTeX document compiles without errors  
✅ Git version information embedded  
✅ PDF artifact created and uploaded  
✅ ZIP archive generated  
✅ BUILD_INFO.txt includes metadata  
✅ Artifacts downloadable for 90 days  

## Workflow History

All workflow runs are visible in the Actions tab:
- Green checkmark = Successful build
- Red X = Failed build
- Yellow dot = Currently running

## Links

- **Repository:** https://github.com/ssonare/overleaf-latex-project
- **Actions Tab:** https://github.com/ssonare/overleaf-latex-project/actions
- **Workflow File:** [.github/workflows/compile-latex.yml](https://github.com/ssonare/overleaf-latex-project/blob/main/.github/workflows/compile-latex.yml)

## Assignment Completion

All required tasks have been successfully implemented:

1. ✅ Overleaf connected to GitHub
2. ✅ Changes made and pushed to repository
3. ✅ Git commit hash embedded in document
4. ✅ GitHub Actions runner compiles LaTeX
5. ✅ PDF saved as artifact
6. ✅ ZIP archive created

The system is fully functional and tested.
