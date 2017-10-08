ps_mem：一个用于精确报告 Linux 核心内存用量的简单 Python 脚本
============================================================

[ps_mem][2] 是一个可以帮助我们精确获取 Linux 中各个程序核心内存使用情况的简单 python 脚本。虽然在 Linux 上有很多可用于查看内存使用情况的工具，比如 `free`、`vmstat`、`smem`、`top` 等，但这个工具和其它的区别在于其精确显示核心内存使用情况。

它会分别计算一个程序私有内存总量和共享内存总量，并以更准确的方式给出了总的内存使用量。很明显的，它将帮助大家知道系统中哪个程序正在占用更多的内存。

你可以通过包管理器、`pip` 、或直接运行 `ps_mem.py` 脚本等多种方式来安装 `ps_mem` 工具。需要注意的是：需要有 root 权限。

另外，推荐阅读以下内存工具：

- [free – 一个在 Linux 上查看内存用量统计（可用和已用）的标准工具][3]
- [smem – Linux 内存报告/统计工具][4]
- [vmstat – 一个好用的用于虚拟内存统计的标准工具][5]

### 通过包管理器安装 ps_mem

基于 RHEL 的系统默认仓库就包含 ps_mem 工具，所以我们可以简单地通过包管理器进行安装。

对于 RHEL/CentOS ，使用 [yum 包管理器][6] 安装 `ps_mem` 包：

```
$ sudo yum install ps_mem
```

对于Fedora ，使用 [dnf 包管理器][7] 安装 ps_mem 包：

```
$ sudo dnf install ps_mem
```

对于 Arch Linux ，使用 [pacman 包管理器][8] 安装 ps_mem 包：

```
$ sudo pacman -S ps_mem
```

#### 通过 pip 安装 ps_mem

`pip` 是在 Linux 上推荐使用的一种安装 Python 包的工具。可以使用 `pip` 命令而不是包管理器去获取最新的版本。使用 `pip` 包前，请确保你的系统上已安装过 `pip` 包。否则，先使用发行版本的包管理器安装 `python-pip` 包。

对于基于 Debian 的系统：

```
$ sudo apt-get install python-pip
```

对于基于 RHEL/CentOS 的系统：

```
$ sudo yum install python-pip
```

对于 Fedora

```
$ sudo dnf install python-pip
```

对于 openSUSE

```
$ sudo zypper install python-pip
```

对于基于 Arch Linux 的系统：

```
$ sudo pacman -S python-pip
```

最后，在 Linux 上运行 `pip` 工具安装 `ps_mem` ：

```
$ sudo pip install ps_mem
```

### 直接运行 ps_mem.py 脚本

我们也可以从开发者 github 页面下载文件，并直接运行 `ps_mem.py` 脚本。

```
$ git clone https://github.com/pixelb/ps_mem.git && cd ps_mem
$ sudo python ps_mem.py
```

### ps_mem 使用方法

不带任何参数直接运行 `ps_mem` 以精确获取每个程序的的核心内存使用情况。

