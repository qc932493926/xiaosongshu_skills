---
name: env-checker
description: 自动检查并指导安装Skill所需的运行环境（Python、Node.js、Git等）。当用户遇到环境问题或需要安装依赖时使用。
---

# 环境检查与安装指导

自动检测系统环境，识别缺失的依赖，并提供针对不同操作系统的安装指导。

## 支持的环境检查

### 核心运行时
- **Python** (pip, venv)
- **Node.js** (npm, yarn, pnpm)
- **Git**

### 常用工具
- **curl** - HTTP请求工具
- **jq** - JSON处理工具
- **ffmpeg** - 音视频处理
- **imagemagick** - 图像处理
- **docker** - 容器化环境

## 使用场景

1. **Skill安装前**：检查环境是否满足要求
2. **执行失败时**：诊断缺失的依赖
3. **批量检查**：一次性检查所有常用环境
4. **新环境配置**：快速配置开发环境

## 使用方法

### 方法1：运行检查脚本

```bash
bash ~/.claude/skills/env-checker/check-env.sh
```

### 方法2：让AI自动检查（推荐）

直接对AI说：
```
检查一下我的Python环境
```

```
我要用wechat2md，帮我检查需要什么环境
```

```
批量检查所有常用环境
```

## 输出示例

```
======================================
     环境检查工具 v1.0
======================================

操作系统: Windows

====== 核心运行时 ======

检查 Python... ✗ 未安装
安装建议:
  winget install -e --id Python.Python.3.12
  或访问: https://www.python.org/downloads/

检查 Node.js... ✓ 已安装
v22.21.1
  npm: 10.9.4

检查 Git... ✓ 已安装
git version 2.9.3.windows.1

...

======================================
检查完成！
======================================
```

## 安装优先级建议

### 必装（大部分Skill需要）
1. **Python** - 数据处理、爬虫、AI相关skill
2. **Node.js** - 前端工具、服务端工具
3. **Git** - 版本控制

### 按需安装（作为备选项）
4. **curl** - HTTP请求（大部分系统自带）
5. **jq** - JSON处理（API相关skill需要）
6. **ffmpeg** - 音视频处理（媒体skill需要）
7. **imagemagick** - 图像处理（图片skill需要）
8. **docker** - 复杂环境隔离（高级skill需要）

**安装原则**：平时不安装，在某个skill确实需要时再安装这些环境。

## 检查流程

### 1. 检测操作系统

首先识别用户的操作系统：
```bash
# Windows
systeminfo | findstr /C:"OS Name"

# macOS
sw_vers

# Linux
cat /etc/os-release
```

### 2. 检查Python环境

**检测命令**：
```bash
python --version
```

**如果未安装，根据系统提供安装方法**：

- **Windows**:
  ```bash
  # 方法1：使用winget（推荐）
  winget install -e --id Python.Python.3.12

  # 方法2：手动下载
  # 访问 https://www.python.org/downloads/
  # 下载安装包，安装时勾选"Add Python to PATH"
  ```

- **macOS**:
  ```bash
  # 方法1：使用Homebrew（推荐）
  brew install python@3.12

  # 方法2：手动下载
  # 访问 https://www.python.org/downloads/macos/
  ```

- **Linux (Ubuntu/Debian)**:
  ```bash
  sudo apt update
  sudo apt install python3 python3-pip python3-venv
  ```

- **Linux (CentOS/RHEL)**:
  ```bash
  sudo yum install python3 python3-pip
  ```

**验证安装**：
```bash
python --version
pip --version
```

**常见Python依赖安装**：
```bash
# 基础依赖（适用于大部分Skill）
pip install requests beautifulsoup4 html2text

# 数据处理
pip install pandas numpy

# Web相关
pip install flask fastapi

# 异步支持
pip install aiohttp
```

### 3. 检查Node.js环境

**检测命令**：
```bash
node -v
npm -v
```

**如果未安装，根据系统提供安装方法**：

- **Windows**:
  ```bash
  # 方法1：使用winget（推荐）
  winget install -e --id OpenJS.NodeJS

  # 方法2：手动下载
  # 访问 https://nodejs.org/
  # 下载LTS版本安装包
  ```

- **macOS**:
  ```bash
  # 方法1：使用Homebrew（推荐）
  brew install node

  # 方法2：使用nvm（版本管理）
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  nvm install --lts
  ```

- **Linux (Ubuntu/Debian)**:
  ```bash
  # 使用NodeSource仓库（推荐）
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs

  # 或使用包管理器
  sudo apt install nodejs npm
  ```

- **Linux (CentOS/RHEL)**:
  ```bash
  curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
  sudo yum install -y nodejs
  ```

**验证安装**：
```bash
node -v
npm -v
```

**包管理器选择**：
```bash
# npm（默认）
npm install <package>

# yarn（推荐，更快）
npm install -g yarn
yarn add <package>

# pnpm（节省空间）
npm install -g pnpm
pnpm add <package>
```

### 4. 检查Git

**检测命令**：
```bash
git --version
```

**如果未安装**：

- **Windows**:
  ```bash
  winget install -e --id Git.Git
  # 或访问 https://git-scm.com/download/win
  ```

- **macOS**:
  ```bash
  brew install git
  # 或使用Xcode Command Line Tools: xcode-select --install
  ```

- **Linux**:
  ```bash
  # Ubuntu/Debian
  sudo apt install git

  # CentOS/RHEL
  sudo yum install git
  ```

### 5. 检查curl/wget

**检测命令**：
```bash
curl --version
wget --version
```

**安装方法**：

- **Windows**: 通常Git Bash自带，或使用 `winget install -e --id cURL.cURL`
- **macOS**: 系统自带，或 `brew install curl wget`
- **Linux**: `sudo apt install curl wget` 或 `sudo yum install curl wget`

