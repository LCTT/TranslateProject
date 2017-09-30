漫谈传统的 Linux 初始化系统的运行级别
=====

> 了解运行级别是如何配置的，如何改变系统运行级别以及修改对应状态下运行的服务。

![操作 Linux 的运行级别](https://images.idgesg.net/images/article/2017/09/run-levels-vincent_desjardins-100734685-large.jpg)

在 Linux 系统中，<ruby>运行级别<rt>run level</rt></ruby>是指运维的级别，用于描述一种表明什么服务是可用的系统运行状态。

运行级别 1 是严格限制的，仅仅用于系统维护；该级别下，网络连接将不可操作，但是管理员可以通过控制台连接登录系统。

其他运行级别的系统允许任何人登录和使用，但是不同级别中可使用的服务不同。本文将探索如何配置运行级别，如何交互式改变系统运行级别以及修改该状态下可用的服务。

Linux 系统的默认运行状态是一个在系统开机时使用的运行级别（除非有其他的指示），它通常是在 `/etc/inittab` 文件中进行配置的，该文件内容通常如下：

```
id:3:initdefault
```

包括 Debian 系统在内的一些系统，默认运行级别为 2，而不是上述文件中的 3，甚至都没有 `/etc/inittab` 文件。

运行级别在默认情况下是如何被配置，其配置依赖于你所运行的 Linux 操作系统的具体发行版本。 例如，在某些系统中， 运行级别 2 是多用户模式，运行级别 3 是多用户模式并支持 NFS （网络文件系统）。 在另外一些系统，运行级别 2 - 5 基本相同，运行级别 1 是单用户模式。例如，Debian 系统的所用运行级别如下：

```
0 = 停机
1 = 单用户（维护模式）
2 = 多用户模式
3-5 = 同 2 一样
6 = 重启
```

在 Linux 系统上，运行级别 3 用于共享文件系统给其它系统，可以方便地只通过改变系统的运行级别来启动和停止文件系统共享。系统从运行级别 2 改变到 3 系统将允许文件系统共享，反之从运行级别 3 改变到 2 则系统不支持文件系统共享。

在某个运行级别中，系统运行哪些进程依赖于目录 `/etc/rc?.d` 目录的内容，其中 `?` 可以是 2、 3、 4 或 5 （对应于相应的运行级别）。

在以下示例中（Ubuntu 系统），由于这些目录的配置是相同的，我们将看见上述 4 个级别对应的目录中的内容是一致的。

```
/etc/rc2.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
/etc/rc2.d$ cd ../rc3.d
/etc/rc3.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
/etc/rc3.d$ cd ../rc4.d
/etc/rc4.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
/etc/rc4.d$ cd ../rc5.d
/etc/rc5.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
```

这些都是什么文件？它们都是指向 `/etc/init.d` 目录下用于启动服务的脚本符号连接。 这些文件的文件名是至关重要的， 因为它们决定了这些脚本文件的执行顺序，例如, S20 脚本是在 S50 脚本前面运行的。

```
$ ls -l
total 4
-rw-r--r-- 1 root root 677 Feb 16  2016 README
lrwxrwxrwx 1 root root  20 Aug 30 14:40 S20kerneloops -> ../init.d/kerneloops
lrwxrwxrwx 1 root root  15 Aug 30 14:40 S20rsync -> ../init.d/rsync
lrwxrwxrwx 1 root root  23 Aug 30 16:10 S20smartmontools -> ../init.d/smartmontools
lrwxrwxrwx 1 root root  27 Aug 30 14:40 S20speech-dispatcher -> ../init.d/speech-dispatcher
lrwxrwxrwx 1 root root  17 Aug 31 14:12 S20sysstat -> ../init.d/sysstat
lrwxrwxrwx 1 root root  15 Aug 30 14:40 S50saned -> ../init.d/saned
lrwxrwxrwx 1 root root  19 Aug 30 14:40 S70dns-clean -> ../init.d/dns-clean
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S70pppd-dns -> ../init.d/pppd-dns
lrwxrwxrwx 1 root root  21 Aug 30 14:40 S99grub-common -> ../init.d/grub-common
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S99ondemand -> ../init.d/ondemand
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S99rc.local -> ../init.d/rc.local
```

如你所想，目录 `/etc/rc1.d` 因运行级别 1 的特殊而不同。它包含的符号链接指向非常不同的一套脚本。 同样也要注意到其中一些脚本以 `K` 开头命名，而另一些与其它运行级别脚本一样以 `S` 开头命名。这是因为当系统进入单用户模式时， 一些服务需要**停止**。 然而这些 K 开头的符号链接指向了其它级别 S 开头的符号链接的同一文件时， K（kill）表示这个脚本将以指示其停止的参数执行，而不是以启动的参数执行。

```
/etc/rc1.d$ ls -l
total 4
lrwxrwxrwx 1 root root  20 Aug 30 14:40 K20kerneloops -> ../init.d/kerneloops
lrwxrwxrwx 1 root root  15 Aug 30 14:40 K20rsync -> ../init.d/rsync
lrwxrwxrwx 1 root root  15 Aug 30 14:40 K20saned -> ../init.d/saned
lrwxrwxrwx 1 root root  23 Aug 30 16:10 K20smartmontools -> ../init.d/smartmontools
lrwxrwxrwx 1 root root  27 Aug 30 14:40 K20speech-dispatcher -> ../init.d/speech-dispatcher
-rw-r--r-- 1 root root 369 Mar 12  2014 README
lrwxrwxrwx 1 root root  19 Aug 30 14:40 S30killprocs -> ../init.d/killprocs
lrwxrwxrwx 1 root root  19 Aug 30 14:40 S70dns-clean -> ../init.d/dns-clean
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S70pppd-dns -> ../init.d/pppd-dns
lrwxrwxrwx 1 root root  16 Aug 30 14:40 S90single -> ../init.d/single
```

你可以改变系统的默认运行级别，尽管这很少被用到。例如，通过修改前文中提到的 `/etc/inittab` 文件，你能够配置 Debian 系统的默认运行级别为 3 （而不是 2），以下是该文件示例：

```
id:3:initdefault:
```      

一旦你修改完成并重启系统， `runlevel` 命令将显示如下：

```
$ runlevel
N 3
```

另外一种可选方式，使用 `init 3` 命令，你也能改变系统运行级别（且无需重启立即生效）， `runlevel` 命令的输出为：

```
$ runlevel
2 3
```

当然，除非你修改了系统默认级别的 `/etc/rc?.d` 目录下的符号链接，使得系统默认运行在一个修改的运行级别之下，否则很少需要通过创建或修改 `/etc/inittab` 文件改变系统的运行级别。

### 在 Linux 系统中如何使用运行级别？

为了扼要重述在系统中如何使用运行级别，下面有几个关于运行级别的快速问答问题：

**如何查询系统当前的运行级别？**

使用 `runlevel` 命令。

**如何查看特定运行级别所关联的服务进程？**

查看与该运行级别关联的运行级别开始目录（例如， `/etc/rc2.d` 对应于运行级别 2）。

**如何查看系统的默认运行级别？**

首先，查看 `/etc/inittab` 文件是否存在。如果不存在，就执行 `runlevel` 命令查询，你一般就已经处在该运行级别。

**如何改变系统运行级别？**

用 `init` 命令（例如 `init 3`）临时改变运行级别，通过修改或创建 `/etc/inittab` 文件永久改变其运行级别。

**能改变特定运行级别下运行的服务么？**

当然，通过改变对应的 `/etc/rc?.d` 目录下的符号连接即可。

**还有一些其他的什么需要考虑？**

当改变系统运行级别时，你应该特别小心，确保不影响到系统上正在运行的服务或者正在使用的用户。

（题图：[Vincent Desjardins][15] [(CC BY 2.0)][16]）


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3222070/linux/maneuvering-around-run-levels-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[penghuster](https://github.com/penghuster)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.networkworld.com/article/3218728/linux/how-log-rotation-works-with-logrotate.html
[2]:https://www.networkworld.com/article/3219684/linux/half-a-dozen-clever-linux-command-line-tricks.html
[3]:https://www.networkworld.com/article/3219736/linux/how-to-use-the-motd-file-to-get-linux-users-to-pay-attention.html
[4]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[5]:https://www.networkworld.com/article/3222828/home-tech/52-off-299-piece-all-purpose-first-aid-kit-deal-alert.html
[6]:https://www.networkworld.com/article/3222847/mobile/save-a-whopping-100-on-amazon-echo-right-now-by-going-refurbished-deal-alert.html
[7]:https://www.networkworld.com/article/3221348/mobile/35-off-etekcity-smart-plug-2-pack-energy-monitoring-and-alexa-compatible-deal-alert.html
[8]:https://www.networkworld.com/article/3218728/linux/how-log-rotation-works-with-logrotate.html
[9]:https://www.networkworld.com/article/3219684/linux/half-a-dozen-clever-linux-command-line-tricks.html
[10]:https://www.networkworld.com/article/3219736/linux/how-to-use-the-motd-file-to-get-linux-users-to-pay-attention.html
[11]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[12]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[13]:https://www.networkworld.com/article/3222847/mobile/save-a-whopping-100-on-amazon-echo-right-now-by-going-refurbished-deal-alert.html
[14]:https://www.networkworld.com/article/3221348/mobile/35-off-etekcity-smart-plug-2-pack-energy-monitoring-and-alexa-compatible-deal-alert.html
[15]:https://www.flickr.com/photos/endymion120/4824696883/in/photolist-8mkQi2-8vtyRx-8vvYZS-i31xQj-4TXTS2-S7VRNC-azimYK-dW8cYu-Sb5b7S-S7VRES-fpSVvo-61Zpn8-WxFwGi-UKKq3x-q6NSnC-8vsBLr-S3CPxn-qJUrLr-nDnpNu-8d7a6Q-T7mGpN-RE26wj-SeEXRa-5mZ7LG-Vp7t83-fEG5HS-Vp7sU7-6JpNBi-RCuR8P-qLzCL5-6WsfZx-5nU1tF-6ieGFi-3P5xwh-8mnxpo-hBXwSj-i3iCur-9dmrST-6bXk8d-8vtDb4-i2KLwU-5jhfU6-8vwbrN-ShAtNm-XgzXmb-8rad18-VfXm4L-8tQTrh-Vp7tcb-UceVDB
[16]:https://creativecommons.org/licenses/by/2.0/legalcode
