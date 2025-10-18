#!/bin/bash
# 服务器重启脚本

echo "🔄 正在重启激活服务器..."

# 停止现有进程
if [ -f "gunicorn.pid" ]; then
    PID=$(cat gunicorn.pid)
    echo "停止进程 PID: $PID"
    kill -TERM $PID 2>/dev/null
    sleep 2
    kill -KILL $PID 2>/dev/null
    rm -f gunicorn.pid
fi

# 清理临时文件
rm -rf __pycache__
rm -f *.pyc

# 检查数据库
echo "检查数据库状态..."
python fix_activation_db.py

# 启动服务器
echo "启动服务器..."
nohup gunicorn -c gunicorn_conf.py activation_server:app > server.log 2>&1 &

echo "✅ 服务器重启完成"
echo "📋 查看日志: tail -f server.log"
