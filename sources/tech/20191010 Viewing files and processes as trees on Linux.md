[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Viewing files and processes as trees on Linux)
[#]: via: (https://www.networkworld.com/article/3444589/viewing-files-and-processes-as-trees-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Viewing files and processes as trees on Linux
======
A look at three Linux commands - ps, pstree and tree - for viewing files and processes in a tree-like format.
[Melissa McMasters][1] [(CC BY 2.0)][2]

[Linux][3] provides several handy commands for viewing both files and processes in a branching, tree-like format that makes it easy to view how they are related. In this post, we'll look at the **ps**, **pstree** and **tree** commands along with some options they provide to help focus your view on what you want to see.

### ps

The **ps** command that we all use to list processes has some interesting options that many of us never take advantage of. While the commonly used **ps -ef** provides a complete listing of running processes, the **ps -ejH** command adds a nice effect. It indents related processes to make the relationship between these processes visually more clear  – as in this excerpt:

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

As you can see, the ps process is being run is run within bash and bash within an ssh session.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

The **-exjf** option string provides a similar view, but with some additional details and symbols to highlight the hierarchical nature of the processes:

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

The options used in these commands represent:

Advertisement

```
-e  select all processes
-j  use the jobs format
-f  provide a full format listing
-H  show the process hierarchy (i.e., the "forest format")
-x  lift the "must be associated with a tty" restriction
```

There's also a **\--forest** option that provides a similar view.

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

Note that these examples are only a sampling of how these commands can be used. You can select whichever options that give you the view of processes that works best for you.

[MORE ON NETWORK WORLD: Linux: Best desktop distros for newbies][5]

### pstree

A similar view of processes is available using the **pstree** command. While even **pstree** offers many options, the command provides a very useful display on its own. Notice that many parent-child process relationships are displayed on single lines rather than subsequent lines.

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

With the **-n** option, **pstree** displays the process in numerical (by process ID) order:

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

Some options to consider when using **pstree** include **-a** (include command line arguments) and **-g** (include process groups).

Here are some quick (truncated) examples.

Output from **pstree -a**

```
└─wpa_supplicant -u -s -O /run/wpa_supplicant
```

Output from **pstree -g**:

```
├─sshd(1396)───sshd(28281)───sshd(28281)───bash(28410)───pstree(1115)
```

### tree

While the **tree** command sounds like it would be very similar to **pstree**, it's a command for looking at files rather than processes. It provides a nice tree-like view of directories and files.

If you use the **tree** command to look at **/proc**, your display would begin similar to this one:

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

You will see a lot more detail if you run a command like this as root (**sudo tree /proc)** since much of the contents of **/proc** is inaccessible to regular users.

The **tree -d** command will limit your display to directories.

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

With the **-f** option, **tree** will show full pathnames.

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

Hierarchical displays can often make the relationship between processes and files easier to understand. While the number of options available is rather broad, you'll probably find some views that help you see just what you're looking for.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3444589/viewing-files-and-processes-as-trees-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[校对者ID](https://github.com/校对者ID)

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
