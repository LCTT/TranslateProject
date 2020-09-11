[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11756-1.html)
[#]: subject: (Intro to the Linux useradd command)
[#]: via: (https://opensource.com/article/19/10/linux-useradd-command)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Linux useradd 命令介绍
======

> 使用 useradd 命令来添加用户（并且根据需要修改账号）。

![](https://img.linux.net.cn/data/attachment/album/202001/06/225733hv1u7f4z4vbt8u5x.jpg)

任何计算机系统中，添加用户都是最重要的事之一；本文着重介绍如何在 Linux 系统中添加用户。

正式开始之前，我先提三个概念。首先，跟大多数操作系统一样，Linux 用户也需要一个账号才能登录。本文只介绍本地账号，不涉及网络账号，如 LDAP。其次，每个账号都有一个名字（username）和一个对应的数字（用户 ID）。最后，每个用户通常都在一个组内，每个组都有一个名字和一个组 ID。

你可能已经想到了，Linux 提供了添加用户的命令行工具，就是 `useradd` 命令。有些版本也叫 `adduser`。为了方便使用，很多发行版上这个命令是一个指向 `useradd` 命令的符号链接。

```
$ file `which adduser`
/usr/sbin/adduser: symbolic link to useradd
```

来看一下 `useradd`。

> 注意：本文描述的默认环境是 Red Hat Enterprise Linux 8.0。你可能会发现本文描述的这些文件和某些默认值与某些 Linux 发行版或其他 Unix 操作系统（FreeBSD 或 Solaris）偶尔会有差异。

### 默认处理

`useradd` 的基本用法相当简单：提供一个用户名就可以添加一个用户。

```bash
$ sudo useradd sonny
```

在本例中，`useradd` 命令创建了一个名为 `sonny` 的账号。此命令同时创建了一个同名的组，`sonny` 被放进了这个组，这个组也是 `sonny` 账号的主组。命令执行时，根据配置文件 `/etc/default/useradd` 和 `/etc/login.defs` 中的不同设置，也会有其他的参数，如语言和 shell。对于一个私人系统或微小的单服务商业环境，这些参数已经足够了。

上面两个文件控制 `useradd` 的处理，用户的信息保存在 `/etc` 目录下的一些其他文件中，关于这些信息的讲解会贯穿全文。

| 文件   | 描述                                 | 域 (加粗的表示由 useradd 命令设置)                           |
| ------ | ------------------------------------ | ------------------------------------------------------------ |
| `passwd` | 存储用户账号信息          | **用户名**:未使用:**UID**:**GID**:**备注**:**家目录**:**shell** |
| `shadow` | 存储用户账号的安全信息 | **用户名**:加密密码:上次修改时间:最短使用天数:最长使用天数间:**修改前警示天数**:**过期后宽限时间**:未使用 |
| `group`  | 存储组信息                | **组名**:未使用:**GID**:**成员列表**                     |

### 自定义处理

当管理员需要更好地控制账号时，可以使用命令行来自定义，如指定一个用户的 ID。

#### 用户和组 ID

默认情况下，`useradd` 试图使用相同的用户 ID（UID）和主组 ID（GID），但也不完全是。虽然 UID 与 GID 相同不是必须的，但如果相同，会更方便管理员管理。

下面的场景就是一个 GID 与 UID 不同的例子。现在我添加另一账号，名为 Timmy。通过使用 `getent` 命令来比较 `sonny` 和 `timmy` 两个账号，显示两个用户和对应的主组。

```bash
$ getent passwd sonny timmy
sonny:x:1001:1002:Sonny:/home/sonny:/bin/bash
timmy:x:1002:1003::/home/timmy:/bin/bash

$ getent group sonny timmy
sonny:x:1002:
timmy:x:1003:
```

不幸的是，两者的 UID 和 GID 都不相同。因为默认的处理是，创建用户时，把下一个可用的 UID 赋给用户，然后把同一个数字作为主组 ID 赋给它。然而，当要使用的组 ID 已经被使用时，就再把下一个可用的 GID 赋给它。为了弄清细节，我猜想 1001 这个 GID 已经被使用了，用一个命令确认了一下。

```bash
$ getent group 1001
book:x:1001:alan
```

`book` 的 ID 是 `1001`，因此新创建的用户的 GID 都有偏移量 1。这就是为什么系统管理员在用户创建过程中需要多设置一些值的一个实例。为了解决这个问题，我必须先确定下一个可用的 UID 和 GID 是否相同。确定下一个可用值时，可以使用 `getent group` 和 `getent passwd` 命令，通过 `-u` 参数传递要确认的值。

```bash
$ sudo useradd -u 1004 bobby

$ getent passwd bobby; getent group bobby
bobby:x:1004:1004::/home/bobby:/bin/bash
bobby:x:1004:
```

另一个需要指定 ID 的场景是，通过 NFS 访问远程系统上的文件时。对于一个给定的用户，当 NFS 所有客户端和服务系统的 ID 都一样时，管理员更容易控制。在我的文章 [使用 autofs 挂载 NFS][2] 中有详细介绍。

### 更多自定义

一些其他的指定用户信息的参数也用得比较频繁。这里是一些你会经常用到的参数的概括例子。

#### 注释

注释选项是通过 `-c` 参数指定的一个解释文本字段，可以提供一段简短的描述或其他信息。

```bash
$ sudo useradd -c "Bailey is cool" bailey
$ getent passwd bailey
bailey:x:1011:1011:Bailey is cool:/home/bailey:/bin/bash
```

#### 组

一个用户可以被指定一个主组和多个次组。`-g` 参数指定主组名称或 GID。如果不指定，`useradd` 会以用户名创建一个主组（前面演示过）。`-G`（大写）参数用一个逗号分隔的组列表来指定此用户所属的组，这些组就是次组。

```bash
$ sudo useradd -G tgroup,fgroup,libvirt milly
$ id milly
uid=1012(milly) gid=1012(milly) groups=1012(milly),981(libvirt),4000(fgroup),3000(tgroup)
```

#### 家目录

`useradd` 的默认处理是，在 `/home` 目录下创建用户的家目录。然而，下面的参数可以改写家目录的基础目录。`-b` 设置另一个可以创建家目录的基础目录。例如指定 `/home2` 而不是 `/home`。

```bash
$ sudo useradd -b /home2 vicky
$ getent passwd vicky
vicky:x:1013:1013::/home2/vicky:/bin/bash
```

`-d` 参数可以指定一个与用户名不同的家目录。

```bash
$ sudo useradd -d /home/ben jerry
$ getent passwd jerry
jerry:x:1014:1014::/home/ben:/bin/bash
```

#### 目录模板

指定 `-k` 参数会在创建新用户时，复制 `/etc/skel` 目录下的所有文件到用户的家目录中。这些文件通常是 shell 配置文件，当然也可以是系统管理员想在新建用户时使用的任何文件。

#### Shell

`-s` 参数可以指定 shell。如果不指定，则使用默认的 shell。例如，下面的例子中 ，配置文件中定义的 shell 是 `bash`，但 `wally` 这个用户指定的是 `zsh`。

```bash
SHELL=/bin/bash

$ sudo useradd -s /usr/bin/zsh wally
$ getent passwd wally
wally:x:1004:1004::/home/wally:/usr/bin/zsh
```

#### 安全

安全是用户管理的重中之重，因此 `useradd` 命令也提供了很多关于安全的选项。可以使用 `-e` 参数，以 YYYY-MM-DD 的格式指定一个用户的过期时间。

```bash
$ sudo useradd -e 20191231 sammy
$ sudo getent shadow sammy
sammy:!!:18171:0:99999:7::20191231:
```

当密码过期时，账号也会自动失效。`-f` 参数指定密码过期后经过几天账号失效。如果设为 0，则立即失效。

```bash
$ sudo useradd -f 30 willy
$ sudo getent shadow willy
willy:!!:18171:0:99999:7:30::
```

### 实例

生产环境中，创建一个用户账号时会用到多个参数。例如，我要创建一个 Perry 账号，可能会用下面的命令：

```bash
$ sudo useradd -u 1020 -c "Perry Example" \
-G tgroup -b /home2 \
-s /usr/bin/zsh \
-e 20201201 -f 5 perry
```

查看前面的内容来理解每个选项。用下面的命令确认结果：

```bash
$ getent passwd perry; getent group perry; getent shadow perry; id perry
perry:x:1020:1020:Perry Example:/home2/perry:/usr/bin/zsh
perry:x:1020:
perry:!!:18171:0:99999:7:5:20201201:
uid=1020(perry) gid=1020(perry) groups=1020(perry),3000(tgroup)
```

### 一点小建议

`useradd` 命令是所有 Unix（不仅仅是 Linux）系统管理员都必知必会的命令。由于用户创建不能出错，需要第一次就正确，所以理解它的每一个选项很重要。这意味着你需要有一套深思熟虑的命名约定，包括为整个企业环境而不仅仅是一个单系统预留一个专用的 UID/GID 范围，尤其是你为一个成长中的组织工作时。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/linux-useradd-command

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connection_people_team_collaboration.png?itok=0_vQT8xV (people in different locations who are part of the same team)
[2]: https://opensource.com/article/18/6/using-autofs-mount-nfs-shares
