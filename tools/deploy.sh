#!/bin/bash

# PBL职业体验探索 - PWA部署脚本

# 获取脚本所在目录的父目录（项目根目录）
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# 切换到项目根目录
cd "$PROJECT_ROOT" || exit 1

echo "🚀 开始部署PBL职业体验探索PWA..."
echo "📂 项目目录: $PROJECT_ROOT"
echo ""

# 检查必要文件
echo "📋 检查文件完整性..."
files=(
    "index.html"
    "assets/css/style.css"
    "assets/js/script.js"
    "manifest.json"
    "service-worker.js"
)
missing_files=()

for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        missing_files+=("$file")
    fi
done

if [ ${#missing_files[@]} -gt 0 ]; then
    echo "❌ 缺少以下文件："
    printf '%s\n' "${missing_files[@]}"
    exit 1
fi

echo "✅ 核心文件完整"
echo ""

# 检查图标文件
echo "🎨 检查图标文件..."
icon_sizes=(72 96 128 144 152 192 384 512)
missing_icons=()

for size in "${icon_sizes[@]}"; do
    if [ ! -f "icon-${size}.png" ]; then
        missing_icons+=("icon-${size}.png")
    fi
done

if [ ${#missing_icons[@]} -gt 0 ]; then
    echo "⚠️  缺少以下图标文件："
    printf '%s\n' "${missing_icons[@]}"
    echo ""
    echo "💡 请先打开 tools/icon-generator.html 生成图标"
    read -p "是否继续部署？(y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo "✅ 所有图标文件完整"
fi

echo ""
echo "🌐 选择部署方式："
echo "1) 启动本地测试服务器 (推荐先测试)"
echo "2) 部署到GitHub Pages"
echo "3) 生成部署包"
echo "4) 退出"
echo ""
read -p "请选择 (1-4): " choice

case $choice in
    1)
        echo ""
        echo "🖥️  启动本地服务器..."
        echo "📱 请在浏览器访问："
        echo "   http://localhost:8000"
        echo ""
        echo "💡 提示："
        echo "   - 在Chrome DevTools中检查PWA功能"
        echo "   - 按 Ctrl+C 停止服务器"
        echo ""
        
        if command -v python3 &> /dev/null; then
            python3 -m http.server 8000
        elif command -v python &> /dev/null; then
            python -m SimpleHTTPServer 8000
        else
            echo "❌ 未找到Python，请手动启动服务器"
            exit 1
        fi
        ;;
        
    2)
        echo ""
        echo "📦 准备GitHub Pages部署..."
        
        if ! command -v git &> /dev/null; then
            echo "❌ 未找到Git，请先安装Git"
            exit 1
        fi
        
        read -p "GitHub用户名: " github_user
        read -p "仓库名称: " repo_name
        
        echo ""
        echo "⚠️  请确保你已在GitHub上创建了仓库: $repo_name"
        echo "   如未创建，请访问: https://github.com/new"
        echo ""
        read -p "仓库已创建？继续部署 (y/n): " -n 1 -r
        echo
        
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "👋 请先创建仓库后再部署"
            exit 0
        fi
        
        echo ""
        echo "开始部署..."
        echo ""
        
        # 初始化Git（如果还未初始化）
        if [ ! -d ".git" ]; then
            echo "📝 初始化Git仓库..."
            git init
        else
            echo "✓ Git仓库已存在"
        fi
        
        # 添加所有文件
        echo "📦 添加文件..."
        git add .
        
        # 检查是否有更改需要提交
        if git diff-index --quiet HEAD -- 2>/dev/null; then
            echo "✓ 没有新的更改需要提交"
        else
            echo "📝 提交更改..."
            git commit -m "Deploy PBL PWA - $(date +%Y-%m-%d)"
        fi
        
        # 确保在main分支
        current_branch=$(git branch --show-current 2>/dev/null || echo "main")
        if [ "$current_branch" != "main" ]; then
            echo "🔀 切换到main分支..."
            git branch -M main
        else
            echo "✓ 已在main分支"
        fi
        
        # 处理remote
        repo_url="https://github.com/$github_user/$repo_name.git"
        
        if git remote | grep -q "^origin$"; then
            echo "🔄 更新remote地址..."
            git remote remove origin
            git remote add origin "$repo_url"
        else
            echo "➕ 添加remote..."
            git remote add origin "$repo_url"
        fi
        
        # 推送到GitHub
        echo ""
        echo "🚀 推送到GitHub..."
        echo "   仓库地址: $repo_url"
        echo ""
        
        if git push -u origin main 2>&1; then
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
            echo "💡 快速修复："
            echo "   cd tools && ./fix-github-deploy.sh"
            echo ""
            exit 1
        fi
        ;;
        
    3)
        echo ""
        echo "📦 生成部署包..."
        
        timestamp=$(date +%Y%m%d_%H%M%S)
        zip_name="pbl-pwa-${timestamp}.zip"
        
        if command -v zip &> /dev/null; then
            zip -r "$zip_name" . -x "*.git*" "*.DS_Store" "tools/*" "docs/*" "*.md" "CLEANUP-REPORT.md" "FILE-STRUCTURE.md"
            echo "✅ 部署包已生成: $zip_name"
            echo ""
            echo "📤 可以将此文件上传到："
            echo "   - Netlify (https://www.netlify.com/)"
            echo "   - Vercel (https://vercel.com/)"
            echo "   - 或您的服务器"
        else
            echo "⚠️  未找到zip命令，手动打包以下文件："
            echo "   核心文件:"
            echo "   - index.html"
            echo "   - manifest.json"
            echo "   - service-worker.js"
            echo "   资源文件夹:"
            echo "   - assets/"
            echo "   图标文件:"
            echo "   - icon-*.png (如果已生成)"
        fi
        ;;
        
    4)
        echo "👋 再见！"
        exit 0
        ;;
        
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

echo ""
echo "🎉 完成！"
