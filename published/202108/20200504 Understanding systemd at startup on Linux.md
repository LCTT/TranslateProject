[#]: collector: (lujun9972)
[#]: translator: (YungeG)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13720-1.html)
[#]: subject: (Understanding systemd at startup on Linux)
[#]: via: (https://opensource.com/article/20/5/systemd-startup)
[#]: author: (David Both https://opensource.com/users/dboth)

理解 systemd 启动时在做什么
======

> systemd 启动过程提供的重要线索可以在问题出现时助你一臂之力。

![](https://img.linux.net.cn/data/attachment/album/202108/26/110220piwnicwxvvc1s8io.jpg)

在本系列的第一篇文章《[学着爱上 systemd][2]》，我考察了 systemd 的功能和架构，以及围绕 systemd 作为古老的 SystemV 初始化程序和启动脚本的替代品的争论。在这第二篇文章中，我将开始探索管理 Linux 启动序列的文件和工具。我会解释 systemd 启动序列、如何更改默认的启动目标（即 SystemV 术语中的运行级别）、以及在不重启的情况下如何手动切换到不同的目标。

我还将考察两个重要的 systemd 工具。第一个 `systemctl` 命令是和 systemd 交互、向其发送命令的基本方式。第二个是 `journalctl`，用于访问 systemd 日志，后者包含了大量系统历史数据，比如内核和服务的消息（包括指示性信息和错误信息）。

务必使用一个非生产系统进行本文和后续文章中的测试和实验。你的测试系统需要安装一个 GUI 桌面（比如 Xfce、LXDE、Gnome、KDE 或其他）。

上一篇文章中我写道计划在这篇文章创建一个 systemd 单元并添加到启动序列。由于这篇文章比我预期中要长，这些内容将留到本系列的下一篇文章。

### 使用 systemd 探索 Linux 的启动

在观察启动序列之前，你需要做几件事情得使引导和启动序列开放可见。正常情况下，大多数发行版使用一个开机动画或者启动画面隐藏 Linux 启动和关机过程中的显示细节，在基于 Red Hat 的发行版中称作 Plymouth 引导画面。这些隐藏的消息能够向寻找信息以排除程序故障、或者只是学习启动序列的系统管理员提供大量有关系统启动和关闭的信息。你可以通过 GRUB（<ruby>大统一引导加载器<rt>Grand Unified Boot Loader</rt></ruby>）配置改变这个设置。

主要的 GRUB 配置文件是 `/boot/grub2/grub.cfg` ，但是这个文件在更新内核版本时会被覆盖，你不会想修改它的。相反，应该修改用于改变 `grub.cfg` 默认设置的 `/etc/default/grub` 文件。

首先看一下当前未修改的 `/etc/default/grub` 文件的版本：

```
[root@testvm1 ~]# cd /etc/default ; cat grub
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="resume=/dev/mapper/fedora_testvm1-swap rd.lvm.
lv=fedora_testvm1/root rd.lvm.lv=fedora_testvm1/swap rd.lvm.lv=fedora_
testvm1/usr rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
[root@testvm1 default]#
```

[GRUB 文档][3] 的第 6 章列出了 `/etc/default/grub` 文件的所有可用项，我只关注下面的部分：

  * 我将 GRUB 菜单倒计时的秒数 `GRUB_TIMEOUT`，从 5 改成 10，以便在倒计时达到 0 之前有更多的时间响应 GRUB 菜单。
  * `GRUB_CMDLINE_LINUX` 列出了引导阶段传递给内核的命令行参数，我删除了其中的最后两个参数。其中的一个参数 `rhgb` 代表 “<ruby>红帽图形化引导<rt>Red Hat Graphical Boot</rt></ruby>”，在内核初始化阶段显示一个小小的 Fedora 图标动画，而不是显示引导阶段的信息。另一个参数 `quiet`，屏蔽显示记录了启动进度和发生错误的消息。系统管理员需要这些信息，因此我删除了 `rhgb` 和 `quiet`。如果引导阶段发生了错误，屏幕上显示的信息可以指向故障的原因。

更改之后，你的 GRUB 文件将会像下面一样：

```
[root@testvm1 default]# cat grub
GRUB_TIMEOUT=10
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="resume=/dev/mapper/fedora_testvm1-swap rd.lvm.
lv=fedora_testvm1/root rd.lvm.lv=fedora_testvm1/swap rd.lvm.lv=fedora_
testvm1/usr"
GRUB_DISABLE_RECOVERY="false"
[root@testvm1 default]#
```

`grub2-mkconfig` 程序使用 `/etc/default/grub` 文件的内容生成 `grub.cfg` 配置文件，从而改变一些默认的 GRUB 设置。`grub2-mkconfig` 输出到 `STDOUT`，你可以使用程序的 `-o` 参数指明数据流输出的文件，不过使用重定向也同样简单。执行下面的命令更新 `/boot/grub2/grub.cfg` 配置文件：

```
[root@testvm1 grub2]# grub2-mkconfig > /boot/grub2/grub.cfg
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-4.18.9-200.fc28.x86_64
Found initrd image: /boot/initramfs-4.18.9-200.fc28.x86_64.img
Found linux image: /boot/vmlinuz-4.17.14-202.fc28.x86_64
Found initrd image: /boot/initramfs-4.17.14-202.fc28.x86_64.img
Found linux image: /boot/vmlinuz-4.16.3-301.fc28.x86_64
Found initrd image: /boot/initramfs-4.16.3-301.fc28.x86_64.img
Found linux image: /boot/vmlinuz-0-rescue-7f12524278bd40e9b10a085bc82dc504
Found initrd image: /boot/initramfs-0-rescue-7f12524278bd40e9b10a085bc82dc504.img
done
[root@testvm1 grub2]#
```

重新启动你的测试系统查看本来会隐藏在 Plymouth 开机动画之下的启动信息。但是如果你没有关闭开机动画，又需要查看启动信息的话又该如何操作？或者你关闭了开机动画，而消息流过的速度太快，无法阅读怎么办？（实际情况如此。）

有两个解决方案，都涉及到日志文件和 systemd 日志 —— 两个都是你的好伙伴。你可以使用 `less` 命令查看 `/var/log/messages` 文件的内容。这个文件包含引导和启动信息，以及操作系统执行正常操作时生成的信息。你也可以使用不加任何参数的 `journalctl` 命令查看 systemd 日志，包含基本相同的信息：

```
[root@testvm1 grub2]# journalctl
-- Logs begin at Sat 2020-01-11 21:48:08 EST, end at Fri 2020-04-03 08:54:30 EDT. --
Jan 11 21:48:08 f31vm.both.org kernel: Linux version 5.3.7-301.fc31.x86_64 (mockbuild@bkernel03.phx2.fedoraproject.org) (gcc version 9.2.1 20190827 (Red Hat 9.2.1-1) (GCC)) #1 SMP Mon Oct >
Jan 11 21:48:08 f31vm.both.org kernel: Command line: BOOT_IMAGE=(hd0,msdos1)/vmlinuz-5.3.7-301.fc31.x86_64 root=/dev/mapper/VG01-root ro resume=/dev/mapper/VG01-swap rd.lvm.lv=VG01/root rd>
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Jan 11 21:48:08 f31vm.both.org kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-provided physical RAM map:
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x0000000000100000-0x00000000dffeffff] usable
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000dfff0000-0x00000000dfffffff] ACPI data
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
Jan 11 21:48:08 f31vm.both.org kernel: BIOS-e820: [mem 0x0000000100000000-0x000000041fffffff] usable
Jan 11 21:48:08 f31vm.both.org kernel: NX (Execute Disable) protection: active
Jan 11 21:48:08 f31vm.both.org kernel: SMBIOS 2.5 present.
Jan 11 21:48:08 f31vm.both.org kernel: DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
Jan 11 21:48:08 f31vm.both.org kernel: Hypervisor detected: KVM
Jan 11 21:48:08 f31vm.both.org kernel: kvm-clock: Using msrs 4b564d01 and 4b564d00
Jan 11 21:48:08 f31vm.both.org kernel: kvm-clock: cpu 0, msr 30ae01001, primary cpu clock
Jan 11 21:48:08 f31vm.both.org kernel: kvm-clock: using sched offset of 8250734066 cycles
Jan 11 21:48:08 f31vm.both.org kernel: clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
Jan 11 21:48:08 f31vm.both.org kernel: tsc: Detected 2807.992 MHz processor
Jan 11 21:48:08 f31vm.both.org kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Jan 11 21:48:08 f31vm.both.org kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
<snip>
```

由于数据流可能长达几十万甚至几百万行，我在这里截断了它。（我的主要工作站上列出的日志长度是 1,188,482 行。）请确保是在你的测试系统尝试的这个命令。如果系统已经运行了一段时间 —— 即使重启过很多次 —— 还是会显示大量的数据。查看这些日志数据，因为它包含了很多信息，在进行问题判断时可能非常有用。了解这个数据文件在正常的引导和启动过程中的模样，可以帮助你在问题出现时定位问题。

我将在本系列之后的文章讨论 systemd 日志、`journalctl` 命令、以及如何整理输出的日志数据来寻找更详细的信息。

内核被 GRUB 加载到内存后，必须先将自己从压缩后的文件中解压出来，才能执行任何有意义的操作。解压自己后，内核开始运行，加载 systemd 并转交控制权。

<ruby>引导<rt>boot</rt></ruby>阶段到此结束，此时 Linux 内核和 systemd 正在运行，但是无法为用户执行任何生产性任务，因为其他的程序都没有执行，没有命令行解释器提供命令行，没有后台进程管理网络和其他的通信链接，也没有任何东西能够控制计算机执行生产功能。

现在 systemd 可以加载所需的功能性单元以便将系统启动到选择的目标运行状态。

### 目标

一个 systemd <ruby>目标<rt>target</rt></ruby>代表一个 Linux 系统当前的或期望的运行状态。与 SystemV 启动脚本十分类似，目标定义了系统运行必须存在的服务，以及处于目标状态下必须激活的服务。图表 1 展示了使用 systemd 的 Linux 系统可能的运行状态目标。就像在本系列的第一篇文章以及 systemd 启动的手册页（`man bootup`）所看到的一样，有一些开启不同必要服务的其他中间目标，包括 `swap.target`、`timers.target`、`local-fs.target` 等。一些目标（像 `basic.target`）作为检查点使用，在移动到下一个更高级的目标之前保证所有需要的服务已经启动并运行。

除非开机时在 GRUB 菜单进行更改，systemd 总是启动 `default.target`。`default.target` 文件是指向真实的目标文件的符号链接。对于桌面工作站，`default.target` 通常是 `graphical.target`，等同于 SystemV 的运行等级 5。对于服务器，默认目标多半是 `multi-user.target`，就像 SystemV 的运行等级 3。`emergency.target` 文件类似单用户模式。目标和<ruby>服务<rt>service</rt></ruby>都是一种 systemd 单元。

下面的图表，包含在本系列的上一篇文章中，比较了 systemd 目标和古老的 SystemV 启动运行等级。为了向后兼容，systemd 提供了 systemd 目标别名，允许脚本和系统管理员使用像 `init 3` 一样的 SystemV 命令改变运行等级。当然，SystemV 命令被转发给 systemd 进行解释和执行。

**systemd 目标** | **SystemV 运行级别** | **目标别名** | **描述**
---|---|---|---
| `default.target` |  |  | 这个目标通常是一个符号链接，作为 `multi-user.target` 或 `graphical.target` 的别名。systemd 总是用 `default.target` 启动系统。`default.target** 不能作为 `halt.target`、`poweroff.target` 和 `reboot.target` 的别名。| 
| `graphical.target` | 5 | `runlevel5.target` | 带有 GUI 的 `multi-user.target` 。|
| | 4 | `runlevel4.target` | 未使用。运行等级 4 和 SystemV 的运行等级 3 一致，可以创建这个目标并进行定制，用于启动本地服务，而不必更改默认的 `multi-user.target`。 |
| `multi-user.target` | 3 | `runlevel3.target` | 运行所有的服务，但是只有命令行界面（CLI） 。|
| | 2 | `runlevel2.target` | 多用户，没有 NFS，但是运行其他所有的非 GUI 服务 
| `rescue.target` | 1 | `runlevel1.target` | 一个基本的系统，包括挂载文件系统，但是只运行最基础的服务，以及一个主控制台上的用于救援的命令行解释器。|
| `emergency.target` | S |  | 单用户模式 —— 没有服务运行；文件系统没有挂载。这是最基础级的操作模式，只有一个运行在主控制台的用于紧急情况的命令行解释器，供用户和系统交互。 |
| `halt.target` |  |  | 不断电的情况下停止系统 |
| `reboot.target` | 6 | `runlevel6.target` | 重启 |
| `poweroff.target` | 0 | `runlevel0.target` | 停止系统并关闭电源 |

每个目标在配置文件中都描述了一组依赖关系。systemd 启动需要的依赖，即 Linux 主机运行在特定功能级别所需的服务。加载目标配置文件中列出的所有依赖并运行后，系统就运行在那个目标等级。如果愿意，你可以在本系列的第一篇文章《[学着爱上 systemd][2]》中回顾 systemd 的启动序列和运行时目标。

### 探索当前的目标

许多 Linux 发行版默认安装一个 GUI 桌面界面，以便安装的系统可以像工作站一样使用。我总是从 Fedora Live USB 引导驱动器安装 Xfce 或 LXDE 桌面。即使是安装一个服务器或者其他基础类型的主机（比如用于路由器和防火墙的主机），我也使用  GUI 桌面的安装方式。

我可以安装一个没有桌面的服务器（数据中心的典型做法），但是这样不满足我的需求。原因不是我需要 GUI 桌面本身，而是 LXDE 安装包含了许多其他默认的服务器安装没有提供的工具，这意味着初始安装之后我需要做的工作更少。

但是，仅仅因为有 GUI 桌面并不意味着我要使用它。我有一个 16 端口的 KVM，可以用于访问我的大部分 Linux 系统的 KVM 接口，但我和它们交互的大部分交互是通过从我的主要工作站建立的远程 SSH 连接。这种方式更安全，而且和 `graphical.target` 相比，运行 `multi-user.target` 使用更少的系统资源。

首先，检查默认目标，确认是 `graphical.target`：

```
[root@testvm1 ~]# systemctl get-default
graphical.target
[root@testvm1 ~]#
```

然后确认当前正在运行的目标，应该和默认目标相同。你仍可以使用老方法，输出古老的 SystemV 运行等级。注意，前一个运行等级在左边，这里是 `N`（意思是 None），表示主机启动后没有修改过运行等级。数字 5 是当前的目标，正如古老的 SystemV 术语中的定义：

```
[root@testvm1 ~]# runlevel
N 5
[root@testvm1 ~]#
```

注意，`runlevel` 的手册页指出运行等级已经被淘汰，并提供了一个转换表。

你也可以使用 systemd 方式，命令的输出有很多行，但确实用 systemd 术语提供了答案：

```
[root@testvm1 ~]# systemctl list-units --type target
UNIT                   LOAD   ACTIVE SUB    DESCRIPTION                
basic.target           loaded active active Basic System              
cryptsetup.target      loaded active active Local Encrypted Volumes    
getty.target           loaded active active Login Prompts              
graphical.target       loaded active active Graphical Interface        
local-fs-pre.target    loaded active active Local File Systems (Pre)  
local-fs.target        loaded active active Local File Systems        
multi-user.target      loaded active active Multi-User System          
network-online.target  loaded active active Network is Online          
network.target         loaded active active Network                    
nfs-client.target      loaded active active NFS client services        
nss-user-lookup.target loaded active active User and Group Name Lookups
paths.target           loaded active active Paths                      
remote-fs-pre.target   loaded active active Remote File Systems (Pre)  
remote-fs.target       loaded active active Remote File Systems        
rpc_pipefs.target      loaded active active rpc_pipefs.target          
slices.target          loaded active active Slices                    
sockets.target         loaded active active Sockets                    
sshd-keygen.target     loaded active active sshd-keygen.target        
swap.target            loaded active active Swap                      
sysinit.target         loaded active active System Initialization      
timers.target          loaded active active Timers                    

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

21 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
```

上面列出了当前加载的和激活的目标，你也可以看到 `graphical.target` 和 `multi-user.target`。`multi-user.target` 需要在 `graphical.target` 之前加载。这个例子中，`graphical.target` 是激活的。

### 切换到不同的目标

切换到 `multi-user.target` 很简单：

```
[root@testvm1 ~]# systemctl isolate multi-user.target
```

显示器现在应该从 GUI 桌面或登录界面切换到了一个虚拟控制台。登录并列出当前激活的 systemd 单元，确认 `graphical.target` 不再运行：

```
[root@testvm1 ~]# systemctl list-units --type target
```

务必使用 `runlevel` 确认命令输出了之前的和当前的“运行等级”：

```
[root@testvm1 ~]# runlevel
5 3
```

### 更改默认目标

现在，将默认目标改为 `multi-user.target`，以便系统总是启动进入 `multi-user.target`，从而使用控制台命令行接口而不是 GUI 桌面接口。使用你的测试主机的根用户，切换到保存 systemd 配置的目录，执行一次快速列出操作：

```
[root@testvm1 ~]# cd /etc/systemd/system/ ; ll
drwxr-xr-x. 2 root root 4096 Apr 25  2018  basic.target.wants
&lt;snip&gt;
lrwxrwxrwx. 1 root root   36 Aug 13 16:23  default.target -> /lib/systemd/system/graphical.target
lrwxrwxrwx. 1 root root   39 Apr 25  2018  display-manager.service -> /usr/lib/systemd/system/lightdm.service
drwxr-xr-x. 2 root root 4096 Apr 25  2018  getty.target.wants
drwxr-xr-x. 2 root root 4096 Aug 18 10:16  graphical.target.wants
drwxr-xr-x. 2 root root 4096 Apr 25  2018  local-fs.target.wants
drwxr-xr-x. 2 root root 4096 Oct 30 16:54  multi-user.target.wants
&lt;snip&gt;
[root@testvm1 system]#
```

为了强调一些有助于解释 systemd 如何管理启动过程的重要事项，我缩短了这个列表。你应该可以在虚拟机看到完整的目录和链接列表。

`default.target` 项是指向目录 `/lib/systemd/system/graphical.target` 的符号链接（软链接），列出那个目录查看目录中的其他内容：

```
[root@testvm1 system]# ll /lib/systemd/system/ | less
```

你应该在这个列表中看到文件、目录、以及更多链接，但是专门寻找一下 `multi-user.target` 和 `graphical.target`。现在列出 `default.target`（指向 `/lib/systemd/system/graphical.target` 的链接）的内容：

```
[root@testvm1 system]# cat default.target
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes
[root@testvm1 system]#
```

`graphical.target` 文件的这个链接描述了图形用户接口需要的所有必备条件。我会在本系列的下一篇文章至少探讨其中的一些选项。

为了使主机启动到多用户模式，你需要删除已有的链接，创建一个新链接指向正确目标。如果你的 [PWD][5] 不是 `/etc/systemd/system`，切换过去：

```
[root@testvm1 system]# rm -f default.target
[root@testvm1 system]# ln -s /lib/systemd/system/multi-user.target default.target
```

列出 `default.target` 链接，确认其指向了正确的文件：

```
[root@testvm1 system]# ll default.target
lrwxrwxrwx 1 root root 37 Nov 28 16:08 default.target -&gt; /lib/systemd/system/multi-user.target
[root@testvm1 system]#
```

如果你的链接看起来不一样，删除并重试。列出 `default.target` 链接的内容：

```
[root@testvm1 system]# cat default.target
#  SPDX-License-Identifier: LGPL-2.1+
#
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Multi-User System
Documentation=man:systemd.special(7)
Requires=basic.target
Conflicts=rescue.service rescue.target
After=basic.target rescue.service rescue.target
AllowIsolate=yes
[root@testvm1 system]#
```

`default.target`（这里其实是指向 `multi-user.target` 的链接）其中的 `[Unit]` 部分现在有不同的必需条件。这个目标不需要有图形显示管理器。

重启，你的虚拟机应该启动到虚拟控制台 1 的控制台登录，虚拟控制台 1 在显示器标识为 `tty1`。现在你已经知道如何修改默认的目标，使用所需的命令将默认目标改回 `graphical.target`。

首先检查当前的默认目标：

```
[root@testvm1 ~]# systemctl get-default
multi-user.target
[root@testvm1 ~]# systemctl set-default graphical.target
Removed /etc/systemd/system/default.target.
Created symlink /etc/systemd/system/default.target → /usr/lib/systemd/system/graphical.target.
[root@testvm1 ~]#
```

输入下面的命令直接切换到 `graphical.target` 和显示管理器的登录界面，不需要重启：

```
[root@testvm1 system]# systemctl isolate default.target
```

我不清楚为何 systemd 的开发者选择了术语 `isolate` 作为这个子命令。我的研究表明指的可能是运行指明的目标，但是“隔离”并终结其他所有启动该目标不需要的目标。然而，命令执行的效果是从一个运行的目标切换到另一个——在这个例子中，从多用户目标切换到图形目标。上面的命令等同于 SystemV 启动脚本和 `init` 程序中古老的 `init 5` 命令。

登录 GUI 桌面，确认能正常工作。

### 总结

本文探索了 Linux systemd 启动序列，开始探讨两个重要的 systemd 工具 `systemdctl` 和 `journalctl`，还说明了如何从一个目标切换到另一个目标，以及如何修改默认目标。

本系列的下一篇文章中将会创建一个新的 systemd 单元，并配置为启动阶段运行。下一篇文章还会查看一些配置选项，可以帮助确定某个特定的单元在序列中启动的位置，比如在网络启动运行后。

### 资源

关于 systemd 网络上有大量的信息，但大部分都简短生硬、愚钝、甚至令人误解。除了本文提到的资源，下面的网页提供了关于 systemd 启动更详细可靠的信息。

  * Fedora 项目有一个优质实用的 [systemd 指南][6]，几乎有你使用 systemd 配置、管理、维护一个 Fedora 计算机需要知道的一切。
  * Fedora 项目还有一个好用的 [速查表][7]，交叉引用了古老的 SystemV 命令和对应的 systemd 命令。
  * 要获取 systemd 的详细技术信息和创立的原因，查看 [Freedesktop.org][8] 的 [systemd 描述][9]。
  * Linux.com 上“systemd 的更多乐趣”提供了更高级的 systemd [信息和提示][11]。

还有一系列针对系统管理员的深层技术文章，由 systemd 的设计者和主要开发者 Lennart Poettering 所作。这些文章写于 2010 年 4 月到 2011 年 9 月之间，但在当下仍然像当时一样有价值。关于 systemd 及其生态的许多其他优秀的作品都是基于这些文章的。

  * [Rethinking PID 1][12]
  * [systemd for Administrators, Part I][13]
  * [systemd for Administrators, Part II][14]
  * [systemd for Administrators, Part III][15]
  * [systemd for Administrators, Part IV][16]
  * [systemd for Administrators, Part V][17]
  * [systemd for Administrators, Part VI][18]
  * [systemd for Administrators, Part VII][19]
  * [systemd for Administrators, Part VIII][20]
  * [systemd for Administrators, Part IX][21]
  * [systemd for Administrators, Part X][22]
  * [systemd for Administrators, Part XI][23]


--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/systemd-startup

作者：[David Both][a]
选题：[lujun9972][b]
译者：[YungeG](https://github.com/YungeG)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/start_line.jpg?itok=9reaaW6m (People at the start line of a race)
[2]: https://opensource.com/article/20/4/systemd
[3]: http://www.gnu.org/software/grub/manual/grub
[4]: mailto:mockbuild@bkernel03.phx2.fedoraproject.org
[5]: https://en.wikipedia.org/wiki/Pwd
[6]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[7]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[8]: http://Freedesktop.org
[9]: http://www.freedesktop.org/wiki/Software/systemd
[10]: http://Linux.com
[11]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[12]: http://0pointer.de/blog/projects/systemd.html
[13]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[14]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[16]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[17]: http://0pointer.de/blog/projects/three-levels-of-off.html
[18]: http://0pointer.de/blog/projects/changing-roots
[19]: http://0pointer.de/blog/projects/blame-game.html
[20]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[21]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[22]: http://0pointer.de/blog/projects/instances.html
[23]: http://0pointer.de/blog/projects/inetd.html
