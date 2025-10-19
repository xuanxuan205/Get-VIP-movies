#!/bin/bash

echo "🚀 正在更新GitHub仓库..."
echo

echo "📝 添加所有更改的文件..."
git add .

echo "📋 提交更改..."
read -p "请输入提交信息 (默认: 更新VIP电影解析器): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="更新VIP电影解析器 - 优化搜索关键词和项目描述"
fi

git commit -m "$commit_msg"

echo "🌐 推送到GitHub..."
git push origin main

echo
echo "✅ GitHub仓库更新完成！"
echo "🔗 仓库地址: https://github.com/xuanxuan205/Get-VIP-movies"
echo "⭐ 记得给项目加个Star哦！"
echo