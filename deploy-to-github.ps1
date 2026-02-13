# Deploy to GitHub - Run this script to push your website to GitHub
# Run in PowerShell: .\deploy-to-github.ps1

$ErrorActionPreference = "Stop"
$repoPath = "c:\Users\joann\OneDrive\Desktop\WEBSITE FOLDER\whole-wasp"

Write-Host "=== Deploy to GitHub ===" -ForegroundColor Cyan
Set-Location $repoPath

# 1. Ensure Git identity is set
$userName = git config --global user.name 2>$null
$userEmail = git config --global user.email 2>$null
if (-not $userName) {
    Write-Host "Setting Git user name..."
    git config --global user.name "joanna-netizen"
}
if (-not $userEmail) {
    Write-Host "Setting Git user email..."
    git config --global user.email "joanna@loanladyclub.com"
}

# 2. Add and commit any changes
$status = git status --porcelain
if ($status) {
    Write-Host "Committing changes..."
    git add -A
    git commit -m "Update website"
} else {
    Write-Host "Nothing new to commit (working tree clean)" -ForegroundColor Green
}

# 3. Push to GitHub
$remote = "https://github.com/joanna-netizen/joanna-perry-website.git"
$branch = "main"

# Option A: Use GITHUB_TOKEN if set (e.g. $env:GITHUB_TOKEN = "ghp_xxxx")
if ($env:GITHUB_TOKEN) {
    Write-Host "Pushing using GITHUB_TOKEN..." -ForegroundColor Yellow
    $urlWithToken = "https://joanna-netizen:$($env:GITHUB_TOKEN)@github.com/joanna-netizen/joanna-perry-website.git"
    git push $urlWithToken $branch 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`nDeployed successfully!" -ForegroundColor Green
    } else {
        Write-Host "`nPush failed. Check your token at https://github.com/settings/tokens" -ForegroundColor Red
        exit 1
    }
} else {
    # Option B: Interactive push (will prompt for credentials)
    Write-Host "`nPushing to GitHub (you may be prompted for login)..." -ForegroundColor Yellow
    Write-Host "If prompted: use your GitHub USERNAME and a PERSONAL ACCESS TOKEN (not password)" -ForegroundColor Gray
    Write-Host "Create a token at: https://github.com/settings/tokens (classic, repo scope)`n" -ForegroundColor Gray
    git push -u origin $branch
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`nDeployed successfully!" -ForegroundColor Green
    } else {
        Write-Host "`nPush failed. Try:" -ForegroundColor Red
        Write-Host "  1. Create repo at https://github.com/new (name: joanna-perry-website, private)" -ForegroundColor Gray
        Write-Host "  2. Create token at https://github.com/settings/tokens (classic, repo scope)" -ForegroundColor Gray
        Write-Host "  3. Run: `$env:GITHUB_TOKEN='your_token'; .\deploy-to-github.ps1" -ForegroundColor Gray
        exit 1
    }
}
