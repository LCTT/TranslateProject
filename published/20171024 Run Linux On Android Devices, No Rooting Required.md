无需 root 实现在 Android 设备上运行 Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2017/10/Termux-720x340.jpg)

曾经，我尝试过搜索一种简单的可以在 Android 上运行 Linux 的方法。我当时唯一的意图只是想使用 Linux 以及一些基本的应用程序，比如 SSH，Git，awk 等。要求的并不多！我不想 root 我的 Android 设备。我有一台平板电脑，主要用于阅读电子书、新闻和少数 Linux 博客。除此之外也不怎么用它了。因此我决定用它来实现一些 Linux 的功能。在 Google Play 商店上浏览了几分钟后，一个应用程序瞬间引起了我的注意，勾起了我实验的欲望。如果你也想在 Android 设备上运行 Linux，这个应用可能会有所帮助。

### Termux - 在 Android 和 Chrome OS 上运行的 Android 终端模拟器

**Termux** 是一个 Android 终端模拟器以及提供 Linux 环境的应用程序。跟许多其他应用程序不同，你无需 root 设备也无需进行设置。它是开箱即用的！它会自动安装好一个最基本的 Linux 系统，当然你也可以使用 APT 软件包管理器来安装其他软件包。总之，你可以让你的 Android 设备变成一台袖珍的 Linux 电脑。它不仅适用于 Android，你还能在 Chrome OS 上安装它。

![](http://www.ostechnix.com/wp-content/uploads/2017/10/termux.png)

Termux 提供了许多重要的功能，比您想象的要多。

  * 它允许你通过 openSSH 登录远程服务器。
  * 你还能够从远程系统 SSH 到 Android 设备中。
  * 使用 rsync 和 curl 将您的智能手机通讯录同步到远程系统。
  * 支持不同的 shell，比如 BASH、ZSH，以及 FISH 等等。
  * 可以选择不同的文本编辑器来编辑/查看文件，支持 Emacs、Nano 和 Vim。
  * 使用 APT 软件包管理器在 Android 设备上安装你想要的软件包。支持 Git、Perl、Python、Ruby 和 Node.js 的最新版本。
  * 可以将 Android 设备与蓝牙键盘、鼠标和外置显示器连接起来，就像是整合在一起的设备一样。Termux 支持键盘快捷键。
  * Termux 支持几乎所有 GNU/Linux 命令。

此外通过安装插件可以启用其他一些功能。例如，**Termux：API** 插件允许你访问 Android 和 Chrome 的硬件功能。其他有用的插件包括：

  * Termux：Boot - 设备启动时运行脚本
  * Termux：Float - 在浮动窗口中运行 Termux
  * Termux：Styling - 提供配色方案和支持 Powerline 的字体来定制 Termux 终端的外观。
  * Termux：Task - 提供一种从任务栏类的应用中调用 Termux 可执行文件的简易方法。
  * Termux：Widget - 提供一种从主屏幕启动小脚本的建议方法。

要了解更多有关 termux 的信息，请长按终端上的任意位置并选择“帮助”菜单选项来打开内置的帮助部分。它唯一的缺点就是**需要 Android 5.0 及更高版本**。如果它支持 Android 4.x 和旧版本的话，将会更有用的多。你可以在 **Google Play 商店**和 **F-Droid** 中找到并安装 Termux。

要在 Google Play 商店中安装 Termux，点击下面按钮。

[![][1]][2]

若要在 F-Droid 中安装，则点击下面按钮。

[![][5]][3]

你现在知道如何使用 Termux 在 Android 设备上使用 Linux 了。你有用过其他更好的应用吗？请在下面留言框中留言。我很乐意也去尝试他们！

此致敬礼！

相关资源：

+ [Termux 官网 ][4] 


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/termux-run-linux-android-devices-no-rooting-required/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/wp-content/uploads/2017/05/google-play-icon.png
[2]:https://play.google.com/store/apps/details?id=com.termux
[3]:https://f-droid.org/packages/com.termux/
[4]:https://termux.com/
[5]:https://www.ostechnix.com/wp-content/uploads/2017/10/F-droid-1.png