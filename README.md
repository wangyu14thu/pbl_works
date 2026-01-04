# 🎯 PBL职业体验探索APP

基于PBL（项目式学习）理念的职业角色扮演学习平台，适合小学1-6年级学生。

## 📱 在线体验

- **网页版**: 直接访问 `index.html`
- **GitHub Pages**: https://wangyu14thu.github.io/pbl_works/
- **PWA应用**: 可安装到手机/电脑桌面

---

## 📁 项目结构

```
/
├── index.html              # 主页面入口
├── manifest.json           # PWA配置文件
├── service-worker.js       # 离线支持
│
├── assets/                 # 资源文件夹
│   ├── css/
│   │   └── style.css      # 样式文件
│   ├── js/
│   │   └── script.js      # 交互逻辑
│   └── images/
│       └── roles/         # 角色图片
│           ├── 自然守护者.png
│           ├── 少年工程师.png
│           ├── 少年CEO.png
│           ├── 文化策展人.png
│           └── 游戏策划师.png
│
├── docs/                   # 文档文件夹
│   ├── README.md          # 项目详细说明
│   ├── DESIGN.md          # UI设计文档
│   ├── ROLE-DESIGN.md     # 角色设计文档
│   ├── PWA-GUIDE.md       # PWA部署指南
│   └── PWA-SUMMARY.md     # PWA快速入门
│
└── tools/                  # 工具文件夹
    ├── icon-generator.html # 图标生成工具
    ├── deploy.sh          # 部署脚本
    └── fix-github-deploy.sh # Git修复脚本
```

---

## 🚀 快速开始

### 本地运行

```bash
# 启动本地服务器
python3 -m http.server 8000

# 访问
open http://localhost:8000
```

### PWA部署

```bash
# 1. 生成APP图标
open tools/icon-generator.html

# 2. 部署到GitHub Pages
cd tools
./deploy.sh
```

---

## ✨ 核心功能

### 1. 注册与个人中心
- 基本信息录入（昵称、性别、年级等）
- 年级个性化推荐

### 2. 角色选择
- 5个职业角色横向展示
- 上下错落的卡通设计
- 卡通角色图片展示

### 3. 项目匹配
- 根据角色自动匹配项目
- 项目详情和能力培养

### 4. 项目指南（PBL四步法）
- Step 1: 观察与发现
- Step 2: 学习与思考
- Step 3: 行动与创作
- Step 4: 分享与迭代

---

## 🎨 设计特色

### 未来宇宙空间主题
- 明亮的宇宙渐变背景
- 星云、星星动态效果
- 玻璃形态设计
- 3D悬浮动画

### 卡通风格
- 活泼的配色方案
- 可爱的角色插画
- 趣味动画效果

### 响应式设计
- 适配手机、平板、电脑
- PWA离线支持
- 全屏沉浸体验

---

## 📚 文档说明

### 必读文档

1. **docs/PWA-GUIDE.md** - PWA部署完整指南
   - 详细部署步骤
   - 多平台安装教程
   - 故障排除

2. **docs/DESIGN.md** - UI设计说明
   - 宇宙空间主题
   - 动画效果详解
   - 技术实现

3. **docs/ROLE-DESIGN.md** - 角色页面设计
   - 角色卡片布局
   - 交互效果说明

### 参考文档

- **docs/README.md** - 项目完整说明
- **docs/PWA-SUMMARY.md** - PWA快速入门

---

## 🛠️ 工具使用

### 图标生成器
```bash
open tools/icon-generator.html
```
自动生成8种尺寸的PWA图标

### 部署脚本
```bash
cd tools
./deploy.sh
```
选择部署方式：
1. 本地测试服务器
2. GitHub Pages部署
3. 生成部署包

### Git修复脚本
```bash
cd tools
./fix-github-deploy.sh
```
自动修复Git配置问题

---

## 📦 依赖说明

### 无需安装依赖
本项目是纯前端应用，不需要安装任何npm包或其他依赖。

### 可选工具
- Python 3（用于本地测试服务器）
- Git（用于版本控制和部署）

---

## 🌟 技术栈

- **HTML5** - 页面结构
- **CSS3** - 样式和动画
- **JavaScript** - 交互逻辑
- **PWA** - 渐进式Web应用
- **Service Worker** - 离线支持

---

## 📱 浏览器支持

- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

---

## 🎯 示例数据

目前内置**三年级**完整数据：

| 角色 | 项目 |
|------|------|
| 🌿 自然守护者 | 校园流浪猫避风港策划 |
| ⚙️ 未来工程师 | 自动浇花装置发明 |
| 💼 少年CEO | 班级零食交换日 |
| 🎨 文化策展人 | 探寻家乡非遗手艺 |
| 🎮 游戏策划师 | 课间游戏设计师 |

---

## 🔄 更新日志

### v1.0.0 (2026-01-04)
- ✅ 初始版本发布
- ✅ PWA功能完整
- ✅ 三年级数据完整
- ✅ 文件结构优化

---

## 📞 技术支持

遇到问题？

1. 查看 `docs/PWA-GUIDE.md` 故障排除
2. 检查浏览器控制台错误
3. 使用Chrome DevTools调试

---

## 🎉 开始使用

```bash
# 1. 克隆或下载项目
git clone https://github.com/wangyu14thu/pbl_works.git

# 2. 进入目录
cd pbl_works

# 3. 启动服务器
python3 -m http.server 8000

# 4. 访问
open http://localhost:8000
```

---

**让每个孩子都能成为他们想成为的人！** 🌟✨🚀

---

*最后更新：2026-01-04*

