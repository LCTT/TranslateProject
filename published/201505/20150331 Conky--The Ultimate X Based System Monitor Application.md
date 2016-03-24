Conky - 终极的 X 视窗系统监视器应用
================================================================================
Conky 是一个用 ‘C’ 语言写就的系统监视器，并在 GNU GPL 和 BSD 许可协议下发布，在 Linux 和 BSD 操作系统中都可以获取到它。这个应用是基于 X 视窗系统的，原本由 [Torsmo][1] 分支而来。 

#### 特点 ####

- 简洁的用户界面;
- 高度可配置;
- 它既可使用内置的部件(超过 300 多个) 也可使用外部脚本，来在桌面或其自有容器中展示系统的状态；
- 低资源消耗;
- 它可显示范围广泛的系统参数，包括但不限于 CPU，内存，swap 分区 ，温度，进程，磁盘使用情况，网络状态，电池电量，邮件收发，系统消息，音乐播放器的控制，天气信息，最新新闻，升级信息等等；
- 在许多操作系统中如 CrunchBang Linux 和 Pinguy OS 被默认安装；

#### 关于 Conky 的少有人知的事实 ####

- conky 这个名称来自于一个加拿大电视节目；
- 它已被移植到 Nokia N900 上；
- 官方已经不再维护它了；

### 在 Linux 中 Conky 的安装和使用 ###

在我们安装 conky 之前，我们需要使用下面的命令来安装诸如 `lm-sensors`, `curl` 和 `hddtemp` 之类的软件包：

    # apt-get install lm-sensors curl hddtemp

然后是检测传感器：

    # sensors-detect

**注**: 在被系统提示时，回答 ‘Yes’ 。

检测所有探测到的传感器：

    # sensors

#### 样例输出 ####

    acpitz-virtual-0
    Adapter: Virtual device
    temp1:        +49.5°C  (crit = +99.0°C)
    
    coretemp-isa-0000
    Adapter: ISA adapter
    Physical id 0:  +49.0°C  (high = +100.0°C, crit = +100.0°C)
    Core 0:         +49.0°C  (high = +100.0°C, crit = +100.0°C)
    Core 1:         +49.0°C  (high = +100.0°C, crit = +100.0°C)

Conky 既可以从软件仓库中安装，也可从源代码编译得到：

    # yum install conky              [在 RedHat 系的系统上]
    # apt-get install conky-all      [在 Debian 系的系统上]

**注**: 在 Fedora/CentOS 上安装 conky 之前，你必须启用 [EPEL 软件仓库][2]。

在安装完 conky 之后，只需输入如下命令来开启它：

    $ conky &

![正在运行的 Conky 监视器](http://www.tecmint.com/wp-content/uploads/2015/03/Start-Conkey.jpeg)

*正在运行的 Conky 监视器*

这使得 conky 以一个弹窗的形式运行，并使用位于 `/etc/conky/conky.conf` 的 conky 基本配置文件。

你可能想将 conky 集成到桌面上，并不想让它每次以弹窗的形式出现，下面就是你需要做的：

将配置文件 `/etc/conky/conky.conf` 复制到你的家目录中，并将它重命名为 `.conkyrc`，开头的点号 (.) 是为了确保这个配置文件是隐藏的。
 
    $ cp /etc/conky/conky.conf /home/$USER/.conkyrc

现在重启 conky 来应用新的更改：

    $ killall -SIGUSR1 conky

![Conky 监视器窗口](http://www.tecmint.com/wp-content/uploads/2015/03/Restart-Conky.jpeg)

*Conky 监视器窗口*

你可能想编辑位于你的家目录的 conky 的配置文件，这个配置文件的内容是非常容易理解的。

下面是 conky 配置文件的一个样例：

![Conky 的配置](http://www.tecmint.com/wp-content/uploads/2015/03/Conky-Configuration.jpeg)

*Conky 的配置*

从上面的窗口中，你可以更改颜色，边框，大小，缩放比例，背景，对齐方式及几个其他属性。通过为不同的 conky 窗口设定不同的对齐方式，我们可以同时运行几个 conky 脚本。
 
**让 conky 使用其它脚本而不是默认配置，以及如何找到这些脚本？**

你可以编写你自己的 conky 脚本或使用来自于互联网的脚本；我们并不建议你使用从互联网中找到的具有潜在危险的任何脚本，除非你清楚你正在做什么。然而，有一些著名的主题和网页包含可信赖的 conky 脚本，例如下面所提及的：

- [http://ubuntuforums.org/showthread.php?t=281865][3]
- [http://conky.sourceforge.net/screenshots.html][4]

在上面的 URL 地址中，你将发现其中每个截图都有一个超链接，它们将指向到脚本文件。

#### 测试 Conky 脚本 ####

这里我将在我的 Debian Jessie 系统中运行一个由第三方写的 conky 脚本，以此来进行测试：

    $ wget https://github.com/alexbel/conky/archive/master.zip
    $ unzip master.zip 

切换当前工作目录到刚才解压的目录：

    $ cd conky-master

将 `secrets.yml.example` 重命名为 `secrets.yml`：

    $ mv secrets.yml.example secrets.yml

在你需要运行这个(ruby)脚本之前安装 Ruby：

    $ sudo apt-get install ruby
    $ ruby starter.rb 

![华丽的 conky 外观](http://www.tecmint.com/wp-content/uploads/2015/03/Conky-Fancy-Look.jpeg)

*华丽的 conky 外观*

**注**: 可以修改这个脚本以展示你当前的天气，温度等；

假如你想让 conky 开机自启，请在开机启动应用设置(startup Applications) 中添加如下的几行命令：

    conky --pause 10 
    save and exit.

最后，如此轻量级且吸引眼球的实用 GUI 软件包不再处于活跃状态且官方不再进行维护了。最新的稳定发布版本为 conky 1.9.0， 于 2012 年 5 月 3 号发布。在 Ubuntu 论坛上，一个有关用户分享 conky 配置的主题已经超过了 2000 多页。(这个论坛主题的链接为: [http://ubuntuforums.org/showthread.php?t=281865/][5])

- [Conky 主页][6]

这就是全部内容了。保持联系，保持评论。请在下面的评论框里分享你的想法和配置。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-conky-in-ubuntu-debian-fedora/

作者：[Avishek Kumar][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://torsmo.sourceforge.net/
[2]:https://linux.cn/article-2324-1.html
[3]:http://ubuntuforums.org/showthread.php?t=281865
[4]:http://conky.sourceforge.net/screenshots.html
[5]:http://ubuntuforums.org/showthread.php?t=281865/
[6]:http://conky.sourceforge.net/
