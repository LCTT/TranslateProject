[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11056-1.html)
[#]: subject: (A beginner's guide to Linux permissions)
[#]: via: (https://opensource.com/article/19/6/understanding-linux-permissions)
[#]: author: (Bryant Son https://opensource.com/users/brson/users/greg-p/users/tj)

Linux 权限入门指南
======

> Linux 安全权限能够指定谁可以对文件或目录执行什么操作。

![](https://img.linux.net.cn/data/attachment/album/201907/04/133751argz0pp7hy5gvv7q.jpg)

与其他系统相比而言 Linux 系统的众多优点中最为主要一个便是 Linux 系统有着更少的安全漏洞和被攻击的隐患。Linux 无疑为用户提供了更为灵活和精细化的文件系统安全权限控制。这可能意味着 Linux 用户理解安全权限是至关重要的。虽然这并不一定是必要的，但是对于初学者来说，理解 Linux 权限的基本知识仍是一个明智之选。

### 查看 Linux 安全权限

在开始 Linux 权限的相关学习之前，假设我们新建了一个名为 `PermissionDemo` 的目录。使用 `cd`  命令进入这个目录，然后使用 `ls -l` 命令查看 Linux 安全管理权限信息。如果你想以时间为序排列，加上 `-t` 选项


```
`ls -lt`
```

因为这一目录下没有文件，所以这一命令执行不会返回结果。

![No output from ls -l command][2]

要了解关于 `ls` 命令的更多信息，请通过在命令行中输入 `man ls` 来查看命令手册。

![ls man page][3]

现在，让我们创建两个名为 `cat.txt` 和 `dog.txt` 的空白文件；这一步使用 `touch` 命令将更为简便。然后继续使用 `mkdir` 命令创建一个名为 `Pets` 的空目录。我们可以再次使用`ls -l`命令查看这些新文件的权限。

![Creating new files and directory][4]

我们需要留意这个命令输出结果的两个部分。

### 谁拥有权限？

首先要注意的是*谁*具有访问文件/目录的权限。请注意下面红色框中突出显示的部分。第一列是指具有访问权限的*用户*，而第二列是指具有访问权限的*组*。

![Output from -ls command][5]

用户的类型主要有三种：用户、组和其他人（本质上既不是用户也不是组）。还有一个*全部*，意思是几乎所有人。

![User types][6]

由于我们使用 `root` 作为当前用户，所以我们可以访问任何文件或目录，因为 `root` 是超级用户。然而，通常情况并非如此，你可能会被限定使用你的普通用户登录。所有的用户都存储在 `/etc/passwd` 文件中。

![/etc/passwd file][7]

“组“的相关信息保存在 `/etc/group` 文件中。

![/etc/passwd file][8]

### 他们有什么权限？

我们需要注意的是 `ls -l` 命令输出结果的另一部分与执行权限有关。以上，我们查看了创建的 `dog.txt` 和 `cat.txt` 文件以及 `Pets` 目录的所有者和组权限都属于 `root` 用户。我们可以通过这一信息了解到不同用户组所拥有的相应权限，如下面的红色框中的标示。

![Enforcing permissions for different user ownership types][9]

我们可以把每一行分解成五部分。第一部分标志着它是文件还是目录：文件用 `-`（连字符）标记，目录用 `d` 来标记。接下来的三个部分分别是用户、组和其他人的对应权限。最后一部分是[访问控制列表][10] （ACL）的标志，是记录着特定用户或者用户组对该文件的操作权限的列表。

![Different Linux permissions][11]

Linux 的权限级别可以用字母或数字标识。有三种权限类型:

  * 可读取：`r` 或 `4`
  * 可写入：`w` 或 `2`
  * 可执行：`x` 或 `1`
  
（LCTT 译注：原文此处对应的字母标示 `x` 误写为 `e`，已更正）

![Privilege types][12]

每个字母符号（`r`、`w` 或 `x`）表示有该项权限，而 `-` 表示无该项权限。在下面的示例中，文件的所有者可读可写，用户组成员仅可读，其他人可读可执行。转换成数字表示法，对应的是 `645`（如何计算，请参见下图的图示）。

![Permission type example][13]

以下是一些示例：

![Permission type examples][14]

完成下面的测试，检查你是否掌握了权限管理相关的知识。

![Permission type examples][15]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/understanding-linux-permissions

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[qfzy1233](https://github.com/qfzy1233)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson/users/greg-p/users/tj
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/sites/default/files/uploads/1_3.jpg (No output from ls -l command)
[3]: https://opensource.com/sites/default/files/uploads/1_man.jpg (ls man page)
[4]: https://opensource.com/sites/default/files/uploads/2_6.jpg (Creating new files and directory)
[5]: https://opensource.com/sites/default/files/uploads/3_2.jpg (Output from -ls command)
[6]: https://opensource.com/sites/default/files/uploads/4_0.jpg (User types)
[7]: https://opensource.com/sites/default/files/uploads/linuxpermissions_4_passwd.jpg (/etc/passwd file)
[8]: https://opensource.com/sites/default/files/uploads/linuxpermissions_4_group.jpg (/etc/passwd file)
[9]: https://opensource.com/sites/default/files/uploads/linuxpermissions_5.jpg (Enforcing permissions for different user ownership types)
[10]: https://en.wikipedia.org/wiki/Access-control_list
[11]: https://opensource.com/sites/default/files/uploads/linuxpermissions_6.jpg (Different Linux permissions)
[12]: https://opensource.com/sites/default/files/uploads/linuxpermissions_7.jpg (Privilege types)
[13]: https://opensource.com/sites/default/files/uploads/linuxpermissions_8.jpg (Permission type example)
[14]: https://opensource.com/sites/default/files/uploads/linuxpermissions_9.jpg (Permission type examples)
[15]: https://opensource.com/sites/default/files/uploads/linuxpermissions_10.jpg (Permission type examples)
