如何将树莓派配置为打印服务器
======

> 用树莓派和 CUPS 打印服务器将你的打印机变成网络打印机。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2)

我喜欢在家做一些小项目，因此，今年我买了一个 [树莓派 3 Model B][1]，这是一个非常适合像我这样的业余爱好者的东西。使用树莓派 3 Model B 的内置无线功能，我可以不使用线缆就将树莓派连接到我的家庭网络中。这样可以很容易地将树莓派用到各种所需要的地方。

在家里，我和我的妻子都使用笔记本电脑，但是我们只有一台打印机：一台使用的并不频繁的 HP 彩色激光打印机。因为我们的打印机并不内置无线网卡，因此，它不能直接连接到无线网络中，我们一般把打印机连接到我的笔记本电脑上，因为通常是我在打印。虽然这种安排在大多数时间都没有问题，但是，有时候，我的妻子想在不 “麻烦” 我的情况下，自己去打印一些东西。

我觉得我们需要一个将打印机连接到无线网络的解决方案，以便于我们都能够随时随地打印。我本想买一个无线打印服务器将我的 USB 打印机连接到家里的无线网络上。后来，我决定使用我的树莓派，将它设置为打印服务器，这样就可以让家里的每个人都可以随时来打印。

### 基本设置

设置树莓派是非常简单的事。我下载了 [Raspbian][2] 镜像，并将它写入到我的 microSD 卡中。然后，使用它来引导一个连接了 HDMI 显示器、 USB 键盘和 USB 鼠标的树莓派。之后，我们开始对它进行设置！

这个树莓派系统自动引导到一个图形桌面，然后我做了一些基本设置：设置键盘语言、连接无线网络、设置普通用户帐户（`pi`）的密码、设置管理员用户（`root`）的密码。

我并不打算将树莓派运行在桌面环境下。我一般是通过我的普通的 Linux 计算机远程来使用它。因此，我使用树莓派的图形化管理工具，去设置将树莓派引导到控制台模式，但不以 `pi` 用户自动登入。

重新启动树莓派之后，我需要做一些其它的系统方面的小调整，以便于我在家用网络中使用树莓派做为 “服务器”。我设置它的 DHCP 客户端为使用静态 IP 地址；默认情况下，DHCP 客户端可能任选一个可用的网络地址，这样我会不知道应该用哪个地址连接到树莓派。我的家用网络使用一个私有的 A 类地址，因此，我的路由器的 IP 地址是 `10.0.0.1`，并且我的全部可用地 IP 地址是 `10.0.0.x`。在我的案例中，低位的 IP 地址是安全的，因此，我通过在 `/etc/dhcpcd.conf` 中添加如下的行，设置它的无线网络使用 `10.0.0.11` 这个静态地址。

```
interface wlan0
static ip_address=10.0.0.11/24
static routers=10.0.0.1
static domain_name_servers=8.8.8.8 8.8.4.4
```

在我再次重启之前，我需要去确认安全 shell 守护程序（SSHD）已经正常运行（你可以在 “偏好” 中设置哪些服务在引导时启动它）。这样我就可以使用 SSH 从普通的 Linux 系统上基于网络连接到树莓派中。

### 打印设置

现在，我的树莓派已经连到网络上了，我通过 SSH 从我的 Linux 电脑上远程连接它，接着做剩余的设置。在继续设置之前，确保你的打印机已经连接到树莓派上。

设置打印机很容易。现代的打印服务器被称为 CUPS，意即“通用 Unix 打印系统”。任何最新的 Unix 系统都可以通过 CUPS 打印服务器来打印。为了在树莓派上设置 CUPS 打印服务器。你需要通过几个命令去安装 CUPS  软件，并使用新的配置来重启打印服务器，这样就可以允许其它系统来打印了。

```
$ sudo apt-get install cups
$ sudo cupsctl --remote-any
$ sudo /etc/init.d/cups restart
```

在 CUPS 中设置打印机也是非常简单的，你可以通过一个 Web 界面来完成。CUPS 监听端口是 631，因此你用常用的浏览器来访问这个地址：

```
https://10.0.0.11:631/
```

你的 Web 浏览器可能会弹出警告，因为它不认可这个 Web 浏览器的 https 证书；选择 “接受它”，然后以管理员用户登入系统，你将看到如下的标准的 CUPS 面板：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/cups-1-home.png?itok=t9OFJgSX)

这时候，导航到管理标签，选择 “Add Printer”。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/cups-2-administration.png?itok=MlEINoYC)

如果打印机已经通过 USB 连接，你只需要简单地选择这个打印机和型号。不要忘记去勾选共享这个打印机的选择框，因为其它人也要使用它。现在，你的打印机已经在 CUPS 中设置好了。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/cups-3-printer.png?itok=N5upmhE7)

### 客户端设置

从 Linux 中设置一台网络打印机非常简单。我的桌面环境是 GNOME，你可以从 GNOME 的“设置”应用程序中添加网络打印机。只需要导航到“设备和打印机”，然后解锁这个面板。点击 “添加” 按钮去添加打印机。

在我的系统中，GNOME 的“设置”应用程序会自动发现网络打印机并添加它。如果你的系统不是这样，你需要通过树莓派的 IP 地址，手动去添加打印机。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gnome-settings-printers.png?itok=NOQLTaLs)

设置到此为止！我们现在已经可以通过家中的无线网络来使用这台打印机了。我不再需要物理连接到这台打印机了，家里的任何人都可以使用它了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/print-server-raspberry-pi

作者：[Jim Hall][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[2]:https://www.raspberrypi.org/downloads/
