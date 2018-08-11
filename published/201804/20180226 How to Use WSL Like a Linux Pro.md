如何像 Linux 专家那样使用 WSL
============================================================

> 在本 WSL 教程中了解如何执行像挂载 USB 驱动器和操作文件等任务。

![WSL](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wsl-pro.png?itok=e65wEEAw "WSL")

在[之前的教程][4]中，我们学习了如何在 Windows 10 上设置 WSL。你可以在 Windows 10 中使用 WSL 执行许多 Linux 命令。无论是基于 Linux 的系统还是 macOS，它们的许多系统管理任务都是在终端内部完成的。然而，Windows 10 缺乏这样的功能。你想运行一个 cron 任务么？不行。你想 SSH 进入你的服务器，然后 `rsync` 文件么？没门。如何用强大的命令行工具管理本地文件，而不是使用缓慢和不可靠的 GUI 工具呢？

在本教程中，你将看到如何使用 WSL 执行除了管理之外的任务 —— 例如挂载 USB 驱动器和操作文件。你需要运行一个完全更新的 Windows 10 并选择一个 Linux 发行版。我在[上一篇文章][5]中介绍了这些步骤，所以如果你跟上进度，那就从那里开始。让我们开始吧。

### 保持你的 Linux 系统更新

事实上，当你通过 WSL 运行 Ubuntu 或 openSUSE 时，其底层并没有运行 Linux 内核。然而，你必须保持你的发行版完整更新，以保护你的系统免受任何新的已知漏洞的影响。由于在 Windows 应用商店中只有两个免费的社区发行版，所以教程将只覆盖以下两个：openSUSE 和 Ubuntu。

更新你的 Ubuntu 系统：

```
# sudo apt-get update
# sudo apt-get dist-upgrade
```

运行 openSUSE 的更新：

```
# zypper up
```

您还可以使用 `dup` 命令将 openSUSE 升级到最新版本。但在运行系统升级之前，请使用上一个命令运行更新。

```
# zypper dup
```

**注意：** openSUSE 默认为 root 用户。如果你想执行任何非管理员任务，请切换到非特权用户。您可以这篇[文章][6]中了解如何在 openSUSE上 创建用户。

### 管理本地文件

如果你想使用优秀的 Linux 命令行工具来管理本地文件，你可以使用 WSL 轻松完成此操作。不幸的是，WSL 还不支持像 `lsblk` 或 `mount` 这样的东西来挂载本地驱动器。但是，你可以 `cd` 到 C 盘并管理文件：

```
/mnt/c/Users/swapnil/Music
```

我现在在 C 盘的 Music 目录下。

要安装其他驱动器、分区和外部 USB 驱动器，你需要创建一个挂载点，然后挂载该驱动器。

打开文件资源管理器并检查该驱动器的挂载点。假设它在 Windows 中被挂载为 S:\。

在 Ubuntu/openSUSE 终端中，为驱动器创建一个挂载点。

```
sudo mkdir /mnt/s
```

现在挂载驱动器：

```
mount -f drvfs S: /mnt/s
```

挂载完毕后，你现在可以从发行版访问该驱动器。请记住，使用 WSL 方式运行的发行版将会看到 Windows 能看到的内容。因此，你无法挂载在 Windows 上无法原生挂载的 ext4 驱动器。

现在你可以在这里使用所有这些神奇的 Linux 命令。想要将文件从一个文件夹复制或移动到另一个文件夹？只需运行 `cp` 或 `mv` 命令。

```
cp /source-folder/source-file.txt /destination-folder/
cp /music/classical/Beethoven/symphony-2.mp3 /plex-media/music/classical/
```

如果你想移动文件夹或大文件，我会推荐 `rsync` 而不是 `cp` 命令：

```
rsync -avzP /music/classical/Beethoven/symphonies/ /plex-media/music/classical/
```

耶！

想要在 Windows 驱动器中创建新目录，只需使用 `mkdir` 命令。

想要在某个时间设置一个 cron 作业来自动执行任务吗？继续使用 `crontab -e` 创建一个 cron 作业。十分简单。

你还可以在 Linux 中挂载网络/远程文件夹，以便你可以使用更好的工具管理它们。我的所有驱动器都插在树莓派或者服务器上，因此我只需 `ssh` 进入该机器并管理硬盘。在本地计算机和远程系统之间传输文件可以再次使用 `rsync` 命令完成。

WSL 现在已经不再是测试版了，它将继续获得更多新功能。我很兴奋的两个特性是 `lsblk` 命令和 `dd` 命令，它们允许我在 Windows 中本机管理我的驱动器并创建可引导的 Linux 驱动器。如果你是 Linux 命令行的新手，[前一篇教程][7]将帮助你开始使用一些最基本的命令。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/how-use-wsl-linux-pro

作者：[SWAPNIL BHARTIYA][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://blogs.msdn.microsoft.com/commandline/learn-about-windows-console-and-windows-subsystem-for-linux-wsl/
[3]:https://www.linux.com/files/images/wsl-propng
[4]:https://linux.cn/article-9545-1.html
[5]:https://linux.cn/article-9545-1.html
[6]:https://linux.cn/article-9545-1.html
[7]:https://www.linux.com/learn/how-use-linux-command-line-basics-cli
