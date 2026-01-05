# 🚀 部署脚本使用指南

## ✅ 问题已修复！

部署脚本已更新，现在可以正确识别新的文件夹结构。

---

## 📋 如何使用

### 方式1：从项目根目录运行（推荐）

```bash
cd ~/workspace/private
./tools/deploy.sh
```

### 方式2：从tools目录运行

```bash
cd ~/workspace/private/tools
./deploy.sh
```

两种方式都可以！脚本会自动切换到项目根目录。

---

## 🎯 部署选项

运行脚本后，选择你需要的部署方式：

### 选项1：本地测试服务器

```
请选择 (1-4): 1
```

启动本地服务器，访问 http://localhost:8000 测试应用。

### 选项2：部署到GitHub Pages

```
请选择 (1-4): 2
```

按提示输入：
- GitHub用户名：`wangyu14thu`
- 仓库名称：`pbl_works`

自动推送到GitHub并提供后续步骤说明。

### 选项3：生成部署包

```
请选择 (1-4): 3
```

生成一个ZIP文件，可上传到Netlify、Vercel等平台。

### 选项4：退出

```
请选择 (1-4): 4
```

---

## 🔧 修复了什么？

### 之前的问题：
```
❌ 缺少以下文件：
style.css
script.js
```

### 原因：
脚本还在检查旧的文件路径（根目录下的 style.css 和 script.js）

### 解决方案：
1. ✅ 更新文件检查路径：
   - `style.css` → `assets/css/style.css`
   - `script.js` → `assets/js/script.js`

2. ✅ 添加自动目录切换：
   - 脚本自动找到项目根目录
   - 无论从哪里运行都能正常工作

3. ✅ 更新图标生成提示：
   - 现在正确指向 `tools/icon-generator.html`

---

## 📂 检查的文件列表

脚本现在会检查以下文件：

**核心文件**（必需）：
- ✅ `index.html`
- ✅ `assets/css/style.css`
- ✅ `assets/js/script.js`
- ✅ `manifest.json`
- ✅ `service-worker.js`

**图标文件**（可选，首次部署会提示生成）：
- ⚠️ `icon-72.png` 到 `icon-512.png` (8个文件)

---

## 🎨 生成图标

如果还没有生成图标：

```bash
# 打开图标生成器
open ~/workspace/private/tools/icon-generator.html

# 或者在浏览器中打开
firefox ~/workspace/private/tools/icon-generator.html
```

点击"下载所有图标"，图标会保存到 **下载** 文件夹，然后移动到项目根目录。

---

## 💡 完整部署流程

### 1. 生成图标（首次部署）

```bash
open tools/icon-generator.html
# 下载8个图标文件
mv ~/Downloads/icon-*.png ~/workspace/private/
```

### 2. 运行部署脚本

```bash
cd ~/workspace/private
./tools/deploy.sh
```

### 3. 选择部署方式

```
🌐 选择部署方式：
1) 启动本地测试服务器 (推荐先测试)
2) 部署到GitHub Pages
3) 生成部署包
4) 退出

请选择 (1-4): 1  # 先本地测试
```

### 4. 测试通过后部署

```bash
./tools/deploy.sh
# 选择 2) 部署到GitHub Pages
```

---

## 🐛 故障排除

### 问题1：权限被拒绝

```bash
bash: ./tools/deploy.sh: Permission denied
```

**解决方案**：
```bash
chmod +x tools/deploy.sh
chmod +x tools/fix-github-deploy.sh
./tools/deploy.sh
```

### 问题2：找不到Python

```bash
❌ 未找到Python，请手动启动服务器
```

**解决方案**：
```bash
# 安装Python3
sudo apt install python3

# 或使用Node.js
npx http-server -p 8000
```

### 问题3：Git推送失败

```bash
❌ 推送失败！
```

**解决方案**：
```bash
# 使用修复脚本
./tools/fix-github-deploy.sh

# 或手动修复
git remote -v  # 检查remote配置
git remote remove origin
git remote add origin https://github.com/wangyu14thu/pbl_works.git
git push -u origin main
```

---

## 🎯 快速命令参考

```bash
# 进入项目目录
cd ~/workspace/private

# 本地测试
./tools/deploy.sh  # 选择选项1

# 部署到GitHub
./tools/deploy.sh  # 选择选项2

# 修复Git配置
./tools/fix-github-deploy.sh

# 生成图标
open tools/icon-generator.html
```

---

## ✅ 验证部署成功

### 本地测试：
1. 运行 `./tools/deploy.sh` 选择选项1
2. 访问 http://localhost:8000
3. 检查页面是否正常显示
4. 检查图片是否正常加载

### GitHub Pages：
1. 访问 https://wangyu14thu.github.io/pbl_works/
2. 等待2-5分钟（首次部署）
3. 刷新页面
4. 尝试安装PWA到桌面

---

## 📞 需要帮助？

如果遇到问题：

1. 查看脚本输出的错误信息
2. 检查文件是否都在正确的位置
3. 确认Git配置是否正确
4. 使用 `./tools/fix-github-deploy.sh` 自动修复

---

**现在可以正常使用了！** 🎉

*最后更新：2026-01-04*