### 6. 检查jq (JSON处理)

**检测命令**：
```bash
jq --version
```

**安装方法**：

- **Windows**: `winget install -e --id stedolan.jq`
- **macOS**: `brew install jq`
- **Linux**: `sudo apt install jq` 或 `sudo yum install jq`

### 7. 检查ffmpeg (音视频处理)

**检测命令**：
```bash
ffmpeg -version
```

**安装方法**：

- **Windows**: `winget install -e --id Gyan.FFmpeg`
- **macOS**: `brew install ffmpeg`
- **Linux**: `sudo apt install ffmpeg` 或 `sudo yum install ffmpeg`

### 8. 检查imagemagick (图像处理)

**检测命令**：
```bash
convert -version
```

**安装方法**：

- **Windows**: `winget install -e --id ImageMagick.ImageMagick`
- **macOS**: `brew install imagemagick`
- **Linux**: `sudo apt install imagemagick` 或 `sudo yum install imagemagick`

### 9. 检查Docker

**检测命令**：
```bash
docker --version
docker compose version
```

**安装方法**：

- **Windows**: 下载Docker Desktop - https://www.docker.com/products/docker-desktop/
- **macOS**: `brew install --cask docker` 或下载Docker Desktop
- **Linux**:
  ```bash
  # Ubuntu/Debian
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  # 添加当前用户到docker组
  sudo usermod -aG docker $USER
  ```

## 自动化检查脚本

创建一个完整的环境检查报告：

```bash
#!/bin/bash

echo "=== 环境检查报告 ==="
echo ""

# 操作系统
echo "操作系统:"
uname -a
echo ""

# Python
echo "1. Python:"
if command -v python &> /dev/null || command -v python3 &> /dev/null; then
    python --version 2>&1 || python3 --version 2>&1
    pip --version 2>&1 || pip3 --version 2>&1
else
    echo "   ❌ 未安装"
fi
echo ""

# Node.js
echo "2. Node.js:"
if command -v node &> /dev/null; then
    node -v
    npm -v
else
    echo "   ❌ 未安装"
fi
echo ""

# Git
echo "3. Git:"
if command -v git &> /dev/null; then
    git --version
else
    echo "   ❌ 未安装"
fi
echo ""

# curl
echo "4. curl:"
if command -v curl &> /dev/null; then
    curl --version | head -1
else
    echo "   ❌ 未安装"
fi
echo ""

# jq
echo "5. jq:"
if command -v jq &> /dev/null; then
    jq --version
else
    echo "   ❌ 未安装"
fi
echo ""

# ffmpeg
echo "6. ffmpeg:"
if command -v ffmpeg &> /dev/null; then
    ffmpeg -version | head -1
else
    echo "   ❌ 未安装"
fi
echo ""

# imagemagick
echo "7. ImageMagick:"
if command -v convert &> /dev/null; then
    convert -version | head -1
else
    echo "   ❌ 未安装"
fi
echo ""

# docker
echo "8. Docker:"
if command -v docker &> /dev/null; then
    docker --version
    docker compose version 2>&1 || echo "   Docker Compose未安装"
else
    echo "   ❌ 未安装"
fi
echo ""

echo "=== 检查完成 ==="
```

## 使用示例

### 场景1：检查单个环境

```
用户：检查一下我的Python环境
AI：运行环境检查，发现Python未安装
    → 识别操作系统为Windows
    → 提供winget安装命令
    → 提供手动安装链接
```

### 场景2：批量环境检查

```
用户：我要用wechat2md这个skill，帮我检查需要什么环境
AI：读取skill的SKILL.md → 发现需要Python和pip
    → 检查Python环境
    → 检查pip
    → 检查requests、beautifulsoup4、html2text依赖
    → 给出缺失项的安装指导
```

### 场景3：环境问题诊断

```
用户：执行skill时报错"command not found: python"
AI：识别为Python未安装
    → 检测操作系统
    → 提供对应的安装方法
    → 安装后验证
```

## 常见问题处理

### Python相关

**问题1：python命令找不到，但python3存在**
```bash
# Linux/macOS创建软链接
sudo ln -s $(which python3) /usr/local/bin/python

# Windows添加别名（PowerShell）
Set-Alias python python3
```

**问题2：pip安装报权限错误**
```bash
# 使用用户安装（推荐）
pip install --user <package>

# 或使用虚拟环境
python -m venv myenv
source myenv/bin/activate  # Linux/macOS
myenv\Scripts\activate     # Windows
```

**问题3：pip版本过旧**
```bash
python -m pip install --upgrade pip
```

### Node.js相关

**问题1：npm安装全局包需要sudo**
```bash
# 修改npm全局安装目录
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

**问题2：node版本管理**
```bash
# 使用nvm管理多个Node版本
nvm install 18
nvm use 18
nvm alias default 18
```

### 其他工具

**问题：Windows下某些命令不可用**
```bash
# 安装Git Bash或WSL（Windows Subsystem for Linux）
# Git Bash：https://git-scm.com/download/win
# WSL：wsl --install
```

## 最佳实践

1. **优先使用包管理器**：winget、brew、apt等，便于后续更新
2. **使用虚拟环境**：Python用venv，Node.js用nvm，避免全局污染
3. **定期更新**：保持工具为最新稳定版
4. **记录版本**：在项目中记录依赖的版本（requirements.txt、package.json）
5. **容器化**：复杂环境考虑使用Docker

## 维护信息

- **创建时间**：2026-01-25
- **维护者**：Claude Code
- **适用平台**：Windows、macOS、Linux
- **更新频率**：根据工具版本更新而更新
