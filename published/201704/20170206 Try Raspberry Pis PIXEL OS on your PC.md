在 PC 上尝试树莓派的 PIXEL OS
============================================================

 ![Try Raspberry Pi's PIXEL OS on your PC](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/virtualbox_pixel_raspberrypi.jpg?itok=bEdS8qpi "Try Raspberry Pi's PIXEL OS on your PC") 

图片版权：树莓派基金会， CC BY-SA

在过去四年中，树莓派基金会非常努力地针对树莓派的硬件优化了 Debian 的移植版 Raspbian，包括创建新的教育软件、编程工具和更美观的桌面。

在（去年） 9 月份，我们发布了一个更新，介绍了树莓派新的桌面环境 PIXEL（Pi Improved Xwindows Environment，轻量级）。在圣诞节之前，我们[发布](https://linux.cn/article-8064-1.html)了一个在 x86 PC 上运行的操作系统版本，所以现在可以将它安装在 PC、Mac 或笔记本电脑上。

![Installing PIXEL](https://opensource.com/sites/default/files/pixel_0.jpg "Installing PIXEL") 

当然，像许多支持良好的 Linux 发行版一样，操作系统在旧的硬件上也能正常运行。 Raspbian 是让你几年前就丢弃的旧式 Windows 机器焕发新生的好方法。

[PIXEL ISO][13] 可从树莓派网站上下载，在 “[MagPi][14]” 杂志封面上也有赠送可启动的 Live DVD 。

 ![Welcome to PIXEL](https://opensource.com/sites/default/files/welcome-to-pixel.jpg "Welcome to PIXEL") 

为了消除想要学习计算机的人们的入门障碍，我们发布了树莓派的个人电脑操作系统。它比购买一块树莓派更便宜，因为它是免费的，你可以在现有的计算机上使用它。PIXEL 是我们一直想要的 Linux 桌面，我们希望它可供所有人使用。

### 由 Debian 提供支持

不构建在 Debian 之上的话，Raspbian 或 x86 PIXEL 发行版就都不会存在。 Debian 拥有庞大的可以从一个 apt 仓库中获得的免费开源软件、程序、游戏和其他工具。在树莓派中，你仅限运行为 [ARM][15] 芯片编译的软件包。然而，在 PC 镜像中，你可以在机器上运行的软件包的范围更广，因为 PC 中的 Intel 芯片有更多的支持。

 ![Debian Advanced Packaging Tool (APT) repository](https://opensource.com/sites/default/files/apt.png "Debian Advanced Packaging Tool (APT) repository") 

### PIXEL 包含什么

带有 PIXEL 的 Raspbian 和带有 PIXEL 的 Debian 都捆绑了大量的软件。Raspbian 自带：

*   Python、Java、Scratch、Sonic Pi、Mathematica*、Node-RED 和 Sense HAT 仿真器的编程环境
*   LibreOffice 办公套件
*   Chromium（包含 Flash）和 Epiphany 网络浏览器
*   Minecraft：树莓派版（包括 Python API）*
*   各种工具和实用程序

*由于许可证限制，本列表中唯一没有包含在 x86 版本中的程序是 Mathematica 和 Minecraft。

 ![PIXEL menu](https://opensource.com/sites/default/files/pixel-menu.png "PIXEL menu") 

### 创建一个 PIXEL Live 盘

你可以下载 PIXEL ISO 并将其写入空白 DVD 或 USB 记忆棒中。 然后，你就可以从盘中启动你的电脑，这样你可以立刻看到 PIXEL 桌面。你可以浏览网页、打开编程环境或使用办公套件，而无需在计算机上安装任何内容。完成后，只需拿出 DVD 或 USB 驱动器，关闭计算机，再次重新启动计算机时，将会像以前一样重新启动到你平常的操作系统。

### 在虚拟机中运行 PIXEL

另外一种尝试 PIXEL 的方法是在像 VirtualBox 这样的虚拟机中安装它。

 ![PIXEL Virtualbox](https://opensource.com/sites/default/files/pixel-virtualbox.png "PIXEL Virtualbox") 

这允许你体验镜像而不用安装它，也可以在主操作系统里面的窗口中运行它，并访问 PIXEL 中的软件和工具。这也意味着你的会话会一直存在，而不是每次重新启动时从头开始，就像使用 Live 盘一样。

### 在 PC 中安装 PIXEL

如果你真的准备开始，你可以擦除旧的操作系统并将 PIXEL 安装在硬盘上。如果你想使用旧的闲置的笔记本电脑，这可能是个好主意。

### 用于教育的 PIXEL

许多学校在所有电脑上使用 Windows，并且对它们可以安装的软件进行严格的控制。这使得教师难以使用必要的软件工具和 IDE（集成开发环境）来教授编程技能。即使在线编程计划（如 Scratch 2）也可能被过于谨慎的网络过滤器阻止。在某些情况下，安装像 Python 这样的东西根本是不可能的。树莓派硬件通过提供包含教育软件的 SD 卡引导的小型廉价计算机来解决这个问题，学生可以连接到现有 PC 的显示器、鼠标和键盘上。

然而，PIXEL Live 光盘允许教师引导到装有能立即使用的编程语言和工具的系统中，所有这些都不需要安装权限。在课程结束时，他们可以安全关闭，使计算机恢复原状。这也是 Code Clubs、CoderDojos、青年俱乐部、Raspberry Jams 等等的一个方便的解决方案。

### 远程 GPIO

树莓派与传统台式 PC 区别的功能之一是 GPIO 引脚（通用输入/输出）引脚的存在，它允许你将现实世界中的电子元件和附加板连接设备上，这将开放一个新的世界，如业余项目、家庭自动化、连接的设备和物联网。

[GPIO Zero][16] Python 库的一个很棒的功能是通过在 PC 上写入一些简单的代码，然后在网络上控制树莓派的 GPIO 引脚。

远程 GPIO 可以从一台树莓派连接到另一台树莓派，或者从运行任何系统的 OS 的 PC 连接到树莓派上，但是，使用 PIXEL x86 的话所有需要的软件都是开箱即用的。参见 Josh 的[博文][17]，并参考我的 [gist][18] 了解更多信息。

### 更多指南

[MagPi 的第 53 期][19]提供了一些试用和安装 PIXEL 的指南，包括使用带持久驱动的 Live 光盘来维护你的文件和应用程序。你可以购买一份，或免费下载 PDF 来了解更多。

--------------------------------------------------------------------------------

作者简介：

Ben Nuttall - Ben Nuttall 是一名树莓派社区管理员。他除了为树莓派基金会工作外，他还对自由软件、数学、皮划艇、GitHub、Adventure Time 和 Futurama 等感兴趣。在 Twitter @ben_nuttall 上关注 Ben。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/try-raspberry-pis-pixel-os-your-pc

作者：[Ben Nuttall][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bennuttall
[1]:https://twitter.com/ben_nuttall
[2]:https://twitter.com/intent/tweet?in_reply_to=811511740907261952
[3]:https://twitter.com/intent/retweet?tweet_id=811511740907261952
[4]:https://twitter.com/intent/like?tweet_id=811511740907261952
[5]:https://twitter.com/ben_nuttall
[6]:https://twitter.com/ben_nuttall/status/811511740907261952
[7]:https://twitter.com/search?q=place%3A3bc1b6cfd27ef7f6
[8]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[9]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[10]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[11]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[12]:https://opensource.com/article/17/1/try-raspberry-pis-pixel-os-your-pc?rate=iqVrGV3EhwRuqh68sf6Zye6Y7VSpXRCUQoZV3sg-QJM
[13]:http://downloads.raspberrypi.org/pixel_x86/images/pixel_x86-2016-12-13/
[14]:https://www.raspberrypi.org/magpi/issues/53/
[15]:https://en.wikipedia.org/wiki/ARM_Holdings
[16]:http://gpiozero.readthedocs.io/
[17]:http://www.allaboutcode.co.uk/single-post/2016/12/21/GPIOZero-Remote-GPIO-with-PIXEL-x86
[18]:https://gist.github.com/bennuttall/572789b0aa5fc2e7c05c7ada1bdc813e
[19]:https://www.raspberrypi.org/magpi/issues/53/
[20]:https://opensource.com/user/26767/feed
[21]:https://opensource.com/article/17/1/try-raspberry-pis-pixel-os-your-pc#comments
[22]:https://opensource.com/users/bennuttall
