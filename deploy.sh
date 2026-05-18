#!/bin/bash

# Vue Todo App 快速部署脚本

echo "🚀 开始构建 Vue Todo App..."

# 清理之前的构建
rm -rf dist/

# 安装依赖
echo "📦 检查并安装依赖..."
npm install

# 构建生产版本
echo "🔨 构建生产版本..."
npm run build

echo ""
echo "✅ 构建完成！"
echo ""
echo "📁 构建产物位于: dist/ 目录"
echo ""
echo "💡 接下来您可以："
echo ""
echo "选项 1: 部署到 Vercel（推荐）"
echo "   npm install -g vercel"
echo "   vercel"
echo ""
echo "选项 2: 部署到 Netlify"
echo "   npm install -g netlify-cli"
echo "   netlify deploy --prod"
echo ""
echo "选项 3: 本地预览"
echo "   npm run preview"
echo ""
echo "详细部署指南请查看: DEPLOYMENT.md"
echo ""
