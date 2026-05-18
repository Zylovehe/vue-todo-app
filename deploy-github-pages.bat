@echo off
REM GitHub Pages 部署脚本 (Windows)

echo.
echo ========================================
echo   GitHub Pages 部署脚本
echo ========================================
echo.

REM 检查 Git 是否安装
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未检测到 Git，请先安装 Git
    pause
    exit /b 1
)

echo [1/5] 检查 Git 状态...
git status --porcelain
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 不是 Git 仓库，请先运行 git init
    pause
    exit /b 1
)

echo.
echo [2/5] 清理并构建生产版本...
if exist dist rmdir /s /q dist
call npm run build

if %ERRORLEVEL% NEQ 0 (
    echo [错误] 构建失败
    pause
    exit /b 1
)

echo.
echo [3/5] 创建 .nojekyll 文件（防止 Jekyll 处理）...
echo. > dist\.nojekyll

echo.
echo [4/5] 提交构建产物到 gh-pages 分支...
cd dist
git add .
git commit -m "Deploy to GitHub Pages: %date% %time%"
git push origin gh-pages --force
cd ..

echo.
echo [5/5] 清理临时文件...
rmdir /s /q dist

echo.
echo ========================================
echo   部署完成！
echo ========================================
echo.
echo 请访问: https://你的用户名.github.io/仓库名称
echo.
echo 注意:
echo 1. 首次部署可能需要几分钟时间生效
echo 2. 请在 GitHub 仓库设置中启用 GitHub Pages
echo 3. 选择 gh-pages 分支作为源
echo.
pause
