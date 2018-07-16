在树莓派上建立VPN（一）：如何以及为何建立一个VPN服务器？
================================================================================
![](http://readwrite.com/files/styles/1400_0/public/fields/Rasberry-Pi_2_red.jpg)

> 不要相信任何人，自己建立一个VPN服务器来加密Web数据从而躲过他人的窥视

虽然免费、未加密的无线AP遍地都是，但是你不应该连接这些AP来登陆你的网银账户，除非你对他人的窥视毫不在意。那么对此的解决方案是什么呢？一个[虚拟专用网][1]，也就是VPN(virtual private network)。

一个VPN可以使你的私有网络拓展至公共场所，因此即使你连接着星巴克的 Wi-Fi，你的网络浏览仍然保持着安全的加密。

有很多方法来建立VPN，包括[免费以及付费的服务][2]，但是每个解决方案都有其的优点以及缺点，这取决于VPN服务商运作的方式和服务商提供的VPN选项。

最简单及最方便的保证数据安全的方法就是完全抛弃公共Wi-Fi。但是这个解决方案对于我来说有点极端了，一部分原因是在家里建立一个VPN服务器相对容易以及划算，你只需要一个便宜的($35)小型的树莓派。

我的树莓派与智能手机差不多大小，并且它拥有一个VPN服务器所有应有的功能。这意味着不管我在哪里，我可以通过安全的网络来连接在家里的电脑和家里的内网来访问共享的文件以及媒体。这个服务器在我最近去波士顿的旅途中使生活变得十分美好，在旅途中我仍然可以观看储存在家里台式机上的视频。

在这部分文章中，说实话我希望直接带给你们一个设置树莓派VPN的教程。问题是这个优秀教程并不存在，至少目前没有一个适合大部分电脑用户的优秀教程。虽然有无数关于如何搭建树莓派VPN的教程，但极少的教程会解释这么做的目的。

我阅读了不少教程，并把好的部分整合入了这半篇教程中，来教授读者如何搭建树莓派VPN服务器。这个教程甚至连我都能理解，并完成如何搭建和为何搭建的学习。最重要的是，我认为Eric Jodoin的VPN教程更适合那些专家，但它使我的大脑直接宕机了...

那么跟随我钻进加密法的兔子洞并且开始学习吧，无论你有多么多疑，提出了创造VPNs的那个人更正是如此。

### 材料 ###

#### 硬件 ####

![](http://readwrite.com/files/Raspberry_Pi_Model_B_Rev._2.jpg)

**Raspberry Pi Model B**：以及使其工作所需要的所有硬件－一个常规电源供电器和一个放置的小盒子。小盒子可以避免树莓派硬件意外短路而损坏－这个盒子甚至可以是一个自己折叠的纸板箱。

**SD card**：我建议8GB及以上的容量，只是来保证你有必要的储存空间。像所有树莓派项目一样，SD卡上应该要预装上NOOBS。

**五类网线**：这根网线将连接树莓派的以太网接口和你的路由器的以太网接口。

#### 软件 ####

[Open VPN][3]：这是一个开源VPN服务软件，我们今天就要安装它。

### 开始项目之前的准备 ###

1) 你需要[准备好NOOBS][4]并且安装完[Raspbian][5]。我在＂鱼缸管理＂项目中对此做过一个[一步步][6]的教程。因此你也可以在那里查看。

2) 你需要为树莓派设置一个在你家内网中的静态IP地址。这一步骤取决于你路由器的型号，因此你可能需要阅读你的路由器的说明书来完成这一步。如果你还没有完成这一步，你可以参照ReadWrite的[教程][7]。

3) 你需要启用SSH。我们需要通过[SSH][8]与树莓派进行连接，这是一个使我们能够从另一台电脑连接树莓派的工具。通过这种方法，我们在这个项目中不需要再为树莓派单独设置一个显示屏以及无线键盘。再提一下，看看ReadWrite的[教程][9]。

