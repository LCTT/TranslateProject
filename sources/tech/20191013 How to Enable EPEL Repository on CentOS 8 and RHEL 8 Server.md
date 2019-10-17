[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Enable EPEL Repository on CentOS 8 and RHEL 8 Server)
[#]: via: (https://www.linuxtechi.com/enable-epel-repo-centos8-rhel8-server/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Enable EPEL Repository on CentOS 8 and RHEL 8 Server
======

**EPEL** Stands for Extra Packages for Enterprise Linux, it is a free and opensource additional packages repository available for **CentOS** and **RHEL** servers. As the name suggests, EPEL repository provides extra and additional packages which are not available in the default package repositories of [CentOS 8][1] and [RHEL 8][2].

In this article we will demonstrate how to enable and use epel repository on CentOS 8 and RHEL 8 Server.

[![EPEL-Repo-CentOS8-RHEL8][3]][4]

### Prerequisites of EPEL Repository

  * Minimal CentOS 8 and RHEL 8 Server
  * Root or sudo admin privileges
  * Internet Connection



### Install and Enable EPEL Repository on RHEL 8.x Server

Login or ssh to your RHEL 8.x server and execute the following dnf command to install EPEL rpm package,

```
[root@linuxtechi ~]# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
```

Output of above command would be something like below,

![dnf-install-epel-repo-rehl8][3]

Once epel rpm package is installed successfully then it will automatically enable and configure its yum / dnf repository.  Run following dnf or yum command to verify whether EPEL repository is enabled or not,

```
[root@linuxtechi ~]# dnf repolist epel
Or
[root@linuxtechi ~]# dnf repolist epel -v
```

![epel-repolist-rhel8][3]

### Install and Enable EPEL Repository on CentOS 8.x Server

Login or ssh to your CentOS 8 server and execute following dnf or yum command to install ‘**epel-release**‘ rpm package. In CentOS 8 server, epel rpm package is available in its default package repository.

```
[root@linuxtechi ~]# dnf install epel-release -y
Or
[root@linuxtechi ~]# yum install epel-release -y
```

Execute the following commands to verify the status of epel repository on CentOS 8 server,

```
 [root@linuxtechi ~]# dnf repolist epel
Last metadata expiration check: 0:00:03 ago on Sun 13 Oct 2019 04:18:05 AM BST.
repo id              repo name                                               status
*epel                Extra Packages for Enterprise Linux 8 - x86_64          1,977
[root@linuxtechi ~]#
[root@linuxtechi ~]# dnf repolist epel -v
……………………
Repo-id      : epel
Repo-name    : Extra Packages for Enterprise Linux 8 - x86_64
Repo-status  : enabled
Repo-revision: 1570844166
Repo-updated : Sat 12 Oct 2019 02:36:32 AM BST
Repo-pkgs    : 1,977
Repo-size    : 2.1 G
Repo-metalink: https://mirrors.fedoraproject.org/metalink?repo=epel-8&arch=x86_64&infra=stock&content=centos
  Updated    : Sun 13 Oct 2019 04:28:24 AM BST
Repo-baseurl : rsync://repos.del.extreme-ix.org/epel/8/Everything/x86_64/ (34 more)
Repo-expire  : 172,800 second(s) (last: Sun 13 Oct 2019 04:28:24 AM BST)
Repo-filename: /etc/yum.repos.d/epel.repo
Total packages: 1,977
[root@linuxtechi ~]#
```

Above command’s output confirms that we have successfully enabled epel repo. Let’s perform some basic operations on EPEL repo.

### List all available packages from epel repository

If you want to list all the packages from epel repository then run the following dnf command,

```
[root@linuxtechi ~]# dnf repository-packages epel list
……………
Last metadata expiration check: 0:38:18 ago on Sun 13 Oct 2019 04:28:24 AM BST.
Installed Packages
epel-release.noarch                   8-6.el8                @epel
Available Packages
BackupPC.x86_64                       4.3.1-2.el8            epel
BackupPC-XS.x86_64                    0.59-3.el8             epel
CGSI-gSOAP.x86_64                     1.3.11-7.el8           epel
CGSI-gSOAP-devel.x86_64               1.3.11-7.el8           epel
Field3D.x86_64                        1.7.2-16.el8           epel
Field3D-devel.x86_64                  1.7.2-16.el8           epel
GraphicsMagick.x86_64                 1.3.33-1.el8           epel
GraphicsMagick-c++.x86_64             1.3.33-1.el8           epel
…………………………
zabbix40-web-mysql.noarch             4.0.12-1.el8           epel
zabbix40-web-pgsql.noarch             4.0.12-1.el8           epel
zerofree.x86_64                       1.1.1-3.el8            epel
zimg.x86_64                           2.8-4.el8              epel
zimg-devel.x86_64                     2.8-4.el8              epel
zstd.x86_64                           1.4.2-1.el8            epel
zvbi.x86_64                           0.2.35-9.el8           epel
zvbi-devel.x86_64                     0.2.35-9.el8           epel
zvbi-fonts.noarch                     0.2.35-9.el8           epel
[root@linuxtechi ~]#
```

### Search a package from epel repository

Let’s assume if we want to search Zabbix package in epel repository, execute the following dnf command,

```
[root@linuxtechi ~]# dnf repository-packages epel list | grep -i zabbix
```

Output of above command would be something like below,

![epel-repo-search-package-centos8][3]

### Install a package from epel repository

Let’s assume we want to install htop package from epel repo, then issue the following dnf command,

Syntax:

# dnf –enablerepo=”epel” install &lt;pkg_name&gt;

```
[root@linuxtechi ~]# dnf --enablerepo="epel" install htop -y
```

**Note:** If we don’t specify the “**–enablerepo=epel**” in above command then it will look for htop package in all available package repositories.

That’s all from this article, I hope above steps helps you to enable and configure EPEL repository on CentOS 8 and RHEL 8 Server, please don’t hesitate to share your comments and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/enable-epel-repo-centos8-rhel8-server/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/centos-8-installation-guide-screenshots/
[2]: https://www.linuxtechi.com/install-configure-kvm-on-rhel-8/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/10/EPEL-Repo-CentOS8-RHEL8.jpg
