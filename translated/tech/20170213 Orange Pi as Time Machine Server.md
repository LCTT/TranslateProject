
使用Orange Pi搭建Time Machine服务
=================================

 ![Orange Pi as Time Machine Server](https://i1.wp.com/piboards.com/wp-content/uploads/2017/02/OPiTM.png?resize=960%2C450) 

我有一个项目是安排各类家用计算机进行自动备份。该项目将重要数据存放在一组Macs中。但是我决定将那些运行[Armbian][4] Linux的[Orange Pi][3]用来做实验，目的是希望能够将[Time Machine][5]运行在安装了USB网络驱动的Orange Pi主板上。在这种情况下，我找到成功安装Netatalk的方法。

[Netatalk][6]是一个开源软件，用于苹果文件服务器。通过[Avahi][7]和Netatalk配合运行，你的Mac设备能够识别网络上的Orange Pi设备，并会将Orange pi设备当作Mac类型的设备。这使得你能够自动连接作为网络设备，更重要的是使得Time Machine能够发现并使用远程驱动。下面的指南能够帮助你在Macs上设置类似的备份机制。

### 准备工作

为了安装USB驱动，我首先尝试了HFS+格式文件系统，不幸的是我没能成功写入。所以我选择创建一个EXT4文件系统，并确保pi用户有读写权限。Linux有很多格式化磁盘的方法，但是我最喜欢（推荐）的仍然是[gparted][8]。由于gparted已经集成在Armbian桌面了，所以我直接使用了该工具。

我预期的是当Pi主板启动或者USB驱动连接的时候这个设备能够自动挂载到相同的位置。于是我创建了一个目录用于挂载：新建一个tm目录用于真正的备份地址，并将tm的所有者更改为pi。

```
cd /mnt
sudo mkdir timemachine
cd timemachine
sudo mkdir tm
sudo chown pi:pi tm
```

下一步，我打开一个终端并编辑/etc/fstab文件

```
sudo nano /etc/fstab
```

并在该文件末尾添加了一行我的设备信息（根据我的设备情况，设置为sdc2）：

```
/dev/sdc2 /mnt/timemachine ext4 rw,user,exec 0 0
```

你需要通过命名行预装一些包，可能其中一些已经安装在你的系统上了：

```
sudo apt-get install build-essential libevent-dev libssl-dev libgcrypt11-dev libkrb5-dev libpam0g-dev libwrap0-dev libdb-dev libtdb-dev libmysqlclient-dev avahi-daemon libavahi-client-dev libacl1-dev libldap2-dev libcrack2-dev systemtap-sdt-dev libdbus-1-dev libdbus-glib-1-dev libglib2.0-dev libio-socket-inet6-perl tracker libtracker-sparql-1.0-dev libtracker-miner-1.0-dev hfsprogs hfsutils avahi-daemon
```

### 安装并配置Netatalk

下一步是下载Netatalk，解压下载的archive文件，然后切换到Netatalk目录：

```
wget https://sourceforge.net/projects/netatalk/files/netatalk/3.1.10/netatalk-3.1.10.tar.bz2
tar xvf netatalk-3.1.10.tar.bz2
cd netatalk-3.1.10
```

然后需要顺序执行configure，make，make install命令安装软件。在netatalk-3.1.10目录中执行configure命令，这个命令需要花点时间才能执行完。

```
./configure --with-init-style=debian-systemd --without-libevent --without-tdb --with-cracklib --enable-krbV-uam --with-pam-confdir=/etc/pam.d --with-dbus-daemon=/usr/bin/dbus-daemon --with-dbus-sysconf-dir=/etc/dbus-1/system.d --with-tracker-pkgconfig-version=1.0
```

configure运行完成后执行make：

```
make
```

执行完make命令需要花较长时间，可以考虑喝杯咖啡或者做点其他什么。当执行完后执行以下命令：

```
sudo make install
```

这个命令能够快速执行完成。现在你可以通过下面两个命令验证安装是否成功以及查找配置文件位置。

```
sudo netatalk -V
sudo afpd -V
```

然后你需要编辑afp.conf配置文件并在其中指定Time Machine备份路径，可以访问的帐号名并指定是否使用[Spotlight][9]用于搜索备份。

```
sudo nano /usr/local/etc/afp.conf
```

下面是afp.conf的配置示例：

```
[My Time Machine Volume]
path = /mnt/timemachine/tm
valid users = pi
time machine = yes
spotlight = no
```
最后，设置Avahi和Netatalk并启动。

```
sudo systemctl enable avahi-daemon
sudo systemctl enable netatalk
sudo systemctl start avahi-daemon
sudo systemctl start netatalk
```

### 连接到网络驱动

此时，你的Mac可能已经发现并识别了你的Pi设备。打开Mac中的Finder访问下面地址看看以下内容：

 ![](https://i2.wp.com/piboards.com/wp-content/uploads/2017/02/TM_drive.png?resize=241%2C89) 

当然你也可以通过host或者ip地址访问，比如：

```
afp://192.168.1.25
```
### Time Machine备份
### Time Machine Backup

最后打开Mac上的Time Machine，然后选中硬盘，选择Orange pi。

 ![](https://i1.wp.com/piboards.com/wp-content/uploads/2017/02/OPiTM.png?resize=579%2C381) 

通过这样设置后Orange Pi肯定能够正常工作并能够像champ一样处理，不过这并不是最快速的备份方式。但是这个方法比较简单且便宜，并且正如其展示的一样能够正常工作。如果你已经成功或者改进了这些设置，请在下面留言或者发送消息给我。

 ![](https://i0.wp.com/piboards.com/wp-content/uploads/2017/02/backup_complete.png?resize=300%2C71) 

Amazon上有售卖Orange Pi主板:

--------------------------------------------------------------------------------

via: http://piboards.com/2017/02/13/orange-pi-as-time-machine-server/

作者：[MIKE WILMOTH][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[校对者ID](https://github.com/校对者ID)

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
