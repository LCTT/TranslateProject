
如何在CentOS 5/6上安装EPEL 源
================================================================================
（ps:这篇翻得很吃力，麻烦校对大人了 ToT）
（ps2:原文第五个链接失效，已修正）
EPEL 是什么？

EPEL (Extra Packages for Enterprise Linux) 是Fedora 小组维护的一个项目。这个项目是一个软件仓库，为RHEL/CentOS 提供他们所不默认提供的软件包。这个源兼容RHEL 和像CentOS 和Scientific Linux 这样所有由其衍生出来的版本。

我们可以轻易地通过yum 命令从EPEL 源上获取上万个在CentOS 自带源上没有的软件。EPEL 提供的软件包大多基于Fedora ，不会与企业版Linux 发行版本的软件发生冲突或互相替换文件。

更多关于EPEL 项目的细节可以到以下网站获取。

[https://fedoraproject.org/wiki/EPEL][1]

在文本中，我将展示在CentOS 下如何安装EPEL 源

> 提示 - RHEL/CentOS 系统有着太多的第三方源，比较流行的比如RpmForge， RpmFusion， EPEL， Remi等等。
> 
> 然而需要时刻注意的是，如果系统添加了多个第三方源，可能会因此产生冲突——一个软件包从多个源获取，一些源会替换系统的基础软件包可能会产生意想不到的错误。已知的就有Rpmforge 与EPEL 会产生冲突。 
> 
> 
> 对于这些问题我们建议，调整源的优先权或者有选择性的安装源，但是这需要复杂的操作，如果你不确定如何操作，我们推荐你只安装一个第三方源。

### 在CentOS 上安装EPEL ###

要想安装EPEL，我们先要下载EPEL 的rpm安装包。
CentOS/RHEL 下的6.x 和5.x 版本下载页面如下

[http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html][2]
[http://download.fedoraproject.org/pub/epel/5/i386/repoview/epel-release.html][3]

以上网址可能会为了获取更快的下载速度，被重定向到特地的镜像站。这页面包含可以直接获取到rpm 包的下载链接。直接的下载链接如下

[http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm][4]
[http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm][5]

根据你的CentOS 版本来选择正确的下载地址。
请注意EPEL 的安装包是独立编译的，所以它可以安装在32位和64位系统中。

### 1. 确认你的CentOS 的版本 ###

首先通过以下命令确认你的CentOS 版本


    $ cat /etc/redhat-release 
    CentOS release 6.4 (Final)

### 2. 下载EPEL 的rpm 安装包 ###

现在从上面的地址下载CentOS 版本所对应的EPEL 的版本

    $ wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

### 3. 安装EPEL ###

通过以下命令安装EPEL 软件包

    $ sudo rpm -ivh epel-release-6-8.noarch.rpm
    or
    $ sudo rpm -ivh epel-release*

### 5. 检查EPEL 源 ###

安装好EPEL 源后，用yum 命令来检查是否添加到源列表

    # yum repolist
    Loaded plugins: fastestmirror
    Loading mirror speeds from cached hostfile
     * base: mirrors.vonline.vn
     * epel: buaya.klas.or.id
     * extras: centos-hn.viettelidc.com.vn
     * updates: mirrors.fibo.vn
    repo id        repo name                                              status
    base           CentOS-6 - Base                                         6,381
    epel           Extra Packages for Enterprise Linux 6 - x86_64         10,023
    extras         CentOS-6 - Extras                                          13
    nginx          nginx repo                                                 47
    updates        CentOS-6 - Updates                                      1,555
    repolist: 18,019

EPEL 已经在repo 后列出，并且显示提供了上万个软件包，所以EPEL 已经安装到你的CentOS了。
EPEL 源已经安装到**/etc/yum.repos.d/epel.repo** 文件。

现在来试一下从EPEL 获取软件包

    $ sudo yum install htop

--------------------------------------------------------------------------------

via: http://www.binarytides.com/setup-epel-repository-centos/

译者：[NearTan](https://github.com/NearTan) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://fedoraproject.org/wiki/EPEL
[2]:http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html
[3]:http://download.fedoraproject.org/pub/epel/5/i386/repoview/epel-release.html
[4]:http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
[5]:http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm