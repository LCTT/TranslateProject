在树莓派 3 上运行 openSUSE：简单几步搭建一个实用系统
=================

本文由 SUSE 文档团队的技术作者 Dmitri Popov 撰写。

在[树莓派 3][3]上部署 [openSUSE][2] 系统不是很复杂，不过这儿有一些小技巧教你更好地完成这个过程。

首先，你将会有一些版本可供选择。如果你打算使用树莓派 3 作为一个普通主机，那么带有图形界面的 openSUSE 将是你最好的选择。有几种不同的图形环境可供选择：[X11][4]、[Enlightenment][5]、[Xfce][6] 或是 [LXQT][7]。openSUSE 还有一个 JeOS 版本能够提供最基础的系统，可以把树莓派 3 作为一个无显示器的服务器使用。更好的选择还有 openSUSE 的 [Leap][8] 或 [Tumbleweed][9] 版本。

![](https://www.suse.com/communities/blog/files/2017/02/j5dkkbtepng-dmitri-popov-450x300.jpg) 

首先你需要从 [https://en.opensuse.org/HCL:Raspberry_Pi3][10] 下载所需的 openSUSE 镜像，然后制作一张可启动的 microSD 卡。虽然可以使用命令行工具将下载好的镜像写入 microSD 卡，但 [Etcher][11] 可以使这个过程更轻松安全。从该项目网站上获取该程序，解压下载的 .zip 文件，并使用以下命令把得到的 .AppImage 文件设置为可执行：

```
chmod +x Etcher-x.x.x-linux-x64.AppImage 
```

将 microSD 卡插入电脑，双击运行 Etcher 软件，选择下载好的 .raw.xz 镜像文件，点击 **Flash!** 按钮。然后将显示器和键盘连接到树莓派 3，插入 microSD 卡，启动树莓派。第一次启动时，openSUSE 会自动扩展文件系统以充分利用 microSD 卡上的剩余空间。这时你将看到以下信息：

```
GPT data structures destroyed! You may now partition the disk using fdisk or other utilities
GPT 数据结构被破坏！您需要使用 fdisk 或其它工具对磁盘分区。
```

不用担心，稍等两分钟，openSUSE 将继续正常启动。当看到提示时，输入默认用户名 `root` 和默认密码 `linux` 登录系统。

如果你选择在树莓派 3 上部署 JeOS 版本，第一次启动时你不会看到屏幕上有任何输出。也就是说，屏幕会一直保持空白，直到系统完成对文件系统的扩展。你可以通过配置内核参数来显示输出，不过没有必要做这麻烦事。只需稍等片刻，你就能看到命令行提示。

由于 openSUSE 已经启用并且配置了 SSH 服务，所以启动树莓派时你可以不用显示器。这样的话，你就需要使用网卡接口将树莓派连接到网络中。给树莓派足够的时间来启动和扩展系统后，你就能够从同一网络中的其他主机，使用 `ssh root@linux.local` 命令，通过 SSH 服务连接树莓派。

默认情况下你将以 `root` 用户登录系统，所以创建一个普通用户是个不错的主意。你可以使用 YaST 配置工具轻松完成这件事。运行 `yast2` 命令，选择 <ruby>**安全与用户**<rt>Security and Users</rt></ruby> -> **<ruby>用户与用户组管理<rt>User and Group Management</rt></ruby>** 选项，就可以创建新用户了。你还可以选择 **<ruby>系统<rt>System</rt></ruby>** -> **<ruby>在线升级<rt>Online Update</rt></ruby>**选项来更新系统。完成之后，退出 YaST ，重启树莓派，然后使用新创建的用户登录系统。

一切搞定，不过还有一个重要的系统组件不能正常工作，那就是无线接口。当然，这个问题也可以轻松解决。首先使用以下命令安装 nano 文本编辑器：

```
sudo zypper in nano
```

然后运行以下命令修改 `raspberrypi_modules.conf` 文件：

```
sudo nano/etc/dracut.conf.d/raspberrypi_modules.conf
```

删除文件第一行的 `sdhci_iproc` ，再取消最后一行的注释。运行以下命令保存修改：

```
mkinitrd -f
```

最后，重启树莓派。

![](https://www.suse.com/communities/blog/files/2017/02/figure1-raspi-450x329.png) 

再次运行 YaST ，在**<ruby>系统<rt>System</rt></ruby>** -> **<ruby>网络设置<rt>Network Settings</rt></ruby>**区域，你应该能在网络接口列表中看到 `BCM43430 WLAN Card` 项。选择这一项，点击 **<ruby>编辑<rt>Edit</rt></ruby>** 按钮。开启**<ruby>动态地址分配<rt>Dynamic Address DHCP</rt></ruby>**选项，点击**下一步**，选择你想要连接的无线网络，配置所需的连接设置。点击**下一步**和**确定**保存设置。重启树莓派，它应该就能连接上特定的 Wi-Fi 网络了。

至此，你就完成了树莓派上的系统部署。

--------------------------------------------------------------------------------

via: https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/

作者：[chabowski][a]
译者：[Cathon](https://github.com/Cathon)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.suse.com/communities/blog/author/chabowski/
[1]:https://www.suse.com/communities/blog/author/chabowski/
[2]:https://www.opensuse.org/
[3]:https://www.raspberrypi.org/
[4]:https://www.x.org/wiki/
[5]:https://www.enlightenment.org/
[6]:https://www.xfce.org/
[7]:http://lxqt.org/
[8]:https://www.opensuse.org/#Leap
[9]:https://www.opensuse.org/#Tumbleweed
[10]:https://en.opensuse.org/HCL:Raspberry_Pi3
[11]:https://etcher.io/
[12]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[13]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[14]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[15]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[16]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[17]:http://www.printfriendly.com/print?url=https%3A%2F%2Fwww.suse.com%2Fcommunities%2Fblog%2Fopensuse-raspberry-pi-3-zero-functional-system-easy-steps%2F
[18]:http://www.printfriendly.com/print?url=https%3A%2F%2Fwww.suse.com%2Fcommunities%2Fblog%2Fopensuse-raspberry-pi-3-zero-functional-system-easy-steps%2F
