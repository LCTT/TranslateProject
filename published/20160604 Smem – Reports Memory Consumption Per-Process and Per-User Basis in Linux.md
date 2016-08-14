Smem – Linux 下基于进程和用户的内存占用报告
===========================================================================

Linux 系统的内存管理工作中，内存使用情况的监控是十分重要的，在各种 Linux 发行版上你会找到许多这种工具。它们的工作方式多种多样，在这里，我们将会介绍如何安装和使用这样的一个名为 SMEM 的工具软件。

Smem 是一款命令行下的内存使用情况报告工具，它能够给用户提供 Linux 系统下的内存使用的多种报告。和其它传统的内存报告工具不同的是，它有个独特的功能，可以报告 PSS（按比例占用大小：Proportional Set Size），这种内存使用量表示方法对于那些在虚拟内存中的应用和库更有意义。

![](http://www.tecmint.com/wp-content/uploads/2016/06/Smem-Linux-Memory-Reporting-Tool.png)

*Smem – Linux 内存报告工具*

已有的传统工具会将目光主要集中于读取 RSS（实际占用大小：Resident Set Size），这种方法是以物理内存方案来衡量使用情况的标准方法，但是往往高估了应用程序的内存的使用情况。

PSS 从另一个侧面，通过判定在虚拟内存中的应用和库所使用的“合理分享”的内存，来给出更可信的衡量结果。

你可以阅读此[指南 (关于内存的 RSS 和 PSS)][1]了解 Linux 系统中的内存占用，不过现在让我们继续看看 smem 的特点。

### Smem 这一工具的特点

- 系统概览列表
- 以进程、映射和用户来显示或者是过滤
- 从 /proc 文件系统中得到数据
- 从多个数据源配置显示的条目
- 可配置输出单位和百分比
- 易于配置列表表头和汇总
- 从镜像文件夹或者是压缩的 tar 文件中获得数据快照
- 内置的图表生成机制
- 轻量级的捕获工具，可用于嵌入式系统

### 如何安装 Smem - Linux 下的内存使用情况报告工具

安装之前，需要确保满足以下的条件：

- 现代内核 (版本号高于 2.6.27)
- 较新的 Python 版本 (2.4 及以后版本)
- 可选的 [matplotlib][2] 库用于生成图表

对于当今的大多数的 Linux 发行版而言，内核版本和 Python 的版本都能够满足需要，所以仅需要为生成良好的图表安装 matplotlib 库。

#### RHEL, CentOS 和 Fedora

首先启用 [EPEL (Extra Packages for Enterprise Linux)][3] 软件源，然后按照下列步骤操作：

```
# yum install smem python-matplotlib python-tk
```

#### Debian 和 Ubuntu

```
$ sudo apt-get install smem
```

#### Linux Mint

```
$ sudo apt-get install smem python-matplotlib python-tk
```

#### Arch Linux

使用此 [AUR 仓库][4]。

### 如何使用 Smem – Linux 下的内存使用情况报告工具

为了查看整个系统所有用户的内存使用情况，运行以下的命令：

```
$ sudo smem
```

*监视 Linux 系统中的内存使用情况*

```
 PID User     Command                         Swap      USS      PSS      RSS
 6367 tecmint  cat                                0      100      145     1784
 6368 tecmint  cat                                0      100      147     1676
 2864 tecmint  /usr/bin/ck-launch-session         0      144      165     1780
 7656 tecmint  gnome-pty-helper                   0      156      178     1832
 5758 tecmint  gnome-pty-helper                   0      156      179     1916
 1441 root     /sbin/getty -8 38400 tty2          0      152      184     2052
 1434 root     /sbin/getty -8 38400 tty5          0      156      187     2060
 1444 root     /sbin/getty -8 38400 tty3          0      156      187     2060
 1432 root     /sbin/getty -8 38400 tty4          0      156      188     2124
 1452 root     /sbin/getty -8 38400 tty6          0      164      196     2064
 2619 root     /sbin/getty -8 38400 tty1          0      164      196     2136
 3544 tecmint  sh -c /usr/lib/linuxmint/mi        0      212      224     1540
 1504 root     acpid -c /etc/acpi/events -        0      220      236     1604
 3311 tecmint  syndaemon -i 0.5 -K -R             0      252      292     2556
 3143 rtkit    /usr/lib/rtkit/rtkit-daemon        0      300      326     2548
 1588 root     cron                               0      292      333     2344
 1589 avahi    avahi-daemon: chroot helpe         0      124      334     1632
 1523 root     /usr/sbin/irqbalance               0      316      343     2096
  585 root     upstart-socket-bridge --dae        0      328      351     1820
 3033 tecmint  /usr/bin/dbus-launch --exit        0      328      360     2160
 1346 root     upstart-file-bridge --daemo        0      348      371     1776
 2607 root     /usr/bin/xdm                       0      188      378     2368
 1635 kernoops /usr/sbin/kerneloops               0      352      386     2684
  344 root     upstart-udev-bridge --daemo        0      400      427     2132
 2960 tecmint  /usr/bin/ssh-agent /usr/bin        0      480      485      992
 3468 tecmint  /bin/dbus-daemon --config-f        0      344      515     3284
 1559 avahi    avahi-daemon: running [tecm        0      284      517     3108
 7289 postfix  pickup -l -t unix -u -c            0      288      534     2808
 2135 root     /usr/lib/postfix/master            0      352      576     2872
 2436 postfix  qmgr -l -t unix -u                 0      360      606     2884
 1521 root     /lib/systemd/systemd-logind        0      600      650     3276
 2222 nobody   /usr/sbin/dnsmasq --no-reso        0      604      669     3288
....
```

当普通用户运行 smem，将会显示由该用户启用的进程的占用情况，其中进程按照 PSS 的值升序排列。

下面的输出为用户 “aaronkilik” 启用的进程的使用情况：

```
$ smem
```

*监视 Linux 系统中的内存使用情况*

```
 PID User     Command                         Swap      USS      PSS      RSS
 6367 tecmint  cat                                0      100      145     1784
 6368 tecmint  cat                                0      100      147     1676
 2864 tecmint  /usr/bin/ck-launch-session         0      144      166     1780
 3544 tecmint  sh -c /usr/lib/linuxmint/mi        0      212      224     1540
 3311 tecmint  syndaemon -i 0.5 -K -R             0      252      292     2556
 3033 tecmint  /usr/bin/dbus-launch --exit        0      328      360     2160
 3468 tecmint  /bin/dbus-daemon --config-f        0      344      515     3284
 3122 tecmint  /usr/lib/gvfs/gvfsd                0      656      801     5552
 3471 tecmint  /usr/lib/at-spi2-core/at-sp        0      708      864     5992
 3396 tecmint  /usr/lib/gvfs/gvfs-mtp-volu        0      804      914     6204
 3208 tecmint  /usr/lib/x86_64-linux-gnu/i        0      892     1012     6188
 3380 tecmint  /usr/lib/gvfs/gvfs-afc-volu        0      820     1024     6396
 3034 tecmint  //bin/dbus-daemon --fork --        0      920     1081     3040
 3365 tecmint  /usr/lib/gvfs/gvfs-gphoto2-        0      972     1099     6052
 3228 tecmint  /usr/lib/gvfs/gvfsd-trash -        0      980     1153     6648
 3107 tecmint  /usr/lib/dconf/dconf-servic        0     1212     1283     5376
 6399 tecmint  /opt/google/chrome/chrome -        0      144     1409    10732
 3478 tecmint  /usr/lib/x86_64-linux-gnu/g        0     1724     1820     6320
 7365 tecmint  /usr/lib/gvfs/gvfsd-http --        0     1352     1884     8704
 6937 tecmint  /opt/libreoffice5.0/program        0     1140     2328     5040
 3194 tecmint  /usr/lib/x86_64-linux-gnu/p        0     1956     2405    14228
 6373 tecmint  /opt/google/chrome/nacl_hel        0     2324     2541     8908
 3313 tecmint  /usr/lib/gvfs/gvfs-udisks2-        0     2460     2754     8736
 3464 tecmint  /usr/lib/at-spi2-core/at-sp        0     2684     2823     7920
 5771 tecmint  ssh -p 4521 tecmnt765@212.7        0     2544     2864     6540
 5759 tecmint  /bin/bash                          0     2416     2923     5640
 3541 tecmint  /usr/bin/python /usr/bin/mi        0     2584     3008     7248
 7657 tecmint  bash                               0     2516     3055     6028
 3127 tecmint  /usr/lib/gvfs/gvfsd-fuse /r        0     3024     3126     8032
 3205 tecmint  mate-screensaver                   0     2520     3331    18072
 3171 tecmint  /usr/lib/mate-panel/notific        0     2860     3495    17140
 3030 tecmint  x-session-manager                  0     4400     4879    17500
 3197 tecmint  mate-volume-control-applet         0     3860     5226    23736
...
```

使用 smem 时还有一些参数可以选用，例如当查看整个系统的内存占用情况，运行以下的命令：

```
$ sudo smem -w
```

*监视 Linux 系统中的内存使用情况*

```
Area                           Used      Cache   Noncache
firmware/hardware                 0          0          0
kernel image                      0          0          0
kernel dynamic memory       1425320    1291412     133908
userspace memory            2215368     451608    1763760
free memory                 4424936    4424936          0
```

如果想要查看每一个用户的内存使用情况，运行以下的命令：

```
$ sudo smem -u
```

*Linux 下以用户为单位监控内存占用情况*

```
User     Count     Swap      USS      PSS      RSS
rtkit        1        0      300      326     2548
kernoops     1        0      352      385     2684
avahi        2        0      408      851     4740
postfix      2        0      648     1140     5692
messagebus     1        0     1012     1173     3320
syslog       1        0     1396     1419     3232
www-data     2        0     5100     6572    13580
mpd          1        0     7416     8302    12896
nobody       2        0     4024    11305    24728
root        39        0   323876   353418   496520
tecmint     64        0  1652888  1815699  2763112
```

你也可以按照映射显示内存使用情况：

```
$ sudo smem -m
```

*Linux 下以映射为单位监控内存占用情况*

```
Map                                       PIDs   AVGPSS      PSS
/dev/fb0                                     1        0        0
/home/tecmint/.cache/fontconfig/7ef2298f    18        0        0
/home/tecmint/.cache/fontconfig/c57959a1    18        0        0
/home/tecmint/.local/share/mime/mime.cac    15        0        0
/opt/google/chrome/chrome_material_100_p     9        0        0
/opt/google/chrome/chrome_material_200_p     9        0        0
/usr/lib/x86_64-linux-gnu/gconv/gconv-mo    41        0        0
/usr/share/icons/Mint-X-Teal/icon-theme.    15        0        0
/var/cache/fontconfig/0c9eb80ebd1c36541e    20        0        0
/var/cache/fontconfig/0d8c3b2ac0904cb8a5    20        0        0
/var/cache/fontconfig/1ac9eb803944fde146    20        0        0
/var/cache/fontconfig/3830d5c3ddfd5cd38a    20        0        0
/var/cache/fontconfig/385c0604a188198f04    20        0        0
/var/cache/fontconfig/4794a0821666d79190    20        0        0
/var/cache/fontconfig/56cf4f4769d0f4abc8    20        0        0
/var/cache/fontconfig/767a8244fc0220cfb5    20        0        0
/var/cache/fontconfig/8801497958630a81b7    20        0        0
/var/cache/fontconfig/99e8ed0e538f840c56    20        0        0
/var/cache/fontconfig/b9d506c9ac06c20b43    20        0        0
/var/cache/fontconfig/c05880de57d1f5e948    20        0        0
/var/cache/fontconfig/dc05db6664285cc2f1    20        0        0
/var/cache/fontconfig/e13b20fdb08344e0e6    20        0        0
/var/cache/fontconfig/e7071f4a29fa870f43    20        0        0
....
```

还有其它的选项可以筛选 smem 的输出，下面将会举两个例子。

要按照用户名筛选输出的信息，使用 -u 或者是 --userfilter="regex" 选项，就像下面的命令这样：

```
$ sudo smem -u
```

*按照用户报告内存使用情况*

```
User     Count     Swap      USS      PSS      RSS
rtkit        1        0      300      326     2548
kernoops     1        0      352      385     2684
avahi        2        0      408      851     4740
postfix      2        0      648     1140     5692
messagebus     1        0     1012     1173     3320
syslog       1        0     1400     1423     3236
www-data     2        0     5100     6572    13580
mpd          1        0     7416     8302    12896
nobody       2        0     4024    11305    24728
root        39        0   323804   353374   496552
tecmint     64        0  1708900  1871766  2819212
```

要按照进程名称筛选输出信息，使用 -P 或者是 --processfilter="regex" 选项，就像下面的命令这样：

```
$ sudo smem --processfilter="firefox"
```

*按照进程名称报告内存使用情况*

```
PID User     Command                         Swap      USS      PSS      RSS
 9212 root     sudo smem --processfilter=f        0     1172     1434     4856
 9213 root     /usr/bin/python /usr/bin/sm        0     7368     7793    11984
 4424 tecmint  /usr/lib/firefox/firefox           0   931732   937590   961504
```

输出的格式有时候也很重要，smem 提供了一些帮助您格式化内存使用报告的参数，我们将举出几个例子。

设置哪些列在报告中，使用 -c 或者是 --columns选项，就像下面的命令这样：

```
$ sudo smem -c "name user pss rss"
```

*按列报告内存使用情况*

```
Name                     User          PSS      RSS
cat                      tecmint       145     1784
cat                      tecmint       147     1676
ck-launch-sessi          tecmint       165     1780
gnome-pty-helpe          tecmint       178     1832
gnome-pty-helpe          tecmint       179     1916
getty                    root          184     2052
getty                    root          187     2060
getty                    root          187     2060
getty                    root          188     2124
getty                    root          196     2064
getty                    root          196     2136
sh                       tecmint       224     1540
acpid                    root          236     1604
syndaemon                tecmint       296     2560
rtkit-daemon             rtkit         326     2548
cron                     root          333     2344
avahi-daemon             avahi         334     1632
irqbalance               root          343     2096
upstart-socket-          root          351     1820
dbus-launch              tecmint       360     2160
upstart-file-br          root          371     1776
xdm                      root          378     2368
kerneloops               kernoops      386     2684
upstart-udev-br          root          427     2132
ssh-agent                tecmint       485      992
...
```

也可以调用 -p 选项以百分比的形式报告内存使用情况，就像下面的命令这样：

```
$ sudo smem -p
```

*按百分比报告内存使用情况*

```
 PID User     Command                         Swap      USS      PSS      RSS
 6367 tecmint  cat                            0.00%    0.00%    0.00%    0.02%
 6368 tecmint  cat                            0.00%    0.00%    0.00%    0.02%
 9307 tecmint  sh -c { sudo /usr/lib/linux    0.00%    0.00%    0.00%    0.02%
 2864 tecmint  /usr/bin/ck-launch-session     0.00%    0.00%    0.00%    0.02%
 3544 tecmint  sh -c /usr/lib/linuxmint/mi    0.00%    0.00%    0.00%    0.02%
 5758 tecmint  gnome-pty-helper               0.00%    0.00%    0.00%    0.02%
 7656 tecmint  gnome-pty-helper               0.00%    0.00%    0.00%    0.02%
 1441 root     /sbin/getty -8 38400 tty2      0.00%    0.00%    0.00%    0.03%
 1434 root     /sbin/getty -8 38400 tty5      0.00%    0.00%    0.00%    0.03%
 1444 root     /sbin/getty -8 38400 tty3      0.00%    0.00%    0.00%    0.03%
 1432 root     /sbin/getty -8 38400 tty4      0.00%    0.00%    0.00%    0.03%
 1452 root     /sbin/getty -8 38400 tty6      0.00%    0.00%    0.00%    0.03%
 2619 root     /sbin/getty -8 38400 tty1      0.00%    0.00%    0.00%    0.03%
 1504 root     acpid -c /etc/acpi/events -    0.00%    0.00%    0.00%    0.02%
 3311 tecmint  syndaemon -i 0.5 -K -R         0.00%    0.00%    0.00%    0.03%
 3143 rtkit    /usr/lib/rtkit/rtkit-daemon    0.00%    0.00%    0.00%    0.03%
 1588 root     cron                           0.00%    0.00%    0.00%    0.03%
 1589 avahi    avahi-daemon: chroot helpe     0.00%    0.00%    0.00%    0.02%
 1523 root     /usr/sbin/irqbalance           0.00%    0.00%    0.00%    0.03%
  585 root     upstart-socket-bridge --dae    0.00%    0.00%    0.00%    0.02%
 3033 tecmint  /usr/bin/dbus-launch --exit    0.00%    0.00%    0.00%    0.03%
....
```

下面的命令将会在输出的最后输出一行汇总信息：

```
$ sudo smem -t
```

*报告内存占用合计*

```
PID User     Command                         Swap      USS      PSS      RSS
 6367 tecmint  cat                                0      100      139     1784
 6368 tecmint  cat                                0      100      141     1676
 9307 tecmint  sh -c { sudo /usr/lib/linux        0       96      158     1508
 2864 tecmint  /usr/bin/ck-launch-session         0      144      163     1780
 3544 tecmint  sh -c /usr/lib/linuxmint/mi        0      108      170     1540
 5758 tecmint  gnome-pty-helper                   0      156      176     1916
 7656 tecmint  gnome-pty-helper                   0      156      176     1832
 1441 root     /sbin/getty -8 38400 tty2          0      152      181     2052
 1434 root     /sbin/getty -8 38400 tty5          0      156      184     2060
 1444 root     /sbin/getty -8 38400 tty3          0      156      184     2060
 1432 root     /sbin/getty -8 38400 tty4          0      156      185     2124
 1452 root     /sbin/getty -8 38400 tty6          0      164      193     2064
 2619 root     /sbin/getty -8 38400 tty1          0      164      193     2136
 1504 root     acpid -c /etc/acpi/events -        0      220      232     1604
 3311 tecmint  syndaemon -i 0.5 -K -R             0      260      298     2564
 3143 rtkit    /usr/lib/rtkit/rtkit-daemon        0      300      324     2548
 1588 root     cron                               0      292      326     2344
 1589 avahi    avahi-daemon: chroot helpe         0      124      332     1632
 1523 root     /usr/sbin/irqbalance               0      316      340     2096
  585 root     upstart-socket-bridge --dae        0      328      349     1820
 3033 tecmint  /usr/bin/dbus-launch --exit        0      328      359     2160
 1346 root     upstart-file-bridge --daemo        0      348      370     1776
 2607 root     /usr/bin/xdm                       0      188      375     2368
 1635 kernoops /usr/sbin/kerneloops               0      352      384     2684
  344 root     upstart-udev-bridge --daemo        0      400      426     2132
.....
-------------------------------------------------------------------------------
  134 11                                          0  2171428  2376266  3587972
```

另外，smem 也提供了选项以图形的形式报告内存的使用情况，我们将会在下一小节深入介绍。

比如，你可以生成一张进程的 PSS 和 RSS 值的条状图。在下面的例子中，我们会生成属于 root 用户的进程的内存占用图。

纵坐标为每一个进程的 PSS 和 RSS 值，横坐标为 root 用户的所有进程（的 ID）：

```
$ sudo smem --userfilter="root" --bar pid -c"pss rss"
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Linux-Memory-Usage-in-PSS-and-RSS-Values.png)

*Linux Memory Usage in PSS and RSS Values*

也可以生成进程及其 PSS 和 RSS 占用量的饼状图。以下的命令将会输出一张 root 用户的所有进程的饼状图。

`--pie` name 意思为以各个进程名字为标签，`-s` 选项用来以 PSS 的值排序。

```
$ sudo smem --userfilter="root" --pie name -s pss
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Linux-Memory-Consumption-by-Processes.png)

*Linux Memory Consumption by Processes*

除了 PSS 和 RSS ，其它的字段也可以用于图表的标签：

假如需要获得帮助，非常简单，仅需要输入 `smem -h` 或者是浏览帮助页面。

关于 smem 的介绍到底为止，不过想要更好的了解它，可以通过 man 手册获得更多的选项，然后一一实践。有什么想法或者疑惑，都可以跟帖评价。

参考链接: <https://www.selenic.com/smem/>


--------------------------------------------------------------------------------

via: http://www.tecmint.com/smem-linux-memory-usage-per-process-per-user/

作者：[Aaron Kili][a]
译者：[dongfengweixiao](https://github.com/dongfengweixiao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: https://emilics.com/notebook/enblog/p871.html
[2]: http://matplotlib.org/index.html
[3]: https://linux.cn/article-2324-1.html
[4]: https://www.archlinux.org/packages/community/i686/smem/
