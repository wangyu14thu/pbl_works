# 🔐 GitHub认证配置指南

## ❌ 为什么认证失败？

**错误信息**：
```
Password authentication is not supported for Git operations.
```

**原因**：
- GitHub从2021年8月13日起，**不再接受密码认证**
- 必须使用以下任一方式：
  1. ✅ **Personal Access Token (PAT)** - 推荐
  2. ✅ **SSH密钥** - 最方便
  3. ✅ **GitHub CLI** - 最简单

---

## 🚀 解决方案（3种方式）

### 方式1：使用Personal Access Token（推荐新手）

#### Step 1：创建Token

1. 访问：https://github.com/settings/tokens
2. 点击 **"Generate new token"** → **"Generate new token (classic)"**
3. 填写信息：
   - **Note**: `PBL Works Deploy` (给token起个名字)
   - **Expiration**: 选择过期时间（建议90天或No expiration）
   - **Select scopes**: 勾选 **`repo`** (完整的仓库访问权限)
4. 点击最下方的 **"Generate token"**
5. ⚠️ **重要**：立即复制token（只显示一次！）

#### Step 2：使用Token推送

```bash
cd ~/workspace/private

# 推送时会要求输入密码
git push -u origin main

# 输入：
# Username: wangyu14thu
# Password: [粘贴你的Token，不是GitHub密码]
```

#### Step 3：保存凭据（可选，避免每次都输入）

```bash
# 永久保存凭据
git config --global credential.helper store

# 再次推送，输入一次token后就会保存
git push -u origin main
```

---

### 方式2：使用SSH密钥（推荐高级用户）

#### Step 1：生成SSH密钥

```bash
# 生成新的SSH密钥
ssh-keygen -t ed25519 -C "wangyu14thu@github.com"

# 按提示操作：
# - Enter file: 直接回车（使用默认路径）
# - Enter passphrase: 直接回车（或设置密码）
```

#### Step 2：添加SSH密钥到GitHub

```bash
# 显示公钥内容
cat ~/.ssh/id_ed25519.pub

# 复制输出的内容
```

然后：
1. 访问：https://github.com/settings/keys
2. 点击 **"New SSH key"**
3. Title: `My Linux Machine`
4. Key: 粘贴刚才复制的公钥
5. 点击 **"Add SSH key"**

#### Step 3：切换到SSH URL

```bash
cd ~/workspace/private

# 更改remote URL为SSH格式
git remote set-url origin git@github.com:wangyu14thu/pbl_works.git

# 推送（不需要输入密码）
git push -u origin main
```

#### Step 4：测试SSH连接

```bash
# 测试连接
ssh -T git@github.com

# 成功会显示：
# Hi wangyu14thu! You've successfully authenticated...
```

---

### 方式3：使用GitHub CLI（最简单）

#### Step 1：安装GitHub CLI

```bash
# Ubuntu/Debian
sudo apt install gh

# 或使用官方安装方式
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```

#### Step 2：登录

```bash
# 登录GitHub
gh auth login

# 选择：
# - What account: GitHub.com
# - What is your preferred protocol: HTTPS
# - Authenticate: Login with a web browser
# - 会显示一个代码，在浏览器中输入

# 或直接粘贴Token
gh auth login --with-token < your-token.txt
```

#### Step 3：推送

```bash
cd ~/workspace/private
git push -u origin main

# 自动使用gh的凭据，无需输入密码
```

---

## 🎯 快速解决（推荐方式2：SSH）

### 一键配置SSH（最方便）

```bash
# 1. 生成SSH密钥
ssh-keygen -t ed25519 -C "wangyu14thu@github.com" -f ~/.ssh/github_ed25519 -N ""

# 2. 显示公钥（复制输出内容）
cat ~/.ssh/github_ed25519.pub

# 3. 访问 https://github.com/settings/keys 添加公钥

# 4. 配置SSH
cat >> ~/.ssh/config << EOF
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_ed25519
EOF

# 5. 测试连接
ssh -T git@github.com

# 6. 切换到SSH
cd ~/workspace/private
git remote set-url origin git@github.com:wangyu14thu/pbl_works.git

# 7. 推送
git push -u origin main
```

---

## 📋 当前情况分析

