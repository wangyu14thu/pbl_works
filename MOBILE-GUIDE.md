# 📱 手机使用APP完整指南

## 🎯 目标
让手机可以像原生APP一样使用PBL职业体验探索应用。

---

## ✅ 前置条件检查

### 1. 确认代码已推送到GitHub

```bash
cd ~/workspace/private

# 检查Git状态
git status

# 如果有未提交的更改
git add .
git commit -m "准备部署PWA到手机"

# 推送到GitHub
git push origin main
```

**确认推送成功**：
- 看到 `Everything up-to-date` 或推送成功的消息
- 访问 https://github.com/wangyu14thu/pbl_works 确认文件都在

---

## 📋 部署步骤（一步步来）

### Step 1: 启用GitHub Pages

#### 方式1：通过网页设置（推荐）

1. **访问仓库设置**
   ```
   https://github.com/wangyu14thu/pbl_works/settings/pages
   ```

2. **配置Pages**
   - 在 **"Source"** 部分
   - 选择 **"Deploy from a branch"**
   - Branch: 选择 **`main`** 
   - Folder: 选择 **`/ (root)`**
   - 点击 **"Save"** 按钮

3. **等待部署**
   - 页面会显示 "Your site is being built"
   - 等待2-5分钟
   - 刷新页面，会显示绿色提示和访问地址

#### 方式2：通过命令行（可选）

```bash
# 使用GitHub CLI
gh repo edit wangyu14thu/pbl_works --enable-pages --pages-branch main --pages-path /
```

---

### Step 2: 检查部署状态

#### 查看部署进度

1. **访问Actions页面**
   ```
   https://github.com/wangyu14thu/pbl_works/actions
   ```

2. **查看工作流**
   - 会看到 "pages build and deployment" 工作流
   - 绿色 ✅ 表示成功
   - 黄色 🟡 表示进行中
   - 红色 ❌ 表示失败

3. **等待完成**
   - 首次部署通常需要 2-5 分钟
   - 后续更新通常 1-2 分钟

---

### Step 3: 获取APP访问地址

部署成功后，你的APP地址是：

```
https://wangyu14thu.github.io/pbl_works/
```

**测试访问**：
```bash
# 在电脑上先测试
curl -I https://wangyu14thu.github.io/pbl_works/

# 或直接在浏览器打开
```

---

## 📱 在手机上安装APP

### Android手机（Chrome浏览器）

#### Step 1: 打开APP
1. 在手机上打开 **Chrome浏览器**
2. 访问：`https://wangyu14thu.github.io/pbl_works/`
3. 等待页面加载完成

#### Step 2: 安装提示
- **自动提示**：等待3秒，会自动弹出安装提示
  - 显示 "📱 安装PBL探索APP"
  - 点击 **"立即安装"** 按钮

- **手动安装**：如果没有自动弹出
  1. 点击右上角 **⋮** (三个点菜单)
  2. 选择 **"安装应用"** 或 **"添加到主屏幕"**
  3. 点击 **"安装"**

#### Step 3: 使用APP
- 应用图标会出现在桌面
- 点击图标打开，全屏显示
- 像原生APP一样使用

---

### iPhone/iPad（Safari浏览器）

#### Step 1: 打开APP
1. 在手机上打开 **Safari浏览器** （必须用Safari！）
2. 访问：`https://wangyu14thu.github.io/pbl_works/`
3. 等待页面加载完成

#### Step 2: 添加到主屏幕
1. 点击底部 **分享按钮** 📤 (方框带向上箭头)
2. 在弹出菜单中向下滚动
3. 找到并点击 **"添加到主屏幕"**
4. 可以修改名称（默认"PBL探索"）
5. 点击右上角 **"添加"**

#### Step 3: 使用APP
- 应用图标会出现在主屏幕
- 点击图标打开
- 全屏显示，像原生APP

---

## 🎨 生成APP图标（重要）

为了让APP图标好看，需要先生成图标：

### Step 1: 生成图标

```bash
# 在电脑上打开图标生成器
cd ~/workspace/private
firefox tools/icon-generator.html

# 或
google-chrome tools/icon-generator.html
```

### Step 2: 下载图标

1. 点击 **"📥 下载所有图标"** 按钮
2. 8个PNG文件会下载到 `~/Downloads/`

### Step 3: 移动到项目

```bash
# 移动图标到项目根目录
mv ~/Downloads/icon-*.png ~/workspace/private/

# 检查
ls -lh ~/workspace/private/icon-*.png
```

### Step 4: 提交并推送

```bash
cd ~/workspace/private
git add icon-*.png
git commit -m "添加PWA图标"
git push origin main

# 等待2-3分钟让GitHub Pages重新部署
```

### Step 5: 清除缓存重新安装

- **Android**: 卸载旧版APP，重新访问网址安装
- **iPhone**: 长按图标删除，重新添加到主屏幕

---

## ✨ PWA功能特点

安装后的APP具有以下功能：

### ✅ 离线访问
- 首次访问后自动缓存所有资源
- 没有网络也能打开和使用
- 数据保存在本地

### ✅ 全屏体验
- 隐藏浏览器地址栏
- 全屏沉浸式界面
- 像原生APP一样

### ✅ 快速启动
- 从桌面直接打开
- 秒开不等待
- 加载速度快

### ✅ 自动更新
- 后台自动检测更新
- 无需手动更新
- 始终使用最新版

