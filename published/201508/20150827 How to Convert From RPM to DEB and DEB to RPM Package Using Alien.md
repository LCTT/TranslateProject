Alien 魔法：RPM 和 DEB 互转
================================================================================

正如我确信，你们一定知道Linux下的多种软件安装方式：使用发行版所提供的包管理系统（[aptitude，yum，或者zypper][1]，还可以举很多例子），从源码编译（尽管现在很少用了，但在Linux发展早期却是唯一可用的方法），或者使用各自的低级工具dpkg用于.deb，以及rpm用于.rpm，预编译包，如此这般。

![Convert RPM to DEB and DEB to RPM](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-RPM-to-DEB-and-DEB-to-RPM.png)

*使用Alien将RPM转换成DEB以及将DEB转换成RPM*

在本文中，我们将为你介绍alien，一个用于在各种不同的Linux包格式相互转换的工具，其最常见的用法是将.rpm转换成.deb（或者反过来）。

如果你需要某个特定类型的包，而你只能找到其它格式的包的时候，该工具迟早能派得上用场——即使是其作者不再维护，并且在其网站声明：alien将可能永远维持在实验状态。

例如，有一次，我正查找一个用于喷墨打印机的.deb驱动，但是却没有找到——生产厂家只提供.rpm包，这时候alien拯救了我。我安装了alien，将包进行转换，不久之后我就可以使用我的打印机了，没有任何问题。

即便如此，我们也必须澄清一下，这个工具不应当用来转换重要的系统文件和库，因为它们在不同的发行版中有不同的配置。只有在前面说的那种情况下所建议的安装方法根本不适合时，alien才能作为最后手段使用。

最后一项要点是，我们必须注意，虽然我们在本文中使用CentOS和Debian，除了前两个发行版及其各自的家族体系外，据我们所知，alien可以工作在Slackware中，甚至Solaris中。

### 步骤1：安装Alien及其依赖包 ###

要安装alien到CentOS/RHEL 7中，你需要启用EPEL和Nux Dextop（是的，是Dextop——不是Desktop）仓库，顺序如下：

    # yum install epel-release

启用Nux Dextop仓库的包的当前最新版本是0.5（2015年8月10日发布），在安装之前你可以查看[http://li.nux.ro/download/nux/dextop/el7/x86_64/][2]上是否有更新的版本。

    # rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
    # rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

然后再做，

    # yum update && yum install alien

在Fedora中，你只需要运行上面的命令即可。

在Debian及其衍生版中，只需要：

    # aptitude install alien

### 步骤2：将.deb转换成.rpm包 ###

对于本次测试，我们选择了date工具，它提供了一系列日期和时间工具用于处理大量金融数据。我们将下载.deb包到我们的CentOS 7机器中，将它转换成.rpm并安装：

![Check CentOS Version](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Linux-OS-Version.png)

检查CentOS版本

    # cat /etc/centos-release
    # wget http://ftp.us.debian.org/debian/pool/main/d/dateutils/dateutils_0.3.1-1.1_amd64.deb
    # alien --to-rpm --scripts dateutils_0.3.1-1.1_amd64.deb

![Convert .deb to .rpm package in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-deb-to-rpm-package.png)

*在Linux中将.deb转换成.rpm*

**重要**：（请注意alien是怎样来增加目标包的次版本号的。如果你想要无视该行为，请添加-keep-version标识）。

如果我们尝试马上安装该包，我们将碰到些许问题：

    # rpm -Uvh dateutils-0.3.1-2.1.x86_64.rpm 

![Install RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Install-RPM-Package.png)

*安装RPM包*

要解决该问题，我们需要启用epel-testing仓库，然后安装rpmbuild工具来编辑该包的配置以重建包：

    # yum --enablerepo=epel-testing install rpmrebuild

然后运行，

    # rpmrebuild -pe dateutils-0.3.1-2.1.x86_64.rpm

它会打开你的默认文本编辑器。请转到`%files`章节并删除涉及到错误信息中提到的目录的行，然后保存文件并退出：

![Convert .deb to Alien Version](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-Deb-Package-to-Alien-Version.png)

*转换.deb到Alien版*

但你退出该文件后，将提示你继续去重构。如果你选择“Y”，该文件会重构到指定的目录（与当前工作目录不同）：

    # rpmrebuild –pe dateutils-0.3.1-2.1.x86_64.rpm

![Build RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Build-RPM-Package.png)

*构建RPM包*

现在你可以像以往一样继续来安装包并验证：

    # rpm -Uvh /root/rpmbuild/RPMS/x86_64/dateutils-0.3.1-2.1.x86_64.rpm
    # rpm -qa | grep dateutils

![Install Build RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Build-RPM-Package.png)

*安装构建RPM包*

最后，你可以列出date工具包含的各个工具，也可以查看各自的手册页：

    # ls -l /usr/bin | grep dateutils

![Verify Installed RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Verify-Installed-Package.png)

*验证安装的RPM包*

### 步骤3：将.rpm转换成.deb包 ###

在本节中，我们将演示如何将.rpm转换成.deb。在一台32位的Debian Wheezy机器中，让我们从CentOS 6操作系统仓库中下载用于zsh shell的.rpm包。注意，该shell在Debian及其衍生版的默认安装中是不可用的。

    # cat /etc/shells
    # lsb_release -a | tail -n 4

![Check Shell and Debian OS Version](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Shell-Debian-OS-Version.png)

*检查Shell和Debian操作系统版本*

    # wget http://mirror.centos.org/centos/6/os/i386/Packages/zsh-4.3.11-4.el6.centos.i686.rpm
    # alien --to-deb --scripts zsh-4.3.11-4.el6.centos.i686.rpm

你可以安全地无视关于签名丢失的信息：

![Convert .rpm to .deb Package](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-rpm-to-deb-Package.png)

*将.rpm转换成.deb包*

过了一会儿后，.deb包应该已经生成，并可以安装了：

    # dpkg -i zsh_4.3.11-5_i386.deb

![Install RPM Converted Deb Package](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Deb-Package.png)

*安装RPM转换来的Deb包*

安装完后，你看看可以zsh是否添加到了合法shell列表中：

    # cat /etc/shells

![Confirm Installed Zsh Package](http://www.tecmint.com/wp-content/uploads/2015/08/Confirm-Installed-Package.png)

*确认安装的Zsh包*

### 小结 ###

在本文中，我们已经解释了如何将.rpm转换成.deb及其反向转换，这可以作为这类程序不能从仓库中或者作为可分发源代码获得的最后安装手段。你一定想要将本文添加到书签中，因为我们都需要alien。

请自由分享你关于本文的想法，写到下面的表单中吧。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/convert-from-rpm-to-deb-and-deb-to-rpm-package-using-alien/

作者：[Gabriel Cánepa][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/linux-package-management/
[2]:http://li.nux.ro/download/nux/dextop/el7/x86_64/
