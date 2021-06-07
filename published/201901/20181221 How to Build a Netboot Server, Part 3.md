[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10405-1.html)
[#]: subject: (How to Build a Netboot Server, Part 3)
[#]: via: (https://fedoramagazine.org/how-to-build-a-netboot-server-part-3/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

如何构建一台网络引导服务器（三）
======

![](https://fedoramagazine.org/wp-content/uploads/2018/12/netboot3-816x345.jpg)

在 [如何构建一台网络引导服务器（一）][1] 中，我们提供了一个极简的 [iPXE][2] 引导脚本来引导你的网络引导镜像。许多用户除了使用网络引导镜像外，可能在机器本地也有一个操作系统。但是使用常见的工作站的 BIOS 去切换引导加载器是很笨拙的。在本系列文件的第三部分，我们将向你展示如何设置一个更复杂的 iPXE 配置。它将允许终端用户以更容易的方式去选择引导哪个操作系统。它也可以配置为让系统管理员从一台中央服务器来统一管理引导菜单。

### 一个交互式 iPXE 引导菜单

下面这些命令重定义了网络引导镜像的 `boot.cfg` 来作为一个交互式的 iPXE 引导菜单，并使用了一个 5 秒倒计时的定时器：

```
$ MY_FVER=29
$ MY_KRNL=$(ls -c /fc$MY_FVER/lib/modules | head -n 1)
$ MY_DNS1=192.0.2.91
$ MY_DNS2=192.0.2.92
$ MY_NAME=server-01.example.edu
$ MY_EMAN=$(echo $MY_NAME | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_NAME})
$ MY_ADDR=$(host -t A $MY_NAME | awk '{print $4}')
$ cat << END > $HOME/esp/linux/boot.cfg
#!ipxe

set timeout 5000

:menu
menu iPXE Boot Menu
item --key 1 lcl 1. Microsoft Windows 10
item --key 2 f$MY_FVER 2. RedHat Fedora $MY_FVER
choose --timeout \${timeout} --default lcl selected || goto shell
set timeout 0
goto \${selected}

:failed
echo boot failed, dropping to shell...
goto shell

:shell
echo type 'exit' to get the back to the menu
set timeout 0
shell
goto menu

:lcl
exit

:f$MY_FVER
kernel --name kernel.efi \${prefix}/vmlinuz-$MY_KRNL initrd=initrd.img ro ip=dhcp rd.peerdns=0 nameserver=$MY_DNS1 nameserver=$MY_DNS2 root=/dev/disk/by-path/ip-$MY_ADDR:3260-iscsi-iqn.$MY_EMAN:fc$MY_FVER-lun-1 netroot=iscsi:$MY_ADDR::::iqn.$MY_EMAN:fc$MY_FVER console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img \${prefix}/initramfs-$MY_KRNL.img
boot || goto failed
END
```

上述菜单有五个节：

  * `menu` 定义了显示在屏幕上的实际菜单内容。
  * `failed` 提示用户发生了错误，并将用户带到 shell 以错误错误。
  * `shell` 提供了交互式命令提示符。你可以在引导菜单出现时按下 `Esc` 键进入，或者是 
    `boot` 命令失败时也会进入到命令提示符。
  * `lcl` 包含一个提供给 iPXE 退出的简单命令，以及返还控制权给 BIOS。在 iPXE 之后，无论你希望缺省引导的设备（即：工作站的本地硬件）是什么，都必须在你的工作站的 BIOS 中正确地作为下一个引导设备列出来。
  * `f29` 包含前面文章提到同一个网络引导代码，但使用最终的退出代码来替换掉 `goto failed`。

从你的 `$HOME/esp/linux` 目录中复制更新后的 `boot.cfg` 到所有客户端系统的 ESP 中。如果一切顺利，你应该会看到类似下面图片的结果：

![][3]

### 一个服务器托管的引导菜单

你可以添加到网络引导服务器的另一个特性是，能够从一台中央位置去管理所有客户端的引导菜单。这个特性尤其适用于批量安装（升级）一个新版本的操作系统。在你将新内核和新的 `initramfs` 复制到所有客户端的 ESP 之后，这个特性可以让你执行一种 [原子事务][4] 去切换所有客户端到新操作系统。

安装 Mojolicious：

```
$ sudo -i
# dnf install -y perl-Mojolicious
```

定义 “bootmenu” 应用程序：

```
# mkdir /opt/bootmenu
# cat << END > /opt/bootmenu/bootmenu.pl
#!/usr/bin/env perl
use Mojolicious::Lite;
use Mojolicious::Plugins;

plugin 'Config';

get '/menu';

app->start;
END
# chmod 755 /opt/bootmenu/bootmenu.pl
```

为 “bootmenu” 应用程序定义配置文件：

```
# cat << END > /opt/bootmenu/bootmenu.conf
{
 hypnotoad => {
 listen => ['http://*:80'],
 pid_file => '/run/bootmenu/bootmenu.pid',
 }
}
END
```

这是一个非常简单的 Mojolicious 应用程序，它监听 80 端口，并且只回应对 `/menu` 的请求。如果你想快速了解 Mojolicious 能做什么，运行 `man Mojolicious::Guides::Growing` 去查看手册。按 `Q` 键退出手册。

将 `boot.cfg` 移到我们的网络引导应用程序中作为一个名为 `menu.html.ep` 的模板：

```
# mkdir /opt/bootmenu/templates
# mv $HOME/esp/linux/boot.cfg /opt/bootmenu/templates/menu.html.ep
```

定义一个 systemd 服务去管理引导菜单应用程序：

```
# cat << END > /etc/systemd/system/bootmenu.service
[Unit]
Description=Serves iPXE Menus over HTTP
After=network-online.target

[Service]
Type=forking
DynamicUser=true
RuntimeDirectory=bootmenu
PIDFile=/run/bootmenu/bootmenu.pid
ExecStart=/usr/bin/hypnotoad /opt/bootmenu/bootmenu.pl
ExecReload=/usr/bin/hypnotoad /opt/bootmenu/bootmenu.pl
AmbientCapabilities=CAP_NET_BIND_SERVICE
KillMode=process

[Install]
WantedBy=multi-user.target
END
```

在本地防火墙中为 HTTP 服务添加一个例外规则，并启动 bootmenu 服务：

```
# firewall-cmd --add-service http
# firewall-cmd --runtime-to-permanent
# systemctl enable bootmenu.service
# systemctl start bootmenu.service
```

用 `wget` 测试它：

```
$ sudo dnf install -y wget
$ MY_BOOTMENU_SERVER=server-01.example.edu
$ wget -q -O - http://$MY_BOOTMENU_SERVER/menu
```

以上的命令应该会输出类似下面的内容：

```
#!ipxe

set timeout 5000

:menu
menu iPXE Boot Menu
item --key 1 lcl 1. Microsoft Windows 10
item --key 2 f29 2. RedHat Fedora 29
choose --timeout ${timeout} --default lcl selected || goto shell
set timeout 0
goto ${selected}

:failed
echo boot failed, dropping to shell...
goto shell

:shell
echo type 'exit' to get the back to the menu
set timeout 0
shell
goto menu

:lcl
exit

:f29
kernel --name kernel.efi ${prefix}/vmlinuz-4.19.4-300.fc29.x86_64 initrd=initrd.img ro ip=dhcp rd.peerdns=0 nameserver=192.0.2.91 nameserver=192.0.2.92 root=/dev/disk/by-path/ip-192.0.2.158:3260-iscsi-iqn.edu.example.server-01:fc29-lun-1 netroot=iscsi:192.0.2.158::::iqn.edu.example.server-01:fc29 console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img ${prefix}/initramfs-4.19.4-300.fc29.x86_64.img
boot || goto failed
```

现在，引导菜单服务器已经正常工作了，重新构建 `ipxe.efi` 引导加载器，使用一个初始化脚本指向它。

第一步，先更新我们在本系列文章的第一部分中创建的 `init.ipxe` 脚本：

```
$ MY_BOOTMENU_SERVER=server-01.example.edu
$ cat << END > $HOME/ipxe/init.ipxe
#!ipxe

dhcp || exit
set prefix file:///linux
chain http://$MY_BOOTMENU_SERVER/menu || exit
END
```

现在，重新构建引导加载器：

```
$ cd $HOME/ipxe/src
$ make clean
$ make bin-x86_64-efi/ipxe.efi EMBED=../init.ipxe
```

将更新后的引导加载器复制到你的 ESP 中：

```
$ cp $HOME/ipxe/src/bin-x86_64-efi/ipxe.efi $HOME/esp/efi/boot/bootx64.efi
```

将更新后的引导加载器复制到所有的客户端中之后，以后更新引导菜单只需要简单地编辑 `/opt/bootmenu/templates/menu.html.ep` 文件，然后再运行如下命令：

```
$ sudo systemctl restart bootmenu.service
```

### 做一步的改变

如果引导菜单服务器工作正常，在你的客户端系统上的 `boot.cfg` 文件将更长。

比如，重新添加 Fedora 28 镜像到引导菜单中：

```
$ sudo -i
# MY_FVER=28
# MY_KRNL=$(ls -c /fc$MY_FVER/lib/modules | head -n 1)
# MY_DNS1=192.0.2.91
# MY_DNS2=192.0.2.92
# MY_NAME=$(</etc/hostname)
# MY_EMAN=$(echo $MY_NAME | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_NAME})
# MY_ADDR=$(host -t A $MY_NAME | awk '{print $4}')
# cat << END >> /opt/bootmenu/templates/menu.html.ep

:f$MY_FVER
kernel --name kernel.efi \${prefix}/vmlinuz-$MY_KRNL initrd=initrd.img ro ip=dhcp rd.peerdns=0 nameserver=$MY_DNS1 nameserver=$MY_DNS2 root=/dev/disk/by-path/ip-$MY_ADDR:3260-iscsi-iqn.$MY_EMAN:fc$MY_FVER-lun-1 netroot=iscsi:$MY_ADDR::::iqn.$MY_EMAN:fc$MY_FVER console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img \${prefix}/initramfs-$MY_KRNL.img
boot || goto failed
END
# sed -i "/item --key 2/a item --key 3 f$MY_FVER 3. RedHat Fedora $MY_FVER" /opt/bootmenu/templates/menu.html.ep
# systemctl restart bootmenu.service
```

如果一切顺利，你的客户端下次引导时，应该看到如下图所示的结果：

![][5]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-build-a-netboot-server-part-3/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10379-1.html
[2]: https://ipxe.org/
[3]: https://fedoramagazine.org/wp-content/uploads/2018/11/netboot-menu-1024x641.png
[4]: https://en.wikipedia.org/wiki/Atomicity_(database_systems)
[5]: https://fedoramagazine.org/wp-content/uploads/2018/11/netboot-menu-updated-1024x641.png