4) 你需要将路由器的1194端口映射至树莓派的内网IP地址[采用UDP协议][10]，完成这一步的方法也决定于你路由器的型号，所以阅读路由器说明书吧。如果你想用另一个端口或TCP协议，没问题，只要将此教程中提及"UDP"的地方换为"TCP"，1194端口改为你需要的端口就行了。想必你也猜到了，ReadWrite为此也写了一篇[教程][11]。

你可以从上文看出，我们现在在建立一些树莓派的基础概念，这也是为什么在树莓派上搭建VPN对初学者的第一个项目来说并不是适合。

### 简单的一些警告 ###

我曾经喜欢直接拷贝网上教程中的代码，但是当我自己测试这篇教程时，我发现直接的复制粘贴代码会导致一些错误，原因是复制粘贴中出现的空行以及格式变化。如果你发现在此篇教程在实际操作时出现了一些问题，我的建议是先手动输入代码试试!

### First Steps ###

1) 启动并修改树莓派的密码。如果你还在使用树莓派的默认用户名(pi)和密码(respberry)，那么接下来的安全教程就完全没有什么意义了。

打开一个terminal/PuTTY 窗口输入：

    sudo passwd

将用户名以及密码修改地既好记并难猜([微软对此有一些建议][12])，不然的话为什么要自找麻烦搭建一个私人网络呢？

2) 为了树莓派的安全来进行软件包的升级。输入如下两条命令：

    sudo apt-get update
    sudo apt-get upgrade

这应该不会花太多时间，而且为我们排除了之后可能会产生的问题。

3) 接下来我们需要这个开源软件(OpenVPN)了。输入：

    sudo apt-get install openvpn

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%2010.22.19%20AM.png)

树莓派会询问确认，因为这用掉一点点储存空间。但是由于我们已经准备了一张8GB及以上的SD卡，我们对此完全没问题。

### 生成密钥 ###

4) 你当然不想让任何发现你的VPN的人就可以连接，因此我们会为这个安全的地址准备一个来验证身份的密钥。这就像为你的家门准备一把锁一样。

OpenVPN自带了Easy_RSA，一个轻量并容易的使用RSA加密方法的包。发明于1977年，RSA是第一个沿用至今仍旧可用的加密系统。加密的密钥是公开的，解密的密钥是保密的。如果你听说过比特币的工作原理，这些对你来说应该十分熟悉。

通过使用Easy_RSA，你可以使用软件带有的算法来生成一个独一无二的密钥。

首先获得树莓派的系统权限，就是将命令提示符中的"pi@raspberrypi"转换成"root@raspberrypi"。

    sudo -s

这句命令在现有的终端中再次创建了一个拥有root权限的终端实例。我们需要获得root权限的原因是，如果我们没有root权限，树莓派将不会允许我们创建密钥。

接下来，输入：

    cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0  /etc/openvpn/easy-rsa 

在这句命令中，"cp"代表＂复制＂，"r"代表递归。这说明我们让电脑执行：复制这个目录以及此目录下的所有文件结构及文件。

在**/2.0**和**/etc**中间的空格表示我们将第一个目录地址的文件（一个实例文件）拷贝至第二个目录地址，就是你让OpenVPN寻找密钥的地址。

    cd /etc/openvpn/easy-rsa

5) 接下来，我们需要"cd"，改变所在目录(change directory)，来放置我们生成的Easy_RSA文件。一旦完成这步，我们需要打开文件**/etc/openvpn/easy-rsa/vars**来编辑。我们可以使用nano: **nano /etc/openvpn/easy-rsa/vars**，由于我们已经在此目录下了，我们可以使用简写：

    nano vars

Nano是Raspbian中内置的文件编辑工具，当然也有其他工具提供给屌丝们，不过我们将在此教程中只使用nano。

现在，将你的 EASY_RSA 变量改为：

    export EASY_RSA="/etc/openvpn/easy-rsa"

对我的环境来说，这是在第13行。

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%2010.26.48%20AM.png)

为什么要修改这个变量呢？其实这是你在回答计算机的问题＂你想让文件生成在哪里？＂。在这个情况下，我们想要将其生成在我们保存key的同一个目录，在这里是easy-rsa文件树的顶层。

