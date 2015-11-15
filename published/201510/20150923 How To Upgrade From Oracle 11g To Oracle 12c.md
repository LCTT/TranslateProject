如何将 Oracle 11g 升级到 Orcale 12c
================================================================================
大家好。今天我们来学习一下如何将 Oracle 11g 升级到 Oracle 12c。开始吧。

在此，我使用的是 CentOS 7 64 位 Linux 发行版。我假设你已经在你的系统上安装了 Oracle 11g。这里我会展示一下安装 Oracle 11g 时我的操作步骤。

我在 Oracle 11g 上选择 “Create and configure a database”，如下图所示。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage1.png)

然后我选择安装 Oracle 11g “Decktop Class”。如果是生产环境，你必须选择 “Server Class”。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage2.png)

然后你输入安装 Oracle 11g 的各种路径以及密码。下面是我自己的 Oracle 11g 安装配置。确保你正确输入了 Oracle 的密码。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage3.png)

下一步，我按照如下设置 Inventory Directory。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage4.png)

到这里，我已经向你展示了我安装 Oracle 11g 所做的工作，因为我们开始想升级到 12c。

让我们将 Oracle 11g 升级到 Oracle 12c 吧。

你需要从该[链接][1]上下载两个 zip 文件。下载并解压两个文件到相同目录。文件名为 **linuxamd64_12c_database_1of2.zip** & **linuxamd64_12c_database_2of2.zip**。提取或解压完后，它会创建一个名为 database 的文件夹。

注意：升级到 12c 之前，请确保在你的 CentOS 上已经安装了所有必须的软件包，并且所有的路径变量也已经正确配置，还有其它前提条件也已经满足。

下面是必须使用正确版本安装的一些软件包

- binutils
- compat-libstdc++
- gcc
- glibc
- libaio
- libgcc
- libstdc++
- make
- sysstat
- unixodbc

在因特网上搜索正确的 rpm 版本。

你也可以用一个查询处理多个软件包，然后在输出中查找正确版本。例如，在终端中输入下面的命令：

    rpm -q binutils compat-libstdc++ gcc glibc libaio libgcc libstdc++ make sysstat unixodbc

你的系统中必须安装了以下软件包（版本可能或新或旧）

- binutils-2.23.52.0.1-12.el7.x86_64
- compat-libcap1-1.10-3.el7.x86_64
- gcc-4.8.2-3.el7.x86_64
- gcc-c++-4.8.2-3.el7.x86_64
- glibc-2.17-36.el7.i686
- glibc-2.17-36.el7.x86_64
- glibc-devel-2.17-36.el7.i686
- glibc-devel-2.17-36.el7.x86_64
- ksh
- libaio-0.3.109-9.el7.i686
- libaio-0.3.109-9.el7.x86_64
- libaio-devel-0.3.109-9.el7.i686
- libaio-devel-0.3.109-9.el7.x86_64
- libgcc-4.8.2-3.el7.i686
- libgcc-4.8.2-3.el7.x86_64
- libstdc++-4.8.2-3.el7.i686
- libstdc++-4.8.2-3.el7.x86_64
- libstdc++-devel-4.8.2-3.el7.i686
- libstdc++-devel-4.8.2-3.el7.x86_64
- libXi-1.7.2-1.el7.i686
- libXi-1.7.2-1.el7.x86_64
- libXtst-1.2.2-1.el7.i686
- libXtst-1.2.2-1.el7.x86_64
- make-3.82-19.el7.x86_64
- sysstat-10.1.5-1.el7.x86_64

你也需要 unixODBC-2.3.1 或更新版本的驱动。

我希望你安装 Oracle 11g 的时候已经在你的 CentOS 7 上创建了名为 oracle 的用户。让我们以用户 oracle 登录 CentOS。以用户 oracle 登录到 CentOS 之后，在你的 CentOS上打开一个终端。

使用终端更改工作目录并导航到你解压两个 zip 文件的目录。在终端中输入以下命令开始安装 12c。

    ./runInstaller

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212image5.png)

如果一切顺利，你会看到类似下面的截图，已经开始安装 12c。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage6.png)

然后你可以选择跳过更新或者下载最近更新。如果是生产服务器，建议你必须更新。我这里选择跳过。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage7.png)

现在，选择升级现有数据库。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage8.png)

对于语言，这里已经有 English。点击下一步继续，或者你可以根据你的需要添加语言。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage9.png)

现在，选择企业版。你可以根据你的需求选择。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage10.png)

然后选择软件位置路径，这些都是不言自明的。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage11.png)

对于第七步，像下面这样使用默认的选择继续下一步。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage12.png)

在第九步中，你会看到一个类似下面这样的总结报告。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage13.png)

如果一切正常，你可以点击第九步中的 install 开始安装，进入第十步。

![](http://www.unixmen.com/wp-content/uploads/2015/09/11g212cimage14.png)

其中你可能会遇到一些错误，你需要通过谷歌找到这些错误的解决方法。你可能遇到的问题会有很多，因此我没有在这里详细介绍。

要有耐心，一步一步走下来最后它会告诉你成功了。否则，在谷歌上搜索做必要的操作解决问题。再一次说明，由于你可能会遇到的错误有很多，我无法在这里提供所有详细介绍。

现在，只需要按照下面屏幕指令配置监听器。

配置完监听器之后，它会启动数据库升级助手（Database Upgrade Assistant）。选择 Upgrade Oracle Database。

![](http://www.unixmen.com/wp-content/uploads/2015/09/DUAimage15.png)

在第二步，你会发现它显示了 11g 的位置路径以及 12c 的位置路径。同时你也会发现它指示说从原来的 Oracle Home Release 11 安装 Oracle Home Release 12.点击下一步进入步骤三。

![](http://www.unixmen.com/wp-content/uploads/2015/09/DUAimage16.png)

按照屏幕上的说明完成安装。

在最后一步，你会看到一个成功窗口，其中你会看到成功升级了 oracle 数据库。

**一个忠告**：对于你的生产服务器，在升级到 12c 之前，请确保你已经在其它平台上测试过，以便你能修复升级过程中遇到的所有错误。永远不要尝试一无所知的时候就升级生产服务器。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/upgrade-from-oracle-11g-to-oracle-12c/

作者：[Mohammad Forhad Iftekher][a]
译者：[ictlyh](http://www.mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/forhad/
[1]:http://www.oracle.com/technetwork/database/enterprise-edition/downloads/database12c-linux-download-1959253.html