---

## 🔍 验证PWA功能

### 在电脑Chrome上测试

1. **打开开发者工具**
   - 访问：`https://wangyu14thu.github.io/pbl_works/`
   - 按 `F12` 打开DevTools

2. **检查Manifest**
   - 切换到 **"Application"** 标签
   - 左侧选择 **"Manifest"**
   - 确认显示应用名称、图标等

3. **检查Service Worker**
   - Application → Service Workers
   - 应该看到 "Activated and is running"

4. **检查缓存**
   - Application → Cache Storage
   - 应该看到 "pbl-app-v1.0.0"
   - 展开查看缓存的文件

5. **运行Lighthouse审计**
   - 切换到 **"Lighthouse"** 标签
   - 勾选 **"Progressive Web App"**
   - 点击 **"Generate report"**
   - 查看PWA评分（应该全部通过）

---

## 📊 部署检查清单

使用这个清单确保一切正常：

```
部署前:
[ ] Git认证已配置（SSH或Token）
[ ] 代码已提交到本地
[ ] 代码已推送到GitHub
[ ] 图标已生成并提交

GitHub Pages:
[ ] 已启用GitHub Pages
[ ] Branch设置为main
[ ] Folder设置为/ (root)
[ ] 部署状态显示成功

手机安装:
[ ] 能访问APP地址
[ ] 页面正常显示
[ ] 图片正常加载
[ ] 能看到安装提示
[ ] 成功安装到桌面
[ ] APP能正常打开

PWA功能:
[ ] 离线模式可用
[ ] 全屏显示
[ ] 图标正确显示
[ ] 所有功能正常
```

---

## 🐛 常见问题

### Q1: 访问APP地址显示404

**原因**：GitHub Pages还未部署完成

**解决**：
```bash
# 检查部署状态
# 访问: https://github.com/wangyu14thu/pbl_works/actions

# 等待部署完成（绿色✅）
# 清除浏览器缓存后重试
```

### Q2: 没有安装提示

**原因**：图标文件未生成或PWA配置有问题

**解决**：
```bash
# 1. 生成并上传图标
cd ~/workspace/private
# 打开 tools/icon-generator.html 生成图标
# 移动到根目录并推送

# 2. 检查manifest.json
cat manifest.json  # 确认配置正确

# 3. 清除浏览器缓存
# Chrome: Ctrl+Shift+Del
# Safari: 设置 → Safari → 清除历史记录
```

### Q3: iPhone上找不到"添加到主屏幕"

**原因**：必须使用Safari浏览器

**解决**：
- ❌ 不能用Chrome或其他浏览器
- ✅ 必须用Safari
- 点击 📤 分享按钮找到选项

### Q4: 图标显示不正确

**原因**：图标文件缺失或路径错误

**解决**：
```bash
# 检查图标文件
cd ~/workspace/private
ls -lh icon-*.png

# 应该有8个文件：
# icon-72.png
# icon-96.png
# icon-128.png
# icon-144.png
# icon-152.png
# icon-192.png
# icon-384.png
# icon-512.png

# 如果缺少，重新生成
```

### Q5: 页面样式混乱

**原因**：Service Worker缓存了旧版本

**解决**：
```bash
# 手机上：
# 1. 长按APP图标，删除
# 2. 清除浏览器缓存
# 3. 重新访问并安装
```

---

## 🔄 更新APP

当你修改代码后，如何让手机APP更新：

### Step 1: 更新代码

```bash
cd ~/workspace/private

# 修改代码...

# 提交更改
git add .
git commit -m "更新功能"

# 推送
git push origin main
```

### Step 2: 等待部署

- GitHub Actions自动部署（1-2分钟）
- 访问 Actions 页面查看进度

### Step 3: 手机端更新

#### 自动更新（推荐）
- Service Worker会自动检测更新
- 后台下载新版本
- 下次打开APP自动使用新版

#### 手动强制更新
```
Android:
1. 卸载APP
2. 清除Chrome缓存
3. 重新安装

iPhone:
1. 长按图标删除
2. Safari → 清除历史记录
3. 重新添加到主屏幕
```

---

## 📱 分享给其他人

你的朋友也想用？给他们发送：

### 分享链接
```
https://wangyu14thu.github.io/pbl_works/
```

### 安装说明

**Android用户**：
1. 用Chrome打开链接
2. 点击"立即安装"
3. 完成！

**iPhone用户**：
1. 用Safari打开链接
2. 点击 📤 → 添加到主屏幕
3. 完成！

---

## 🎯 快速步骤总结

```bash
# 1. 确认推送成功
cd ~/workspace/private
git push origin main

# 2. 启用GitHub Pages
# 访问：https://github.com/wangyu14thu/pbl_works/settings/pages
# Source: main分支, / (root)

# 3. 等待2-5分钟

# 4. 手机访问
# https://wangyu14thu.github.io/pbl_works/

# 5. 安装到桌面
# Android: 点击安装提示
# iPhone: 分享 → 添加到主屏幕

# 完成！🎉
```

---

## 📚 相关文档

- **docs/PWA-GUIDE.md** - PWA完整部署指南
- **GITHUB-AUTH.md** - GitHub认证配置
- **DEPLOY-GUIDE.md** - 部署脚本使用
- **README.md** - 项目总览

---

**现在就去启用GitHub Pages，让手机用上APP吧！** 🚀📱

*最后更新：2026-01-04*

