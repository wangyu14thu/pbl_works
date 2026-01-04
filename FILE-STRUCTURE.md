# 📁 项目文件结构说明

## ✅ 整理完成！

文件已按功能分类整理到不同文件夹中，结构清晰，便于维护。

---

## 📂 目录结构

```
/home/wangyu/workspace/private/
│
├── 📄 index.html              # 主页面入口
├── 📄 manifest.json           # PWA配置文件
├── 📄 service-worker.js       # Service Worker（离线支持）
├── 📄 README.md               # 项目说明（新）
├── 📄 .gitignore              # Git忽略文件（新）
│
├── 📁 assets/                 # 资源文件夹
│   │
│   ├── 📁 css/               # 样式文件
│   │   └── style.css         # 主样式文件
│   │
│   ├── 📁 js/                # JavaScript文件
│   │   └── script.js         # 主逻辑文件
│   │
│   └── 📁 images/            # 图片资源
│       └── 📁 roles/         # 角色图片
│           ├── 自然守护者.png (2.5MB)
│           ├── 少年工程师.png (2.6MB)
│           ├── 少年CEO.png (2.2MB)
│           ├── 文化策展人.png (1.8MB)
│           └── 游戏策划师.png (2.7MB)
│
├── 📁 docs/                   # 文档文件夹
│   ├── README.md             # 项目详细说明
│   ├── DESIGN.md             # UI设计文档（宇宙主题）
│   ├── ROLE-DESIGN.md        # 角色设计文档
│   ├── PWA-GUIDE.md          # PWA部署完整指南
│   └── PWA-SUMMARY.md        # PWA快速入门
│
└── 📁 tools/                  # 工具文件夹
    ├── icon-generator.html    # APP图标生成工具
    ├── deploy.sh             # 一键部署脚本
    └── fix-github-deploy.sh  # Git修复脚本
```

---

## 📊 文件分类说明

### 🏠 根目录（核心文件）

| 文件 | 说明 | 作用 |
|------|------|------|
| `index.html` | 主页面 | 应用入口，包含所有页面结构 |
| `manifest.json` | PWA配置 | 定义应用名称、图标、主题色 |
| `service-worker.js` | 离线支持 | 缓存资源，实现离线访问 |
| `README.md` | 项目说明 | 快速了解项目和使用方法 |
| `.gitignore` | Git配置 | 忽略不需要版本控制的文件 |

### 📦 assets/ - 资源文件夹

#### assets/css/ - 样式文件
- `style.css` - 主样式文件（1914行）
  - 全局样式和变量
  - 页面布局
  - 动画效果
  - 响应式设计
  - PWA样式

#### assets/js/ - JavaScript文件
- `script.js` - 主逻辑文件（546行）
  - 数据管理
  - 页面切换
  - 用户交互
  - 表单验证
  - 项目流程

#### assets/images/ - 图片资源
- `roles/` - 角色图片（5张，共12MB）
  - 高质量PNG格式
  - 用于角色选择页面

### 📚 docs/ - 文档文件夹

| 文档 | 行数 | 说明 |
|------|------|------|
| `README.md` | 211 | 项目完整说明和功能介绍 |
| `DESIGN.md` | 289 | UI设计文档（宇宙空间主题） |
| `ROLE-DESIGN.md` | 292 | 角色页面设计和布局说明 |
| `PWA-GUIDE.md` | 406 | PWA部署完整指南（最详细） |
| `PWA-SUMMARY.md` | - | PWA快速入门总结 |

### 🛠️ tools/ - 工具文件夹

| 工具 | 说明 |
|------|------|
| `icon-generator.html` | APP图标生成器，自动生成8种尺寸 |
| `deploy.sh` | 一键部署脚本，支持多种部署方式 |
| `fix-github-deploy.sh` | Git配置修复脚本 |

---

## 🔄 已删除的文件

- ❌ `GIT-FIXED.md` - 临时文档，已删除

---

## ✅ 路径更新

所有文件中的资源路径已自动更新：

### index.html
```html
<!-- 旧路径 -->
<link rel="stylesheet" href="style.css">
<script src="script.js"></script>

<!-- 新路径 ✓ -->
<link rel="stylesheet" href="assets/css/style.css">
<script src="assets/js/script.js"></script>
```

### script.js
```javascript
// 旧路径
image: '自然守护者.png'

// 新路径 ✓
image: 'assets/images/roles/自然守护者.png'
```

### service-worker.js
```javascript
// 旧路径
'/style.css', '/script.js', '/自然守护者.png'

// 新路径 ✓
'/assets/css/style.css', '/assets/js/script.js', '/assets/images/roles/自然守护者.png'
```

---

## 🎯 使用指南

### 查看文档
```bash
# 项目概览
cat README.md

# 详细使用说明
cat docs/README.md

# PWA部署指南
cat docs/PWA-GUIDE.md
```

### 使用工具
```bash
# 生成APP图标
open tools/icon-generator.html

# 部署到GitHub
cd tools && ./deploy.sh
```

### 本地运行
```bash
# 启动服务器（在项目根目录）
python3 -m http.server 8000

# 访问
open http://localhost:8000
```

---

## 📏 文件大小统计

```
总大小：约15MB

分类统计：
- 图片：12MB (assets/images/roles/)
- JavaScript：~50KB (assets/js/)
- CSS：~60KB (assets/css/)
- HTML：~15KB
- 文档：~150KB (docs/)
- 工具：~30KB (tools/)
```

---

## 🚀 优势

### ✅ 结构清晰
- 按功能分类
- 易于查找
- 便于维护

### ✅ 易于扩展
- 添加新资源到对应文件夹
- 文档独立管理
- 工具集中维护

### ✅ 版本控制友好
- .gitignore配置完善
- 关键文件在根目录
- 资源文件夹化

### ✅ 部署方便
- 根目录文件最少
- 路径引用正确
- 工具脚本齐全

---

## 📝 注意事项

### 1. 路径引用
所有资源路径已更新为相对路径，确保在任何环境下都能正常访问。

### 2. Git提交
使用新的目录结构提交时：
```bash
git add .
git commit -m "优化项目结构：资源分类整理"
git push
```

### 3. 部署
部署时需要上传整个项目文件夹，保持目录结构不变。

### 4. 图标生成
使用 `tools/icon-generator.html` 生成的图标需要放在**根目录**：
```
/icon-72.png
/icon-96.png
...
/icon-512.png
```

---

## 🎉 完成！

文件结构已优化完成，现在项目更加：
- ✨ 清晰易懂
- 🚀 便于维护
- 📦 易于部署
- 🎯 专业规范

---

*整理完成时间：2026-01-04*

