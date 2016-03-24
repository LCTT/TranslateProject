极速蜗牛：apt-fast 
================

如果你在Debian或Ubuntu系统上经常感觉到**apt-get** 或 **aptitude**包安装速度过慢，那么这里就有几种改善这一情况的方法。你有没有考虑过改变正被使用的默认镜像站点？你有没有排除因特网连接的上游带宽成为瓶颈的可能？

如果不是这些原因，你可以尝试第三个选择：使用[apt-fast][1]工具。apt-fast实际上是一个围绕apt-get和aptitude所写的shell脚本容器，它能加速包的下载速度。apt-fast本质上采用[aria2][2]下载工具，这款工具能够以“块”的方式从多个镜像并行下载一个文件（就像BitTorrent下载）。

### 在Debian或Ubuntu上安装apt-fast

下面是在基于Debian的Linux上安装apt-fast的步骤

### Debian ###

    $ sudo apt-get install aria2
    $ wget https://github.com/ilikenwf/apt-fast/archive/master.zip
    $ unzip master.zip
    $ cd apt-fast-master
    $ sudo cp apt-fast /usr/bin
    $ sudo cp apt-fast.conf /etc
    $ sudo cp ./man/apt-fast.8 /usr/share/man/man8
    $ sudo gzip /usr/share/man/man8/apt-fast.8
    $ sudo cp ./man/apt-fast.conf.5 /usr/share/man/man5
    $ sudo gzip /usr/share/man/man5/apt-fast.conf.5

### Ubuntu 14.04 以及更高版本 ###

    $ sudo add-apt-repository ppa:saiarcot895/myppa
    $ sudo apt-get update
    $ sudo apt-get install apt-fast

### Ubuntu 11.04 到 Ubuntu 13.10 ###

    $ sudo add-apt-repository ppa:apt-fast/stable
    $ sudo apt-get update
    $ sudo apt-get install apt-fast

在安装期间，你需要选择一个默认的软件包管理器 (e.g., apt-get. aptitude )，还需要设置其余选项。但是你可以随时通过编辑配置文件 /etc/apt-fast/conf 来更改设置。

![](https://farm6.staticflickr.com/5615/15285526898_1b18f64d58_z.jpg)

![](https://farm3.staticflickr.com/2949/15449069896_76ee00851b_z.jpg)

![](https://farm6.staticflickr.com/5600/15471817412_9ef7f16096_z.jpg)

### 配置 apt-get ###

安装完成后，你需要在/etc/apt-fast.conf里配置**apt-fast**使用的一系列镜像。

你可以在下面的URL中找到一系列Debian/Ubuntu镜像。

- **Debian**: [http://www.debian.org/mirror/list][3]
- **Ubuntu**: [https://launchpad.net/ubuntu/+archivemirrors][4]

选择完那些地理上靠近你的镜像后，你需按照下面的格式将选择的镜像加入到/etc/apt-fast.conf。

    $ sudo vi /etc/apt-fast.conf

Debian：

    MIRRORS=('http://ftp.us.debian.org/debian/,http://carroll.aset.psu.edu/pub/linux/distributions/debian/,http://debian.gtisc.gatech.edu/debian/,http://debian.lcs.mit.edu/debian/,http://mirror.cc.columbia.edu/debian/')

Ubuntu/Mint：

    MIRRORS=('http://us.archive.ubuntu.com/ubuntu,http://mirror.cc.columbia.edu/pub/linux/ubuntu/archive/,http://mirror.cc.vt.edu/pub2/ubuntu/,http://mirror.umd.edu/ubuntu/,http://mirrors.mit.edu/ubuntu/')

如上面所示，对于一个特定档案的个别镜像，需要用逗号分割开来。你需要在/etc/apt/sources.list的MIRRORS字符串中包含默认的镜像指定站点。

### 使用apt-fast安装一个包 ###

现在你就可以测试apt-fast的强大了。下面是使用**apt-fast**的示例：

    apt-fast [apt-get options and arguments]
    apt-fast [aptitude options and arguments]
    apt-fast { { install | upgrade | dist-upgrade | build-dep | download  | source  } [ -y | --yes | --assume-yes | --assume-no ]   ... | clean }

使用**apt-fast**安装包：

     $ sudo apt-fast install texlive-full

在当前目录下载软件包，但不安装：

     $ sudo apt-fast download texlive-full

![](http://farm8.staticflickr.com/7309/10585846956_6c98c6dcc9_z.jpg)

如前面所示，apt-fast的并行下载是通过aria2完成的。你可以看到如下图般从多个镜像并行下载。

    $ sudo netstat -nap | grep aria2c

![](http://farm8.staticflickr.com/7328/10585846886_4744a0e021_z.jpg)

请注意，**apt-fast**并没有加速"apt-get update"。并行下载只在"install", "upgrade", "dist-upgrage"和"build-dep"操作中触发。其余的操作，apt-fast就会简单地回到默认的包管理器apt-get或aptitude。

### apt-fast有多快？ ###

为了比较apt-fast和apt-get，我尝试在两个相同的Ubuntu实例上使用两种方法安装几个软件包。下面的图表展示了所有软件包安装的时间(单位为秒)。

![](http://farm4.staticflickr.com/3810/10585846986_504d07b4a7_z.jpg)

正如你所见到的，**apt-fast**确实比**apt-get**快(e.g. 快3--4秒)，特别是安装庞大软件包的时候。

当然，安装性能的提高程度还依赖你上游因特网连通性。以我为例，我有富足的带宽来支持我的上游连接。这也是为什么我看到并行下载带来了成功的提高。

---

via: http://xmodulo.com/speed-slow-apt-get-install-debian-ubuntu.html

作者：[Dan Nanni][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://github.com/ilikenwf/apt-fast 
[2]:http://aria2.sourceforge.net/
[3]:http://www.debian.org/mirror/list
[4]:https://launchpad.net/ubuntu/+archivemirrors