在vars文件中我们还可以做一件事，如果你对黑衣众们阅读你的邮箱这件事十分在意的话，你可以将加密方法从1024-bit改至2048-bit。在vars文件中，它明显的指出，＂偏执狂请将此改为2048！＂。

但是因为这个方法大大增长了生成密钥的时间，我们不会在这个教程中使用它。保持下面这个样子：

    export KEY_SIZE=1024

按下**Control+X**来保存修改并退出nano。

### 加密 ###

6) 现在该搭建CA证书和Root CA证书了。

在加密学中，一个授权机构(certificate authority (CA))是一个颁布电子证书的存在。电子证书来证明公钥的所有者。

你可能一直在使用它只是你自己不知道而已。举个例子，当我登陆我的网银账户时，我可以在网页地址前看到HTTPS字符。当我点击HTTPS前的锁时，我会看到一个叫做[GeoTrust][13]的公司验证了我网银页面的合法性，因此我知道这不是一个钓鱼欺诈网站。(当然最近的[Heartbleed漏洞][14]指出HTTPS并不是我们想得那么安全)。

在树莓派这个例子中，我作为我自己的授权机构，自己为OpenVPN签字，而不是通过一个第三方公司。

    cd /etc/openvon/easy-rsa

现在我们又改变了所在目录，将下面命令一行接一行输入终端：

**source ./vars** →　这个"source"加载你之前修改的文件(vars)。

**./clean-all** → 这会删除之前所有的密钥文件，如果有的话。如果在这个文件目录下有你不想删除的密钥文件(比如这是你第二次尝试这篇教程)，跳过这条命令。

**./build-ca** → 最后一条来生成你的授权机构。

再输入第三条命令之后，树莓派会弹出一堆选项，你可以填写这些选项如果你愿意的话－－国家名字，州名或省名，位置名，机构名，机构单位和电子邮件地址。如果你不想填写，只要在每个选项出现时按"enter"就行了，树莓派会使用默认值。下面的截屏展现了这些选项的长相：

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.32.35%20PM.png)

现在你可以为你的服务器命名了。我很“创新”地将其命名为"Server"。你可以取任意的名字，不过别忘记输入：

    ./build-key-server [Server_Name]

再次，树莓派会给出一系列的选项，请随便输入，但注意以下几个选项：

**Commom Name ** 必须是你为服务器取的名字。

**A challenge password?** 必须啥也不输，回车即可。

**Sign the certificate? [y/n]** 废话，你必须输入"y"。

你接下来会看到一段消息说你的证书会在接下来的3650天中有效的信息。因此，如果你打算长期使用这个VPN的话，你必须在十年后重新走这个流程。

**1 out of 1 certificate requests certified, commit? [y/n]** 明显，输入"y"。

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.35.28%20PM.png)

6) 服务器端就这么设置好了。现在该为各位用户生成密钥了，或者说"客户"。我为家里的计算机，平板，手机各生成了一个密钥，总共有5个。不要以为在所有客户端使用同样的密钥就可以节省时间，这样的话，一次只能有一个设备能访问VPN。

    ./build-key-pass UserName

我发现采用用户名 Client1, Client2, Client3...十分方便

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.37.00%20PM.png)

在这之后，更多信息会弹出!

**Enter PEM pass phrase**  设置其为你记得住的密码！他会让你输入两次，不会有几率输入错误。

**A challenge password?**  必须留空！

**Sign the certificate? [y/n]**  同样签十年。

    cd keys
    openssl rsa -in Client1.key -des3 -out Client1.3des.key

留意我们使用des3加密生成的字符串文件，des3是一个复杂[加密算法][15]会在每一个数据块上运行3次，来防止骇客的暴力破解。OpenSSL 代表开源的加密套接字实现，是一个建立安全连接的标准方法。你需要为你生成的每一个客户端运行这一步。

有人会说这一步完全没有必要，你可以跳过这一步。但是如果你通过Android或者iOS设备连接OpenVPN，那么你必须要做这一步，不然的话目前版本在解析你的密钥时会有一些困难产生。

    Enter pass phrase for Client1.key

