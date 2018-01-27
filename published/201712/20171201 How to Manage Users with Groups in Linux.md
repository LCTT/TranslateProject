如何在 Linux 系统中通过用户组来管理用户
============================================================

![groups](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/group-of-people-1645356_1920.jpg?itok=rJlAxBSV)

> 本教程可以了解如何通过用户组和访问控制表（ACL）来管理用户。

当你需要管理一台容纳多个用户的 Linux 机器时，比起一些基本的用户管理工具所提供的方法，有时候你需要对这些用户采取更多的用户权限管理方式。特别是当你要管理某些用户的权限时，这个想法尤为重要。比如说，你有一个目录，某个用户组中的用户可以通过读和写的权限访问这个目录，而其他用户组中的用户对这个目录只有读的权限。在 Linux 中，这是完全可以实现的。但前提是你必须先了解如何通过用户组和访问控制表（ACL）来管理用户。

我们将从简单的用户开始，逐渐深入到复杂的访问控制表（ACL）。你可以在你所选择的 Linux 发行版完成你所需要做的一切。本文的重点是用户组，所以不会涉及到关于用户的基础知识。

为了达到演示的目的，我将假设：

你需要用下面两个用户名新建两个用户：

*   olivia
*   nathan

你需要新建以下两个用户组：

*   readers
*   editors

olivia 属于 editors 用户组，而 nathan 属于 readers 用户组。reader 用户组对 `/DATA` 目录只有读的权限，而 editors 用户组则对 `/DATA` 目录同时有读和写的权限。当然，这是个非常小的任务，但它会给你基本的信息，你可以扩展这个任务以适应你其他更大的需求。	

我将在 Ubuntu 16.04 Server 平台上进行演示。这些命令都是通用的，唯一不同的是，要是在你的发行版中不使用 `sudo` 命令，你必须切换到 root 用户来执行这些命令。

### 创建用户

我们需要做的第一件事是为我们的实验创建两个用户。可以用 `useradd` 命令来创建用户，我们不只是简单地创建一个用户，而需要同时创建用户和属于他们的家目录，然后给他们设置密码。

```
sudo useradd -m olivia
sudo useradd -m nathan
```

我们现在创建了两个用户，如果你看看 `/home` 目录，你可以发现他们的家目录（因为我们用了 `-m` 选项，可以在创建用户的同时创建他们的家目录。

之后，我们可以用以下命令给他们设置密码：

```
sudo passwd olivia
sudo passwd nathan
```

就这样，我们创建了两个用户。

### 创建用户组并添加用户

现在我们将创建 readers 和 editors 用户组，然后给它们添加用户。创建用户组的命令是：

```
addgroup readers
addgroup editors
```

（LCTT 译注：当你使用 CentOS 等一些 Linux 发行版时，可能系统没有 `addgroup` 这个命令，推荐使用 `groupadd` 命令来替换 `addgroup` 命令以达到同样的效果）

![groups](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/groups_1.jpg?itok=BKwL89BB)

*图一：我们可以使用刚创建的新用户组了。*

创建用户组后，我们需要添加我们的用户到这两个用户组。我们用以下命令来将 nathan 用户添加到 readers 用户组：

```
sudo usermod -a -G readers nathan
```

用以下命令将 olivia 添加到 editors 用户组：

```
sudo usermod -a -G editors olivia
```

现在我们可以通过用户组来管理用户了。

### 给用户组授予目录的权限

假设你有个目录 `/READERS` 且允许 readers 用户组的所有成员访问这个目录。首先，我们执行以下命令来更改目录所属用户组：

```
sudo chown -R :readers /READERS 
```

接下来，执行以下命令收回目录所属用户组的写入权限：

```
sudo chmod -R g-w /READERS
```

然后我们执行下面的命令来收回其他用户对这个目录的访问权限（以防止任何不在 readers 组中的用户访问这个目录里的文件）：

```
sudo chmod -R o-x /READERS
```

这时候，只有目录的所有者（root）和用户组 reader 中的用户可以访问 `/READES` 中的文件。

假设你有个目录 `/EDITORS` ，你需要给用户组 editors 里的成员这个目录的读和写的权限。为了达到这个目的，执行下面的这些命令是必要的：

```
sudo chown -R :editors /EDITORS
sudo chmod -R g+w /EDITORS
sudo chmod -R o-x /EDITORS
```

此时 editors 用户组的所有成员都可以访问和修改其中的文件。除此之外其他用户（除了 root 之外）无法访问 `/EDITORS` 中的任何文件。

使用这个方法的问题在于，你一次只能操作一个组和一个目录而已。这时候访问控制表（ACL）就可以派得上用场了。

### 使用访问控制表（ACL）

现在，让我们把这个问题变得棘手一点。假设你有一个目录 `/DATA` 并且你想给 readers 用户组的成员读取权限，并同时给 editors 用户组的成员读和写的权限。为此，你必须要用到 `setfacl` 命令。`setfacl` 命令可以为文件或文件夹设置一个访问控制表（ACL）。

这个命令的结构如下：

```
setfacl OPTION X:NAME:Y /DIRECTORY
```

其中 OPTION 是可选选项，X  可以是 `u`（用户）或者是 `g` （用户组），NAME 是用户或者用户组的名字，/DIRECTORY 是要用到的目录。我们将使用 `-m` 选项进行修改。因此，我们给 readers 用户组添加读取权限的命令是：

```
sudo setfacl -m g:readers:rx -R /DATA
```

现在 readers 用户组里面的每一个用户都可以读取 `/DATA` 目录里的文件了，但是他们不能修改里面的内容。

为了给 editors 用户组里面的用户读写权限，我们执行了以下命令：

```
sudo setfacl -m g:editors:rwx -R /DATA 
```

上述命令将赋予 editors 用户组中的任何成员读取权限，同时保留 readers 用户组的只读权限。

### 更多的权限控制

使用访问控制表（ACL），你可以实现你所需的权限控制。你可以添加用户到用户组，并且灵活地控制这些用户组对每个目录的权限以达到你的需求。如果想了解上述工具的更多信息，可以执行下列的命令：

*   `man usradd`
*   `man addgroup`
*   `man usermod`
*   `man sefacl`
*   `man chown`
*   `man chmod`


--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/how-manage-users-groups-linux

作者：[Jack Wallen]
译者：[imquanquan](https://github.com/imquanquan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.linux.com/files/images/group-people-16453561920jpg
[2]:https://www.linux.com/files/images/groups1jpg
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[4]:https://www.linux.com/licenses/category/creative-commons-zero
[5]:https://www.linux.com/licenses/category/used-permission
