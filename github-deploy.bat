@echo off
REM GitHub Pages 部署 - 快速开始脚本

echo.
echo ========================================
echo   GitHub Pages 部署 - 快速开始
echo ========================================
echo.
echo 这个脚本将帮助您快速准备 GitHub Pages 部署
echo.

REM 检查是否已关联远程仓库
git remote -v | findstr github >nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] Git 远程仓库已配置
    git remote get-url origin
    echo.
) else (
    echo [!] 尚未配置 GitHub 远程仓库
    echo.
    echo 请先完成以下步骤:
    echo.
    echo 1. 访问 https://github.com/new 创建新仓库
    echo 2. 仓库名称建议: vue-todo-app
    echo 3. 选择 Public（公开）
    echo 4. 不要勾选 "Initialize with README"
    echo 5. 点击 "Create repository"
    echo.
    echo 创建完成后，运行以下命令:
    echo.
    echo git remote add origin https://github.com/你的用户名/vue-todo-app.git
    echo git branch -M main
    echo git push -u origin main
    echo.
    pause
    exit /b 0
)

echo 接下来将执行构建和部署...
echo.
pause

echo.
echo [1/3] 构建生产版本...
call npm run build

if %ERRORLEVEL% NEQ 0 (
    echo [错误] 构建失败
    pause
    exit /b 1
)

echo.
echo [2/3] 创建 .nojekyll 文件...
echo. > dist\.nojekyll

echo.
echo [3/3] 提交到 gh-pages 分支...
cd dist
git add .
git commit -m "Deploy to GitHub Pages"
git subtree split --prefix dist -b gh-pages
git push origin gh-pages --force
cd ..

echo.
echo ========================================
echo   部署完成！
echo ========================================
echo.
echo 请访问: https://你的用户名.github.io/vue-todo-app
echo.
echo 注意:
echo - 首次部署可能需要 1-2 分钟生效
echo - 请在 GitHub 仓库设置中启用 GitHub Pages
echo - 选择 gh-pages 分支作为源
echo.
pause
