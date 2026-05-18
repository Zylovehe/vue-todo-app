#!/bin/bash

# GitHub Pages 部署脚本 (Mac/Linux)

echo "🚀 开始 GitHub Pages 部署..."
echo ""

# 检查 Git 是否安装
if ! command -v git &> /dev/null; then
    echo "❌ 错误: 未检测到 Git，请先安装 Git"
    exit 1
fi

# 检查是否在 Git 仓库中
if ! git rev-parse --is-inside-work-tree &> /dev/null; then
    echo "❌ 错误: 不是 Git 仓库，请先运行 git init"
    exit 1
fi

echo "✅ [1/5] Git 检查通过"

echo ""
echo "📦 [2/5] 清理并构建生产版本..."
rm -rf dist/
npm run build

if [ $? -ne 0 ]; then
    echo "❌ 错误: 构建失败"
    exit 1
fi

echo ""
echo "📝 [3/5] 创建 .nojekyll 文件..."
touch dist/.nojekyll

echo ""
echo "📤 [4/5] 提交到 gh-pages 分支..."
cd dist
git add .
git commit -m "Deploy to GitHub Pages: $(date)"
git push origin gh-pages --force
cd ..

echo ""
echo "🧹 [5/5] 清理临时文件..."
rm -rf dist/

echo ""
echo "=========================================="
echo "  ✅ 部署完成！"
echo "=========================================="
echo ""
echo "请访问: https://你的用户名.github.io/仓库名称"
echo ""
echo "⚠️  注意:"
echo "1. 首次部署可能需要几分钟时间生效"
echo "2. 请在 GitHub 仓库设置中启用 GitHub Pages"
echo "3. 选择 gh-pages 分支作为源"
echo ""
