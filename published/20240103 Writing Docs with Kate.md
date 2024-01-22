[#]: subject: "Writing Docs with Kate"
[#]: via: "https://fedoramagazine.org/writing-docs-with-kate-and-git/"
[#]: author: "Hank Lee https://fedoramagazine.org/author/hankuoffroad/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16574-1.html"

使用 Kate 编写文档
======

![][0]

Kate（**K**DE **A**dvanced **T**ext **E**ditor）是一款自由开源的文本编辑器，适用于 Linux、Windows 和 macOS。

对于文档编写者来说，Kate 集成的 Git 功能可以帮助简化编写过程。你无需记住 Git 命令，也无需在每次更改文件或切换分支时在终端中输入它们。

本文重点为从事各种 Fedora 文档仓库的贡献者介绍 Kate 的主要功能。这些功能可以扩展到其他文档仓库。

### 将 Kate 与你的仓库一起使用的准备工作

   1. 将 SSH 密钥添加到 Pagure、GitLab 或 GitHub 上的帐户设置中。
        * 在 Pagure 上，转到 <ruby>我的设置<rt>My Settings</rt></ruby> – <ruby>SSH 密钥<rt>SSH Keys</rt></ruby> – <ruby>添加 SSH 密钥<rt>Add SSH Key</rt></ruby>
        * 在 GitLab 上，<ruby>首选项<rt>Preferences</rt></ruby> – <ruby>用户设置<rt>User Settings</rt></ruby> – <ruby>添加 SSH 密钥<rt>Add an SSH Key</rt></ruby>
        * 在 GitHub 上，<ruby>设置<rt>Settings</rt></ruby> – <ruby>SSH 和 GPG 密钥<rt>SSH and GPG keys</rt></ruby> – <ruby>新的 SSH 密钥<rt>New SSH key</rt></ruby>
   2. 复刻项目：转到上游仓库并选择 “<ruby>复刻<rt>Fork</rt></ruby>” 按钮
   3. 克隆仓库
        * 在你的分叉仓库中，选择 “<ruby>使用 SSH 克隆<rt>Clone with SSH</rt></ruby>”。
        * 接下来，将该链接复制到剪贴板并将其粘贴到终端中的 GIT URL 中。
        * 克隆仓库时，你可以指定新目录名称作为附加参数。`$ git clone <GIT URL> 新目录`
   4. 安装 Kate。如果你是 Linux 用户，请转到发行版的包管理器来安装 Kate。如果你使用 Fedora Linux，我们推荐 Fedora Linux RPM 版本或 Flatpak。

### 会话

Kate 文本编辑器中的会话功能可以将单独的项目分组在一起，并帮助你在单个视图中处理多个文档仓库。

要将仓库保存在会话中：

转到 “<ruby>文件<rt>File</rt></ruby>” 下拉菜单 – 选择 “<ruby>打开文件夹<rt>Open folder</rt></ruby>” – 选择克隆的目录。

从 “<ruby>会话<rt>Sessions</rt></ruby>” 下拉菜单中 – 选择 “<ruby>保存会话<rt>Save session</rt></ruby>” – 输入会话名称 – 按 “<ruby>确定<rt>OK</rt></ruby>”。

在左侧窗格中，单击 “<ruby>项目列表<rt>project list</rt></ruby>” 保存到新会话“Magazine”。下次打开 Kate 时，保存到会话中的克隆仓库将重新出现。

![Sessions Menu][4]

### 使用状态栏签出分支

使用 Kate 编辑器，你可以在状态栏和弹出屏幕上切换分支或创建新分支。

当前分支显示在状态栏的右下角。

要创建新分支，请选择 “Main” 分支。从弹出菜单中选择 “<ruby>创建新分支<rt>Create New Branch</rt></ruby>” 并输入新分支名称。

![Popup menu showing Create New branch][5]

### 对 AsciiDoc 高亮显示的内置支持

具有 AsciiDoc 扩展名的文件将使用 `asciidoc.xml` 中的规则自动高亮显示。你不需要安装外部插件。

### 即时拼写检查

如果你希望在输入时自动进行拼写检查，请按 `Ctrl + Shift + O`。此组合键将打开和关闭拼写检查。

### Git 工具视图

左侧窗格中的工具视图显示每个打开文件的 Git 状态。

![Show diff][6]

“<ruby>已暂存<rt>Staged</rt></ruby>” 表示文件已添加（与 Git 添加相同），并且如果你选择顶部的 “<ruby>提交<rt>Commit</rt></ruby>” 按钮，文件将被提交。

“<ruby>已修改<rt>Modified</rt></ruby>” 显示尚未暂存的更改。

单击左侧面板顶部的 “<ruby>提交<rt>Commit</rt></ruby>” 按钮以显示该提交的差异。这将在提交工具视图中打开选定的提交。如果你想查看提交中的所有更改，请右键单击并选择 “<ruby>显示完整提交<rt>Show Full Commit</rt></ruby>”，添加一个提交消息。

Git “<ruby>推送<rt>Push</rt></ruby>” 按钮在 “<ruby>提交<rt>Commit</rt></ruby>” 按钮的右边。Git “<ruby>拉取<rt>Pull</rt></ruby>” 按钮在 “<ruby>推送<rt>Push</rt></ruby>” 按钮的右边。

选择 “<ruby>刷新<rt>Refresh</rt></ruby>” 图标（圆圈箭头）以查看暂存文件和提交的情况。

### 集成终端

按 `F4` 或选择 “<ruby>终端<rt>Terminal</rt></ruby>” 按钮可打开和关闭集成终端。

你可以通过集成终端使用构建脚本和 Vale linter，将你的写作提升到一个新的水平，确保文档质量。

#### 步骤 1. 运行构建脚本

要在本地检查文档质量，你可以在集成终端中运行构建和预览脚本。构建和预览脚本可让你准确查看更改如何通过 Antora 静态站点生成器在文档页面中发布。

注意：检查 Fedora 文档仓库的 README 页面，为构建脚本和说明使用正确的文件名。下面是一个例子：

要构建和预览站点，请运行：

```
$ ./docsbuilder.sh -p
```

结果可访问 <http://localhost:8080>

要停止预览：

```
$ ./docsbuilder.sh -k
```

#### 步骤 2. 对你的文本运行 Vale

Vale 是一个命令行工具，用于检查文本是否符合定义的样式指南。参考该 [指南][7] 在本地运行 Vale。

### 鸣谢

非常感谢 KDE 开发人员 Nicco，他的视频教程频道 “[Nicco loves Linux][8]” 给了我很多灵感。

本文使用的 Kate 版本为 23.08.3

> **[上游文档][9]**

以下是本文使用的 Fedora 文档 Git 仓库：

- [快速文档][10]
- [Kinoite 用户文档][11]
- [IoT 用户文档][12]
- [文档贡献者指南][13]

*（题图：DA/519568d2-a224-4075-a751-a1a8bc702079）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/writing-docs-with-kate-and-git/

作者：[Hank Lee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hankuoffroad/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/12/writing_w_kate-816x345.jpg
[2]: https://unsplash.com/@olenichek?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/a-person-typing-on-a-laptop-on-a-desk-2w0IdiEI-hg?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://fedoramagazine.org/wp-content/uploads/2023/12/1-multirepo-1024x418.png
[5]: https://fedoramagazine.org/wp-content/uploads/2023/12/2-branch-1024x493.png
[6]: https://fedoramagazine.org/wp-content/uploads/2023/12/4-Show-diff-1024x313.png
[7]: https://docs.fedoraproject.org/en-US/fedora-docs/contributing-docs/tools-vale-linter/
[8]: https://www.youtube.com/c/Niccol%C3%B2Ve
[9]: https://docs.kde.org/stable5/en/kate/kate/index.html
[10]: https://pagure.io/fedora-docs/quick-docs.git
[11]: https://pagure.io/fedora-kde/kinoite-docs.git
[12]: https://github.com/fedora-iot/iot-docs.git
[13]: https://gitlab.com/fedora/docs/community-tools/documentation-contributors-guide.git
[0]: https://img.linux.net.cn/data/attachment/album/202401/22/100139stdtdd13ds13353c.jpg