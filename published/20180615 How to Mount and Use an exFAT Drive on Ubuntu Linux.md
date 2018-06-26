如何在 Ubuntu Linux 上挂载和使用 exFAT 驱动器
======

> 简介：本教程将向你展示如何在 Ubuntu 和其他基于 Ubuntu 的 Linux 发行版上启用 exFAT 文件系统支持。用此种方法在系统上挂载 exFAT 驱动器时，你将不会看到错误消息。

### 在 Ubuntu 上挂载 exFAT 磁盘时出现问题

有一天，我试图使用以 exFAT 格式化 的 U 盘，其中包含约为 10GB 大小的文件。只要我插入 U 盘，我的 Ubuntu 16.04 就会抛出一个错误说**无法挂载未知的文件系统类型 ‘exfat’**。

![Fix exfat drive mount error on Ubuntu Linux][1]

确切的错误信息是这样的：

```
Error mounting /dev/sdb1 at /media/abhishek/SHADI DATA: Command-line `mount -t "exfat" -o "uhelper=udisks2,nodev,nosuid,uid=1001,gid=1001,iocharset=utf8,namecase=0,errors=remount-ro,umask=0077" "/dev/sdb1" "/media/abhishek/SHADI DATA"` exited with non-zero exit status 32: mount: unknown filesystem type 'exfat'
```

### exFAT 挂载错误的原因

微软最喜欢的 [FAT 文件系统][2]仅限于最大 4GB 的文件。你不能将大于 4GB 的文件传输到 FAT 驱动器。为了克服 FAT 文件系统的限制，微软在 2006 年推出了 [exFAT][3] 文件系统。

由于大多数微软相关的东西都是专有的，exFAT 文件格式也不例外。Ubuntu 和许多其他 Linux 发行版默认不提供专有的 exFAT 文件支持。这就是你看到 exFAT 文件出现挂载错误的原因。

### 如何在 Ubuntu Linux 上挂载 exFAT 驱动器

![Fix exFAT mount error on Ubuntu Linux][4]

解决这个问题很简单。你只需启用 exFAT 支持即可。

我将展示在 Ubuntu 中的命令，但这应该适用于其他基于 Ubuntu 的发行版，例如 [Linux Mint][5]、elementary OS 等。

打开终端（Ubuntu 中 `Ctrl+Alt+T` 快捷键）并使用以下命令：

```
sudo apt install exfat-fuse exfat-utils
```

安装完这些软件包后，进入文件管理器并再次点击 U 盘来挂载它。无需重新插入 USB。它应该能直接挂载。

#### 这对你有帮助么

我希望这个提示可以帮助你修复 Linux 发行版的 exFAT 的挂载错误。如果你有任何其他问题、建议或感谢，请在评论中留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/mount-exfat/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/exfat-mount-error-linux.jpeg
[2]:http://www.ntfs.com/fat-systems.htm
[3]:https://en.wikipedia.org/wiki/ExFAT
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/exfat-mount-error-featured-800x450.jpeg
[5]:https://linuxmint.com/
