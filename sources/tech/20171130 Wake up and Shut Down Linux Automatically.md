
自动唤醒和关闭 Linux
=====================

### [banner.jpg][1]

![timekeeper](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner.jpg?itok=zItspoSb)

了解如何通过配置 Linux 计算机来查看时间，并实现自动唤醒和关闭 Linux
 
[Creative Commons Attribution][6][The Observatory at Delhi][7]

不要成为一个电能浪费者。如果你的电脑不需要开机就请把他们关机。出于方便和计算机宅的考虑，你可以通过配置你的 Linux 计算机实现自动唤醒和关闭 Linux 。

### 系统运行时间

有时候有些电脑需要一直处在开机状态，在不超过电脑运行时间的限制下这种情况是被允许的。有些人为他们的计算机可以长时间的正常运行而感到自豪，且现在我们有内核热补丁能够实现只有在硬件发生故障时才允许机器关机。我认为比较实际可行的是能够在机器需要节省电能以及在移动硬件发生磨损的情况下，且在不需要机器运行的情况下将其关机。比如，你可以在规定的时间内唤醒备份服务器，执行备份，然后关闭它直到下一次进行备份时间。或者，你可以只在特定时间内配置网卡。任何不需要一直运行的东西都可以将其配置成在其需要工作的时候打开，待其完成工作后将其关闭。

### 系统休眠

对于不需要一直运行的电脑，使用 root 的 cron 定时任务 或者 /etc/crontab 文件 可以可靠地关闭电脑。这个例子创建一个 root 定时任务实现每天下午 11点15分 定时关机。

```
# crontab -e -u root
# m h  dom mon dow   command
15 23 * * * /sbin/shutdown -h now
```

```
15 23 * * 1-5 /sbin/shutdown -h now
```

一个快速、容易的方式是，使用 /etc/crontab 文件。你必须指定用户：

```
15 23 * * 1-5 root shutdown -h now
```

实现自动唤醒是一件很酷的事情;我的大多数 SUSE （SUSE Linux）同事都在纽伦堡，因此，为了能够跟同事的计划有几小时的重叠时间我需要在凌晨5点起床。我的计算机早上 5点半自动开始工作，而我只需要将自己和咖啡拖到我的桌子上就可以开始工作了。按下电源按钮看起来好像并不是什么大事，但是在每天的那个时候每件小事都会变得很大。

唤醒 Linux 计算机可能不比关闭它可靠，因此你可能需要尝试不同的办法。你可以使用 远程唤醒（Wake-On-LAN）、RTC 唤醒或者个人电脑的 BIOS 设置预定的唤醒。做这些工作的原因是，当你关闭电脑时，这并不是真正关闭了计算机；此时计算机处在极低功耗状态且还可以接受和响应信号。你需要使用电源开关将其彻底关闭。

### BIOS 唤醒

BIOS 唤醒是最可靠的。我的系统主板 BIOS 有一个易于使用的唤醒调度程序。(Figure 1). Chances are yours does, too. Easy peasy.

### [fig-1.png][2]

![wakeup](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-1_11.png?itok=8qAeqo1I)

Figure 1: My system BIOS has an easy-to-use wakeup scheduler.

[Used with permission][8]


### 主机远程唤醒（Wake-On-LAN）

远程唤醒是仅次于 BIOS 唤醒的又一种可靠的唤醒方法。这需要你从第二台计算机发送信号到所要打开的计算机。可以使用 Arduino 或 树莓派（Raspberry Pi） 发送基于 Linux 的路由器或者任何Linux 计算机的唤醒信号。首先，查看系统主板 BIOS 是否支持 Wake-On-LAN –如果支持—然后启动它，因为它被默认为禁用。

然后，需要一个支持 Wake-On-LAN 的网卡；无线网卡并不支持。你需要运行 ethtool 命令查看网卡是否支持 Wake-On-LAN ： 

```
# ethtool eth0 | grep -i wake-on
        Supports Wake-on: pumbg
        Wake-on: g
```

*   d -- 禁用

*   p -- 物理活动唤醒

*   u -- 单播消息唤醒

*   m -- 多播（组播）消息唤醒

*   b -- 广播消息唤醒

*   a -- ARP(Address Resolution Protocol)唤醒

*   g -- magic packet 唤醒

*   s -- magic packet 设置安全密码

man ethtool 并不清楚开关 p 的作用；这表明任何信号都会导致唤醒。在我的测试中，然而，它并没有这么做。Wake-On-Lan 被启动的 Wake-on 参数是 g –- magic packet 唤醒，且当 Wake-On 值已经为 g 时表示网卡已支持 Wake-On-Lan 。如果它没有被启用，你可以通过 ethtool 命令来启用它。

```
# ethtool -s eth0 wol g
```

```
@reboot /usr/bin/ethtool -s eth0 wol g
```

### [fig-2.png][3]

![wakeonlan](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-2_7.png?itok=XQAwmHoQ)

Figure 2: Enable Wake on LAN.

[Used with permission][9]

另外一个选择是最近的网络管理器版本有一个很好的小复选框能够唤醒局域网（图2）。

这里有一个可以用于设置密码的地方，但是如果你的网络接口不支持 Secure On password，它就不起作用。

现在你需要配置第二台计算机来发送唤醒信号。你并不需要 root 权限，所以你可以为你的用户创建 cron 任务。你需要正在唤醒的机器上的网络接口和MAC地址。

```
30 08 * * * /usr/bin/wakeonlan D0:50:99:82:E7:2B 
```

通过使用实时闹钟来唤醒计算机是最不可靠的方法。查看 [Wake Up Linux With an RTC Alarm Clock][4] ；对于现在的大多数发行版来说这种方法已经有点过时了。下周继续了解更多关于使用RTC唤醒的方法。

通过 Linux 基金会和 edX 可以学习更多关于 Linux 的免费 [ Linux 入门][5]教程。

--------------------------------------------------------------------------------

via:https://www.linux.com/learn/intro-to-linux/2017/11/wake-and-shut-down-linux-automatically

作者：[Carla Schroder]
译者：[译者ID](https://github.com/HardworkFish)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.linux.com/files/images/bannerjpg
[2]:https://www.linux.com/files/images/fig-1png-11
[3]:https://www.linux.com/files/images/fig-2png-7
[4]:https://www.linux.com/learn/wake-linux-rtc-alarm-clock
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[6]:https://www.linux.com/licenses/category/creative-commons-attribution
[7]:http://www.columbia.edu/itc/mealac/pritchett/00routesdata/1700_1799/jaipur/delhijantarearly/delhijantarearly.html
[8]:https://www.linux.com/licenses/category/used-permission
[9]:https://www.linux.com/licenses/category/used-permission


