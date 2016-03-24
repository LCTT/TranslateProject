Flowsnow translating...
LFCS系列第九讲: 使用Yum， RPM， Apt， Dpkg， Aptitude， Zypper进行Linux包管理
================================================================================
去年八月, Linux基金会宣布了一个全新的LFCS（Linux Foundation Certified Sysadmin，Linux基金会认证系统管理员）认证计划，这对广大系统管理员来说是一个很好的机会，管理员们可以通过绩效考试来表明自己可以成功支持Linux系统的整体运营。 当需要的时候一个Linux基金会认证的系统管理员有足够的专业知识来确保系统高效运行，提供第一手的故障诊断和监视，并且为工程师团队在问题升级时提供智能决策。

![Linux Package Management](http://www.tecmint.com/wp-content/uploads/2014/11/lfcs-Part-9.png)

Linux基金会认证系统管理员 – 第九讲

请观看下面关于Linux基金会认证计划的演示。

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="http://www.youtube.com/embed/Y29qZ71Kicg"></iframe>

本文是本系列十套教程中的第九讲，今天在这篇文章中我们会引导你学习Linux包管理，这也是LFCS认证考试所需要的。

### 包管理 ###

简单的说，包管理是系统中安装和维护软件的一种方法，其中维护也包含更新和卸载。

在Linux早期，程序只以源代码的方式发行，还带有所需的用户使用手册和必备的配置文件，甚至更多。现如今，大多数发行商使用默认的预装程序或者被称为包的程序集合。用户使用这些预装程序或者包来安装该发行版本。然而，Linux最伟大的一点是我们仍然能够获得程序的源代码用来学习、改进和编译。

**包管理系统是如何工作的**

如果某一个包需要一定的资源，如共享库，或者需要另一个包，据说就会存在依赖性问题。所有现在的包管理系统提供了一些解决依赖性的方法，以确保当安装一个包时，相关的依赖包也安装好了

**打包系统**

几乎所有安装在现代Linux系统上的软件都会在互联网上找到。它要么能够通过中央库（中央库能包含几千个包，每个包都已经构建、测试并且维护好了）发行商得到，要么能够直接得到可以下载和手动安装的源代码。

由于不同的发行版使用不同的打包系统（Debian的*.deb文件/ CentOS的*.rpm文件/ openSUSE的专门为openSUSE构建的*.rpm文件），因此为一个发行版本开发的包会与其他发行版本不兼容。然而，大多数发行版本都可能是LFCS认证的三个发行版本之一。

**高级和低级打包工具**

为了有效地进行包管理的任务，你需要知道，你将有两种类型的实用工具：低级工具（能在后端实际安装，升级，卸载包文件），以及高级工具（负责确保能很好的执行依赖性解决和元数据检索的任务，元数据也称为关于数据的数据）。

注：表格

<table cellspacing="0" border="0">
  <colgroup width="200">
  </colgroup>
  <colgroup width="200">
  </colgroup>
  <colgroup width="200">
  </colgroup>
  <tbody>
    <tr>
      <td bgcolor="#AEA79F" align="CENTER" height="18" style="border: 1px solid #000001;"><b><span style="color: black;">发行版</span></b></td>
      <td bgcolor="#AEA79F" align="CENTER" style="border: 1px solid #000001;"><b><span style="color: black;">低级工具</span></b></td>
      <td bgcolor="#AEA79F" align="CENTER" style="border: 1px solid #000001;"><b><span style="color: black;">高级工具</span></b></td>
    </tr>
    <tr class="alt">
      <td bgcolor="#FFFFFF" align="LEFT" height="18" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;Debian版及其衍生版</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;dpkg</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;apt-get / aptitude</span></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="LEFT" height="18" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;CentOS版</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;rpm</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;yum</span></td>
    </tr>
    <tr class="alt">
      <td bgcolor="#FFFFFF" align="LEFT" height="18" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;openSUSE版</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;rpm</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;zypper</span></td>
    </tr>
  </tbody>
</table>

让我们来看下低级工具和高级工具的描述。

dpkg的是基于Debian系统中的一个低级包管理器。它可以安装，删除，提供有关资料，并建立*.deb包，但它不能自动下载并安装它们相应的依赖包。

- 阅读更多： [15个dpkg命令实例][1]

apt-get是Debian和衍生版的高级包管理器，并提供命令行方式从多个来源检索和安装软件包，其中包括解决依赖性。和dpkg不同的是，apt-get不是直接基于.deb文件工作，而是基于包的正确名称。

- 阅读更多： [25个apt-get命令实力][2]

Aptitude是基于Debian的系统的另一个高级包管理器，它可用于快速简便的执行管理任务（安装，升级和删除软件包，还可以自动处理解决依赖性）。与atp-get和额外的包管理器相比，它提供了相同的功能，例如提供对包的几个版本的访问。

rpm是Linux标准基础（LSB）兼容发布版使用的一种包管理器，用来对包进行低级处理。就像dpkg，rpm可以查询，安装，检验，升级和卸载软件包，并能被基于Fedora的系统频繁地使用，比如RHEL和CentOS。

- 阅读更多： [20个rpm命令实例][3]

相对于基于RPM的系统，yum增加了系统自动更新的功能和带依赖性管理的包管理功能。作为一个高级工具，和apt-get或者aptitude相似，yum基于库工作。

- 阅读更多： [20个yum命令实例][4]
-
### 低级工具的常见用法 ###

你用低级工具处理最常见的任务如下。

**1. 从已编译（*.deb或*.rpm）的文件安装一个包**

这种安装方法的缺点是没有提供解决依赖性的方案。当你在发行版本库中无法获得某个包并且又不能通过高级工具下载安装时，你很可能会从一个已编译文件安装该包。因为低级工具不需要解决依赖性问题，所以当安装一个没有解决依赖性的包时会出现出错并且退出。

    # dpkg -i file.deb 		[Debian版和衍生版]
    # rpm -i file.rpm 		[CentOS版 / openSUSE版]

**注意**： 不要试图在CentOS中安装一个为openSUSE构建的.rpm文件，反之亦然！

**2. 从已编译文件中更新一个包**

同样，当中央库中没有某安装包时，你只能手动升级该包。

    # dpkg -i file.deb 		[Debian版和衍生版]
    # rpm -U file.rpm 		[CentOS版 / openSUSE版]

**3. 列举安装的包**

当你第一次接触一个已经在工作中的系统时，很可能你会想知道安装了哪些包。

    # dpkg -l 		[Debian版和衍生版]
    # rpm -qa 		[CentOS版 / openSUSE版]

如果你想知道一个特定的包安装在哪儿, 你可以使用管道命令从以上命令的输出中去搜索，这在这个系列的[操作Linux文件 – 第一讲][5] 中有介绍。假定我们需要验证mysql-common这个包是否安装在Ubuntu系统中。

    # dpkg -l | grep mysql-common

![Check Installed Packages in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Installed-Package.png)

检查安装的包

另外一种方式来判断一个包是否已安装。

    # dpkg --status package_name 		[Debian版和衍生版]
    # rpm -q package_name 			[CentOS版 / openSUSE版]

例如，让我们找出sysdig包是否安装在我们的系统。

    # rpm -qa | grep sysdig

![Check sysdig Package](http://www.tecmint.com/wp-content/uploads/2014/11/Check-sysdig-Package.png)

检查sysdig包

**4. 查询一个文件是由那个包安装的**

    # dpkg --search file_name
    # rpm -qf file_name

例如，pw_dict.hwm文件是由那个包安装的？

    # rpm -qf /usr/share/cracklib/pw_dict.hwm

![Query File in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Query-File-in-Linux.png)

Linux中查询文件

### 高级工具的常见用法 ###

你用高级工具处理最常见的任务如下。

**1. 搜索包**

aptitude更新将会更新可用的软件包列表，并且aptitude搜索会根据包名进行实际性的搜索。

    # aptitude update && aptitude search package_name

在搜索所有选项中，yum不仅可以通过包名还可以通过包的描述搜索程序包。

    # yum search package_name
    # yum search all package_name
    # yum whatprovides “*/package_name”

假定我们需要一个名为sysdig的包，要知道的是我们需要先安装然后才能运行。

    # yum whatprovides “*/sysdig”

![Check Package Description in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Package-Description.png)

检查包描述

whatprovides告诉yum搜索一个含有能够匹配上述正则表达式的文件的包。

    # zypper refresh && zypper search package_name		[在openSUSE上]

**2. 从仓库安装一个包**

当安装一个包时，在包管理器解决了所有依赖性问题后，可能会提醒你确认安装。需要注意的是运行更新或刷新（根据所使用的软件包管理器）不是绝对必要，但是考虑到安全性和依赖性的原因，保持安装的软件包是最新的是一个好的系统管理员的做法。

    # aptitude update && aptitude install package_name 		[Debian版和衍生版]
    # yum update && yum install package_name 			[CentOS版]
    # zypper refresh && zypper install package_name 		[openSUSE版]

**3. 卸载包**

按选项卸载将会卸载软件包，但把配置文件保留完好，然而清除包从系统中完全删去该程序。
# aptitude remove / purge package_name
# yum erase package_name

    ---注意要卸载的openSUSE包前面的减号 ---

    # zypper remove -package_name

在默认情况下，大部分（如果不是全部）的包管理器会提示你，在你实际卸载之前你是否确定要继续卸载。所以，请仔细阅读屏幕上的信息，以避免陷入不必要的麻烦！

**4. 显示包的信息**

下面的命令将会显示birthday这个包的信息。

    # aptitude show birthday
    # yum info birthday
    # zypper info birthday

![Check Package Information in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Package-Information.png)

检查包信息

### 总结 ###

作为一个系统管理员，包管理器是你不能回避的东西。你应该立即准备使用本文中介绍的这些工具。希望你在准备LFCS考试和日常工作中会觉得这些工具好用。欢迎在下面留下您的意见或问题，我们将尽可能快的回复你。

--------------------------------------------------------------------------------

via： http://www.tecmint.com/linux-package-management/

作者：[Gabriel Cánepa][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/dpkg-command-examples/
[2]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[3]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[4]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[5]:http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/