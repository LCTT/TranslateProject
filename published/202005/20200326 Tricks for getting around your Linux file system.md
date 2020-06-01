[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12239-1.html)
[#]: subject: (Tricks for getting around your Linux file system)
[#]: via: (https://www.networkworld.com/article/3533421/tricks-for-getting-around-your-linux-file-system.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 文件系统中导航的技巧
======

> cd 命令可能是任何 Linux 用户学习的前 10 个命令之一，但这并不是在 Linux 文件系统中导航的唯一方法，这里还有其他一些方法。

![](https://img.linux.net.cn/data/attachment/album/202005/22/114058yrzlx94rz9lbx974.jpg)

无论你是在文件系统中四处查看、寻找文件还是尝试进入重要目录，Linux 都可以提供很多帮助。在本文中，我们将介绍一些技巧，使你可以在文件系统中移动，查找和使用所需的命令也更加轻松。

### 添加到 \$PATH

确保你不必花费大量时间在 Linux 系统上查找命令的最简单、最有用的方法之一就是在 `$PATH` 变量中添加适当的目录。但是，添加到 `$PATH` 变量中的目录顺序非常重要。它们确定系统在目录中查找要运行命令的目录顺序--在找到第一个匹配项时停止。

例如，你可能希望将家目录放在第一个，这样，如果你创建的脚本与其他可执行文件有相同的名称，那么只要输入该脚本的名称，它便会运行。

要将家目录添加到 `$PATH` 变量中，可以执行以下操作：

```
$ export PATH=~:$PATH
```

`~` 字符代表家目录。

如果将脚本保存在 `bin` 目录中，下面的会有效：

```
$ export PATH=~/bin:$PATH
```

然后，你可以运行位于家目录中的脚本，如下所示：

```
$ myscript
Good morning, you just ran /home/myacct/bin/myscript
```

**重要提示：**上面显示的命令会添加到你的搜索路径中，因为 `$PATH`（当前路径）被包含在内。它们不会覆盖它。你的搜索路径应该在你的 `.bashrc` 文件中配置，任何你打算永久化的更改也应该添加到那里。

### 使用符号链接

符号链接提供了一种简单而明显的方式来记录可能经常需要使用的目录的位置。例如，如果你管理网站的内容，那么可能需要通过创建如下链接来使你的帐户“记住”网页文件的位置：

```
ln -s /var/www/html www
```

参数的顺序很重要。第一个（`/var/www/html`）是目标，第二个是你创建的链接的名称。如果你当前不在家目录中，那么以下命令将执行相同的操作：

```
ln -s /var/www/html ~/www
```

设置好之后，你可以使用 `cd www` 进入 `/var/www/html`。

### 使用 shopt

`shopt` 命令还提供了一种让移动到其他目录更加容易的方法。当你使用 `shopt` 的 `autocd` 选项时，只需输入名称即可转到目录。例如：

```
$ shopt -s autocd
$ www
cd -- www
/home/myacct/www
$ pwd -P
/var/www/html

$ ~/bin
cd -- /home/myacct/bin
$ pwd
/home/myacct/bin
```

在上面的第一组命令中，启用了 `shopt` 命令的 `autocd` 选项。输入 `www`，就会调用 `cd www` 命令。由于此符号链接是在上面的 `ln` 命令示例之一中创建的，因此将我们移至 `/var/www/html`。 `pwd -P` 命令显示实际位置。

在第二组中，键入 `~/bin` 会调用 `cd` 进入在用户家目录的 `bin` 目录。

请注意，当你输入的是命令时，`autocd` 行为将*不会*生效，即使它也是目录的名称。

`shopt` 是 bash 内置命令，它有很多选项。这只是意味着你不必在要进入每个目录的名称之前输入 `cd`。

要查看 `shopt` 的其他选项，只需输入 `shopt`。

### 使用 \$CDPATH

可能进入特定目录的最有用技巧之一，就是将你希望能够轻松进入的路径添加到 `$CDPATH` 中。这将创建一个目录列表，只需输入完整路径名的一部分即可进入。

一方面，这可能有点棘手。你的 `$CDPATH` 需要包含要移动到的目录的父目录，而不是目录本身。

例如，假设你希望仅通过输入 `cd html` 就可以移至 `/var/www/html` 目录，并仅使用 `cd` 和简单目录名即可移至 `/var/log` 中的子目录。在这种情况下，此 `$CDPATH` 就可以起作用：

```
$ CDPATH=.:/var/log:/var/www
```

你将看到：

```
$ cd journal
/var/log/journal
$ cd html
/var/www/html
```

当你输入的不是完整路径时，`$CDPATH` 就会生效。它向下查看其目录列表，以查看指定的目录是否存在于其中一个目录中。找到匹配项后，它将带你到那里。

在 `$CDPATH` 开头保持 `.` 意味着你可以进入本地目录，而不必在 `$CDPATH` 中定义它们。

```
$ export CDPATH=".:$CDPATH"
$ Videos
cd -- Videos
/home/myacct/Videos
```

在 Linux 文件系统键切换并不难，但是如果你使用一些方便的技巧轻松地到达各个位置，那你可以节省一些大脑细胞。


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3533421/tricks-for-getting-around-your-linux-file-system.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[2]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
