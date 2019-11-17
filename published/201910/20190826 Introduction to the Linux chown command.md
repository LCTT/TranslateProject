[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11416-1.html)
[#]: subject: (Introduction to the Linux chown command)
[#]: via: (https://opensource.com/article/19/8/linux-chown-command)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

chown 命令简介
======

> 学习如何使用 chown 命令更改文件或目录的所有权。

![](https://img.linux.net.cn/data/attachment/album/201910/03/000014mfrxrxi5rej75mjs.jpg)

Linux 系统上的每个文件和目录均由某个人拥有，拥有者可以完全控制更改或删除他们拥有的文件。除了有一个*拥有用户*外，文件还有一个*拥有组*。

你可以使用 `ls -l` 命令查看文件的所有权：

```
[pablo@workstation Downloads]$ ls -l
total 2454732
-rw-r--r--. 1 pablo pablo 1934753792 Jul 25 18:49 Fedora-Workstation-Live-x86_64-30-1.2.iso
```

该输出的第三和第四列是拥有用户和组，它们一起称为*所有权*。上面的那个 ISO 文件这两者都是 `pablo`。

所有权设置由 [chmod 命令][2]进行设置，控制允许谁可以执行读取、写入或运行的操作。你可以使用 `chown` 命令更改所有权（一个或两者）。

所有权经常需要更改。文件和目录一直存在在系统中，但用户不断变来变去。当文件和目录在系统中移动时，或从一个系统移动到另一个系统时，所有权也可能需要更改。

我的主目录中的文件和目录的所有权是我的用户和我的主要组，以 `user:group` 的形式表示。假设 Susan 正在管理 Delta 组，该组需要编辑一个名为 `mynotes` 的文件。你可以使用 `chown` 命令将该文件的用户更改为 `susan`，组更改为 `delta`：

```
$ chown susan:delta mynotes
ls -l
-rw-rw-r--. 1 susan delta 0 Aug  1 12:04 mynotes
```

当给该文件设置好了 Delta 组时，它可以分配回给我：

```
$ chown alan mynotes
$ ls -l mynotes
-rw-rw-r--. 1 alan delta 0 Aug  1 12:04 mynotes
```

给用户后添加冒号（`:`），可以将用户和组都分配回给我：

```
$ chown alan: mynotes
$ ls -l mynotes
-rw-rw-r--. 1 alan alan 0 Aug  1 12:04 mynotes
```

通过在组前面加一个冒号，可以只更改组。现在，`gamma` 组的成员可以编辑该文件：

```
$ chown :gamma mynotes
$ ls -l
-rw-rw-r--. 1 alan gamma 0 Aug  1 12:04 mynotes
```

`chown` 的一些附加参数都能用在命令行和脚本中。就像许多其他 Linux 命令一样，`chown` 有一个递归参数（`-R`），它告诉该命令进入目录以对其中的所有文件进行操作。没有 `-R` 标志，你就只能更改文件夹的权限，而不会更改其中的文件。在此示例中，假定目的是更改目录及其所有内容的权限。这里我添加了 `-v`（详细）参数，以便 `chown` 报告其工作情况：

```
$ ls -l . conf
.:
drwxrwxr-x 2 alan alan 4096 Aug  5 15:33 conf

conf:
-rw-rw-r-- 1 alan alan 0 Aug  5 15:33 conf.xml

$ chown -vR susan:delta conf
changed ownership of 'conf/conf.xml' from alan:alan to  susan:delta
changed ownership of 'conf' from alan:alan to  susan:delta
```

根据你的角色，你可能需要使用 `sudo` 来更改文件的所有权。

在更改文件的所有权以匹配特定配置时，或者在你不知道所有权时（例如运行脚本时），可以使用参考文件（`--reference=RFILE`）。例如，你可以复制另一个文件（`RFILE`，称为参考文件）的用户和组，以撤消上面所做的更改。回想一下，点（`.`）表示当前的工作目录。

```
$ chown -vR --reference=. conf
```

### 报告更改

大多数命令都有用于控制其输出的参数。最常见的是 `-v`（`--verbose`）以启用详细信息，但是 `chown` 还具有 `-c`（`--changes`）参数来指示 `chown` 仅在进行更改时报告。`chown` 还会报告其他情况，例如不允许进行的操作。

参数 `-f`（`--silent`、`--quiet`）用于禁止显示大多数错误消息。在下一节中，我将使用 `-f` 和 `-c`，以便仅显示实际更改。

### 保持根目录

Linux 文件系统的根目录（`/`）应该受到高度重视。如果命令在此层级上犯了一个错误，则后果可能会使系统完全无用。尤其是在运行一个会递归修改甚至删除的命令时。`chown` 命令具有一个可用于保护和保持根目录的参数，它是 `--preserve-root`。如果在根目录中将此参数和递归一起使用，那么什么也不会发生，而是会出现一条消息：

```
$ chown -cfR --preserve-root alan /
chown: it is dangerous to operate recursively on '/'
chown: use --no-preserve-root to override this failsafe
```

如果不与 `--recursive` 结合使用，则该选项无效。但是，如果该命令由 `root` 用户运行，则 `/` 本身的权限将被更改，但其下的其他文件或目录的权限则不会更改：

```
$ chown -c --preserve-root alan /
chown: changing ownership of '/': Operation not permitted
[root@localhost /]# chown -c --preserve-root alan /
changed ownership of '/' from root to alan
```

### 所有权即安全

文件和目录所有权是良好的信息安全性的一部分，因此，偶尔检查和维护文件所有权以防止不必要的访问非常重要。`chown` 命令是 Linux 安全命令集中最常见和最重要的命令之一。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-chown-command

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/19/8/introduction-linux-chmod-command
