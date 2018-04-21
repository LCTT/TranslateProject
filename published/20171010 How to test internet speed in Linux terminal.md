如何在Linux的终端测试网速
======

> 学习如何在 Linux 终端使用命令行工具 `speedtest` 测试网速，或者仅用一条 python 命令立刻获得网速的测试结果。 

![在Linux终端测试网速][1]

我们都会在连接到一个新的网络或者 WIFI 的时候去测试网络带宽。 为什么不用我们自己的服务器！下面将会教你如何在 Linux 终端测试网速。

我们多数都会使用 [Ookla 的 Speedtest][2] 来测试网速。 这在桌面上是很简单的操作，访问他们的网站点击“Go”浏览即可。它将使用最近的服务器来扫描你的本地主机来测试网速。 如果你使用的是移动设备，他们有对应的移动端 APP。但如果你使用的是只有命令行终端，界面的则会有些不同。下面让我们一起看看如何在Linux的终端来测试网速。

如果你只是想偶尔的做一次网速测试而不想去下载测试工具，那么请往下看如何使用命令完成测试。

### 第一步：下载网速测试命令行工具。

首先，你需要从 [GitHub][3] 上下载 `speedtest` 命令行工具。现在，它也被包含在许多其它的 Linux 仓库中，如果已经在你的库中，你可以直接[在你的 Linux 发行版上进行安装][4]。 

让我们继续下载和安装过程，安装的 git 包取决于你的 Linux 发行版。然后按照下面的方法来克隆 Github speedtest 存储库

```
[root@kerneltalks ~]# git clone https://github.com/sivel/speedtest-cli.git
Cloning into 'speedtest-cli'...
remote: Counting objects: 913, done.
remote: Total 913 (delta 0), reused 0 (delta 0), pack-reused 913
Receiving objects: 100% (913/913), 251.31 KiB | 143.00 KiB/s, done.
Resolving deltas: 100% (518/518), done.
```

它将会被克隆到你当前的工作目录，新的名为 `speedtest-cli` 的目录将会被创建，你将在新的目录下看到如下的文件。

```
[root@kerneltalks ~]# cd speedtest-cli
[root@kerneltalks speedtest-cli]# ll
total 96
-rw-r--r--. 1 root root  1671 Oct  7 16:55 CONTRIBUTING.md
-rw-r--r--. 1 root root 11358 Oct  7 16:55 LICENSE
-rw-r--r--. 1 root root    35 Oct  7 16:55 MANIFEST.in
-rw-r--r--. 1 root root  5215 Oct  7 16:55 README.rst
-rw-r--r--. 1 root root    20 Oct  7 16:55 setup.cfg
-rw-r--r--. 1 root root  3196 Oct  7 16:55 setup.py
-rw-r--r--. 1 root root  2385 Oct  7 16:55 speedtest-cli.1
-rw-r--r--. 1 root root  1200 Oct  7 16:55 speedtest_cli.py
-rwxr-xr-x. 1 root root 47228 Oct  7 16:55 speedtest.py
-rw-r--r--. 1 root root   333 Oct  7 16:55 tox.ini
```

名为 `speedtest.py` 的 Python 脚本文件就是用来测试网速的。

你可以将这个脚本链接到 `/usr/bin` 下，以便这台机器上的所有用户都能使用。或者你可以为这个脚本创建一个[命令别名][5]，这样就能让所有用户很容易使用它。

### 运行 Python 脚本

现在，直接运行这个脚本，不需要添加任何参数，它将会搜寻最近的服务器来测试你的网速。

```
[root@kerneltalks speedtest-cli]# python speedtest.py
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Spectra (Mumbai) [1.15 km]: 8.174 ms
Testing download speed................................................................................
Download: 548.13 Mbit/s
Testing upload speed................................................................................................
Upload: 323.95 Mbit/s
```

Oh！ 不要被这个网速惊讶道。我在 AWE EX2 的服务器上。那是亚马逊数据中心的网速！

### 这个脚本可以添加有不同的选项。

下面的几个选项对这个脚本可能会很有用处：

