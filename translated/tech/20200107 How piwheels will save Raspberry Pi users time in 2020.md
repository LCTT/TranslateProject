[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How piwheels will save Raspberry Pi users time in 2020)
[#]: via: (https://opensource.com/article/20/1/piwheels)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)


piwheels 是如何在2020年节省树莓派用户的时间的
======
通过为树莓派提供预编译的 Python 包，piwheels 项目为用户节省了大量的时间和精力。![rainbow colors on pinwheels in the sun][1]

piwheels 自动为[PiPi][2]上的所有项目构建 Python wheels( 预编译的 Python包 )，即 Python 包索引，使用树莓派硬件确保其兼容性。这意味着，当树莓派用户想要使用 **pip**，安装一个Python库时，他们会得到一个现成的编译版本，并保证可以在树莓派上良好的工作。这使得树莓派用户更容易进入和开始他们的项目。

![Piwheels logo][3]

当我在2018年10月写[piwheels:为树莓派提供快速 Python 包安装][4]时，piwheels 项目已经进入第一年，并且已经证明了其为树莓派用户节省大量时间和精力。但是这个项目已经进入第二年，它为树莓派提供了预编译的 Python 包走了更长的路。

![Raspberry Pi 4][5]

### 它是怎么工作的

[Raspbian][6]，树莓派的主要操作系统，预配置使用 piwheels，所以用户不需要做任何特殊的事情就可以使用piwheels。

配置文件(在 **/etc/pip.conf**)告诉 pip 使用[piwheels.org][7]作为 _附加索引_，因此 pip 首先查看PyPI，然后查看 piwheels。piwheels 网站位于树莓派 3的 hosts中，该项目建造的所有 wheels 都位于该派上。它每月提供100多万套服务——对于一台35美元的电脑来说还不错！

网站除了主要服务于树莓派以外，piwheels 项目还对使用其他七个派系统并构建软件包。有人运行 Raspbian Jessie，为 Python 3.4 建造 wheels，有人运行 Raspbian Stretch 为 Python 3.5，有人运行 Raspbian Buster 为 Python 3.7。该项目通常不支持其他 Python 版本。还有一个“合适的服务器”——运行 Postgres 数据库的虚拟机。由于 派3 只有1GB的内存，所以(非常大的)数据库不能在其上很好地运行，所以我们把它移到了虚拟机上。带 4GB 内存的 派4 可能是合适的，所以我们将来可能会用到它。

派都在“派云”中的 IPv6 网络上——这是一项由总部位于剑桥的托管公司[Mythic Beasts][8]提供的卓越的服务。
![Mythic Beasts hosting service][9]

### 下载和统计趋势

每次下载 piwheels 文件时，它都会记录在数据库中。这提供了对什么包最受欢迎以及人们使用什么 Python 版本和操作系统的统计。我们没有太多来自用户代理的信息，但是因为 派1/Zero 的架构显示为 “armv6”，派2/3/4显示为“armv7”，所以我们可以将它们区分开来。

截至2019年12月中旬，从派风车下载的软件包超过1，400万个，仅2019年就有近900万个。

自项目开始以来最受欢迎的10个软件包是:

  1. [pycparser][10] (821,060 downloads)
  2. [PyYAML][11] (366,979)
  3. [numpy][12] (354,531)
  4. [cffi][13] (336,982)
  5. [MarkupSafe][14] (318,878)
  6. [future][15] (282,349)
  7. [aiohttp][16] (277,046)
  8. [cryptography][17] (276,167)
  9. [home-assistant-frontend][18] (266,667)
  10. [multidict][19] (256,185)



请注意，许多纯 Python 包，如[urllib3][20]，都是作为 PyPI 上的 wheels 提供的；因为这些是跨平台兼容的，所以通常不会从 piwheels 下载，因为PyPI优先。

随着时间的推移，我们也看到了使用哪些 Python 版本的趋势。这里显示了 Raspbian Buster 发布时从3.5版快速升级到了Python 3.7:

![Data from piwheels on Python versions used over time][21]


你可以看到更多的统计趋势在[stats blog posts][22]。

### 节省时间


每个包构建都被记录在数据库中，并且每个下载也被存储。带有构建持续时间的交叉引用下载显示了节省了多少时间。一个例子是 numpy ——最新版本大约需要11分钟来构建。

迄今为止，piwheels 项目已经为用户节省了总计超过165年的构建时间。按照目前的使用率，piwheels 项目每天节省200多天。


除了节省构建时间，拥有预编译的 wheels 也意味着人们不必安装各种开发工具来构建包。一些包需要其他apt包来访问共享库。弄清楚你需要哪一个可能会很痛苦，所以我们也让这一步变得容易了。首先，我们找到了这个过程，[在博客上记录了这个过程][23]。然后，我们将这个逻辑添加到构建过程中，这样当构建一个 wheels 时，它的依赖关系会被自动计算并添加到包的项目页面中:

![numpy dependencies][24]

### 派风车的下一步是什么？

今年，我们推出了项目页面(例如，[numpy][25)，这是一种非常有用的方式，可以让人们以人类可读的方式查找项目信息。它们还使人们更容易报告问题，例如 piwheels 中缺少一个项目，或者他们下载的包有问题。

2020年初，我们计划对 piwheels 项目进行一些升级，以启用新的JSON应用编程接口，这样你就可以自动检查哪些版本可用，查找项目的依赖关系，等等。

下一次 Debian/Raspbian 升级要到2021年年中才会发生，所以在那之前我们不会开始为任何新的 Python 版本 制造 wheels。

你可以在这个项目的[博客][26]上读到更多关于 piwheels 的信息，我将在2020年初在那里发表一篇2019年的综述。你也可以在推特上关注[@piwheels][27]，在那里你可以看到每日和每月的统计数据以及任何达到的里程碑。

当然，piwheels 是一个开源项目，你可以在[GitHub][28]上看到整个项目源代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/piwheels

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rainbow-pinwheel-piwheel-diversity-inclusion.png?itok=di41Wd3V (rainbow colors on pinwheels in the sun)
[2]: https://pypi.org/
[3]: https://opensource.com/sites/default/files/uploads/piwheels.png (Piwheels logo)
[4]: https://opensource.com/article/18/10/piwheels-python-raspberrypi
[5]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4_0.jpg (Raspberry Pi 4)
[6]: https://www.raspberrypi.org/downloads/raspbian/
[7]: http://piwheels.org
[8]: https://www.mythic-beasts.com/order/rpi
[9]: https://opensource.com/sites/default/files/uploads/pi-cloud.png (Mythic Beasts hosting service)
[10]: https://www.piwheels.org/project/pycparser
[11]: https://www.piwheels.org/project/PyYAML
[12]: https://www.piwheels.org/project/numpy
[13]: https://www.piwheels.org/project/cffi
[14]: https://www.piwheels.org/project/MarkupSafe
[15]: https://www.piwheels.org/project/future
[16]: https://www.piwheels.org/project/aiohttp
[17]: https://www.piwheels.org/project/cryptography
[18]: https://www.piwheels.org/project/home-assistant-frontend
[19]: https://www.piwheels.org/project/multidict
[20]: https://piwheels.org/project/urllib3/
[21]: https://opensource.com/sites/default/files/uploads/pyvers2019.png (Data from piwheels on Python versions used over time)
[22]: https://blog.piwheels.org/piwheels-stats-for-2019/
[23]: https://blog.piwheels.org/how-to-work-out-the-missing-dependencies-for-a-python-package/
[24]: https://opensource.com/sites/default/files/uploads/numpy-deps.png (numpy dependencies)
[25]: https://www.piwheels.org/project/numpy/
[26]: https://blog.piwheels.org/
[27]: https://twitter.com/piwheels
[28]: https://github.com/piwheels/
