如何在Linux的终端测试网速?
学习如何在Linux终端使用命令行工具测试网速,或者仅用一条python命令立刻获得网速的测试结果, 我们都会在连接网络或者wifi的时候去测试网络带宽。 
为什么不用我们自己的服务器！下面将会教你如何在Linux终端测试网速。我们多数都会使用Mb/s标准来测试网速。 仅仅只是桌面上的一个简单的操作，访问他们的网站点击浏览。
它将使用最近的服务器来扫描你的本地主机来测试网速。 如果你使用的是移动设备，他们有对应的移动端APP。但如果你使用的是只有命令行终端界面的则会有些不同。下面让我们一起看看如何在Linux的终端来测试网速。如果你只是想偶尔的做一次网速测试而不想去下载测试工具。
那么请往下看如何使用命令完成测试。
第一步：下载网速测试命令行工具。
首先，你需要从github上下载网速测试命令行工具。现在，上面也包含许多其他的Linu相关的仓库，如果已经在你的库中，你可以直接在你的Linux上进行安装。 让我们继续下载和安装过程，安装的git包取决于你的Linux发行版。
然后按照下面的方法来克隆Github speedtest存储库
[root@kerneltalks ~]# git clone https://github.com/sivel/speedtest-cli.git
Cloning into 'speedtest-cli'...
remote: Counting objects: 913, done.
remote: Total 913 (delta 0), reused 0 (delta 0), pack-reused 913
Receiving objects: 100% (913/913), 251.31 KiB | 143.00 KiB/s, done.
Resolving deltas: 100% (518/518), done.
 
它将会被克隆到你当前的工作目录，新的名为speedtest-cli的目录将会被创建。
你将在新的目录下看到如下的文件。
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
名为speedtest.py的脚本文件就是用来测试网速的。你可以在/usr/bin执行环境下将这个脚本链接到一条命令以便这台机器上的所有用户都能使用。或者你可以为这个脚本创建一个命令别名这样就能让所有用户很容易使用它。
第二步：运行python脚本
现在，直接运行这个脚本，不需要添加任何参数它将会搜寻最近的服务器来测试你的网速。

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
Oh! Dont amaze with speed. 😀 I am on AWS EC2 Linux server. Thats the bandwidth of Amazon data center! 🙂

这个脚本可以添加有不同的选项。
下面的几个选项对这个脚本可能会很有用处：用搜寻你附近的网路测试服务器，使用 --list和grep加上本地名来列出所有附件的服务器。
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
 
然后你就能从搜寻结果中看到，第一列是服务器识别号，紧接着是公司的名称和所在地，最后是离你的距离。
如果要使用指定的服务器来测试网速，后面跟上命令 --server 加上服务器的识别号。
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

如果想得到你的测试结果的共享链接，使用命令 --share,你将会得到测试结果的链接。
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
 
输出中的最后一行就是你的测试结果的链接。下载下来的图片内容如下：
 
这就是全部的过程！如果你不想子结果中看到这些技术术语，你也可以使用如下的命令迅速测出你的网速。
要想在终端使用一条命令测试网速。
我们将使用Curl工具来在线抓取上面使用的python脚本然后直接用python执行脚本
[root@kerneltalks ~]# curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
Above command will run the script and show you result on screen!
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

这是在RHEL 7上执行的结果，在Ubuntu,Debian, Fedora或者Centos上一样可以执行。
via: https://kerneltalks.com/tips-tricks/how-to-test-internet-speed-in-linux-terminal/
作者：Shrikant Lavhate 译者：译者ID 校对：校对者ID
本文由 LCTT 原创编译，Linux中国 荣誉推出
