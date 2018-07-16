如何在CentOS 5/6上安装EPEL 源
================================================================================

EPEL 是什么？

EPEL (Extra Packages for Enterprise Linux，企业版Linux的额外软件包) 是Fedora小组维护的一个软件仓库项目，为RHEL/CentOS提供他们默认不提供的软件包。这个源兼容RHEL及像CentOS和Scientific Linux这样的衍生版本。

我们可以很容易地通过yum命令从EPEL源上获取上万个在CentOS自带源上没有的软件。EPEL提供的软件包大多基于其对应的Fedora软件包，不会与企业版Linux发行版本的软件发生冲突或替换其文件。

更多关于EPEL 项目的细节可以到以下网站获取：[https://fedoraproject.org/wiki/EPEL][1]

在文本中，我将展示在CentOS下如何安装EPEL源

> 提示 - RHEL/CentOS系统有许多第三方源，比较流行的比如RpmForge，RpmFusion，EPEL，Remi等等。
> 
> 然而需要引起注意的是，如果系统添加了多个第三方源，可能会因此产生冲突——一个软件包可以从多个源获取，一些源会替换系统的基础软件包，从而可能会产生意想不到的错误。已知的就有Rpmforge与EPEL会产生冲突。 
> 
> 对于这些问题我们建议，调整源的优先权或者有选择性的安装源，但是这需要复杂的操作，如果你不确定如何操作，我们推荐你只安装一个第三方源。

## 在CentOS 上安装EPEL ##

要想安装EPEL，我们先要下载EPEL的rpm安装包。

CentOS/RHEL下的6.x和5.x版本下载页面如下

[http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html][2]
[http://download.fedoraproject.org/pub/epel/5/i386/repoview/epel-release.html][3]

以上网址可能会被重定向到特定的镜像站而加快下载速度。这个页面包含可以直接获取到rpm包的下载链接。直接的下载链接如下：

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

或

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

EPEL已经在repo 后列出，并且显示提供了上万个软件包，所以EPEL 已经安装到你的CentOS了。

EPEL源的配置安装到了 **/etc/yum.repos.d/epel.repo** 文件。

现在来试一下从EPEL 获取软件包

    $ sudo yum install htop

--------------------------------------------------------------------------------

via: http://www.binarytides.com/setup-epel-repository-centos/

译者：[NearTan](https://github.com/NearTan) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://fedoraproject.org/wiki/EPEL
[2]:http://download.fedoraproject.org/pub/epel/6/i386/repoview/epel-release.html
[3]:http://download.fedoraproject.org/pub/epel/5/i386/repoview/epel-release.html
[4]:http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
[5]:http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm