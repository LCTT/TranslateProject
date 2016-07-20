如何在 Linux 上永久挂载一个 Windows 共享
==================================================

> 如果你已经厌倦了每次重启 Linux 就得重新挂载 Windows 共享，读读这个让共享永久挂载的简单方法。

![](http://tr2.cbsistatic.com/hub/i/2016/06/02/e965310b-b38d-43e6-9eac-ea520992138b/68fd9ec5d6731cc405bdd27f2f42848d/linuxadminhero.jpg)

*图片： Jack Wallen*

在 Linux 上和一个 Windows 网络进行交互从来就不是件轻松的事情。想想多少企业正在采用 Linux，需要在这两个平台上彼此协作。幸运的是，有了一些工具的帮助，你可以轻松地将 Windows 网络驱动器映射到一台 Linux 机器上，甚至可以确保在重启 Linux 机器之后共享还在。

### 在我们开始之前

要实现这个，你需要用到命令行。过程十分简单，但你需要编辑 /etc/fstab 文件，所以小心操作。还有，我假设你已经让  Samba  正常工作了，可以手动从 Windows 网络挂载共享到你的 Linux 机器，还知道这个共享的主机 IP 地址。

准备好了吗？那就开始吧。

### 创建你的挂载点

我们要做的第一件事是创建一个文件夹，他将作为共享的挂载点。为了简单起见，我们将这个文件夹命名为 share，放在 /media 之下。打开你的终端执行以下命令：

```
sudo mkdir /media/share
```

### 安装一些软件

现在我们得安装允许跨平台文件共享的系统；这个系统是 cifs-utils。在终端窗口输入：

```
sudo apt-get install cifs-utils
```

这个命令同时还会安装 cifs-utils 所有的依赖。

安装完成之后，打开文件 /etc/nsswitch.conf 并找到这一行：

```
hosts: files mdns4_minimal [NOTFOUND=return] dns
```

编辑这一行，让它看起来像这样：

```
hosts: files mdns4_minimal [NOTFOUND=return] wins dns
```

现在你需要安装 windbind 让你的 Linux 机器可以在 DHCP 网络中解析 Windows 机器名。在终端里执行：

```
sudo apt-get install libnss-windbind windbind
```

用这个命令重启网络服务：

```
sudo service networking restart
```

### 挂载网络驱动器

现在我们要映射网络驱动器。这里我们必须编辑 /etc/fstab 文件。在你做第一次编辑之前，用这个命令备份以下这个文件：

```
sudo cp /etc/fstab /etc/fstab.old
```

如果你需要恢复这个文件，执行以下命令：

```
sudo mv /etc/fstab.old /etc/fstab
```

在你的主目录创建一个认证信息文件 .smbcredentials。在这个文件里添加你的用户名和密码，就像这样（USER 和 PASSWORD 替换为实际的用户名和密码）：

```
username=USER

password=PASSWORD
```

你需要知道挂载这个驱动器的用户的组 ID（GID）和用户 ID（UID）。执行命令：

```
id USER
```

USER 是你的实际用户名，你应该会看到类似这样的信息：

```
uid=1000(USER) gid=1000(GROUP)
```

USER 是实际的用户名，GROUP 是组名。在（USER）和（GROUP）之前的数字将会被用在 /etc/fstab 文件之中。

是时候编辑 /etc/fstab 文件了。在你的编辑器中打开那个文件并添加下面这行到文件末尾（替换以下全大写字段以及远程机器的 IP 地址）：

```
//192.168.1.10/SHARE /media/share cifs credentials=/home/USER/.smbcredentials,iocharset=uft8,gid=GID,udi=UID,file_mode=0777,dir_mode=0777 0 0
```

**注意**：上面这些内容应该在同一行上。

保存并关闭那个文件。执行 sudo mount -a 命令，共享将被挂载。检查一下 /media/share，你应该能看到那个网络共享上的文件和文件夹了。

### 共享很简单

有了 cifs-utils 和 Samba，映射网络共享在一台 Linux 机器上简单得让人难以置信。现在，你再也不用在每次机器启动的时候手动重新挂载那些共享了。

更多网络提示和技巧，订阅我们的 Data Center 消息吧。
[订阅](https://secure.techrepublic.com/user/login/?regSource=newsletter-button&position=newsletter-button&appId=true&redirectUrl=http%3A%2F%2Fwww.techrepublic.com%2Farticle%2Fhow-to-permanently-mount-a-windows-share-on-linux%2F&)

--------------------------------------------------------------------------------

via: http://www.techrepublic.com/article/how-to-permanently-mount-a-windows-share-on-linux/

作者：[Jack Wallen][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.techrepublic.com/search/?a=jack+wallen
