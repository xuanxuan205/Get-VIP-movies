@echo off
chcp 65001 > nul
title 顶级获取VIP电影 - 专业版 v2.1.1
color 0A

echo 正在启动顶级获取VIP电影...
echo 正在验证激活状态...

:: 创建临时目录
if not exist temp mkdir temp

:: 静默启动程序
start pythonw run.py --secure-mode --clean-traces --anti-detection

:: 退出启动脚本
exit 