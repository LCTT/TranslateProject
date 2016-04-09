新手应知应会的Linux命令
================================================================================
![Manage system updates via the command line with dnf on Fedora.](http://www.linux.com/images/stories/41373/fedora-cli.png)

*在Fedora上通过命令行使用dnf来管理系统更新*

基于Linux的系统最美妙的一点，就是你可以在终端中使用命令行来管理整个系统。使用命令行的优势在于，你可以使用相同的知识和技能来管理随便哪个Linux发行版。

对于各个发行版以及桌面环境（DE）而言，要一致地使用图形化用户界面（GUI）却几乎是不可能的，因为它们都提供了各自的用户界面。要明确的是，有些情况下在不同的发行版上需要使用不同的命令来执行某些特定的任务，但是，基本来说它们的思路和目的是一致的。

在本文中，我们打算讨论Linux用户应当掌握的一些基本命令。我将给大家演示怎样使用命令行来更新系统、管理软件、操作文件以及切换到root，这些操作将在三个主要发行版上进行：Ubuntu（也包括其定制版和衍生版，还有Debian），openSUSE，以及Fedora。

*让我们开始吧！*

### 保持系统安全和最新 ###

Linux是基于安全设计的，但事实上是，任何软件都有缺陷，会导致安全漏洞。所以，保持你的系统更新到最新是十分重要的。这么想吧：运行过时的操作系统，就像是你坐在全副武装的坦克里头，而门却没有锁。武器会保护你吗？任何人都可以进入开放的大门，对你造成伤害。同样，在你的系统中也有没有打补丁的漏洞，这些漏洞会危害到你的系统。开源社区，不像专利世界，在漏洞补丁方面反应是相当快的，所以，如果你保持系统最新，你也获得了安全保证。

留意新闻站点，了解安全漏洞。如果发现了一个漏洞，了解它，然后在补丁出来的第一时间更新。不管怎样，在生产环境上，你每星期必须至少运行一次更新命令。如果你运行着一台复杂的服务器，那么就要额外当心了。仔细阅读变更日志，以确保更新不会搞坏你的自定义服务。

**Ubuntu**：牢记一点：你在升级系统或安装不管什么软件之前，都必须要刷新仓库（也就是repos）。在Ubuntu上，你可以使用下面的命令来更新系统，第一个命令用于刷新仓库：

    sudo apt-get update

仓库更新后，现在你可以运行系统更新命令了：

    sudo apt-get upgrade

然而，这个命令不会更新内核和其它一些包，所以你也必须要运行下面这个命令：

    sudo apt-get dist-upgrade

**openSUSE**：如果你是在openSUSE上，你可以使用以下命令来更新系统（照例，第一个命令的意思是更新仓库）：

    sudo zypper refresh
    sudo zypper up

**Fedora**：如果你是在Fedora上，你可以使用'dnf'命令，它是zypper和apt-get的'同类'：

    sudo dnf update
    sudo dnf upgrade

### 软件安装与移除 ###

你只可以安装那些你系统上启用的仓库中可用的包，各个发行版默认都附带有并启用了一些官方或者第三方仓库。

**Ubuntu**：要在Ubuntu上安装包，首先更新仓库，然后使用下面的语句：

    sudo apt-get install [package_name]

样例：

    sudo apt-get install gimp

**openSUSE**：命令是这样的：

    sudo zypper install [package_name]

**Fedora**：Fedora已经丢弃了'yum'，现在换成了'dnf'，所以命令是这样的：

    sudo dnf install [package_name]

移除软件的过程也一样，只要把'install'改成'remove'。

**Ubuntu**：

    sudo apt-get remove [package_name]

**openSUSE**：

    sudo zypper remove [package_name]

**Fedora**：

    sudo dnf remove [package_name]

### 如何管理第三方软件？ ###

在一个庞大的开发者社区中，这些开发者们为用户提供了许多的软件。不同的发行版有不同的机制来将这些第三方软件提供给用户。当然，同时也取决于开发者怎样将这些软件提供给用户，有些开发者会提供二进制包，而另外一些开发者则将软件发布到仓库中。

Ubuntu很多地方都用到PPA（个人包归档），但是，不幸的是，它却没有提供一个内建工具来帮助用于搜索这些PPA仓库。在安装软件前，你将需要通过Google搜索PPA，然后手工添加该仓库。下面就是添加PPA到系统的方法：

    sudo add-apt-repository ppa:<repository-name>

样例：比如说，我想要添加LibreOffice PPA到我的系统中。我应该Google该PPA，然后从Launchpad获得该仓库的名称，在本例中它是"libreoffice/ppa"。然后，使用下面的命令来添加该PPA：

    sudo add-apt-repository ppa:libreoffice/ppa

它会要你按下回车键来导入密钥。完成后，使用'update'命令来刷新仓库，然后安装该包。

openSUSE拥有一个针对第三方应用的优雅的解决方案。你可以访问software.opensuse.org，一键点击搜索并安装相应包，它会自动将对应的仓库添加到你的系统中。如果你想要手工添加仓库，可以使用该命令：

    sudo zypper ar -f url_of_the_repo name_of_repo
    sudo zypper ar -f http://download.opensuse.org/repositories/LibreOffice:Factory/openSUSE_13.2/LibreOffice:Factory.repo LOF

然后，刷新仓库并安装软件：

    sudo zypper refresh
    sudo zypper install libreoffice

Fedora用户只需要添加RPMFusion（包括自由软件和非自由软件仓库），该仓库包含了大量的应用。如果你需要添加该仓库，命令如下：

	dnf config-manager --add-repo http://www.example.com/example.repo

### 一些基本命令 ###

我已经写了一些关于使用CLI来管理你系统上的文件的[文章][1]，下面介绍一些基本命令，这些命令在所有发行版上都经常会用到。

拷贝文件或目录到一个新的位置：

    cp path_of_file_1 path_of_the_directory_where_you_want_to_copy/

将某个目录中的所有文件拷贝到一个新的位置（注意斜线和星号，它指的是该目录下的所有文件）：

    cp path_of_files/* path_of_the_directory_where_you_want_to_copy/

将一个文件从某个位置移动到另一个位置（尾斜杠是说放在该目录中）：

    mv path_of_file_1 path_of_the_directory_where_you_want_to_move/

将所有文件从一个位置移动到另一个位置：

    mv path_of_directory_where_files_are/* path_of_the_directory_where_you_want_to_move/

删除一个文件：

    rm path_of_file

删除一个目录：

    rm -r path_of_directory

移除目录中所有内容，完整保留目录文件夹：

    rm -r path_of_directory/*

### 创建新目录 ###

要创建一个新目录，首先进入到你要创建该目录的位置。比如说，你想要在你的Documents目录中创建一个名为'foundation'的文件夹。让我们使用 cd （即change directory，改变目录）命令来改变目录：

    cd /home/swapnil/Documents

（替换'swapnil'为你系统中的用户名）

然后，使用 mkdir 命令来创建该目录：

    mkdir foundation

你也可以从任何地方创建一个目录，通过指定该目录的路径即可。例如：

    mdkir /home/swapnil/Documents/foundation

如果你想要连父目录一起创建，那么可以使用 -p 选项。它会在指定路径中创建所有目录：

    mdkir -p /home/swapnil/Documents/linux/foundation

### 成为root ###

你或许需要成为root，或者具有sudo权力的用户，来实施一些管理任务，如管理软件包或者对根目录或其下的文件进行一些修改。其中一个例子就是编辑'fstab'文件，该文件记录了挂载的硬盘驱动器。它在'etc'目录中，而该目录又在根目录中，你只能作为超级用户来修改该文件。在大多数的发行版中，你可以通过'su'来成为root。比如说，在openSUSE上，我想要成为root，因为我要在根目录中工作，你可以使用下面的命令之一：

    sudo su -

或

    su -

该命令会要求输入密码，然后你就具有root特权了。记住一点：千万不要以root用户来运行系统，除非你知道你正在做什么。另外重要的一点需要注意的是，你以root什么对目录或文件进行修改后，会将它们的拥有关系从该用户或特定的服务改变为root。你必须恢复这些文件的拥有关系，否则该服务或用户就不能访问或写入到那些文件。要改变用户，命令如下：

    sudo chown -R 用户:组 文件或目录名

当你将其它发行版上的分区挂载到系统中时，你可能经常需要该操作。当你试着访问这些分区上的文件时，你可能会碰到权限拒绝错误，你只需要改变这些分区的拥有关系就可以访问它们了。需要额外当心的是，不要改变根目录的权限或者拥有关系。

这些就是Linux新手们需要的基本命令。如果你有任何问题，或者如果你想要我们涵盖一个特定的话题，请在下面的评论中告诉我们吧。

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/842251-must-know-linux-commands-for-new-users

作者：[Swapnil Bhartiya][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/61003
[1]:http://www.linux.com/learn/tutorials/828027-how-to-manage-your-files-from-the-command-line
