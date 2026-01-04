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
        echo "执行以下命令："
        echo ""
        echo "git init"
        echo "git add ."
        echo "git commit -m 'Deploy PBL PWA'"
        echo "git branch -M main"
        echo "git remote add origin https://github.com/$github_user/$repo_name.git"
        echo "git push -u origin main"
        echo ""
        echo "然后在GitHub仓库设置中启用Pages"
        echo "访问地址将是: https://$github_user.github.io/$repo_name/"
        echo ""
        read -p "是否现在执行？(y/n) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git init
            git add .
            git commit -m "Deploy PBL PWA"
            git branch -M main
            git remote add origin "https://github.com/$github_user/$repo_name.git"
            git push -u origin main
            echo ""
            echo "✅ 推送完成！请在GitHub启用Pages"
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

