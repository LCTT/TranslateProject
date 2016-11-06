如何在 Arch Linux 的 Terminal 里设定 WiFi 网络
===

![How To Setup A WiFi In Arch Linux Using Terminal﻿](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/how-to-connect-to-wifi-in-arch-linux-cli_orig.jpg)

如果你使用的是其他 [Linux 发行版][16] 而不是 [Arch][15] CLI，那么在 [Arch Linxu][14] 的终端里设置 WiFi 将是一件很困难的事情。尽管整个过程有点简单。在这篇文章里，我将带领新手们一起一步步走一边设置向导，把你们的 Arch Linux 接入到你的 WiFi 网络里。在 Linux 里有很多程序来设置无线连接，我们可以用 **ip** 和 **iw** 来配置因特网连接，但是对于新手来说有点复杂。所以我们会使用 **netctl** 命令，这是一个基于命令行的工具，用来通过配置文件来设置和管理网络连接。

注意：所有的设定都需要 root 权限，你也可以使用 sudo 命令。

### 搜索网络

运行下面的命令来查看你的网络接口 -

```
iwconfig
```

运行命令 - 

```
ip link set  _interface_ up
```

运行下面的命令搜索可用的 WiFi 网络。可以向下滚动来查看。

```
iwlist interface scan | less
```

**注意：** 命令里的 interface 是之前用 **iwconfig** 获取到的实际网络接口。

运行命令 -

```
ip link set interface down
```

### 使用 netctl 配置 Wi-Fi：

在使用 netctl 设置连接之前，你必须先检查一下你的网卡在 Linux 下的兼容性。

1.  运行命令：

```
lspci -k
```

这条命令是用来检查内核是否加载了你的无线网卡驱动。输出必须是像这样的：

[![arch linux wifi kernel compatibility ](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-wifi-find-kernel-compatibility_orig.png)][12]

