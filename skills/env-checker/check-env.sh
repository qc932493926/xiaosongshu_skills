#!/bin/bash

# 环境检查脚本
# 适用于Windows (Git Bash)、macOS、Linux

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检测操作系统
detect_os() {
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        OS="Windows"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macOS"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="Linux"
    else
        OS="Unknown"
    fi
}

# 检查命令是否存在
check_command() {
    local cmd=$1
    local name=$2
    local alt_cmd=$3

    echo -n "检查 $name... "

    # 特殊处理Python（Windows可能有权限问题）
    if [[ "$cmd" == "python" ]] && [[ "$OS" == "Windows" ]]; then
        if powershell -Command "python --version" &> /dev/null; then
            echo -e "${GREEN}✓${NC} 已安装"
            powershell -Command "python --version" 2>&1
            return 0
        elif command -v python3 &> /dev/null; then
            echo -e "${GREEN}✓${NC} 已安装 (python3)"
            python3 --version 2>&1
            return 0
        else
            echo -e "${RED}✗${NC} 未安装"
            return 1
        fi
    fi

    if command -v $cmd &> /dev/null; then
        echo -e "${GREEN}✓${NC} 已安装"
        $cmd --version 2>&1 | head -1 | iconv -f GBK -t UTF-8 2>/dev/null || $cmd --version 2>&1 | head -1
        return 0
    elif [[ -n "$alt_cmd" ]] && command -v $alt_cmd &> /dev/null; then
        echo -e "${GREEN}✓${NC} 已安装"
        $alt_cmd --version 2>&1 | head -1 | iconv -f GBK -t UTF-8 2>/dev/null || $alt_cmd --version 2>&1 | head -1
        return 0
    else
        echo -e "${RED}✗${NC} 未安装"
        return 1
    fi
}

# 提供安装建议
suggest_install() {
    local tool=$1
    local os=$2

    echo -e "${YELLOW}安装建议:${NC}"

    case $tool in
        "python")
            case $os in
                "Windows")
                    echo "  winget install -e --id Python.Python.3.12"
                    echo "  或访问: https://www.python.org/downloads/"
                    ;;
                "macOS")
                    echo "  brew install python@3.12"
                    ;;
                "Linux")
                    echo "  sudo apt install python3 python3-pip python3-venv"
                    ;;
            esac
            ;;
        "node")
            case $os in
                "Windows")
                    echo "  winget install -e --id OpenJS.NodeJS"
                    echo "  或访问: https://nodejs.org/"
                    ;;
                "macOS")
                    echo "  brew install node"
                    ;;
                "Linux")
                    echo "  sudo apt install nodejs npm"
                    ;;
            esac
            ;;
        "git")
            case $os in
                "Windows")
                    echo "  winget install -e --id Git.Git"
                    ;;
                "macOS")
                    echo "  brew install git"
                    ;;
                "Linux")
                    echo "  sudo apt install git"
                    ;;
            esac
            ;;
        "jq")
            case $os in
                "Windows")
                    echo "  winget install -e --id stedolan.jq"
                    ;;
                "macOS")
                    echo "  brew install jq"
                    ;;
                "Linux")
                    echo "  sudo apt install jq"
                    ;;
            esac
            ;;
        "ffmpeg")
            case $os in
                "Windows")
                    echo "  winget install -e --id Gyan.FFmpeg"
                    ;;
                "macOS")
                    echo "  brew install ffmpeg"
                    ;;
                "Linux")
                    echo "  sudo apt install ffmpeg"
                    ;;
            esac
            ;;
        "docker")
            case $os in
                "Windows"|"macOS")
                    echo "  下载Docker Desktop:"
                    echo "  https://www.docker.com/products/docker-desktop/"
                    ;;
                "Linux")
                    echo "  curl -fsSL https://get.docker.com -o get-docker.sh"
                    echo "  sudo sh get-docker.sh"
                    ;;
            esac
            ;;
    esac
    echo ""
}

# 主函数
main() {
    echo "======================================"
    echo "     环境检查工具 v1.0"
    echo "======================================"
    echo ""

    # 检测操作系统
    detect_os
    echo "操作系统: $OS"
    echo ""

    echo "====== 核心运行时 ======"
    echo ""

    # Python
    if ! check_command "python" "Python" "python3"; then
        suggest_install "python" "$OS"
    fi
    echo ""

    # Node.js
    if ! check_command "node" "Node.js"; then
        suggest_install "node" "$OS"
    else
        echo -n "  npm: "
        npm -v 2>&1
    fi
    echo ""

    # Git
    if ! check_command "git" "Git"; then
        suggest_install "git" "$OS"
    fi
    echo ""

    echo "====== 常用工具 ======"
    echo ""

    # curl
    check_command "curl" "curl"
    echo ""

    # jq
    if ! check_command "jq" "jq (JSON处理)"; then
        suggest_install "jq" "$OS"
    fi
    echo ""

    # ffmpeg
    if ! check_command "ffmpeg" "ffmpeg (音视频)"; then
        suggest_install "ffmpeg" "$OS"
    fi
    echo ""

    # imagemagick
    check_command "convert" "ImageMagick (图像处理)"
    echo ""

    # docker
    if ! check_command "docker" "Docker"; then
        suggest_install "docker" "$OS"
    fi
    echo ""

    echo "======================================"
    echo "检查完成！"
    echo "======================================"
}

# 运行主函数
main
