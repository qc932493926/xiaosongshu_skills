# 小松鼠的 Claude Skills

> 精选的 Claude AI 技能集合，让你的 AI 助手更强大！

## 📚 技能列表

### 🔍 env-checker
**环境检查工具** - 自动检查并指导安装 Skills 所需的运行环境

**功能特性：**
- ✅ 自动检测操作系统（Windows/macOS/Linux）
- ✅ 检查 9 大常用环境和工具
- ✅ 提供针对不同系统的安装命令
- ✅ 彩色输出，清晰易读

**安装：**
```bash
npx add-skill qc932493926/xiaosongshu_skills --skill env-checker
```

**支持检查的环境：**
- Python、Node.js、Git
- curl、jq、ffmpeg、ImageMagick、Docker

---

### 📝 wechat2md
**微信公众号文章转 Markdown** - 将微信公众号文章转换为 Markdown 格式

**功能特性：**
- ✅ 保留文章格式和结构
- ✅ 支持图片下载（可选）
- ✅ 自动清理广告和无关内容

**安装：**
```bash
npx add-skill qc932493926/xiaosongshu_skills --skill wechat2md
```

**使用示例：**
```
将这篇微信文章转成 Markdown：https://mp.weixin.qq.com/s/xxxxx
```

---

### 🎨 wechat-theme-extractor
**微信文章样式提取器** - 从微信公众号文章中提取样式，生成主题配置

**功能特性：**
- ✅ AI 智能分析文章样式
- ✅ 提取颜色、字体、布局等设计元素
- ✅ 生成可复用的主题配置

**安装：**
```bash
npx add-skill qc932493926/xiaosongshu_skills --skill wechat-theme-extractor
```

---

## 🚀 快速开始

### 一键安装所有技能

```bash
npx add-skill qc932493926/xiaosongshu_skills -y
```

### 针对特定 AI 工具安装

```bash
# 安装到 Claude Code
npx add-skill qc932493926/xiaosongshu_skills -a claude-code

# 安装到 Trae
npx add-skill qc932493926/xiaosongshu_skills -a trae

# 安装到 Cursor
npx add-skill qc932493926/xiaosongshu_skills -a cursor
```

### 在 Claude Code 中安装

```bash
/plugin marketplace add qc932493926/xiaosongshu_skills
```

---

## 📖 使用指南

安装后，技能会自动加载。只需在对话中提到相关任务，AI 就会自动使用对应的技能。

**示例：**
```
检查一下我的 Python 环境
```

```
帮我把这篇微信文章转成 Markdown
```

```
分析这篇文章的样式设计
```

---

## 🛠️ 技能结构

每个技能包含：
- `SKILL.md` - 技能说明和指令
- `scripts/` - 辅助脚本（可选）
- `references/` - 参考文档（可选）

---

## 📦 兼容性

这些技能遵循 [Agent Skills 规范](https://agentskills.io/)，支持：

- ✅ Claude Code
- ✅ Trae
- ✅ OpenCode
- ✅ Cursor
- ✅ Cline
- ✅ 以及其他 25+ AI 编程工具

---

## 🤝 贡献

欢迎贡献新的技能或改进现有技能！

1. Fork 这个仓库
2. 创建你的技能分支 (`git checkout -b feature/new-skill`)
3. 提交你的更改 (`git commit -m 'Add: new skill'`)
4. 推送到分支 (`git push origin feature/new-skill`)
5. 创建 Pull Request

---

## 📄 许可证

MIT License - 自由使用和分享！

---

## 🔗 相关链接

- [Agent Skills 规范](https://agentskills.io/)
- [Claude Code 文档](https://code.claude.com/docs/en/skills)
- [Trae Skills 文档](https://docs.trae.ai/ide/skills)
- [skills.sh - 技能市场](https://skills.sh/)

---

## 💡 设计理念

> 不搞花里胡哨的各种外部软件来打击大家的积极性，尽量是国产环境，下载即用。

所有技能都遵循以下原则：
- 🎯 **简单直接** - 最小化依赖，开箱即用
- 🇨🇳 **本土化** - 优先支持国内环境和工具
- 📚 **文档完善** - 清晰的使用说明和示例
- 🔧 **实用为先** - 解决真实场景的实际问题

---

**作者：** 小松鼠
**联系：** 932493926@qq.com
**更新时间：** 2026-01-25
