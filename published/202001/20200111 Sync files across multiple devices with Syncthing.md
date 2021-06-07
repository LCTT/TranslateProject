[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11793-1.html)
[#]: subject: (Sync files across multiple devices with Syncthing)
[#]: via: (https://opensource.com/article/20/1/sync-files-syncthing)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 Syncthing 在多个设备间同步文件
======

> 2020 年，在我们的 20 个使用开源提升生产力的系列文章中，首先了解如何使用 Syncthing 同步文件。

![](https://img.linux.net.cn/data/attachment/album/202001/18/123416rebvs7sjwm6c889y.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 Synthing 同步文件

设置新机器很麻烦。我们都有在机器之间复制的“标准设置”。多年来，我使用了很多方法来使它们在计算机之间同步。在过去（这会告诉你我年纪有多大了），曾经是软盘、然后是 Zip 磁盘、U 盘、SCP、Rsync、Dropbox、ownCloud，你想到的都试过。但这些似乎对我都不够好。

然后我偶然发现了 [Syncthing][2]。

![syncthing console][3]

Syncthing 是一个轻量级的点对点文件同步系统。你不需要为服务付费，也不需要第三方服务器，而且速度很快。以我的经验，比文件同步中的许多“大牌”要快得多。

Syncthing 可在 Linux、MacOS、Windows 和多种 BSD 中使用。还有一个 Android 应用（但尚无官方 iOS 版本）。以上所有终端都有方便的图形化前端（尽管我不会在这里介绍）。在 Linux 上，大多数发行版都有可用的软件包，因此安装非常简单。

![Installing Syncthing on Ubuntu][4]

首次启动 Syncthing 时，它将启动 Web 浏览器以配置守护程序。第一台计算机上没有太多要做，但是这是一个很好的机会来介绍一下用户界面 （UI）。最重要的是在右上方的 “Actions” 菜单下的 “System ID”。

![Machine ID][5]

设置第一台计算机后，请在第二台计算机上重复安装。在 UI 中，右下方将显示一个按钮，名为 “Add Remote Device”。单击该按钮，你将会看到一个要求输入 “Device ID and a Name” 的框。从第一台计算机上复制并粘贴 “Device ID”，然后单击 “Save”。

你应该会在第一台上看到一个请求添加第二台的弹出窗口。接受后，新机器将显示在第一台机器的右下角。与第二台计算机共享默认目录。单击 “Default Folder”，然后单击 “Edit” 按钮。弹出窗口的顶部有四个链接。单击 “Sharing”，然后选择第二台计算机。单击 “Save”，然后查看第二台计算机。你会看到一个接受共享目录的提示。接受后，它将开始在两台计算机之间同步文件。

![Sharing a directory in Syncthing][6]

测试从一台计算机上复制文件到默认目录（“/你的家目录/Share”）。它应该很快会在另一台上出现。

你可以根据需要添加任意数量的目录，这非常方便。如你在第一张图中所看到的，我有一个用于保存配置的 `myconfigs` 文件夹。当我买了一台新机器时，我只需安装 Syncthing，如果我在一台机器上调整了配置，我不必更新所有，它会自动更新。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/sync-files-syncthing

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://syncthing.net/
[3]: https://opensource.com/sites/default/files/uploads/productivity_1-1.png (syncthing console)
[4]: https://opensource.com/sites/default/files/uploads/productivity_1-2.png (Installing Syncthing on Ubuntu)
[5]: https://opensource.com/sites/default/files/uploads/productivity_1-3.png (Machine ID)
[6]: https://opensource.com/sites/default/files/uploads/productivity_1-4.png (Sharing a directory in Syncthing)