```
$ sudo ps_mem
 Private  +   Shared  =  RAM used	Program

  1.6 MiB + 438.5 KiB =   2.1 MiB	packagekitd
  1.7 MiB + 498.0 KiB =   2.1 MiB	indicator-application-service
912.0 KiB +   1.3 MiB =   2.2 MiB	window-stack-bridge
  2.0 MiB + 350.5 KiB =   2.3 MiB	gnome-keyring-daemon
  1.8 MiB + 575.0 KiB =   2.3 MiB	whoopsie
  2.4 MiB + 304.5 KiB =   2.7 MiB	systemd-journald
  2.7 MiB + 157.5 KiB =   2.8 MiB	ibus-engine-simple
  2.7 MiB + 182.0 KiB =   2.9 MiB	ibus-dconf
  2.7 MiB + 332.5 KiB =   3.0 MiB	NetworkManager
  3.1 MiB + 169.5 KiB =   3.2 MiB	polkitd
  1.9 MiB +   1.7 MiB =   3.6 MiB	systemd (2)
  3.4 MiB + 172.5 KiB =   3.6 MiB	deja-dup-monitor
  2.9 MiB + 685.0 KiB =   3.6 MiB	zeitgeist-datahub
  2.9 MiB + 848.0 KiB =   3.7 MiB	python2.7
  3.5 MiB + 442.0 KiB =   4.0 MiB	dbus-daemon (3)
  3.2 MiB + 951.0 KiB =   4.1 MiB	evolution-addressbook-factory
  3.9 MiB + 435.0 KiB =   4.3 MiB	lightdm (2)
  3.7 MiB + 826.5 KiB =   4.5 MiB	polkit-gnome-authentication-agent-1
  3.7 MiB + 853.0 KiB =   4.6 MiB	unity-fallback-mount-helper
  3.7 MiB + 884.0 KiB =   4.6 MiB	ibus-x11
  4.1 MiB + 590.5 KiB =   4.6 MiB	indicator-sound-service
  4.5 MiB + 167.0 KiB =   4.7 MiB	udisksd
  4.3 MiB + 571.0 KiB =   4.9 MiB	gnome-session-binary
  4.5 MiB + 519.0 KiB =   5.0 MiB	zeitgeist-fts
  4.2 MiB + 900.5 KiB =   5.1 MiB	indicator-printers-service
  4.1 MiB +   1.0 MiB =   5.1 MiB	bash (2)
  3.9 MiB +   1.2 MiB =   5.2 MiB	update-notifier
  4.8 MiB + 426.0 KiB =   5.2 MiB	pulseaudio
  4.5 MiB +   1.5 MiB =   6.0 MiB	url-dispatcher
  4.3 MiB +   1.7 MiB =   6.0 MiB	python3.5
  5.2 MiB + 856.5 KiB =   6.1 MiB	evolution-addressbook-factory-subprocess
  5.6 MiB + 494.5 KiB =   6.1 MiB	colord
  5.0 MiB +   1.2 MiB =   6.2 MiB	bamfdaemon
  5.7 MiB +   1.1 MiB =   6.8 MiB	evolution-source-registry
  5.6 MiB +   1.3 MiB =   6.9 MiB	indicator-keyboard-service
  5.5 MiB +   1.5 MiB =   7.1 MiB	ibus-ui-gtk3
  5.4 MiB +   1.8 MiB =   7.2 MiB	notify-osd
  6.3 MiB +   1.1 MiB =   7.4 MiB	nm-applet
  6.4 MiB +   1.4 MiB =   7.8 MiB	evolution-calendar-factory
  6.3 MiB +   1.5 MiB =   7.8 MiB	hud-service
  6.5 MiB +   1.5 MiB =   8.0 MiB	unity-panel-service
  8.2 MiB +   1.8 MiB =  10.0 MiB	unity-settings-daemon
 11.1 MiB + 126.5 KiB =  11.2 MiB	snapd
  8.2 MiB +   3.0 MiB =  11.2 MiB	indicator-datetime-service
 10.3 MiB +   1.7 MiB =  12.0 MiB	evolution-calendar-factory-subprocess (2)
 12.5 MiB +   2.8 MiB =  15.3 MiB	redshift-gtk
 14.5 MiB +   1.8 MiB =  16.3 MiB	fluxgui
 13.5 MiB +   2.9 MiB =  16.4 MiB	gnome-terminal-server
 12.7 MiB +   7.6 MiB =  20.4 MiB	apache2 (6)
 20.8 MiB + 503.0 KiB =  21.3 MiB	fwupd
 22.8 MiB +  70.0 KiB =  22.9 MiB	collectl
 22.2 MiB +  10.8 MiB =  33.0 MiB	nautilus
 70.9 MiB +   1.5 MiB =  72.4 MiB	gnome-software
 97.9 MiB +  24.8 MiB = 122.8 MiB	Xorg
131.9 MiB + 168.0 KiB = 132.1 MiB	mysqld
222.1 MiB +   9.4 MiB = 231.5 MiB	compiz
286.2 MiB +  11.8 MiB = 298.0 MiB	firefox
---------------------------------
                          1.3 GiB
=================================
```

输出中打印出全路径：

