Package Management Using YUM In Red Hat Linux
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/yum-package-install.png)

**Yum** is a utility provided in RHEL based systems to install,remove and search packages. It can do lot more than just installing and removing and that’s what I will demonstrate in this article.

Yum installs the package dependencies automatically, for example yum install httpd will install https apache server and it’s required dependencies automatically. Something that is not that easy while installing through rpm. with rpm you have to download all the required dependencies and then install accordingly.

The yum utility fetches the package information from a hosted repository (usually by the OS vendor). A repository is basically a collection of rpm’s that are supposed to work on a particular architecture. For example there would be a separate repository for 32 and 64 bit systems, and same goes with RHEL Version 5 and Version 6. You can host your local repository and configure yum to search,install packages from the local repository. In the following examples I will show you some other stuff we can do with yum rather than install and remove but for the sake of understanding I will use httpd package for exempts on my Amazon EC2 RHEL 6.4 server.

### Search package from repository ###

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

For a more detailed output use the below command:

    # yum provides httpd
    
    Loaded plugins: amazon-id, rhui-lb, security
    httpd-2.2.15-26.el6.x86_64 : Apache HTTP Server
    Repo : rhui-REGION-rhel-server-releases
    Matched from:

**yum provides */httpd** Searches in yum packages to find the package that contains a httpd.
 
### Provide a list of all Package Groups. ###

    # yum grouplist

The above command will show you the installed and available package group. You can install an individual package group with group install option. For example we will install package group PHP Support. This package group contains the required php packages.

    # yum groupinstall PHP Support
    
    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    Setting up Group Process
    Warning: Group Support does not exist.
    Resolving Dependencies
    –> Running transaction check
    —> Package php.x86_64 0:5.3.3-23.el6_4 will be installed
    –> Processing Dependency: php-common(x86-64) = 5.3.3-23.el6_4 for package: php-5.3.3-23.el6_4.x86_64
    –> Processing Dependency: php-cli(x86-64) = 5.3.3-23.el6_4 for package: php-5.3.3-23.el6_4.x86_64
    —> Package php-gd.x86_64 0:5.3.3-23.el6_4 will be installed
    –> Processing Dependency: libXpm.so.4()(64bit) for package: php-gd-5.3.3-23.el6_4.x86_64
    —> Package php-pdo.x86_64 0:5.3.3-23.el6_4 will be installed
    —> Package php-pear.noarch 1:1.9.4-4.el6 will be installed
    —> Package php-xml.x86_64 0:5.3.3-23.el6_4 will be installed
    –> Running transaction check
    —> Package libXpm.x86_64 0:3.5.10-2.el6 will be installed
    —> Package php-cli.x86_64 0:5.3.3-23.el6_4 will be installed
    —> Package php-common.x86_64 0:5.3.3-23.el6_4 will be installed
    –> Finished Dependency Resolution
    
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
    ———————————————————————-
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

### Install package using YUM ###

A package can be installed using yum install command as below:

    #  yum install httpd
    
    Loaded plugins: amazon-id, rhui-lb, security
    Setting up Install Process
    Resolving Dependencies
    –> Running transaction check
    —> Package httpd.x86_64 0:2.2.15-29.el6_4 will be installed
    –> Processing Dependency: httpd-tools = 2.2.15-29.el6_4 for package: httpd-2.2.15-29.el6_4.x86_64
    –> Processing Dependency: apr-util-ldap for package: httpd-2.2.15-29.el6_4.x86_64
    –> Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.2.15-29.el6_4.x86_64
    –> Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.2.15-29.el6_4.x86_64
    –> Running transaction check
    —> Package apr.x86_64 0:1.3.9-5.el6_2 will be installed
    —> Package apr-util.x86_64 0:1.3.9-3.el6_0.1 will be installed
    —> Package apr-util-ldap.x86_64 0:1.3.9-3.el6_0.1 will be installed
    —> Package httpd-tools.x86_64 0:2.2.15-29.el6_4 will be installed
    –> Finished Dependency Resolution
    
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

As you can see yum added additional packages with httpd installation. This is called the dependency resolution done by yum.

If you want yum not to prompt for the [y/N] option. Use **yum install -y httpd**

**Update an existing package using yum update command.**

    # yum update httpd
    Loaded plugins: amazon-id, rhui-lb, security
    Setting up Update Process
    No Packages marked for Update

That means the httpd package is the latest version in the yum’s repository.

**Update all packages on the server.**

    # yum update

the above command will update all the packages including kernel package to the latest version that means your OS will be updated to the latest provided by RHEL.

### Download RPM without installing ### 

Use yum to download RPM package from RHN or CentOS repository without installing it. You have to install a plugin for yum first to have yum download the rpm only. The utility name is yum-downloadonly and can be installed through yum as below:

    # yum install yum-downloadonly
    Loaded plugins: amazon-id, rhui-lb, security
    Setting up Install Process
    Resolving Dependencies
    –> Running transaction check
    —> Package yum-plugin-downloadonly.noarch 0:1.1.30-14.el6 will be installed
    –> Finished Dependency Resolution
    
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

