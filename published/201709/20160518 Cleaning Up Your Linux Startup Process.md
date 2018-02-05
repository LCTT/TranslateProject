Linux 系统开机启动项清理
=======

![Linux cleanup](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner-cleanup-startup.png?itok=dCcKwdoP "Clean up your startup process")

一般情况下，常规用途的 Linux 发行版在开机启动时拉起各种相关服务进程，包括许多你可能无需使用的服务，例如<ruby>蓝牙<rt>bluetooth</rt></ruby>、Avahi、 <ruby>调制解调管理器<rt>ModemManager</rt></ruby>、ppp-dns（LCTT 译注：此处作者笔误 ppp-dns 应该为 pppd-dns) 等服务进程，这些都是什么东西？用于哪里，有何功能？

Systemd 提供了许多很好的工具用于查看系统启动情况，也可以控制在系统启动时运行什么。在这篇文章中，我将说明在 Systemd 类发行版中如何关闭一些令人讨厌的进程。

### 查看开机启动项

在过去，你能很容易通过查看 `/etc/init.d` 了解到哪些服务进程会在引导时启动。Systemd 以不同的方式展现，你可以使用如下命令罗列允许开机启动的服务进程。

```
$ systemctl list-unit-files --type=service | grep enabled
accounts-daemon.service                    enabled
anacron-resume.service                     enabled
anacron.service                            enabled
bluetooth.service                          enabled
brltty.service                             enabled
[...]
```

在此列表顶部，对我来说，蓝牙服务是冗余项，因为在该电脑上我不需要使用蓝牙功能，故无需运行此服务。下面的命令将停止该服务进程，并且使其开机不启动。

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

停用的服务进程仍然能够被另外一个服务进程启动。如果你真的想在任何情况下系统启动时都不启动该进程，无需卸载该它，只需要把它掩盖起来就可以阻止该进程在任何情况下开机启动。

```
$ sudo systemctl mask bluetooth.service
 Created symlink from /etc/systemd/system/bluetooth.service to /dev/null.
```

一旦你对禁用该进程启动而没有出现负面作用感到满意，你也可以选择卸载该程序。

通过执行命令可以获得如下服务列表：

```
$ systemctl list-unit-files --type=service                       
UNIT FILE                                  STATE   
accounts-daemon.service                    enabled
acpid.service                              disabled
alsa-restore.service                       static    
alsa-utils.service                         masked
```

你不能启用或禁用静态服务，因为静态服务被其他的进程所依赖，并不意味着它们自己运行。

### 哪些服务能够禁止？

如何知道你需要哪些服务，而哪些又是可以安全地禁用的呢？它总是依赖于你的个性化需求。

这里举例了几个服务进程的作用。许多服务进程都是发行版特定的，所以你应该看看你的发行版文档（比如通过 google 或 StackOverflow）。

- **accounts-daemon.service** 是一个潜在的安全风险。它是 AccountsService 的一部分，AccountsService 允许程序获得或操作用户账户信息。我不认为有好的理由能使我允许这样的后台操作，所以我选择<ruby>掩盖<rt>mask</rt></ruby>该服务进程。
- **avahi-daemon.service** 用于零配置网络发现，使电脑超容易发现网络中打印机或其他的主机，我总是禁用它，别漏掉它。
- **brltty.service** 提供布莱叶盲文设备支持，例如布莱叶盲文显示器。
- **debug-shell.service** 开放了一个巨大的安全漏洞（该服务提供了一个无密码的 root shell ，用于帮助 调试 systemd 问题），除非你正在使用该服务，否则永远不要启动服务。
- **ModemManager.service** 该服务是一个被 dbus 激活的守护进程，用于提供移动<ruby>宽频<rt>broadband</rt></ruby>（2G/3G/4G）接口，如果你没有该接口，无论是内置接口，还是通过如蓝牙配对的电话，以及 USB 适配器，那么你也无需该服务。
- **pppd-dns.service** 是一个计算机发展的遗物，如果你使用拨号接入互联网的话，保留它，否则你不需要它。
- **rtkit-daemon.service** 听起来很可怕，听起来像是 rootkit。 但是你需要该服务，因为它是一个<ruby>实时内核调度器<rt>real-time kernel scheduler</rt></ruby>。
- **whoopsie.service** 是 Ubuntu 错误报告服务。它用于收集 Ubuntu 系统崩溃报告，并发送报告到 https://daisy.ubuntu.com 。 你可以放心地禁止其启动，或者永久的卸载它。
- **wpa_supplicant.service** 仅在你使用 Wi-Fi 连接时需要。

### 系统启动时发生了什么？

Systemd 提供了一些命令帮助调试系统开机启动问题。该命令会重演你的系统启动的所有消息。

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

通过命令 `journalctl -b -1` 可以复审前一次启动，`journalctl -b -2` 可以复审倒数第 2 次启动，以此类推。

该命令会打印出大量的信息，你可能并不关注所有信息，只是关注其中问题相关部分。为此，系统提供了几个过滤器，用于帮助你锁定目标。让我们以进程号为 1 的进程为例，该进程是所有其它进程的父进程。

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

这些打印消息显示了什么被启动，或者是正在尝试启动。

一个最有用的命令工具之一 `systemd-analyze blame`，用于帮助查看哪个服务进程启动耗时最长。

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

这个特定的例子没有出现任何异常，但是如果存在系统启动瓶颈，则该命令将能发现它。

你也能通过如下资源了解 Systemd 如何工作：

- [理解和使用 Systemd](https://www.linux.com/learn/understanding-and-using-systemd)
- [介绍 Systemd 运行级别和服务管理命令](https://www.linux.com/learn/intro-systemd-runlevels-and-service-management-commands)
- [再次前行，另一个 Linux 初始化系统：Systemd 介绍](https://www.linux.com/learn/here-we-go-again-another-linux-init-intro-systemd)

----

via: https://www.linux.com/learn/cleaning-your-linux-startup-process

作者：[David Both](https://www.linux.com/users/cschroder)
译者：[penghuster](https://github.com/penghuster)
校对：[wxy](https://github.com/wxy)

本文由 LCTT 原创编译，Linux中国 荣誉推出
