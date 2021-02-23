[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11462-1.html)
[#]: subject: (Viewing files and processes as trees on Linux)
[#]: via: (https://www.networkworld.com/article/3444589/viewing-files-and-processes-as-trees-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上以树状查看文件和进程
======

> 介绍三个 Linux 命令：ps、pstree 和 tree 以类似树的格式查看文件和进程。

![](https://img.linux.net.cn/data/attachment/album/201910/15/093202rwm5k9pnpntgbtpr.jpg)

[Linux][3] 提供了一些方便的命令，用于以树状分支形式查看文件和进程，从而易于查看它们之间的关系。在本文中，我们将介绍 `ps`、`pstree` 和 `tree` 命令以及它们提供的一些选项，这些选项可帮助你将注意力集中在要查看的内容上。

### ps

我们用来列出进程的 `ps` 命令有一些有趣的选项，但是很多人从来没有利用过。虽然常用的 `ps -ef` 提供了正在运行的进程的完整列表，但是 `ps -ejH` 命令增加了一个不错的效果。它缩进了相关的进程以使这些进程之间的关系在视觉上更加清晰——就像这个片段：

```
$ ps -ejH
  PID  PGID   SID TTY          TIME CMD
...
 1396  1396  1396 ?        00:00:00   sshd
28281 28281 28281 ?        00:00:00     sshd
28409 28281 28281 ?        00:00:00       sshd
28410 28410 28410 pts/0    00:00:00         bash
30968 30968 28410 pts/0    00:00:00           ps
```

可以看到，正在运行的 `ps` 进程是在 `bash` 中运行的，而 `bash` 是在 ssh 会话中运行的。

`-exjf` 选项字符串提供了类似的视图，但是带有一些其它细节和符号以突出显示进程的层次结构性质：

```
$ ps -exjf
PPID   PID  PGID   SID TTY      TPGID STAT   UID   TIME COMMAND
...
    1  1396  1396  1396 ?           -1 Ss       0   0:00 /usr/sbin/sshd -D
 1396 28281 28281 28281 ?           -1 Ss       0   0:00  \_ sshd: shs [priv]
28281 28409 28281 28281 ?           -1 S     1000   0:00      \_ sshd: shs@pts/0
28409 28410 28410 28410 pts/0    31028 Ss    1000   0:00          \_ -bash
28410 31028 31028 28410 pts/0    31028 R+    1000   0:00              \_ ps axjf
```

命令中使用的这些选项表示：

```
-e  选择所有进程
-j  使用工作格式
-f  提供完整格式列表
-H  分层显示进程（如，树状格式）
-x  取消“必须与 tty 相关联”的限制
```

同时，该命令也有一个 `--forest` 选项提供了类似的视图。

```
$ ps -ef --forest
UID        PID  PPID  C STIME TTY          TIME CMD
...
root      1396     1  0 Oct08 ?        00:00:00 /usr/sbin/sshd -D
root     28281  1396  0 12:55 ?        00:00:00  \_ sshd: shs [priv]
shs      28409 28281  0 12:56 ?        00:00:00      \_ sshd: shs@pts/0
shs      28410 28409  0 12:56 pts/0    00:00:00          \_ -bash
shs      32351 28410  0 14:39 pts/0    00:00:00              \_ ps -ef --forest
```

注意，这些示例只是这些命令如何使用的示例。你可以选择最适合你的进程视图的任何选项组合。

### pstree

使用 `pstree` 命令可以获得类似的进程视图。尽管 `pstree` 具备了许多选项，但是该命令本身就提供了非常有用的显示。注意，许多父子进程关系显示在单行而不是后续行上。

```
$ pstree
...
        ├─sshd───sshd───sshd───bash───pstree
        ├─systemd─┬─(sd-pam)
        │         ├─at-spi-bus-laun─┬─dbus-daemon
        │         │                 └─3*[{at-spi-bus-laun}]
        │         ├─at-spi2-registr───2*[{at-spi2-registr}]
        │         ├─dbus-daemon
        │         ├─ibus-portal───2*[{ibus-portal}]
        │         ├─pulseaudio───2*[{pulseaudio}]
        │         └─xdg-permission-───2*[{xdg-permission-}]
```

通过 `-n` 选项，`pstree` 以数值（按进程 ID）顺序显示进程：

```
$ pstree -n
systemd─┬─systemd-journal
        ├─systemd-udevd
        ├─systemd-timesyn───{systemd-timesyn}
        ├─systemd-resolve
        ├─systemd-logind
        ├─dbus-daemon
        ├─atopacctd
        ├─irqbalance───{irqbalance}
        ├─accounts-daemon───2*[{accounts-daemon}]
        ├─acpid
        ├─rsyslogd───3*[{rsyslogd}]
        ├─freshclam
        ├─udisksd───4*[{udisksd}]
        ├─networkd-dispat
        ├─ModemManager───2*[{ModemManager}]
        ├─snapd───10*[{snapd}]
        ├─avahi-daemon───avahi-daemon
        ├─NetworkManager───2*[{NetworkManager}]
        ├─wpa_supplicant
        ├─cron
        ├─atd
        ├─polkitd───2*[{polkitd}]
        ├─colord───2*[{colord}]
        ├─unattended-upgr───{unattended-upgr}
        ├─sshd───sshd───sshd───bash───pstree
```

使用 `pstree` 时可以考虑的一些选项包括 `-a`（包括命令行参数）和 `-g`（包括进程组）。

以下是一些简单的示例（片段）。

命令 `pstree -a` 的输出内容：

```
└─wpa_supplicant -u -s -O /run/wpa_supplicant
```

命令 `pstree -g` 的输出内容：

```
├─sshd(1396)───sshd(28281)───sshd(28281)───bash(28410)───pstree(1115)
```

### tree

虽然 `tree` 命令听起来与 `pstree` 非常相似，但这是用于查看文件而非进程的命令。它提供了一个漂亮的树状目录和文件视图。

如果你使用 `tree` 命令查看 `/proc` 目录，你显示的开头部分将类似于这个：

```
$ tree /proc
/proc
├── 1
│   ├── attr
│   │   ├── apparmor
│   │   │   ├── current
│   │   │   ├── exec
│   │   │   └── prev
│   │   ├── current
│   │   ├── display
│   │   ├── exec
│   │   ├── fscreate
│   │   ├── keycreate
│   │   ├── prev
│   │   ├── smack
│   │   │   └── current
│   │   └── sockcreate
│   ├── autogroup
│   ├── auxv
│   ├── cgroup
│   ├── clear_refs
│   ├── cmdline
...
```

如果以 root 权限运行这条命令（`sudo tree /proc`），你将会看到更多详细信息，因为 `/proc` 目录的许多内容对于普通用户而言是无法访问的。

命令 `tree -d` 将会限制仅显示目录。

```
$ tree -d /proc
/proc
├── 1
│   ├── attr
│   │   ├── apparmor
│   │   └── smack
│   ├── fd [error opening dir]
│   ├── fdinfo [error opening dir]
│   ├── map_files [error opening dir]
│   ├── net
│   │   ├── dev_snmp6
│   │   ├── netfilter
│   │   └── stat
│   ├── ns [error opening dir]
│   └── task
│       └── 1
│           ├── attr
│           │   ├── apparmor
│           │   └── smack
...
```

使用 `-f` 选项，`tree` 命令会显示完整的路径。

```
$ tree -f /proc
/proc
├── /proc/1
│   ├── /proc/1/attr
│   │   ├── /proc/1/attr/apparmor
│   │   │   ├── /proc/1/attr/apparmor/current
│   │   │   ├── /proc/1/attr/apparmor/exec
│   │   │   └── /proc/1/attr/apparmor/prev
│   │   ├── /proc/1/attr/current
│   │   ├── /proc/1/attr/display
│   │   ├── /proc/1/attr/exec
│   │   ├── /proc/1/attr/fscreate
│   │   ├── /proc/1/attr/keycreate
│   │   ├── /proc/1/attr/prev
│   │   ├── /proc/1/attr/smack
│   │   │   └── /proc/1/attr/smack/current
│   │   └── /proc/1/attr/sockcreate
...
```

分层显示通常可以使进程和文件之间的关系更容易理解。可用选项的数量很多，而你总可以找到一些视图，帮助你查看所需的内容。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3444589/viewing-files-and-processes-as-trees-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/cricketsblog/46967168105/in/photolist-2eyk1Lr-KQsMHg-JbWG41-FWu8FU-6daUYv-cxH2Aq-DV2CNk-25eF8V1-GEEwLx-S9a29U-GpiYf2-Yi5dnF-YLPMV3-23ThoAZ-dTyphv-DVXTMY-ERmSjL-6z86DE-QVnnyv-7PLo9u-58CYnd-dYmbPX-63nVid-p7Ea54-238LQaD-Qb6CkZ-QoRhQX-suMNcq-22JeozK-BwMvBg-26AQHz1-PhQT4J-AGyhXA-2fhixB3-qngdKE-UiptQQ-ZzpiHa-pH4g9e-28CoU2s-81gNxg-qnoewg-2cmYaRk-d3FRuo-4fJrSL-23NqveR-LLEYMU-FZixFK-5aBDGU-PBQbWq-dJoaKi
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/article/3215226/what-is-linux-uses-featres-products-operating-systems.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.networkworld.com/slideshow/153439/linux-best-desktop-distros-for-newbies.html#tk.nww-infsb
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
