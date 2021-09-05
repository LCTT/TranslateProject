[#]: subject: "Check file status on Linux with the stat command"
[#]: via: "https://opensource.com/article/21/8/linux-stat-file-status"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "New-World-2019"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 上使用 stat 命令查看文件状态
======
只需要一个 Linux 命令，你就可以获取到任何文件或文件系统的所有信息。
![Hand putting a Linux file folder into a drawer][1]

命令 `stat` 被包含在 GNU `coreutils` 软件包里，它提供了关于文件和文件系统的各种元数据，包括文件大小、结点位置、访问权限和 SELinux 上下文以及创建和修改时间。通常情况下，你需要多个不同命令获取的信息，这一个命令就可以实现。

### 在 Linux 上安装 stat 命令

在 Linux 系统中，可能早已安装了 `state` 命令，因为它是核心功能软件包的一部分，默认情况下，通常包含在 Linux 发行版里。

如果系统中没有安装 `stat` 命令，你可以使用包管理器安装 `coreutils` 软件包。

另外，你可以 [ 使用源码编译 coreutils 包 ][2]。

### 获取文件状态

运行 `stat` 命令可以获取指定文件或目录易于理解的输出。


```
$ stat planets.xml
  File: planets.xml
  Size: 325      Blocks: 8     IO Block: 4096   regular file
Device: fd03h/64771d    Inode: 140217      Links: 1
Access: (0664/-rw-rw-r--)  Uid: (1000/tux)   Gid: (100/users)
Context: unconfined_u:object_r:user_home_t:s0
Access: 2021-08-17 18:26:57.281330711 +1200
Modify: 2021-08-17 18:26:58.738332799 +1200
Change: 2021-08-17 18:26:58.738332799 +1200
 Birth: 2021-08-17 18:26:57.281330711 +1200
```

输出的信息很容易理解，但是包含了很多的信息，这里是 `stat` 所包含的项：

  * **File**: 文件名
  * **Size**: 文件大小，以字节表示
  * **Blocks**: 在硬盘驱动器上为文件保留的数据块的数量
  * **IO Block**: 文件系统块大小
  * **regular file**: 文件类型（普通文件，目录，文件系统）
  * **Device**: 文件所在的设备
  * **Inode**: 文件所在的 Inode 号
  * **Links**: 文件的链接数
  * **Access, UID, GID**: 文件权限，用户和组的所有者
  * **Context**: SELinux 上下文
  * **Access, Modify, Change, Birth**: 文件被访问、修改、更改状态以及创建时的时间戳



### 精简输出

对于非常了解输出或者想要使用其它工具（例如：[awk][3]）解析输出的人，这里可以使用 `--terse`（短参数为 `-t`) 参数，实现没有标题或换行符的格式化输出。


```
$ stat --terse planets.xml
planets.xml 325 8 81b4 100977 100 fd03 140217 1 0 0 1629181617 1629181618 1629181618 1629181617 4096 unconfined_u:object_r:user_home_t:s0
```

### 选择自己的格式

你可以使用 `--printf` 参数以及与 [printf][4] 类似的语法定义自己的输出格式。`stat` 的每一个属性都有一个格式序列（`%C` 表示 SELinux 上下文，`%n` 表示文件名等等），所以，你可以选择你想要的输出格式。


```
$ stat --printf="%n\n%C\n" planets.xml
planets.xml
unconfined_u:object_r:user_home_t:s0
$ $ stat --printf="Name: %n\nModified: %y\n" planets.xml
Name: planets.xml
Modified: 2021-08-17 18:26:58.738332799 +1200
```

下面是一些常见的格式序列：

  * **%a** 访问权限
  * **%F** 文件类型
  * **%n** 文件名
  * **%U** 用户名
  * **%u** 用户 ID
  * **%g** 组 ID
  * **%w** 创建时间
  * **%y** 修改时间



在 `stat` 手册和 `coreutils` 信息页中都有完整的格式化序列列表。

### 文件信息

如果你曾经尝试解析过 `ls -l` 的输出，那么，你会很喜欢 `stat` 命令的灵活性。你并不是每次都需要 `stat` 提供的所有信息，但是，当你需要其中一些或全部的时候它是非常有用的。不管你是读取默认输出，还是你自己创建的查询输出，`stat` 命令都可以让你访问想要的数据。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-stat-file-status

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[New-World-2019](https://github.com/New-World-2019)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://www.gnu.org/software/coreutils/
[3]: https://opensource.com/article/20/9/awk-ebook
[4]: https://opensource.com/article/20/8/printf