WingCuengRay翻译中
翻译部分，未经自校验
Part 7 - LFCS: Managing System Startup Process and Services (SysVinit, Systemd and Upstart)
==============================================================
几个月前，Linux 基金会发布了 LFCS (Linux Foundation Certified Sysadmin) 认证，这是一则振奋人心的消息，它的目标是让全世界各地的人们的的中级 Linux 系统管理能力得到认证。这能力包括了对处于运行状态的系统和服务的支持，发现并分析实际问题，并且知道何时向开发团队提交问题。

![Linux Foundation Certified Sysadmin – Part 7](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-7.png)

Linux Foundation Certified Sysadmin - Part7

下面的视频简单地介绍了 Linux 基金认证的流程。

注:youtube 视频

本章是10个系列教程中的第7章，在这个部分，我们会解释如何去管理 Linux 系统启动进程和服务，这是 LFCS 认证考试中必须的。

### Linux 启动进程的管理 ###
Linux 系统的启动进程包括了几个阶段，每一个阶段都代表了一个不同的**component**。下图简单概括了启动的流程并且展示了所有阶段的主要组成部分。

![Linux Boot Process](http://www.tecmint.com/wp-content/uploads/2014/10/Linux-Boot-Process.png)


Linux 启动流程

当你按下电脑上的开机按钮，装载在主板电可擦写只读存储器 (EEPROM) 中的固件 (BIOS) 会执行开机自检 (Power-On Self Test) 检查系统的硬件状态。当开机自检完成后，固件会寻找并载入位于第一块硬盘中的主引导记录 (MBR) 或者 EFI 分区中的 boot loader stage1，然后将控制权转交给它。第一阶段的 boot loader 在第一块硬盘中的主引导记录 (MBR 或者 EFI 分区中。

#### MBR 引导启动 ####
MBR 在 BIOS 设置的可启动硬盘的第一扇区，其大小是 512 字节。

- 起始 446 字节: bootloader 包括了可执行代码与错误消息文本。
- 随后 64 字节: 分区表包括了四条硬盘分区（主分区或扩展分区）的记录。此外，每条分区记录指出了分区的状态(有效/无效)，大小和每个分区的开始/结束扇区。
- 最后 2 字节: 用于MBR校验检查的幻数 (magic number)。

**MBR 备份**

	# dd if=/dev/sda of=mbr.bkp bs=512 count=1

![Backup MBR in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Backup-MBR-in-Linux.png)

**恢复 MBR**

	# dd if=mbr.bkp of=/dev/sda bs=512 count=1

![Restore MBR in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Restore-MBR-in-Linux.png)

在 Linux 的 MBR 恢复

### EFI/UFEFI 引导启动 ###
在 EFI/UEFI 引导的系统中，UEFI固件会读取其配置，根据配置决定启动哪一个 UEFI appliction，并且从哪里启动(例如，在 EFI 分区所在的磁盘)。

然后，第二阶段的引导程序被加载运行。GRUB[GRand Unified Boot] 是 Linux 上最流行的启动管理器。**如今有两个不同的版本供大多数的系统使用**。

- GRUB Legacy 配置文件: /boot/grub/menu.lst (旧版本，EFI/UEFI 不支持)
- GRUB2 配置文件: 大多数为 /etc/default/grub

虽然 LFCS 资格认证没有明确要求了解关于 GRUB 内部知识，但如果你能勇敢地承受系统崩溃的风险（为了保险，你可能希望先在虚拟机上尝试）,你可以尝试自己去修改这些文件。

	# update-grub

在修改完 GRUB 的配置文件后，需要以 root 权限运行以上指令让修改生效。

GRUB 主要加载了默认的内核和 initrd 或 initramfs 镜像。简单来说，initrd 和 initramfs 帮助进行了硬件的检测，内核模块的加载和设备的探查，**这对于挂载真正的根文件系统来说是必须的**。

为了得到一个用户交互界面，一旦根文件系统被挂载，内核便执行系统服务管进程 (init 或者 systemd，其进程标识或者 PID 通常是 1 )来启动正常的用户空间进程。

init 和 systemd 都是守护进程，因为它们是系统那个第一个启动的服务(在启动期间)和最后一个终止的服务(在关机时)。

![Systemd and Init](http://www.tecmint.com/wp-content/uploads/2014/10/systemd-and-init.png)

Systemd and Init

### 服务的启动 (SysVinit) ###
Linux 中的运行级别机制通过控制不同服务的运行来指定系统的不同使用方式。换言之，运行级别决定在当前的运行模式下哪些任务能够运行(哪些不能)。

基于 System V Unix 继承下来的传统，当计算机进入一个指定的运行级别时(或者说，进入一个与当前系统不同的运行级别时)，系统通过传递用于控制启动和停止服务的执行脚本来执行启动进程。

在每一个运行级别，每一个服务能被设置为运行状态或者关闭状态(如果正在运行)。大多数发行版在最新版本中抛弃了System V的标准，支持一种新的被称为systemd的系统服务管理进程(也就是系统守护进程)，不过出于兼容性考虑，systemd通常支持 sysv 命令。这意味着你能够在基本systemd发行版上运行大多数sysv int工具。

- 参考: [Why ‘systemd’ replaces ‘init’ in Linux][1]

除了启动系统进程，init 还根据 /etc/inittab 文件决定必须进入哪一个运行级别。

注：表格
<table cellspacing="0" border="0">
	<colgroup width="85">
	</colgroup>
	<colgroup width="1514">
	</colgroup>
	<tbody>
    <tr>
      <td align="CENTER" height="18" style="border: 1px solid #000001;"><b>Runlevel</b></td>
      <td align="LEFT" style="border: 1px solid #000001;"><b> Description</b></td>
    </tr>
    <tr class="alt">
      <td align="CENTER" height="18" style="border: 1px solid #000001;">0</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;挂起系统。运行级别 0 是一个用于快速关闭系统的特殊过渡态。</td>
    </tr>
    <tr>
      <td align="CENTER" height="20" style="border: 1px solid #000001;">1</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;该模式也被称为 s 或 S。这个运行模式有时被叫作维护模式。根据发行版的不同，在这个运行级别启动的服务也不同。这通常用于可能被正常系统操作损坏的**low-level system maintenance(低级别系统维护)**</td>
    </tr>
    <tr class="alt">
      <td align="CENTER" height="18" style="border: 1px solid #000001;">2</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;多用户模式。在 Debian 及其衍生版中，这是默认的运行级别，包括了可用的图形登陆。在基于红帽 (Red-Hat 的系统中，这是没有网络功能的多用户模式。</td>
    </tr>
    <tr>
      <td align="CENTER" height="18" style="border: 1px solid #000001;">3</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp; 在基于 Red-Hat 的系统中，这是默认的多用户模式，此模式会运行除图形环境之外的所有东西。基于 Debian 的系统通常不使用此运行级别 4,5 和此级别。</td>
    </tr>
    <tr class="alt">
      <td align="CENTER" height="18" style="border: 1px solid #000001;">4</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;默认不使用，因此可用于用户定制。</td>
    </tr>
    <tr>
      <td align="CENTER" height="18" style="border: 1px solid #000001;">5</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;在基于红帽的系统，这是完整的带图形界面的多用户模式。此运行级别类似于运行级别 3，不过多了 GUI 的登陆界面。</td>
    </tr>
    <tr class="alt">
      <td align="CENTER" height="18" style="border: 1px solid #000001;">6</td>
      <td align="LEFT" style="border: 1px solid #000001;">&nbsp;重启系统 </td>
    </tr>
	</tbody>
</table>

我们能够使用`init` 命令在不同运行级别之间切换: `init N` (N是上面列出的运行级别之一)。注意并不推荐使用这种方法改变一个运行中系统的运行级别，因为它没有发出警告信息给已登陆用户（这会令他们工作丢失，任务异常终止）。

相反，应该使用`shutdown`命令重启系统（发送一条警告信息给所有的登陆用户，并阻止另外的用户登陆）;然而，必须先在 /etc/inittab 文件中编辑系统启动的默认运行级别。

因此，以 root 权限寻找 /etc/inittab 中的下行，然后按照下列步骤正确地在运行级别之间切换:

	id:2:initdefault:

然后使用 vim 之类文本编辑器(在本系列的第二章介绍了如何在 Linux 中使用 vi/vim 编辑器)将数字 2 改变成你想要的运行级别。

接下来以 root 权限运行:
	
	# shutdown -r now

最后一条命令会重启系统并让其在下一次启动期间以指定的运行级别启动，然后系统会运行在 /etc/rc[runlevel].d 目录下的脚本以决定哪些服务会被启动哪些不会。例如，下图处于运行级别2的系统.

![Change Runlevels in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Change-Runlevels-in-Linux.jpeg)

Linux 运行级别的变更

## 使用 chkconfig 管理服务

为了在引导时启动/禁止系统服务，我们需要使用`chkconfig`（在 CentOS/openSUSE）和`sys-rc-conf`（在 Debian 及其衍生版中）命令。这工具能够告诉我们在一个特定运行级别的服务预配置状态。

- 参考: [How to Stop and Disable Unwanted Services in Linux][4]

**列出一个服务的运行级别配置(Listing the runlevel configuration for a service)**

	# chkconfig --list [service name]
	# chkconfig --list postfix
	# chkconfig --list mysqld

![Listing Runlevel Configuration](http://www.tecmint.com/wp-content/uploads/2014/10/Listing-Runlevel-Configuration.png)

**运行级别配置列表(Listing Runlevel Configuration)**

在上图中我们能够看到 `postfix` 被设置为当系统进入级别 2~5 时启动，而 `mysqld` 默认是在级别 2~4 时运行。假设这些不是我们期望的行为。

例如，我们也需要在运行级别 5 启动`mysqld`，并且在级别 4 和 5 中关闭 `postfix`。这是我们要做的(以 root 权限执行以下命令)

**为一个特定的运行级别启动服务**

	# chkconfig --level [level(s)] service on
	# chkconfig --level 5 mysqld on

**为一个特定的运行级别禁止服务**

	# chkconfig --level [level(s)] service off
	# chkconfig --level 45 posifix off

![Enable Disable Services in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Enable-Disable-Services.png)

启动禁止服务

我们可以使用 `sysv-rc-conf` 在基于 Debian 的系统执行类似的操作。

#### 使用 `sysv-rc-conf` 管理服务
<font color=red>
设置一个服务使其能在一个特定的运行级别启动，禁止在其他运行级别启动。</font>


1. 我们用以下命令查看 `mdadm` 服务在哪些运行级别上启动。
```c
# ls -l /etc/rc[0-6].d | grep -E 'rc[0-6]|mdadm'
```

	![Check Runlevel of Service Running](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Service-Runlevel.png)

	查看服务的运行级别

2. 我们使用 `sysv-rc-conf` 命令禁止 `mdadm` 在除了 2 以外的运行级别中启动。根据需要（使用空格键）选择或取消（可以使用上下左右方向键移动）。
```
# sys-rc-conf
```
	![SysV Runlevel Config](http://www.tecmint.com/wp-content/uploads/2014/10/SysV-Runlevel-Config.png)
   
	Sys Runlevel Config

	然后按 q 退出

3. 重启系统并运行第一步中的命令

	```
	# ls -l /etc/rc[0-6].d ｜ grep -E 'rc[0-6]|mdadm'
	```
	![Verify Service Runlevel](http://www.tecmint.com/wp-content/uploads/2014/10/Verify-Service-Runlevel.png)

	验证服务运行级别

	在上图中我们可以看到 `mdadm` 被修改为只在运行级别 2 上启动。

### 什么是 systemd ？###

systemd 是较多 Linux 发行版采用的另一种系统服务管理软件。它允许系统启动期间进程并行启动（不像 sysinit 那么慢。因为 sysint 只能逐个启动进程，检查进程间依赖关系然后等待守护工作以启动更多服务），并且为系统动态管理资源。

因此，服务仅当需要时才被启动（以免浪费系统资源）而不是在引导时启动。

运行以下命令，查看系统中所有运行中服务进程的状态，**包括systemd native和SysV services**。

```
# systemctl
```

![Check All Running Processes in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Check-All-Running-Processes.png)

查看所有运行中的服务进程
