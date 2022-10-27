[#]: subject: (How to Install and Use XRDP on Ubuntu for Remote Desktop Connection)
[#]: via: (https://itsfoss.com/xrdp-ubuntu/)
[#]: author: (Hunter Wittenborn https://itsfoss.com/author/hunter/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13463-1.html)

如何在 Ubuntu 上安装和使用 XRDP 进行远程桌面连接
======

![](https://img.linux.net.cn/data/attachment/album/202106/07/093752qs3feworsvyoflvl.jpg)

> 这是一份初学者指南，展示了在基于 Ubuntu 的 Linux 发行版上设置 XRDP 所需要遵循的步骤。有了它，你就可以从不同的电脑上访问你的 Ubuntu 系统，并以图形方式使用它。

微软的 [远程桌面协议][1]（RDP） 是一个允许从一台计算机到另一台计算机进行图形化远程桌面连接的协议。RDP 的工作原理是让一台主机运行软件，允许其他几台计算机连接到它。

[XRDP][2] 是 RDP 的一个开源实现，不需要运行任何专有程序。XRDP 不仅试图遵循 RDP，而且还与常规的 RDP 客户端兼容，如 [Remmina][3] 和 [GNOME Boxes][4]。

下面是 XRDP 连接屏幕的样子。

![][5]

### 使用 XRDP 需要注意的事项

虽然 XRDP 对于机器的远程访问非常好用，但重要的是要知道 XRDP **不** 适合什么。

#### 如果你需要一个安全的连接，请不要使用 XRDP

通过 XRDP 建立的连接可以被攻击者查看和修改，因此应避免任何敏感信息。这一点可以通过使用 SSH 连接或证书来缓解，但这两者都需要更复杂的设置，这里就不一一介绍了。

#### XRDP 在默认情况下不能很好地应用主题

在我的测试中，XRDP 默认似乎从未应用过 [Ubuntu][6] 主题。在文章的结尾处有关于解决这个问题的说明。

#### 如果你只想/需要一个 CLI 环境，就不要使用 XRDP

XRDP 是为在 GUI 环境中使用而设计和制造的。如果你打算在 CLI 环境中使用它，比如在服务器上，你应该看看其他工具，比如 SSH。

### 在 Ubuntu 上安装和使用 XRDP

下面是这个远程连接设置正常工作所需的设置：

* 一个安装了 XRDP 服务器的 Linux 系统。这是一个将被远程访问的系统。
* 远程系统应该和你的系统在同一个网络上，或者它应该有一个 [公共 IP 地址][15]。
* 远程 Linux 系统的用户名和密码。
* 安装有 RDP 客户端的另一个系统（无论是 Linux、macOS 还是 Windows）。

![][8]

#### 第 1 步：在远程计算机上安装 XRDP

安装 XRDP 只需几个步骤，而且是相当直接的操作。

> 备注：在访问任何地方之前，请注意，这里说的 “远程机器” 是其他人连接到的机器。

XRDP 包含在大多数发行版的软件库中。在 Ubuntu 上，你可以在 universe 库中找到它。

你可以用下面的命令来安装它：

```
sudo apt install xrdp
```

#### 第 2 步：连接到远程机器

好消息是，XRDP 开箱就能使用！

要连接到你安装了 XRDP 的机器上，你首先需要在本地机器上安装一个 RDP 客户端。

我将使用 GNOME Boxes，它可以通过以下方式安装：

```
sudo apt install gnome-boxes
```

GNOME Boxes 更多的是以虚拟机使用而闻名，但它也支持其他各种协议，包括 XRDP。

如果由于某种原因你不想使用 Boxes，你也可以使用一个叫做 Remmina 的客户端。

```
sudo apt install remmina
```

不过，请注意，在本教程的其余部分，我将使用 Boxes。

首先，启动 GNOME Boxes，并点击 “+” 号，选择 “连接到远程计算机…”。

![][10]

接下来，输入你要连接的机器的 IP 地址，前缀为 `rdp://`，然后按下图连接：

> **不确定你的 IP 地址是什么？**
> 
> 你可以用 `ip address` 命令找到你的 IP 地址。你需要寻找一个看起来像分成四组的数字的东西：
> ```
> abhishek@its-foss:~$ ip address
> 1: lo: mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
> link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> inet 127.0.0.1/8 scope host lo
> valid_lft forever preferred_lft forever
> 2: wlp0s20f3: mtu 1500 qdisc noqueue state UP group default qlen 1000
> link/ether dc:46:b9:fb:7a:c5 brd ff:ff:ff:ff:ff:ff
> inet 192.168.0.107/24 brd 192.168.0.255 scope global dynamic noprefixroute  wlp0s20f3
> valid_lft 6183sec preferred_lft 6183sec
> ```

避免任何名为 `127.0.0.1` 的 IP 地址，因为那个地址指向你运行命令的机器。输出中应该有更多的 IP 地址，如上图所示。

![][11]

然后，你应该会看到一个登录页面。将“会话”设置为 “Xorg”，只需输入你的用户名和密码，然后点击 “OK”。

![][5]

之后，你应该看到远程主机的桌面：

![][12]

至此，一切都会像机器在你面前时一样表现。

### 故障排除：修复 XRDP 连接的主题问题

在我对 Ubuntu 20.04 的测试中，默认的 Yaru 主题似乎在连接时没有应用。这可以通过一些努力来解决。

首先，在远程计算机上运行这个命令：

```
sudo apt install gnome-tweaks gnome-shell-extensions dconf-editor -y
```

接下来，打开 “扩展” 应用，并打开如下开关：

![][13]

接下来，关闭你的远程桌面会话并重新登录。现在，打开 Tweaks，按照下面的截图配置：

![][14]

最后，打开 dconf 编辑器，并进入 `/org/gnome/shell/extensions/dash-toock/`。设置如下所示的值：

* `custom-theme-shrink`：`On`
* `dock-fixed`：`On`
* `transparency-mode`：`FIXED`

### 总结

至此，一切都准备好了，可以做你需要做的事了。

如果有什么地方做得不太对，或者你有什么问题或意见，请在下面留言。我会尽力帮助你的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/xrdp-ubuntu/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Remote_Desktop_Protocol
[2]: https://en.wikipedia.org/wiki/Xrdp
[3]: https://remmina.org/
[4]: https://wiki.gnome.org/Apps/Boxes
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_connected_login.png?resize=716%2C582&ssl=1
[6]: https://ubuntu.com/
[7]: https://itsfoss.com/install-gui-ubuntu-server/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp-ubuntu.png?resize=800%2C450&ssl=1
[9]: https://itsfoss.com/check-ip-address-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_gnome-boxes_connect-begin.png?resize=744%2C580&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_gnome-boxes_rdp-connect.png?resize=757%2C514&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_connected_homescreen.png?resize=711%2C595&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_extensions.png?resize=800%2C557&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/xrdp_tweaks.png?resize=800%2C550&ssl=1
[15]: https://itsfoss.com/check-ip-address-ubuntu/