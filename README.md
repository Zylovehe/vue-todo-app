# Vue Todo App

一个基于 Vue 3 + TypeScript + Vite 的待办事项应用。

## ✨ 功能特性

- ✅ 添加/删除/编辑待办事项
- ✅ 标记完成状态
- ✅ 过滤查看（全部/进行中/已完成）
- ✅ 数据持久化（localStorage）
- ✅ TypeScript 类型安全
- ✅ 响应式设计

## 🚀 快速开始

### 安装依赖

```bash
npm install
```

### 开发模式

```bash
npm run dev
```

访问 http://localhost:5173

### 构建生产版本

```bash
npm run build
```

### 预览生产版本

```bash
npm run preview
```

## 📦 部署

详细部署指南请查看 [DEPLOYMENT.md](./DEPLOYMENT.md)

**快速部署到 Vercel：**
```bash
npm install -g vercel
vercel
```

## 🛠️ 技术栈

- **前端框架：** Vue 3 (Composition API)
- **语言：** TypeScript 5.4
- **构建工具：** Vite 5.4
- **代码质量：** ESLint + Prettier
- **数据存储：** localStorage

## 📁 项目结构

```
src/
├── components/       # UI 组件
│   ├── TodoItem.vue
│   ├── TodoList.vue
│   └── TodoFilter.vue
├── composables/      # 组合式函数
│   └── useTodos.ts
├── types/           # TypeScript 类型
│   └── todo.ts
├── App.vue          # 根组件
└── main.ts          # 入口文件
```

## 📝 许可证

MIT
