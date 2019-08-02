[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11173-1.html)
[#]: subject: (Install NetData Performance Monitoring Tool On Linux)
[#]: via: (https://www.ostechnix.com/netdata-real-time-performance-monitoring-tool-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

在 Linux 上安装 NetData 性能监控工具
======

![][1]

**NetData** 是一个用于系统和应用的分布式实时性能和健康监控工具。它提供了对系统中实时发生的所有事情的全面检测。你可以在高度互动的 Web 仪表板中查看结果。使用 Netdata，你可以清楚地了解现在发生的事情，以及之前系统和应用中发生的事情。你无需成为专家即可在 Linux 系统中部署此工具。NetData 开箱即用，零配置、零依赖。只需安装它然后坐等，之后 NetData 将负责其余部分。

它有自己的内置 Web 服务器，以图形形式显示结果。NetData 非常快速高效，安装后可立即开始分析系统性能。它是用 C 编程语言编写的，所以它非常轻量。它占用的单核 CPU 使用率不到 3％，内存占用 10-15MB。我们可以轻松地在任何现有网页上嵌入图表，并且它还有一个插件 API，以便你可以监控任何应用。

以下是 Linux 系统中 NetData 的监控列表。

* CPU 使用率
* RAM 使用率
* 交换内存使用率
* 内核内存使用率
* 硬盘及其使用率
* 网络接口
* IPtables
* Netfilter
* DDoS 保护
* 进程
* 应用
* NFS 服务器
* Web 服务器 （Apache 和 Nginx）
* 数据库服务器 （MySQL），
* DHCP 服务器
* DNS 服务器
* 电子邮件服务
* 代理服务器
* Tomcat
* PHP
* SNP 设备
* 等等

NetData 是自由开源工具，它支持 Linux、FreeBSD 和 Mac OS。

### 在 Linux 上安装 NetData

Netdata 可以安装在任何安装了 Bash 的 Linux 发行版上。

最简单的安装 Netdata 的方法是从终端运行以下命令：

```
$ bash <(curl -Ss https://my-netdata.io/kickstart-static64.sh)
```

这将下载并安装启动和运行 Netdata 所需的一切。

有些用户可能不想在没有研究的情况下将某些东西直接注入到 Bash。如果你不喜欢此方法，可以按照以下步骤在系统上安装它。

#### 在 Arch Linux 上

Arch Linux 默认仓库中提供了最新版本。所以，我们可以使用以下 [pacman][2] 命令安装它：

```
$ sudo pacman -S netdata
```

#### 在基于 DEB 和基于 RPM 的系统上

在基于 DEB （Ubuntu / Debian）或基于 RPM（RHEL / CentOS / Fedora） 系统的默认仓库没有 NetData。我们需要从它的 Git 仓库手动安装 NetData。

首先安装所需的依赖项：

```
# Debian / Ubuntu
$ sudo apt-get install zlib1g-dev uuid-dev libuv1-dev liblz4-dev libjudy-dev libssl-dev libmnl-dev gcc make git autoconf autoconf-archive autogen automake pkg-config curl

# Fedora
$ sudo dnf install zlib-devel libuuid-devel libuv-devel lz4-devel Judy-devel openssl-devel libmnl-devel gcc make git autoconf autoconf-archive autogen automake pkgconfig curl findutils

# CentOS / Red Hat Enterprise Linux
$ sudo yum install epel-release
$ sudo yum install autoconf automake curl gcc git libmnl-devel libuuid-devel openssl-devel libuv-devel lz4-devel Judy-devel lm_sensors make MySQL-python nc pkgconfig python python-psycopg2 PyYAML zlib-devel

# openSUSE
$ sudo zypper install zlib-devel libuuid-devel libuv-devel liblz4-devel judy-devel openssl-devel libmnl-devel gcc make git autoconf autoconf-archive autogen automake pkgconfig curl findutils
```

安装依赖项后，在基于 DEB 或基于 RPM 的系统上安装 NetData，如下所示。

Git 克隆 NetData 仓库：

```
$ git clone https://github.com/netdata/netdata.git --depth=100
```

上面的命令将在当前工作目录中创建一个名为 `netdata` 的目录。

切换到 `netdata` 目录：

```
$ cd netdata/
```

最后，使用命令安装并启动 NetData：

```
$ sudo ./netdata-installer.sh
```

**示例输出：**

```
Welcome to netdata!
Nice to see you are giving it a try!

You are about to build and install netdata to your system.

It will be installed at these locations:

- the daemon at /usr/sbin/netdata
 - config files at /etc/netdata
 - web files at /usr/share/netdata
 - plugins at /usr/libexec/netdata
 - cache files at /var/cache/netdata
 - db files at /var/lib/netdata
 - log files at /var/log/netdata
 - pid file at /var/run

This installer allows you to change the installation path.
Press Control-C and run the same command with --help for help.

Press ENTER to build and install netdata to your system > ## Press ENTER key
```

安装完成后，你将在最后看到以下输出：

```
-------------------------------------------------------------------------------

OK. NetData is installed and it is running (listening to *:19999).

-------------------------------------------------------------------------------

INFO: Command line options changed. -pidfile, -nd and -ch are deprecated.
If you use custom startup scripts, please run netdata -h to see the
corresponding options and update your scripts.

Hit http://localhost:19999/ from your browser.

To stop netdata, just kill it, with:

killall netdata

To start it, just run it:

/usr/sbin/netdata


Enjoy!

Uninstall script generated: ./netdata-uninstaller.sh
```

![][3]

*安装 NetData*

NetData 已安装并启动。

要在其他 Linux 发行版上安装 Netdata，请参阅[官方安装说明页面][4]。

### 在防火墙或者路由器上允许 NetData 的默认端口

如果你的系统在防火墙或者路由器后面，那么必须允许默认端口 `19999` 以便从任何远程系统访问 NetData 的 web 界面。

#### 在 Ubuntu/Debian 中

```
$ sudo ufw allow 19999
```

#### 在 CentOS/RHEL/Fedora 中

```
$ sudo firewall-cmd --permanent --add-port=19999/tcp

$ sudo firewall-cmd --reload
```

### 启动/停止 NetData

要在使用 Systemd 的系统上启用和启动 Netdata 服务，请运行：

```
$ sudo systemctl enable netdata
$ sudo systemctl start netdata
```

要停止：

```
$ sudo systemctl stop netdata
```

要在使用 Init 的系统上启用和启动 Netdata 服务，请运行：

```
$ sudo service netdata start
$ sudo chkconfig netdata on
```

要停止：

```
$ sudo service netdata stop
```

### 通过 Web 浏览器访问 NetData

打开 Web 浏览器，然后打开 `http://127.0.0.1:19999` 或者 `http://localhost:19999/` 或者 `http://ip-address:19999`。你应该看到如下页面。

![][5]

*Netdata 仪表板*

在仪表板中，你可以找到 Linux 系统的完整统计信息。向下滚动以查看每个部分。

你可以随时打开 `http://localhost:19999/netdata.conf` 来下载和/或查看 NetData 默认配置文件。

![][6]

*Netdata 配置文件*

### 更新 NetData

在 Arch Linux 中，只需运行以下命令即可更新 NetData。如果仓库中提供了更新版本，那么就会自动安装该版本。

```
$ sudo pacman -Syyu
```

在基于 DEB 或 RPM 的系统中，只需进入已克隆它的目录（此例中是 `netdata`）。

```
$ cd netdata
```

拉取最新更新：

```
$ git pull
```

然后，使用命令重新构建并更新它：

```
$ sudo ./netdata-installer.sh
```

### 卸载 NetData

进入克隆 NetData 的文件夹。

```
$ cd netdata
```

然后，使用命令卸载它：

```
$ sudo ./netdata-uninstaller.sh --force
```

在 Arch Linux 中，使用以下命令卸载它。

```
$ sudo pacman -Rns netdata
```

### 资源

* [NetData 网站][7]
* [NetData 的 GitHub 页面][8]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/netdata-real-time-performance-monitoring-tool-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2016/06/Install-netdata-720x340.png
[2]: https://www.ostechnix.com/getting-started-pacman/
[3]: https://www.ostechnix.com/wp-content/uploads/2016/06/Deepin-Terminal_002-6.png
[4]: https://docs.netdata.cloud/packaging/installer/
[5]: https://www.ostechnix.com/wp-content/uploads/2016/06/Netdata-dashboard.png
[6]: https://www.ostechnix.com/wp-content/uploads/2016/06/Netdata-config-file.png
[7]: http://netdata.firehol.org/
[8]: https://github.com/firehol/netdata
