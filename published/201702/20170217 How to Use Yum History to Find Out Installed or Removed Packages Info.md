使用 Yum 历史查找已安装或已删除的软件包信息
============================================================

[Yum][1] 是 RHEL/CentOS 的一个基于 rpm 的交互式高级包管理器，用户可以用它来安装新的软件包、卸载或清除旧的/不需要的软件包。它可以[自动运行系统更新][2]，并执行依赖分析，对已安装的或可用的软件包进行查询等等。

在本文中，我们将解释如何查看 Yum 事务的历史记录，以便于了解有关安装的软件包以及从系统中所卸载/清除软件包的信息。

**推荐阅读：** [20 条关于 Linux 软件包管理的 Yum 命令][3]

以下是一些如何使用 Yum 历史命令的示例。

### 查看完整的 Yum 历史

要查看 Yum 事务完整的历史记录，我们可以运行以下命令，然后将显示：事务 ID、执行特定操作的用户、操作发生的日期和时间、实际操作以及任何错误的附加信息与操作：

```
# yum history 
```

[![查看 Yum 历史](http://www.tecmint.com/wp-content/uploads/2017/02/View-Yum-History.png)][4]

### 使用 Yum 查找软件包信息

`history` 的子命令：`info`/`list`/`summary` 可以将事务 ID 或包名作为参数。此外，`list` 子命令可以加上特殊的参数，`all` 表示所有的事务。

运行以下命令查看先前的历史：

```
# yum history list all
```

并且，你可以使用下面的 `info` 命令查看涉及指定软件包的事务详情，例如 `httpd`：

```
# yum history info httpd
```

[![Yum - 查找软件包信息](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Package-Info.png)][5]

发出以下命令可以获得包含 `httpd` 软件包的事务的摘要：

```
# yum history summary httpd
```

[![Yum - 查找软件包的摘要](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Summary-of-Package.png)][6]

还可以使用事务的 ID 来查找，以下命令会显示 ID 为 `15` 的事务的详情。

```
# yum history info 15
```

[![Yum - 使用 ID 查找软件包信息](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Info-Using-ID.png)][7]

### 使用 yum history 查找软件包事务信息

有一些用于打印某个或多个软件包事务详情的子命令。我们可以使用 `package-list` 或 `package_info` 查看关于 `httpd` 的更多信息，例如：

```
# yum history package-list httpd
或
# yum history package-info httpd
```

[![Yum - 查找软件包事务信息](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Transaction-Info.png)][8]

要得到多个软件包的记录，我们可以运行：

```
# yum history package-list httpd epel-release
或
# yum history packages-list httpd epel-release
```

[![Yum - 查找多个软件包的信息](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Multiple-Package-Info.png)][9]

### 使用 Yum 回滚软件包

此外，还有一些 `history` 的子命令可以让我们撤销/重做/回滚事务。

1. `undo` - 会撤销一个指定的事务。
2. `redo` - 重复一次指定的事务。
3. `rollback` - 撤销指定事务之后的所有事务。

它们采用单个事务 id 或关键字 `last` 和从最后一个事务开始的偏移量。

例如，假设我们已经做了 60 个事务，`last` 是指事务 60，`last-4` 指向事务 56。

**推荐阅读：** [怎样使用 `yum-utils` 来维护以及加速 Yum][10]

以上子命令是如下工作的：如果我们有 5 个事务——V，W，X，Y 和 Z，其中分别是安装各个软件包的。

```
# yum history undo 2    #将删除软件包 W
# yum history redo 2    #将重新安装软件包 W
# yum history rollback 2    #将删除软件包 X、 Y 和 Z
```

在下面的示例中，事务 2 是一个更新操作，如下所示，以下 `redo` 命令将重复事务 2 直到所有软件包到更新到当前时间的最新版本：

```
# yum history | grep -w "2"
```

[![Yum - 查找软件包事务的 ID](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Yum-Package-Transaction-ID.png)][11]

```
# yum history redo 2
```

[![用 Yum 重新更新软件包](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Redo-Package-Update.png)][12]

`redo` 子命令同样可以在我们指定事务之前加上一些可选的参数：

1. `force-reinstall` - 重新安装所有在此事务中安装的软件包（通过 `yum install`、`upgrade` 或 `downgrade`）。
2. `force-remove` - 移除所有已经更新或回滚的软件包。

```
# yum history redo force-reinstall 16
```

[![Yum - 强制安装软件包](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Force-Install-Package.png)][13]

### 查找 Yum 历史数据库和来源信息

这些子命令为我们提供有关历史记录数据库和其它信息来源的信息：

1. `addon-info` - 提供更多的信息来源。
2. `stats` - 显示当前历史数据库的统计信息。
3. `sync` - 使我们能够更改为所有已安装软件包存储的 `rpmdb`/`yumdb` 数据。

看一下以下的命令的子命令实际上是怎样工作的：

```
# yum history addon-info
# yum history stats
# yum history sync
```

使用 `new` 子命令设置新的历史文件：

```
# yum history new
```

我们可以在 yum 手册页找到关于 Yum `history` 命令和其它几个命令的完整信息：

```
# man yum
```

**推荐阅读：** [4 个使用 Yum 禁用/锁定某些软件包更新的方法][14]

就是这么多了。在本篇指南中，我们介绍了各种 Yum `history` 命令，以查看 Yum 事务的详细信息。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 的爱好者，目前任 TecMint 的作者，志向是一名 Linux 系统管理员、web 开发者。他喜欢用电脑工作，并热衷于分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/view-yum-history-to-find-packages-info/

作者：[Aaron Kili][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/
[3]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/View-Yum-History.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Package-Info.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Summary-of-Package.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Info-Using-ID.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Transaction-Info.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Multiple-Package-Info.png
[10]:http://www.tecmint.com/linux-yum-package-management-with-yum-utils/
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Yum-Package-Transaction-ID.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Redo-Package-Update.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Force-Install-Package.png
[14]:http://www.tecmint.com/yum-lock-disable-blacklist-certain-package-update-version/
[15]:http://www.tecmint.com/author/aaronkili/
[16]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[17]:http://www.tecmint.com/free-linux-shell-scripting-books/
