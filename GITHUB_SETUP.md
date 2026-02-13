# Push This Project to GitHub

Follow these steps **after Git is installed** and (optionally) GitHub CLI is installed.

## 1. Install Git (if needed)

- Download: https://git-scm.com/download/win  
- During setup, choose "Git from the command line and also from 3rd-party software" so `git` is on your PATH.

## 2. Set your commit identity (if not already done)

In a terminal, from any folder:

```bash
git config --global user.name "joanna-netizen"
git config --global user.email "joanna@loanladyclub.com"
```

## 3. Open the project folder and initialize Git

```bash
cd "c:\Users\joann\OneDrive\Desktop\WEBSITE FOLDER\whole-wasp"
git init
```

## 4. Create the new private repo on GitHub

**Option A – Using GitHub in the browser**

1. Go to https://github.com/new  
2. Repository name: `joanna-perry-website` (or `the-loan-lady-club` if you prefer)  
3. Set visibility to **Private**  
4. Do **not** add a README, .gitignore, or license (the project already has these where needed)  
5. Click **Create repository**  
6. On the new repo page, copy the **HTTPS** URL, e.g.  
   `https://github.com/joanna-netizen/joanna-perry-website.git`

**Option B – Using GitHub CLI (if you install `gh`)**

```bash
cd "c:\Users\joann\OneDrive\Desktop\WEBSITE FOLDER\whole-wasp"
gh auth login
gh repo create joanna-perry-website --private --source=. --remote=origin --push
```

If you use Option B and it succeeds, you can skip steps 5 and 6 below.

## 5. Add the remote (if you used Option A)

Replace `joanna-netizen` and `joanna-perry-website` with your GitHub username and repo name if different:

```bash
git remote add origin https://github.com/joanna-netizen/joanna-perry-website.git
```

## 6. Add all files, commit, and push

```bash
git add -A
git commit -m "Initial website build"
git branch -M main
git push -u origin main
```

If GitHub asks for login, use your GitHub username and a **Personal Access Token** (not your password). Create a token at: https://github.com/settings/tokens (e.g. classic token with `repo` scope).

---

After this, your site code will be in a private GitHub repo and you can connect it to Netlify (or another host) for deployment.
