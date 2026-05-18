@echo off
REM Vue Todo App 快速部署脚本 (Windows)

echo.
echo ========================================
echo   Vue Todo App 部署脚本
echo ========================================
echo.

echo [1/3] 清理之前的构建...
if exist dist rmdir /s /q dist

echo.
echo [2/3] 检查并安装依赖...
call npm install

echo.
echo [3/3] 构建生产版本...
call npm run build

echo.
echo ========================================
echo   构建完成！
echo ========================================
echo.
echo 构建产物位于: dist\ 目录
echo.
echo 接下来您可以:
echo.
echo 选项 1: 部署到 Vercel（推荐）
echo    npm install -g vercel
echo    vercel
echo.
echo 选项 2: 部署到 Netlify
echo    npm install -g netlify-cli
echo    netlify deploy --prod
echo.
echo 选项 3: 本地预览
echo    npm run preview
echo.
echo 详细部署指南请查看: DEPLOYMENT.md
echo.
pause
