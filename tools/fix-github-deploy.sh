#!/bin/bash

# GitHub Pages 快速修复和部署脚本

# 获取脚本所在目录的父目录（项目根目录）
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# 切换到项目根目录
cd "$PROJECT_ROOT" || exit 1

echo "🔧 GitHub Pages 部署修复工具"
echo "📂 项目目录: $PROJECT_ROOT"
echo ""

# 获取仓库信息
read -p "GitHub用户名: " github_user
read -p "仓库名称: " repo_name

repo_url="https://github.com/$github_user/$repo_name.git"

echo ""
echo "📋 仓库信息："
echo "   用户名: $github_user"
echo "   仓库名: $repo_name"
echo "   地址: $repo_url"
echo ""

# 检查仓库是否存在
echo "🔍 检查仓库状态..."
if curl -s -o /dev/null -w "%{http_code}" "https://github.com/$github_user/$repo_name" | grep -q "200"; then
    echo "✅ 仓库存在"
else
    echo "❌ 仓库不存在！"
    echo ""
    echo "请先创建GitHub仓库："
    echo "1. 访问: https://github.com/new"
    echo "2. 仓库名称填写: $repo_name"
    echo "3. 选择 Public"
    echo "4. 不要勾选 'Initialize this repository with:' 下的任何选项"
    echo "5. 点击 'Create repository'"
    echo ""
    read -p "创建完成后按回车继续..."
fi

echo ""
echo "🔧 修复Git配置..."

# 1. 清理现有remote
if git remote | grep -q "^origin$"; then
    echo "🗑️  删除现有的origin..."
    git remote remove origin
fi

# 2. 添加正确的remote
echo "➕ 添加新的remote..."
git remote add origin "$repo_url"

# 3. 确认remote
echo "✓ 当前remote配置:"
git remote -v

echo ""
echo "📦 准备推送..."

# 4. 添加所有文件
git add .

# 5. 提交（如果有更改）
if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    echo "📝 提交更改..."
    git commit -m "Deploy PBL PWA - $(date +%Y-%m-%d)"
else
    echo "✓ 没有新的更改"
fi

# 6. 确保在main分支
current_branch=$(git branch --show-current 2>/dev/null || echo "main")
if [ "$current_branch" != "main" ]; then
    echo "🔀 切换到main分支..."
    git branch -M main
fi

echo ""
echo "🚀 推送到GitHub..."
echo ""

# 7. 推送
if git push -u origin main; then
    echo ""
    echo "✅ 部署成功！"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📋 下一步操作："
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "1️⃣  启用GitHub Pages："
    echo "   访问: https://github.com/$github_user/$repo_name/settings/pages"
    echo ""
    echo "2️⃣  配置Pages："
    echo "   - Source: 选择 'Deploy from a branch'"
    echo "   - Branch: 选择 'main' 和 '/ (root)'"
    echo "   - 点击 'Save'"
    echo ""
    echo "3️⃣  等待部署（约2-5分钟）"
    echo ""
    echo "4️⃣  访问你的PWA应用："
    echo "   🌐 https://$github_user.github.io/$repo_name/"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "💡 提示："
    echo "   • 首次部署需要等待几分钟"
    echo "   • 可以在仓库的Actions标签查看部署进度"
    echo "   • 部署完成后会收到邮件通知"
    echo ""
else
    echo ""
    echo "❌ 推送失败！"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🔧 故障排除："
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "问题1: Authentication failed (认证失败)"
    echo "解决方案："
    echo "   • GitHub现在需要使用Personal Access Token"
    echo "   • 创建Token: https://github.com/settings/tokens"
    echo "   • 选择 'repo' 权限"
    echo "   • 使用Token代替密码"
    echo ""
    echo "问题2: Repository not found (仓库未找到)"
    echo "解决方案："
    echo "   • 确认仓库已创建: https://github.com/$github_user/$repo_name"
    echo "   • 检查仓库名拼写是否正确"
    echo "   • 确认仓库为Public"
    echo ""
    echo "问题3: 权限问题"
    echo "解决方案："
    echo "   使用SSH代替HTTPS:"
    echo "   git remote set-url origin git@github.com:$github_user/$repo_name.git"
    echo "   git push -u origin main"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "💡 快速修复命令："
    echo ""
    echo "# 方法1: 使用SSH (推荐)"
    echo "git remote set-url origin git@github.com:$github_user/$repo_name.git"
    echo "git push -u origin main"
    echo ""
    echo "# 方法2: 配置Git凭据"
    echo "git config --global credential.helper store"
    echo "git push -u origin main"
    echo ""
    exit 1
fi

