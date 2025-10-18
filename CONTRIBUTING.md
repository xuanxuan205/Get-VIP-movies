# 贡献指南 / Contributing Guide

感谢您对本项目的关注！我们欢迎各种形式的贡献。

Thank you for your interest in this project! We welcome contributions of all kinds.

## 🤝 如何贡献 / How to Contribute

### 报告问题 / Reporting Issues

如果您发现了bug或有功能建议，请：

1. 检查是否已有相关的issue
2. 创建新的issue，详细描述问题
3. 提供复现步骤和环境信息

If you find a bug or have a feature suggestion, please:

1. Check if there's already a related issue
2. Create a new issue with detailed description
3. Provide reproduction steps and environment info

### 提交代码 / Submitting Code

1. **Fork项目** / Fork the project
2. **创建分支** / Create a branch
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **提交更改** / Commit your changes
   ```bash
   git commit -m "Add: your feature description"
   ```
4. **推送分支** / Push to the branch
   ```bash
   git push origin feature/your-feature-name
   ```
5. **创建Pull Request** / Create a Pull Request

## 📝 代码规范 / Code Standards

### Python代码规范 / Python Code Style

- 遵循 [PEP 8](https://www.python.org/dev/peps/pep-0008/) 规范
- 使用 `black` 进行代码格式化
- 使用 `flake8` 进行代码检查
- 添加适当的注释和文档字符串

```bash
# 格式化代码
black .

# 检查代码
flake8 .
```

### 提交信息规范 / Commit Message Convention

使用以下格式：/ Use the following format:

```
类型(范围): 简短描述

详细描述（可选）

关闭的issue（可选）
```

**类型 / Types:**
- `feat`: 新功能 / New feature
- `fix`: 修复bug / Bug fix
- `docs`: 文档更新 / Documentation update
- `style`: 代码格式 / Code style
- `refactor`: 重构 / Refactoring
- `test`: 测试 / Testing
- `chore`: 构建/工具 / Build/Tools

**示例 / Examples:**
```
feat(auth): 添加激活码验证功能
fix(ui): 修复界面显示问题
docs: 更新README文档
```

## 🧪 测试 / Testing

### 运行测试 / Running Tests

```bash
# 安装测试依赖
pip install pytest

# 运行所有测试
pytest

# 运行特定测试
pytest tests/test_activation.py

# 生成覆盖率报告
pytest --cov=.
```

### 编写测试 / Writing Tests

- 为新功能编写单元测试
- 测试文件命名为 `test_*.py`
- 使用描述性的测试函数名
- 包含正常和异常情况的测试

## 🔒 安全 / Security

### 安全考虑 / Security Considerations

- 不要提交敏感信息（密钥、密码等）
- 使用环境变量存储配置信息
- 遵循最小权限原则
- 定期更新依赖包

### 报告安全问题 / Reporting Security Issues

如果发现安全漏洞，请通过私有渠道联系维护者，不要公开披露。

If you discover a security vulnerability, please contact the maintainers through private channels rather than public disclosure.

## 📚 文档 / Documentation

### 文档更新 / Documentation Updates

- 保持README.md的准确性
- 更新API文档
- 添加使用示例
- 翻译重要文档

### 文档格式 / Documentation Format

- 使用Markdown格式
- 提供中英文双语版本
- 包含代码示例
- 添加适当的图片和图表

## 🌍 国际化 / Internationalization

### 语言支持 / Language Support

- 主要支持中文和英文
- 使用UTF-8编码
- 提供多语言界面
- 翻译错误信息

## 🎯 开发环境 / Development Environment

### 环境设置 / Environment Setup

```bash
# 克隆项目
git clone https://github.com/your-username/get-vip-movies.git
cd get-vip-movies

# 创建虚拟环境
python -m venv venv
source venv/bin/activate  # Linux/Mac
# 或
venv\Scripts\activate  # Windows

# 安装依赖
pip install -r requirements-public.txt
pip install -r requirements-dev.txt
```

### 推荐工具 / Recommended Tools

- **IDE**: VS Code, PyCharm
- **版本控制**: Git
- **代码格式化**: Black
- **代码检查**: Flake8, Pylint
- **测试**: Pytest
- **文档**: Sphinx

## 📋 检查清单 / Checklist

提交PR前请确认：/ Before submitting a PR, please ensure:

- [ ] 代码遵循项目规范
- [ ] 添加了必要的测试
- [ ] 测试全部通过
- [ ] 更新了相关文档
- [ ] 提交信息清晰明确
- [ ] 没有包含敏感信息

## 🏷️ 版本发布 / Release Process

### 版本号规范 / Version Numbering

使用语义化版本 [Semantic Versioning](https://semver.org/)：

- `MAJOR.MINOR.PATCH`
- `主版本.次版本.修订版本`

### 发布流程 / Release Workflow

1. 更新版本号
2. 更新CHANGELOG.md
3. 创建发布标签
4. 构建发布包
5. 发布到GitHub Releases

## 💬 社区 / Community

### 交流渠道 / Communication Channels

- GitHub Issues: 问题报告和功能请求
- GitHub Discussions: 一般讨论和问答
- Pull Requests: 代码贡献

### 行为准则 / Code of Conduct

- 尊重他人，友善交流
- 专注于技术讨论
- 避免政治和宗教话题
- 遵守开源社区规范

## 📄 许可证 / License

本项目采用MIT许可证，贡献的代码将在相同许可证下发布。

This project is licensed under the MIT License. Contributed code will be released under the same license.

---

再次感谢您的贡献！🎉

Thank you again for your contribution! 🎉