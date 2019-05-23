[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10888-1.html)
[#]: subject: (How to SSH into a Raspberry Pi [Beginner’s Tip])
[#]: via: (https://itsfoss.com/ssh-into-raspberry/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

新手教程：如何 SSH 进入树莓派
======

> 在这篇树莓派文章中，你将学到如何在树莓派中启用 SSH 以及之后如何通过 SSH 进入树莓派。

在你可以用[树莓派][1]做的所有事情中，将其作为一个家庭网络的服务器是十分流行的做法。小体积与低功耗使它成为运行轻量级服务器的完美设备。

在这种情况下你做得到的事情之一是能够每次在树莓派上无须接上显示器、键盘、鼠标以及走到放置你的树莓派的地方就可以运行指令。

你可以从其它任意电脑、笔记本、台式机甚至你的手机通过 SSH（[Secure Shell][2]）登入你的树莓派来做到这一点。让我展示给你看：

### 如何 SSH 进入树莓派

![][3]

我假设你已经[在你的树莓派上运行 Raspbian][4] 并已经成功通过有线或者无线网连进网络了。你的树莓派接入网络这点是很重要的，否则你无法通过 SSH 连接树莓派（抱歉说出这种显而易见的事实）。

#### 步骤一：在树莓派上启用 SSH

SSH 在树莓派上是默认关闭的，因此在你安装好全新的 Raspbian 后打开树莓派时，你需要启用它。

首先通过菜单进入树莓派的配置界面。

![树莓派菜单，树莓派配置][5]

现在进入<ruby>接口<rt>interfaces</rt></ruby>标签，启动 SSH 并重启你的树莓派。

![在树莓派上启动 SSH][6]

你也可以通过终端直接启动 SSH。仅需输入命令 `sudo raspi-config` 然后进入高级设置以启用 SSH。

#### 步骤二： 找到树莓派的 IP 地址

在大多数情况下，你的树莓派会被分配一个看起来长得像 `192.168.x.x` 或者 `10.x.x.x` 的本地 IP 地址。你可以[使用多种 Linux 命令来找到 IP 地址][7]。

我在这使用古老而好用的 `ifconfig` 命令，但是你也可以使用 `ip address`。

```
ifconfig
```

![树莓派网络配置][9]

这行命令展现了所有活跃中的网络适配器以及其配置的列表。第一个条目（`eth0`）展示了例如`192.168.2.105` 的有效 IP 地址。我用有线网将我的树莓派连入网络，因此这里显示的是 `eth0`。如果你用无线网的话在叫做 `wlan0` 的条目下查看。

你也可以用其他方法例如查看你的路由器或者调制解调器的网络设备表以找到 IP 地址。

#### 步骤三：SSH 进你的树莓派

既然你已经启用了 SSH 功能并且找到了 IP 地址，你可以从任何电脑 SSH 进入你的树莓派。你同样需要树莓派的用户名和密码。

默认用户名和密码是：

  * 用户名：`pi`
  * 密码：`raspberry`

如果你已改变了默认的密码，那就使用新的而不是以上的密码。理想状态下你必须改变默认的密码。在过去，有一款[恶意软件感染数千使用默认用户名和密码的树莓派设备][8]。

（在 Mac 或 Linux 上）从你想要 SSH 进树莓派的电脑上打开终端输入以下命令，在 Windows 上，你可以用类似 [Putty][10] 的 SSH 客户端。

这里，使用你在之前步骤中找到的 IP 地址。

```
ssh [受保护的邮件]
```

> 注意: 确保你的树莓派和你用来 SSH 进入树莓派的电脑接入了同一个网络。

![通过命令行 SSH][11]

第一次你会看到一个警告，输入 `yes` 并按下回车。

![输入密码 \(默认是 ‘raspberry‘\)][12]

现在，输入密码按下回车。

![成功通过 SSH 登入][13]

成功登入你将会看到树莓派的终端。现在你可以通过这个终端无需物理上访问你的树莓派就可以远程（在当前网络内）在它上面运行指令。

在此之上你也可以设置 SSH 密钥这样每次通过 SSH 登入时就可以无需输入密码，但那完全是另一个话题了。

我希望你通过跟着这个教程已能够 SSH 进入你的树莓派。在下方评论中让我知道你打算用你的树莓派做些什么！

--------------------------------------------------------------------------

via: https://itsfoss.com/ssh-into-raspberry/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://en.wikipedia.org/wiki/Secure_Shell
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/ssh-into-raspberry-pi.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/Raspberry-pi-configuration.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/enable-ssh-raspberry-pi.png?ssl=1
[7]: https://linuxhandbook.com/find-ip-address/
[8]: https://itsfoss.com/raspberry-pi-malware-threat/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/ifconfig-rapberry-pi.png?ssl=1
[10]: https://itsfoss.com/putty-linux/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/SSH-into-pi-warning.png?fit=800%2C199&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/SSH-into-pi-password.png?fit=800%2C202&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/SSH-into-Pi-successful-login.png?fit=800%2C306&ssl=1
[14]: https://itsfoss.com/speed-up-ubuntu-unity-on-low-end-system/
