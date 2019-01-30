[#]: collector: (lujun9972)
[#]: translator: (jrglinux)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10493-1.html)
[#]: subject: (Turn a Raspberry Pi 3B+ into a PriTunl VPN)
[#]: via: (https://opensource.com/article/19/1/pritunl-vpn-raspberry-pi)
[#]: author: (Stephen Bancroft https://opensource.com/users/stevereaver)

将树莓派 3B+ 变为 PriTunl VPN
======

> PriTunl 是一种 VPN 解决方案，适用于希望私密的访问其网络的小型企业和个人。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2)

[PriTunl][1] 是一款出色的 VPN 终端解决方案，非常适合希望以简单快捷的方式私密的访问网络的小型企业和个人。它是开源的，基本的免费版本涵盖最通用的简单的实例，足以让你快速入门。也有集成了活动目录等高级功能的付费企业版。

### 有关树莓派 3B+ 的特别注意事项

PriTunl 的安装通常也很简单，但要在树莓派 3B+ 上安装 PriTunl 有点小复杂。比如，PriTunl 只提供了 AMD64 和 i386 架构的二进制文件，但树莓派 3B+ 是 ARM 架构的，这意味着需要从源码自行编译可用于树莓派 3B+ 的 PriTunl 可执行文件。不过，无需担心，编译过程很简单，只需花一点时间执行几行命令即可。

另一个问题：PriTunl 好像必须要是 64 位处理器架构，当我在 32 位操作系统上尝试编译的时候报错了。但幸运的是，用于 ARM64 架构的 Ubuntu 18.04 测试版本可以安装在树莓派 3B+ 上。

同样，树莓派 3B+ 需要和其他树莓派不同的引导程序。需要一组小复杂的命令来安装更新树莓派 3B+ 上必要的组件。

### 安装 PriTunl

你可以先在树莓派 3B+ 上安装 64 位的操作系统来避免下面这些问题。此处需要一些必要的基础知识如在树莓派上执行命令行。

打开终端，用如下命令下载 Ubuntu 18.04 用于 ARM64 架构的测试版：

```
$ wget http://cdimage.ubuntu.com/releases/18.04/beta/ubuntu-18.04-beta-preinstalled-server-arm64+raspi3.img.xz
```

将下载的固件解压：

```
$ xz -d ubuntu-18.04-beta-preinstalled-server-arm64+raspi3.xz
```

将准备好的 SD 卡插入电脑读卡槽，电脑会为 SD 卡分配一个驱动分配器号，例如 `/dev/sda` 或者 `/dev/sdb`。 输入命令 `dmesg` 然后观察屏幕上的最后几行找到 SD 卡的驱动分配器。

**下一步小心操作，如果搞错了驱动分配器号，可能会破坏你的系统。**

用如下命令往 SD 卡中写入数据，将其中的 `<DRIVE>` 替换成你的 SD 驱动器号。

```
$ dd if=ubuntu-18.04-beta-preinstalled-server-arm64+raspi3.img of=<DRIVE> bs=8M
```

完成上一步之后，将 SD 卡插入树莓派 3B+ ，并启动它。确保树莓派 3B+ 是连网的，然后登录系统，用户名/密码：`ubuntu` / `ubuntu`。

在树莓派上输入以下命令以安装一些编译 PriTunl 所需的包：

```
$ sudo apt-get -y install build-essential git bzr python python-dev python-pip net-tools openvpn bridge-utils psmisc golang-go libffi-dev mongodb
```

和 PriTunl 标准源码上的 [安装说明][2] 有一点不一样。确保已经登录进树莓派然后切换到管理员账户：

```
$ sudo su -
```

现在你应该在管理员账户的目录下，按如下命令来安装 PriTunl 1.29.1914.98 版本：

```
export VERSION=1.29.1914.98
tee -a ~/.bashrc << EOF
export GOPATH=\$HOME/go
export PATH=/usr/local/go/bin:\$PATH
EOF
source ~/.bashrc
mkdir pritunl && cd pritunl
go get -u github.com/pritunl/pritunl-dns
go get -u github.com/pritunl/pritunl-web
sudo ln -s ~/go/bin/pritunl-dns /usr/bin/pritunl-dns
sudo ln -s ~/go/bin/pritunl-web /usr/bin/pritunl-web
wget https://github.com/pritunl/pritunl/archive/$VERSION.tar.gz
tar -xf $VERSION.tar.gz
cd pritunl-$VERSION
python2 setup.py build
pip install -r requirements.txt
python2 setup.py install --prefix=/usr/local
```

现在，不出意外的话应该可以启动 MongoDB 和 PriTunl 的 systemd 单元了。假如现在还是以管理员账户登录的话，输入：

```
systemctl daemon-reload
systemctl start mongodb pritunl
systemctl enable mongodb pritunl
```

大功告成！你现在可以登录 PriTunl 的用户界面并按照官网上的 [安装和配置手册][3] 来配置它了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/pritunl-vpn-raspberry-pi

作者：[Stephen Bancroft][a]
选题：[lujun9972][b]
译者：[jrg](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stevereaver
[b]: https://github.com/lujun9972
[1]: https://pritunl.com/
[2]: https://github.com/pritunl/pritunl
[3]: https://docs.pritunl.com/docs/configuration-5
