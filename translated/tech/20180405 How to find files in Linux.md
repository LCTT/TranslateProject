如何在 Linux 中查找文件
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)
如果你是 Windows 或 OSX 的非高级用户，那么可能使用 GUI 来查找文件。你也可能发现界面限制，令人沮丧，或者两者兼而有之，并学会组织文件并记住它们的确切顺序。你也可以在 Linux 中做到这一点 - 但你不必这样做。

Linux 的好处之一是它提供了多种方式来处理。你可以打开任何文件管理器或按下 `ctrl` +`f`，你也可以使用程序手动打开文件，或者你可以开始输入字母，它会过滤当前目录列表。

![Screenshot of how to find files in Linux with Ctrl+F][2]

使用 Ctrl+F 在 Linux 中查找文件的截图

但是如果你不知道你的文件在哪里，又不想搜索整个磁盘呢？对于这个以及其他各种情况，Linux 都很合适。

### 按命令名查找程序位置

如果你习惯随心所欲地放文件，Linux 文件系统看起来会让人望而生畏。对我而言，最难习惯的一件事是找到程序在哪里。

例如，`which bash`  通常会返回 `/bin/bash`，但是如果你下载了一个程序并且它没有出现在你的菜单中，`which` 命令可以是一个很好的工具。

一个类似的工具是 `locate` 命令，我发现它对于查找配置文件很有用。我不喜欢输入程序名称，因为像 `locate php` 这样的简单程序通常会提供很多需要进一步过滤的结果。

有关 `locate` 和 `which` 的更多信息，请参阅 `man` 页面：

  * `man which`
  * `man locate`



### Find

`find` 工具提供了更先进的功能。以下是我安装在许多服务器上的脚本示例，我用于确保特定模式的文件（也称为 glob）仅存在五天，并且所有早于该文件的文件都将被删除。 （自上次修改以来，十进制用于计算最多 240 分钟的差异）
```
find ./backup/core-files*.tar.gz -mtime +4.9 -exec rm {} \;

```

`find` 工具有许多高级用法，但最常见的是对结果执行命令，而不用链式地按照类型、创建日期、修改日期过滤文件。

find 的另一个有趣用处是找到所有有可执行权限的文件。这有助于确保没有人在你昂贵的服务器上安装比特币挖矿程序或僵尸网络。
```
find / -perm /+x

```

有关 `find` 的更多信息，请使用  `man find` 参考 `man` 页面。 

### Grep

想通过内容中查找文件？ Linux 已经实现了。你可以使用许多 Linux 工具来高效搜索符合模式的文件，但是 `grep` 是我经常使用的工具。

假设你有一个程序发布代码引用和堆栈跟踪的错误消息。你要在日志中找到这些。 grep 不总是最好的方法，但如果文件是一个给定的值，我经常使用 `grep -R`。

越来越多的 IDE 正在实现查找功能，但是如果你正在访问远程系统或出于任何原因没有 GUI，或者如果你想在当前目录递归查找，请使用：`grep -R {searchterm} ` 或在支持 `egrep` 别名的系统上，只需将 `-e` 标志添加到命令 `egrep -r {regex-pattern}`。

我在去年给 [Raspbian][3] 中的 `dhcpcd5` 打补丁时使用了这种技术，这样我就可以在[树莓派基金会][4]发布新的 Debian 时继续操作网络接入点了。

哪些提示可帮助你在 Linux 上更有效地搜索文件？

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/how-find-files-linux

作者：[Lewis Cowles][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/lewiscowles1986
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/find-files-in-linux-ctrlf.png?itok=1gf9kIut (Screenshot of how to find files in Linux with Ctrl+F)
[3]:https://www.raspbian.org/
[4]:https://www.raspberrypi.org/
