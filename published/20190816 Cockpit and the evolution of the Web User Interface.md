[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12324-1.html)
[#]: subject: (Cockpit and the evolution of the Web User Interface)
[#]: via: (https://fedoramagazine.org/cockpit-and-the-evolution-of-the-web-user-interface/)
[#]: author: (Shaun Assam https://fedoramagazine.org/author/sassam/)

Cockpit 及其网页用户界面的演变
======

![][1]

3 年多以前，Fedora 杂志发表了一篇题为《[Cockpit 概览][2]》的文章。从那时起，Cockit 的界面有了一些引人注目的变化。今天的 Cockpit 更加简洁，更大的字体更好地利用了屏幕的空间。

本文将介绍它的用户界面的一些变化。还将探讨一些在网页界面中可用的通用工具，以简化那些单调的系统管理员任务。

### Cockpit 驾驶舱安装

Cockpit 可以使用 `dnf install cockpit` 命令安装。这提供了一个最小的设置，提供了使用该界面所需的基本工具。

另一个选择是安装 “Headless Management” 组，这将安装用于扩展 Cockpit 功能的附加包。它包括用于 NetworkManager、软件包、磁盘和 SELinux 管理的扩展。

运行以下命令，在启动时启用 Web 服务并打开防火墙端口：

```
$ sudo systemctl enable --now cockpit.socket
Created symlink /etc/systemd/system/sockets.target.wants/cockpit.socket -> /usr/lib/systemd/system/cockpit.socket

$ sudo firewall-cmd --permanent --add-service cockpit
success
$ sudo firewall-cmd --reload
success
```

### 登录网页界面

要访问网页界面，打开你最喜欢的浏览器，在地址栏中输入该服务器的域名或 IP，然后输入服务端口（9090）。由于 Cockpit 使用 HTTPS，安装过程中会创建一个自签证书来加密密码和其他敏感数据。你可以安全地接受这个证书，或者向你的系统管理员或受信任的来源请求 CA 证书。

一旦证书被接受，就会出现新改进的登录屏幕。长期使用的用户会注意到用户名和密码字段已被移到顶部。此外，凭证字段后面的白色背景会立即吸引用户的注意力。

![][3]

自上一篇文章后，登录界面增加了一个功能，就是用 `sudo` 权限登录 —— 如果你的账号是 `wheel` 组的成员。勾选 “对于特权任务，重用我的密码” 旁边的方框，就可以提升你的权限。

登录界面的另一个版本是连接到同样运行 Cockpit Web 服务的远程服务器的选项。点击 “其他选项” 并输入远程机器的主机名或 IP 地址，从本地浏览器管理它。

### 主屏幕视图

一开始，我们就会看到基本概述，带有常见的系统信息，这包括机器的品牌和型号、操作系统、系统是否是最新的，等等。

![][4]

点击系统的品牌/型号会显示硬件信息，如 BIOS/固件。它还包括与 `lspci` 中可以看到的组件的详情。

![][5]

点击任何一个选项，右边都会显示该设备的详细信息。例如，“CPU 核心百分比” 选项显示了用户和内核使用了多少 CPU 核心的详细信息。此外，“内存和交换” 图表显示了系统内存的使用量、缓存量和交换分区的活动量。“磁盘 I/O” 和 “网络流量” 图表连到了 Cockpit 的 “存储和网络” 部分。这些内容将在接下来详细探讨系统工具的一篇文章中重新探讨。

#### SSH 密钥和认证

由于安全是系统管理员的关键因素，Cockpit 现在有了查看机器 MD5 和 SHA256 密钥指纹的选项。点击 “显示指纹” 选项可以显示服务器的 ECDSA、ED25519 和 RSA 指纹密钥。

![][6]

你也可以通过点击右上角的用户名，选择“验证”，添加自己的密钥。点击 “添加密钥”，可以在其他系统上验证该机器。你也可以通过点击右侧的 “X” 按钮，撤销你在 Cockpit Web 服务中的权限。

![][7]

#### 更改主机名和加入域

更改主机名可以在主页上一键解决。单击当前显示的主机名，并在“更改主机名”框中输入新名称。最新的功能之一是提供了一个 “简称” 的选项。

Cockpit 增加的另一个功能是可以连接到目录服务器。点击 “加入域”，会出现一个弹窗，要求提供域地址或名称、组织单位（可选）和域管理员的凭证。“Domain Membership” 组提供了加入 LDAP 服务器所需的所有包，包括 FreeIPA，以及流行的 Active Directory。

要退出域，请点击域名，然后点击 “离开域”。将会出现一个警告，解释一旦系统不再在域上将会发生的变化。要确认，点击红色的 “离开域” 按钮。

![][8]

#### 配置 NTP 和系统日期和时间

使用命令行和编辑配置文件绝对可以完成最大限度的调整。然而，有些时候，一些更直接的方法就足够了。通过 Cockpit，你可以选择手动设置或使用 NTP 自动设置系统的日期和时间。一旦同步，右边的信息图标就会由红色变成蓝色。如果你手动设置日期和时间，该图标将消失。

要更改时区，请输入洲，下面会弹出城市列表。

![][9]

#### 关机和重启

你可以在 Cockpit 的主屏幕上轻松关闭和重启服务器。你也可以延迟关机/重启，并发送消息警告用户。

![][10]

#### 设置性能配置文件

如果安装了 `tuned` 和 `tuned-utils` 包，可以在主屏幕上更改性能配置文件。默认情况下，它被设置为推荐的配置文件。然而，如果服务器的用途需要更多的性能，我们可以在 Cockpit 中更改配置文件以满足这些需求。

![][11]

### 网页版终端控制台

一个 Linux 系统管理员的工具箱如果不能访问终端，将毫无用处。终端使得管理员可以对服务器进行微调，而不仅仅是 Cockpit 中的内容。随着主题功能的加入，管理员可以根据自己的喜好快速调整文字和背景颜色。

另外，如果你错输入了 `exit` 命令，点击右上角的 “重置” 按钮，会提供一个闪烁着光标的新屏幕。

![][12]

### 添加远程服务器和仪表板布局

“Headless Management” 组包括了仪表盘模块（`cockpit-dashboard`）。它以实时图表的形式提供了 CPU、内存、网络和磁盘性能的概览。远程服务器也可以通过同一界面进行添加和管理。

例如，要在仪表盘中添加远程计算机，请单击 “+” 按钮。输入服务器的名称或 IP 地址，并选择你要的颜色。这有助于你在图中区分服务器的统计数据。要在服务器之间进行切换，请点击主机名称（如下面的屏幕动画所示）。要从列表中删除一个服务器，点击勾选标记图标，然后点击红色垃圾桶图标。下面的例子演示了 Cockpit 如何管理一台名为 `server02.local.lan` 的远程机器。

![][13]

### 文档和寻找帮助

一如既往，手册页是查找文档的好地方。在命令行结果中进行简单搜索即可找到与使用和配置该 Web 服务的不同方面有关的页面。

```
$ man -k cockpit
cockpit (1)          - Cockpit
cockpit-bridge (1)   - Cockpit Host Bridge
cockpit-desktop (1)  - Cockpit Desktop integration
cockpit-ws (8)       - Cockpit web service
cockpit.conf (5)     - Cockpit configuration file
```

Fedora 仓库中也有一个名为 `cockpit-doc` 的软件包。这个软件包的描述是最好的解释。

> 《Cockpit 部署和开发者指南》向系统管理员展示了如何在他们的机器上部署 Cockpit，并帮助开发者嵌入或扩展 Cockpit。

更多文档请访问 <https://cockpit-project.org/external/source/HACKING>。

### 结论

本文只涉及 Cockpit 中的一些主要功能。管理存储设备、网络、用户账户和软件控制将在下一篇文章中介绍。此外，可选的扩展，如 389 目录服务，以及用于处理 Fedora Silverblue 中的软件包的`cockpit-ostree` 模块。

随着越来越多的用户采用 Cockpit，可选的功能会继续增加。这个界面对于想要一个轻量级界面来控制服务器的管理员来说是非常理想的。

你对 Cockpit 有什么看法？在下面的评论中分享你的经验和想法。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/cockpit-and-the-evolution-of-the-web-user-interface/

作者：[Shaun Assam][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sassam/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-816x345.jpg
[2]: https://fedoramagazine.org/cockpit-overview/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-login-screen.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-home-screen.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-system-info.gif
[6]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-ssh-key-fingerprints.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-authentication.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-hostname-domain.gif
[9]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-date-time.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-power-options.gif
[11]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-tuned.gif
[12]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-terminal.gif
[13]: https://fedoramagazine.org/wp-content/uploads/2019/08/cockpit-add-remote-servers.gif
