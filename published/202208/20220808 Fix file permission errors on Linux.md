[#]: subject: "Fix file permission errors on Linux"
[#]: via: "https://opensource.com/article/22/8/fix-file-permission-errors-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14929-1.html"

修复 Linux 上的文件权限错误
======

![](https://img.linux.net.cn/data/attachment/album/202208/14/170711zy6zskat0kj21y2h.jpg)

> 不要让文件权限拖你后腿。以下是在 Linux 和 macOS 上管理它们的方法。

如果你通过网络或“跑腿网络”（将文件保存到硬盘，以将其复制到一台计算机）在两个用户之间共享文件，那么在尝试读取或写入文件时可能会遇到权限错误。即使你了解它的概念，你也可能不知道该如何诊断或解决问题。我曾经将数据迁移作为一项服务执行，因此我遇到了相当多的权限错误和所有权冲突。这是我快速修复它们的方法。

### 1、确定正确的用户

在修复权限错误之前，你必须确定需要权限的人是谁。你可能认为你已经知道这一点，但你可能没有意识到*用户名*并不是用户身份的最确定属性。你的计算机不会将你视为一个人，而是将你视为一个数字。要了解你的号码，请查看你的用户 ID：

```
$ id --user
1005
```

### 2、获取当前所有者

接下来，确定你无法与之交互的文件的所有者。由于发生了文件权限问题，你可能需要使用 `sudo` 命令查看有关文件的信息：

```
$ sudo ls --numeric-uid-gid
-rw------- 1 1000 100  23041 Aug  2 05:26 bar
-rw------- 1 1000 100  54281 Aug  2 04:58 baz
-rw------- 1 1000 100    822 Aug  2 08:19 foo
```

在此示例中，拥有文件的用户被标识为用户 ID 1000，这就是用户 ID 1005 无法与它们交互的原因。更糟糕的是，这些文件标记为仅由拥有它们的用户可读和可写，因此即使是同一组的成员也不能与这些文件进行交互。

### 3、更改权限以匹配

你知道需要权限的用户，因此你可以更改当前所有者以匹配你当前的用户：

```
$ sudo chown 1005 foo
```

你还可以通过更改文件模式授予你的组成员以及系统上可能的其他用户对文件的访问权限。例如，在向组和任何其他用户授予读取权限（4）的同时保持读取和写入权限（7）：

```
$ sudo chmod 744 foo
```

### 了解更多

当你对文件权限不熟悉时，它们似乎很棘手。有关文件所有权如何工作的更多信息，请阅读  [chown 简介][2]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/fix-file-permission-errors-linux

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/button_push_open_keyboard_file_organize.png
[2]: https://opensource.com/article/19/8/linux-chown-command