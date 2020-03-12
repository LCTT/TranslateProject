[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11881-1.html)
[#]: subject: (How to Go About Linux Boot Time Optimisation)
[#]: via: (https://opensourceforu.com/2019/10/how-to-go-about-linux-boot-time-optimisation/)
[#]: author: (B Thangaraju https://opensourceforu.com/author/b-thangaraju/)

如何进行 Linux 启动时间优化
======

![][2]

> 快速启动嵌入式设备或电信设备，对于时间要求紧迫的应用程序是至关重要的，并且在改善用户体验方面也起着非常重要的作用。这个文章给予一些关于如何增强任意设备的启动时间的重要技巧。

快速启动或快速重启在各种情况下起着至关重要的作用。为了保持所有服务的高可用性和更好的性能，嵌入式设备的快速启动至关重要。设想有一台运行着没有启用快速启动的 Linux 操作系统的电信设备，所有依赖于这个特殊嵌入式设备的系统、服务和用户可能会受到影响。这些设备维持其服务的高可用性是非常重要的，为此，快速启动和重启起着至关重要的作用。

一台电信设备的一次小故障或关机，即使只是几秒钟，都可能会对无数互联网上的用户造成破坏。因此，对于很多对时间要求严格的设备和电信设备来说，在它们的设备中加入快速启动的功能以帮助它们快速恢复工作是非常重要的。让我们从图 1 中理解 Linux 启动过程。

![图 1：启动过程][3]

### 监视工具和启动过程

在对机器做出更改之前，用户应注意许多因素。其中包括计算机的当前启动速度，以及占用资源并增加启动时间的服务、进程或应用程序。

#### 启动图

为监视启动速度和在启动期间启动的各种服务，用户可以使用下面的命令来安装：

```
sudo apt-get install pybootchartgui
```

你每次启动时，启动图会在日志中保存一个 png 文件，使用户能够查看该 png 文件来理解系统的启动过程和服务。为此，使用下面的命令：

```
cd /var/log/bootchart
```

用户可能需要一个应用程序来查看 png 文件。Feh 是一个面向控制台用户的 X11 图像查看器。不像大多数其它的图像查看器，它没有一个精致的图形用户界面，但它只用来显示图片。Feh 可以用于查看 png 文件。你可以使用下面的命令来安装它：

```
sudo apt-get install feh
```

你可以使用 `feh xxxx.png` 来查看 png 文件。


![图 2：启动图][4]

图 2 显示了一个正在查看的引导图 png 文件。

#### systemd-analyze

但是，对于 Ubuntu 15.10 以后的版本不再需要引导图。为获取关于启动速度的简短信息，使用下面的命令：

```
systemd-analyze
```

![图 3：systemd-analyze 的输出][5]

图表 3 显示命令 `systemd-analyze` 的输出。

命令 `systemd-analyze blame` 用于根据初始化所用的时间打印所有正在运行的单元的列表。这个信息是非常有用的，可用于优化启动时间。`systemd-analyze blame` 不会显示服务类型为简单（`Type=simple`）的服务，因为 systemd 认为这些服务应是立即启动的；因此，无法测量初始化的延迟。

![图 4：systemd-analyze blame 的输出][6]

图 4 显示 `systemd-analyze blame` 的输出。

下面的命令打印时间关键的服务单元的树形链条：

```
command systemd-analyze critical-chain
```

图 5 显示命令 `systemd-analyze critical-chain` 的输出。

![图 5：systemd-analyze critical-chain 的输出][7]

### 减少启动时间的步骤

下面显示的是一些可以减少启动时间的各种步骤。

#### BUM（启动管理器）

BUM 是一个运行级配置编辑器，允许在系统启动或重启时配置初始化服务。它显示了可以在启动时启动的每个服务的列表。用户可以打开和关闭各个服务。BUM 有一个非常清晰的图形用户界面，并且非常容易使用。

在 Ubuntu 14.04 中，BUM 可以使用下面的命令安装：

```
sudo apt-get install bum
```

为在 15.10 以后的版本中安装它，从链接 http://apt.ubuntu.com/p/bum 下载软件包。

以基本的服务开始，禁用扫描仪和打印机相关的服务。如果你没有使用蓝牙和其它不想要的设备和服务，你也可以禁用它们中一些。我强烈建议你在禁用相关的服务前学习服务的基础知识，因为这可能会影响计算机或操作系统。图 6 显示 BUM 的图形用户界面。

![图 6：BUM][8]

#### 编辑 rc 文件

要编辑 rc 文件，你需要转到 rc 目录。这可以使用下面的命令来做到：

```
cd /etc/init.d
```

然而，访问 `init.d` 需要 root 用户权限，该目录基本上包含的是开始/停止脚本，这些脚本用于在系统运行时或启动期间控制（开始、停止、重新加载、启动启动）守护进程。

在 `init.d` 目录中的 `rc` 文件被称为<ruby>运行控制<rt>run control</rt></ruby>脚本。在启动期间，`init` 执行 `rc` 脚本并发挥它的作用。为改善启动速度，我们可以更改 `rc` 文件。使用任意的文件编辑器打开 `rc` 文件（当你在 `init.d` 目录中时）。

例如，通过输入 `vim rc` ，你可以更改 `CONCURRENCY=none` 为 `CONCURRENCY=shell`。后者允许某些启动脚本同时执行，而不是依序执行。

在最新版本的内核中，该值应该被更改为 `CONCURRENCY=makeﬁle`。

图 7 和图 8 显示编辑 `rc` 文件前后的启动时间比较。可以注意到启动速度有所提高。在编辑 `rc` 文件前的启动时间是 50.98 秒，然而在对 `rc` 文件进行更改后的启动时间是 23.85 秒。

但是，上面提及的更改方法在 Ubuntu 15.10 以后的操作系统上不工作，因为使用最新内核的操作系统使用 systemd 文件，而不再是 `init.d` 文件。

![图 7：对 rc 文件进行更改之前的启动速度][9]

![图 8：对 rc 文件进行更改之后的启动速度][10]

#### E4rat

E4rat 代表 e4 <ruby>减少访问时间<rt>reduced access time</rt></ruby>（仅在 ext4 文件系统的情况下）。它是由 Andreas Rid 和 Gundolf Kiefer 开发的一个项目。E4rat 是一个通过碎片整理来帮助快速启动的应用程序。它还会加速应用程序的启动。E4rat 使用物理文件的重新分配来消除寻道时间和旋转延迟，因而达到较高的磁盘传输速度。

E4rat 可以 .deb 软件包形式获得，你可以从它的官方网站 http://e4rat.sourceforge.net/ 下载。

Ubuntu 默认安装的 ureadahead 软件包与 e4rat 冲突。因此必须使用下面的命令安装这几个软件包：

```
sudo dpkg purge ureadahead ubuntu-minimal
```

现在使用下面的命令来安装 e4rat 的依赖关系：

```
sudo apt-get install libblkid1 e2fslibs
```

打开下载的 .deb 文件，并安装它。现在需要恰当地收集启动数据来使 e4rat 工作。

遵循下面所给的步骤来使 e4rat 正确地运行并提高启动速度。

* 在启动期间访问 Grub 菜单。这可以在系统启动时通过按住 `shift` 按键来完成。
* 选择通常用于启动的选项（内核版本），并按 `e`。
* 查找以 `linux /boot/vmlinuz` 开头的行，并在该行的末尾添加下面的代码（在句子的最后一个字母后按空格键）：`init=/sbin/e4rat-collect or try - quiet splash vt.handsoff =7 init=/sbin/e4rat-collect
`。
* 现在，按 `Ctrl+x` 来继续启动。这可以让 e4rat 在启动后收集数据。在这台机器上工作，并在接下来的两分钟时间内打开并关闭应用程序。
* 通过转到 e4rat 文件夹，并使用下面的命令来访问日志文件：`cd /var/log/e4rat`。
* 如果你没有找到任何日志文件，重复上面的过程。一旦日志文件就绪，再次访问 Grub 菜单，并对你的选项按 `e`。
* 在你之前已经编辑过的同一行的末尾输入 `single`。这可以让你访问命令行。如果出现其它菜单，选择恢复正常启动（Resume normal boot）。如果你不知为何不能进入命令提示符，按 `Ctrl+Alt+F1` 组合键。
* 在你看到登录提示后，输入你的登录信息。
* 现在输入下面的命令：`sudo e4rat-realloc /var/lib/e4rat/startup.log`。此过程需要一段时间，具体取决于机器的磁盘速度。
* 现在使用下面的命令来重启你的机器：`sudo shutdown -r now`。
* 现在，我们需要配置 Grub 来在每次启动时运行 e4rat。
* 使用任意的编辑器访问 grub 文件。例如，`gksu gedit /etc/default/grub`。
* 查找以 `GRUB CMDLINE LINUX DEFAULT=` 开头的一行，并在引号之间和任何选项之前添加下面的行：`init=/sbin/e4rat-preload 18`。
* 它应该看起来像这样：`GRUB CMDLINE LINUX DEFAULT = init=/sbin/e4rat- preload quiet splash`。
* 保存并关闭 Grub 菜单，并使用 `sudo update-grub` 更新 Grub 。
* 重启系统，你将发现启动速度有明显变化。

图 9 和图 10 显示在安装 e4rat 前后的启动时间之间的差异。可注意到启动速度的提高。在使用 e4rat 前启动所用时间是 22.32 秒，然而在使用 e4rat 后启动所用时间是 9.065 秒。

![图 9：使用 e4rat 之前的启动速度][11]

![图 10：使用 e4rat 之后的启动速度][12]

### 一些易做的调整

使用很小的调整也可以达到良好的启动速度，下面列出其中两个。

#### SSD

使用固态设备而不是普通的硬盘或者其它的存储设备将肯定会改善启动速度。SSD 也有助于加快文件传输和运行应用程序方面的速度。

#### 禁用图形用户界面

图形用户界面、桌面图形和窗口动画占用大量的资源。禁用图形用户界面是获得良好的启动速度的另一个好方法。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/how-to-go-about-linux-boot-time-optimisation/

作者：[B Thangaraju][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/b-thangaraju/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Screenshot-from-2019-10-07-13-16-32.png?&ssl=1 (Screenshot from 2019-10-07 13-16-32)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Screenshot-from-2019-10-07-13-16-32.png?fit=700%2C499&ssl=1
[3]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-1.png?ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-2.png?ssl=1
[5]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-3.png?ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-4.png?ssl=1
[7]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-5.png?ssl=1
[8]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-6.png?ssl=1
[9]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-7.png?ssl=1
[10]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-8.png?ssl=1
[11]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-9.png?ssl=1
[12]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/fig-10.png?ssl=1