**要搜寻你附近的网路测试服务器**，使用 `--list` 和 `grep` 加上地名来列出所有附近的服务器。

```
[root@kerneltalks speedtest-cli]#  python speedtest.py --list | grep -i mumbai
 2827) Bharti Airtel Ltd (Mumbai, India) [1.15 km]
 8978) Spectra (Mumbai, India) [1.15 km]
 4310) Hathway Cable and Datacom Ltd (Mumbai, India) [1.15 km]
 3315) Joister Broadband (Mumbai, India) [1.15 km]
 1718) Vodafone India (Mumbai, India) [1.15 km]
 6454) YOU Broadband India Pvt Ltd. (Mumbai, India) [1.15 km]
 9764) Railtel Corporation of india Ltd (Mumbai, India) [1.15 km]
 9584) Sheng Li Telecom (Mumbai, India) [1.15 km]
 7605) Idea Cellular Ltd. (Mumbai, India) [1.15 km]
 8122) Sify Technologies Ltd (Mumbai, India) [1.15 km]
 9049) I-ON (Mumbai, India) [1.15 km]
 6403) YOU Broadband India Pvt Ltd., Mumbai (Mumbai, India) [1.15 km]
```

然后你就能从搜寻结果中看到，第一列是服务器识别号，紧接着是公司的名称和所在地，最后是离你的距离。

**如果要使用指定的服务器来测试网速**，后面跟上 `--server` 加上服务器的识别号。

``` 
[root@kerneltalks speedtest-cli]# python speedtest.py --server 2827
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Bharti Airtel Ltd (Mumbai) [1.15 km]: 13.234 ms
Testing download speed................................................................................
Download: 93.47 Mbit/s
Testing upload speed................................................................................................
Upload: 69.25 Mbit/s
```

**如果想得到你的测试结果的分享链接**，使用 `--share`，你将会得到测试结果的链接。

```
[root@kerneltalks speedtest-cli]# python speedtest.py --share
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Spectra (Mumbai) [1.15 km]: 7.471 ms
Testing download speed................................................................................
Download: 621.00 Mbit/s
Testing upload speed................................................................................................
Upload: 367.37 Mbit/s
Share results: http://www.speedtest.net/result/6687428141.png
```

输出中的最后一行就是你的测试结果的链接。下载下来的图片内容如下 :

![Speedtest result on Linux][7]

这就是全部的过程！如果你不想了解这些技术细节，你也可以使用如下的一行命令迅速测出你的网速。

### 要想在终端使用一条命令测试网速。

我们将使用 `curl` 工具来在线抓取上面使用的 Python 脚本然后直接用 Python 执行脚本。

```
[root@kerneltalks ~]# curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
```

上面的脚本将会运行脚本输出结果到屏幕上。

```
[root@kerneltalks speedtest-cli]# curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
Retrieving speedtest.net configuration...
Testing from Amazon (35.154.184.126)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Spectra (Mumbai) [1.15 km]: 12.599 ms
Testing download speed................................................................................
Download: 670.88 Mbit/s
Testing upload speed................................................................................................
Upload: 355.84 Mbit/s
```

这是在 RHEL 7 上执行的结果，在 Ubuntu、Debian、Fedora 或者 CentOS 上一样可以执行。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/tips-tricks/how-to-test-internet-speed-in-linux-terminal/

作者：[Shrikant Lavhate][a]
译者：[FelixYFZ](https://github.com/FelixYFZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a1.kerneltalks.com/wp-content/uploads/2017/10/check-internet-speed-from-Linux.png
[2]:http://www.speedtest.net/
[3]:https://github.com/sivel/speedtest-cli
[4]:https://kerneltalks.com/tools/package-installation-linux-yum-apt/
[5]:https://kerneltalks.com/commands/command-alias-in-linux-unix/
[6]:https://kerneltalks.com/howto/install-ec2-linux-server-aws-with-screenshots/
[7]:https://a3.kerneltalks.com/wp-content/uploads/2017/10/speedtest-on-linux.png
[8]:https://kerneltalks.com/tips-tricks/4-tools-download-file-using-command-line-linux/
