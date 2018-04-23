如何在 Linux 中快速监控多个主机
=====

![](https://www.ostechnix.com/wp-content/uploads/2018/03/rwho-1-720x340.png)
有很多监控工具可用来监控本地和远程 Linux 系统，一个很好的例子是 [**Cockpit**][1]。但是，这些工具的安装和使用比较复杂，至少对于新手管理员来说是这样。新手管理员可能需要花一些时间来弄清楚如何配置这些工具来监视系统。如果你想要以快速且粗略地在局域网中一次监控多台主机，你可能需要查看一下 **“rwho”** 工具。只要安装 rwho 实用程序，它将立即快速地监控本地和远程系统。你什么都不用配置！你所要做的就是在要监视的系统上安装 “rwho” 工具。

请不要将 rwho 视为功能丰富且完整的监控工具。这只是一个简单的工具，它只监视远程系统的**正常运行时间**，**加载**和**登录用户**。使用 “rwho” 使用程序，我们可以发现谁在哪台计算机上登录，一个被监视的计算机的列表，有正常运行时间（自上次重新启动以来的时间），有多少用户登录了，以及在过去的 1、5、15 分钟的平均负载。不多不少！而且，它只监视同一子网中的系统。因此，它非常适合小型和家庭办公网络。

### 在 Linux 中监控多台主机

让我来解释一下 rwho 是如何工作的。每个在网络上使用 rwho 的系统都将广播关于它自己的信息，其他计算机可以使用 rwhod-daemon 来访问这些信息。因此，网络上的每台计算机都必须安装 rwho。此外，为了分发或访问其他主机的信息，必须允许 rwho 端口（例如端口 513/UDP）通过防火墙/路由器。

好的，让我们来安装它。

我在 Ubuntu 16.04 LTS 服务器上进行了测试，rwho 在默认仓库中可用，所以，我们可以使用像下面这样的 APT 软件包管理器来安装它。
```
$ sudo apt-get install rwho

```

在基于 RPM 的系统如 CentOS, Fedora, RHEL上，使用以下命令来安装它：
```
$ sudo yum install rwho

```

如果你在防火墙/路由器之后，确保你已经允许使用 rwhod 513 端口。另外，使用命令验证 rwhod-daemon 是否正在运行：

$ sudo systemctl status rwhod

如果它尚未启动，运行以下命令启用并启动 rwhod 服务：
```
$ sudo systemctl enable rwhod
$ sudo systemctl start rwhod

```

现在是时候来监视系统了。运行以下命令以发现谁在哪台计算机上登录：
```
$ rwho
ostechni ostechnix:pts/5 Mar 12 17:41
root server:pts/0 Mar 12 17:42

```

正如你所看到的，目前我的局域网中有两个系统。本地系统用户是 **ostechnix** (Ubuntu 16.04 LTS)，远程系统的用户是 **root** (CentOS 7)。可能你已经猜到了，rwho 与 “who” 命令相似，但它会监视远程系统。

而且，我们可以使用以下命令找到网络上所有正在运行的系统的正常运行时间：
```
$ ruptime
ostechnix up 2:17, 1 user, load 0.09, 0.03, 0.01
server up 1:54, 1 user, load 0.00, 0.01, 0.05

```

这里，ruptime（类似于 “uptime” 命令）显示了我的 Ubuntu（本地） and CentOS（远程）系统的总运行时间。明白了吗？棒极了！以下是我的 Ubuntu 16.04 LTS 系统的示例屏幕截图：

![][3]

你可以在以下位置找到有关局域网中所有其他机器的信息：
```
$ ls /var/spool/rwho/
whod.ostechnix whod.server

```

它很小，但却非常有用，可以发现谁在哪台计算机上登录，以及正常运行时间和系统负载详情。

**建议阅读：**

请注意，这种方法有一个严重的漏洞。由于有关每台计算机的信息都通过网络进行广播，因此该子网中的每个人都可能获得此信息。通常情况下可以，但另一方面，当有关网络的信息分发给非授权用户时，这可能是不必要的副作用。因此，强烈建议在受信任和受保护的局域网中使用它。

更多的信息，查找 man 手册页。
```
$ man rwho

```

好了，这就是全部了。更多好东西要来了，敬请期待！

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/

作者：[SK][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/cockpit-monitor-administer-linux-servers-via-web-browser/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/rwho.png
[4]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=reddit (Click to share on Reddit)
[5]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=twitter (Click to share on Twitter)
[6]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=facebook (Click to share on Facebook)
[7]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=google-plus-1 (Click to share on Google+)
[8]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=linkedin (Click to share on LinkedIn)
[9]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=pocket (Click to share on Pocket)
[10]:https://api.whatsapp.com/send?text=How%20To%20Quickly%20Monitor%20Multiple%20Hosts%20In%20Linux%20https%3A%2F%2Fwww.ostechnix.com%2Fhow-to-quickly-monitor-multiple-hosts-in-linux%2F (Click to share on WhatsApp)
[11]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=telegram (Click to share on Telegram)
[12]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/?share=email (Click to email this to a friend)
[13]:https://www.ostechnix.com/how-to-quickly-monitor-multiple-hosts-in-linux/#print (Click to print)
