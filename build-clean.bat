@echo off
chcp 65001 >nul
echo.
echo ========================================
echo   MultiMedia Player Pro - 清洁构建
echo ========================================
echo.

:: 检查Python环境
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未找到Python环境
    echo 请先安装Python 3.7或更高版本
    pause
    exit /b 1
)

:: 创建清洁发布目录
echo 📁 创建发布目录...
if exist "release-clean" rmdir /s /q "release-clean"
mkdir "release-clean"

:: 复制安全文件
echo 📋 复制安全文件...
copy "README-CLEAN.md" "release-clean\README.md" >nul
copy "requirements-clean.txt" "release-clean\requirements.txt" >nul
copy "setup-clean.py" "release-clean\setup.py" >nul
copy "config-clean.json" "release-clean\config.json" >nul
if exist "LICENSE" copy "LICENSE" "release-clean\" >nul
if exist "icon.png" copy "icon.png" "release-clean\" >nul
if exist "icon.ico" copy "icon.ico" "release-clean\" >nul

:: 创建版本文件
echo 2.1.1 > "release-clean\version.txt"

:: 创建应用信息
echo 📝 生成应用信息...
python create-clean-release.py

:: 创建安装脚本
echo 📦 创建安装脚本...
echo @echo off > "release-clean\install.bat"
echo echo 正在安装 MultiMedia Player Pro... >> "release-clean\install.bat"
echo pip install -r requirements.txt >> "release-clean\install.bat"
echo python setup.py install >> "release-clean\install.bat"
echo echo 安装完成！ >> "release-clean\install.bat"
echo pause >> "release-clean\install.bat"

:: 创建启动脚本
echo #!/bin/bash > "release-clean\install.sh"
echo echo "正在安装 MultiMedia Player Pro..." >> "release-clean\install.sh"
echo pip install -r requirements.txt >> "release-clean\install.sh"
echo python setup.py install >> "release-clean\install.sh"
echo echo "安装完成！" >> "release-clean\install.sh"

:: 创建说明文件
echo 📖 创建使用说明...
(
echo # MultiMedia Player Pro - 安装说明
echo.
echo ## 快速安装
echo.
echo ### Windows:
echo 1. 双击运行 `install.bat`
echo 2. 等待安装完成
echo.
echo ### Linux/macOS:
echo 1. 运行 `chmod +x install.sh`
echo 2. 运行 `./install.sh`
echo.
echo ## 手动安装
echo.
echo ```bash
echo pip install -r requirements.txt
echo python setup.py install
echo ```
echo.
echo ## 运行程序
echo.
echo ```bash
echo multimedia-player
echo ```
echo.
echo ## 系统要求
echo.
echo - Python 3.7+
echo - 2GB+ RAM
echo - 100MB 存储空间
echo.
echo 更多信息请查看 README.md
) > "release-clean\INSTALL.md"

echo.
echo ✅ 清洁发布版本构建完成！
echo 📁 输出目录: release-clean\
echo.
echo 📋 包含文件:
dir /b "release-clean"
echo.
echo 🚀 现在可以安全地上传到GitHub了！
echo.
pause