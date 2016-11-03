在CentOS下根据依赖性来下载RPM软件包
===

![在CentOS下根据依赖性来下载RPM软件包](https://www.ostechnix.com/wp-content/uploads/2016/10/Download-a-package-720x340.png)

前几天我尝试去创建一个我们在CentOS 7下经常使用的软件的本地的仓库。当然我们可以使用 curl 或者 wget 下载任何软件包。然而这些命令并不能下载要求的依赖软件包。你必须去花一些时间而且手动的去寻找和下载被安装的软件所依赖的软件包。然而，这并不是我们必须要做的事情。在这个简短的教程中，我将会带领你学习如何根据依赖性来下载软件包的两种方法。我已经在CentOS 7 下进行了测试，尽管这些相同的步骤或许在其他基于 RPM 管理系统的发行版上也可以工作，例如 RHEL，Fedora 和 Scientific Linux。

### 方法 1-利用“Downloadonly”插件来根据依赖性来下载RPM软件包

我们可以通过 yum 命令的“Downloadonly”插件来很容易地根据依赖性来下载RPM软件包。

为了安装 Downloadonly 插件，以 root 身份运行以下命令。

```
yum install yum-plugin-downloadonly
```

现在，运行以下命令去下载一个 RPM 软件包

```
yum install --downloadonly <package-name>
```

默认情况下，这个命令将会下载并把软件包保存到  /var/cache/yum/ 在 rhel-{arch}-channel/packageslocation，然而，你可以下载和保存软件包到任何位置，你可以通过 “–downloaddir” 选项来指定。

```
yum install --downloadonly --downloaddir=<directory> <package-name>
```

例子:

```
yum install --downloadonly --downloaddir=/root/mypackages/ httpd
```

终端输出:

```
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: centos.excellmedia.net
 * epel: epel.mirror.angkasa.id
 * extras: centos.excellmedia.net
 * updates: centos.excellmedia.net
Resolving Dependencies
--> Running transaction check
---> Package httpd.x86_64 0:2.4.6-40.el7.centos.4 will be installed
--> Processing Dependency: httpd-tools = 2.4.6-40.el7.centos.4 for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Processing Dependency: /etc/mime.types for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Running transaction check
---> Package apr.x86_64 0:1.4.8-3.el7 will be installed
---> Package apr-util.x86_64 0:1.5.2-6.el7 will be installed
---> Package httpd-tools.x86_64 0:2.4.6-40.el7.centos.4 will be installed
---> Package mailcap.noarch 0:2.1.41-2.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

=======================================================================================================================================
 Package Arch Version Repository Size
=======================================================================================================================================
Installing:
 httpd x86_64 2.4.6-40.el7.centos.4 updates 2.7 M
Installing for dependencies:
 apr x86_64 1.4.8-3.el7 base 103 k
 apr-util x86_64 1.5.2-6.el7 base 92 k
 httpd-tools x86_64 2.4.6-40.el7.centos.4 updates 83 k
 mailcap noarch 2.1.41-2.el7 base 31 k

Transaction Summary
=======================================================================================================================================
Install 1 Package (+4 Dependent packages)

Total download size: 3.0 M
Installed size: 10 M
Background downloading packages, then exiting:
(1/5): apr-1.4.8-3.el7.x86_64.rpm | 103 kB 00:00:01 
(2/5): apr-util-1.5.2-6.el7.x86_64.rpm | 92 kB 00:00:01 
(3/5): mailcap-2.1.41-2.el7.noarch.rpm | 31 kB 00:00:01 
(4/5): httpd-tools-2.4.6-40.el7.centos.4.x86_64.rpm | 83 kB 00:00:01 
(5/5): httpd-2.4.6-40.el7.centos.4.x86_64.rpm | 2.7 MB 00:00:09 
---------------------------------------------------------------------------------------------------------------------------------------
Total 331 kB/s | 3.0 MB 00:00:09 
exiting because "Download Only" specified
```

[![rootserver1_001](http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_001.png)][6]

现在去你指定的目录位置下。你将会看到那里有下载好的软件包和依赖的软件。在我这种情况下，我已经把软件包下载到/root/mypackages/ 目录下。

让我们来查看一下内容。

```
ls /root/mypackages/
```

样本输出：

```
apr-1.4.8-3.el7.x86_64.rpm
apr-util-1.5.2-6.el7.x86_64.rpm
httpd-2.4.6-40.el7.centos.4.x86_64.rpm
httpd-tools-2.4.6-40.el7.centos.4.x86_64.rpm
mailcap-2.1.41-2.el7.noarch.rpm
```

[![rootserver1_003](http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_003-1.png)][5]

正如你在上面输出所看到的, httpd软件包已经被依据所有依赖性下载完成了.


请注意，这个插件适用于 “yum install/yum update” 而且并不适用于 “yum groupinstall”。默认情况下，这个插件将会下载仓库中最新可用的软件包。然而你可以通过指定版本号来下载某个特定的软件版本。

例子:

```
yum install --downloadonly --downloaddir=/root/mypackages/ httpd-2.2.6-40.el7
```

Also, you can download multiple packages at once as shown below.

```
yum install --downloadonly --downloaddir=/root/mypackages/ httpd vsftpd
```

### 方法 2-使用 Yumdownloader 工具来根据依赖性下载 RPM 软件包，



Yumdownloader是一款简单，但是却十分有用的命令行工具，它可以一次性根据依赖性下载任何 RPM 软件包

以 root 身份运行如下命令安装 Yumdownloader 工具

```
yum install yum-utils
```
一旦安装完成，运行如下命令去下载一个软件包，例如 httpd

```
yumdownloader httpd
```
为了根据所有依赖性下载软件包，我们使用 _–resolve 参数：

```
yumdownloader --resolve httpd
```

默认情况下，Yumdownloader 将会下载软件包到当前工作目录下。

为了将软件下载到一个特定的目录下，我们使用 _–destdir 参数：
```
yumdownloader --resolve --destdir=/root/mypackages/ httpd
```

或者

```
yumdownloader --resolve --destdir /root/mypackages/ httpd
```

终端输出:

```
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: centos.excellmedia.net
 * epel: epel.mirror.angkasa.id
 * extras: centos.excellmedia.net
 * updates: centos.excellmedia.net
--> Running transaction check
---> Package httpd.x86_64 0:2.4.6-40.el7.centos.4 will be installed
--> Processing Dependency: httpd-tools = 2.4.6-40.el7.centos.4 for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Processing Dependency: /etc/mime.types for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.4.6-40.el7.centos.4.x86_64
--> Running transaction check
---> Package apr.x86_64 0:1.4.8-3.el7 will be installed
---> Package apr-util.x86_64 0:1.5.2-6.el7 will be installed
---> Package httpd-tools.x86_64 0:2.4.6-40.el7.centos.4 will be installed
---> Package mailcap.noarch 0:2.1.41-2.el7 will be installed
--> Finished Dependency Resolution
(1/5): apr-util-1.5.2-6.el7.x86_64.rpm | 92 kB 00:00:01 
(2/5): mailcap-2.1.41-2.el7.noarch.rpm | 31 kB 00:00:02 
(3/5): apr-1.4.8-3.el7.x86_64.rpm | 103 kB 00:00:02 
(4/5): httpd-tools-2.4.6-40.el7.centos.4.x86_64.rpm | 83 kB 00:00:03 
(5/5): httpd-2.4.6-40.el7.centos.4.x86_64.rpm | 2.7 MB 00:00:19
```

[![rootserver1_004](http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_004-1.png)][3]

让我们确认一下软件包是否被下载到我们指定的目录下。
```
ls /root/mypackages/
```

终端输出：

```
apr-1.4.8-3.el7.x86_64.rpm
apr-util-1.5.2-6.el7.x86_64.rpm
httpd-2.4.6-40.el7.centos.4.x86_64.rpm
httpd-tools-2.4.6-40.el7.centos.4.x86_64.rpm
mailcap-2.1.41-2.el7.noarch.rpm
```

[![rootserver1_005](http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_005.png)][2]

不像 Downloadonly 插件，Yumdownload 可以下载一组相关的软件包。

```
yumdownloader "@Development Tools" --resolve --destdir /root/mypackages/
```

在我看来，我更喜欢 Yumdownloader 应用在 Yum 上面。但是，两者都是十分简单易懂而且可以完成相同的工作。

这就是今天所有的内容，如果你觉得这份引导教程有用，清在你的社交媒体上面分享一下去让更多的人知道。

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/download-rpm-package-dependencies-centos/

作者：[SK][a]

译者：[LinuxBars](https://github.com/LinuxBars)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://ostechnix.tradepub.com/free/w_make272/prgm.cgi?a=1
[2]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_005.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_004-1.png
[4]:http://ostechnix.tradepub.com/free/w_make272/prgm.cgi?a=1
[5]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_003-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_001.png
[7]:https://www.ostechnix.com/author/sk/
