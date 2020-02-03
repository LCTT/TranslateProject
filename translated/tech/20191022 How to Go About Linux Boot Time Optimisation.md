[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Go About Linux Boot Time Optimisation)
[#]: via: (https://opensourceforu.com/2019/10/how-to-go-about-linux-boot-time-optimisation/)
[#]: author: (B Thangaraju https://opensourceforu.com/author/b-thangaraju/)

如何进行 Linux 启动时间优化
======

[![][1]][2]

_快速启动一台嵌入式设备或一台电信设备，对于时间要求严格的应用程序是至关重要的，并且在改善用户体验方面也起着非常重要的作用。这个文件给予一些关于如何增强任意设备的启动时间的重要技巧。_

快速启动或快速重启在各种情况下起着至关重要的作用。对于一套嵌入式设备来说，开始启动是为了保持所有服务的高可用性和更好的性能。设想一台电信设备运行一套没有启用快速启动的 Linux 操作系统。依赖于这个特殊嵌入式设备的所有的系统，服务和用户可能会受到影响。这些设备在其服务中维持高可用性是非常重要的，为此，快速启动和重启起着至关重要的作用。

一台电信设备的一次小故障或关机，甚至几秒钟，都可能会对无数在因特网上工作的用户造成破坏。因此，对于很多对时间要求严格的设备和电信设备来说，在它们的服务中包含快速启动以帮助它们快速重新开始工作是非常重要的。让我们从图表 1 中理解 Linux 启动过程。

![Figure 1: Boot-up procedure][3]

![Figure 2: Boot chart][4]

**监视工具和启动过程**
A user should take note of a number of factors before making changes to a machine.这包括机器的当前启动速度，以及服务，进程或应用程序 These include the current booting speed of the machine and also the services, processes or applications that are taking up resources and increasing the boot-up time.

**Boot chart:** 为监视启动速度和在启动期间启动的各种服务，用户可以使用下面的命令来安装 boot chart：

```
sudo apt-get install pybootchartgui.
```

你每次启动时，boot chart 在日志中保存一个 _.png_ (便携式网络图片)文件，使用户能够查看 _png_ 文件来理解系统的启动过程和服务。为此，使用下面的命令：

```
cd /var/log/bootchart
```

用户可能需要一个应用程序来查看 _.png_ 文件。Feh 是一个面向控制台用户的 X11 图像查看器。不像大多数其它的图像查看器，它没有一个精致的图形用户界面，但是它仅仅显示图片。Feh 可以用于查看 _.png_ 文件。你可以使用下面的命令来安装它：

```
sudo apt-get install feh
```

你可以使用 _feh xxxx.png_ 来查看 _png_ 文件。

图表 2 显示查看一个 boot chart 的 _png_ 文件时的启动图表。

但是，对于 Ubuntu 15.10 以后的版本不再需要 boot chart 。 为获取关于启动速度的简短信息，使用下面的命令：

```
systemd-analyze
```

![Figure 3: Output of systemd-analyze][5]

图表 3 显示命令 _systemd-analyze_ 的输出。

命令 _systemd-analyze_ blame 用于打印所有正在运行的基于初始化所用的时间的单元。这个信息是非常有用的，并且可用于优化启动时间。systemd-analyze blame 不会显示服务于使用 _Type=simple_ 的结果，因为 systemd 认为这些服务是立即启动的；因此，不能完成测量初始化的延迟。

![Figure 4: Output of systemd-analyze blame][6]

图表 4 显示 _systemd-analyze_ blame 的输出.

下面的命令打印一个单元的时间关键的链的树：

```
command systemd-analyze critical-chain
```

图表 5 显示命令_systemd-analyze critical-chain_ 的输出。

![Figure 5: Output of systemd-analyze critical-chain][7]

**减少启动时间的步骤**
下面显示的是一些可采取的用于减少启动时间的步骤。

**BUM (启动管理器):** BUM 是一个运行级配置编辑器，当系统启动或重启时，允许 _init_ 服务的配置。它显示在启动时可以启动的每个服务的一个列表。用户可以打开和关闭之间切换个别的服务。 BUM 有一个非常干净的图形用户界面，并且非常容易使用。

在 Ubuntu 14.04 中， BUM 可以使用下面的命令安装：

```
sudo apt-get install bum
```

为在 15.10 以后的版本中安装它，从链接 _<http://apt.ubuntu.com/p/bum> 13_ 下载软件包。

以基础的事开始，禁用扫描仪和打印机相关的服务。如果你没有使用蓝牙和其它不想要的设备和服务，你也可以禁用它们中一些。我强烈建议你在禁用相关的服务前学习它们的基础知识，因为它可能会影响机器或操作系统。图表 6 显示 BUM 的图形用户界面。

![Figure 6: BUM][8]

**编辑 rc 文件：** 为编辑 rc 文件，你需要转到 rc 目录。这可以使用下面的命令来做到：

```
cd /etc/init.d.
```

然而，访问 _init.d_ 需要 root 用户权限，它基本上包含了开始/停止脚本，当系统在运行时或在启动期间，控制(开始，停止，重新加载，启动启动)守护进程。

_rc_ 文件在 _init.d_ 中被称为一个运行控制脚本。在启动期间，init 执行 _rc_ 脚本并发挥它的作用。为改善启动速度，我们更改 _rc_ 文件。使用任意的文件编辑器打开 _rc_ 文件(当你在 _init.d_ 目录中时)。

例如，通过输入 _vim rc_ ，你可以更改 _CONCURRENCY=none_ 的值为 _CONCURRENCY=shell_ 。后者允许同时执行某些起始阶段的脚本，而不是连续地间断地交替执行。

在最新版本的内核中，该值应该被更改为 _CONCURRENCY=makeﬁle_ 。
图表 7 和 8 显示编辑 rc 文件前后的启动时间的比较。启动速度的改善可以被注意到。在编辑The time to boot before editing the rc 文件前的启动时间是 50.98 秒，然而在对 rc 文件进行更改后的启动时间是 23.85 秒。
但是，上面提及的更改方法在 Ubuntu 15.10 以后的操作系统上不工作，因为使用最新内核的操作系统使用 systemd 文件，而不再是 _init.d_ 文件。

![Figure 7: Boot speed before making changes to the rc file][9]

![Figure 8: Boot speed after making changes to the rc file][10]

**E4rat:** E4rat 代表 e4 ‘减少访问时间’ (仅在 ext4 文件系统的情况下). 它是由 Andreas Rid 和 Gundolf Kiefer 开发的一个项目. E4rat 是一个在碎片整理的帮助下来达到一次快速启动的应用程序。它也加速应用程序的启动。E4rat 排除使用物理文件重新分配的寻道时间和旋转延迟。这导致一个高速的磁盘传输速度。
E4rat 作为一个可以获得的 .deb 软件包，你可以从它的官方网站 _<http://e4rat.sourceforge.net/>_ 下载它.

Ubuntu 默认的 ureadahead 软件包与 e4rat 冲突。因此不得不使用下面的命令安装几个软件包：

```
sudo dpkg purge ureadahead ubuntu-minimal
```

现在使用下面的命令来安装 e4rat 的依赖关系：

```
sudo apt-get install libblkid1 e2fslibs
```

打开下载的 _.deb_ 文件，并安装它。现在需要恰当地收集启动数据来使 e4rat 工作。

遵循下面所给的步骤来使 e4rat 正确地运行，并提高启动速度。

  * 在启动期间访问 Grub 菜单。这可以在系统启动时通过按住 shift 按键来完成。
  * 选择通常用于启动的选项(内核版本)，并按 ‘e’ 。
  * 查找以 _linux /boot/vmlinuz_ 开头的行，并在该行的末尾添加下面的代码(在句子的最后一个字母后按空格键)：



```
- init=/sbin/e4rat-collect or try - quiet splash vt.handsoff =7 init=/sbin/e4rat-collect
```

  * 现在，按 _Ctrl+x_ 来继续启动。这让 e4rat 在启动后收集数据。在机器上工作，打开应用程序，并在接下来的两分钟时间内关闭应用程序。
  * 通过转到 e4rat 文件夹，并使用下面的命令来访问日志文件：



```
cd /var/log/e4rat
```

  * 如果你没有找到任何日志文件，重复上面的过程。一旦日志文件在这里，再次访问 Grub 菜单，并按 ‘e’ 作为你的选项。
  * 在你之前已经编辑过的同一行的末尾输入 ‘single’ 。这将帮助你访问命令行。如果出现一个要求任何东西的不同菜单，选择恢复正常启动（Resume normal boot）。如果你不知为何不能进入命令提示符，按 Ctrl+Alt+F1 组合键。
  * 在你看到登录提示后，输入你的详细信息。
  * 现在输入下面的命令：



```
sudo e4rat-realloc /var/lib/e4rat/startup.log
```

这个进程需要一段时间，依赖于机器的磁盘速度。

  * 现在使用下面的命令来重启你的机器：



```
sudo shutdown -r now
```

  * 现在，我们需要配置 Grub 来在每次启动时运行 e4rat 。
  * 使用任意的编辑器访问 grub 文件。例如， _gksu gedit /etc/default/grub 。_
  * 查找以 _GRUB CMDLINE LINUX DEFAULT=_ 开头的一行，并在引号之间和任何选项之前添加下面的行：



```
init=/sbin/e4rat-preload 18
```

  * 它应该看起来像这样：



```
GRUB CMDLINE LINUX DEFAULT = init=/sbin/e4rat- preload quiet splash
```

  * 保存并关闭 Grub 菜单，并使用 _sudo update-grub_ 更新 Grub 。
  * 重启系统，你将在启动速度方面发现显著的变化。



图表 9 和 10 显示在安装 e4rat 前后的启动时间的不同。启动速度的改善可以被注意到。在使用 e4rat 前启动所用时间是 22.32 秒，然而在使用 e4rat 后启动所用时间是 9.065 秒。

![Figure 9: Boot speed before using e4rat][11]

![Figure 10: Boot speed after using e4rat][12]

**一些易做的调整**

一个极好的启动速度也可以使用非常小的调整来实现，其中两个在下面列出。
**SSD:** 使用固态设备而不是普通的硬盘或者其它的存储设备将肯定会改善启动速度。SSD 也帮助获得在传输文件和运行应用程序方面的极好速度。

**禁用图形用户界面：** 图形用户界面，桌面图形和窗口动画占用大量的资源。禁用图形用户界面是另一个实现极好的启动速度的好方法。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/how-to-go-about-linux-boot-time-optimisation/

作者：[B Thangaraju][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/b-thangaraju/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Screenshot-from-2019-10-07-13-16-32.png?resize=696%2C496&ssl=1 (Screenshot from 2019-10-07 13-16-32)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Screenshot-from-2019-10-07-13-16-32.png?fit=700%2C499&ssl=1
[3]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-1.png?resize=350%2C302&ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-2.png?resize=350%2C412&ssl=1
[5]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-3.png?resize=350%2C69&ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-4.png?resize=350%2C535&ssl=1
[7]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-5.png?resize=350%2C206&ssl=1
[8]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-6.png?resize=350%2C449&ssl=1
[9]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-7.png?resize=350%2C85&ssl=1
[10]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-8.png?resize=350%2C72&ssl=1
[11]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-9.png?resize=350%2C61&ssl=1
[12]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-10.png?resize=350%2C61&ssl=1
