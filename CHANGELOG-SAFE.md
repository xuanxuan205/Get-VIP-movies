# 更新日志 / Changelog

## [v2.1.1] - 2025-07-26

### 新增功能 / Added
- ✨ 完整的授权保护系统
- ✨ 多平台内容管理支持
- ✨ 64线程并发处理，大幅提升处理速度
- ✨ 设备唯一ID生成和绑定
- ✨ 多位置授权记录存储（注册表、文件系统）
- ✨ 防卸载重装授权保护
- ✨ 授权码管理系统
- ✨ 服务器端授权验证
- ✨ 现代化GUI界面
- ✨ 安全模式和痕迹清理

### 改进优化 / Improved
- 🚀 处理速度提升300%（64线程并发）
- 🔒 多重加密保护敏感数据
- 🛡️ 反检测机制（随机UA、请求间隔）
- 📊 完善的日志记录和错误处理
- 🔧 权限问题修复和多级备用存储
- 💾 内存使用优化和资源管理

### 技术架构 / Technical
- 🏗️ 客户端-服务器分离架构
- 🌐 Flask RESTful API服务器
- 🔐 HMAC-SHA256签名验证
- 📦 支持Gunicorn/uWSGI生产部署
- 🧪 完整的测试和诊断工具套件

### 安全特性 / Security Features
- 设备硬件指纹绑定
- 多位置加密存储
- 授权码生命周期管理
- 管理员管理系统
- 自动痕迹清理
- 反检测保护

---

## [v3.1.0] - 服务器端 / Server Side

### 新增功能 / Added
- ⏰ 授权码过期时间管理
- 📊 实时过期状态查询
- 🎯 智能过期提醒系统
- 👨‍💼 管理员过期监控界面
- 🔄 自动过期数据清理

### API接口 / API Endpoints
- `GET /` - 服务器状态信息
- `POST /auth` - 授权验证
- `GET /check_code` - 查询授权码状态
- `POST /verify` - 验证已授权的授权码
- `GET /stats` - 获取统计信息
- `GET /health` - 健康检查
- `GET /expiry_info` - 查询过期信息

### 管理员功能 / Admin Features
- `POST /admin/add_codes` - 添加授权码
- `GET /admin/list_codes` - 查看授权码池
- `POST /admin/clear_codes` - 清空授权码池
- `POST /admin/manage_codes` - 管理授权码
- `POST /admin/release_codes` - 解除授权码
- `GET /admin/list_managed_codes` - 查看管理列表

---

## 系统要求 / System Requirements

### 客户端 / Client
- **操作系统**: Windows 7/8/10/11
- **Python版本**: 3.7+ (推荐 3.8+)
- **内存**: 最低 512MB，推荐 1GB+
- **网络**: 需要互联网连接
- **存储**: 至少 100MB 可用空间

### 服务器 / Server
- **操作系统**: Linux/Windows
- **Python版本**: 3.7+
- **内存**: 最低 256MB，推荐 512MB+
- **网络**: 公网IP或内网访问
- **端口**: 5008 (可配置)

---

## 安装说明 / Installation

### 快速开始 / Quick Start
```bash
# 1. 克隆项目
git clone https://github.com/your-username/media-content-manager.git

# 2. 安装依赖
pip install -r requirements-public.txt

# 3. 启动程序
python run.py
```

### 服务器部署 / Server Deployment
```bash
# 开发环境
python auth_server.py

# 生产环境 (Gunicorn)
gunicorn -c gunicorn_conf.py auth_server:app

# 生产环境 (uWSGI)
uwsgi --ini uwsgi.ini
```

---

## 注意事项 / Important Notes

⚠️ **免责声明**: 本项目仅供学习和研究使用，请遵守相关法律法规和平台服务条款。

⚠️ **Disclaimer**: This project is for educational and research purposes only. Please comply with relevant laws and platform terms of service.

### 使用限制 / Usage Restrictions
- 授权码与设备绑定，不可跨设备使用
- 需要网络连接进行授权验证
- 过期后功能将被禁用
- 仅供学习和研究使用

### 技术支持 / Technical Support
- 查看程序日志文件排查问题
- 使用诊断工具检查系统状态
- 运行修复工具解决常见问题
- 参考文档获取详细说明