@echo off
REM 手动部署到 GitHub Pages - 备用脚本

echo.
echo ========================================
echo   手动部署到 GitHub Pages
echo ========================================
echo.
echo 由于网络连接问题，请使用以下手动步骤部署：
echo.
echo 方法 1: 使用 GitHub Desktop（推荐）
echo ----------------------------------------
echo 1. 下载并安装 GitHub Desktop: https://desktop.github.com/
echo 2. 克隆您的仓库: https://github.com/Zylovehe/vue-todo-app.git
echo 3. 将 dist 文件夹的内容复制到新分支 gh-pages
echo 4. 推送 gh-pages 分支
echo.
echo 方法 2: 在 GitHub 网页上上传
echo ----------------------------------------
echo 1. 访问: https://github.com/Zylovehe/vue-todo-app/new/gh-pages
echo 2. 上传 dist 文件夹中的所有文件
echo 3. 提交更改
echo.
echo 方法 3: 等待网络恢复后重试
echo ----------------------------------------
echo 运行以下命令:
echo    git subtree push --prefix dist origin gh-pages
echo.
echo ========================================
echo   构建产物已准备就绪
echo ========================================
echo.
echo 位置: dist\ 目录
echo 请手动上传以下文件到 gh-pages 分支:
echo   - index.html
echo   - .nojekyll
echo   - assets/ 文件夹
echo.
pause
