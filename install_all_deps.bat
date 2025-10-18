@echo off
chcp 65001 >nul
title VIP电影项目 - 依赖安装工具

echo.
echo ========================================
echo    VIP电影项目 - 完整依赖安装工具
echo ========================================
echo.

echo 🔍 检查Python环境...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未找到Python环境，请先安装Python
    pause
    exit /b 1
)

echo ✅ Python环境检查通过
echo.

echo 🔍 检查pip...
python -m pip --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未找到pip，请先安装pip
    pause
    exit /b 1
)

echo ✅ pip检查通过
echo.

echo 📦 升级pip到最新版本...
python -m pip install --upgrade pip

echo.
echo ========================================
echo    开始安装项目依赖
echo ========================================
echo.

echo 📋 安装基础Web框架依赖...
python -m pip install Flask==2.3.3
python -m pip install gunicorn==21.2.0
python -m pip install requests==2.31.0

echo.
echo 📋 安装GUI界面依赖...
python -m pip install PyQt5
python -m pip install PyQt5-Qt5
python -m pip install PyQt5-sip

echo.
echo 📋 安装视频处理依赖...
python -m pip install beautifulsoup4
python -m pip install yt-dlp
python -m pip install lxml

echo.
echo 📋 安装打包工具...
python -m pip install pyinstaller
python -m pip install auto-py-to-exe

echo.
echo 📋 安装其他实用工具...
python -m pip install psutil
python -m pip install colorama
python -m pip install tqdm

echo.
echo ========================================
echo    依赖安装完成！
echo ========================================
echo.
echo 💡 使用提示:
echo - 运行 'python main.py' 启动主程序
echo - 运行 'python build_with_expiry_management.py' 打包程序
echo - 运行 'python activation_server.py' 启动激活服务器
echo.
echo 🎉 所有依赖已安装完成！
echo.
pause 