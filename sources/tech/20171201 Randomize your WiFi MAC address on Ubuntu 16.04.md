translating by wenwensnow

在Ubuntu 16.04下随机生成你的WiFi MAC地址
============================================================

你设备的MAC地址可以在不同的WiFi网络中记录你的活动。这些信息能被共享后出售，用于识别特定的个体。但可以用随机生成的伪MAC地址来阻止这一行为。


![A captive portal screen for a hotel allowing you to log in with social media for an hour of free WiFi](https://www.paulfurley.com/img/captive-portal-our-hotel.gif)

 _Image courtesy of [Cloudessa][4]_ 

每一个诸如WiFi或者以太网卡这样的网络设备，都有一个叫做MAC地址的唯一标识符，如：`b4:b6:76:31:8c:ff`。这就是你能上网的原因：每当你连接上WiFi，路由器就会用这一地址来向你接受和发送数据，并且用它来区别你和这一网络的其他设备。

这一设计的缺陷在于唯一性，不变的MAC地址正好可以用来追踪你。连上了星巴克的WiFi? 好，注意到了。在伦敦的地铁上? 也记录下来。

如果你曾经在某一个WiFi验证页面上输入过你的真实姓名，你就已经把自己和这一MAC地址建立了联系。没有仔细阅读许可服务条款? 你可以认为，机场的免费WiFi正通过出售所谓的 ‘顾客分析数据’(你的个人信息)获利。出售的对象包括酒店，餐饮业，和任何想要了解你的人。


我不想信息被记录，再出售给多家公司，所以我花了几个小时想出了一个解决方案。


### MAC 地址不一定总是不变的

幸运的是，在不断开网络的情况下，是可以随机生成一个伪MAC地址的。


我想随机生成我的MAC地址，但是有三个要求：


1.MAC地址在不同网络中是不相同的。这意味着，我在星巴克和在伦敦地铁网络中的MAC地址是不相同的，这样在不同的服务提供商中就无法将我的活动联系起来


2.MAC地址需要经常更换，这样在网络上就没人知道我就是去年在这儿经过了75次的那个人


3. MAC地址一天之内应该保持不变。当MAC地址更改时，大多数网络都会与你断开连接，然后必须得进入验证页面再次登陆 - 这很烦人。


### 操作网络管理器

我第一次尝试用一个叫做 `macchanger`的工具，但是失败了。网络管理器会根据它自己的设置恢复默认的MAC地址。 


我了解到，网络管理器1.4.1以上版本可以自动生成随机的MAC地址。如果你在使用Ubuntu 17.04 版本，你可以根据这一配置文件实现这一目的。但这并不能完全符合我的三个要求 （你必须在随机和稳定这两个选项之中选择一个，但没有一天之内保持不变这一选项）


因为我使用的是Ubuntu 16.04，网络管理器版本为1.2，不能直接使用高版本这一新功能。可能网络管理器有一些随机化方法支持，但我没能成功。所以我编了一个脚本来实现这一目标。


幸运的是，网络管理器1.2 允许生成随机MAC地址。你在已连接的网络中可以看见 ‘编辑连接’这一选项：


![Screenshot of NetworkManager's edit connection dialog, showing a text entry for a cloned mac address](https://www.paulfurley.com/img/network-manager-cloned-mac-address.png)

网络管理器也支持消息处理 - 任何位于 `/etc/NetworkManager/dispatcher.d/pre-up.d/` 的脚本在建立网络连接之前都会被执行。
NetworkManager also supports hooks - any script placed in `/etc/NetworkManager/dispatcher.d/pre-up.d/` is run before a connection is brought up.

### 分配随机生成的伪MAC地址

我想根据网络ID和日期来生成新的随机MAC地址。 我们可以使用网络管理器的命令行工具，nmcli,来显示所有可用网络：


```
> nmcli connection
NAME                 UUID                                  TYPE             DEVICE
Gladstone Guest      618545ca-d81a-11e7-a2a4-271245e11a45  802-11-wireless  wlp1s0
DoESDinky            6e47c080-d81a-11e7-9921-87bc56777256  802-11-wireless  --
PublicWiFi           79282c10-d81a-11e7-87cb-6341829c2a54  802-11-wireless  --
virgintrainswifi     7d0c57de-d81a-11e7-9bae-5be89b161d22  802-11-wireless  --

```

因为每个网络都有一个唯一标识符，为了实现我的计划，我将UUID和日期拼接在一起，然后使用MD5生成hash值:

```

# eg 618545ca-d81a-11e7-a2a4-271245e11a45-2017-12-03

> echo -n "${UUID}-$(date +%F)" | md5sum

53594de990e92f9b914a723208f22b3f  -

```
生成的结果可以代替MAC地址的最后八个字节。


值得注意的是，最开始的字节 `02` 代表这个地址是自行指定的。实际上，真实MAC地址的前三个字节是由制造商决定的，例如 `b4:b6:76` 就代表Intel。


有可能某些路由器会拒绝自己指定的MAC地址，但是我还没有遇到过这种情况。


每一次连接到一个网络，这一脚本都会用`nmcli` 来指定一个随机生成的伪MAC地址：
On every connection up, the script calls `nmcli` to set the spoofed MAC address for every connection:

![A terminal window show a number of nmcli command line calls](https://www.paulfurley.com/img/terminal-window-nmcli-commands.png)

最后，我查看了 `ifconfig`的输出结果，我发现端口MAC地址已经变成了随机生成的地址，而不是我真实的MAC地址。
As a final check, if I look at `ifconfig` I can see that the `HWaddr` is the spoofed one, not my real MAC address:

```
> ifconfig
wlp1s0    Link encap:Ethernet  HWaddr b4:b6:76:45:64:4d
          inet addr:192.168.0.86  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::648c:aff2:9a9d:764/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:12107812 errors:0 dropped:2 overruns:0 frame:0
          TX packets:18332141 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:11627977017 (11.6 GB)  TX bytes:20700627733 (20.7 GB)

```
完整的脚本可以在Github上查看。


```
#!/bin/sh

# /etc/NetworkManager/dispatcher.d/pre-up.d/randomize-mac-addresses

# Configure every saved WiFi connection in NetworkManager with a spoofed MAC
# address, seeded from the UUID of the connection and the date eg:
# 'c31bbcc4-d6ad-11e7-9a5a-e7e1491a7e20-2017-11-20'

# This makes your MAC impossible(?) to track across WiFi providers, and
# for one provider to track across days.

# For craptive portals that authenticate based on MAC, you might want to
# automate logging in :)

# Note that NetworkManager >= 1.4.1 (Ubuntu 17.04+) can do something similar
# automatically.

export PATH=$PATH:/usr/bin:/bin

LOG_FILE=/var/log/randomize-mac-addresses

echo "$(date): $*" > ${LOG_FILE}

WIFI_UUIDS=$(nmcli --fields type,uuid connection show |grep 802-11-wireless |cut '-d ' -f3)

for UUID in ${WIFI_UUIDS}
do
    UUID_DAILY_HASH=$(echo "${UUID}-$(date +F)" | md5sum)

    RANDOM_MAC="02:$(echo -n ${UUID_DAILY_HASH} | sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/\1:\2:\3:\4:\5/')"

    CMD="nmcli connection modify ${UUID} wifi.cloned-mac-address ${RANDOM_MAC}"

    echo "$CMD" >> ${LOG_FILE}
    $CMD &
done

wait
```
Enjoy!

 _Update: [Use locally administered MAC addresses][5] to avoid clashing with real Intel ones. Thanks [@_fink][6]_

--------------------------------------------------------------------------------

via: https://www.paulfurley.com/randomize-your-wifi-mac-address-on-ubuntu-1604-xenial/

作者：[Paul M Furley ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.paulfurley.com/
[1]:https://gist.github.com/paulfurley/46e0547ce5c5ea7eabeaef50dbacef3f/raw/5f02fc8f6ff7fca5bca6ee4913c63bf6de15abca/randomize-mac-addresses
[2]:https://gist.github.com/paulfurley/46e0547ce5c5ea7eabeaef50dbacef3f#file-randomize-mac-addresses
[3]:https://github.com/
[4]:http://cloudessa.com/products/cloudessa-aaa-and-captive-portal-cloud-service/
[5]:https://gist.github.com/paulfurley/46e0547ce5c5ea7eabeaef50dbacef3f/revisions#diff-824d510864d58c07df01102a8f53faef
[6]:https://twitter.com/fink_/status/937305600005943296
[7]:https://gist.github.com/paulfurley/978d4e2e0cceb41d67d017a668106c53/
[8]:https://en.wikipedia.org/wiki/MAC_address#Universal_vs._local
[9]:https://gist.github.com/paulfurley/46e0547ce5c5ea7eabeaef50dbacef3f
