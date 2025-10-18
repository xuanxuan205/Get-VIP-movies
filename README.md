# Enterprise Media Content Management System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python Version](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/xuanxuan205/Get-VIP-movies)
[![Security](https://img.shields.io/badge/security-enhanced-green.svg)](./SECURITY.md)

## Overview

The Enterprise Media Content Management System is a sophisticated software solution designed to provide secure device-based authorization and content management capabilities. Built with enterprise-grade security features and scalable architecture, this system ensures robust protection against unauthorized access and license abuse.

## Key Features

### 🔐 Advanced Authorization System
- **Hardware Fingerprinting**: Generates unique device identifiers using multiple hardware components
- **Multi-Layer Storage**: Encrypted authorization records stored across registry, file system, and application directories
- **Anti-Tampering Protection**: Prevents unauthorized reinstallation and license reuse
- **Centralized Management**: Server-side authorization validation and lifecycle management

### 🏗️ Enterprise Architecture
- **Client-Server Model**: Scalable distributed architecture
- **RESTful API**: Standard HTTP-based communication protocol
- **Database Integration**: Persistent storage with backup and recovery
- **Load Balancing**: Support for high-availability deployments

## 技术实现

### 1. 设备唯一ID生成 (utils.py)

通过收集以下硬件信息生成设备唯一ID：
- Windows MachineGuid
- CPU信息
- 主板信息
- 网络MAC地址
- 计算机名和用户名
- Windows安装ID
- 硬盘序列号
- 显卡信息
- 系统盘卷标

使用SHA-256和MD5算法生成主ID和备用ID，确保ID的唯一性和稳定性。

### 2. 授权记录存储

授权记录包含以下信息：
- 授权码
- 设备ID
- 授权时间
- 版本信息

存储位置：
- **注册表**：多个随机命名的注册表项
- **文件系统**：用户目录下的多个隐藏位置
- **程序目录**：程序安装目录下的隐藏文件
- **临时目录**：作为备用存储位置

所有存储的数据都经过加密处理，使用基于授权码的密钥进行XOR加密和Base64编码。

### 3. 启动验证流程

程序启动时执行以下验证步骤：
1. 检查授权系统完整性
2. 获取当前设备ID
3. 检查授权码是否有效
4. 在多个位置查找授权记录
5. 比对授权记录中的设备ID与当前设备ID
6. 如果设备ID不匹配，判定为卸载重装行为，授权失效

### 4. 激活码封禁系统 (activation_server.py, ban_codes_manager.py)

管理员可以通过以下方式管理激活码：

**封禁功能**：
- 支持批量封禁激活码
- 记录封禁原因和时间
- 封禁后激活码无法使用
- 自动从激活码池和数据库中移除

**解封功能**：
- 支持批量解封激活码
- 解封后激活码可重新使用
- 自动恢复到激活码池

**管理工具**：
- 命令行管理工具 (ban_codes_manager.py)
- Windows批处理界面 (封禁激活码管理.bat)
- 服务器状态监控
- 封禁记录查看和管理

## 改进和修复

### 1. 权限问题修复

- 添加多级备用存储路径，解决权限不足问题
- 使用用户目录和临时目录作为备用存储位置
- 改进错误处理，确保至少有一个位置能成功存储

### 2. 加密/解密功能增强

- 改进解密函数的错误处理
- 添加对损坏数据的处理
- 支持多种数据格式（JSON、加密文本）

### 3. 激活验证流程优化

- 添加详细的日志记录
- 改进错误处理，防止单点故障
- 增加对旧版本升级的兼容处理

## 使用说明

1. 程序首次激活时，会生成设备唯一ID并存储激活记录
2. 如果用户卸载重装程序，新安装的程序会检测到设备ID与激活记录匹配，允许继续使用
3. 如果用户在不同设备上使用同一激活码，会被检测到并拒绝激活

### 封禁激活码管理

**命令行方式**：
```bash
# 查看服务器状态
python ban_codes_manager.py status

# 查看封禁列表
python ban_codes_manager.py list

# 封禁激活码
python ban_codes_manager.py ban DAY-ABC123 DAY-DEF456

# 解封激活码
python ban_codes_manager.py unban DAY-ABC123

# 清空封禁列表
python ban_codes_manager.py clear
```

**Windows图形界面**：
双击运行 `封禁激活码管理.bat` 文件，按照菜单提示操作。

**注意事项**：
- 封禁后的激活码将无法使用，即使重新安装程序
- 解封后的激活码可以重新使用
- 封禁操作会记录操作管理员和时间
- 建议在封禁前先查看激活码的使用情况

## 测试方法

使用提供的测试脚本验证系统功能：

```bash
python test_run.py
```

测试内容包括：
1. 设备ID生成
2. 激活记录保存
3. 激活记录检查
4. 配置文件读写

## 注意事项

- 激活记录存储在多个位置，确保系统安全性
- 所有存储的数据都经过加密处理
- 系统会记录异常使用行为到日志文件

