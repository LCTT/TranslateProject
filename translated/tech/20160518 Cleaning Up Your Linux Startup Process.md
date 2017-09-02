Linux 系统开机启动项清理
=======
![Linux cleanup](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner-cleanup-startup.png?itok=dCcKwdoP "Clean up your startup process")

一般情况下, Linux 发行版在开机启动时拉起所有的相关服务进程, 包括许多你可能无需使用的服务, 例如<ruby>蓝牙<rt>bluetooth</rt></ruby>, Avahi,  <ruby>调制解调管理器<rt>ModemManager</rt></ruby>, ppp-dns(（LCTT 译注：此处作者笔误 ppp-dns 应该为 pppd-dns) 等服务进程, 用于哪里, 有何功能?

systemd 提供了许多很好的工具, 用于查看系统启动情况, 控制系统启动工作. 该文章中将说明在 systemd 控制系统启动的过程中如何关闭一些<ruby>令人讨厌<rt>cruft</rt></ruby>的进程。

###查看开机启动项
在老式系统启动方式 systemV 中，在 /etc/init.d 中你能很容易看到服务进程是否被设置为开机启动项。Systemd 以不同的方式展现，可以使用如下命令罗列允许开机启动的服务进程。
```
$ systemctl list-unit-files --type=service | grep enabled
accounts-daemon.service                    enabled
anacron-resume.service                     enabled
anacron.service                            enabled
bluetooth.service                          enabled
brltty.service                             enabled
[...]
```
在此列表中, 对我来说, 蓝牙服务是冗余项, 因为在该电脑上我不需要使用蓝牙功能, 故无需运行此服务. 下面的命令将停止该服务进程，并且使其开机不启动。
```
$ sudo systemctl stop bluetooth.service
$ sudo systemctl disable bluetooth.service
```
你可以通过下面命令确定是否操作成功。
```
$ systemctl status bluetooth.service
 bluetooth.service - Bluetooth service
  Loaded: loaded (/lib/systemd/system/bluetooth.service; disabled; vendor preset: enabled)
  Active: inactive (dead)
    Docs: man:bluetoothd(8)
```
一个开机不启动的服务进程仍然能够被另外一个服务进程启动。如果你真的想在任何情况下系统启动时都不启动该进程，你可以卸载该程序；若在不卸载程序的情况达到此效果，你可以执行如下命令在任何情况下阻止该进程开机启动。
```
$ sudo systemctl mask bluetooth.service
 Created symlink from /etc/systemd/system/bluetooth.service to /dev/null.
```
一旦你对禁止该进程启动的效果感到满意时，你也可以选择卸载该程序。

通过执行命令可以获得如下服务列表：
```
$ systemctl list-unit-files --type=service                       
UNIT FILE                                  STATE   
accounts-daemon.service                    enabled
acpid.service                              disabled
alsa-restore.service                       static    
alsa-utils.service                         masked
```
你不能使能或使不能静态服务，因为静态服务是依赖于其他的进程，意味着其不能自启动。

###哪些服务能够禁止？

如何知道你是否能够禁止某服务或需要何服务？它总是依赖于你的个性化需求。

这里有列出了几个服务进程的作用，所有服务进程都可以在发行版规范中找到，你也可以通过搜索方式查询起作用。

