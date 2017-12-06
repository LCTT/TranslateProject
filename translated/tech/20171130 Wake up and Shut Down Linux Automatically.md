如何自动唤醒和关闭 Linux
=====================

![timekeeper](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner.jpg?itok=zItspoSb)

> 了解如何通过配置 Linux 计算机来根据时间自动唤醒和关闭。
 

不要成为一个电能浪费者。如果你的电脑不需要开机就请把它们关机。出于方便和计算机宅的考虑，你可以通过配置你的 Linux 计算机实现自动唤醒和关闭。

### 宝贵的系统运行时间

有时候有些电脑需要一直处在开机状态，在不超过电脑运行时间的限制下这种情况是被允许的。有些人为他们的计算机可以长时间的正常运行而感到自豪，且现在我们有内核热补丁能够实现只有在硬件发生故障时才需要机器关机。我认为比较实际可行的是，像减少移动部件磨损一样节省电能，且在不需要机器运行的情况下将其关机。比如，你可以在规定的时间内唤醒备份服务器，执行备份，然后关闭它直到它要进行下一次备份。或者，你可以设置你的互联网网关只在特定的时间运行。任何不需要一直运行的东西都可以将其配置成在其需要工作的时候打开，待其完成工作后将其关闭。

### 系统休眠

对于不需要一直运行的电脑，使用 root 的 cron 定时任务（即 `/etc/crontab`）可以可靠地关闭电脑。这个例子创建一个 root 定时任务实现每天晚上 11 点 15 分定时关机。

```
# crontab -e -u root
# m h  dom mon dow   command
15 23 * * * /sbin/shutdown -h now
```

以下示例仅在周一至周五运行：

```
15 23 * * 1-5 /sbin/shutdown -h now
```

您可以为不同的日期和时间创建多个 cron 作业。 通过命令 `man 5 crontab` 可以了解所有时间和日期的字段。

一个快速、容易的方式是，使用 `/etc/crontab` 文件。但这样你必须指定用户：

```
15 23 * * 1-5 root shutdown -h now
```

### 自动唤醒

实现自动唤醒是一件很酷的事情；我大多数 SUSE （SUSE Linux）的同事都在纽伦堡，因此，因此为了跟同事能有几小时一起工作的时间，我不得不需要在凌晨五点起床。我的计算机早上 5 点半自动开始工作，而我只需要将自己和咖啡拖到我的桌子上就可以开始工作了。按下电源按钮看起来好像并不是什么大事，但是在每天的那个时候每件小事都会变得很大。

唤醒 Linux 计算机可能不如关闭它可靠，因此你可能需要尝试不同的办法。你可以使用远程唤醒（Wake-On-LAN）、RTC 唤醒或者个人电脑的 BIOS 设置预定的唤醒这些方式。这些方式可行的原因是，当你关闭电脑时，这并不是真正关闭了计算机；此时计算机处在极低功耗状态且还可以接受和响应信号。只有在你拔掉电源开关时其才彻底关闭。

### BIOS 唤醒

BIOS 唤醒是最可靠的。我的系统主板 BIOS 有一个易于使用的唤醒调度程序 (图 1)。对你来说也是一样的容易。

![wakeup](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-1_11.png?itok=8qAeqo1I)

*图 1：我的系统 BIOS 有个易用的唤醒定时器。*

### 主机远程唤醒（Wake-On-LAN）

远程唤醒是仅次于 BIOS 唤醒的又一种可靠的唤醒方法。这需要你从第二台计算机发送信号到所要打开的计算机。可以使用 Arduino 或<ruby>树莓派<rt>Raspberry Pi</rt></ruby>发送给基于 Linux 的路由器或者任何 Linux 计算机的唤醒信号。首先，查看系统主板 BIOS 是否支持 Wake-On-LAN ，要是支持的话，必须先启动它，因为它被默认为禁用。

然后，需要一个支持 Wake-On-LAN 的网卡；无线网卡并不支持。你需要运行 `ethtool` 命令查看网卡是否支持 Wake-On-LAN ： 

```
# ethtool eth0 | grep -i wake-on
        Supports Wake-on: pumbg
        Wake-on: g
```

这条命令输出的 “Supports Wake-on” 字段会告诉你你的网卡现在开启了哪些功能：
　　　
*   d -- 禁用
*   p -- 物理活动唤醒
*   u -- 单播消息唤醒
*   m -- 多播（组播）消息唤醒
*   b -- 广播消息唤醒
*   a -- ARP 唤醒
*   g -- <ruby>特定数据包<rt>magic packet</rt></ruby>唤醒
*   s -- 设有密码的<ruby>特定数据包<rt>magic packet</rt></ruby>唤醒 

`ethtool` 命令的 man 手册并没说清楚 `p` 选项的作用；这表明任何信号都会导致唤醒。然而，在我的测试中它并没有这么做。想要实现远程唤醒主机，必须支持的功能是 `g` —— <ruby>特定数据包<rt>magic packet</rt></ruby>唤醒，而且下面的“Wake-on” 行显示这个功能已经在启用了。如果它没有被启用，你可以通过 `ethtool` 命令来启用它。

```
# ethtool -s eth0 wol g
```

这条命令可能会在重启后失效，所以为了确保万无一失，你可以创建个 root 用户的定时任务（cron）在每次重启的时候来执行这条命令。

```
@reboot /usr/bin/ethtool -s eth0 wol g
```

另一个选择是最近的<ruby>网络管理器<rt>Network Manager</rt></ruby>版本有一个很好的小复选框来启用 Wake-On-LAN（图 2）。

![wakeonlan](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-2_7.png?itok=XQAwmHoQ)

*图 2：启用 Wake on LAN*

这里有一个可以用于设置密码的地方，但是如果你的网络接口不支持<ruby>安全开机<rt>Secure On</rt></ruby>密码，它就不起作用。

现在你需要配置第二台计算机来发送唤醒信号。你并不需要 root 权限，所以你可以为你的普通用户创建 cron 任务。你需要用到的是想要唤醒的机器的网络接口和MAC地址信息。

```
30 08 * * * /usr/bin/wakeonlan D0:50:99:82:E7:2B 
```

### RTC 唤醒

通过使用实时闹钟来唤醒计算机是最不可靠的方法。对于这个方法，可以参看 [Wake Up Linux With an RTC Alarm Clock][4] ；对于现在的大多数发行版来说这种方法已经有点过时了。

下周继续了解更多关于使用 RTC 唤醒的方法。

通过 Linux 基金会和 edX 可以学习更多关于 Linux 的免费 [Linux 入门][5]教程。

（题图：[The Observatory at Delhi][7]）

--------------------------------------------------------------------------------

via:https://www.linux.com/learn/intro-to-linux/2017/11/wake-and-shut-down-linux-automatically

作者：[Carla Schroder][a]
译者：[HardworkFish](https://github.com/HardworkFish)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/files/images/bannerjpg
[2]:https://www.linux.com/files/images/fig-1png-11
[3]:https://www.linux.com/files/images/fig-2png-7
[4]:https://www.linux.com/learn/wake-linux-rtc-alarm-clock
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[6]:https://www.linux.com/licenses/category/creative-commons-attribution
[7]:http://www.columbia.edu/itc/mealac/pritchett/00routesdata/1700_1799/jaipur/delhijantarearly/delhijantarearly.html
[8]:https://www.linux.com/licenses/category/used-permission
[9]:https://www.linux.com/licenses/category/used-permission

