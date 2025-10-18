#!/bin/bash

# VIP电影项目 - 依赖安装脚本 (Linux/Mac)

echo "========================================"
echo "   VIP电影项目 - 完整依赖安装工具"
echo "========================================"
echo

# 检查Python环境
echo "🔍 检查Python环境..."
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
    echo "✅ 找到 python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
    echo "✅ 找到 python"
else
    echo "❌ 错误: 未找到Python环境，请先安装Python"
    exit 1
fi

# 检查pip
echo "🔍 检查pip..."
if command -v pip3 &> /dev/null; then
    PIP_CMD="pip3"
    echo "✅ 找到 pip3"
elif command -v pip &> /dev/null; then
    PIP_CMD="pip"
    echo "✅ 找到 pip"
else
    echo "❌ 错误: 未找到pip，请先安装pip"
    exit 1
fi

# 升级pip
echo "📦 升级pip到最新版本..."
$PIP_CMD install --upgrade pip

echo
echo "========================================"
echo "    开始安装项目依赖"
echo "========================================"
echo

# 基础Web框架依赖
echo "📋 安装基础Web框架依赖..."
$PIP_CMD install Flask==2.3.3
$PIP_CMD install gunicorn==21.2.0
$PIP_CMD install requests==2.31.0

echo
echo "📋 安装GUI界面依赖..."
$PIP_CMD install PyQt5
$PIP_CMD install PyQt5-Qt5
$PIP_CMD install PyQt5-sip

echo
echo "📋 安装视频处理依赖..."
$PIP_CMD install beautifulsoup4
$PIP_CMD install yt-dlp
$PIP_CMD install lxml

echo
echo "📋 安装打包工具..."
$PIP_CMD install pyinstaller
$PIP_CMD install auto-py-to-exe

echo
echo "📋 安装其他实用工具..."
$PIP_CMD install psutil
$PIP_CMD install colorama
$PIP_CMD install tqdm

echo
echo "📋 安装数据处理工具..."
$PIP_CMD install json5
$PIP_CMD install python-dateutil

echo
echo "========================================"
echo "    依赖安装完成！"
echo "========================================"
echo
echo "💡 使用提示:"
echo "- 运行 '$PYTHON_CMD main.py' 启动主程序"
echo "- 运行 '$PYTHON_CMD build_with_expiry_management.py' 打包程序"
echo "- 运行 '$PYTHON_CMD activation_server.py' 启动激活服务器"
echo
echo "�� 所有依赖已安装完成！"
echo 