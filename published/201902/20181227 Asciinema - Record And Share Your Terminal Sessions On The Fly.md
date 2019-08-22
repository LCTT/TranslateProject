[#]: collector: (lujun9972)
[#]: translator: (bestony)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10520-1.html)
[#]: subject: (Asciinema – Record And Share Your Terminal Sessions On The Fly)
[#]: via: (https://www.2daygeek.com/linux-asciinema-record-your-terminal-sessions-share-them-on-web/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Asciinema：在云端记录并分享你的终端会话
======

这个众所周知的话题我们早已经写过了足够多的文章。即使这样，我们今天也要去讨论相同的话题。

其他的工具都是在本地运行的，但是 Asciinema 可以以相同的方式在本地和 Web 端运行。我的意思是我们可以在 Web 上分享这个录像。

默认情况下，每个人都更愿意使用 `history` 命令来回看、调用之前在终端内输入的命令。不过，不行的是，这个命令只展示了我们运行的命令却没有展示这些命令上次运行时的输出。

在 Linux 下有很多的组件来记录终端会话活动。在过去，我们也写了一些组件，不过今天我们依然要讨论这同一类心的工具。

如果你想要使用其他工具来记录你的 Linux 终端会话活动，你可以试试 [Script 命令][1]、[Terminalizer 工具][2] 和 [Asciinema 工具][3]。

不过如果你想要找一个 [GIF 录制工具][4]，可以试试 [Gifine][5]、[Kgif][6] 和 [Peek][7]。

### 什么是 Asciinema

`asciinema` 是一个自由开源的用于录制终端会话并将它们分享到网络上的解决方案。

当你在你的终端内运行 `asciinema rec` 来启动录像时，你输入命令的时候，终端内的所有输出都会被抓取。

当抓取停止时（通过按下 `Ctrl-D` 或输出 `exit`)，抓取的输出将会被上传到 asciinema.org 的网站，并为后续的回放做准备。

Asciinema 项目由多个不同的完整的部分组成，比如 `asciinema` 命令行工具、asciinema.org API 和 JavaScript 播放器。

Asciinema 的灵感来自于 `script` 和 `scriptreplay` 命令。

### 如何在 Linux 上安装 Asciinema 

Asciinema 由 Python 写就，在 Linux 上，推荐使用 `pip` 安装的方法来安装。

确保你已经在你的系统里安装了 python-pip 包。如果没有，使用下述命令来安装它。

对于 Debian/Ubuntu 用户，使用 [Apt 命令][8] 或 [Apt-Get 命令][9] 来安装 pip 包。

```
$ sudo apt install python-pip
```

对于 Archlinux 用户，使用 [Pacman 命令][10] 来安装 pip 包。

```
$ sudo pacman -S python-pip
```

对于 Fedora 用户，使用 [DNF 命令][11] 来安装 pip 包。

```
$ sudo dnf install python-pip
```

对于 CentOS/RHEL 用户，使用 [YUM 命令][12] 来安装 pip 包。

```
$ sudo yum install python-pip
```

对于 openSUSE 用户，使用 [Zypper 命令][13] 来安装 pip 包。

```
$ sudo zypper install python-pip
```

最后，运行如下的 [pip 命令][14] 来在 Linux 上安装 Asciinema 工具。

```
$ sudo pip3 install asciinema
```

### 如何使用 Asciinema 工具来记录你的终端会话

一旦你成功的安装了 Asciinema，只需要运行如下命令来开始录制：

```
$ asciinema rec 2g-test
asciinema: recording asciicast to 2g-test
asciinema: press "ctrl-d" or type "exit" when you're done
```

出于测试的目的，运行一些简单的命令，并看一看它是否运行良好。

```
$ free
              total        used        free      shared  buff/cache   available
Mem:          15867        2783       10537        1264        2546       11510
Swap:         17454           0       17454

$ hostnamectl
   Static hostname: daygeek-Y700
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b833547368d230a2025d475bc
           Boot ID: c84f7e6f39394d1f8fdc4bcaa251aee2
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.8-2-MANJARO
      Architecture: x86-64

$ uname -a
Linux daygeek-Y700 4.19.8-2-MANJARO #1 SMP PREEMPT Sat Dec 8 14:45:36 UTC 2018 x86_64 GNU/Linux

$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       39 bits physical, 48 bits virtual
CPU(s):              8
On-line CPU(s) list: 0-7
Thread(s) per core:  2
Core(s) per socket:  4
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               94
Model name:          Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz
Stepping:            3
CPU MHz:             800.047
CPU max MHz:         3500.0000
CPU min MHz:         800.0000
BogoMIPS:            5186.00
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            6144K
NUMA node0 CPU(s):   0-7
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_add fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
```

当你完成后，简单的按下 `CTRL+D` 或输入 `exit` 来退出录制。这个结果将会被保存在同一个目录。

```
$ exit
exit
asciinema: recording finished
asciinema: asciicast saved to 2g-test
```

如果你想要保存输出到不同的目录中，就需要提醒 Asciinema 你想要保存文件的目录。

```
$ asciinema rec /opt/session-record/2g-test1
```

我们可以使用如下命令来回放录制的会话。

```
$ asciinema play 2g-test
```

我们能够以两倍速来回放录制的会话。

```
$ asciinema play -s 2 2g-test
```

或者，我们可以以正常速度播放录制的会话，限制空闲时间为 2 秒。

```
$ asciinema play -i 2 2g-test
```

### 如何在网络上分享已经录制的会话

如果你想要分享录制的会话给你的朋友，只要运行下述命令上传你的会话到 asciinema.org，就可以获得一个唯一链接。

它将会在被上传 7 天后被归档。

```
$ asciinema upload 2g-test
View the recording at:

    https://asciinema.org/a/jdJrxhDLboeyrhzZRHsve0x8i

This installation of asciinema recorder hasn't been linked to any asciinema.org
account. All unclaimed recordings (from unknown installations like this one)
are automatically archived 7 days after upload.

If you want to preserve all recordings made on this machine, connect this
installation with asciinema.org account by opening the following link:

    https://asciinema.org/connect/10cd4f24-45b6-4f64-b737-ae0e5d12baf8
```

![][16]

如果你想要分享录制的会话在社交媒体上，只需要点击页面底部的 “Share” 按钮。

如果任何人想要去下载这个录制，只需要点击页面底部的 “Download” 按钮，就可以将其保存在你系统里。

### 如何管理 asciinema.org 中的录制片段

如果你想要留存所有在这个机器上录制的片段，点击上述显示的链接并使用你在 asciinema.org 的账户登录，然后跟随这个说明继续操作，来将你的机器和该网站连接起来。

```
https://asciinema.org/connect/10cd4f24-45b6-4f64-b737-ae0e5d12baf8
```

如果你早已录制了一份，但是你没有在你的 asciinema.org 账户界面看到它，只需要运行 `asciinema auth` 命令来移动它们。

```
$ asciinema auth

Open the following URL in a web browser to link your install ID with your asciinema.org user account:

https://asciinema.org/connect/10cd4f24-45b6-4f64-b737-ae0e5d12baf8

This will associate all recordings uploaded from this machine (past and future ones) to your account, and allow you to manage them (change title/theme, delete) at asciinema.org.
```

![][17]

如果你想直接上传文件而不是将其保存在本地，直接运行如下命令：

```
$ asciinema rec
asciinema: recording asciicast to /tmp/tmp6kuh4247-ascii.cast
asciinema: press "ctrl-d" or type "exit" when you're done
```

出于测试目的，运行下述命令，并看一看它是否运行的很好。

```
$ free
              total        used        free      shared  buff/cache   available
Mem:          15867        2783       10537        1264        2546       11510
Swap:         17454           0       17454

$ hostnamectl
   Static hostname: daygeek-Y700
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b833547368d230a2025d475bc
           Boot ID: c84f7e6f39394d1f8fdc4bcaa251aee2
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.8-2-MANJARO
      Architecture: x86-64

$ uname -a
Linux daygeek-Y700 4.19.8-2-MANJARO #1 SMP PREEMPT Sat Dec 8 14:45:36 UTC 2018 x86_64 GNU/Linux
```

如果你完成了，简单的按下 `CTRL+D` 或输入 `exit` 来停止录制，然后按下回车来上传文件到 asciinema.org 网站。

这将会花费一些时间来为你的录制生成唯一链接。一旦它完成，你会看到和下面一样的样式：

```
$ exit
exit
asciinema: recording finished
asciinema: press "enter" to upload to asciinema.org, "ctrl-c" to save locally

View the recording at:

 https://asciinema.org/a/b7bu5OhuCy2vUH7M8RRPjsSxg
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-asciinema-record-your-terminal-sessions-share-them-on-web/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[Bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/script-command-record-save-your-terminal-session-activity-linux/
[2]: https://www.2daygeek.com/terminalizer-a-tool-to-record-your-terminal-and-generate-animated-gif-images/
[3]: https://www.2daygeek.com/Asciinema-record-your-terminal-sessions-as-svg-animations-in-linux/
[4]: https://www.2daygeek.com/category/gif-recorder/
[5]: https://www.2daygeek.com/gifine-create-animated-gif-vedio-recorder-linux-mint-debian-ubuntu/
[6]: https://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/
[7]: https://www.2daygeek.com/peek-create-animated-gif-screen-recorder-capture-arch-linux-mint-fedora-ubuntu/
[8]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[10]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[11]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[12]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[13]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[14]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[15]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[16]: https://www.2daygeek.com/wp-content/uploads/2018/12/linux-asciinema-record-your-terminal-sessions-share-web-1.png
[17]: https://www.2daygeek.com/wp-content/uploads/2018/12/linux-asciinema-record-your-terminal-sessions-share-web-3.png
