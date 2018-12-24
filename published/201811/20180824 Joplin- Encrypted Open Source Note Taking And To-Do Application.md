Joplin：开源加密笔记及待办事项应用
======

> [Joplin][1] 是一个自由开源的笔记和待办事项应用，可用于 Linux、Windows、macOS、Android 和 iOS。它的主要功能包括端到端加密，Markdown 支持以及通过 NextCloud、Dropbox、OneDrive 或 WebDAV 等第三方服务进行同步。

![](https://1.bp.blogspot.com/-vLLYx1Pfmb0/W3_wq_B0avI/AAAAAAAABb8/B9pe5NXVzg83A6Lm6_0ORMe9aWqtfTn4gCLcBGAs/s640/joplin-notes.png)

在 Joplin 中你可以用 Markdown 格式（支持数学符号和复选框）记笔记，桌面程序有 3 种视图：Markdown 代码、Markdown 预览或两者并排。你可以在笔记中添加附件（使用图像预览）或在外部 Markdown 编辑器中编辑它们并在每次保存文件时自动在 Joplin 中更新它们。

这个应用应该可以很好地处理大量笔记，它允许你将笔记组织到笔记本中、添加标签和搜索。你还可以按更新日期、创建日期或标题对笔记进行排序。每个笔记本可以包含笔记、待办事项或两者，你可以轻松添加其他笔记的链接（在桌面应用中右键单击笔记并选择 “Copy Markdown link”，然后在笔记中添加链接）。

Joplin 中的待办事项支持警报，但在 Ubuntu 18.04 上，此功能我无法使用。

其他 Joplin 功能包括：

  * Firefox 和 Chrome 中可选的 Web Clipper 扩展（在 Joplin 桌面应用中进入 “Tools > Web clipper options” 以启用剪切服务并找到 Chrome/Firefox 扩展程序的下载链接），它可以剪切简单或完整的页面、剪切选中的区域或者截图。
  * 可选命令行客户端。
  * 导入 Enex 文件（Evernote 导出格式）和 Markdown 文件。
  * 导出 JEX 文件（Joplin 导出格式）、PDF 和原始文件。
  * 离线优先，因此即使没有互联网连接，所有数据也始终可在设备上查看。
  * 地理位置支持。

[![Joplin notes checkboxes link to other note][2]][3] 

*Joplin 带有显示复选框和指向另一个笔记链接的隐藏侧边栏*

虽然它没有提供与 Evernote 一样多的功能，但 Joplin 是一个强大的开源 Evernote 替代品。Joplin 包含所有基本功能，除了它是开源软件之外，它还包括加密支持，你还可以选择用于同步的服务。

该应用实际上被设计为 Evernote 替代品，因此它可以导入完整的 Evernote 笔记本、笔记、标签、附件和笔记元数据，如作者、创建和更新时间或地理位置。

Joplin 开发重点关注的另一个方面是避免与特定公司或服务挂钩。这就是为什么该应用提供多种同步方案，如 NextCloud、Dropbox、oneDrive 和 WebDav，同时也容易支持新的服务。如果你改变主意，也很容易从一种服务切换到另一种服务。

我注意到 Joplin 默认情况下不使用加密，你必须在设置中启用此功能。进入 “Tools> Encryption options” 并在这里启用 Joplin 端到端加密。

### 下载 Joplin

- [下载 Joplin][7]

Joplin 适用于 Linux、Windows、macOS、Android 和 iOS。在 Linux 上，还有 AppImage 和 Aur 包。

要在 Linux 上运行 Joplin AppImage，请双击它并选择 “Make executable and run”（如果文件管理器支持这个）。如果不支持，你需要使用你的文件管理器使它可执行（应该类似这样：“右键单击>属性>权限>允许作为程序执行”，但这可能会因你使用的文件管理器而有所不同），或者从命令行：

```
chmod +x /path/to/Joplin-*-x86_64.AppImage
```

用你下载 Joplin 的路径替换 `/path/to/`。现在，你可以双击 Joplin Appimage 文件来启动它。

提示：如果你将 Joplin 集成到你的菜单中，而它的图标没有显示在你 dock 或应用切换器中，你可以打开 Joplin 的桌面文件（如果你使用 appimagekit 集成，它应该在 `~/.local/share/applications/appimagekit-joplin.desktop`）并在文件末尾添加 `StartupWMClass=Joplin` 其他不变来修复。

Joplin 有一个命令行客户端，它可以[使用 npm 安装][5]（对于 Debian、Ubuntu 或 Linux Mint，请参阅[如何安装和配置 Node.js 和 npm][6]）。

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/joplin-encrypted-open-source-note.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://joplin.cozic.net/
[2]:https://3.bp.blogspot.com/-y9JKL1F89Vo/W3_0dkZjzQI/AAAAAAAABcI/hQI7GAx6i_sMcel4mF0x4uxBrMO88O59wCLcBGAs/s640/joplin-notes-markdown.png (Joplin notes checkboxes link to other note)
[3]:https://3.bp.blogspot.com/-y9JKL1F89Vo/W3_0dkZjzQI/AAAAAAAABcI/hQI7GAx6i_sMcel4mF0x4uxBrMO88O59wCLcBGAs/s1600/joplin-notes-markdown.png
[4]:https://github.com/laurent22/joplin/issues/338
[5]:https://joplin.cozic.net/terminal/
[6]:https://www.linuxuprising.com/2018/04/how-to-install-and-configure-nodejs-and.html

[7]: https://joplin.cozic.net/#installation
