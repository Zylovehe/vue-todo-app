# 📋 部署检查清单

## ✅ 部署前检查

- [ ] 代码已提交到 Git
- [ ] 所有功能测试通过
- [ ] TypeScript 编译无错误
- [ ] 生产版本构建成功 (`npm run build`)
- [ ] 本地预览正常 (`npm run preview`)

## 🚀 部署步骤（选择其一）

### 选项 A：Vercel（最简单）

1. **注册账号**
   - 访问 https://vercel.com
   - 使用 GitHub 账号登录

2. **部署项目**
   ```bash
   # 安装 Vercel CLI
   npm install -g vercel
   
   # 登录
   vercel login
   
   # 部署
   vercel
   ```

3. **配置说明**
   - Project Name: `vue-todo-app`（或自定义）
   - Directory: `./`（当前目录）
   - Framework: `Vite`（自动检测）
   - Build Command: `npm run build`
   - Output Directory: `dist`
   - Install Command: `npm install`

4. **完成！**
   - 您会获得一个 `https://xxx.vercel.app` 的域名
   - 分享链接给团队成员

---

### 选项 B：Netlify

1. **注册账号**
   - 访问 https://netlify.com

2. **拖拽部署（最简单）**
   - 将 `dist` 文件夹拖拽到 Netlify 仪表板
   - 立即获得 `https://xxx.netlify.app` 域名

3. **Git 集成部署（推荐）**
   - 点击 "New site from Git"
   - 连接 GitHub 仓库
   - 构建设置自动检测
   - 点击 "Deploy site"

4. **CLI 部署**
   ```bash
   npm install -g netlify-cli
   netlify login
   netlify deploy --prod
   ```

---

### 选项 C：GitHub Pages

1. **推送代码到 GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/username/vue-todo-app.git
   git push -u origin main
   ```

2. **启用 GitHub Pages**
   - 进入仓库 → Settings → Pages
   - Source: Deploy from a branch
   - Branch: main / root
   - 点击 Save

3. **等待自动部署**
   - GitHub Actions 会自动构建和部署
   - 几分钟后访问 `https://username.github.io/vue-todo-app`

4. **查看部署状态**
   - 进入仓库 → Actions
   - 查看部署进度

---

### 选项 D：Cloudflare Pages

1. **注册账号**
   - 访问 https://pages.cloudflare.com

2. **连接 GitHub**
   - 点击 "Create a project"
   - 连接 GitHub 仓库

3. **构建设置**
   - Framework preset: `Vue`
   - Build command: `npm run build`
   - Build output directory: `dist`
   - Environment variables: 无

4. **部署**
   - 点击 "Save and Deploy"
   - 获得 `https://xxx.pages.dev` 域名

---

### 选项 E：自建服务器（Nginx）

1. **构建项目**
   ```bash
   npm run build
   ```

2. **上传到服务器**
   ```bash
   scp -r dist/* user@your-server:/var/www/todo-app/
   ```

3. **配置 Nginx**
   - 使用项目根目录的 `nginx.conf` 示例配置
   - 重启 Nginx: `sudo systemctl restart nginx`

4. **访问**
   - 打开 `http://your-domain.com`

---

## 🔍 部署后验证

- [ ] 网站可以正常访问
- [ ] 页面加载无错误
- [ ] 添加待办功能正常
- [ ] 编辑/删除功能正常
- [ ] 过滤功能正常
- [ ] 刷新页面数据保留（localStorage）
- [ ] 移动端显示正常

---

## 🌐 自定义域名（可选）

### Vercel
1. 进入项目设置 → Domains
2. 添加您的域名
3. 按照提示配置 DNS

### Netlify
1. 进入 Site settings → Domain management
2. 点击 "Add custom domain"
3. 配置 DNS 记录

### GitHub Pages
1. 进入 Settings → Pages
2. Custom domain 输入您的域名
3. 在 DNS 提供商处配置 CNAME

---

## ⚠️ 注意事项

### 数据持久化限制
- ✅ 数据保存在用户浏览器 localStorage
- ❌ 不同设备数据不会同步
- ❌ 清除浏览器缓存会丢失数据
- 💡 如需跨设备同步，需要后端服务

### HTTPS
- Vercel、Netlify、Cloudflare 自动提供 HTTPS
- GitHub Pages 自动启用 HTTPS
- 自建服务器需自行配置 SSL 证书

### 性能优化
- 已启用 Gzip 压缩
- 静态资源缓存策略已配置
- 代码分割和懒加载已优化

---

## 🆘 常见问题

### Q: 部署后访问出现 404？
A: 确保配置了 SPA 路由重定向（配置文件已包含此设置）

### Q: 如何更新部署？
A: 
- Vercel/Netlify: 推送代码到 GitHub 自动重新部署
- 手动: 重新运行部署命令

### Q: 可以多人协作吗？
A: 当前版本数据存储在各自浏览器中，如需共享数据需要后端支持

### Q: 如何撤销部署？
A: 在各平台控制台可以回滚到之前的版本

---

## 📞 需要帮助？

如果部署过程中遇到问题，请查看：
- [DEPLOYMENT.md](./DEPLOYMENT.md) - 详细部署指南
- [README.md](./README.md) - 项目说明

---

**祝您部署顺利！** 🎉
