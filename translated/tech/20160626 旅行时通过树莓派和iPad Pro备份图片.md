旅行时通过树莓派和iPad Pro备份图片
===================================================================

![](http://www.movingelectrons.net/images/bkup_photos_main.jpg)
>旅行中备份图片 - Gear.

### 介绍

我在很长的时间内一直在寻找一个旅行中备份图片的理想方法,把SD卡放进你的相机包是比较危险和暴露的，SD卡可能丢失或者被盗，数据可能损坏或者在传输过程中失败。比较好的一个选择是复制到另外一个设备即使它也是个SD卡，并且将它放到一个比较安全的地方去，备份到远端也是一个可行的办法，但是如果去了一个没有网络的地方就不太可行了。

我理想的备份步骤需要下面的工具:

1. 用一台iPad pro而不是一台笔记本。我喜欢简便的旅行，我的旅行大部分是商务的而不是拍摄休闲的，这很显然我为什么选择了iPad Pro
2. 用尽可能少的设备
3. 设备之间的连接需要很安全。我需要在旅馆和机场使用，所以设备之间的连接需要时封闭的加密的。
4. 整个过程应该是稳定的安全的，我还用过其他的移动设备，但是效果不太理想[1].

### 设置

我制定了一个满足上面条件并且在未来可以扩充的设定，它包含下面这些部件的使用:

1. [2]9.7寸写作时最棒的又小又轻便的IOS系统的iPad Pro，苹果笔不是不许的，但是当我在路上进行一些编辑的时候依然需要，所有的重活由树莓派做 ，其他设备通过ssh连接设备
2. [3] 树莓派3包含Raspbian系统
3. [4]Mini SD卡 [box/case][5].
5. [6]128G的优盘，对于我是够用了，你可以买个更大的，你也可以买个移动硬盘，但是树莓派没办法给移动硬盘供电，你需要额外准备一个供电的hub，当然优质的线缆能提供可靠便捷的安装和连接。
6. [9]SD读卡器
7. [10]另外的sd卡，SD卡我在用满之前就会立即换一个，这样就会让我的照片分布在不同的sd卡上

下图展示了这些设备之间如何相互连接.

![](http://www.movingelectrons.net/images/bkup_photos_diag.jpg)
>旅行时照片的备份-过程表格.

树莓派会作为一个热点. 它会创建一个WIFI网络，当然也可以建立一个Ad Hoc网络，更简单一些，但是它不会加密设备之间的连接，因此我选择创建WIFI网络。

SD卡放进SD读卡器插到树莓派USB端口上，128G的大容量优盘一直插在树莓派的USB端口上，我选择了一款闪迪的体积比较小。主要的思路就是通过脚本把SD卡的图片备份到优盘上，脚本是增量备份，而且脚本会自动运行，使备份特别快，如果你有很多的照片或者拍摄了很多没压缩的照片，这个任务量就比较大，用ipad来运行Python脚本，而且用来浏览SD卡和优盘的文件。

如果给树莓派连上一根能上网的网线，那样连接树莓派wifi的设备就可以上网啦！

### 1. 树莓派的设置

这部分要用到命令行模式，我会尽可能详细的介绍，方便大家进行下去。

#### 安装和配置Raspbian

给树莓派连接鼠标键盘和显示器，将SD卡插到树莓派上，在官网按步骤安装Raspbian [12].

安装完后执行下面的命令:

```
sudo apt-get update
sudo apt-get upgrade
```

升级机器上所有的软件到最新，我将树莓派连接到本地网络，而且为了安全更改了默认的密码。

Raspbian默认开启了SSH，这样所有的设置可以在一个远程的设备上完成。我也设置了RSA验证，那是个可选的功能，查看能多信息 [这里][13].

这是一个在MAC上建立SSH连接到树莓派上的截图[14]:

##### 建立WPA2验证的WIFI

这个安装过程是基于这篇文章，只适用于我自己做的例子[15].

##### 1. 安装软件包

我们需要安装下面的软件包:

```
sudo apt-get install hostapd
sudo apt-get install dnsmasq
```

hostapd用来创建wifi，dnsmasp用来做dhcp和dns服务，很容易设置.

##### 2. 编辑dhcpcd.conf

通过网络连接树莓派，网络设置树莓派需要dhcpd，首先我们将wlan0设置为一个静态的IP。

用sudo nano `/etc/dhcpcd.conf`命令打开配置文件，在最后一行添加上如下信息:

```
denyinterfaces wlan0
```

注意: 必须先配置这个接口才能配置其他接口.

##### 3. 编辑端口

现在设置静态IP，sudo nano `/etc/network/interfaces`打开端口配置文件按照如下信息编辑wlan0选项:

```
allow-hotplug wlan0
iface wlan0 inet static
    address 192.168.1.1
    netmask 255.255.255.0
    network 192.168.1.0
    broadcast 192.168.1.255
#    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

同样, 然后添加wlan1信息:

```
#allow-hotplug wlan1
#iface wlan1 inet manual
#    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

重要: sudo service dhcpcd restart命令重启dhcpd服务`sudo ifdown eth0; sudo ifup wlan0`命令用来关闭eth0端口再开启用来生效配置文件.

##### 4. 配置Hostapd

接下来我们配置hostapd，`sudo nano /etc/hostapd/hostapd.conf` 用这个命令创建并填写配置信息到文件中:

```
interface=wlan0

# Use the nl80211 driver with the brcmfmac driver
driver=nl80211

# This is the name of the network
ssid=YOUR_NETWORK_NAME_HERE

# Use the 2.4GHz band
hw_mode=g

# Use channel 6
channel=6

# Enable 802.11n
ieee80211n=1

# Enable QoS Support
wmm_enabled=1

# Enable 40MHz channels with 20ns guard interval
ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]

# Accept all MAC addresses
macaddr_acl=0

# Use WPA authentication
auth_algs=1

# Require clients to know the network name
ignore_broadcast_ssid=0

# Use WPA2
wpa=2

# Use a pre-shared key
wpa_key_mgmt=WPA-PSK

# The network passphrase
wpa_passphrase=YOUR_NEW_WIFI_PASSWORD_HERE

# Use AES, instead of TKIP
rsn_pairwise=CCMP
```

配置完成后，我们需要运行 `sudo nano /etc/default/hostapd` 命令打开这个配置文件然后找到`#DAEMON_CONF=""` 替换成`DAEMON_CONF="/etc/hostapd/hostapd.conf"`以便hostapd服务能够找到对应的配置文件.

##### 5. 配置Dnsmasq

dnsmasp配置文件包含很多信息方便你使用它，但是我们不需要那么多选项，我建议用下面两条命令把它放到别的地方，不要删除它，然后自己创建一个文件

```
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig  
sudo nano /etc/dnsmasq.conf  
```

粘贴下面的信息到新文件中:

```
interface=wlan0      # Use interface wlan0
listen-address=192.168.1.1 # Explicitly specify the address to listen on
bind-interfaces      # Bind to the interface to make sure we aren't sending things elsewhere
server=8.8.8.8       # Forward DNS requests to Google DNS
domain-needed        # Don't forward short names
bogus-priv           # Never forward addresses in the non-routed address spaces.
dhcp-range=192.168.1.50,192.168.1.100,12h # Assign IP addresses in that range  with a 12 hour lease time
```

##### 6. 设置IPv4转发

最后我们需要做的事就是配置包转发，用`sudo nano /etc/sysctl.conf`命令打开sysctl.conf文件，将containing `net.ipv4.ip_forward=1`之前的#号删除，然后重启生效

我们还需要给连接树莓派的设备通过WIFI分享一个网络连接，做一个wlan0和eth0的NAT，我们可以参照下面的脚本来实现。

```
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT  
```

我命名了一个hotspot-boot.sh的脚本然后让它可以运行:

```
sudo chmod 755 hotspot-boot.sh
```

脚本会在树莓派启动的时候运行，有很多方法实现，下面是我实现的方式:

1. 把文件放到`/home/pi/scripts`目录下.
2. 编辑rc.local文件，输入`sudo nano /etc/rc.local`命令将运行脚本命令放到exit0之前[16]).

下面是实例.

```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

sudo /home/pi/scripts/hotspot-boot.sh &

exit 0

```

#### 安装Samba服务和NTFS兼容驱动.

我们要安装下面几个软件使我们能够访问树莓派分享的文件夹，ntfs-3g可以使我们能够方位ntfs文件系统的文件.

```
sudo apt-get install ntfs-3g
sudo apt-get install samba samba-common-bin
```

你可以参照这些文档来配置Samba[17] .

重要提示，推荐的文档要先挂在外置硬盘，我们不这样做，因为在这篇文章写作的时候树莓派在启动时的auto-mounts功能同时将sd卡和优盘挂载到`/media/pi/`上，这篇文章有一些多余的功能我们也不会采用。

### 2. Python脚本

树莓派配置好后，我们需要让脚本拷贝和备份照片的时候真正的起作用，脚本只提供了特定的自动化备份进程，如果你有基本的cli操作的技能，你可以ssh进树莓派，然后拷贝你自己的照片从一个设备到另外一个设备用cp或者rsync命令。在脚本里我们用rsync命令，这个命令比较可靠而且支持增量备份。

这个过程依赖两个文件，脚本文件自身和`backup_photos.conf`这个配置文件，后者只有几行包含已挂载的目的驱动器和应该挂载到哪个目录，它看起来是这样的:

```
mount folder=/media/pi/
destination folder=PDRIVE128GB
```

重要提示: 在这个符号`=`前后不要添加多余的空格，否则脚本会失效.

下面是这个Python脚本，我把它命名为`backup_photos.py`，把它放到了`/home/pi/scripts/`目录下，我在每行都做了注释可以方便的查看各行的功能.

```
#!/usr/bin/python3

import os
import sys
from sh import rsync

'''
脚本将挂载到/media/pi的sd卡上的内容复制到一个目的磁盘的同名目录下，目的驱动器的名字在.conf文件里定义好了.


Argument:  label/name of the mounted SD Card.
'''

CONFIG_FILE = '/home/pi/scripts/backup_photos.conf'
ORIGIN_DEV = sys.argv[1]

def create_folder(path):

    print ('attempting to create destination folder: ',path)
    if not os.path.exists(path):
        try: 
            os.mkdir(path)
            print ('Folder created.')
        except:
            print ('Folder could not be created. Stopping.')
            return
    else:
        print ('Folder already in path. Using that instead.')



confFile = open(CONFIG_FILE,'rU') 
#IMPORTANT: rU Opens the file with Universal Newline Support, 
#so \n and/or \r is recognized as a new line.

confList = confFile.readlines()
confFile.close()


for line in confList:
    line = line.strip('\n')

    try:
        name , value = line.split('=')

        if name == 'mount folder':
            mountFolder = value
        elif name == 'destination folder':
            destDevice = value


    except ValueError:
        print ('Incorrect line format. Passing.')
        pass


destFolder = mountFolder+destDevice+'/'+ORIGIN_DEV
create_folder(destFolder)

print ('Copying files...')

# Comment out to delete files that are not in the origin:
# rsync("-av", "--delete", mountFolder+ORIGIN_DEV, destFolder)
rsync("-av", mountFolder+ORIGIN_DEV+'/', destFolder)

print ('Done.')
```

### 3.iPad Pro的配置

树莓派做了最重的活，而且iPad Pro根本没参与传输文件，我们在iPad上只需要安装上Prompt2来通过ssh连接树莓派就行了，这样你既可以运行Python脚本也可以复制文件了。[18]; [19].

![](http://www.movingelectrons.net/images/bkup_photos_ipad&rpi_prompt.jpg)
>iPad用prompt通过SSH连接树莓派.

我们安装了Samba，我们可以通过图形方式通过树莓派连接到USB设备，你可以看视频，在不同的设备之间复制和移动文件，文件浏览器是必须的[20] .

### 4. 将它们都放到一起

我们假设`SD32GB-03`是连接到树莓派的SD卡名字，`PDRIVE128GB`是那个优盘通过事先的配置文件挂载好，如果我们想要备份SD卡上的图片，我们需要这么做:

1. 让树莓派先正常运行，将设备挂载好.
2. 连接树莓派配置好的WIFI网络.
3. 用prompt这个app通过ssh连接树莓派[21].
4. 连接好后输入下面的命令:

```
python3 backup_photos.py SD32GB-03
```

首次备份需要一些时间基于SD卡的容量，你需要保持好设备之间的连接，在脚本运行之前你可以通过下面这个命令绕过.

```
nohup python3 backup_photos.py SD32GB-03 &
```

![](http://www.movingelectrons.net/images/bkup_photos_ipad&rpi_finished.png)
>运行完成的脚本如图所示.

### 未来的定制

我在树莓派上安装了vnc服务，这样我可以通过ipad连接树莓派的图形界面，我安装了bittorrent用来远端备份我的图片，当然需要先设置好，我会放出这些当我完成这些工作后[23[24]。

你可以在下面发表你的评论和问题，我会在此页下面回复。.


--------------------------------------------------------------------------------

via: http://www.movingelectrons.net/blog/2016/06/26/backup-photos-while-traveling-with-a-raspberry-pi.html

作者：[Editor][a]
译者：[jiajia9linuxer](https://github.com/jiajia9linuxer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.movingelectrons.net/blog/2016/06/26/backup-photos-while-traveling-with-a-raspberry-pi.html
[1]: http://bit.ly/1MVVtZi
[2]: http://www.amazon.com/dp/B01D3NZIMA/?tag=movinelect0e-20
[3]: http://www.amazon.com/dp/B01CD5VC92/?tag=movinelect0e-20
[4]: http://www.amazon.com/dp/B010Q57T02/?tag=movinelect0e-20
[5]: http://www.amazon.com/dp/B01F1PSFY6/?tag=movinelect0e-20
[6]: http://amzn.to/293kPqX
[7]: http://amzn.to/290syFY
[8]: http://amzn.to/290syFY
[9]: http://amzn.to/290syFY
[10]: http://amzn.to/290syFY
[11]: http://amzn.to/293kPqX
[12]: https://www.raspberrypi.org/downloads/noobs/
[13]: https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md
[14]: https://www.iterm2.com/
[15]: https://frillip.com/using-your-raspberry-pi-3-as-a-wifi-access-point-with-hostapd/
[16]: https://www.raspberrypi.org/documentation/linux/usage/rc-local.md
[17]: http://www.howtogeek.com/139433/how-to-turn-a-raspberry-pi-into-a-low-power-network-storage-device/
[18]: http://bit.ly/1MVVtZi
[19]: https://itunes.apple.com/us/app/prompt-2/id917437289?mt=8&uo=4&at=11lqkH
[20]: https://itunes.apple.com/us/app/filebrowser-access-files-on/id364738545?mt=8&uo=4&at=11lqkH
[21]: https://itunes.apple.com/us/app/prompt-2/id917437289?mt=8&uo=4&at=11lqkH
[22]: https://en.m.wikipedia.org/wiki/Nohup
[23]: https://itunes.apple.com/us/app/remoter-pro-vnc-ssh-rdp/id519768191?mt=8&uo=4&at=11lqkH
[24]: https://getsync.com/
