在红帽Linux中使用YUM包管理器
===
![](http://linoxide.com/wp-content/uploads/2013/11/yum-package-install.png)

**YUM**是RHEL系统中提供的一个安装，卸载和搜索软件包的工具。它能做的不仅仅是安装、卸载软件包，它能做的还有更多，下面我们将在本文中为你展示。

YUM可以自动安装软件包的依赖包，例如当你使用yum安装httpd时，它还会自动安装https apache server以及它依赖的软件包。通过rpm软件包安装时就没有这么方便咯（译注：就是不会自动处理软件包依赖问题咯！），你必须下载所有它依赖的软件包，然后依序安装它们。

yum工具从远端服务器上的软件仓库（通常由OS提供商提供）获取软件包的信息。一个软件仓库是能在特定架构上运行的一系列rpm软件包的集合。例如，对于32位和64位系统各有一个软件仓库，还有针对RHEL5以及RHEL6的软件仓库。你也可以建立一个本地仓库，配置你的yum让其从你的本地仓库里搜索安装软件包。在接下来的例子中，我将向你展示除了安装和卸载软件，yum还可以做的其它事情。为方便理解，我将在我的Amazon EC2 RHEL 6.4服务器上使用httpd软件包为例。

###从软件仓库里搜索软件包
	# yum search httpd

	Loaded plugins: amazon-id, rhui-lb, security
    =============================================== N/S Matched: httpd ==========
    httpd.x86_64 : Apache HTTP Server
    httpd-devel.i686 : Development interfaces for the Apache HTTP server
    httpd-devel.x86_64 : Development interfaces for the Apache HTTP server
    httpd-manual.noarch : Documentation for the Apache HTTP server
    httpd-tools.x86_64 : Tools for use with the Apache HTTP Server
    mod_dav_svn.x86_64 : Apache httpd module for Subversion server
    mod_dnssd.x86_64 : An Apache HTTPD module which adds Zeroconf support

想获得详细的输出信息，可以使用下面的命令：
	
	# yum provides httpd

	Loaded plugins: amazon-id, rhui-lb, security
    httpd-2.2.15-26.el6.x86_64 : Apache HTTP Server
    Repo : rhui-REGION-rhel-server-releases
    Matched from:

**yum provides httpd**在软件仓库里搜索含有httpd的软件包。

###提供所有软件组列表

	# yum grouplist

以上命令将为你显示已经安装的以及可用的软件组。你可以使用软件组安装选项来安装其中一个软件组。例如，我们将安装一个PHP Support的软件组。这个软件组内包含需要的PHP软件包。

	# yum groupinstall PHP Support
    
    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    Setting up Group Process
    Warning: Group Support does not exist.
    Resolving Dependencies
    -> Running transaction check
    --> Package php.x86_64 0:5.3.3-23.el6_4 will be installed
    -> Processing Dependency: php-common(x86-64) = 5.3.3-23.el6_4 for package: php-5.3.3-23.el6_4.x86_64
    -> Processing Dependency: php-cli(x86-64) = 5.3.3-23.el6_4 for package: php-5.3.3-23.el6_4.x86_64
    --> Package php-gd.x86_64 0:5.3.3-23.el6_4 will be installed
    -> Processing Dependency: libXpm.so.4()(64bit) for package: php-gd-5.3.3-23.el6_4.x86_64
    --> Package php-pdo.x86_64 0:5.3.3-23.el6_4 will be installed
    --> Package php-pear.noarch 1:1.9.4-4.el6 will be installed
    --> Package php-xml.x86_64 0:5.3.3-23.el6_4 will be installed
    -> Running transaction check
    --> Package libXpm.x86_64 0:3.5.10-2.el6 will be installed
    --> Package php-cli.x86_64 0:5.3.3-23.el6_4 will be installed
    --> Package php-common.x86_64 0:5.3.3-23.el6_4 will be installed
    -> Finished Dependency Resolution
    
    Dependencies Resolved
    
    =====================================================================
    Package Arch Version Repository Size
    =====================================================================
    Installing:
    php x86_64 5.3.3-23.el6_4 rhui-REGION-rhel-server-releases 1.1 M
    php-gd x86_64 5.3.3-23.el6_4 rhui-REGION-rhel-server-releases 106 k
    php-pdo x86_64 5.3.3-23.el6_4 rhui-REGION-rhel-server-releases 75 k
    php-pear noarch 1:1.9.4-4.el6 rhui-REGION-rhel-server-releases 393 k
    php-xml x86_64 5.3.3-23.el6_4 rhui-REGION-rhel-server-releases 103 k
    Installing for dependencies:
    libXpm x86_64 3.5.10-2.el6 rhui-REGION-rhel-server-releases 51 k
    php-cli x86_64 5.3.3-23.el6_4 rhui-REGION-rhel-server-releases 2.2 M
    php-common x86_64 5.3.3-23.el6_4 rhui-REGION-rhel-server-releases 524 k
    
    Transaction Summary
    ========================================================================
    Install 8 Package(s)
    
    Total download size: 4.5 M
    Installed size: 16 M
    Is this ok [y/N]: y
    
    Downloading Packages:
    (1/8): libXpm-3.5.10-2.el6.x86_64.rpm | 51 kB 00:00
    (2/8): php-5.3.3-23.el6_4.x86_64.rpm | 1.1 MB 00:00
    (3/8): php-cli-5.3.3-23.el6_4.x86_64.rpm | 2.2 MB 00:00
    (4/8): php-common-5.3.3-23.el6_4.x86_64.rpm | 524 kB 00:00
    (5/8): php-gd-5.3.3-23.el6_4.x86_64.rpm | 106 kB 00:00
    (6/8): php-pdo-5.3.3-23.el6_4.x86_64.rpm | 75 kB 00:00
    (7/8): php-pear-1.9.4-4.el6.noarch.rpm | 393 kB 00:00
    (8/8): php-xml-5.3.3-23.el6_4.x86_64.rpm | 103 kB 00:00
    -----------------------------------------------
    Total 2.9 MB/s | 4.5 MB 00:01
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
    Installing : php-common-5.3.3-23.el6_4.x86_64 1/8
    Installing : php-cli-5.3.3-23.el6_4.x86_64 2/8
    Installing : libXpm-3.5.10-2.el6.x86_64 3/8
    Installing : php-gd-5.3.3-23.el6_4.x86_64 4/8
    Installing : 1:php-pear-1.9.4-4.el6.noarch 5/8
    Installing : php-5.3.3-23.el6_4.x86_64 6/8
    Installing : php-xml-5.3.3-23.el6_4.x86_64 7/8
    Installing : php-pdo-5.3.3-23.el6_4.x86_64 8/8
    Verifying : 1:php-pear-1.9.4-4.el6.noarch 1/8
    Verifying : php-xml-5.3.3-23.el6_4.x86_64 2/8
    Verifying : php-common-5.3.3-23.el6_4.x86_64 3/8
    Verifying : libXpm-3.5.10-2.el6.x86_64 4/8
    Verifying : php-cli-5.3.3-23.el6_4.x86_64 5/8
    Verifying : php-5.3.3-23.el6_4.x86_64 6/8
    Verifying : php-pdo-5.3.3-23.el6_4.x86_64 7/8
    Verifying : php-gd-5.3.3-23.el6_4.x86_64 8/8
    
    Installed:
    php.x86_64 0:5.3.3-23.el6_4 php-gd.x86_64 0:5.3.3-23.el6_4 php-pdo.x86_64 0:5.3.3-23.el6_4
    php-pear.noarch 1:1.9.4-4.el6 php-xml.x86_64 0:5.3.3-23.el6_4
    
    Dependency Installed:
    libXpm.x86_64 0:3.5.10-2.el6 php-cli.x86_64 0:5.3.3-23.el6_4 php-common.x86_64 0:5.3.3-23.el6_4
    
    Complete!

###使用YUM安装软件包

可以使用**yum install**命令安装软件包，如下所示：

    #  yum install httpd
    
    Loaded plugins: amazon-id, rhui-lb, security
    Setting up Install Process
    Resolving Dependencies
    -> Running transaction check
    --> Package httpd.x86_64 0:2.2.15-29.el6_4 will be installed
    -> Processing Dependency: httpd-tools = 2.2.15-29.el6_4 for package: httpd-2.2.15-29.el6_4.x86_64
    -> Processing Dependency: apr-util-ldap for package: httpd-2.2.15-29.el6_4.x86_64
    -> Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.2.15-29.el6_4.x86_64
    -> Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.2.15-29.el6_4.x86_64
    -> Running transaction check
    --> Package apr.x86_64 0:1.3.9-5.el6_2 will be installed
    --> Package apr-util.x86_64 0:1.3.9-3.el6_0.1 will be installed
    --> Package apr-util-ldap.x86_64 0:1.3.9-3.el6_0.1 will be installed
    --> Package httpd-tools.x86_64 0:2.2.15-29.el6_4 will be installed
    -> Finished Dependency Resolution
    
    Dependencies Resolved
    
    =============================================================================
    Package Arch Version Repository Size
    =============================================================================
    Installing:
    httpd x86_64 2.2.15-29.el6_4 rhui-REGION-rhel-server-releases 821 k
    Installing for dependencies:
    apr x86_64 1.3.9-5.el6_2 rhui-REGION-rhel-server-releases 123 k
    apr-util x86_64 1.3.9-3.el6_0.1 rhui-REGION-rhel-server-releases 87 k
    apr-util-ldap x86_64 1.3.9-3.el6_0.1 rhui-REGION-rhel-server-releases 15 k
    httpd-tools x86_64 2.2.15-29.el6_4 rhui-REGION-rhel-server-releases 73 k
    
    Transaction Summary
    ==============================================================================
    Install 5 Package(s)
    
    Total download size: 1.1 M
    Installed size: 3.6 M
    Is this ok [y/N]: y

如你所见，在安装httpd时yum安装了额外的软件包。这称为yum完成的依赖包解析。

假如你不想让yum弹出[y/N]选项，可以使用**yum install -y httpd**

####使用yum update 命令更新一个已存在的软件包

    # yum update httpd
    Loaded plugins: amazon-id, rhui-lb, security
    Setting up Update Process
    No Packages marked for Update

这意味着你系统中安装的httpd软件包已经是yum软件仓库里的最新版本的了。

####更新服务器上所有的软件包

	# yum update

以上命令将系统上的所有软件包更新到最新版本，包括内核软件包，这意味着你的OS更新到了RHEL提供的最新版本了。

###下载RPM软件包但是不安装

可以使用yum从RHEL或者CentOS的软件仓库里下载RPM软件包但是不安装。你首先需要下载一个插件让yum只下载rpm软件包而不安装。插件名字叫downloadonly，可以通过yum安装，如下所示：

    # yum install yum-downloadonly
    Loaded plugins: amazon-id, rhui-lb, security
    Setting up Install Process
    Resolving Dependencies
    -> Running transaction check
    --> Package yum-plugin-downloadonly.noarch 0:1.1.30-14.el6 will be installed
    -> Finished Dependency Resolution
    
    Dependencies Resolved
    
    ===========================================================================
    Package Arch Version Repository Size
    ===========================================================================
    Installing:
    yum-plugin-downloadonly noarch 1.1.30-14.el6 rhui-REGION-rhel-server-releases 20 k
    
    Transaction Summary
    ===========================================================================
    Install 1 Package(s)
    
    Total download size: 20 k
    Installed size: 21 k
    Is this ok [y/N]: y
    Downloading Packages:
    yum-plugin-downloadonly-1.1.30-14.el6.noarch.rpm | 20 kB 00:00
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
    Installing : yum-plugin-downloadonly-1.1.30-14.el6.noarch 1/1
    Verifying : yum-plugin-downloadonly-1.1.30-14.el6.noarch 1/1
    
    Installed:
    yum-plugin-downloadonly.noarch 0:1.1.30-14.el6
    
    Complete!

现在你就可以从软件仓库里只下载软件包而不安装了，命令如下：

	# yum install httpd-devel -downloadonly

默认情况下软件包会被下载到**/var/cache/yum/<arch\>**目录，但是你可以添加额外选项将其下载到指定位置

	# yum install httpd-devel -downloadonly -downloaddir=/opt

假如你有一个rpm软件包但是没有它所依赖的软件包，你不知道到哪去得到它所依赖的软件包。你仍然可以通过yum安装这个rpm软件包，并从软件仓库里得到它所依赖的软件包。让我们安装刚刚下载的httpd-devel-2.2.15-29.el6_4.x86_64 RPM软件包。

	# yum localinstall /opt/httpd-devel-2.2.15-29.el6_4.x86_64.rpm

	Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    Setting up Local Package Process
    Examining /opt/httpd-devel-2.2.15-29.el6_4.x86_64.rpm: httpd-devel-2.2.15-29.el6_4.x86_64
    Marking /opt/httpd-devel-2.2.15-29.el6_4.x86_64.rpm to be installed
    Resolving Dependencies
    -> Running transaction check
    --> Package httpd-devel.x86_64 0:2.2.15-29.el6_4 will be installed
    -> Processing Dependency: apr-devel for package: httpd-devel-2.2.15-29.el6_4.x86_64
    -> Processing Dependency: apr-util-devel for package: httpd-devel-2.2.15-29.el6_4.x86_64
    -> Running transaction check
    --> Package apr-devel.x86_64 0:1.3.9-5.el6_2 will be installed
    --> Package apr-util-devel.x86_64 0:1.3.9-3.el6_0.1 will be installed
    -> Processing Dependency: openldap-devel for package: apr-util-devel-1.3.9-3.el6_0.1.x86_64
    -> Processing Dependency: expat-devel for package: apr-util-devel-1.3.9-3.el6_0.1.x86_64
    -> Processing Dependency: db4-devel for package: apr-util-devel-1.3.9-3.el6_0.1.x86_64
    -> Running transaction check
    --> Package db4-devel.x86_64 0:4.7.25-18.el6_4 will be installed
    -> Processing Dependency: db4-cxx = 4.7.25-18.el6_4 for package: db4-devel-4.7.25-18.el6_4.x86_64
    -> Processing Dependency: db4 = 4.7.25-18.el6_4 for package: db4-devel-4.7.25-18.el6_4.x86_64
    -> Processing Dependency: libdb_cxx-4.7.so()(64bit) for package: db4-devel-4.7.25-18.el6_4.x86_64
    --> Package expat-devel.x86_64 0:2.0.1-11.el6_2 will be installed
    --> Package openldap-devel.x86_64 0:2.4.23-32.el6_4.1 will be installed
    -> Processing Dependency: cyrus-sasl-devel >= 2.1 for package: openldap-devel-2.4.23-32.el6_4.1.x86_64
    -> Running transaction check
    --> Package cyrus-sasl-devel.x86_64 0:2.1.23-13.el6_3.1 will be installed
    --> Package db4.x86_64 0:4.7.25-17.el6 will be updated
    -> Processing Dependency: db4 = 4.7.25-17.el6 for package: db4-utils-4.7.25-17.el6.x86_64
    --> Package db4.x86_64 0:4.7.25-18.el6_4 will be an update
    --> Package db4-cxx.x86_64 0:4.7.25-18.el6_4 will be installed
    -> Running transaction check
    --> Package db4-utils.x86_64 0:4.7.25-17.el6 will be updated
    --> Package db4-utils.x86_64 0:4.7.25-18.el6_4 will be an update
    -> Finished Dependency Resolution
    
    Dependencies Resolved
    
    =============================================================================
    Package Arch Version Repository Size
    =============================================================================
    Installing:
    httpd-devel x86_64 2.2.15-29.el6_4 /httpd-devel-2.2.15-29.el6_4.x86_64 526 k
    Installing for dependencies:
    apr-devel x86_64 1.3.9-5.el6_2 rhui-REGION-rhel-server-releases 176 k
    apr-util-devel x86_64 1.3.9-3.el6_0.1 rhui-REGION-rhel-server-releases 69 k
    cyrus-sasl-devel x86_64 2.1.23-13.el6_3.1 rhui-REGION-rhel-server-releases 302 k
    db4-cxx x86_64 4.7.25-18.el6_4 rhui-REGION-rhel-server-releases 588 k
    db4-devel x86_64 4.7.25-18.el6_4 rhui-REGION-rhel-server-releases 6.6 M
    expat-devel x86_64 2.0.1-11.el6_2 rhui-REGION-rhel-server-releases 120 k
    openldap-devel x86_64 2.4.23-32.el6_4.1 rhui-REGION-rhel-server-releases 1.1 M
    Updating for dependencies:
    db4 x86_64 4.7.25-18.el6_4 rhui-REGION-rhel-server-releases 563 k
    db4-utils x86_64 4.7.25-18.el6_4 rhui-REGION-rhel-server-releases 130 k
    
    Transaction Summary
    =======================================================================
    Install 8 Package(s)
    Upgrade 2 Package(s)
    
    Total size: 10 M
    Is this ok [y/N]: y
    Downloading Packages:
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
    Updating : db4-4.7.25-18.el6_4.x86_64 1/12
    Installing : apr-devel-1.3.9-5.el6_2.x86_64 2/12
    Installing : expat-devel-2.0.1-11.el6_2.x86_64 3/12
    Installing : db4-cxx-4.7.25-18.el6_4.x86_64 4/12
    Installing : db4-devel-4.7.25-18.el6_4.x86_64 5/12
    Installing : cyrus-sasl-devel-2.1.23-13.el6_3.1.x86_64 6/12
    Installing : openldap-devel-2.4.23-32.el6_4.1.x86_64 7/12
    Installing : apr-util-devel-1.3.9-3.el6_0.1.x86_64 8/12
    Installing : httpd-devel-2.2.15-29.el6_4.x86_64 9/12
    Updating : db4-utils-4.7.25-18.el6_4.x86_64 10/12
    Cleanup : db4-utils-4.7.25-17.el6.x86_64 11/12
    Cleanup : db4-4.7.25-17.el6.x86_64 12/12
    Verifying : apr-devel-1.3.9-5.el6_2.x86_64 1/12
    Verifying : cyrus-sasl-devel-2.1.23-13.el6_3.1.x86_64 2/12
    Verifying : apr-util-devel-1.3.9-3.el6_0.1.x86_64 3/12
    Verifying : db4-cxx-4.7.25-18.el6_4.x86_64 4/12
    Verifying : httpd-devel-2.2.15-29.el6_4.x86_64 5/12
    Verifying : openldap-devel-2.4.23-32.el6_4.1.x86_64 6/12
    Verifying : expat-devel-2.0.1-11.el6_2.x86_64 7/12
    Verifying : db4-devel-4.7.25-18.el6_4.x86_64 8/12
    Verifying : db4-4.7.25-18.el6_4.x86_64 9/12
    Verifying : db4-utils-4.7.25-18.el6_4.x86_64 10/12
    Verifying : db4-4.7.25-17.el6.x86_64 11/12
    Verifying : db4-utils-4.7.25-17.el6.x86_64 12/12
    
    Installed:
    httpd-devel.x86_64 0:2.2.15-29.el6_4
    
    Dependency Installed:
    apr-devel.x86_64 0:1.3.9-5.el6_2 apr-util-devel.x86_64 0:1.3.9-3.el6_0.1
    cyrus-sasl-devel.x86_64 0:2.1.23-13.el6_3.1 db4-cxx.x86_64 0:4.7.25-18.el6_4
    db4-devel.x86_64 0:4.7.25-18.el6_4 expat-devel.x86_64 0:2.0.1-11.el6_2
    openldap-devel.x86_64 0:2.4.23-32.el6_4.1
    
    Dependency Updated:
    db4.x86_64 0:4.7.25-18.el6_4 db4-utils.x86_64 0:4.7.25-18.el6_4
    
    Complete!

###使用yum卸载软件包

使用 **yum remove** 卸载软件包。举例如下：

	# yum remove httpd
    Failed to set locale, defaulting to C
    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    Setting up Remove Process
    Resolving Dependencies
    -> Running transaction check
    --> Package httpd.x86_64 0:2.2.15-29.el6_4 will be erased
    -> Processing Dependency: httpd-mmn = 20051115 for package: php-5.3.3-23.el6_4.x86_64
    -> Processing Dependency: httpd = 2.2.15-29.el6_4 for package: httpd-devel-2.2.15-29.el6_4.x86_64
    -> Running transaction check
    --> Package httpd-devel.x86_64 0:2.2.15-29.el6_4 will be erased
    --> Package php.x86_64 0:5.3.3-23.el6_4 will be erased
    -> Finished Dependency Resolution
    
    Dependencies Resolved
    
    ========================================================================
    Package Arch Version Repository Size
    ========================================================================
    Removing:
    httpd x86_64 2.2.15-29.el6_4 @rhui-REGION-rhel-server-releases 2.9 M
    Removing for dependencies:
    httpd-devel x86_64 2.2.15-29.el6_4 @/httpd-devel-2.2.15-29.el6_4.x86_64 526 k
    php x86_64 5.3.3-23.el6_4 @rhui-REGION-rhel-server-releases 3.5 M
    
    Transaction Summary
    ==========================================================================
    Remove 3 Package(s)
    
    Installed size: 7.0 M
    Is this ok [y/N]: y
    Downloading Packages:
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
    Erasing : httpd-devel-2.2.15-29.el6_4.x86_64 1/3
    Erasing : php-5.3.3-23.el6_4.x86_64 2/3
    Erasing : httpd-2.2.15-29.el6_4.x86_64 3/3
    Verifying : httpd-2.2.15-29.el6_4.x86_64 1/3
    Verifying : httpd-devel-2.2.15-29.el6_4.x86_64 2/3
    Verifying : php-5.3.3-23.el6_4.x86_64 3/3
    
    Removed:
    httpd.x86_64 0:2.2.15-29.el6_4
    
    Dependency Removed:
    httpd-devel.x86_64 0:2.2.15-29.el6_4 php.x86_64 0:5.3.3-23.el6_4
    
    Complete!

###列出所有安装的软件包

假如你要列出你系统上安装的所有软件包，你可以使用**yum list installed**命令。这条命令结合grep命令是非常有用的，可以用来检查某个特定的软件包是否已被安装。这与使用rpm -qa命令询问已经安装的软件包相似。

    # yum list installed
    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    Installed Packages
    ConsoleKit.x86_64 0.4.1-3.el6 @koji-override-0/$releasever
    ConsoleKit-libs.x86_64 0.4.1-3.el6 @koji-override-0/$releasever
    MAKEDEV.x86_64 3.24-6.el6 @koji-override-0/$releasever
    PyYAML.x86_64 3.10-3.1.el6 @koji-override-0/$releasever
    Red_Hat_Enterprise_Linux-Release_Notes-6-en-US.noarch
    4-2.el6 @koji-override-0/$releasever
    SDL.x86_64 1.2.14-3.el6 @koji-override-0/$releasever
    abrt.x86_64 2.0.8-15.el6 @koji-override-0/$releasever
    abrt-addon-ccpp.x86_64 2.0.8-15.el6 @koji-override-0/$releasever
    abrt-addon-kerneloops.x86_64 2.0.8-15.el6 @koji-override-0/$releasever
    abrt-addon-python.x86_64 2.0.8-15.el6 @koji-override-0/$releasever
    abrt-cli.x86_64 2.0.8-15.el6 @koji-override-0/$releasever
    abrt-libs.x86_64 2.0.8-15.el6 @koji-override-0/$releasever
    abrt-tui.x86_64 2.0.8-15.el6 @koji-override-0/$releasever
    acl.x86_64 2.2.49-6.el6 @koji-override-0/$releasever
    acpid.x86_64 1.0.10-2.1.el6 @koji-override-0/$releasever
    aic94xx-firmware.noarch 30-2.el6 @koji-override-0/$releasever
    .
    .
    Output Truncated.

###列出可用的软件库，通过它们可以查询、安装和更新软件包

	# yum repolist

    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    repo id repo name status
    rhui-REGION-client-config-server-6 Red Hat Update Infrastructure 2.0 Client Configuration Server 6 4
    rhui-REGION-rhel-server-releases Red Hat Enterprise Linux Server 6 (RPMs) 10994
    rhui-REGION-rhel-server-releases-optional Red Hat Enterprise Linux Server 6 Optional (RPMs) 6250
    repolist: 17248

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/package-management-yum-redhat-linux/

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出