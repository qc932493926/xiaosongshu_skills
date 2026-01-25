---
name: wechat2md
description: 将微信公众号文章转换为 Markdown 格式。当用户提供微信公众号文章链接（mp.weixin.qq.com）并希望转换、下载、保存为 Markdown 时使用。触发词包括：转成 Markdown、转为 md、下载文章、保存为 Markdown、导出 Markdown、公众号转 Markdown、文章转换等。如果用户要求下载图片、保存图片、包含图片、图片本地化，则需要加 --save-images 参数。
---

# 微信公众号文章转 Markdown

将微信公众号文章转换为 Markdown 格式，保存到用户当前工作目录。

## 依赖

需要安装 Python 依赖：
```bash
pip3 install requests beautifulsoup4 html2text
```

## 使用方法

### 默认模式（保留原图链接）

```bash
python3 /Users/cloud/Documents/cc/.claude/skills/wechat2md/wechat2md.py "<文章链接>"
```

### 下载图片模式

当用户要求下载图片、保存图片、包含图片、图片本地化时，加 `--save-images` 参数：

```bash
python3 /Users/cloud/Documents/cc/.claude/skills/wechat2md/wechat2md.py "<文章链接>" --save-images
```

## 执行流程

1. 确认用户提供的是微信公众号文章链接（包含 `mp.weixin.qq.com`）
2. 判断用户是否要求下载图片
3. 执行脚本，将文章转换为 Markdown
4. 完成后告诉用户输出文件的完整路径

## 输出

### 默认模式
- 输出：`{当前目录}/{文章标题}.md`
- 图片：保留微信原链接

### 下载图片模式
- 输出目录：`{当前目录}/{文章标题}/`
- 文件结构：
  ```
  {文章标题}/
  ├── {文章标题}.md
  └── images/
      ├── image_01.png
      ├── image_02.png
      └── ...
  ```

## 示例

用户输入（默认模式）：
- "把这个公众号文章转成 Markdown：https://mp.weixin.qq.com/s/xxx"
- "下载这篇文章为 md 格式 https://mp.weixin.qq.com/s/xxx"
- "https://mp.weixin.qq.com/s/xxx 保存为 Markdown"

用户输入（下载图片模式）：
- "把这个文章转成 Markdown，图片也下载下来：https://mp.weixin.qq.com/s/xxx"
- "https://mp.weixin.qq.com/s/xxx 转 md，保存图片"
- "导出这篇文章，包含图片 https://mp.weixin.qq.com/s/xxx"
