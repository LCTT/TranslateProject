一月 COPR 中 4 个新的很酷的项目
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR 是一个个人软件仓库[集合][1]，它们不存在于 Fedora 中。有些软件不符合标准而不容易打包。或者它可能不符合其他的 Fedora 标准，尽管它是免费和开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 支持或者由项目自己签名。但是，它是尝试新的或实验性软件的一种很好的方法。

这是 COPR 中一系列新的和有趣的项目。

### Elisa

[Elisa][2] 是一个最小的音乐播放器。它可以让你通过专辑、艺术家或曲目浏览音乐。它会自动检测你的 ~/Music 目录中的所有可播放音乐，因此它根本不需要设置 - 它也不提供任何音乐。目前，Elisa 专注于做一个简单的音乐播放器，所以它不提供管理音乐收藏的工具。

![][3]

#### 安装说明

仓库目前为 Fedora 26、27 和 Rawhide 提供 Elisa。要安装 Elisa，请使用以下命令：
```
sudo dnf copr enable eclipseo/elisa
sudo dnf install elisa
```

### 必应壁纸

[必应壁纸][4]是一个简单的程序，它会下载当日的必应壁纸，并将其设置为桌面壁纸或锁屏图片。该程序可以在设定的时间间隔内轮转目录中的图片，并在一段时间后删除旧图片。

#### 安装说明

仓库目前为 Fedora 25、26、27 和 Rawhide 提供必应壁纸。要安装必应壁纸，请使用以下命令：
```
sudo dnf copr enable julekgwa/Bingwallpapers
sudo dnf install bingwallpapers
```

### Polybar

[Polybar][5] 是一个创建状态栏的工具。它有很多自定义选项以及内置的功能来显示常用服务的信息，例如 [bspwm][6]、[i3][7] 的系统托盘图标、窗口标题、工作区和桌面面板等。你也可以为你的状态栏配置你自己的模块。有关使用和配置的更多信息，请参考[ Polybar 的 wiki][8]。

#### 安装说明

仓库目前为 Fedora 27 提供 Polybar。要安装 Polybar，请使用以下命令：
```
sudo dnf copr enable tomwishaupt/polybar
sudo dnf install polybar
```

### Netdata

[Netdata][9] 是一个分布式监控系统。它可以运行在包括个人电脑、服务器、容器和物联网设备在内的所有系统上，从中实时收集指标。所有的信息都可以使用 netdata 的 web 面板访问。此外，Netdata 还提供预配置的警报和通知来检测性能问题，以及用于创建自己的警报的模板。

![][10]

#### 安装说明

仓库目前提供 EPEL 7、Fedora 27 和 Rawhide 提供 netdata。要安装 netdata，请使用以下命令：
```
sudo dnf copr enable recteurlp/netdata
sudo dnf install netdata
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-january/

作者：[Dominik Turecek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://copr.fedorainfracloud.org/
[2]:https://community.kde.org/Elisa
[3]:https://fedoramagazine.org/wp-content/uploads/2018/01/elisa.png
[4]:http://bingwallpapers.lekgoara.com/
[5]:https://github.com/jaagr/polybar
[6]:https://github.com/baskerville/bspwm
[7]:https://i3wm.org/
[8]:https://github.com/jaagr/polybar/wiki
[9]:http://my-netdata.io/
[10]:https://fedoramagazine.org/wp-content/uploads/2018/01/netdata.png
