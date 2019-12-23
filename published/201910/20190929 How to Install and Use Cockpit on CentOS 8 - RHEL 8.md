[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11449-1.html)
[#]: subject: (How to Install and Use Cockpit on CentOS 8 / RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-use-cockpit-tool-centos8-rhel8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在 CentOS 8/RHEL 8 上安装和使用 Cockpit
======

![](https://img.linux.net.cn/data/attachment/album/201910/12/093405gb8hv3exdbsdyfda.jpg)

Cockpit 是一个基于 Web 的服务器管理工具，可用于 CentOS 和 RHEL 系统。最近发布的 CentOS 8 和 RHEL 8，其中 cockpit 是默认的服务器管理工具。它的软件包在默认的 CentOS 8 和 RHEL 8 仓库中就有。Cockpit 是一个有用的基于 Web 的 GUI 工具，系统管理员可以通过该工具监控和管理 Linux 服务器，它还可用于管理服务器、容器、虚拟机中的网络和存储，以及检查系统和应用的日志。

在本文中，我们将演示如何在 CentOS 8 和 RHEL 8 中安装和设置 Cockpit。

### 在 CentOS 8/RHEL 8 上安装和设置Cockpit

登录你的 CentOS 8/RHEL 8，打开终端并执行以下 `dnf` 命令：

```
[root@linuxtechi ~]# dnf install cockpit -y
```

运行以下命令启用并启动 cockpit 服务：

```
[root@linuxtechi ~]# systemctl start cockpit.socket
[root@linuxtechi ~]# systemctl enable cockpit.socket
```

使用以下命令在系统防火墙中允许 Cockpit 端口：

```
[root@linuxtechi ~]# firewall-cmd --permanent --add-service=cockpit
[root@linuxtechi ~]# firewall-cmd --reload
```

验证 cockpit 服务是否已启动和运行，执行以下命令：

```
[root@linuxtechi ~]# systemctl status cockpit.socket
[root@linuxtechi ~]# ss -tunlp | grep cockpit
[root@linuxtechi ~]# ps auxf|grep cockpit
```

![cockpit-status-centos8-rhel8][1]

### 在 CentOS 8/RHEL 8 上访问 Cockpit

正如我们在上面命令的输出中看到的，cockpit 正在监听 tcp 9090 端口，打开你的 Web 浏览器并输入 url：`https://<Your-CentOS8/RHEL8-System-IP>:9090`。

![CentOS8-cockpit-login-screen][2]

RHEL 8 中的 Cockpit 登录页面：

![RHEL8-Cockpit-Login-Screen][3]

使用有管理员权限的用户名，或者我们也可以使用 root 用户的密码登录。如果要将管理员权限分配给任何本地用户，请执行以下命令：

```
[root@linuxtechi ~]# usermod -G wheel pkumar
```

这里 `pkumar` 是我的本地用户，

在输入用户密码后，选择 “Reuse my password for privileged tasks”，然后单击 “Log In”，然后我们看到以下页面：

![cockpit-dashboard-centos8][4]

在左侧栏上，我们可以看到可以通过 cockpit GUI 监控和配置的内容，

假设你要检查 CentOS 8/RHEL 8 中是否有任何可用更新，请单击 “System Updates”：

![Software-Updates-Cockpit-GUI-CentOS8-RHEL8][5]

要安装所有更新，点击 “Install All Updates”：

![Install-Software-Updates-CentOS8-RHEL8][6]

如果想要修改网络并要添加 Bond 接口和网桥，请单击 “Networking”：

![Networking-Cockpit-Dashboard-CentOS8-RHEL8][7]

如上所见，我们有创建 Bond 接口、网桥和 VLAN 标记接口的选项。

假设我们想创建一个 `br0` 网桥，并要为它添加 `enp0s3` 端口，单击 “Add Bridge”：

将网桥名称指定为 `br0`，将端口指定为 `enp0s3`，然后单击“Apply”。

![Add-Bridge-Cockpit-CentOS8-RHEL8][8]

在下个页面，我们将看到该网桥处于活动状态，并且获得了与 enp0s3 接口相同的 IP：

![Bridge-Details-Cockpit-Dashboard-CentOS8-RHEL8][9]

如果你想检查系统日志，单击 “Logs”，我们可以根据严重性查看日志：

![System-Logs-Cockpit-Dashboard-CentOS8-RHEL8][10]

本文就是这些了，类似地，系统管理员可以使用 cockpit 的其他功能来监控和管理 CentOS 8 和 RHEL 8 服务器。如果这些步骤可以帮助你在 Linux 服务器上设置 cockpit，请在下面的评论栏分享你的反馈和意见。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-use-cockpit-tool-centos8-rhel8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/wp-content/uploads/2019/09/cockpit-status-centos8-rhel8.jpg
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/09/CentOS8-cockpit-login-screen.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/RHEL8-Cockpit-Login-Screen.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/cockpit-dashboard-centos8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Software-Updates-Cockpit-GUI-CentOS8-RHEL8.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Install-Software-Updates-CentOS8-RHEL8.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Networking-Cockpit-Dashboard-CentOS8-RHEL8.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Add-Bridge-Cockpit-CentOS8-RHEL8.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Bridge-Details-Cockpit-Dashboard-CentOS8-RHEL8.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/09/System-Logs-Cockpit-Dashboard-CentOS8-RHEL8.jpg
