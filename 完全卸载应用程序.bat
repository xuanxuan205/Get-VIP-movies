@echo off
chcp 65001 > nul
title 顶级获取VIP电影 - 完全卸载工具 v2.1.1
color 0C

echo ============================================================
echo 顶级获取VIP电影 v2.1.1 完全卸载工具
echo ============================================================
echo.
echo ⚠️  警告: 此操作将完全删除应用程序及其所有数据
echo ⚠️  包括隐藏文件、注册表项和临时文件
echo.
echo 此操作不可逆，请确保您真的要卸载应用程序！
echo ============================================================
echo.

:: 检查Python是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 未检测到Python环境
    echo 请先安装Python或确保Python在系统PATH中
    echo.
    pause
    exit /b 1
)

:: 检查卸载脚本是否存在
if not exist "uninstall_app.py" (
    echo ❌ 错误: 未找到卸载脚本 uninstall_app.py
    echo 请确保卸载脚本在当前目录中
    echo.
    pause
    exit /b 1
)

echo ✅ Python环境检查通过
echo ✅ 卸载脚本检查通过
echo.

:: 询问用户确认
set /p confirm="确定要完全卸载应用程序吗? (输入 'YES' 确认): "
if /i not "%confirm%"=="YES" (
    echo.
    echo ❌ 用户取消卸载操作
    echo.
    pause
    exit /b 0
)

echo.
echo 🚀 开始执行卸载操作...
echo.

:: 运行卸载脚本
python uninstall_app.py

echo.
echo ============================================================
echo 卸载操作已完成
echo ============================================================
echo.
echo 💡 建议重启计算机以确保完全清理
echo.
pause 