```
$ sudo ps_mem -s
 Private  +   Shared  =  RAM used	Program

  3.2 MiB + 951.0 KiB =   4.1 MiB	/usr/lib/evolution/evolution-addressbook-factory
  3.7 MiB + 826.5 KiB =   4.5 MiB	/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
  3.7 MiB + 853.0 KiB =   4.6 MiB	/usr/lib/unity-settings-daemon/unity-fallback-mount-helper
  3.7 MiB + 884.0 KiB =   4.6 MiB	/usr/lib/ibus/ibus-x11 --kill-daemon
  4.1 MiB + 590.5 KiB =   4.6 MiB	/usr/lib/x86_64-linux-gnu/indicator-sound/indicator-sound-service
  4.5 MiB + 167.0 KiB =   4.7 MiB	/usr/lib/udisks2/udisksd --no-debug
  4.3 MiB + 571.0 KiB =   4.9 MiB	/usr/lib/gnome-session/gnome-session-binary --session=ubuntu
  4.5 MiB + 519.0 KiB =   5.0 MiB	/usr/lib/x86_64-linux-gnu/zeitgeist-fts
  4.2 MiB + 900.5 KiB =   5.1 MiB	/usr/lib/x86_64-linux-gnu/indicator-printers/indicator-printers-service
  4.1 MiB +   1.0 MiB =   5.1 MiB	bash (2)
  3.9 MiB +   1.2 MiB =   5.2 MiB	update-notifier
  4.8 MiB + 426.0 KiB =   5.2 MiB	/usr/bin/pulseaudio --start --log-target=syslog
  5.0 MiB + 863.0 KiB =   5.9 MiB	/usr/lib/evolution/evolution-calendar-factory-subprocess --factory local --bus-name org.gnome.evolution.dataserver.Subprocess.Backend.Calendarx2573x3 --own-path /org/gnome/evolution/dataserver/Subprocess/Backend/Calendar/2573/3
  4.5 MiB +   1.5 MiB =   6.0 MiB	/usr/lib/x86_64-linux-gnu/url-dispatcher/url-dispatcher
  4.3 MiB +   1.7 MiB =   6.0 MiB	python3 -v
  5.2 MiB + 856.5 KiB =   6.1 MiB	/usr/lib/evolution/evolution-addressbook-factory-subprocess --factory local --bus-name org.gnome.evolution.dataserver.Subprocess.Backend.AddressBookx2637x2 --own-path /org/gnome/evolution/dataserver/Subprocess/Backend/AddressBook/2637/2
  5.6 MiB + 494.5 KiB =   6.1 MiB	/usr/lib/colord/colord
  5.2 MiB + 913.0 KiB =   6.1 MiB	/usr/lib/evolution/evolution-calendar-factory-subprocess --factory contacts --bus-name org.gnome.evolution.dataserver.Subprocess.Backend.Calendarx2573x2 --own-path /org/gnome/evolution/dataserver/Subprocess/Backend/Calendar/2573/2
  5.0 MiB +   1.2 MiB =   6.2 MiB	/usr/lib/x86_64-linux-gnu/bamf/bamfdaemon
  5.7 MiB +   1.1 MiB =   6.8 MiB	/usr/lib/evolution/evolution-source-registry
  5.6 MiB +   1.3 MiB =   6.9 MiB	/usr/lib/x86_64-linux-gnu/indicator-keyboard/indicator-keyboard-service --use-gtk
  5.5 MiB +   1.5 MiB =   7.1 MiB	/usr/lib/ibus/ibus-ui-gtk3
  5.4 MiB +   1.8 MiB =   7.2 MiB	/usr/lib/x86_64-linux-gnu/notify-osd
  6.3 MiB +   1.1 MiB =   7.4 MiB	nm-applet
  6.4 MiB +   1.4 MiB =   7.8 MiB	/usr/lib/evolution/evolution-calendar-factory
  6.3 MiB +   1.5 MiB =   7.8 MiB	/usr/lib/x86_64-linux-gnu/hud/hud-service
  6.5 MiB +   1.5 MiB =   8.0 MiB	/usr/lib/x86_64-linux-gnu/unity/unity-panel-service
  8.2 MiB +   1.8 MiB =  10.0 MiB	/usr/lib/unity-settings-daemon/unity-settings-daemon
 11.1 MiB + 126.5 KiB =  11.2 MiB	/usr/lib/snapd/snapd
  8.2 MiB +   3.0 MiB =  11.2 MiB	/usr/lib/x86_64-linux-gnu/indicator-datetime/indicator-datetime-service
 12.5 MiB +   2.8 MiB =  15.3 MiB	/usr/bin/python3 /usr/bin/redshift-gtk
 14.5 MiB +   1.8 MiB =  16.3 MiB	/usr/bin/python /usr/bin/fluxgui
 13.6 MiB +   2.9 MiB =  16.4 MiB	/usr/lib/gnome-terminal/gnome-terminal-server
 12.7 MiB +   7.6 MiB =  20.4 MiB	/usr/sbin/apache2 -k start (6)
 20.8 MiB + 503.0 KiB =  21.3 MiB	/usr/lib/x86_64-linux-gnu/fwupd/fwupd
 22.8 MiB +  70.0 KiB =  22.9 MiB	/usr/bin/perl -w /usr/bin/collectl -D
 22.2 MiB +  10.8 MiB =  33.0 MiB	nautilus -n
 70.9 MiB +   1.5 MiB =  72.4 MiB	/usr/bin/gnome-software --gapplication-service
 97.9 MiB +  24.8 MiB = 122.8 MiB	/usr/lib/xorg/Xorg -core :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch
131.9 MiB + 168.0 KiB = 132.1 MiB	/usr/sbin/mysqld
222.1 MiB +   9.4 MiB = 231.5 MiB	/usr/bin/compiz
286.2 MiB +  11.8 MiB = 298.1 MiB	/usr/lib/firefox/firefox
---------------------------------
                          1.3 GiB
=================================
```

只显示特定的 PID 列表的内存使用情况：

```
$ sudo ps_mem -p 2886,4386
 Private  +   Shared  =  RAM used	Program

 13.5 MiB +   2.9 MiB =  16.4 MiB	gnome-terminal-server
286.2 MiB +  11.8 MiB = 298.0 MiB	firefox
---------------------------------
                        314.4 MiB
=================================
```

每 N 秒打印进程内存。以下命令每 2 秒报告一次内存使用情况：

```
$ sudo ps_mem w 2
```

只显示内存总量：

```
$ sudo ps_mem -t
1329884160
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/ps_mem-report-core-memory-usage-accurately-in-linux/

作者：[2DAYGEEK][a]
译者：[xllc](https://github.com/xllc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:https://github.com/pixelb/ps_mem
[3]:http://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/
[4]:http://www.2daygeek.com/smem-linux-memory-usage-statistics-reporting-tool/
[5]:http://www.2daygeek.com/linux-vmstat-command-examples-tool-report-virtual-memory-statistics/
[6]:http://www.2daygeek.com/yum-command-examples/
[7]:http://www.2daygeek.com/dnf-command-examples/
[8]:http://www.2daygeek.com/pacman-command-examples/
