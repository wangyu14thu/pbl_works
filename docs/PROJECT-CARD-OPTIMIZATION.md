# 项目选择页优化 - 缩小卡片并排显示

## 更新时间
2026-01-06

## 优化内容

### 布局改变：从Grid网格改为Flex并排

**修改前：**
- 使用Grid自适应布局：`grid-template-columns: repeat(auto-fit, minmax(320px, 1fr))`
- 在宽屏上可能3列，也可能2列，不固定
- 卡片间距2rem
- 卡片宽度不固定

**修改后：**
- 使用Flex弹性布局：`display: flex`
- **ABC三个项目强制并排显示**
- 每个卡片占比相等：`flex: 1`
- 最大宽度限制：`max-width: 32%`
- 卡片间距缩小为1rem

---

## 详细优化清单

### 1. 容器布局
```css
.projects-container {
    display: flex;              /* Grid改为Flex */
    justify-content: space-between;
    gap: 1rem;                  /* 2rem → 1rem */
    margin-bottom: 2rem;
}
```

### 2. 卡片基础样式
```css
.project-card {
    flex: 1;                    /* 新增：弹性占比 */
    max-width: 32%;             /* 新增：最大宽度限制 */
    border-radius: 20px;        /* 25px → 20px */
    border: 3px solid ...;      /* 4px → 3px */
    box-shadow: 更轻柔的阴影;
}
```

### 3. 项目头部缩小
```css
.project-header {
    padding: 1rem;              /* 1.5rem → 1rem */
}

.project-badge {
    padding: 0.3rem 1rem;       /* 0.5rem 1.5rem → 0.3rem 1rem */
    border-radius: 15px;        /* 20px → 15px */
    font-size: 0.8rem;          /* 0.9rem → 0.8rem */
    margin-bottom: 0.3rem;      /* 0.5rem → 0.3rem */
}

.project-title {
    font-size: 1.3rem;          /* 1.6rem → 1.3rem */
}

.project-difficulty {
    margin-top: 0.3rem;         /* 0.5rem → 0.3rem */
    font-size: 1rem;            /* 1.1rem → 1rem */
}
```

### 4. 项目内容缩小
```css
.project-body {
    padding: 1.2rem;            /* 2rem → 1.2rem */
}

.project-challenge,
.project-mission {
    margin-bottom: 1rem;        /* 1.5rem → 1rem */
}

.project-challenge-title,
.project-mission-title {
    font-size: 0.85rem;         /* 1rem → 0.85rem */
    margin-bottom: 0.4rem;      /* 0.5rem → 0.4rem */
    gap: 0.3rem;                /* 0.5rem → 0.3rem */
}

.project-challenge-title::before,
.project-mission-title::before {
    font-size: 1rem;            /* 1.2rem → 1rem */
}

.project-challenge-text,
.project-mission-text {
    font-size: 0.9rem;          /* 1rem → 0.9rem */
    line-height: 1.5;           /* 1.6 → 1.5 */
}
```

### 5. 关键词标签缩小
```css
.project-keywords {
    gap: 0.4rem;                /* 0.5rem → 0.4rem */
    margin-top: 0.8rem;         /* 1rem → 0.8rem */
}

.project-keyword {
    padding: 0.3rem 0.8rem;     /* 0.4rem 1rem → 0.3rem 0.8rem */
    border-radius: 12px;        /* 15px → 12px */
    font-size: 0.75rem;         /* 0.85rem → 0.75rem */
}
```

### 6. 按钮缩小
```css
.project-select-btn {
    padding: 0.8rem;            /* 1rem → 0.8rem */
    border-radius: 12px;        /* 15px → 12px */
    font-size: 0.95rem;         /* 1.1rem → 0.95rem */
    margin-top: 0.8rem;         /* 1rem → 0.8rem */
}
```

### 7. 悬停效果优化
```css
.project-card:hover {
    transform: translateY(-10px) scale(1.03) translateZ(20px);
    /* 原来：translateY(-15px) scale(1.05) translateZ(30px) */
    box-shadow: 更柔和的阴影;
}
```

### 8. 选中状态优化
```css
.project-card.selected {
    transform: scale(1.02);     /* 1.05 → 1.02 */
    box-shadow: 更柔和的阴影;
}
```

### 9. 响应式布局
```css
@media (max-width: 1024px) {
    .projects-container {
        flex-direction: column; /* 小屏幕改为纵向堆叠 */
    }
    
    .project-card {
        max-width: 100%;        /* 移除宽度限制 */
    }
}

@media (max-width: 768px) {
    /* 移动端进一步缩小字体和间距 */
}
```

---

## 视觉效果对比

