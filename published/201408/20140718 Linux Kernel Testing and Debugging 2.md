Linux 内核测试与调试（2）
================================================================================
### 编译安装稳定版内核 ###

如果你用 git 下载源码，就执行以下命令：

    cd linux-stable

    git checkout linux-3.x.y

如果是直接下载压缩文件，用以下命令进入源码目录：

    cd linux-3.x.y

如果你想把内核安装到自己的系统上，最安全的方法是使用你安装好的发行版拥有的配置文件。你可以在 /boot 目录找到当前发行版的内核配置文件：

    cp /boot/config-3.x.y-z-generic .config

运行下面的命令，可以在当前内核配置的基础上修改一些小地方，然后产生新的内核配置文件。比如说新的内核比你的 Ubuntu 发行版自带的内核多了些新功能，而你正好需要用到它们，这个时候你就要修改配置了。

    make oldconfig

完成配置后，就可以编译了：

    make all

完成编译后，安装这个新的内核：

    sudo "make modules_install install"

上面的命令安装新内核，并把新内核作为启动项添加到 grub 文件（LCTT：就是你下次开机时会多出一个开机选项）。好了你可以重启电脑，然后选择新的内核启动系统。等等！先别冲动，在重启电脑之前，我们保存下编译内核产生的日志，用于比较和查找错误（如果有错误发生的话）：

    dmesg -t > dmesg_current

    dmesg -t -k > dmesg_kernel

    dmesg -t -l emerg > dmesg_current_emerg

    dmesg -t -l alert > dmesg_current_alert

    dmesg -t -l crit > dmesg_current_alert

    dmesg -t -l err > dmesg_current_err

    dmesg -t -l warn > dmesg_current_warn

正常的话，dmesg 不会输出 emerg, alert, crit 和 err 级别的信息。如果你不幸看到这些输出了，说明内核或者你的硬件环境有问题。

再介绍一些重启前的需要执行的操作。谁也不能保证新内核能够正常启动，所以请不要潇洒地把老内核删除，至少保留一个稳定可用的内核在系统上。修改一下 /etc/default/grub 文件：

使用 earlyprink=vga 作为内核启动选项，把系统早期启动的信息打印到显示屏上：

    GRUB_CMDLINE_LINUX="earlyprink=vga" 

将 GRUB_TIMEOUT 的值设置成10秒到15秒之间的值，保证在开机启动的时候你有足够的时间来选择启动哪个内核：

    取消对 GRUB_TIMEOUT 的注释，并把它设置为10：GRUB_TIMEOUT=10
    注释掉 GRUB_HIDDEN_TIMEOUT 和 GRUB_HIDDEN_TIMEOUT_QUIET

运行 update-grub 命令，更新 /boot 目录下的 grub 配置文件：

    sudo update-grub 

现在可以重启系统了。新内核起来后，比较新老内核的 dmesg 信息，看看新的内核有没有编译错误。如果新内核启动失败，你需要通过老内核启动系统，然后分析下为什么失败。

### 跟上节奏，永不落后（编译最新版内核） ###

如果你想开上内核快车道，追求与时俱进，那就去下载 mainline 状态的内核或 linux-next 状态的内核（LCTT：读者可进入 kernel.org 获取代码，linux 代码被分为4种状态：mainline, stable, longterm, linux-next）。安装测试 mainline 状态或 linux-next 状态的内核，你就可以在正式发布之前帮助内核找到并修复里面的 bug。

mainline 状态的内核源码：

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

linux-next 状态的内核源码：

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

编译安装这两种内核的步骤与编译安装稳定版内核一样。按之前讲过的步骤来就行了。

### 打补丁 ###

Linux 内核的补丁是一个文本文件，包含新源码与老源码之间的差异。每个补丁只包含自己所依赖的源码的改动，除非它被特意包含进一系列补丁之中。打补丁方法如下：

    patch -p1 < file.patch

    git apply --index file.patch 

两种方法都可以打补丁。但是，如果你要打的补丁包含一个新文件，git 命令不能识别这个新增的文件，也就是说这个新文件在 git 里面属于 untracked 文件（LCTT：玩 git 的人对这个会比较熟悉，就是文件处于未被跟踪的状态，你需要使用 git add <file> 命令将文件放入暂存区）。git diff 命令不会将这个文件的增量显示出来，并且 git status 命令会显示这个文件处于 untracked 状态。

大多数情况下，有个没被跟踪的文件，对于编译安装内核来说没什么问题，但是 git 操作就会出现一些问题了： git reset --hard 命令不会删除这个新加的文件，并且接下来的 git pull 操作也会失败。你有多种选择来避免上面所说的状况：

选项1，不跟踪这个新文件：

> 如果打补丁后新添加了文件，在 git reset --hard 前使用 git clean 命令来删除没有被跟踪的文件。举个例子，git clean -dfx 命令会强制删除未被跟踪的目录和文件，忽略在 .gitigniore 文件内规定的文件。如果你不在乎哪些文件会被删除，你可以使用 -q 选项让 git clean 命令进入安静模式，不输出任何处理过程。

选项2，跟踪新文件：

> 你可以在使用 git apply --index file.patch 命令后让 git 跟踪打完补丁后新产生的文件（LCTT：使用 git add <new file> 命令），就是让 git 把文件放入 index 区域。做完这个后，git diff 命令会将新文件的增量打印出来，git status 也会显示者这是一个正常的新增文件。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,1

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