如果内核没有加载驱动，你就必须使用以太网连接来安装一下。这里是 Linux 无线网络的官方维基页面：[https://wireless.wiki.kernel.org/][11]

如果你的无线网卡和 Linux 兼容，你可以使用 **netctl configuration**。

**netctl** 通过配置文件生效，这是一个包含连接信息的文件。创建这个文件有简单方式和困难方式。

### 简单方式 – Wifi-menu

如果你想用 wifi-menu，必须安装 dialog

1. 运行命令: wifi-menu
2. 选择你的网络
  [![wifi-menu to setup wifi in arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-to-setup-wifi-in-arch_orig.png)][1] |
3. 输入正确的密码并等待
  [![wifi-menu setup wifi password in arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-type-wifi-password-in-arch.png?605)][9]

如果没有连接失败的信息，你可以用下面的命令确认下：

```
ping -c 3 www.google.com
```

哇！如果你看到正在 ping，意味着网络设置成功。你现在已经在 Arch Linux 下连上 WiFi 了。如果有任何问题，可以倒回去重来。也许漏了什么。

### 困难方式

比起上面的 wifi-menu 命令，这种方式会难一点点。所有我叫做困难方式。在上面的命令里，网络配置会自动生成。而在困难方式里，我们将手动修改配置文件。不过不要担心，也没那么难。那我们开始吧！

1. 首先第一件事，你必须要知道网络接口的名字，通常会是 wlan0 或 wlp2s0，但是也有很多例外。要确认你自己的网络接口，输入 iwconfig 命令并记下来。

  [![scan wifi networks in arch linux cli](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-wifi-networks-in-arch-linux-cli_orig.png)][8]      

2. 运行命令:

  ```
  cd /etc/netctl/examples
  ```

  在这个目录里，有很多不同的配置文件例子。

3. 拷贝将用到的配置文件例子到 **_/etc/netctl/your_profile_**

```
cp /etc/netctl/examples/wireless-wpa /etc/netctl/your_profile
```

4. 你可以用这个命令来查看配置文件内容: cat /etc/netctl/your_profile

[![view network profile in arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/view-network-profile-in-arch-linux_orig.png)][7]

5. 用 vi 或者 nano 编辑你的配置文件的下面几个部分：

```
nano /etc/netctl/your_profile
```

1. **Interface**: 比如说 wlan0
2. **ESSID**: 你的无线网络名字
3. **key**: 你的无线网络密码

**注意:** 

如果你不知道怎么用 nano，打开文件后，编辑要修改的地方，完了按 ctrl+o，然后回车，然后按 ctrl+x。

[![edit network profile in arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edit-network-profile-in-arch_orig.png)][6]

### 运行 netctl

1. 运行命令:

```
cd /etc/netctl

ls
```

  你必须看到 wifi-menu 生成的配置文件，比如 wlan0-SSID; 或者你选择了困难方式，你必须要看到你自己创建的配置文件。

2. 运行命令启动连接配置: netctl start your_profile.
3. 用下面的命令测试连接:

```
ping -c 3 www.google.com
```

  输出必须看上去像这样:[![check internet connection in arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/check-internet-connection-in-arch-linux_orig.png)][5]       

6. 最后，你必须运行下面的命令: netctl enable your_profile. 

```
netctl enable your_profile
```

这样将创建并激活一个 systemd 服务，然后开机时自动启动。然后欢呼吧！你在你的 Arch Linux 里配置好 wifi 网络啦。

### 其他工具

你还可以使用其他程序来设置无线连接：比如 iw -

iw

1.  iw dev wlan0 link – 状态
2.  iw dev wlan0 scan – 搜索网络
3.  iw dev wlan0 connect your_essid – 连接到开放网络
4.  iw dev wlan0 connect your_essid key your_key - 使用 16 进制密钥连接到 WEP 加密的网络

wpa_supplicant

[https://wiki.archlinux.org/index.php/WPA_supplicant][4]

Wicd

[https://wiki.archlinux.org/index.php/wicd][3]

NetworkManager

[https://wiki.archlinux.org/index.php/NetworkManager][2]

### 总结

会了吧！我提供了在 **Arch Linux** 里接入 WiFI 网络的三种方式。这里有一件事我再强调一下，当你执行第一条命令的时候，请记住你的网络接口名字。在接下来搜索网络的命令里，请使用你的网络接口名字比如 wlan0 或 wlp2s0（上一个命令里得到的），而不是用 interface 这个词。如果你碰到任何问题，可以在下面的评论区里直接留言给我。然后别忘了在你的朋友圈里和大家分享这篇文章哦。谢谢！

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/how-to-setup-a-wifi-in-arch-linux-using-terminal

作者：[Mohd Sohail][a]

译者：[zpl1025](https://github.com/zpl1025)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxandubuntu.com/contact-us.html
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-to-setup-wifi-in-arch_orig.png
[2]:https://wiki.archlinux.org/index.php/NetworkManager
[3]:https://wiki.archlinux.org/index.php/wicd
[4]:https://wiki.archlinux.org/index.php/WPA_supplicant
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/check-internet-connection-in-arch-linux_orig.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edit-network-profile-in-arch_orig.png
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/view-network-profile-in-arch-linux_orig.png
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-wifi-networks-in-arch-linux-cli_orig.png
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-type-wifi-password-in-arch_orig.png?605
[10]:http://www.linuxandubuntu.com/home/5-best-arch-linux-based-linux-distributions
[11]:https://wireless.wiki.kernel.org/
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-wifi-find-kernel-compatibility_orig.png
[13]:http://www.linuxandubuntu.com/home/arch-linux-take-your-linux-knowledge-to-next-level-review
[14]:http://www.linuxandubuntu.com/home/category/arch-linux
[15]:http://www.linuxandubuntu.com/home/arch-linux-take-your-linux-knowledge-to-next-level-review
[16]:http://linuxandubuntu.com/home/category/distros