### 修改前（Grid布局）
```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│   ┌─────────────────┐  ┌─────────────────┐  ┌────...  │
│   │   项目A (大)    │  │   项目B (大)    │  │        │
│   │                 │  │                 │  │        │
│   │  难度: ⭐⭐⭐    │  │  难度: ⭐⭐      │  │        │
│   │                 │  │                 │  │        │
│   │  核心挑战...    │  │  核心挑战...    │  │        │
│   │  (很多文字)     │  │  (很多文字)     │  │        │
│   │                 │  │                 │  │        │
│   │  你的使命...    │  │  你的使命...    │  │        │
│   │  (很多文字)     │  │  (很多文字)     │  │        │
│   │                 │  │                 │  │        │
│   │  [关键词标签]   │  │  [关键词标签]   │  │        │
│   │                 │  │                 │  │        │
│   │ [查看详情按钮]  │  │ [查看详情按钮]  │  │        │
│   └─────────────────┘  └─────────────────┘  └────...  │
│                                                         │
│   项目C在第二行或被挤到右边（不确定）                   │
│                                                         │
└─────────────────────────────────────────────────────────┘
(卡片过大，间距过宽，三个不一定能并排显示)
```

### 修改后（Flex并排）
```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐       │
│ │  项目A     │ │  项目B     │ │  项目C     │       │
│ │  ⭐⭐⭐     │ │  ⭐⭐       │ │  ⭐⭐⭐⭐   │       │
│ │            │ │            │ │            │       │
│ │ 核心挑战    │ │ 核心挑战    │ │ 核心挑战    │       │
│ │ 简洁文字... │ │ 简洁文字... │ │ 简洁文字... │       │
│ │            │ │            │ │            │       │
│ │ 你的使命    │ │ 你的使命    │ │ 你的使命    │       │
│ │ 简洁文字... │ │ 简洁文字... │ │ 简洁文字... │       │
│ │            │ │            │ │            │       │
│ │ [标签]     │ │ [标签]     │ │ [标签]     │       │
│ │ [按钮]     │ │ [按钮]     │ │ [按钮]     │       │
│ └─────────────┘ └─────────────┘ └─────────────┘       │
│                                                         │
└─────────────────────────────────────────────────────────┘
(紧凑布局，三个卡片强制并排，整体缩小约40%)
```

---

## 尺寸缩小统计

| 元素 | 修改前 | 修改后 | 缩小比例 |
|-----|-------|-------|---------|
| 卡片间距 | 2rem | 1rem | 50% ↓ |
| 卡片边框 | 4px | 3px | 25% ↓ |
| 卡片圆角 | 25px | 20px | 20% ↓ |
| 头部内边距 | 1.5rem | 1rem | 33% ↓ |
| 项目标题 | 1.6rem | 1.3rem | 19% ↓ |
| 难度星级 | 1.1rem | 1rem | 9% ↓ |
| 内容内边距 | 2rem | 1.2rem | 40% ↓ |
| 小标题 | 1rem | 0.85rem | 15% ↓ |
| 正文 | 1rem | 0.9rem | 10% ↓ |
| 关键词 | 0.85rem | 0.75rem | 12% ↓ |
| 按钮 | 1.1rem | 0.95rem | 14% ↓ |

**整体视觉缩小约：30-40%**

---

## 优势

### 1. 视觉效果
- ✅ 三个项目一目了然，方便对比
- ✅ 整体更紧凑，信息密度合理
- ✅ 减少滚动，提升浏览效率

### 2. 用户体验
- ✅ 并排显示便于比较难度和任务
- ✅ 缩小后更符合"选择"而非"详细阅读"的场景
- ✅ 点击任意卡片查看详情，流程更清晰

### 3. 响应式
- ✅ 桌面端（>1024px）：强制3列并排
- ✅ 平板端（768-1024px）：自动改为纵向堆叠
- ✅ 移动端（<768px）：单列全宽，字体进一步缩小

---

## 测试建议

访问：http://localhost:8000

**测试步骤：**
1. 注册后选择任意角色
2. 进入项目选择页
3. 观察三个项目是否并排显示
4. 检查卡片大小是否合适
5. 悬停卡片查看动画效果
6. 点击选中卡片查看选中态
7. 缩小浏览器窗口测试响应式

**对比要点：**
- [ ] 三个项目在同一行
- [ ] 卡片整体比之前小30-40%
- [ ] 文字清晰可读
- [ ] 关键词标签不拥挤
- [ ] 按钮大小合适
- [ ] 悬停效果流畅
- [ ] 小屏幕自动调整为纵向

---

## 可选的进一步优化

如果您觉得还需要调整，可以考虑：

1. **继续缩小**：
   - 减小字体：`font-size: 0.8rem` → `0.7rem`
   - 减小内边距：`padding: 1.2rem` → `1rem`

2. **增大卡片间距**：
   - `gap: 1rem` → `gap: 1.5rem`

3. **调整文字行数**：
   - 使用 `text-overflow: ellipsis` 截断过长文字
   - 限制最大行数：`-webkit-line-clamp: 2`

4. **固定卡片高度**：
   - 设置 `min-height` 确保三个卡片高度一致

---

**优化完成！** ✅

现在三个项目已经并排显示且整体缩小了约30-40%，信息密度更合理，浏览体验更好！

