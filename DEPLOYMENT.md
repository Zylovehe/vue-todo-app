# 部署指南

## 📦 静态部署选项

本项目已配置好多种静态部署方案，选择其中一种即可：

---

## 选项 1：Vercel（推荐 ⭐）

**优点：** 免费、快速、自动 HTTPS、全球 CDN

### 部署步骤：

1. 访问 [vercel.com](https://vercel.com)
2. 点击 "New Project"
3. 连接您的 GitHub 仓库
4. Vercel 会自动检测配置并部署
5. 完成！您会获得一个 `https://your-app.vercel.app` 的域名

**本地部署命令：**
```bash
npm install -g vercel
vercel
```

---

## 选项 2：Netlify

**优点：** 免费、简单易用、支持表单

### 部署步骤：

1. 访问 [netlify.com](https://netlify.com)
2. 拖拽 `dist` 文件夹到 Netlify 仪表板
3. 或连接 GitHub 仓库自动部署
4. 完成！您会获得一个 `https://your-app.netlify.app` 的域名

**本地部署命令：**
```bash
npm install -g netlify-cli
netlify deploy --prod
```

---

## 选项 3：GitHub Pages

**优点：** 与 GitHub 集成、完全免费

### 部署步骤：

1. 将代码推送到 GitHub 仓库
2. 进入仓库设置 → Pages
3. 选择分支（main）和文件夹（/ (root)）
4. GitHub Actions 会自动构建和部署
5. 完成！您会获得一个 `https://username.github.io/repo-name` 的域名

**手动部署命令：**
```bash
npm run build
npx gh-pages -d dist
```

---

## 选项 4：Cloudflare Pages

**优点：** 超快速度、无限带宽、免费

### 部署步骤：

1. 访问 [pages.cloudflare.com](https://pages.cloudflare.com)
2. 连接 GitHub 仓库
3. 构建设置：
   - Build command: `npm run build`
   - Build output directory: `dist`
4. 完成！

---

## 选项 5：自建服务器（Nginx）

**优点：** 完全控制、适合内网部署

### Nginx 配置：

```nginx
server {
    listen 80;
    server_name your-domain.com;
    root /var/www/todo-app/dist;
    index index.html;

    # SPA 路由支持
    location / {
        try_files $uri $uri/ /index.html;
    }

    # 缓存静态资源
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # Gzip 压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
}
```

**部署命令：**
```bash
npm run build
scp -r dist/* user@server:/var/www/todo-app/
```

---

## 🔧 本地预览生产版本

在部署前，您可以在本地预览生产构建：

```bash
npm run build
npm run preview
```

然后访问 `http://localhost:4173`

---

## ⚠️ 重要说明

### 数据持久化
当前应用使用 **localStorage** 存储数据，这意味着：
- ✅ 数据保存在每个用户的浏览器中
- ❌ 不同设备之间数据不会同步
- ❌ 清除浏览器缓存会丢失数据

### 如果需要跨设备同步
需要添加后端服务和数据库，请联系我帮您升级为全栈应用。

---

## 🎯 快速开始推荐

**最快的方式（5分钟）：**

1. 注册 [Vercel](https://vercel.com)
2. 安装 Vercel CLI：`npm install -g vercel`
3. 在项目根目录运行：`vercel`
4. 按提示操作即可完成部署

访问地址示例：`https://vue-todo-app.vercel.app`

---

## 📊 各平台对比

| 平台 | 价格 | 速度 | 易用性 | 自定义域名 |
|------|------|------|--------|-----------|
| Vercel | 免费 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ |
| Netlify | 免费 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ✅ |
| GitHub Pages | 免费 | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ✅ |
| Cloudflare | 免费 | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ✅ |
| 自建服务器 | 付费 | 取决于服务器 | ⭐⭐⭐ | ✅ |

---

## 💡 下一步

选择您喜欢的平台进行部署，部署完成后分享链接给团队成员即可使用！

如需升级支持数据同步和多用户功能，请告诉我，我会帮您创建后端服务。
