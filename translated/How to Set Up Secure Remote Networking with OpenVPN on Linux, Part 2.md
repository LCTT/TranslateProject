OpenVPN 安全手册[part 2]
================================================================================
欢迎所有 Linux 用户回来继续看我们的 OpenVPN 系列的第二部分。上次我们讲到如何让远端计算机（如笔记本电脑）[通过简单的加密隧道]登录到家里的服务器。今天我们接着讲进阶部分：比如设置 OpenVPN 开机启动，省得我们每次重启服务器的时候都要手动开启 OpenVPN 服务；比如使用 Network Manager 简化访问到远程服务器的过程。

### 整合到 Network Manager ###

Network Manager 是一个不错的 OpenVPN 客户端；你只需要安装 network-manager-openvpn 这个插件。我们继续《OpenVPN 安全手册》第一部分使用的配置。打开 Network Manager 配置界面，进入“新建 VPN 连接”的窗口。这个界面布局在 KDE 和 GNOME 下面看起来有点不一样，但是大体的信息是一样的。开始的时候你需要选择 OpenVPN 作为你的 VPN 连接类型，就像图1所示；如果你没看到 OpenVPN 的选项，说明你没有安装好插件。（图1是一张 GNOME 下面的图片。）

![](http://www.linux.com/images/stories/41373/figu-1-openvpn-nm.jpg)

*图1：在 Network Manager 上新建 OpenVPN 客户端 *

图2显示了配置主界面。从上到下分别为：

- 连接名，任取一个。
- 远程服务器的网关。
- 下拉菜单选择静态密钥（Static Key）。
- 然后通过文件浏览器找到静态密钥文件。
- 这个不是方向性的密钥，所以 Key Direction 这里设为 None。
- 远程 IP 和 本地 IP 是我们在上一部分已经设置好的虚拟 OpenVPN 地址，可分别通过 /etc/openvpn/studio.conf 和 /etc/openvpn/shop.conf 文件获得。
- 我们无需设置密码，所以“Show passwords”复选框为空。
- 这个连接是“所有人都可用”，还是只有你可用，随你喜欢。

![](http://www.linux.com/images/stories/41373/fig-2-openvpn-nm-1.jpg)

*图2：Network Manager 配置 OpenVPN 客户端主界面*

保存然后就可以使用 Network Manager 建立连接了。So easy，妈妈再也不用担心你的学习了！看见图3了么？你现在只需点击一下高亮的按钮就可以连接到你的家庭服务器，或从你的家庭服务器中断开连接。

![](http://www.linux.com/images/stories/41373/fig-3-openvpn-nm-3.jpg)

### OpenVPN 开机启动 ###

手动开启 OpenVPN 很简单，但是你也许想要更简单，让它能够在服务器重启的时候跟着自动启动。在 Debian/Ubuntu 以及绝大部分发行版中，当你安装完 OpenVPN 的时候就被设置为开机启动的。所以你需要重启系统，或者按下面的方法启动后台进程：

    $ sudo /etc/init.d/openvpn start
    $ sudo service openvpn start

第一个命令是比较老的启动方法，第二个命令使用了“service”命令。“service”命令第一次出现在 Red Hat 发行版中，如果你的发行版中没有安装这个命令，你需要从你的软件源里面去找到它。

Ubuntu使用 Upstart 管理服务进程，Debain 使用的老的 SysV，而 Fedora 使用“systemd”。如果你在 /etc/openvpn 目录下配置了多个 OpenVPN 的服务，你可以通过“systemd”的命令启动你要的服务：

    # systemctl start openvpn@studio.service

Where "studio.service" references our example /etc/openvpn/studio.conf file from part one. This invocation does not survive a reboot, so it's just like running openvpn /etc/openvpn/studio.conf, which is how we started OpenVPN sessions manually in part 1. You should be able to daemonize OpenVPN on systemd with chkconfig:

    # service openvpn start
    # chkconfig openvpn on

That should daemonize OpenVPN in the usual way, which is as a monolithic daemon and not individually per .conf file in /etc/openvpn/. systemd supports the chkconfig and servicecommands so it should work. However, the distros that use systemd are quite variable, so if yours is different please let us know in the comments.

### Strengthening Your Connection ###

OpenVPN is robust and is good at maintaining a persistent connection, even with service interruptions. You can make your connection even stronger by adding these lines to your .conf files on clients and server:

    persist-tun
    persist-key

These are helpful for laptop users who disrupt their connection a lot with power-save and being on the move.

### Now What? ###

Now that you have this all set up and working, what do you do with it? If you're used to using OpenSSH for remote operations you might be stuck in the SSH mindset of being able to log into specific machines and run applications. It doesn't work that way. Rather, think of OpenVPN as a virtual Ethernet cable to your server or LAN, all wrapped in a nice stout layer of encryption. You can run unencrypted and encrypted services over the same tunnel, and you only have to open a single hole in your firewall.

So you can run SSH in the way you're used to over your OpenVPN tunnel, and do remote administration and run applications. You can access network resources such as fileshares and Web applications. You can force all networking on the client to go through your VPN tunnel, but for this series I've assumed that you want to be able to use both your native and VPN networks.

So there you are on your trusty laptop and you can surf the Web, run SSH, do whatever you want on whatever network you're connected to. Then when you want to run something over your OpenVPN tunnel open it up and specify the IP address, like this:

    $ ssh carla@10.0.0.1

Web applications are easy: point your Web browser to the virtual IP address of your OpenVPN server and log in as usual. For example, I run various Web services for testing on my home server. So I access Drupal at [http://10.0.0.1/drupal][2] and OwnCloud at [http://10.0.0.1/owncloud][3]. I use the nice gFTP graphical FTP client, so all I need to connect is the virtual IP address on the Host line, username, and password. Or use the command line:

    $ ftp 10.0.0.1 21

You can administer your MySQL database from afar, using your own username and password:

    $ mysql -h 10.0.0.1 -u admin -p

So the main thing you need to know is how to add the host specification to whatever command you want to run.

Obviously, this would all be easier with name services instead of having to use IP addresses, so one of these days we'll learn how to implement name services in OpenVPN. Meanwhile, please enjoy your nice secure OpenVPN tunnel.

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/745233-how-to-set-up-secure-remote-networking-with-openvpn-on-linux-part-2

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linux.com/learn/tutorials/743590-secure-remote-networking-with-openvpn-on-linux
[2]:http://10.0.0.1/drupal
[3]:http://10.0.0.1/owncloud
