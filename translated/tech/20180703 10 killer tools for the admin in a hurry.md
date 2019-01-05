10 个供管理员快速使用的杀手工具
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT)

当工作负载累计时，管理网络和系统变得富有压力。没有人能真正意识到需要花费多长时间，每个人都希望在昨天能够完成他们的具体事务。

所以难怪我们这么多人都被致力于找出有效的方法并与大家分享的开源精神所吸引。因为，当截止日期来临，并且当天没有足够多的时间时，如果你可以找到立刻施行的免费答案，那会非常有帮助。

So, without further ado, here's my Swiss Army Knife of stuff to get you out of the office before dinner time.

因此，闲话少叙，下述是我的瑞士军刀，可以保证你在晚饭前离开办公室。

### 服务器配置和脚本

让我们看一看！

**[NixCraft][1]**
用于网站内部的搜索功能。经过十多年的定期更新，这里有黄金！有用的脚本和方便的提示可以立刻解决你的问题。这是我一般使用 Google 后的第二个选项。

**[Webmin][2]**
它提供给你了一个很好的 Web 界面来帮助你远程编辑配置问卷。它减少了大量花费在处理目录路径和 `sudo nano` 上的时间，在你处理多个客户时，非常方便。

**[Windows 下的 Linux 子系统][3]**

现代工作场所的现实是大多数员工都运行着 Windows，而服务器机房中增长的设备则运行着 Linux 。因此，有些时候你会发现尝试在 Windows 桌面上执行管理任务。

你怎么做？装一个虚拟机？如果安装目前 Windows 10 中免费提供的 Linux 子系统的兼容层，实际上要快得多，配置文件要少的多。

这为你提供了一个 Bash 终端窗口，你可以在这个窗口中执行本地计算机上的 Bash 脚本和 Linux 二进制问卷，可以完全访问 Windows 和 Linux 问卷系统，以及安装网络驱动器。它包含 Ubuntu 、OpenSUSE、SLES、Debian和 Kali 发行版。

**[mRemoteNG][4]**
当你有 100 + 服务器需要去管理时，这会是一个出色的 SSH 和远程桌面客户端。

### 设置网络，这样你就无需再这样做了。

一个考虑不周的网络是厌恶加班管理员的死敌。

**[可拓展的 IP 寻址方案][5]**

IP 地址耗尽的可怕之处在于，当 IP 地址耗尽时，网络已经变的足够大，而新的寻址方案是众所周知的昂贵、令人痛苦的耗时。

没有人有时间做这件事！

到了某个时候，IPv6 终将到来，来拯救这世界。在那之前，无论世界向我们扔了多少可穿戴设备、平板电脑、智能锁、灯、安全摄像头、VoIP耳机和浓缩咖啡机，这些一刀切的IP 寻址方案都应该让我们继续前行。


**[Linux Chmod 权限备忘录][6]**

一个简短但是有用的 Bash 命令备忘录可以帮助你通过网络设置权限。所以，客户服务部的账单落入到勒索软件骗局时，你可以只恢复他们的文件，而不是整个公司的文件。

**[VLSM 子网计算器][7]**

只需要输入你想要从地址空间中创建的网络的数量，以及每个网络所需要的主机数量，它就可以计算出所有的子网掩码应该是什么。

### 单一用途的 Linux 发行版

需要一个只一件事的 Linux 容器？如果其他人已经在操作系统上花了很多钱，它可以帮助你快速安装并准备好一个操作系统。

下面这些每一个都使得我的工作变得轻松了许多。

**[Porteus Kiosk][8]**
这个工具用来帮你在一台锁定的电脑上打开一个浏览器。通过稍稍一些调整，你甚至可以把浏览器锁定在一个特定的网站上。它对于公共访问机器来说非常方便。它可以与触摸屏或键盘鼠标配合使用。

**[Parted Magic][9]**
这是一个你可以从 USB 驱动器启动的可以用来划分磁盘驱动器、恢复数据并运行基准测试工具的操作系统。

**[IPFire][10]**

啊哈～我还是不敢相信有人吧路由器/防火墙/代理组合成为“我尿火”（译者注：IPFire 和 “I pee Fire“ 同音)。这是我在这个 Linux 发行版中第二喜欢的东西。我最喜欢的是它是一个非常可靠的软件套件，设置和配置十分容易，而且有一系列的插件可以拓展它。

那么，你呢？你发现了哪些工具、资源和备忘录可以让我们的工作日更加的轻松？

我很高兴知道，请在评论中分享您的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/tools-admin

作者：[Grant Hamono][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[bestony](https://github.com/bestony)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/grantdxm
[1]:https://www.cyberciti.biz/
[2]:http://www.webmin.com/
[3]:http://wsl-guide.org/en/latest/
[4]:https://mremoteng.org/
[5]:https://blog.dxmtechsupport.com.au/ip-addressing-for-a-small-business-that-might-grow/
[6]:https://isabelcastillo.com/linux-chmod-permissions-cheat-sheet
[7]:http://www.vlsm-calc.net/
[8]:http://porteus-kiosk.org/
[9]:https://partedmagic.com/
[10]:https://www.ipfire.org/
