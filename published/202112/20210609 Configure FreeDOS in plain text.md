[#]: subject: (Configure FreeDOS in plain text)
[#]: via: (https://opensource.com/article/21/6/freedos-fdconfigsys)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14061-1.html)

FreeDOS 配置指南
======

> 学习如何使用 FDCONFIG.SYS 来配置 FreeDOS 。

![](https://img.linux.net.cn/data/attachment/album/202112/08/124646wahca435y60acpha.jpg)

FreeDOS 是主配置文件是在根目录中的名称为 `FDCONFIG.SYS` 的文件。这个文件包含一系列的行，每行都设置一个诸如 `LASTDRIVE=Z` 或 `FILES=40` 的值。例如，在 FreeDOS 1.3 RC4 中的默认 `FDCONFIG.SYS` ，看起来像这样：

```
SET DOSDIR=C:\FDOS

!COUNTRY=001,858,C:\FDOS\BIN\COUNTRY.SYS
!LASTDRIVE=Z
!BUFFERS=20
!FILES=40
!MENUCOLOR=7,0

MENUDEFAULT=1,5
MENU 1 - Load FreeDOS with JEMMEX, no EMS (most UMBs), max RAM free
MENU 2 - Load FreeDOS with JEMM386 (Expanded Memory)
MENU 3 - Load FreeDOS low with some drivers (Safe Mode)
MENU 4 - Load FreeDOS without drivers (Emergency Mode)

12?DOS=HIGH
12?DOS=UMB
12?DOSDATA=UMB
1?DEVICE=C:\FDOS\BIN\JEMMEX.EXE NOEMS X=TEST I=TEST NOVME NOINVLPG
234?DEVICE=C:\FDOS\BIN\HIMEMX.EXE
2?DEVICE=C:\FDOS\BIN\JEMM386.EXE X=TEST I=TEST I=B000-B7FF NOVME NOINVLPG
34?SHELL=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT
12?SHELLHIGH=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT
```

但是，这些指令行都表示什么意思？为什么一些指令行有一个问号（`?`）或一个叹号（`!`），而其它的命令行却没有？

### 一个简单的配置

让我们从一个简单的配置开始，像这样，我们就可以看到我们的配置做了什么。做出这个非常简单的 `FDCONFIG.SYS` 文件：

```
LASTDRIVE=Z
BUFFERS=20
FILES=40
DEVICE=C:\FDOS\BIN\HIMEMX.EXE
SHELL=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT
```

这个配置文件仅包含几个指令：

  1. `LASTDRIVE=Z`
  2. `BUFFERS=20`
  3. `FILES=40`
  4. `DEVICE=C:\FDOS\BIN\HIMEMX.EXE`
  5. `SHELL=C:\FDOS\BIN\COMMAND.COM C:\FDOS\BIN /E:1024 /P=C:\FDAUTO.BAT`

第一行指令告诉 FreeDOS 在存储器中保留多少驱动器字母。（DOS 使用字母来表示附属于系统的每个驱动器，`LASTDRIVE=Z` 表示预留从 `A` 到 `Z` 的所有驱动器字母）。 `LASTDRIVE` 会影响系统可以识别的 _逻辑驱动器_ 的数量。你可能没有任何的逻辑驱动器；FreeDOS 安装器不会默认设置这些逻辑驱动器。在任何情况下，在任何 FreeDOS 系统上设置 `LASTDRIVE=Z` 都是没有害处的。

`BUFFERS` 行设置文件缓冲区预留存储器。_缓冲区_ 有助于加速某些需要存储空间的进程，例如复制文件。如果你为 `BUFFERS` 设置一个较大的值，那么 FreeDOS 将预留更多的存储器。同理反之。大多数的用户将会设置其为 `BUFFERS=20` 或 `BUFFERS=40` ，取决于他们在系统上读写文件的频率。

`FILES` 设置决定 DOS 允许你一次打开多少文件。如果你运行的一个应用程序需要一次打开很多文件，例如打开一个谱系数据库，你可能需要为 `FILES` 设置一个较大的值。对于大多数的用户来说，`FILES=40` 是一个合理的值。

`DEVICE` 是一个特殊的指令，用于加载 _设备驱动器_ 。DOS 需要针对某些硬件或配置文件的设备驱动器。这行 `DEVICE=C:\FDOS\BIN\HIMEMX.EXE` 来加载 _HimemX_ 设备驱动，这样，DOS 可以利用超出前 640 KB 的扩展存储器。

最后的指令行告诉 FreeDOS 的内核在哪里找到命令行 shell 。默认情况下，内核将从 `COMMAND.COM` 开始查找 shell ，但是你可以使用 `SHELL` 指令来更改它。在这个示例中， `SHELL=C:\FDOS\BIN\COMMAND.COM` 说明 shell 是 `COMMAND.COM` 程序，位于 `C` 驱动器上的 `\FDOS\BIN` 目录之中。

在 `SHELL` 结尾处的其它文件表示选项为 `COMMAND.COM` 的 shell 。FreeDOS 的 `COMMAND.COM` 支持一些启动选项来修改它的行为，包括：

  * `C:\FDOS\BIN`：`COMMAND.COM` 程序的完整的路径
  * `/E:1024`：环境（`E`）大小，以字节为单位。`/E:1024` 告诉 `COMMAND.COM` 来预留 1024 字节，或者说是 1 KB ，来存储它的环境变量。
  * `/P=C:\FDAUTO.BAT`：`/P` 选项表示 shell 是一个永久性的（`P`）shell ，因此用户不能通过输入 `EXIT` 来退出 shell（附加文本 `=C:\FDAUTO.BAT` 告诉 `COMMAND.COM` 在启动时执行 `C:\FDAUTO.BAT` 文件，而不再执行默认的 `AUTOEXEC.BAT` 文件）

通过这个简单的配置文件，你应该能够理解 FreeDOS 1.3 RC4 安装的 `FDCONFIG.SYS` 文件中的一些东西。

### 启动菜单

FreeDOS 支持一种有序的功能：在一个系统上使用多个配置文件，使用一个“启动菜单”来选择你想要的配置。`FDCONFIG.SYS` 文件包含一些定义菜单的行:

```
!MENUCOLOR=7,0

MENUDEFAULT=1,5
MENU 1 - Load FreeDOS with JEMMEX, no EMS (most UMBs), max RAM free
MENU 2 - Load FreeDOS with JEMM386 (Expanded Memory)
MENU 3 - Load FreeDOS low with some drivers (Safe Mode)
MENU 4 - Load FreeDOS without drivers (Emergency Mode)
```

`MENUCOLOR` 指令定义启动菜单的文本颜色和背景颜色。这些值通常在 0 到 7 的范围之内, 并代表这些颜色：

  * 0 黑色
  * 1 蓝色
  * 2 绿色
  * 3 品蓝
  * 4 红色
  * 5 品红
  * 6 棕色
  * 7 白色

因此，`MENUCOLOR=7,0` 的定义意味着显示一个黑色背景（`0`）白色文本（`7`）的菜单。如果你想使用一个蓝色背景白色文本，你可以将其定义为 `MENUCOLOR=7,1` 。

在行头部的叹号（`!`）意味着：不管你选择哪个菜单，这个指令都将会执行。

`MENUDEFAULT=1,5` 行告诉内核等待用户多长时间来选择启动菜单项，或者如果用户没有选择的话，使用那个默认菜单项。`MENUDEFAULT=1,5` 标示着系统将等待 `5` 秒钟；如果用户不在这段时间内尝试选择一个菜单的话，内核将选择启动菜单 “1” 。

![boot menu][2]

在其后的 `MENU` 行至不同启动菜单配置的标签。它们是按顺序排列的，因此，菜单项目 “1” 是第一个，接下来的 “2” 是第二个，以此类推。

![menu select 4][3]

在 `FDCONFIG.SYS` 中的接下来的一行中，你将在一个问号（`?`）前看到一些数字。这标示“针对这几个数字的启动菜单项，使用这行命令”。例如，如果用户选择启动菜单项 “2”、“3” 或 “4” 的话，那么带有 `234?` 的这行命令才将加载 HimemX 设备驱动器。

```
234?DEVICE=C:\FDOS\BIN\HIMEMX.EXE
```

这里有很多方法来使用 `FDCONFIG.SYS` 以配置你的 FreeDOS 系统。我们在这里只介绍基本的东西，最重用的方法是定义你的 FreeDOS 内核设置。更多的信息，探索 FreeDOS 帮助系统（在命令行中输入 `HELP`）来学习如何使用 FreeDOS 的 `FDCONFIG.SYS` 选项：

  * `SWITCHES`：启动时处理过程行为
  * `REM` 和 `;`：注释（在 `FDCONFIG.SYS` 中将被忽略）
  * `MENUCOLOR`：启动菜单文本颜色和背景颜色
  * `MENUDEFAULT`：启动菜单默认值
  * `MENU`：启动菜单选项
  * `ECHO` 和 `EECHO`：显示信息
  * `BREAK`：设置打开或关闭扩展的 `Ctrl+C` 检查 
  * `BUFFERS` 或 `BUFFERSHIGH`：分配多少磁盘缓冲区
  * `COUNTRY`：设置国际化行为
  * `DOS`：告诉 FreeDOS 内核如何将其自身加载到存储器之中
  * `DOSDATA`：告诉 FreeDOS 加载内核到上位存储器之中
  * `FCBS`：设置文件控制块（FCB）的数量
  * `KEYBUF`：在存储器中重新指定键盘缓冲区
  * `FILES` 或 `FILESHIGH`：一次可以打开多少个文件
  * `LASTDRIVE` 或 `LASTDRIVEHIGH`：设置可以使用的最后一个驱动器字母
  * `NUMLOCK`：设置打开或关闭键盘数字锁
  * `SHELL`、`SHELLHIGH` 或 `COMMAND`：设置命令行 shell
  * `STACKS` 或 `STACKSHIGH`：添加堆栈以处理硬件中断
  * `SWITCHAR`：重新定义命令行选项开关字符
  * `SCREEN`：设置在屏幕上的行数
  * `VERSION`：设置向程序报告的 DOS 版本
  * `IDLEHALT`：激活节能功能，在某些系统上有用 
  * `DEVICE` 和 `DEVICEHIGH`：加载一个驱动程序到存储器之中
  * `INSTALL` 和 `INSTALLHIGH`：加载一个 “存储器驻留”（TSR）程序
  * `SET`：设置一个 DOS 环境变量

### 以纯文本方式配置 FreeDOS

像 Linux 和 BSD 一样，FreeDOS 配置以纯文本的方式进行。不需要特殊指定的编辑工具，因此，深入研究，看看哪些选项最适合你。它很简单，但是功能很强大！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-fdconfigsys

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/uploads/boot-menu.png (The boot menu waits for 5 seconds before assuming menu item 1)
[3]: https://opensource.com/sites/default/files/uploads/menu-select4.png (Use the arrow keys to select a boot menu configuration)
