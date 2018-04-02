给 “rm” 命令添加个“垃圾桶”
============

人类犯错误是因为我们不是一个可编程设备，所以，在使用 `rm` 命令时要额外注意，不要在任何时候使用 `rm -rf *`。当你使用 `rm` 命令时，它会永久删除文件，不会像文件管理器那样将这些文件移动到 “垃圾箱”。

有时我们会将不应该删除的文件删除掉，所以当错误地删除了文件时该怎么办？ 你必须看看恢复工具（Linux 中有很多数据恢复工具），但我们不知道是否能将它百分之百恢复，所以要如何解决这个问题？

我们最近发表了一篇关于 [Trash-Cli][1] 的文章，在评论部分，我们从用户 Eemil Lgz 那里获得了一个关于 [saferm.sh][2] 脚本的更新，它可以帮助我们将文件移动到“垃圾箱”而不是永久删除它们。

将文件移动到“垃圾桶”是一个好主意，当你无意中运行 `rm` 命令时，可以拯救你；但是很少有人会说这是一个坏习惯，如果你不注意“垃圾桶”，它可能会在一定的时间内被文件和文件夹堆积起来。在这种情况下，我建议你按照你的意愿去做一个定时任务。

这适用于服务器和桌面两种环境。 如果脚本检测到 GNOME 、KDE、Unity 或 LXDE 桌面环境（DE），则它将文件或文件夹安全地移动到默认垃圾箱 `$HOME/.local/share/Trash/files`，否则会在您的主目录中创建垃圾箱文件夹 `$HOME/Trash`。

`saferm.sh` 脚本托管在 Github 中，可以从仓库中克隆，也可以创建一个名为 `saferm.sh` 的文件并复制其上的代码。

```
$ git clone https://github.com/lagerspetz/linux-stuff
$ sudo mv linux-stuff/scripts/saferm.sh /bin
$ rm -Rf linux-stuff
```

在 `.bashrc` 文件中设置别名，

```
alias rm=saferm.sh
```

执行下面的命令使其生效，

```
$ source ~/.bashrc
```

一切就绪，现在你可以执行 `rm` 命令，自动将文件移动到”垃圾桶”，而不是永久删除它们。

测试一下，我们将删除一个名为 `magi.txt` 的文件，命令行明确的提醒了 `Moving magi.txt to $HOME/.local/share/Trash/file`。


```
$ rm -rf magi.txt
Moving magi.txt to /home/magi/.local/share/Trash/files
```

也可以通过 `ls` 命令或 `trash-cli` 进行验证。

```
$ ls -lh /home/magi/.local/share/Trash/files
Permissions Size User Date Modified Name
.rw-r--r-- 32 magi 11 Oct 16:24 magi.txt	
```

或者我们可以通过文件管理器界面中查看相同的内容。

![![][3]][4]

（LCTT 译注：原文此处混淆了部分 trash-cli 的内容，考虑到文章衔接和逻辑，此处略。）

要了解 `saferm.sh` 的其他选项，请查看帮助。

```
$ saferm.sh -h
This is saferm.sh 1.16. LXDE and Gnome3 detection.
Will ask to unsafe-delete instead of cross-fs move. Allows unsafe (regular rm) delete (ignores trashinfo).
Creates trash and trashinfo directories if they do not exist. Handles symbolic link deletion.
Does not complain about different user any more.

Usage: /path/to/saferm.sh [OPTIONS] [--] files and dirs to safely remove
OPTIONS:
-r      allows recursively removing directories.
-f      Allow deleting special files (devices, ...).
-u      Unsafe mode, bypass trash and delete files permanently.
-v      Verbose, prints more messages. Default in this version.
-q      Quiet mode. Opposite of verbose.

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/rm-command-to-move-files-to-trash-can-rm-alias/

作者：[2DAYGEEK][a]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://www.2daygeek.com/trash-cli-command-line-trashcan-linux-system/
[2]:https://github.com/lagerspetz/linux-stuff/blob/master/scripts/saferm.sh
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:https://www.2daygeek.com/wp-content/uploads/2017/10/rm-command-to-move-files-to-trash-can-rm-alias-1.png
