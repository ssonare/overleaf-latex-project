# Self-Hosted GitHub Runner - Bonus Implementation

**Student:** Samruddhi Sonare  
**Email:** ssonare@stevens.edu  
**Repository:** https://github.com/ssonare/overleaf-latex-project  
**Date:** October 2025  

## Bonus Tasks Completed (+20 points)

### Task 5: Local Runner Setup ✅
- Self-hosted runner installed at `/opt/actions-runner`
- Running as non-root user: `runner`
- Installed as systemd service
- Status: Active and running

### Task 6: GitHub Actions with Self-Hosted Runner ✅
- Workflow updated to use `runs-on: self-hosted`
- LaTeX pre-installed on server (no installation step needed)
- Faster compilation times achieved
- Zero GitHub Actions minutes consumed

### Task 7: Docker Image Created ✅
- Image: `latex-github-runner:latest`
- Tagged: `ssonare/latex-github-runner:v1.0`
- Base: Ubuntu 22.04
- Includes: GitHub Actions runner + Full TeX Live
- Size: ~2GB

## Implementation Details

### Runner Configuration

**Location:** `/opt/actions-runner`  
**User:** runner (non-root)  
**Service:** `actions.runner.ssonare-overleaf-latex-project.overleaf-server.service`

**Setup Commands:**
```bash
sudo mv ~/actions-runner /opt/actions-runner
sudo adduser runner
sudo chown -R runner:runner /opt/actions-runner
su - runner
cd /opt/actions-runner
./config.sh --url https://github.com/ssonare/overleaf-latex-project --token TOKEN
exit
sudo ./svc.sh install runner
sudo ./svc.sh start
```

**Verify Status:**
```bash
sudo ./svc.sh status
```

Output: `Active: active (running)`

### Workflow Modification

**File:** `.github/workflows/compile-latex.yml`

**Change:**
```yaml
runs-on: self-hosted  # Changed from ubuntu-latest
```

**Removed:**
- LaTeX installation step (already on server)

### Docker Image

**Dockerfile Location:** `~/latex-runner-image/Dockerfile`

**Build Command:**
```bash
docker build -t latex-github-runner:latest .
```

**Verification:**
```bash
docker images | grep latex
```

## Benefits Achieved

| Metric | GitHub-Hosted | Self-Hosted |
|--------|---------------|-------------|
| Build Time | 2-3 minutes | 1-2 minutes |
| Setup Time | ~30 seconds | ~5 seconds |
| Cost | Uses Actions minutes | Free |
| Queue Time | Possible | Immediate |
| Customization | Limited | Full control |

## Verification

### Runner Active
```bash
cd /opt/actions-runner
sudo ./svc.sh status
```

### Docker Image Exists
```bash
docker images | grep latex
```

### Workflow Uses Self-Hosted
- Check Actions tab in GitHub
- Runner name shows "overleaf-server"
- Not "ubuntu-latest"

## Management

**Check Status:**
```bash
sudo ./svc.sh status
```

**Restart Runner:**
```bash
sudo ./svc.sh restart
```

**View Logs:**
```bash
cd /opt/actions-runner/_diag
tail -f Runner_*.log
```

**Stop Runner:**
```bash
sudo ./svc.sh stop
```

## Testing Results

- ✅ Runner installed and operational
- ✅ Service starts automatically on boot
- ✅ Workflow runs on self-hosted runner
- ✅ Compilation faster than GitHub-hosted
- ✅ Docker image built successfully
- ✅ No GitHub Actions minutes used

## Conclusion

All three bonus tasks successfully completed:
- Task 5: Self-hosted runner operational
- Task 6: GitHub Actions uses local runner
- Task 7: Docker image created and tagged

**Bonus Points Earned: +20**
