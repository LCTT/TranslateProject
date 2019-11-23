[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11399-1.html)
[#]: subject: (Introduction to the Linux chgrp and newgrp commands)
[#]: via: (https://opensource.com/article/19/9/linux-chgrp-and-newgrp-commands)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

chgrp 和 newgrp 命令简介
======

> chgrp 和 newgrp 命令可帮助你管理需要维护组所有权的文件。

![](https://img.linux.net.cn/data/attachment/album/201909/28/155554aezllilzbedetm43.jpg)

在最近的一篇文章中，我介绍了 [chown][2] 命令，它用于修改系统上的文件所有权。回想一下，所有权是分配给一个对象的用户和组的组合。`chgrp` 和 `newgrp` 命令为管理需要维护组所有权的文件提供了帮助。

### 使用 chgrp

`chgrp` 只是更改文件的组所有权。这与 `chown :<group>` 命令相同。你可以使用：

```
$chown :alan mynotes
```

或者：

```
$chgrp alan mynotes
```

#### 递归

`chgrp` 和它的一些参数可以用在命令行和脚本中。就像许多其他 Linux 命令一样，`chgrp` 有一个递归参数 `-R`。如下所示，你需要它来对文件夹及其内容进行递归操作。我加了 `-v`（详细）参数，因此 `chgrp` 会告诉我它在做什么：


```
$ ls -l . conf
.:
drwxrwxr-x 2 alan alan 4096 Aug  5 15:33 conf

conf:
-rw-rw-r-- 1 alan alan 0 Aug  5 15:33 conf.xml
# chgrp -vR delta conf
changed group of 'conf/conf.xml' from alan to delta
changed group of 'conf' from alan to delta
```

#### 参考

当你要更改文件的组以匹配特定的配置，或者当你不知道具体的组时（比如你运行一个脚本时），可使用参考文件 （`--reference=RFILE`）。你可以复制另外一个作为参考的文件（RFILE）的组。比如，为了撤销上面的更改 （请注意，点 `.` 代表当前工作目录）：

```
$ chgrp -vR --reference=. conf
```

#### 报告更改

大多数命令都有用于控制其输出的参数。最常见的是 `-v` 来启用详细信息，而且 `chgrp` 命令也拥有详细模式。它还具有 `-c`（`--changes`）参数，指示 `chgrp` 仅在进行了更改时报告。`chgrp` 还会报告其他内容，例如是操作不被允许时。

参数 `-f`（`--silent`、`--quiet`）用于禁止显示大部分错误消息。我将在下一节中使用此参数和 `-c` 来显示实际更改。

#### 保持根目录

Linux 文件系统的根目录（`/`）应该受到高度重视。如果命令在此层级犯了一个错误，那么后果可能是可怕的，并会让系统无法使用。尤其是在运行一个会递归修改甚至删除的命令时。`chgrp` 命令有一个可用于保护和保持根目录的参数。它是 `--preserve-root`。如果在根目录中将此参数和递归一起使用，那么什么也不会发生，而是会出现一条消息：

```
[root@localhost /]# chgrp -cfR --preserve-root a+w /
chgrp: it is dangerous to operate recursively on '/'
chgrp: use --no-preserve-root to override this failsafe
```

不与递归（-R）结合使用时，该选项无效。但是，如果该命令由 `root` 用户运行，那么 `/` 的权限将会更改，但其下的其他文件或目录的权限则不会被更改：

```
[alan@localhost /]$ chgrp -c --preserve-root alan /
chgrp: changing group of '/': Operation not permitted
[root@localhost /]# chgrp -c --preserve-root alan /
changed group of '/' from root to alan
```

令人惊讶的是，它似乎不是默认参数。而选项 `--no-preserve-root` 是默认的。如果你在不带“保持”选项的情况下运行上述命令，那么它将默认为“无保持”模式，并可能会更改不应更改的文件的权限：

```
[alan@localhost /]$ chgrp -cfR alan /
changed group of '/dev/pts/0' from tty to alan
changed group of '/dev/tty2' from tty to alan
changed group of '/var/spool/mail/alan' from mail to alan
```

### 关于 newgrp

`newgrp` 命令允许用户覆盖当前的主要组。当你在所有文件必须有相同的组所有权的目录中操作时，`newgrp` 会很方便。假设你的内网服务器上有一个名为 `share` 的目录，不同的团队在其中存储市场活动照片。组名为 `share`。当不同的用户将文件放入目录时，文件的主要组可能会变得混乱。每当添加新文件时，你都可以运行 `chgrp`  将错乱的组纠正为 `share`：

```
$ cd share
ls -l
-rw-r--r--. 1 alan share 0 Aug  7 15:35 pic13
-rw-r--r--. 1 alan alan 0 Aug  7 15:35 pic1
-rw-r--r--. 1 susan delta 0 Aug  7 15:35 pic2
-rw-r--r--. 1 james gamma 0 Aug  7 15:35 pic3
-rw-rw-r--. 1 bill contract  0 Aug  7 15:36 pic4
```

我在 [chmod 命令][3]的文章中介绍了 `setgid` 模式。它是解决此问题的一种方法。但是，假设由于某种原因未设置 `setgid` 位。`newgrp` 命令在此时很有用。在任何用户将文件放入 `share` 目录之前，他们可以运行命令 `newgrp share`。这会将其主要组切换为 `share`，因此他们放入目录中的所有文件都将有 `share` 组，而不是用户自己的主要组。完成后，用户可以使用以下命令切换回常规主要组（举例）：

```
newgrp alan
```

### 总结

了解如何管理用户、组和权限非常重要。最好知道一些替代方法来解决可能遇到的问题，因为并非所有环境都以相同的方式设置。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/linux-chgrp-and-newgrp-commands

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdosshttps://opensource.com/users/sethhttps://opensource.com/users/alanfdosshttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A (Penguins walking on the beach )
[2]: https://opensource.com/article/19/8/linux-chown-command
[3]: https://opensource.com/article/19/8/linux-chmod-command