说实话，我用了和以前一样的密码。再输入一遍，就想说的那样。

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.40.04%20PM.png)

现在我们已经创建了服务器证书以及至少一个客户端证书，输入以下命令：

    cd /etc/openvpn/easy-rsa/

或者

    cd ..

两种方法都会将你的所在目录带会/easy-rsa/。

7) 现在该生成[Diffie-Hellman key exange][16]了。这是使你的VPN工作的关键代码，一个使两个没有先前信息的双方通过服务器交换密钥的协议。像RSA一样，这是现有的最早发明的加密系统。

    ./build-dh

这一步会花一些时间，甚至比2048-bit加密还要慢。而且没有任何方法可以预测它运行的时间，因为这个算法使用的是随机数并寻找一些特定的关系。事实上，在我写这篇教程时，1024-bit加密只花了我5分钟。

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.41.40%20PM.png)

8) 最后，我们要实现OpenVPN内建的服务阻断攻击(Denial of Service -- DoS)防护。你可能已经知道服务阻断攻击是骇客找到你的服务器地址后很有效的攻击手段，这种攻击通过生成大量的访问请求来使你的服务器崩溃。

输入以下代码来生成静态的HMAC([hash-based message authentication code][17])密钥：

    openvpn --genkey --secret keys/ta.key

## 最后收尾 ##

9) 我们已经生成了密钥以及来签名的授权机构。剩下的只是如何告诉OpenVPN如何配置这个服务器了。

因为我们在树莓派上使用在没有图形用户界面的Linux操作系统，我们需要生成一个.conf (configuration) 文件来告诉OpenVPN如何配置服务器，而不是通过图形界面的选择。用nano打开.conf文件：

    nano /etc/openvpn/server.conf

我们在这个目录下打开.conf文件的理由是，编辑完此文件会直接生成在/etc/openvpn的目录中。但是你刚刚打开的这个文件是空的。[将此地址中的配置复制入编辑器][18]。在配置中我用大写字符注释了你必须要更改的地方，具体可以看注释。按下 Control+X 来保存文件。

10) 让我们快速地编辑一下另一个配置文件。在默认配置下树莓派并不会转发网络流量，我们需要另一个配置文件来使树莓派启用对我们新建网络中的网络流量的转发。

    nano /etc/sysctl.conf

在文档开头处有注释：＂取消下一行的注释来启用IPv4中的数据包转发。＂("Uncomment the next line to enable packet forwarding for IPv4。")。我在下面的截图中高亮了这部分。

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.46.38%20PM.png)

删除那一行前面的 # 来取消注释这一行。这告诉树莓派要对IPv4的数据包进行映射。当你取消注释了这一行，树莓派就拥有了作为互联网的中继而不是单单的接受者的权限，可以既接受并发送数据包。

按下 Control+X 来保存修改。通过以下命令启用此配置：

    sysctl -p

sysctl命令表示＂[在运行中改变内核配置参数][19]＂。-p 告诉计算机重新加载你刚刚修改的配置文件。

11) 到这一步我们以及配置完了一个拥有互联网访问权限的工作中的服务器。但是我们还不能用它，用为树莓派有内置的[防火墙][20]来限制传输入的网络连接。

Raspbian的防火墙会在来路不明的互联网源头中保护你的树莓派。我们仍然需要防火墙来保护我们，但是我们要在防火墙中挖一个OpenVPN样子的洞，使OpenVPN的连接可以顺利通过。

此外，Raspbian的防火墙会在重启后默认进行重置。我们需要创建一个简单的脚本使树莓派记住每次重启时对OpenVPN的连接进行允许。

    nano /etc/firewall-openvpn-rules.sh

这是一个空文件，输入以下内容：

    #!/bin/sh

    iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j SNAT --to-source 192.168.XX.X

不要忘记将默认IP地址改为你树莓派的IP地址!

解释下这条命令: 10.8.0.0 是客户端连接树莓派VPN后树莓派的默认地址。 "eth0"代表以太网接口。 如果你使树莓派用无线连接互联网的话将其改为"wlan0"， 当然我不建议你这么做。 按下 Control+X 保存编辑。