Now you can just download a package from repository without installing it by using this command:

    # yum install httpd-devel –downloadonly

By default packages are downloaded to **/var/cache/yum/<arch\>** directory but you can download them a specified location by adding another option to yum command

    # yum install httpd-devel –downloadonly –downloaddir=/opt

If you have a rpm of a package but you don’t have the dependencies and you do not know where to get that. you can still have yum to install that rpm and get the required dependencies from the repository. Let’s install the httpd-devel-2.2.15-29.el6_4.x86_64 RPM that we just downloaded.

    #  yum localinstall /opt/httpd-devel-2.2.15-29.el6_4.x86_64.rpm
    
    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    Setting up Local Package Process
    Examining /opt/httpd-devel-2.2.15-29.el6_4.x86_64.rpm: httpd-devel-2.2.15-29.el6_4.x86_64
    Marking /opt/httpd-devel-2.2.15-29.el6_4.x86_64.rpm to be installed
    Resolving Dependencies
    –> Running transaction check
    —> Package httpd-devel.x86_64 0:2.2.15-29.el6_4 will be installed
    –> Processing Dependency: apr-devel for package: httpd-devel-2.2.15-29.el6_4.x86_64
    –> Processing Dependency: apr-util-devel for package: httpd-devel-2.2.15-29.el6_4.x86_64
    –> Running transaction check
    —> Package apr-devel.x86_64 0:1.3.9-5.el6_2 will be installed
    —> Package apr-util-devel.x86_64 0:1.3.9-3.el6_0.1 will be installed
    –> Processing Dependency: openldap-devel for package: apr-util-devel-1.3.9-3.el6_0.1.x86_64
    –> Processing Dependency: expat-devel for package: apr-util-devel-1.3.9-3.el6_0.1.x86_64
    –> Processing Dependency: db4-devel for package: apr-util-devel-1.3.9-3.el6_0.1.x86_64
    –> Running transaction check
    —> Package db4-devel.x86_64 0:4.7.25-18.el6_4 will be installed
    –> Processing Dependency: db4-cxx = 4.7.25-18.el6_4 for package: db4-devel-4.7.25-18.el6_4.x86_64
    –> Processing Dependency: db4 = 4.7.25-18.el6_4 for package: db4-devel-4.7.25-18.el6_4.x86_64
    –> Processing Dependency: libdb_cxx-4.7.so()(64bit) for package: db4-devel-4.7.25-18.el6_4.x86_64
    —> Package expat-devel.x86_64 0:2.0.1-11.el6_2 will be installed
    —> Package openldap-devel.x86_64 0:2.4.23-32.el6_4.1 will be installed
    –> Processing Dependency: cyrus-sasl-devel >= 2.1 for package: openldap-devel-2.4.23-32.el6_4.1.x86_64
    –> Running transaction check
    —> Package cyrus-sasl-devel.x86_64 0:2.1.23-13.el6_3.1 will be installed
    —> Package db4.x86_64 0:4.7.25-17.el6 will be updated
    –> Processing Dependency: db4 = 4.7.25-17.el6 for package: db4-utils-4.7.25-17.el6.x86_64
    —> Package db4.x86_64 0:4.7.25-18.el6_4 will be an update
    —> Package db4-cxx.x86_64 0:4.7.25-18.el6_4 will be installed
    –> Running transaction check
    —> Package db4-utils.x86_64 0:4.7.25-17.el6 will be updated
    —> Package db4-utils.x86_64 0:4.7.25-18.el6_4 will be an update
    –> Finished Dependency Resolution
    
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

### Removing packages using yum. ###

yum remove Remove a package.

    # yum remove httpd
    Failed to set locale, defaulting to C
    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    Setting up Remove Process
    Resolving Dependencies
    –> Running transaction check
    —> Package httpd.x86_64 0:2.2.15-29.el6_4 will be erased
    –> Processing Dependency: httpd-mmn = 20051115 for package: php-5.3.3-23.el6_4.x86_64
    –> Processing Dependency: httpd = 2.2.15-29.el6_4 for package: httpd-devel-2.2.15-29.el6_4.x86_64
    –> Running transaction check
    —> Package httpd-devel.x86_64 0:2.2.15-29.el6_4 will be erased
    —> Package php.x86_64 0:5.3.3-23.el6_4 will be erased
    –> Finished Dependency Resolution
    
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

### List all installed packages ###

If you want to list all the installed packages then you can use yum list installed command. This is useful in combination with grep or to check whether a specific package has been installed. This is similar to query installed packages with rpm -qa command.

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

### List the available repository from which packages are being queried, installed and updated. ###

    # yum repolist
    
    Loaded plugins: amazon-id, downloadonly, rhui-lb, security
    repo id repo name status
    rhui-REGION-client-config-server-6 Red Hat Update Infrastructure 2.0 Client Configuration Server 6 4
    rhui-REGION-rhel-server-releases Red Hat Enterprise Linux Server 6 (RPMs) 10994
    rhui-REGION-rhel-server-releases-optional Red Hat Enterprise Linux Server 6 Optional (RPMs) 6250
    repolist: 17248

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/package-management-yum-redhat-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出