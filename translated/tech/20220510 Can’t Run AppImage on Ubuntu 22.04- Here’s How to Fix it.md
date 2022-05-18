[#]: subject: "Can’t Run AppImage on Ubuntu 22.04? Here’s How to Fix it"
[#]: via: "https://itsfoss.com/cant-run-appimage-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

无法在 Ubuntu 22.04 上运行 AppImage？这是解决方法
======

最近发布的 [Ubuntu 22.04 LTS 充满了新的视觉变化和功能][1]。

但与任何其他版本一样，它也存在一些错误和问题。

我在 Ubuntu 22.04 中遇到的令人不快的惊喜之一是 AppImage 应用。

即使拥有所有正确的权限，AppImage 应用也会拒绝在我新安装的 Ubuntu 22.04 系统中启动。

如果你遇到类似的情况，我有个好消息要告诉你。修复非常简单。

### 在 Ubuntu 22.04 LTS 中运行 AppImage 应用

这里的问题是 Ubuntu 22.04 缺少 [FUSE（用户空间中的文件系统）库][2]。FUSE 库为用户空间程序提供了一个接口，可以将虚拟文件系统导出到 Linux 内核。

这就是 [AppImage 在虚拟文件系统上的工作方式][3]。由于缺少这个关键库，AppImage 无法按预期工作。

现在你了解了问题的根本原因，让我们看看如何使其工作。

#### 第 1 步：安装 libfuse

在 Ubuntu 中打开终端并使用以下命令安装 FUSE 库支持：

```
sudo apt install libfuse2
```

如果你不熟悉终端，那么你需要了解以下内容。它会要求你输入 sudo 密码。实际上，那是你的帐户密码。 **当你输入密码时，屏幕上不会显示任何内容**。这是设计使然。只需继续输入密码并输入。

![Install libfuse2 in Ubuntu][4]

#### 第 2 步：确保 AppImage 文件具有正确的文件权限

这个不用说了。你需要对下载的应用的 AppImage 文件具有“执行”权限。

转到你已下载所需应用的 AppImage 文件的文件夹。**右键单击**并**选择属性**。

现在转到**权限选项卡**并选中“**允许将文件作为程序执行**”选项。

![give execute permission to AppImage file][5]

设置完成后就好了。现在只需双击该文件，它就会按预期运行应用。

获取 libfuse 的这个小步骤在我的[安装 Ubuntu 22.04 后推荐要做的事情列表][6]上了。

#### 进一步的故障排除提示

你的 AppImage 文件仍未运行？你下载的 AppImage 可能会出现一些其他问题，使其无法运行。

检查它的一种方法是下载一个已知的应用，如 [Balena Etcher][7] 并查看其 AppImage 文件是否有效。如果这个没问题，那么当你下载的另一个应用的 AppImage 文件无法工作。你可以通过从终端运行 AppImage 文件并分析它显示的错误来深入挖掘。

#### 对你有用吗？

继续尝试。如果有效，请给我写个谢谢。如果仍然没有，请在评论部分中提及详细信息，我会尽力帮助你。

--------------------------------------------------------------------------------

via: https://itsfoss.com/cant-run-appimage-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/ubuntu-22-04-release-features/
[2]: https://packages.debian.org/sid/libfuse2
[3]: https://itsfoss.com/use-appimage-linux/
[4]: https://itsfoss.com/wp-content/uploads/2022/05/install-libfuse2-ubuntu.png
[5]: https://itsfoss.com/wp-content/uploads/2022/05/give-execute-permission-to-appimage-file-800x415.png
[6]: https://itsfoss.com/things-to-do-after-installing-ubuntu-22-04/
[7]: https://www.balena.io/etcher/
