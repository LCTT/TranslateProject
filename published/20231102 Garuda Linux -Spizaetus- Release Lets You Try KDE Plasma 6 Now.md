[#]: subject: "Garuda Linux “Spizaetus” Release Lets You Try KDE Plasma 6 Now!"
[#]: via: "https://news.itsfoss.com/garuda-linux-spizaetus-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16347-1.html"

Garuda Linux “Spizaetus” 发布，可以体验 KDE Plasma 6 了！
======

![][0]

> Garuda Linux 的最新升级带来了一些引人入胜的变化，以及一个全新的 ISO 版本。

Garuda Linux，作为一款 [用户友好且基于 Arch Linux 的发行版][1]，由于其可高度定制和可扩展性，近期已经吸引了大批用户。

Garuda Linux 提供了众多选项以满足不同的使用场景，无论是编程还是游戏。

目前，Garuda Linux 的最新发布版，**Garuda Linux “Spizaetus”** 现已可用。

下面，让我来引导你了解一下这个版本。

### 🆕 Garuda Linux “Spizaetus”：有哪些新变化？

![][2]

这个版本的代号“[Spizaetus][3]” 是来源于一种通常在美洲热带地区发现的鹰鹞。此次发布的**主要亮点**包括：

  * 提供 Hyprland ISO
  * Ugrep 取代了 Grep  
  * 提供了实验性的 KDE Plasma 6 仓库

#### 提供 Hyprland ISO

![][5]

在这个 Garuda Linux 的版本中，推出了带有 [Hyprland][6] 动态平铺 Wayland 组合器的新 ISO，这让**流畅的动画**和**轻松的窗口平铺**成为可能。

在此，开发者之一的 **dr460nf1r3** 表示：

> 关注精美的界面和模糊的窗口，Hyprland 无疑是 Garuda 的完美搭配。

> 🚧 然而，不幸的是，他们**不得不停止一些其它变体的更新**，因为这些变体并未得到妥善维护。受影响的变体包括：**MATE**、**LXQt-Kwin**、**KDE-git** 和 **Wayfire**。

#### Ugrep 取代了 Grep

[grep][7] 命令行工具已被性能更强的 [ugrep][8] 文件模式搜索器所取代，后者声称自己是“**超快速且用户友好的 Grep 替代品**”。

这是一个令人感兴趣的改变，我们期待看到用户的反馈。

#### 实验性的 KDE Plasma 6 仓库（请谨慎！）

开发者们还引入了一个名为 [chaotic-aur-kde][10] 的实验性仓库，以提供**早期版本的 Plasma 6**。

请注意，这是为那些想提前体验 Plasma 6 设计的用户而设，并**不建议将其用于生产环境**。
一位开发者补充道：

> 我们一直在努力通过特定的 chaotic-aur-kde 仓库，提供 Plasma 6 的早期构建。
> 
> 这可以让我们初步探索未来的 Plasma 6 将会是什么样子 - 它的首个版本计划在 2024 年 2 月发布。无需多说，这些都是来自主分支的实验性构建版，因此只适合喜欢接受挑战认的人去体验。

#### 🛠️ 其它的变化和改进

除了上述的亮点之外，还有些其他值得一提的细化调整：

  * **garuda-update 工具已更新** 用于处理近期由于包名称变更引发的冲突。
  * [Plymouth][11] **已被移除** ，现在在启动时，会显示终端的输出内容。
  * 对他们的**基础设施进行了各种更新**，以服务用户。
  * 为 Garuda Linux 安装了一个专用的 [Lemmy 实例][12]。

你可以查阅 [官方公告][13] 来获取更多详细信息。

### 📥 下载 Garuda Linux “Spizaetus”

Garuda Linux 提供了 **9 个不同的变体**，包括有 **KDE Plasma**、**GNOME**、**Xfce**、**Cinnamon**、**Sway** 等等选择。

你只需前往 [官方网站][15] ，就可以找到自己所需的镜像下载。

> **[Garuda Linux][15]**

💬 你会尝试这个新发布的版本吗？欢迎在评论中告知我们！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/garuda-linux-spizaetus-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/arch-based-linux-distros/
[2]: https://news.itsfoss.com/content/images/2023/11/Garuda_Linux_Spizaetus.png
[3]: https://en.wikipedia.org/wiki/Spizaetus
[4]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[5]: https://news.itsfoss.com/content/images/2023/11/Garuda_Linux_Spizaetus_Hyprland.png
[6]: https://hyprland.org/
[7]: https://en.wikipedia.org/wiki/Grep
[8]: https://ugrep.com/
[9]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[10]: https://forum.garudalinux.org/t/kde-6-repository-testing/31442
[11]: https://wiki.archlinux.org/title/plymouth
[12]: https://lemmy.garudalinux.org/
[13]: https://forum.garudalinux.org/t/garuda-linux-spizaetus-231029/31843
[14]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[15]: https://garudalinux.org/downloads
[0]: https://img.linux.net.cn/data/attachment/album/202311/03/225157jllf15lmeqehhhip.jpg