### 你的配置：
- 仓库：`wangyu14thu/pbl_works`
- Remote URL：`https://github.com/wangyu14thu/pbl_works.git` (HTTPS)
- 认证方式：❌ 密码（已不支持）

### 需要改为：
- ✅ 方式1：HTTPS + Personal Access Token
- ✅ 方式2：SSH + SSH密钥（推荐）
- ✅ 方式3：GitHub CLI

---

## 💡 推荐步骤（SSH方式）

### 为什么推荐SSH？
- ✅ 一次配置，永久使用
- ✅ 不需要记Token
- ✅ 更安全
- ✅ 不会过期

### 详细步骤：

```bash
# === Step 1: 生成SSH密钥 ===
cd ~
ssh-keygen -t ed25519 -C "wangyu14thu@github.com"
# 一路回车（使用默认设置）

# === Step 2: 查看公钥 ===
cat ~/.ssh/id_ed25519.pub
# 复制输出的所有内容（以ssh-ed25519开头）

# === Step 3: 添加到GitHub ===
# 浏览器访问：https://github.com/settings/keys
# 点击 "New SSH key"
# Title: 随便写，比如 "Linux Server"
# Key: 粘贴刚才复制的公钥
# 点击 "Add SSH key"

# === Step 4: 测试连接 ===
ssh -T git@github.com
# 第一次会问是否继续，输入 yes
# 看到 "Hi wangyu14thu!" 表示成功

# === Step 5: 切换项目到SSH ===
cd ~/workspace/private
git remote set-url origin git@github.com:wangyu14thu/pbl_works.git

# === Step 6: 推送 ===
git push -u origin main
# 应该直接推送，不需要输入密码！
```

---

## 🔧 故障排除

### 问题1：ssh-keygen命令不存在

```bash
sudo apt update
sudo apt install openssh-client
```

### 问题2：SSH连接被拒绝

```bash
# 检查SSH服务
ssh -vT git@github.com

# 如果端口443可用，使用HTTPS over SSH
cat >> ~/.ssh/config << EOF
Host github.com
    Hostname ssh.github.com
    Port 443
EOF
```

### 问题3：Permission denied (publickey)

```bash
# 确认SSH密钥已添加
ssh-add -l

# 如果为空，添加密钥
ssh-add ~/.ssh/id_ed25519

# 测试
ssh -T git@github.com
```

### 问题4：还是想用HTTPS + Token

```bash
# 创建Token后，配置凭据助手
git config --global credential.helper store

# 推送时输入：
# Username: wangyu14thu
# Password: [你的Token]
git push -u origin main

# 凭据会保存到 ~/.git-credentials
# 下次自动使用
```

---

## 📝 Token权限说明

创建Token时需要选择的权限：

**最小权限**（推荐）：
- ✅ `repo` - 完整仓库访问
  - repo:status
  - repo_deployment
  - public_repo
  - repo:invite
  - security_events

**GitHub Pages需要**：
- ✅ `repo` (已包含)
- 可选：`workflow` (如果使用GitHub Actions)

---

## 🎯 总结

### 最快的解决方案：

**方式A：使用Token（5分钟）**
1. 创建Token：https://github.com/settings/tokens
2. 推送时粘贴Token作为密码
3. 配置保存：`git config --global credential.helper store`

**方式B：使用SSH（10分钟，一劳永逸）** ⭐推荐
1. `ssh-keygen -t ed25519 -C "wangyu14thu@github.com"`
2. 添加公钥到GitHub：https://github.com/settings/keys
3. `git remote set-url origin git@github.com:wangyu14thu/pbl_works.git`
4. `git push -u origin main`

---

## 🚀 现在开始配置

选择你喜欢的方式，然后：

```bash
# 方式1：Token
# 1. 创建Token
# 2. 推送时使用

# 方式2：SSH（推荐）
ssh-keygen -t ed25519 -C "wangyu14thu@github.com"
cat ~/.ssh/id_ed25519.pub  # 复制这个
# 3. 到GitHub添加公钥
# 4. 切换URL
cd ~/workspace/private
git remote set-url origin git@github.com:wangyu14thu/pbl_works.git
git push -u origin main
```

---

**选择SSH方式，以后就不用再管认证了！** 🎉

*最后更新：2026-01-04*

