[#]: subject: "Warp: An Open-Source Secure File Sharing App That Works Cross-Platform"
[#]: via: "https://news.itsfoss.com/warp-file-sharing/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16117-1.html"

Warp：一款可跨平台运行的开源安全文件共享应用
======

![][0]

> 在 Linux 和 Windows 之间安全共享文件的无缝方式？ 试试这个！

在我们撰写《[First Look][1]》系列文章的过程中，我们找到了一种在 Linux 和 Windows 系统之间传输文件的安全且高效的方法。

一个名为 “**Warp**” 的工具，它是 [GNOME Circle][2] 的一部分，其中包含扩展 GNOME 生态系统的应用。Warp 有助于通过互联网或本地网络无缝传输文件。

我们来看一下。

### Warp：概述 ⭐

![][3]

Warp 主要用 **Rust 编程语言** 编写，是一个**基于 GTK** 的文件传输应用，它使用 “[Magic Wormhole][4]” 协议使通过互联网/本地网络的文件传输成为可能。

所有文件传输均经过加密，接收者必须 **使用基于单词的传输码来访问文件**，以防止任何滥用。

**请允许我向你展示它是如何工作的。**

当你第一次启动该应用时，你会看到欢迎屏幕和关于 Warp 的简短介绍。

![][5]

继续后，你将进入 “<ruby>发送<rt>Send</rt></ruby>” 菜单，你可以在其中选择要发送的文件或文件夹。

> 📋 你还可以将文件和文件夹拖放到应用中。

![][6]

之后，屏幕上将显示文本和二维码形式的传输码。你必须将其安全地发送给接收者，他们才能开始下载文件。

> 📋 由于 Warp 是一个**跨平台应用**，你可以在 Linux 和 Windows 系统之间发送文件。

![][8]

**那么，接收方看起来怎么样？**

好吧，他们必须进入 “<ruby>接收<rt>Receive</rt></ruby>” 菜单并将传输码粘贴到文本框中。他们还可以扫描二维码，将准确的文本复制到他们的设备上。

![][9]

粘贴代码并单击 “<ruby>接收文件<rt>Receive File</rt></ruby>” 后，Warp 将开始连接到发送者的设备。

![][10]

如果成功，将会显示 “<ruby>已连接到对等点<rt>Connected to Peer</rt></ruby>” 状态。如果不是，则表明发送者或接收者的系统/网络出现问题。

![][11]

连接成功后，接收者可以选择 “<ruby>接受<rt>Accept</rt></ruby>” 将其保存到系统的“<ruby>下载<rt>Downlaods</rt></ruby>” 文件夹中，也可以选择 “<ruby>另存为<rt>Save As</rt></ruby>” 将其保存在他们选择的位置。

就是这样。文件传输完成后，接收方将显示以下页面：

![][13]

用户还可以进入菜单图标下的 “<ruby>首选项<rt>Preferences</rt></ruby>” 菜单来访问高级设置，例如设置 “<ruby>集合点/中转服务器 URL<rt>Rendezvous/Transit Server URL</rt></ruby>” 或将 “<ruby>传输码字数<rt>Code Word Count</rt></ruby>” 设置为更长的字数来增强安全性。

![][14]

这就是 Warp 的全部内容。**它简单且工作良好**。

### 📥 获取 Warp

Warp 可用于 **Linux** 和 **Windows**。你可以获取你选择的软件包或查看其 [GitLab 页面][16]上的源代码。

**对于 Linux 用户**，你可以从 [Flathub][17] 获取它。

> **[Warp (Flathub)][17]**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/warp-file-sharing/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/tag/first-look/
[2]: https://circle.gnome.org/
[3]: https://news.itsfoss.com/content/images/2023/06/Warp_X.jpg
[4]: https://github.com/magic-wormhole/magic-wormhole#magic-wormhole
[5]: https://news.itsfoss.com/content/images/2023/06/Warp_1.jpg
[6]: https://news.itsfoss.com/content/images/2023/06/Warp_2.jpg
[7]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[8]: https://news.itsfoss.com/content/images/2023/06/Warp_3.jpg
[9]: https://news.itsfoss.com/content/images/2023/06/Warp_4-1.jpg
[10]: https://news.itsfoss.com/content/images/2023/06/Warp_5.jpg
[11]: https://news.itsfoss.com/content/images/2023/06/Warp_6.jpg
[12]: https://news.itsfoss.com/content/images/2023/06/Warp_7.jpg
[13]: https://news.itsfoss.com/content/images/2023/06/Warp_8.jpg
[14]: https://news.itsfoss.com/content/images/2023/06/Warp_9.jpg
[15]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[16]: https://gitlab.gnome.org/World/warp
[17]: https://flathub.org/apps/app.drey.Warp
[18]: https://linuxhandbook.com/tag/bash-beginner/
[19]: https://itsfoss.community/
[20]: https://itsfoss.com/newsletter/
[0]: https://news.itsfoss.com/content/images/size/w1304/2023/08/warp-first-look.png