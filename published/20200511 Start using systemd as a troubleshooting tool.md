[#]: collector: (lujun9972)
[#]: translator: (tt67wq)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13452-1.html)
[#]: subject: (Start using systemd as a troubleshooting tool)
[#]: via: (https://opensource.com/article/20/5/systemd-troubleshooting-tool)
[#]: author: (David Both https://opensource.com/users/dboth)

使用 systemd 作为问题定位工具
======

> 虽然 systemd 并非真正的故障定位工具，但其输出中的信息为解决问题指明了方向。
 
![](https://img.linux.net.cn/data/attachment/album/202106/02/214321uqzzrqza9mlt9iam.jpg)

没有人会认为 systemd 是一个故障定位工具，但当我的 web 服务器遇到问题时，我对 systemd 和它的一些功能的不断了解帮助我找到并规避了问题。

我遇到的问题是这样，我的服务器 yorktown 为我的家庭办公网络提供名称服务 、DHCP、NTP、HTTPD 和 SendMail 邮件服务，它在正常启动时未能启动 Apache HTTPD 守护程序。在我意识到它没有运行之后，我不得不手动启动它。这个问题已经持续了一段时间，我最近才开始尝试去解决它。

你们中的一些人会说，systemd 本身就是这个问题的原因，根据我现在了解的情况，我同意你们的看法。然而，我在使用 SystemV 时也遇到了类似的问题。（在本系列文章的 [第一篇][2] 中，我探讨了围绕 systemd 作为旧有 SystemV 启动程序和启动脚本的替代品所产生的争议。如果你有兴趣了解更多关于 systemd 的信息，也可以阅读 [第二篇][3] 和 [第三篇][4] 文章。）没有完美的软件，systemd 和 SystemV 也不例外，但 systemd 为解决问题提供的信息远远多于 SystemV。

### 确定问题所在

找到这个问题根源的第一步是确定 httpd 服务的状态：

```
[root@yorktown ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: failed (Result: exit-code) since Thu 2020-04-16 11:54:37 EDT; 15min ago
     Docs: man:httpd.service(8)
  Process: 1101 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=exited, status=1/FAILURE)
 Main PID: 1101 (code=exited, status=1/FAILURE)
   Status: "Reading configuration..."
      CPU: 60ms

Apr 16 11:54:35 yorktown.both.org systemd[1]: Starting The Apache HTTP Server...
Apr 16 11:54:37 yorktown.both.org httpd[1101]: (99)Cannot assign requested address: AH00072: make_sock: could not bind to address 192.168.0.52:80
Apr 16 11:54:37 yorktown.both.org httpd[1101]: no listening sockets available, shutting down
Apr 16 11:54:37 yorktown.both.org httpd[1101]: AH00015: Unable to open logs
Apr 16 11:54:37 yorktown.both.org systemd[1]: httpd.service: Main process exited, code=exited, status=1/FAILURE
Apr 16 11:54:37 yorktown.both.org systemd[1]: httpd.service: Failed with result 'exit-code'.
Apr 16 11:54:37 yorktown.both.org systemd[1]: Failed to start The Apache HTTP Server.
[root@yorktown ~]#
```

这种状态信息是 systemd 的功能之一，我觉得比 SystemV 提供的任何功能都要有用。这里的大量有用信息使我很容易得出逻辑性的结论，让我找到正确的方向。我从旧的 `chkconfig` 命令中得到的是服务是否在运行，以及如果它在运行的话，进程 ID（PID）是多少。这可没多大帮助。

该状态报告中的关键条目显示，HTTPD 不能与 IP 地址绑定，这意味着它不能接受传入的请求。这表明网络启动速度不够快，因为 IP 地址还没有设置好，所以 HTTPD 服务还没有准备好与 IP 地址绑定。这是不应该发生的，所以我查看了我的网络服务的 systemd 启动配置文件；在正确的 `after` 和 `requires` 语句下，所有这些似乎都没问题。下面是我服务器上的 `/lib/systemd/system/httpd.service` 文件：

```
# Modifying this file in-place is not recommended, because changes 
# will be overwritten during package upgrades.  To customize the 
# behaviour, run "systemctl edit httpd" to create an override unit.

# For example, to pass additional options (such as -D definitions) to 
# the httpd binary at startup, create an override unit (as is done by                             
# systemctl edit) and enter the following:                                           

#    [Service]
#    Environment=OPTIONS=-DMY_DEFINE             

[Unit]                                               
Description=The Apache HTTP Server
Wants=httpd-init.service
After=network.target remote-fs.target nss-lookup.target httpd-init.service
Documentation=man:httpd.service(8)

[Service]
Type=notify
Environment=LANG=C

ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND
ExecReload=/usr/sbin/httpd $OPTIONS -k graceful
# Send SIGWINCH for graceful stop
KillSignal=SIGWINCH
KillMode=mixed
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

`httpd.service` 单元文件明确规定，它应该在 `network.target` 和 `httpd-init.service`（以及其他）之后加载。我试着用 `systemctl list-units` 命令找到所有这些服务，并在结果数据流中搜索它们。所有这些服务都存在，应该可以确保在设置网络 IP 地址之前，httpd 服务没有加载。

### 第一个解决方案

在互联网上搜索了一下，证实其他人在 httpd 和其他服务也遇到了类似的问题。这似乎是由于其中一个所需的服务向 systemd 表示它已经完成了启动，但实际上它却启动了一个尚未完成的子进程。通过更多搜索，我想到了一个规避方法。

我搞不清楚为什么花了这么久才把 IP 地址分配给网卡。所以我想，如果我可以将 HTTPD 服务的启动推迟合理的一段时间，那么 IP 地址就会在那个时候分配。

幸运的是，上面的 `/lib/systemd/system/httpd.service` 文件提供了一些方向。虽然它说不要修改它，但是它还是指出了如何操作：使用 `systemctl edit httpd` 命令，它会自动创建一个新文件（`/etc/systemd/system/httpd.service.d/override.conf`）并打开 [GNU Nano][5] 编辑器（如果你对 Nano 不熟悉，一定要看一下 Nano 界面底部的提示）。

在新文件中加入以下代码并保存：

```
[root@yorktown ~]# cd /etc/systemd/system/httpd.service.d/
[root@yorktown httpd.service.d]# ll
total 4
-rw-r--r-- 1 root root 243 Apr 16 11:43 override.conf
[root@yorktown httpd.service.d]# cat override.conf
# Trying to delay the startup of httpd so that the network is
# fully up and running so that httpd can bind to the correct
# IP address
#
# By David Both, 2020-04-16

[Service]
ExecStartPre=/bin/sleep 30
```

这个覆盖文件的 `[Service]` 段有一行代码，将 HTTPD 服务的启动时间推迟了 30 秒。下面的状态命令显示了等待时间里的服务状态：

```
[root@yorktown ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/httpd.service.d
           └─override.conf
           /usr/lib/systemd/system/httpd.service.d
           └─php-fpm.conf
   Active: activating (start-pre) since Thu 2020-04-16 12:14:29 EDT; 28s ago
     Docs: man:httpd.service(8)
Cntrl PID: 1102 (sleep)
    Tasks: 1 (limit: 38363)
   Memory: 260.0K
      CPU: 2ms
   CGroup: /system.slice/httpd.service
           └─1102 /bin/sleep 30

Apr 16 12:14:29 yorktown.both.org systemd[1]: Starting The Apache HTTP Server...
Apr 16 12:15:01 yorktown.both.org systemd[1]: Started The Apache HTTP Server.
[root@yorktown ~]#
```

这个命令显示了 30 秒延迟过后 HTTPD 服务的状态。该服务已经启动并正常运行。

```
[root@yorktown ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/httpd.service.d
           └─override.conf
           /usr/lib/systemd/system/httpd.service.d
           └─php-fpm.conf
   Active: active (running) since Thu 2020-04-16 12:15:01 EDT; 1min 18s ago
     Docs: man:httpd.service(8)
  Process: 1102 ExecStartPre=/bin/sleep 30 (code=exited, status=0/SUCCESS)
 Main PID: 1567 (httpd)
   Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
    Tasks: 213 (limit: 38363)
   Memory: 21.8M
      CPU: 82ms
   CGroup: /system.slice/httpd.service
           ├─1567 /usr/sbin/httpd -DFOREGROUND
           ├─1569 /usr/sbin/httpd -DFOREGROUND
           ├─1570 /usr/sbin/httpd -DFOREGROUND
           ├─1571 /usr/sbin/httpd -DFOREGROUND
           └─1572 /usr/sbin/httpd -DFOREGROUND

Apr 16 12:14:29 yorktown.both.org systemd[1]: Starting The Apache HTTP Server...
Apr 16 12:15:01 yorktown.both.org systemd[1]: Started The Apache HTTP Server.
```

我本来可以实验下更短的延迟时间是否也能奏效，但是我的系统并不用那么严格，所以我觉得不这样做。目前系统的工作状态很可靠，所以我很高兴。

因为我收集了所有这些信息，我将其作为 Bug[1825554][6] 报告给红帽 Bugzilla。我相信报告 Bug 比抱怨 Bug 更有有用。

### 更好的解决方案

把这个问题作为 bug 上报几天后，我收到了回复，表示 systemd 只是一个管理工具，如果 httpd 需要在满足某些要求之后被拉起，需要在单元文件中表达出来。这个回复指引我去查阅 `httpd.service` 的手册页。我希望我能早点发现这个，因为它是比我自己想出的更优秀的解决方案。这种方案明确的针对了前置目标单元，而不仅仅是随机延迟。

来自 [httpd.service 手册页][7]:

> **在启动时开启服务**
> 
> `httpd.service` 和 `httpd.socket` 单元默认是 _禁用_ 的。为了在启动阶段开启 httpd 服务，执行：`systemctl enable httpd.service`。在默认配置中，httpd 守护进程会接受任何配置好的 IPv4 或 IPv6 地址的 80 口上的连接（如果安装了 mod_ssl，就会接受 443 端口上的 TLS 连接）。
>
> 如果 httpd 被配置成依赖任一特定的 IP 地址（比如使用 `Listen` 指令），该地址可能只在启动阶段可用，又或者 httpd 依赖其他服务（比如数据库守护进程），那么必须配置该服务，以确保正确的启动顺序。
>
> 例如，为了确保 httpd 在所有配置的网络接口配置完成之后再运行，可以创建一个带有以下代码段的 drop-in 文件（如上述）：
> 
> ```
> [Unit]
> After=network-online.target
> Wants=network-online.target
> ```


我仍然觉得这是个 bug，因为在 `httpd.conf` 配置文件中使用 Listen 指令是很常见的，至少在我的经验中。我一直在使用 Listen 指令，即使在只有一个 IP 地址的主机上，在多个网卡和 IP 地址的机器上这显然也是有必要的。在 `/usr/lib/systemd/system/httpd.service` 默认配置文件中加入上述几行，对不使用 `Listen` 指令的不会造成问题，对使用 `Listen` 指令的则会规避这个问题。

同时，我将使用建议的方法。

### 下一步

本文描述了一个我在服务器上启动 Apache HTTPD 服务时遇到的一个问题。它指引你了解我在解决这个问题上的思路，并说明了我是如何使用 systemd 来协助解决问题。我也介绍了我用 systemd 实现的规避方法，以及我按照我的 bug 报告得到的更好的解决方案。

如我在开头处提到的那样，这有很大可能是一个 systemd 的问题，特别是 httpd 启动的配置问题。尽管如此，systemd 还是提供了工具让我找到了问题的可能来源，并制定和实现了规避方案。两种方案都没有真正令我满意地解决问题。目前，这个问题根源依旧存在，必须要解决。如果只是在 `/usr/lib/systemd/system/httpd.service` 文件中添加推荐的代码，那对我来说是可行的。

在这个过程中我发现了一件事，我需要了解更多关于定义服务启动顺序的知识。我会在下一篇文章中探索这个领域，即本系列的第五篇。

### 资源

网上有大量的关于 systemd 的参考资料，但是大部分都有点简略、晦涩甚至有误导性。除了本文中提到的资料，下列的网页提供了跟多可靠且详细的 systemd 入门信息。

- Fedora 项目有一篇切实好用的 [systemd 入门][8]，它囊括了几乎所有你需要知道的关于如何使用 systemd 配置、管理和维护 Fedora 计算机的信息。
- Fedora 项目也有一个不错的 [备忘录][9]，交叉引用了过去 SystemV 命令和 systemd 命令做对比。
- 关于 systemd 的技术细节和创建这个项目的原因，请查看 [Freedesktop.org][10] 上的 [systemd 描述][11]。
- [Linux.com][12] 的“更多 systemd 的乐趣”栏目提供了更多高级的 systemd [信息和技巧][13]。

此外，还有一系列深度的技术文章，是由 systemd 的设计者和主要开发者 Lennart Poettering 为 Linux 系统管理员撰写的。这些文章写于 2010 年 4 月至 2011 年 9 月间，但它们现在和当时一样具有现实意义。关于 systemd 及其生态的许多其他好文章都是基于这些文章：

  * [Rethinking PID 1][14]
  * [systemd for Administrators，Part I][15]
  * [systemd for Administrators，Part II][16]
  * [systemd for Administrators，Part III][17]
  * [systemd for Administrators，Part IV][18]
  * [systemd for Administrators，Part V][19]
  * [systemd for Administrators，Part VI][20]
  * [systemd for Administrators，Part VII][21]
  * [systemd for Administrators，Part VIII][22]
  * [systemd for Administrators，Part IX][23]
  * [systemd for Administrators，Part X][24]
  * [systemd for Administrators，Part XI][25]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/systemd-troubleshooting-tool

作者：[David Both][a]
选题：[lujun9972][b]
译者：[tt67wq](https://github.com/tt67wq)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://opensource.com/article/20/4/systemd
[3]: https://opensource.com/article/20/4/systemd-startup
[4]: https://opensource.com/article/20/4/understanding-and-using-systemd-units
[5]: https://www.nano-editor.org/
[6]: https://bugzilla.redhat.com/show_bug.cgi?id=1825554
[7]: https://www.mankier.com/8/httpd.service#Description-Starting_the_service_at_boot_time
[8]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[9]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[10]: http://Freedesktop.org
[11]: http://www.freedesktop.org/wiki/Software/systemd
[12]: http://Linux.com
[13]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[14]: http://0pointer.de/blog/projects/systemd.html
[15]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[16]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[17]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[18]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[19]: http://0pointer.de/blog/projects/three-levels-of-off.html
[20]: http://0pointer.de/blog/projects/changing-roots
[21]: http://0pointer.de/blog/projects/blame-game.html
[22]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[23]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[24]: http://0pointer.de/blog/projects/instances.html
[25]: http://0pointer.de/blog/projects/inetd.html
