#!/bin/bash

# PBL职业体验探索 - PWA部署脚本

echo "🚀 开始部署PBL职业体验探索PWA..."
echo ""

# 检查必要文件
echo "📋 检查文件完整性..."
files=("index.html" "style.css" "script.js" "manifest.json" "service-worker.js")
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
    echo "💡 请先打开 icon-generator.html 生成图标"
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
        if git diff-index --quiet HEAD --; then
            echo "✓ 没有新的更改需要提交"
        else
            echo "📝 提交更改..."
            git commit -m "Deploy PBL PWA - $(date +%Y-%m-%d)"
        fi
        
        # 确保在main分支
        current_branch=$(git branch --show-current)
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
            echo "📋 下一步操作："
            echo "1. 访问: https://github.com/$github_user/$repo_name/settings/pages"
            echo "2. 在 'Source' 中选择 'main' 分支"
            echo "3. 点击 'Save'"
            echo "4. 等待几分钟后访问:"
            echo ""
            echo "   🌐 https://$github_user.github.io/$repo_name/"
            echo ""
        else
            echo ""
            echo "❌ 推送失败！"
            echo ""
            echo "可能的原因："
            echo "1. 仓库 '$repo_name' 不存在"
            echo "   → 请在GitHub创建: https://github.com/new"
            echo ""
            echo "2. 没有推送权限"
            echo "   → 请配置GitHub访问令牌"
            echo "   → 或使用SSH: git@github.com:$github_user/$repo_name.git"
            echo ""
            echo "3. 需要先设置Git用户信息"
            echo "   → git config --global user.name \"你的名字\""
            echo "   → git config --global user.email \"你的邮箱\""
            echo ""
            echo "💡 手动部署步骤："
            echo "   git remote set-url origin git@github.com:$github_user/$repo_name.git"
            echo "   git push -u origin main"
            exit 1
        fi
        ;;
        
    3)
        echo ""
        echo "📦 生成部署包..."
        
        timestamp=$(date +%Y%m%d_%H%M%S)
        zip_name="pbl-pwa-${timestamp}.zip"
        
        if command -v zip &> /dev/null; then
            zip -r "$zip_name" . -x "*.git*" "*.DS_Store" "deploy.sh" "*.md"
            echo "✅ 部署包已生成: $zip_name"
            echo ""
            echo "📤 可以将此文件上传到："
            echo "   - Netlify (https://www.netlify.com/)"
            echo "   - Vercel (https://vercel.com/)"
            echo "   - 或您的服务器"
        else
            echo "⚠️  未找到zip命令，手动打包以下文件："
            echo "   - index.html"
            echo "   - style.css"
            echo "   - script.js"
            echo "   - manifest.json"
            echo "   - service-worker.js"
            echo "   - icon-*.png (所有图标)"
            echo "   - *.png (角色图片)"
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

