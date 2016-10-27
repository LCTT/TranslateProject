How To Download A RPM Package With All Dependencies In CentOS
===

![download a RPM package with all dependencies](https://www.ostechnix.com/wp-content/uploads/2016/10/Download-a-package-720x340.png)

The other day I was trying to create a local repository with packages only we use often in CentOS 7\. Of course we can download any package using _curl_ or _wget_ commands. These commands however won’t download the required dependencies. You have to spend some time and manually search and download the dependencies required by the package to install. Well, not anymore. In this brief tutorial, I will walk you through how to download a RPM package with all dependencies in two methods. I tested this guide on CentOS 7, although the same steps may work on other RPM based systems such as RHEL, Fedora and Scientific Linux.

### Method 1 – Download A RPM Package With All Dependencies Using “Downloadonly” plugin

We can easily download any RPM package with all dependencies using “Downloadonly” plugin for yum command.

To install Downloadonly plugin, run the following command as root user.

```
yum install yum-plugin-downloadonly
```

Now, run the following command to download a RPM package.

```
yum install --downloadonly <package-name>
```

By default, this command will download and save the packages in /var/cache/yum/ in rhel-{arch}-channel/packageslocation. However, you can download and save the packages in any location of your choice using _“–downloaddir”_ option.

```
yum install --downloadonly --downloaddir=<directory> <package-name>
```

Example:

```
yum install --downloadonly --downloaddir=/root/mypackages/ httpd
```

Sample output:

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

Now go the location that you specified in the above command. You will see there the downloaded package with all dependencies. In my case, I have downloaded the packages in _/root/mypackages/_ directory.

Let us verify the contents.

```
ls /root/mypackages/
```

Sample output:

```
apr-1.4.8-3.el7.x86_64.rpm
apr-util-1.5.2-6.el7.x86_64.rpm
httpd-2.4.6-40.el7.centos.4.x86_64.rpm
httpd-tools-2.4.6-40.el7.centos.4.x86_64.rpm
mailcap-2.1.41-2.el7.noarch.rpm
```

[![rootserver1_003](http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_003-1.png)][5]

As you see in the above output, the package httpd has been downloaded with all dependencies.

Please note that this plugin is applicable for “yum install/yum update” and not for “yum groupinstall”. By default this plugin will download the latest available packages in the repository. You can however download a particular version by specifying the version.

Example:

```
yum install --downloadonly --downloaddir=/root/mypackages/ httpd-2.2.6-40.el7
```

Also, you can download multiple packages at once as shown below.

```
yum install --downloadonly --downloaddir=/root/mypackages/ httpd vsftpd
```

### Method 2 – Download A RPM Package With All Dependencies Using “Yumdownloader” utility


Yumdownloader is a simple, yet useful command-line utility that downloads any RPM package along with all required dependencies in one go.

Install Yumdownloader using the following command as root user.

```
yum install yum-utils
```

Once installed, run the following command to download a package, for example httpd.

```
yumdownloader httpd
```

To download packages with all dependencies, use _–resolve_ option:

```
yumdownloader --resolve httpd
```

By default, Yumdownloader will download the packages in the current working directory.

To download packages along with all dependencies to a specific location, use _–destdir_ option:

```
yumdownloader --resolve --destdir=/root/mypackages/ httpd
```

Or

```
yumdownloader --resolve --destdir /root/mypackages/ httpd
```

Sample output:

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

Let us verify whether packages have been downloaded in the specified location.

```
ls /root/mypackages/
```

Sample output:

```
apr-1.4.8-3.el7.x86_64.rpm
apr-util-1.5.2-6.el7.x86_64.rpm
httpd-2.4.6-40.el7.centos.4.x86_64.rpm
httpd-tools-2.4.6-40.el7.centos.4.x86_64.rpm
mailcap-2.1.41-2.el7.noarch.rpm
```

[![rootserver1_005](http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_005.png)][2]

Unlike “Downloadonly” plugin, Yumdownload can download the packages related to a particular group.

```
yumdownloader "@Development Tools" --resolve --destdir /root/mypackages/
```

Personally, I prefer Yumdownloader over “Downloadonly” plugin for yum. But, both are extremely easy and handy and does the same job.

That’s all for today. If you find this guide helpful, please share it on your social networks and let others to benefit.

Cheers!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/download-rpm-package-dependencies-centos/

作者：[SK][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://ostechnix.tradepub.com/free/w_make272/prgm.cgi?a=1
[2]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_005.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_004-1.png
[4]:http://ostechnix.tradepub.com/free/w_make272/prgm.cgi?a=1
[5]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_003-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2016/10/root@server1_001.png
[7]:https://www.ostechnix.com/author/sk/