为了安全考虑, 我们要改变**/etc/firewall-openvpn-rules.sh**的所有者，使此文件默认不可被运行。 首先将权限设定为[700][21] (所有者可以读、写、执行)。 然后，我们会将此脚本的所有者改为root,，在Linux标准系统中，root代表系统管理员。

    chmod 700 /etc/firewall-OpenVPN-rules.sh
    chown root /etc/firewall-OpenVPN-ruels.sh

12) 我们已经创建了一个在防火墙中开出OpenVPN形状的洞，我们现在只需要将这个脚本插入到网络interface初始化的代码中，然后它就会在每次开机时运行了。

    nano /etc/network/interfaces

找到带有"iface eth0 inet dchp"的那一行。 我们需要在这行之后的缩进中加上一行。 下面是这两行，一行新加入，一行原来就存在，在完成之后它应该差不多像这样：

    iface eth0 inet dhcp
    	pre-up /etc/firewall-openvpn-rules.sh

![](http://readwrite.com/files/screenshot_0.png)

按下 Control+X 保存更改 (当你在使用nano的时候都应该这么做)。

最后，再最后, 再最最后：重启树莓派。

    sudo reboot

恭喜你！！vpn服务器就这么搭建完成了，当然如果没有客户端连接服务器的话，服务器也没什么用，因此你应该牢记你在第6步创建生成的用户名及密钥。 接下来你可以继续阅读这篇教程的[第二部分][22]来学习如何创建加密的客户端。

树莓派的照片来自 [Tors][23]。 其他所有的截屏来自Lauren Ordini。 教程展示于ReadWrite。

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/10/raspberry-pi-vpn-tutorial-server-secure-web-browsing

译者：[ThomazL](https://github.com/ThomazL) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/Virtual_private_network
[2]:http://netforbeginners.about.com/od/readerpicks/tp/The-Best-VPN-Service-Providers.htm
[3]:http://openvpn.net/
[4]:http://learn.adafruit.com/setting-up-a-raspberry-pi-with-noobs/overview
[5]:http://www.raspbian.org/
[6]:http://readwrite.com/2014/03/04/raspberry-pi-quantified-fish-acquarium
[7]:http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial?utm_content=readwrite3-orionautotweet&awesm=readwr.it_b1UN&utm_campaign=&utm_medium=readwr.it-twitter&utm_source=t.co#awesm=~oAXilI0BMOHsS3
[8]:http://en.wikipedia.org/wiki/Secure_Shell
[9]:http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial
[10]:http://en.wikipedia.org/wiki/User_Datagram_Protocol
[11]:http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial?utm_content=readwrite3-orionautotweet&awesm=readwr.it_b1UN&utm_campaign=&utm_medium=readwr.it-twitter&utm_source=t.co#awesm=~oAXilI0BMOHsS3
[12]:http://windows.microsoft.com/en-us/windows-vista/tips-for-creating-a-strong-password
[13]:http://www.geotrust.com/
[14]:http://readwrite.com/2014/04/08/heartbleed-openssl-bug-cryptography-web-security
[15]:http://osxdaily.com/2012/01/30/encrypt-and-decrypt-files-with-openssl/#
[16]:http://www.google.com/patents/US4200770
[17]:http://en.wikipedia.org/wiki/Hash-based_message_authentication_code
[18]:https://gist.github.com/laurenorsini/9925434
[19]:http://linux.about.com/library/cmd/blcmdl8_sysctl.htm
[20]:http://en.wikipedia.org/wiki/Firewall_(computing)
[21]:http://www.thinkplexx.com/learn/article/unix/command/chmod-permissions-flags-explained-600-0600-700-777-100-etc
[22]:http://readwrite.com/2014/04/11/building-a-raspberry-pi-vpn-part-two-creating-an-encrypted-client-side#awesm=~oB89WBfWrt21bV
[23]:http://commons.wikimedia.org/wiki/File:Raspberry_Pi_Model_B_Rev._2.jpg

