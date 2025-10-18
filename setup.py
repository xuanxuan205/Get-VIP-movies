#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Get VIP Movies - 安装脚本
Setup script for Get VIP Movies project
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
    if os.path.exists("requirements-public.txt"):
        with open("requirements-public.txt", "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#"):
                    requirements.append(line)
    return requirements

setup(
    name="get-vip-movies",
    version="2.1.1",
    author="Get VIP Movies Team",
    author_email="",
    description="VIP视频解析工具 - 激活码保护系统",
    long_description=read_readme(),
    long_description_content_type="text/markdown",
    url="https://github.com/your-username/get-vip-movies",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Operating System :: Microsoft :: Windows",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Multimedia :: Video",
        "Topic :: Software Development :: Libraries :: Python Modules",
    ],
    python_requires=">=3.7",
    install_requires=read_requirements(),
    extras_require={
        "dev": [
            "pytest>=7.4.0",
            "black>=23.7.0",
            "flake8>=6.0.0",
        ],
        "full": [
            "urllib3>=1.26.0",
            "certifi>=2023.0.0",
            "beautifulsoup4>=4.12.0",
            "lxml>=4.9.0",
            "cryptography>=41.0.0",
            "pycryptodome>=3.18.0",
            "psutil>=5.9.0",
            "wmi>=1.5.1",
            "colorlog>=6.7.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "get-vip-movies=main:main",
        ],
    },
    include_package_data=True,
    zip_safe=False,
    keywords="video, vip, parser, activation, protection",
    project_urls={
        "Bug Reports": "https://github.com/your-username/get-vip-movies/issues",
        "Source": "https://github.com/your-username/get-vip-movies",
        "Documentation": "https://github.com/your-username/get-vip-movies/wiki",
    },
)