[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11123-1.html)
[#]: subject: (Command line quick tips: Permissions)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-permissions/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

命令行快速提示：权限
======

![][1]

Fedora 与所有基于 Linux 的系统一样，它提供了一组强大的安全特性。其中一个基本特性是文件和文件夹上的*权限*。这些权限保护文件和文件夹免受未经授权的访问。本文将简要介绍这些权限，并向你展示如何使用它们共享对文件夹的访问。

### 权限基础

Fedora 本质上是一个多用户操作系统，它也有*组*，用户可以是其成员。但是，想象一下一个没有权限概念的多用户系统，不同的登录用户可以随意阅读彼此的内容。你可以想象到这对隐私或安全性并不是很好。

Fedora 上的任何文件或文件夹都分配了三组权限。第一组用于拥有文件或文件夹的*用户*，第二组用于拥有它的*组*，第三组用于其他人，即既不是该文件的用户也不是拥有该文件的组中的用户。有时这被称为*全世界*。

### 权限意味着什么

每组权限都有三种形式：*读*、*写*和*执行*。其中每个都可以用首字母来代替，即 `r`、`w`、`x`。

#### 文件权限

对于*文件*，权限的含义如下所示：

  * 读（`r`）：可以读取文件内容
  * 写（`w`）：可以更改文件内容
  * 执行（`x`）：可以执行文件 —— 这主要用于打算直接运行的程序或脚本

当你对任何文件进行详细信息列表查看时，可以看到这三组权限。尝试查看系统上的 `/etc/services` 文件：

```
$ ls -l /etc/services
-rw-r--r--. 1 root root 692241 Apr  9 03:47 /etc/services
```

注意列表左侧的权限组。如上所述，这些表明三种用户的权限：拥有该文件的用户，拥有该文件的组以及其他人。用户所有者是 `root`，组所有者是 `root` 组。用户所有者具有对文件的读写权限，`root` 组中的任何人都只能读取该文件。最后，其他任何人也只能读取该文件。（最左边的 `-` 显示这是一个常规文件。）

顺便说一下，你通常会在许多（但不是所有）系统配置文件上发现这组权限，它们只由系统管理员而不是普通用户更改。通常，普通用户需要读取其内容。

#### 文件夹（目录）权限

对于文件夹，权限的含义略有不同：

  * 读（`r`）：可以读取文件夹内容（例如 `ls` 命令）
  * 写（`w`）：可以更改文件夹内容（可以在此文件夹中创建或删除文件）
  * 执行（`x`）：可以搜索文件夹，但无法读取其内容。（这听起来可能很奇怪，但解释起来需要更复杂的文件系统细节，这超出了本文的范围，所以现在就这样吧。）

看一下 `/etc/grub.d` 文件夹的例子：

```
$ ls -ld /etc/grub.d
drwx------. 2 root root 4096 May 23 16:28 /etc/grub.d
```

注意最左边的 `d`，它显示这是一个目录或文件夹。权限显示用户所有者（`root`）可以读取、更改和 `cd` 到此文件夹中。但是，没有其他人可以这样做 —— 无论他们是否是 `root` 组的成员。注意，你不能 `cd` 进入该文件夹。

```
$ cd /etc/grub.d
bash: cd: /etc/grub.d: Permission denied
```

注意你自己的主目录是如何设置的：

```
$ ls -ld $HOME
drwx------. 221 paul paul 28672 Jul  3 14:03 /home/paul
```

现在，注意除了作为所有者之外，没有人可以访问此文件夹中的任何内容。这是特意的！你不希望其他人能够在共享系统上读取你的私人内容。

### 创建共享文件夹

你可以利用此权限功能轻松创建一个文件夹以在组内共享。假设你有一个名为 `finance` 的小组，其中有几个成员需要共享文档。因为这些是用户文档，所以将它们存储在 `/home` 文件夹层次结构中是个好主意。

首先，[使用 sudo][2] 创建一个共享文件夹，并将其设置为 `finance` 组所有：

```
$ sudo mkdir -p /home/shared/finance
$ sudo chgrp finance /home/shared/finance
```

默认情况下，新文件夹具有这些权限。注意任何人都可以读取或搜索它，即使他们无法创建或删除其中的文件：

```
drwxr-xr-x. 2 root root 4096 Jul  6 15:35 finance
```

对于金融数据来说，这似乎不是一个好主意。接下来，使用 `chmod` 命令更改共享文件夹的模式（权限）。注意，使用 `g` 更改所属组的权限，使用 `o` 更改其他用户的权限。同样，`u` 会更改用户所有者的权限：

```
$ sudo chmod g+w,o-rx /home/shared/finance
```

生成的权限看起来更好。现在，`finance` 组中的任何人（或用户所有者 `root`）都可以完全访问该文件夹及其内容：

```
drwxrwx---. 2 root finance 4096 Jul  6 15:35 finance
```

如果其他用户尝试访问共享文件夹，他们将无法执行此操作。太棒了！现在，我们的金融部门可以将文档放在一个共享的地方。

### 其他说明

还有其他方法可以操作这些权限。例如，你可能希望将此文件夹中的任何文件设置为 `finance` 组所拥有。这需要本文未涉及的其他设置，但请继续关注我们，以了解关于该主题的更多信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-permissions/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
