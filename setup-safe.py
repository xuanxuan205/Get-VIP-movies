#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
SecureAuth Pro - 专业级设备授权系统
Professional Device Authorization System Setup Script
"""

from setuptools import setup, find_packages
import os

# 读取README文件
def read_readme():
    with open("README.md", "r", encoding="utf-8") as f:
        return f.read()

# 读取requirements文件
def read_requirements():
    requirements = []
    if os.path.exists("requirements-safe.txt"):
        with open("requirements-safe.txt", "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#"):
                    requirements.append(line)
    return requirements

setup(
    name="secureauth-pro",
    version="2.1.1",
    author="SecureAuth Team",
    author_email="dev@secureauth.pro",
    description="专业级设备授权与内容管理系统",
    long_description=read_readme(),
    long_description_content_type="text/markdown",
    url="https://github.com/xuanxuan205/Get-VIP-movies",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 5 - Production/Stable",
        "Intended Audience :: Developers",
        "Intended Audience :: System Administrators",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Operating System :: Microsoft :: Windows",
        "Operating System :: POSIX :: Linux",
        "Operating System :: MacOS",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Security",
        "Topic :: Security :: Cryptography",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: System :: Systems Administration :: Authentication/Directory",
        "Topic :: System :: Hardware :: Hardware Drivers",
        "Environment :: Console",
        "Environment :: Web Environment",
    ],
    python_requires=">=3.7",
    install_requires=read_requirements(),
    extras_require={
        "dev": [
            "pytest>=6.0",
            "pytest-cov>=2.0",
            "pytest-asyncio>=0.18",
            "black>=21.0",
            "isort>=5.0",
            "pylint>=2.0",
            "mypy>=0.800",
            "bandit>=1.7",
            "safety>=1.10",
        ],
        "docs": [
            "sphinx>=4.0",
            "sphinx-rtd-theme>=0.5",
            "myst-parser>=0.15",
            "sphinx-autodoc-typehints>=1.12",
        ],
        "monitoring": [
            "prometheus-client>=0.12",
            "grafana-api>=1.0",
            "psutil>=5.8",
        ],
        "performance": [
            "uvloop>=0.16; sys_platform != 'win32'",
            "orjson>=3.6",
            "lz4>=3.1",
        ],
        "full": [
            "urllib3>=1.26.0",
            "certifi>=2023.0.0",
            "cryptography>=41.0.0",
            "psutil>=5.9.0",
            "colorlog>=6.7.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "secureauth=main:main",
            "secureauth-server=server_activation:main",
            "secureauth-admin=activation_server:main",
            "secureauth-monitor=memory_monitor:main",
            "secureauth-diagnose=diagnose_server:main",
        ],
    },
    include_package_data=True,
    zip_safe=False,
    keywords=[
        "security", "authorization", "device-management", 
        "content-protection", "hardware-fingerprint", 
        "license-management", "professional", "enterprise"
    ],
    project_urls={
        "Homepage": "https://github.com/xuanxuan205/Get-VIP-movies",
        "Bug Reports": "https://github.com/xuanxuan205/Get-VIP-movies/issues",
        "Source": "https://github.com/xuanxuan205/Get-VIP-movies",
        "Documentation": "https://github.com/xuanxuan205/Get-VIP-movies/wiki",
        "Professional Guide": "https://github.com/xuanxuan205/Get-VIP-movies/blob/main/PROFESSIONAL_GUIDE.md",
        "API Documentation": "https://github.com/xuanxuan205/Get-VIP-movies/blob/main/API_DOCUMENTATION.md",
        "Security Policy": "https://github.com/xuanxuan205/Get-VIP-movies/blob/main/SECURITY.md",
    },
)