Sleuth Kit：一个用来分析磁盘映像和恢复文件的开源取证工具
================================================================================
SIFT 是一个由 SANS 公司提供的基于 Ubuntu 的取证发行版。它包含许多取证工具，如 Sleuth kit/Autopsy 。但 Sleuth kit/Autopsy 可以直接在 Ubuntu 或 Fedora 发行版本上直接安装，而不必下载 SIFT 的整个发行版本。

Sleuth Kit/Autopsy 是一个开源的电子取证调查工具，它可以用于从磁盘映像中恢复丢失的文件，以及为了特殊事件进行磁盘映像分析。 Autopsy 工具是 sleuth kit 的一个网页接口，支持 sleuth kit 的所有功能。这个工具在 Windows 和 Linux 平台下都可获取到。

### 安装 Sleuth kit ###

首先，从 [sleuthkit][1] 的网站下载 Sleuth kit 软件。使用下面的命令在虚拟终端下使用 wget 命令来下载它，下图展示了这个过程。

    # wget http://cznic.dl.sourceforge.net/project/sleuthkit/sleuthkit/4.1.3/sleuthkit-4.1.3.tar.gz

![下载 Sleuth Kit](http://blog.linoxide.com/wp-content/uploads/2015/03/download-sleuthkeit.png)

使用下面的命令解压 sleuthkit-4.1.3.tar.gz 并进入解压后的目录：

    # tar -xvzf sleuthkit-4.1.3.tar.gz

![解压过程](http://blog.linoxide.com/wp-content/uploads/2015/03/extract.png)

在安装 sleuth kit 之前，运行下面的命令来执行所需的检查：

    #./configure

![configure](http://blog.linoxide.com/wp-content/uploads/2015/03/configure.png)

然后使用 Make 命令来编译 sleuth kit ：

    #make

![make](http://blog.linoxide.com/wp-content/uploads/2015/03/make.png)

最后，使用下面的命令将它安装到 **/usr/local** 目录下：

    #make install

![make install](http://blog.linoxide.com/wp-content/uploads/2015/03/make-install.png)

### 安装 Autopsy 工具 ###

Sleuth kit 已经安装完毕，现在我们将为它安装 autopsy 界面。从 [sleuthkit 的 autopsy 页面][2]下载 Autopsy 软件。使用下面的命令在虚拟终端下使用 wget 命令来下载它，下图展示了这个过程。

    # wget http://kaz.dl.sourceforge.net/project/autopsy/autopsy/2.24/autopsy-2.24.tar.gz

![Autpsy 的下载链接](http://blog.linoxide.com/wp-content/uploads/2015/03/autopsy.png)

使用下面的命令解压 autopsy-2.24.tar.gz 并进入解压后的目录：

    # tar -xvzf autopsy-2.24.tar.gz

![Autopsy 的解压](http://blog.linoxide.com/wp-content/uploads/2015/03/Autopsy-extraction.png)

autopsy 的配置脚本将询问 NSRL (National Software Reference Library) 和 **Evidence_Locker** 文件夹的路径。

当弹窗问及 NSRL 时，输入 "n"，并在 **/usr/local** 目录下创建名为 Evidence_Locker 的文件夹。Autopsy 将在 Evidence_Locker 文件夹下存储配置文件，审计记录和输出文件。

    #mkdir /usr/local/Evidence_Locker

    #cd autopsy-2.24

    #./configure

![Autopsy 配置脚本](http://blog.linoxide.com/wp-content/uploads/2015/03/autopsy-configuration.png)

在安装过程中添加完 Evidence_Locker 的安装路径后， autopsy 在那里存储配置文件并展现如下的信息来运行 autopsy 程序。

![启动 Autopsy](http://blog.linoxide.com/wp-content/uploads/2015/03/start-autopsy.png)

在虚拟终端中键入 **./autopsy** 命令来启动 Sleuth kit 工具的图形界面：

![Autopsy](http://blog.linoxide.com/wp-content/uploads/2015/03/autopsy-started.png)

在浏览器中键入下面的地址来访问 autopsy 的界面：

    http://localhost:9999/autopsy

下图展现了 autopsy 插件的主页面：

![主页](http://blog.linoxide.com/wp-content/uploads/2015/03/main-interface.png)

在 autopsy 工具中，点击 **新案例** 按钮来开始进行分析。键入案例名称，此次调查的描述和检查人的姓名，下图有具体的展示：

![创建新事件](http://blog.linoxide.com/wp-content/uploads/2015/03/create-new-case1.png)

在接下来的网页中，将展示在上一个的网页中键入的详细信息。接着点击 **增加主机** 按钮来添加有关要分析的机器的详细信息。

![增加主机](http://blog.linoxide.com/wp-content/uploads/2015/03/add-host1.png)

在下一个网页中键入主机名，相关的描述和要分析的机器的时区设置。

![添加主机的详细信息](http://blog.linoxide.com/wp-content/uploads/2015/03/add-host-detial.png)

添加主机后，点击 **增加映像** 按钮来为取证分析添加映像文件。

![添加映像](http://blog.linoxide.com/wp-content/uploads/2015/03/add-image.png)

在接下来的网页中点击 **增加映像文件** 按钮。它将打开一个新的网页，来询问映像文件的路径和选择映像的类型以及导入的方法。

![添加映像文件](http://blog.linoxide.com/wp-content/uploads/2015/03/Add-image-file.png)

正如下图中展示的那样，我们已经键入了 Linux 映像文件的路径。在我们这个例子中，映像文件类型是磁盘分区。

![添加映像分区](http://blog.linoxide.com/wp-content/uploads/2015/03/add-image-parition.png)

点击“下一步”按钮并在下一页中选择 **计算散列值** 的选项，这在下图中有展示。它也将检测所给映像的文件系统类型。
 
![映像和文件系统详情](http://blog.linoxide.com/wp-content/uploads/2015/03/image-and-file-system-detail.png)

下面的图片展示了静态分析之前映像文件的 MD5 散列值。

![散列值](http://blog.linoxide.com/wp-content/uploads/2015/03/hash1.png)

在下一个网页中， autopsy 展现了有关映像文件的如下信息：

- 映像的挂载点
- 映像的名称
- 所给映像的文件系统类型

点击 **详情** 按钮来获取更多有关所给映像文件的信息。它还提供了从映像文件的卷中导出未分配的片段和字符串的数据信息，这在下图中有展现。

![映像的详细信息](http://blog.linoxide.com/wp-content/uploads/2015/03/image-details.png)

在下图中那样，点击 **分析** 按钮来开始分析所给映像。它将开启另一个页面，其中包含了映像分析的多个选项。

![分析](http://blog.linoxide.com/wp-content/uploads/2015/03/analysis1.png)

在映像分析过程中，Autopsy 提供了如下的功能：

- 文件分析
- 关键字搜索
- 文件类型
- 映像详情
- 数据单元

下图展示的是在给定的 Linux 分区映像上进行文件分析：

![映像的分析](http://blog.linoxide.com/wp-content/uploads/2015/03/Analysis-of-image.png)

它将从所给映像中提取所有的文件和文件夹。在下图中也展示了已被删除的文件的提取：

![已被删除的文件](http://blog.linoxide.com/wp-content/uploads/2015/03/deleted.png)

### 结论 ###

希望这篇文章能够给那些进入磁盘映像静态分析领域的新手提供帮助。Autopsy 是 sleuth kit 的网页界面，提供了在 Windows 和 Linux 磁盘映像中进行诸如字符串提取，恢复被删文件，时间线分析，网络浏览历史，关键字搜索和邮件分析等功能。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/autopsy-sleuth-kit-installation-ubuntu/

作者：[nido][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
[1]:http://www.sleuthkit.org/sleuthkit/download.php
[2]:http://www.sleuthkit.org/autopsy/download.php