- accounts-daemon. 该服务存在潜在的安全威胁。它是账号服务的一部分，它被允许获得或操作用户账户信息。我不认为存在一个好的理由能使我允许这样的后台操作，所以我选择<ruby>掩盖<rt>mask</rt></ruby>该服务进程。
- avahi-daemon. 该服务用于零配置网络发现，使电脑极易发现网络中打印机或其他的主机，我总是使其开机不启动，并从未不习惯于此。
- brltty.service. 该服务提供布莱叶盲文设备支持，例如布莱叶盲文显示器。
- debug-shell.service. 该服务打开一个重要的安全漏洞（该服务提供了一个无密码的 root 用户用于帮助 systemd 问题的调试。），除非你正在使用该服务，否则永远不要启动服务。
- ModemManager.service. 该服务是一个被 dbus 激活的守护进程，用于提供移动<ruby>宽频<rt>broadband</rt></ruby>（2G/3G/4G）接口，如果你不需要该内置接口通过如蓝牙、USB 适配器等来连接手机，那么你也无需该服务。
- pppd-dns.service. 该是一个计算机发展的遗物，如果你需要通过互联网打电话的话，保留它，否则<ruby>掩盖<rt>mask</rt></ruby>它。
- rtkit-daemon.service. 该服务听起来很可怕, 其发音与 rootkit 相似. 但是你需要该服务, 因为它是一个<ruby>实时内核调度器<rt>real-time kernel scheduler</rt></ruby>.
- whoopsie.service. 该服务是 Ubuntu 错误报告服务. 它用于收集 Ubuntu 系统崩溃报告,并发送报告到 https://daisy.ubuntu.com. 你可以放心地禁止其启动, 或者永久的卸载它.
- wpa_supplicant.service. 该服务仅仅在 Wi-Fi 连接时需要.

###系统<ruby>启动<rt>bootup</rt></ruby>时发生什么?
systemd 提供了一些命令帮助调试系统开机启动问题. 该命令重演系统启动的消息打印.
```
$ journalctl -b

-- Logs begin at Mon 2016-05-09 06:18:11 PDT,
end at Mon 2016-05-09 10:17:01 PDT. --
May 16 06:18:11 studio systemd-journal[289]:
Runtime journal (/run/log/journal/) is currently using 8.0M.
Maximum allowed usage is set to 157.2M.
Leaving at least 235.9M free (of currently available 1.5G of space).
Enforced usage limit is thus 157.2M.
[...]
```
通过命令 `journalctl -b -1` 可以复审前一次启动, `journalctl -b -2` 可以复审倒数第2次启动, 以此类推.

该命令打印出大量的信息. 你可能并不关注所有信息, 只是关注其中问题相关部分. 为此, 系统提供了几个过滤命令, 用于帮助你锁定目标. 让我们以进程号为 1 的进程为例, 该进程是所有其他进程的父进程.
```
$ journalctl _PID=1

May 08 06:18:17 studio systemd[1]: Starting LSB: Raise network interfaces....
May 08 06:18:17 studio systemd[1]: Started LSB: Raise network interfaces..
May 08 06:18:17 studio systemd[1]: Reached target System Initialization.
May 08 06:18:17 studio systemd[1]: Started CUPS Scheduler.
May 08 06:18:17 studio systemd[1]: Listening on D-Bus System Message Bus Socket
May 08 06:18:17 studio systemd[1]: Listening on CUPS Scheduler.
[...]
```
这些打印消息显示了什么被启动, 或者是正在尝试启动.

一个最有用的命令工具之一 `systemd-analyze blame`, 用于帮助查看哪个服务进程启动耗时最长.
```
$ systemd-analyze blame
         8.708s gpu-manager.service
         8.002s NetworkManager-wait-online.service
         5.791s mysql.service
         2.975s dev-sda3.device
         1.810s alsa-restore.service
         1.806s systemd-logind.service
         1.803s irqbalance.service
         1.800s lm-sensors.service
         1.800s grub-common.service
```
这是一个没有任何异常的特殊样例, 但是如果存在系统启动<ruby>瓶颈<rt>bottleneck</rt></ruby>, 则该命令将发现它.

你也能了解 systemd 如何工作通过如下资源:
- [Understanding and Using Systemd](https://www.linux.com/learn/understanding-and-using-systemd)
- [Intro to Systemd Runlevels and Service Management Commands](https://www.linux.com/learn/intro-systemd-runlevels-and-service-management-commands)
- [Here We Go Again, Another Linux Init: Intro to systemd](https://www.linux.com/learn/here-we-go-again-another-linux-init-intro-systemd)

via: https://www.linux.com/learn/cleaning-your-linux-startup-process

作者：[David Both](https://www.linux.com/users/cschroder)
译者：[penghuster](https://github.com/penghuster)
校对：校对者ID

本文由 LCTT 原创编译，Linux中国 荣誉推出
