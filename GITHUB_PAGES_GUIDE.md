# 📖 GitHub Pages 部署完整指南

## 🎯 准备工作

### 1. 确保已安装 Git

检查是否已安装 Git：
```bash
git --version
```

如果未安装，请访问 https://git-scm.com/downloads 下载安装。

---

## 🚀 部署步骤

### 步骤 1：初始化 Git 仓库（如果还没有）

```bash
# 在项目根目录执行
git init
git add .
git commit -m "Initial commit: Vue Todo App"
```

### 步骤 2：创建 GitHub 仓库

1. 访问 https://github.com/new
2. 输入仓库名称，例如：`vue-todo-app`
3. 选择 **Public**（GitHub Pages 免费托管需要公开仓库）
4. **不要**勾选 "Initialize this repository with a README"
5. 点击 "Create repository"

### 步骤 3：推送代码到 GitHub

复制 GitHub 提供的命令并执行：

```bash
# 替换 username 为你的 GitHub 用户名
git remote add origin https://github.com/username/vue-todo-app.git
git branch -M main
git push -u origin main
```

### 步骤 4：配置 GitHub Actions（自动部署）

项目已包含 GitHub Actions 配置文件（`.github/workflows/deploy.yml`），推送后会自动执行。

**或者**使用手动部署脚本：

#### Windows 用户：
```bash
.\deploy-github-pages.bat
```

#### Mac/Linux 用户：
```bash
chmod +x deploy-github-pages.sh
./deploy-github-pages.sh
```

### 步骤 5：启用 GitHub Pages

1. 进入您的 GitHub 仓库
2. 点击 **Settings** → **Pages**
3. 在 **Source** 部分：
   - 如果使用自动部署：选择 **GitHub Actions**
   - 如果使用手动脚本：选择 **Deploy from a branch**，然后选择 **gh-pages** 分支和 **/(root)** 文件夹
4. 点击 **Save**

### 步骤 6：访问您的网站

几分钟后，您的网站将在以下地址可用：

```
https://username.github.io/vue-todo-app
```

---

## 🔧 自定义域名（可选）

如果您拥有自己的域名，可以配置自定义域名：

### 方法 1：通过 GitHub 设置

1. 进入 Settings → Pages
2. 在 **Custom domain** 输入您的域名，如 `todo.yourdomain.com`
3. 点击 **Save**
4. 按照提示配置 DNS 记录

### 方法 2：通过 CNAME 文件

创建 `public/CNAME` 文件：

```
todo.yourdomain.com
```

然后在 DNS 提供商处添加 CNAME 记录指向 `username.github.io`

---

## ⚙️ 自动部署配置

项目已配置 GitHub Actions 自动部署，每次推送到 `main` 分支时会自动：

1. 安装依赖
2. 构建生产版本
3. 部署到 GitHub Pages

配置文件：`.github/workflows/deploy.yml`

### 查看部署状态

```bash
# 在仓库中查看
# Actions → Deploy to GitHub Pages
```

---

## 🐛 常见问题

### Q1: 部署后访问出现 404？

**解决方案：**
- 等待几分钟让 GitHub Pages 生效
- 检查仓库设置中是否正确配置了 Pages
- 确认选择了正确的分支（gh-pages 或 main）
- 尝试清除浏览器缓存

### Q2: 页面加载但样式/图片无法显示？

**解决方案：**
- 检查 `vite.config.ts` 中的 `base` 配置
- 当前已设置为 `'./'` 以支持子路径部署

### Q3: 如何更新部署？

**解决方案：**
```bash
# 修改代码后
git add .
git commit -m "Update description"
git push origin main

# GitHub Actions 会自动部署
```

### Q4: 私有仓库可以使用 GitHub Pages 吗？

**答案：**
- ❌ 免费账户：只能公开仓库
- ✅ GitHub Pro/Team/Enterprise：可以私有仓库

### Q5: 如何撤销部署？

**解决方案：**
- 删除 `gh-pages` 分支即可停用 GitHub Pages
- 或在 Settings → Pages 中更改 Source 为 "None"

---

## 📊 项目结构说明

```
vue-todo-app/
├── .github/workflows/
│   └── deploy.yml          # GitHub Actions 部署配置
├── dist/                   # 构建产物（自动生成）
├── src/                    # 源代码
├── index.html              # HTML 入口
├── vite.config.ts          # Vite 配置（含 base 路径）
└── package.json            # 项目配置
```

---

## ✨ 优化建议

### 性能优化
- ✅ 已启用 Gzip 压缩
- ✅ 代码分割和懒加载
- ✅ 静态资源缓存策略

### SEO 优化（可选）
在 `index.html` 中添加 meta 标签：

```html
<meta name="description" content="Vue 3 待办事项应用">
<meta name="keywords" content="vue, todo, typescript, vite">
<meta property="og:title" content="Vue Todo App">
<meta property="og:description" content="基于 Vue 3 的待办事项应用">
```

---

## 📝 部署检查清单

部署前确认：

- [ ] Git 已安装
- [ ] GitHub 账号已注册
- [ ] 仓库已创建（公开）
- [ ] 代码已推送到 main 分支
- [ ] GitHub Actions 已启用
- [ ] GitHub Pages 已正确配置
- [ ] 可以访问生成的 URL

---

## 🎉 完成！

部署成功后，您可以：

1. ✅ 分享链接给团队成员
2. ✅ 在任何设备上访问应用
3. ✅ 收藏书签方便下次访问
4. ✅ 继续开发新功能并自动部署

**注意：** 当前数据存储在各自浏览器的 localStorage 中，不同设备不会同步。

如需数据同步功能，请联系我添加后端服务！

---

**祝您部署顺利！** 🚀
