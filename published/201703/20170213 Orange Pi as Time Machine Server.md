使用 Orange Pi 搭建 Time Machine 服务器
=================================

![Orange Pi as Time Machine Server](https://i1.wp.com/piboards.com/wp-content/uploads/2017/02/OPiTM.png?resize=960%2C450) 

我的工作之一是为各类家用计算机安排进行自动备份，包括存放重要数据的一组 Mac 计算机。我决定使用运行 [Armbian Linux][4] 的便宜的 [Orange Pi][3] 做实验，目的是希望 [Time Machine][5] 可以通过网络使用挂载在 Orange Pi 主板上的 USB 驱动器。在这种情况下，我找到并成功地安装了 Netatalk。

[Netatalk][6] 是一个用作苹果文件服务器的开源软件。通过 [Avahi][7] 和 Netatalk 配合运行，你的 Mac 设备能够识别网络上的 Orange Pi 设备，甚至会将 Orange pi 设备当作 “Mac” 类型的设备。这使得你能够手动连接到该网络设备，更重要的是使得 Time Machine 能够发现并使用远程驱动器。如果你想在 Mac 上设置类似的备份机制，下面的指南也许能够帮到你。

### 准备工作

为了配置该 USB 驱动器，我首先尝试了 HFS+ 格式文件系统，不幸的是我没能成功写入。所以我选择创建一个 EXT4 文件系统，并确保用户 `pi` 有读写权限。Linux 有很多格式化磁盘的方法，但是我最喜欢（而且推荐）的仍然是 [gparted][8]。由于 gparted 已经集成在 Armbian 桌面了，所以我直接使用了该工具。

我需要当 Orange Pi 启动或者 USB 驱动连接的时候，这个设备能够自动挂载到相同的位置。于是我创建了一个目录（`timemachine`）用于挂载：在其下新建一个 `tm` 目录用于真正的备份路径，并将 `tm` 的所有者更改为用户 `pi`。

```
cd /mnt
sudo mkdir timemachine
cd timemachine
sudo mkdir tm
sudo chown pi:pi tm
```

下一步，我打开一个终端并编辑 `/etc/fstab` 文件。

```
sudo nano /etc/fstab
```

并在该文件末尾添加了一行我的设备信息（根据我的设备情况，设置为 `sdc2`）：

```
/dev/sdc2 /mnt/timemachine ext4 rw,user,exec 0 0
```

你需要通过命令行预装一些包，可能其中一些已经安装在你的系统上了：

```
sudo apt-get install build-essential libevent-dev libssl-dev libgcrypt11-dev libkrb5-dev libpam0g-dev libwrap0-dev libdb-dev libtdb-dev libmysqlclient-dev avahi-daemon libavahi-client-dev libacl1-dev libldap2-dev libcrack2-dev systemtap-sdt-dev libdbus-1-dev libdbus-glib-1-dev libglib2.0-dev libio-socket-inet6-perl tracker libtracker-sparql-1.0-dev libtracker-miner-1.0-dev hfsprogs hfsutils avahi-daemon
```

### 安装并配置 Netatalk

下一步是下载 Netatalk，解压下载的文件，然后切换到 Netatalk 目录：

```
wget https://sourceforge.net/projects/netatalk/files/netatalk/3.1.10/netatalk-3.1.10.tar.bz2
tar xvf netatalk-3.1.10.tar.bz2
cd netatalk-3.1.10
```

然后需要顺序执行 `./configure`，`make`，`make install` 命令安装软件。在 netatalk-3.1.10 目录中执行 如下的 `./configure` 命令，这个命令需要花点时间才能执行完。

```
./configure --with-init-style=debian-systemd --without-libevent --without-tdb --with-cracklib --enable-krbV-uam --with-pam-confdir=/etc/pam.d --with-dbus-daemon=/usr/bin/dbus-daemon --with-dbus-sysconf-dir=/etc/dbus-1/system.d --with-tracker-pkgconfig-version=1.0
```

`./configure` 运行完成后执行 `make`：

```
make
```

执行完 `make` 命令需要花较长时间，可以考虑喝杯咖啡或者做点其他什么。之后，执行以下命令：

```
sudo make install
```

这个命令能够快速执行完成。现在你可以通过下面两个命令验证安装是否成功，同时找到配置文件位置。

```
sudo netatalk -V
sudo afpd -V
```

然后你需要编辑 `afp.conf` 配置文件并在其中指定 Time Machine 备份路径，可以访问的帐号名并指定是否使用 [Spotlight][9] 为备份建立索引。

```
sudo nano /usr/local/etc/afp.conf
```

下面是 `afp.conf` 的配置示例：

```
[My Time Machine Volume]
path = /mnt/timemachine/tm
valid users = pi
time machine = yes
spotlight = no
```

最后，启用 Avahi 和 Netatalk 并启动它们。

```
sudo systemctl enable avahi-daemon
sudo systemctl enable netatalk
sudo systemctl start avahi-daemon
sudo systemctl start netatalk
```

### 连接到网络驱动器

此时，你的 Mac 可能已经发现并识别了你的 Pi 设备和网络驱动器。打开 Mac 中的 Finder，看看是否有像下面的内容：

![](https://i2.wp.com/piboards.com/wp-content/uploads/2017/02/TM_drive.png?resize=241%2C89) 

当然你也可以通过主机名或者 ip 地址访问，比如：

```
afp://192.168.1.25
```

### Time Machine 备份

最后，打开 Mac 上的 Time Machine，然后“选择硬盘”，选择你的 Orange pi。

 ![](https://i1.wp.com/piboards.com/wp-content/uploads/2017/02/OPiTM.png?resize=579%2C381) 

这样设置肯定有效，Orange Pi 能够很好的处理进程，不过这可能并不是最快速的备份方式。但是，这个方法比较简单且便宜，并且正如其展示的一样能够正常工作。如果对这些设置你已经成功或者进行了改进，请在下面留言或者发送消息给我。

![](https://i0.wp.com/piboards.com/wp-content/uploads/2017/02/backup_complete.png?resize=300%2C71) 

Amazon 上有售卖 Orange Pi 主板。

--------------------------------------------------------------------------------

via: http://piboards.com/2017/02/13/orange-pi-as-time-machine-server/

作者：[MIKE WILMOTH][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://piboards.com/author/piguy/
[1]:http://piboards.com/author/piguy/
[2]:http://piboards.com/2017/02/13/orange-pi-as-time-machine-server/
[3]:https://www.amazon.com/gp/product/B018W6OTIM/ref=as_li_tl?ie=UTF8&tag=piboards-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B018W6OTIM&linkId=08bd6573c99ddb8a79746c8590776c39
[4]:https://www.armbian.com/
[5]:https://support.apple.com/kb/PH25710?locale=en_US
[6]:http://netatalk.sourceforge.net/
[7]:https://en.wikipedia.org/wiki/Avahi_(software)
[8]:http://gparted.org/
[9]:https://support.apple.com/en-us/HT204014
