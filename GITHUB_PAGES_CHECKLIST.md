# ✅ GitHub Pages 部署操作清单

## 📋 部署前准备

### 1. 检查环境
- [ ] Git 已安装（运行 `git --version`）
- [ ] Node.js 已安装（运行 `node --version`）
- [ ] 已有 GitHub 账号

### 2. 创建 GitHub 仓库

访问 https://github.com/new 并：
- [ ] 输入仓库名称：`vue-todo-app`（或您喜欢的名称）
- [ ] 选择 **Public**（公开仓库，GitHub Pages 免费）
- [ ] **不要勾选** "Initialize this repository with a README"
- [ ] 点击 **Create repository**

---

## 🚀 部署步骤（按顺序执行）

### 步骤 1：关联远程仓库

在终端中运行（替换为您的用户名和仓库名）：

```bash
git remote add origin https://github.com/YOUR_USERNAME/vue-todo-app.git
```

例如：
```bash
git remote add origin https://github.com/john/vue-todo-app.git
```

### 步骤 2：推送代码到 GitHub

```bash
# 设置主分支
git branch -M main

# 推送到 GitHub
git push -u origin main
```

### 步骤 3：构建并部署

#### 方式 A：使用自动脚本（推荐）

**Windows 用户：**
```bash
.\github-deploy.bat
```

**Mac/Linux 用户：**
```bash
chmod +x deploy-github-pages.sh
./deploy-github-pages.sh
```

#### 方式 B：手动部署

```bash
# 1. 构建
npm run build

# 2. 创建 .nojekyll 文件
echo. > dist\.nojekyll    # Windows
# 或
touch dist/.nojekyll      # Mac/Linux

# 3. 提交到 gh-pages 分支
cd dist
git add .
git commit -m "Deploy to GitHub Pages"
git subtree split --prefix dist -b gh-pages
git push origin gh-pages --force
cd ..
```

### 步骤 4：启用 GitHub Pages

1. 访问您的仓库页面
2. 点击 **Settings** → **Pages**
3. 在 **Source** 下选择：
   - **Deploy from a branch**
   - 分支：**gh-pages**
   - 文件夹：**/(root)**
4. 点击 **Save**

### 步骤 5：等待部署生效

- ⏱️ 首次部署通常需要 **1-2 分钟**
- 您可以在 Settings → Pages 查看部署状态
- 刷新页面直到看到 "Your site is published at..."

---

## 🎉 完成！

访问您的网站：
```
https://YOUR_USERNAME.github.io/vue-todo-app
```

---

## 🔄 更新部署

修改代码后，重新部署：

```bash
# 提交更改
git add .
git commit -m "描述您的更改"
git push origin main

# 重新部署
.\github-deploy.bat    # Windows
# 或
./deploy-github-pages.sh    # Mac/Linux
```

---

## 🐛 故障排查

### 问题 1：404 Not Found

**可能原因：**
- GitHub Pages 尚未生效
- 未正确启用 GitHub Pages
- 选择了错误的分支

**解决方案：**
- 等待 2-3 分钟后重试
- 检查 Settings → Pages 是否正确配置
- 确认选择了 `gh-pages` 分支

### 问题 2：页面空白或样式丢失

**可能原因：**
- 资源路径错误

**解决方案：**
- 检查 `vite.config.ts` 中 `base: './'` 是否设置
- 清除浏览器缓存（Ctrl+Shift+R）

### 问题 3：推送失败

**可能原因：**
- 远程仓库地址错误
- 没有推送权限

**解决方案：**
```bash
# 检查远程仓库地址
git remote -v

# 如果需要修改
git remote set-url origin https://github.com/USERNAME/REPO.git
```

### 问题 4：GitHub Actions 失败

**查看日志：**
- 进入仓库 → Actions → 查看失败的作业
- 阅读错误信息

**常见问题：**
- 依赖安装失败 → 检查 package.json
- 构建错误 → 本地运行 `npm run build` 测试

---

## 📊 部署检查清单

完成后确认：

- [ ] Git 仓库已初始化
- [ ] 代码已推送到 GitHub（main 分支）
- [ ] gh-pages 分支已创建
- [ ] GitHub Pages 已启用
- [ ] 可以访问生成的 URL
- [ ] 页面加载正常
- [ ] 所有功能正常工作

---

## 💡 提示

### 自定义域名（可选）

1. 在 Settings → Pages → Custom domain 输入域名
2. 在 DNS 提供商处添加 CNAME 记录：
   ```
   CNAME  yourdomain.com  →  USERNAME.github.io
   ```

### 查看部署历史

```bash
# 查看 gh-pages 分支的提交历史
git log gh-pages --oneline
```

### 删除部署

```bash
# 删除 gh-pages 分支（停止部署）
git push origin --delete gh-pages
```

---

## 📞 需要帮助？

如果遇到问题：
1. 查看 [GITHUB_PAGES_GUIDE.md](./GITHUB_PAGES_GUIDE.md) 详细指南
2. 检查 GitHub Actions 日志
3. 参考 [GitHub Pages 官方文档](https://docs.github.com/en/pages)

---

**祝您部署顺利！** 🚀
