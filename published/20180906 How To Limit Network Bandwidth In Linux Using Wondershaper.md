在 Linux 中使用 Wondershaper 限制网络带宽
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Wondershaper-1-720x340.jpg)

以下内容将向你介绍如何轻松对网络带宽做出限制，并在类 Unix 操作系统中对网络流量进行优化。通过限制网络带宽，可以节省应用程序不必要的带宽消耗，包括软件包管理器（pacman、yum、apt）、web 浏览器、torrent 客户端、下载管理器等，并防止单个或多个用户滥用网络带宽。在本文当中，将会介绍 Wondershaper 这一个实用的命令行程序，这是我认为限制 Linux 系统 Internet 或本地网络带宽的最简单、最快捷的方式之一。

请注意，Wondershaper 只能限制本地网络接口的传入和传出流量，而不能限制路由器或调制解调器的接口。换句话说，Wondershaper 只会限制本地系统本身的网络带宽，而不会限制网络中的其它系统。因此 Wondershaper 主要用于限制本地系统中一个或多个网卡的带宽。

下面来看一下 Wondershaper 是如何优化网络流量的。

### 在 Linux 中使用 Wondershaper 限制网络带宽

`wondershaper` 是用于显示系统网卡网络带宽的简单脚本。它使用了 iproute 的 `tc` 命令，但大大简化了操作过程。

#### 安装 Wondershaper

使用 `git clone` 克隆 Wondershaper 的版本库就可以安装最新版本：

```
$ git clone https://github.com/magnific0/wondershaper.git
```

按照以下命令进入 `wondershaper` 目录并安装：

```
$ cd wondershaper
$ sudo make install
```

然后执行以下命令，可以让 `wondershaper` 在每次系统启动时都自动开始服务：

```
$ sudo systemctl enable wondershaper.service
$ sudo systemctl start wondershaper.service
```

如果你不强求安装最新版本，也可以使用软件包管理器（官方和非官方均可）来进行安装。

`wondershaper` 在 [Arch 用户软件仓库][1]（Arch User Repository，AUR）中可用，所以可以使用类似 [yay][2] 这些 AUR 辅助软件在基于 Arch 的系统中安装 `wondershaper` 。

```
$ yay -S wondershaper-git
```

对于 Debian、Ubuntu 和 Linux Mint 可以使用以下命令安装：

```
$ sudo apt-get install wondershaper
```

对于 Fedora 可以使用以下命令安装：

```
$ sudo dnf install wondershaper
```

对于 RHEL、CentOS，只需要启用 EPEL 仓库，就可以使用以下命令安装：

```
$ sudo yum install epel-release
$ sudo yum install wondershaper
```

在每次系统启动时都自动启动 `wondershaper` 服务。

```
$ sudo systemctl enable wondershaper.service
$ sudo systemctl start wondershaper.service
```

#### 用法

首先需要找到网络接口的名称，通过以下几个命令都可以查询到网卡的详细信息：

```
$ ip addr
$ route
$ ifconfig
```

在确定网卡名称以后，就可以按照以下的命令限制网络带宽：

```
$ sudo wondershaper -a <adapter> -d <rate> -u <rate>
```

例如，如果网卡名称是 `enp0s8`，并且需要把上行、下行速率分别限制为 1024 Kbps 和 512 Kbps，就可以执行以下命令：

```
$ sudo wondershaper -a enp0s8 -d 1024 -u 512
```

其中参数的含义是：

  * `-a`：网卡名称
  * `-d`：下行带宽
  * `-u`：上行带宽

如果要对网卡解除网络带宽的限制，只需要执行：

```
$ sudo wondershaper -c -a enp0s8
```

或者：

```
$ sudo wondershaper -c enp0s8
```

如果系统中有多个网卡，为确保稳妥，需要按照上面的方法手动设置每个网卡的上行、下行速率。

如果你是通过 `git clone` 克隆 GitHub 版本库的方式安装 Wondershaper，那么在 `/etc/conf.d/` 目录中会存在一个名为 `wondershaper.conf` 的配置文件，修改这个配置文件中的相应值（包括网卡名称、上行速率、下行速率），也可以设置上行或下行速率。

```
$ sudo nano /etc/conf.d/wondershaper.conf

[wondershaper]
# Adapter
#
IFACE="eth0"

# Download rate in Kbps
#
DSPEED="2048"

# Upload rate in Kbps
#
USPEED="512"
```

Wondershaper 使用前：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/wondershaper-1.png)

Wondershaper 使用后：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/wondershaper-2.png)

可以看到，使用 Wondershaper 限制网络带宽之后，下行速率与限制之前相比已经大幅下降。

执行以下命令可以查看更多相关信息。

```
$ wondershaper -h
```

也可以查看 Wondershaper 的用户手册：

```
$ man wondershaper
```

根据测试，Wondershaper 按照上面的方式可以有很好的效果。你可以试用一下，然后发表你的看法。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-limit-network-bandwidth-in-linux-using-wondershaper/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://aur.archlinux.org/packages/wondershaper-git/
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/

