# 🚀 GitHub Pages 部署指南

## 📦 您的项目已准备就绪

您的 Vue Todo 应用已经构建完成，准备部署到 GitHub Pages！

### ✅ 已完成的工作

- [x] 代码已推送至 `main` 分支
- [x] 生产构建已完成 (`dist/` 目录)
- [x] `.nojekyll` 文件已创建
- [x] GitHub Actions 配置已就绪
- [x] 部署脚本已准备

### 🌐 访问您的网站

部署完成后，您的网站将可以通过以下地址访问：
```
https://zylovehe.github.io/vue-todo-app
```

---

## 🚀 部署方法

### 方法 1：GitHub Actions（推荐）

1. **访问您的仓库设置**
   - 前往: https://github.com/Zylovehe/vue-todo-app/settings
   - 向下滚动到 "Pages" 部分

2. **配置 GitHub Pages**
   - Source: 选择 "Deploy from a branch"
   - Branch: 选择 `gh-pages` / `(root)` 
   - 点击 "Save"

3. **启用 Actions（如果尚未启用）**
   - 前往: https://github.com/Zylovehe/vue-todo-app/actions
   - 点击 "I understand my workflows, go ahead and enable them"
   - Actions 现在应该会自动运行部署

### 方法 2：手动部署

如果自动部署不起作用，可以手动部署：

1. **在本地运行部署脚本**
   ```bash
   # Windows
   .\github-deploy.bat
   
   # 或者
   .\deploy-github-pages.bat
   ```

2. **如果以上命令因网络问题失败，请手动操作**
   ```bash
   # 构建项目
   npm run build
   
   # 进入 dist 目录
   cd dist
   
   # 初始化一个新的 git 仓库
   git init
   git checkout -b gh-pages
   git add .
   git commit -m "Deploy to GitHub Pages"
   
   # 添加远程仓库并推送
   git remote add origin https://github.com/Zylovehe/vue-todo-app.git
   git push -f origin gh-pages
   ```

### 方法 3：GitHub 网页界面

1. **访问分支管理页面**
   - 前往: https://github.com/Zylovehe/vue-todo-app/branches

2. **创建 gh-pages 分支**
   - 如果不存在，点击 "New branch"
   - 分支名称: `gh-pages`
   - 源分支: `main`

3. **上传构建文件**
   - 访问: https://github.com/Zylovehe/vue-todo-app/tree/gh-pages
   - 点击 "Add file" → "Upload files"
   - 将 `dist` 目录中的所有文件拖拽上传
   - 提交更改

---

## 🎯 启用 GitHub Pages

无论使用哪种方法部署到 gh-pages 分支，都需要启用 GitHub Pages：

1. 访问仓库设置
2. 找到 "Pages" 部分
3. 选择 "Deploy from a branch"
4. 选择 "gh-pages" 分支，"/ (root)" 目录
5. 点击 "Save"

---

## ⏳ 部署时间

- 首次部署可能需要 1-2 分钟
- 您可以在仓库的 Settings → Pages 查看部署状态
- 一旦完成，您会看到 "Your site is published at https://zylovehe.github.io/vue-todo-app"

---

## 🔄 更新部署

未来更新应用时：

1. 在本地进行更改
2. 提交并推送至 main 分支
   ```bash
   git add .
   git commit -m "描述更改"
   git push origin main
   ```
3. GitHub Actions 会自动重新部署

---

## 🐛 故障排除

### 如果网站无法访问
- 检查是否启用了 GitHub Pages（在仓库设置中）
- 确认选择了正确的分支（gh-pages）
- 等待最多 5 分钟让部署生效

### 如果样式丢失
- 检查 `vite.config.ts` 中的 `base: './'` 设置
- 这确保了资源在子路径上也能正确加载

---

## 🎉 完成

部署完成后，分享这个链接给您的团队成员：
```
https://zylovehe.github.io/vue-todo-app
```

---

如有任何问题，请随时联系！
