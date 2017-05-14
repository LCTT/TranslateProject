如何用树莓派搭建个人 web 服务器
============================================================

 ![How to set up a personal web server with a Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/lightbulb_computer_person_general_.png?itok=ZY3UuQQa "How to set up a personal web server with a Raspberry Pi") 

>图片来源 : opensource.com

个人 Web 服务器即 “云”，只不过是你拥有和控制它，而不是一个大型公司。

拥有一个自己的云有很多好处，包括可定制、免费存储、免费的互联网服务、通往开源软件之路、高安全性、完全控制您的内容、快速更改的能力、实验代码的地方等等。 这些好处大部分是无法估量的，但在财务上，这些好处可以为您每个月节省超过 100 美元。

 ![Building your own web server with Raspberry Pi](https://opensource.com/sites/default/files/1-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Building your own web server with Raspberry Pi") 


我本可以选择 AWS ，但我更喜欢完全自由且安全性可控，并且我可以学一下这些东西是如何搭建的。

*  私有 Web 托管：而非 BlueHost 或 DreamHost
*  云存储：而非 Dropbox、Box、Google Drive、Microsoft Azure、iCloud 或是 AWS
*  自主部署安全
*  HTTPS：Let’s Encrypt
*  分析： Google
* OpenVPN：不需要专有互联网连接（预计每个月花费 $7）

我所使用的物品清单：

*   树莓派 3 代 Model B
*   MicroSD 卡（推荐使用 32 GB， [兼容树莓派的 SD 卡][a1]）
*   USB microSD 卡读卡器
*   以太网络线
*   连接上 Wi-Fi 的路由器
*   树莓派盒子
*   亚马逊倍思的 MicroUSB 数据线
*   苹果的充电器
*   USB 鼠标
*   USB 键盘
*   HDMI 线材
*   显示器 (支持接入 HDMI)
*   MacBook Pro

### 步骤 1： 启动树莓派

下载最新发布的 Raspbian (树莓派的操作系统)。 [Raspbian Jessie][a6] 的 ZIP 包就可以用 [脚注 1]。解压缩或提取下载的文件然后把它拷贝到 SD 卡里。使用 [Pi Filler][a7] 可以让这些过程变得更简单。[下载 Pi Filer 1.3][8] 或最新的版本。解压或提取下载文件之后打开它，你应该会看到这样的提示：

 ![Pi Filler prompt](https://opensource.com/sites/default/files/2-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Pi Filler prompt") 

确保 USB 读卡器这时还没有插上。如果已经插上了那就先弹出。点 “Continue” 继续下一步。你会看到一个让你选择文件的界面，选择你之前解压缩后的树莓派系统文件。然后你会看到另一个提示，如图所示：

 ![USB card reader prompt](https://opensource.com/sites/default/files/3-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "USB card reader") 

把 MicroSD 卡（推荐 32 GB ，至少 16GB）插入到 USB MicroSD 卡读卡器里。然后把 USB 读卡器接入到你的电脑里。你可以把你的 SD 卡重命名为 “Raspberry” 以区别其他设备。然后点击 “Continue”。请先确保你的 SD 卡是空的，因为 Pi Filler 会在运行时 _擦除_ 所有事先存在 SD 卡里的内容。如果你要备份卡里的内容，那你最好就马上备份。当你点 “Continue” 的时候，Raspbian OS 就会被写入到 SD 卡里。这个过程大概会花费一到三分钟左右。当写入完成后，推出 USB 读卡器，把 SD 卡拔出来插入到树莓派的 SD 卡槽里。把电源线接上，给树莓派供电。这时树莓派就会自己启动。树莓派的默认登录账户信息是：

- 用户名： pi
- 密码：raspberry

当树莓派首次启动完成时，会跳出一个标题为 “<ruby>设置选项<rt>Setup Options</rt></ruby>” 的配置界面，就像下面的图片一样 [脚注 2]：

 ![Raspberry Pi software configuration setup](https://opensource.com/sites/default/files/4-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Raspberry Pi software configuration setup") 

选择 “<ruby>扩展文件系统<rt>Expand Filesystem</rt></ruby>” 这一选项并回车 [脚注 3]。 同时，我还推荐选择第二个选项 “<ruby>修改密码<rt>Change User Password</rt></ruby>”。这对保证安全性来说尤为重要。它还能个性化你的树莓派。

在选项列表中选择第三项 “<ruby>启用引导到桌面<rt>Enable Boot To Desktop/Scratch</rt></ruby>” 并回车。这时会跳到另一个标题为 “<ruby>选择引导选项<rt>Choose boot option</rt></ruby>” 的界面，就像下面这张图这样：

 ![Choose boot option](https://opensource.com/sites/default/files/5-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Choose boot option") 

在这个界面选择第二个选项 “<ruby>以用户‘pi’登录图形化桌面<rt>Desktop log in as user 'pi' at the graphical desktop</rt></ruby>” 并回车 [脚注 4]。完成这个操作之后会回到之前的 “<ruby>设置选项<rt>Setup Options</rt></ruby>” 界面。如果没有回到之前的界面的话就选择当前界面底部的 “OK” 按钮并回车。

当这些操作都完成之后，选择当前界面底部的 “Finish” 按钮并回车，这时它就会自动重启。如果没有自动重启的话，就在终端里使用如下命令来重启。

```
$ sudo reboot
```

接上一步的重启，如果所有步骤都顺利进行的话，你会进入到类似下面这样桌面环境中。

 ![Raspberry Pi desktop](https://opensource.com/sites/default/files/6-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Raspberry Pi desktop") 

当你进入了桌面之后，在终端中执行如下命令来更新树莓派的固件。

```
$ sudo apt-get update
$ sudo apt-get upgrade-y
$ sudo apt-get dist-upgrade -y
$ sudo rpi-update
```

这些操作可能会花费几分钟时间。完成之后，现在运行着的树莓派就是最新的了。

### 步骤 2： 配置树莓派

SSH 指的是 Secure Shell，是一种加密网络协议，可让你在计算机和树莓派之间安全地传输数据。 你可以从 Mac 的命令行控制你的树莓派，而无需显示器或键盘。

要使用 SSH，首先需要你的树莓派的 IP 地址。 打开终端并输入：

```
$ sudo ifconfig
```

如果你在使用以太网，看 `eth0` 部分。如果你在使用 Wi-Fi, 看 `wlan0` 部分。

查找 `inet addr`，后跟一个 IP 地址，如 192.168.1.115，这是本篇文章中使用的默认 IP。

有了这个地址，在终端中输入 :

```
$ ssh pi@192.168.1.115
```

对于 PC 上的 SSH，请参见 [脚注 5]。

出现提示时输入默认密码 `raspberry`，除非你之前更改过密码。

现在你已经通过 SSH 登录成功。

### 远程桌面

使用 GUI（图形用户界面）有时比命令行更容易。 在树莓派的命令行（使用 SSH）上键入：

```
$ sudo apt-get install xrdp
```

xrdp 支持 Mac 和 PC 的 Microsoft Remote Desktop 客户端。

在 Mac 上，在 App store 中搜索 “Microsoft Remote Desktop”。 下载它。 （对于 PC，请参见 [脚注 6]。）

安装完成之后，在你的 Mac 中搜索一个叫 “Microsoft Remote Desktop” 的应用并打开它，你会看到 :

 ![Microsoft Remote Desktop](https://opensource.com/sites/default/files/7-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Microsoft Remote Desktop") 

点击 “New” 新建一个远程连接，在空白处填写如下配置。

 ![Setting up a remote connection](https://opensource.com/sites/default/files/8-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Setting up a remote connection") 

关闭 “New” 窗口就会自动保存。

你现在应该看到 “My Desktop” 下列出的远程连接。 双击它。

简单加载后，你应该在屏幕上的窗口中看到你的树莓派桌面，如下所示：

 ![Raspberry Pi desktop](https://opensource.com/sites/default/files/6-image_by_mitchell_mclaughlin_cc_by-sa_4.0_0.png "Raspberry Pi desktop") 

好了，现在你不需要额外的鼠标、键盘或显示器就能控制你的树莓派。这是一个更为轻量级的配置。

### 静态化本地 IP 地址

有时候你的本地 IP 地址 192.168.1.115 会发生改变。我们需要让这个 IP 地址静态化。输入:

```
$ sudo ifconfig
```

从 `eth0` 部分或 `wlan0` 部分，记下 `inet addr`（树莓派当前 IP），`bcast`（广播 IP 范围）和 `mask`（子网掩码地址）。 然后输入：

```
$ netstat -nr
```

记下 `destination` 和 `gateway/network`。

 ![Setting up a local IP address](https://opensource.com/sites/default/files/setting_up_local_ip_address.png "Setting up a local IP address") 

大概应该是这样子的:

```
net address 192.168.1.115
bcast 192.168.1.255
mask 255.255.255.0
gateway 192.168.1.1
network 192.168.1.1
destination 192.168.1.0
```

有了这些信息，你可以很简单地设置一个静态 IP。输入:

```
$ sudo nano /etc/dhcpcd.conf
```

不要去动 `/etc/network/interfaces`。

剩下要做的就是把这些内容追加到这个文件的底部，把 IP 换成你想要的 IP 地址。

```
interface eth0
static ip_address=192.168.1.115
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```

一旦你设置了静态内部 IP 地址，这时需要通过如下命令重启你的树莓派 :

```
$ sudo reboot
```

重启完成之后，在终端中输入 :

```
$ sudo ifconfig
```

这时你就可以看到你的树莓派上的新的静态配置了。

### 静态化全局 IP 地址

如果您的 ISP（互联网服务提供商）已经给您一个静态外部 IP 地址，您可以跳到端口转发部分。 如果没有，请继续阅读。

你已经设置了 SSH、远程桌面和静态内部 IP 地址，因此现在本地网络中的计算机将会知道在哪里可以找到你的树莓派。 但是你仍然无法在本地 Wi-Fi 网络外部访问你的树莓派。 你需要树莓派可以从互联网上的任何地方公开访问。这需要静态的外部 IP 地址 [脚注 7]。

联系您的 ISP 并请求静态的外部（有时称为静态全局）IP 地址可能会是一个非常敏感的过程。 ISP 拥有决策权，所以我会非常小心处理。 他们可能拒绝你的的静态外部 IP 地址请求。 如果他们拒绝了你的请求，你不要怪罪于他们，因为这种类型的请求有法律和操作风险。 他们特别不希望客户运行中型或大型互联网服务。 他们可能会明确地询问为什么需要一个静态的外部 IP 地址。 最好说实话，告诉他们你打算主办一个低流量的个人网站或类似的小型非营利互联网服务。 如果一切顺利，他们应该会建立一个工单，并在一两个星期内给你打电话。

### 端口转发

这个新获得的 ISP 分配的静态全局 IP 地址是用于访问路由器。 树莓派现在仍然无法访问。 你需要设置端口转发才能访问树莓派。

端口是信息在互联网上传播的虚拟途径。 你有时需要转发端口，以使计算机像树莓派一样可以访问 Internet，因为它位于网络路由器后面。 VollmilchTV 专栏在 YouTube 上的一个视频，名字是[什么是 TCP/IP，端口，路由，Intranet，防火墙，互联网][9]，可以帮助你更好地了解端口。

端口转发可用于像 树莓派 Web 服务器或 VoIP 或点对点下载的应用程序。 有 [65000个以上的端口][10]可供选择，因此你可以为你构建的每个 Internet 应用程序分配一个不同的端口。

设置端口转发的方式取决于你的路由器。 如果你有 Linksys 的话，Gabriel Ramirez 在 YouTbue 上有一个标题叫 [如何让你的 Apache Ubuntu 服务器连到互联网][a2] 的视频解释了如何设置。 如果您没有 Linksys，请阅读路由器附带的文档，以便自定义和定义要转发的端口。

你需要转发 SSH 以及远程桌面端口。

如果你认为你已经过配置端口转发了，输入下面的命令以查看它是否正在通过 SSH 工作：

```
$ ssh pi@your_global_ip_address
```

它应该会提示你输入密码。

检查端口转发是否也适用于远程桌面。 打开 Microsoft Remote Desktop。 你之前的的远程连接设置应该已经保存了，但需要使用静态的外部 IP 地址（例如 195.198.227.116）来更新 “PC 名称” 字段，而不是静态的内部地址（例如 192.168.1.115）。

现在，尝试通过远程桌面连接。 它应该简单地加载并显示树莓派的桌面。

 ![Raspberry Pi desktop](https://opensource.com/sites/default/files/6-image_by_mitchell_mclaughlin_cc_by-sa_4.0_1.png "Raspberry Pi desktop") 

好了， 树莓派现在可以从互联网上访问了，并且已经准备好进行高级项目了。

作为一个奖励选项，您可以保持到您的 Pi 的两个远程连接。 一个通过互联网，另一个通过 LAN（局域网）。很容易设置。在 Microsoft Remote Desktop 中，保留一个称为 “Pi Internet” 的远程连接，另一个称为 “Pi Local”。 将 Pi Internet 的 “PC 名称” 配置为静态外部 IP 地址，例如 195.198.227.116。 将 Pi Local 的 “PC 名称” 配置为静态内部 IP 地址，例如 192.168.1.115。 现在，您可以选择在全局或本地连接。

如果你还没有看过由 Gabriel Ramirez 发布的 [如何让你的 Apache Ubuntu 服务器连到互联网][a3]，那么你可以去看一下，作为过渡到第二个项目的教程。 它将向您展示项目背后的技术架构。 在我们的例子中，你使用的是树莓派而不是 Ubuntu 服务器。 动态 DNS 位于域名公司和您的路由器之间，这是 Ramirez 省略的部分。 除了这个微妙之处外，视频是在整体上解释系统的工作原理。 您可能会注意到本教程涵盖了树莓派设置和端口转发，这是服务器端或后端。 查看原始来源，涵盖域名，动态 DNS，Jekyll（静态 HTML 生成器）和 Apache（网络托管）的更高级项目，这是客户端或前端。

### 脚注

[1] 我不建议从 NOOBS 操作系统开始。 我更喜欢从功能齐全的 Raspbian Jessie 操作系统开始。

[2] 如果没有弹出 “Setup Options”，可以通过打开终端并执行该命令来始终找到它：

```
$ sudo-rasps-config
```

[3] 我们这样做是为了将 SD 卡上存在的所有空间用作一个完整的分区。 所有这一切都是扩大操作系统以适应 SD 卡上的整个空间，然后可以将其用作树莓派的存储内存。

[4] 我们这样做是因为我们想启动进入熟悉的桌面环境。 如果我们不做这个步骤，树莓派每次会进入到终端而不是 GUI 中。

[5]

 ![PuTTY configuration](https://opensource.com/sites/default/files/putty_configuration.png "PuTTY configuration") 

[下载并运行 PuTTY][11] 或 Windows 的其它 SSH 客户端。 在该字段中输入你的 IP 地址，如上图所示。 将默认端口保留为 22。 回车，PuTTY 将打开一个终端窗口，提示你输入用户名和密码。 填写然后开始在树莓派上进行你的远程工作。

[6] 如果尚未安装，请下载 [Microsoft Remote Desktop][12]。 搜索您的计算机上的的 Microsoft Remote Desktop。 运行。 提示时输入 IP 地址。 接下来，会弹出一个 xrdp 窗口，提示你输入用户名和密码。

[7] 路由器具有动态分配的外部 IP 地址，所以在理论上，它可以从互联网上暂时访问，但是您需要 ISP 的帮助才能使其永久访问。 如果不是这样，你需要在每次使用时重新配置远程连接。

 _原文出自 [Mitchell McLaughlin's Full-Stack Computer Projects][a4]。_

--------------------------------------------------------------------------------

作者简介：

Mitchell McLaughlin - 我是一名开放网络的贡献者和开发者。我感兴趣的领域很广泛，但我特别喜欢开源软件/硬件，比特币和编程。 我住在旧金山，我有过一些简短的 GoPro 和 Oracle 工作经验。

-------------

via: https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3

作者：[Mitchell McLaughlin ][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mitchm
[a1]:http://elinux.org/RPi_SD_cards
[a2]:https://www.youtube.com/watch?v=i1vB7JnPvuE#t=07m08s
[a3]:https://www.youtube.com/watch?v=i1vB7JnPvuE#t=07m08s
[a4]:https://mitchellmclaughlin.com/server.html
[a5]:https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3?rate=Zdmkgx8mzy9tFYdVcQZSWDMSy4uDugnbCKG4mFsVyaI
[a6]:https://www.raspberrypi.org/downloads/raspbian/
[a7]:http://ivanx.com/raspberrypi/
[8]:http://ivanx.com/raspberrypi/files/PiFiller.zip
[9]:https://www.youtube.com/watch?v=iskxw6T1Wb8
[10]:https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
[11]:http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
[12]:https://www.microsoft.com/en-us/store/apps/microsoft-remote-desktop/9wzdncrfj3ps
[13]:https://opensource.com/user/41906/feed
[14]:https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3#comments
[15]:https://opensource.com/users/mitchm
