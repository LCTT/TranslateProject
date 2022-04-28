[#]: subject: "Give Your Linux Mint and Xubuntu a Visual Uplift Using Twister UI"
[#]: via: "https://www.debugpoint.com/2022/02/twister-ui-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14494-1.html"

使用 Twister UI 提升你的 Linux Mint 和 Xubuntu 视觉感受
======

![](https://img.linux.net.cn/data/attachment/album/202204/21/172213ts2x6e1g4lwatv54.jpg)

> Twister UI 是给你的 Linux Mint 和 Xubuntu 提供视觉提升的最简单方法。以下是方法。

[Twister UI][1] 可以安装在已有的 Linux Mint 和 Xubuntu 系统上。Pi 实验室创造了这个用户界面，他们为树莓派和相关硬件开发了 [Twister OS][2]。

### Twister UI

Twister UI 是一套用于 [Linux Mint][3] 和 Xubuntu 的软件包集合，它带来了几个流行的操作系统特定的主题和配置，开箱即用。你只需点击一个按钮就可以应用它们，而不需要单独下载图标、主题或光标。

其最新版本提供了以下操作系统的开箱即用的桌面主题、图标、声音和其他设置变化。

  * 原生 Twister 操作系统主题
  * Windows 98、Windows 7、Windows XP
  * Windows 11、Windows 10
  * iTwister 和 iTwister Sur（类似 macOS）

#### 它是如何工作的？

该团队提供了自动脚本，从 GitHub 下载所有流行的操作系统特定的主题、声音等。然后该脚本修改它们，从 Ubuntu 仓库下载额外的包，并整体安装这个附加组件。安装程序自己负责安装一切，你需要做的就是等待。

在向你解释如何安装之前，让我们看看这个操作系统<ruby>增强模组<rt>MOD</rt></ruby>的一些截图和功能。这些截图来自应用了这个操作系统增强模组的 Linux Mint Xfce 版。

#### 它的外观（截图）

![Twister UI – macOS Theme][4]

![Twister UI – Windows XP Theme][5]

![native Twister OS theme][6]

#### Twister UI 软件包的内容

该软件包有它自己的设置应用，名为 ThemeTwister。你可以用它来快速切换主题。你可以随心所欲地在它们之间转换，而不会破坏什么。

该项目还默认安装了一些优秀的开源软件包。它安装了 Lutris、Steam 游戏平台以帮助你快速玩游戏。它还为用户安装了 Discord、Wine 模拟器。

正如你所看到的，考虑到这个附加组件的用户群，该团队仔细斟酌了要安装哪些软件包。

### 如何安装

如果你打算安装这个，我建议在 Linux Mint Xfce 版和 Xubuntu 中使用这个包。不要试图在其他 Linux 发行版中安装它（我在阅读文档之前就试过了，我把我的 Fedora 系统搞得一团糟，所以不要在其他发行版中尝试）。

其要求是安装在 Linux Mint Xfce 或 Xubuntu（无论是 32 位还是 64 位）。它还需要大约 5GB 的磁盘空间。

首先，从下面的链接中下载该软件包，其中包含 Torrent 链接。它不是一个 ISO 文件。它由三个文件组成，其中一个是实际的脚本。

> [下载 Twister UI][1]

下载完毕后，打开下载的文件夹，你应该看到一个扩展名为 `.run` 的文件（如下图所示）。

![Give the execute permission to the run file][7]

改变该文件的权限，使其可执行。然后通过终端运行它。

该脚本需要管理员密码，所以在要求时就提供这个密码。在你开始安装之前，请确保你有稳定的网络连接，以便随时下载其他软件包。

![Starting the installation script][8]

下载和安装需要一些时间。这取决于你的网速，可能需要 15 到 20 分钟左右。

你需要知道，该安装程序将取代默认的 Plymouth ，并会 [更新 initramfs][9]。

安装完成后，脚本应该会提示你重新启动。

重启后，登录到你的 Linux Mint Xfce 或 Xubuntu 系统。

### 如何改变主题

如果你使用的是 Linux Mint Xfce 版，在改变主题之前，你需要做以下额外的改变以获得最佳效果：

  * 打开“<ruby>应用程序菜单<rt>Application Menu</rt></rt></ruby> > <ruby>设置<rt>Settings</rt></ruby> > <ruby>桌面<rt>Desktop</rt></ruby>”，在“<ruby>图标<rt>Icon</rt></ruby>”标签下，取消勾选“<ruby>使用自定义字体大小<rt>Use custom font size</rt></ruby>”。
  * 打开“<ruby>应用程序菜单<rt>Application Menu</rt></rt></ruby> > <ruby>设置<rt>Settings</rt></ruby> > <ruby>窗口管理器调整<rt>Window Manager tweaks</rt></ruby>”，在“<ruby>合成器<rt>Compositor</rt></ruby>”标签下，取消勾选“<ruby>在停靠窗口下显示阴影<rt>Show shadows under dock windows</rt></ruby>”。

现在你应该在桌面上看到一个 “ThemeTwister” 图标，打开该应用。这个应用为你提供了改变主题的选项，如下图所示。

![Changing theme using ThemeTwister tool][10]

选择一个主题并点击相应的按钮。每次你改变或应用一个主题时，该脚本都会要求你注销。所以在改变主题之前，请确保你关闭所有的程序。

### 如何卸载

如果你完成后想卸载，那么打开终端，运行下面的 shell 脚本。

```
sh /usr/share/ThemeSwitcher/uninstall.sh
```

上述脚本只卸载了 Twister UI 组件，并没有卸载 Steam、Lutris 等。所以如果你想卸载，请使用软件管理器来卸载它们。

如果你在卸载后做一次重启，那是最好的。

### 评测和性能

根据 Pi 实验室的说明，该定制应该不会消耗太多的额外内存。这也是事实。

该定制对桌面性能影响不大。当我在 Linux Mint Xfce 版的空闲模式下运行一到两项定制时，它消耗了大约 740MB 的内存，CPU 大约 2% 到 3%。这本身就令人印象深刻。使用它的唯一代价是额外的磁盘空间。

![Resource Usage in Linux Mint with Twister UI][11]

主题切换器非常好，完美地改变了主题，没有意外和错误。

总的来说，整个过程是无痛的，按照其设计进行得很好。

### 总结

你可以下载单独的主题图标，改变设置，手动配置你的 Linux 发行版，使其看起来像 Windows 或 macOS。这需要很多时间，有时对新用户来说也很困难。考虑到这一点，我认为这种新方法可以节省时间，对每个人来说都非常容易。你只需点击一个按钮，就可以得到所有需要的增强模组。

总有一种争论，为什么 Linux 需要看起来像 Windows 或 macOS。但老年人可能不太熟悉电脑，不过他们记得 Windows 的颜色和图标。他们可以使用这种简单的修改来适应 Linux，而不会有任何麻烦。

总的来说，这是一个来自 Pi 实验室的优秀项目，可以帮助到全世界的许多用户。

那么，你对这个项目有什么看法？请在下面的评论栏里告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/twister-ui-2022/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://twisteros.com/twisterui.html
[2]: https://twisteros.com
[3]: https://www.debugpoint.com/2021/11/linux-mint-20-3-new-app/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/02/Twister-UI-macOS-Theme-1024x576.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/02/Twister-UI-Windows-XP-Theme-1024x574.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/native-Twister-OS-theme-1024x581.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/Give-the-execute-permission-to-the-run-file-1024x521.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/02/Starting-the-installation-script.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/02/Changing-theme-using-ThemeTwister-tool.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/02/Resource-Usage-in-Linux-Mint-with-Twister-UI-1024x579.jpg
[12]: https://t.me/debugpoint
[13]: https://twitter.com/DebugPoint
[14]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[15]: https://facebook.com/DebugPoint
