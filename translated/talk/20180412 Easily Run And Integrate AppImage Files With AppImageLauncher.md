使用 AppImageLauncher 轻松运行和集成 AppImage 文件
======
你有没有下载过 AppImage 文件，而你不知道如何使用它？或者你可能知道如何使用它，但是你每次要运行它时必须要进入到下载 .AppImage 的文件夹中，或者手动为其创建启动程序。

使用 AppImageLauncher，这些就都是过去的问题。该程序可让你**轻松运行 AppImage 文件，而无需使其可执行**。但它最有趣的特点是可以轻松地将 AppImage 与你的系统进行整合：**AppImageLauncher 可以自动将 AppImage 程序快捷方式添加到桌面环境的程序启动器/菜单（包括程序图标和合适的说明）中**。

在不手动下载 Kdenline AppImage 可执行文件的情况下，我第一次双击它（安装了 AppImageLauncher）时，AppImageLauncher 提供了两个选项：

`运行一次`或者`集成并运行`。

点击 Integrate 并运行，AppImage 被复制到 `~/.bin/` （家目录中的隐藏文件夹）并添加到菜单中，然后启动该程序。

**删除它也很简单**，只要您使用的桌面环境支持桌面动作就行。例如，在 Gnome Shell 中，只需**右键单击活动概览中的应用程序图标，然后选择**`从系统中删除`：

AppImageLauncher GitHub 页面显示，因为它与系统深度集成，该程序目前仅支持基于 Debian 的系统（这包括 Ubuntu 和 Linux Mint）。目前，该程序正处于频繁开发阶段，开发人员已经发了关于 RPM 包的问题，​​因此在不久的将来可能会添加 Fedora/openSUSE 支持。

### 下载 AppImageLauncher

AppImageLauncher 下载页提供 Debian、Ubuntu 或 Linux Mint（64位）的 64 位 AppImage 二进制文件。源码也有。

[下载 AppImageLauncher][1]


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/04/easily-run-and-integrate-appimage-files.html

作者：[Logix][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/TheAssassin/AppImageLauncher/releases
[2]:https://kdenlive.org/download/
