How To Add, Enable And Disable A Repository In Linux
======
Many of us using yum package manager to manage package installation, remove, update, search, etc, on RPM based system such as RHEL, CentOS, etc,.

Linux distributions gets most of its software from distribution official repositories. The official distribution repositories contain good amount of free and open source apps/software’s. It’s readily available to install and use.

RPM based distribution doesn’t offer some of the packages in their official distribution repository due to some limitation and proprietary issue. Also it won’t offer latest version of core packages due to stability.

To overcome this situation/issue, we need to install/enable the requires third party repository. There are many third party repositories are available for RPM based systems but only few of the repositories are advised to use because they didn’t replace large amount of base packages.

**Suggested Read :**
**(#)** [YUM Command To Manage Packages on RHEL/CentOS Systems][1]
**(#)** [DNF (Fork of YUM) Command To Manage Packages on Fedora System][2]
**(#)** [List of Command line Package Manager & Usage][3]
**(#)** [A Graphical front-end tool for Linux Package Manager][4]

This can be done on RPM based system such as RHEL, CentOS, OEL, Fedora, etc,.

  * Fedora system uses “dnf config-manager [options] [section …]”
  * Other RPM based system uses “yum-config-manager [options] [section …]”



### How To List Enabled Repositories

Just run the below command to check list of enabled repositories on your system.

For CentOS/RHEL/OLE systems
```
# yum repolist
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
repo id repo name status
base CentOS-6 - Base 6,706
extras CentOS-6 - Extras 53
updates CentOS-6 - Updates 1,255
repolist: 8,014

```

For Fedora system
```
# dnf repolist

```

### How To Add A New Repository In System

Every repositories commonly provide their own `.repo` file. To add such a repository to your system, run the
following command as root user. In our case, we are going to add `EPEL Repository` and `IUS Community Repo`, see below.

There is no `.repo` files are available for these repositories. Hence, we are installing by using below methods.

For **EPEL Repository** , since it’s available from CentOS extra repository so, run the below command to install it.
```
# yum install epel-release -y

```

For **IUS Community Repo** , run the below bash script to install it.
```
# curl 'https://setup.ius.io/' -o setup-ius.sh
# sh setup-ius.sh

```

If you have `.repo` file, simple run the following command to add a repository on RHEL/CentOS/OEL.
```
# yum-config-manager --add-repo http://www.example.com/example.repo

Loaded plugins: product-id, refresh-packagekit, subscription-manager
adding repo from: http://www.example.com/example.repo
grabbing file http://www.example.com/example.repo to /etc/yum.repos.d/example.repo
example.repo | 413 B 00:00
repo saved to /etc/yum.repos.d/example.repo

```

For Fedora system, run the below command to add a repository.
```
# dnf config-manager --add-repo http://www.example.com/example.repo

adding repo from: http://www.example.com/example.repo

```

If you run `yum repolist` command after adding these repositories, you can able to see newly added repositories. Yes, i saw that.

Make a note: whenever you run “yum repolist” command, that automatically fetch updates from corresponding repository and save the caches in local system.
```
# yum repolist

Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
epel/metalink | 6.1 kB 00:00
* epel: epel.mirror.constant.com
* ius: ius.mirror.constant.com
ius | 2.3 kB 00:00
repo id repo name status
base CentOS-6 - Base 6,706
epel Extra Packages for Enterprise Linux 6 - x86_64 12,505
extras CentOS-6 - Extras 53
ius IUS Community Packages for Enterprise Linux 6 - x86_64 390
updates CentOS-6 - Updates 1,255
repolist: 20,909

```

Each repository has multiple channels such as Testing, Dev, Archive. You can understand this better by navigating to repository files location.
```
# ls -lh /etc/yum.repos.d
total 64K
-rw-r--r-- 1 root root 2.0K Apr 12 02:44 CentOS-Base.repo
-rw-r--r-- 1 root root 647 Apr 12 02:44 CentOS-Debuginfo.repo
-rw-r--r-- 1 root root 289 Apr 12 02:44 CentOS-fasttrack.repo
-rw-r--r-- 1 root root 630 Apr 12 02:44 CentOS-Media.repo
-rw-r--r-- 1 root root 916 May 18 11:07 CentOS-SCLo-scl.repo
-rw-r--r-- 1 root root 892 May 18 10:36 CentOS-SCLo-scl-rh.repo
-rw-r--r-- 1 root root 6.2K Apr 12 02:44 CentOS-Vault.repo
-rw-r--r-- 1 root root 7.9K Apr 12 02:44 CentOS-Vault.repo.rpmnew
-rw-r--r-- 1 root root 957 May 18 10:41 epel.repo
-rw-r--r-- 1 root root 1.1K Nov 4 2012 epel-testing.repo
-rw-r--r-- 1 root root 1.2K Feb 23 2017 ius-archive.repo
-rw-r--r-- 1 root root 1.2K Feb 23 2017 ius-dev.repo
-rw-r--r-- 1 root root 1.1K May 18 10:41 ius.repo
-rw-r--r-- 1 root root 1.2K Feb 23 2017 ius-testing.repo

```

### How To Enable A Repository In System

When you add a new repository by default it’s enable the their stable repository that’s why we are getting the repository information when we ran “yum repolist” command. In some cases if you want to enable their Testing or Dev or Archive repo, use the following command. Also, we can enable any disabled repo using this command.

To validate this, we are going to enable `epel-testing.repo` by running the below command.
```
# yum-config-manager --enable epel-testing

Loaded plugins: fastestmirror
==================================================================================== repo: epel-testing =====================================================================================
[epel-testing]
bandwidth = 0
base_persistdir = /var/lib/yum/repos/x86_64/6
baseurl =
cache = 0
cachedir = /var/cache/yum/x86_64/6/epel-testing
cost = 1000
enabled = 1
enablegroups = True
exclude =
failovermethod = priority
ftp_disable_epsv = False
gpgcadir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgcadir
gpgcakey =
gpgcheck = True
gpgdir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgdir
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
hdrdir = /var/cache/yum/x86_64/6/epel-testing/headers
http_caching = all
includepkgs =
keepalive = True
mdpolicy = group:primary
mediaid =
metadata_expire = 21600
metalink =
mirrorlist = https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=x86_64
mirrorlist_expire = 86400
name = Extra Packages for Enterprise Linux 6 - Testing - x86_64
old_base_cache_dir =
password =
persistdir = /var/lib/yum/repos/x86_64/6/epel-testing
pkgdir = /var/cache/yum/x86_64/6/epel-testing/packages
proxy = False
proxy_dict =
proxy_password =
proxy_username =
repo_gpgcheck = False
retries = 10
skip_if_unavailable = False
ssl_check_cert_permissions = True
sslcacert =
sslclientcert =
sslclientkey =
sslverify = True
throttle = 0
timeout = 30.0
username =

```

Run the “yum repolist” command to check whether “epel-testing” is enabled or not. It’s enabled, i could able to see the repo.
```
# yum repolist
Loaded plugins: fastestmirror, security
Determining fastest mirrors
epel/metalink | 18 kB 00:00
epel-testing/metalink | 17 kB 00:00
 * epel: mirror.us.leaseweb.net
 * epel-testing: mirror.us.leaseweb.net
 * ius: mirror.team-cymru.com
base | 3.7 kB 00:00
centos-sclo-sclo | 2.9 kB 00:00
epel | 4.7 kB 00:00
epel/primary_db | 6.0 MB 00:00
epel-testing | 4.7 kB 00:00
epel-testing/primary_db | 368 kB 00:00
extras | 3.4 kB 00:00
ius | 2.3 kB 00:00
ius/primary_db | 216 kB 00:00
updates | 3.4 kB 00:00
updates/primary_db | 8.1 MB 00:00 ...
repo id repo name status
base CentOS-6 - Base 6,706
centos-sclo-sclo CentOS-6 - SCLo sclo 495
epel Extra Packages for Enterprise Linux 6 - x86_64 12,509
epel-testing Extra Packages for Enterprise Linux 6 - Testing - x86_64 809
extras CentOS-6 - Extras 53
ius IUS Community Packages for Enterprise Linux 6 - x86_64 390
updates CentOS-6 - Updates 1,288
repolist: 22,250

```

If you want to enable multiple repositories at once, use the below format. This command will enable epel, epel-testing, and ius repositories.
```
# yum-config-manager --enable epel epel-testing ius

```

For Fedora system, run the below command to enable a repository.
```
# dnf config-manager --set-enabled epel-testing

```

### How To Disable A Repository In System

Whenever you add a new repository by default it enables their stable repository that’s why we are getting the repository information when we ran “yum repolist” command. If you dont want to use the repository then disable that by running below command.

To validate this, we are going to disable `epel-testing.repo` & `ius.repo` by running below command.
```
# yum-config-manager --disable epel-testing ius

Loaded plugins: fastestmirror
==================================================================================== repo: epel-testing =====================================================================================
[epel-testing]
bandwidth = 0
base_persistdir = /var/lib/yum/repos/x86_64/6
baseurl =
cache = 0
cachedir = /var/cache/yum/x86_64/6/epel-testing
cost = 1000
enabled = 0
enablegroups = True
exclude =
failovermethod = priority
ftp_disable_epsv = False
gpgcadir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgcadir
gpgcakey =
gpgcheck = True
gpgdir = /var/lib/yum/repos/x86_64/6/epel-testing/gpgdir
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
hdrdir = /var/cache/yum/x86_64/6/epel-testing/headers
http_caching = all
includepkgs =
keepalive = True
mdpolicy = group:primary
mediaid =
metadata_expire = 21600
metalink =
mirrorlist = https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=x86_64
mirrorlist_expire = 86400
name = Extra Packages for Enterprise Linux 6 - Testing - x86_64
old_base_cache_dir =
password =
persistdir = /var/lib/yum/repos/x86_64/6/epel-testing
pkgdir = /var/cache/yum/x86_64/6/epel-testing/packages
proxy = False
proxy_dict =
proxy_password =
proxy_username =
repo_gpgcheck = False
retries = 10
skip_if_unavailable = False
ssl_check_cert_permissions = True
sslcacert =
sslclientcert =
sslclientkey =
sslverify = True
throttle = 0
timeout = 30.0
username =

========================================================================================= repo: ius =========================================================================================
[ius]
bandwidth = 0
base_persistdir = /var/lib/yum/repos/x86_64/6
baseurl =
cache = 0
cachedir = /var/cache/yum/x86_64/6/ius
cost = 1000
enabled = 0
enablegroups = True
exclude =
failovermethod = priority
ftp_disable_epsv = False
gpgcadir = /var/lib/yum/repos/x86_64/6/ius/gpgcadir
gpgcakey =
gpgcheck = True
gpgdir = /var/lib/yum/repos/x86_64/6/ius/gpgdir
gpgkey = file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY
hdrdir = /var/cache/yum/x86_64/6/ius/headers
http_caching = all
includepkgs =
keepalive = True
mdpolicy = group:primary
mediaid =
metadata_expire = 21600
metalink =
mirrorlist = https://mirrors.iuscommunity.org/mirrorlist?repo=ius-centos6&arch=x86_64&protocol=http
mirrorlist_expire = 86400
name = IUS Community Packages for Enterprise Linux 6 - x86_64
old_base_cache_dir =
password =
persistdir = /var/lib/yum/repos/x86_64/6/ius
pkgdir = /var/cache/yum/x86_64/6/ius/packages
proxy = False
proxy_dict =
proxy_password =
proxy_username =
repo_gpgcheck = False
retries = 10
skip_if_unavailable = False
ssl_check_cert_permissions = True
sslcacert =
sslclientcert =
sslclientkey =
sslverify = True
throttle = 0
timeout = 30.0
username =

```

Run the “yum repolist” command to check whether “epel-testing” & “ius” repositories are disabled or not. It’s disabled, i could not able to see those repo in the below list except “epel”.
```
# yum repolist
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: mirror.us.leaseweb.net
repo id repo name status
base CentOS-6 - Base 6,706
centos-sclo-sclo CentOS-6 - SCLo sclo 495
epel Extra Packages for Enterprise Linux 6 - x86_64 12,505
extras CentOS-6 - Extras 53
updates CentOS-6 - Updates 1,288
repolist: 21,051

```

Alternatively, we can run the following command to see the details.
```
# yum repolist all | grep "epel*\|ius*"
 * epel: mirror.steadfast.net
epel Extra Packages for Enterprise Linux 6 enabled: 12,509
epel-debuginfo Extra Packages for Enterprise Linux 6 disabled
epel-source Extra Packages for Enterprise Linux 6 disabled
epel-testing Extra Packages for Enterprise Linux 6 disabled
epel-testing-debuginfo Extra Packages for Enterprise Linux 6 disabled
epel-testing-source Extra Packages for Enterprise Linux 6 disabled
ius IUS Community Packages for Enterprise disabled
ius-archive IUS Community Packages for Enterprise disabled
ius-archive-debuginfo IUS Community Packages for Enterprise disabled
ius-archive-source IUS Community Packages for Enterprise disabled
ius-debuginfo IUS Community Packages for Enterprise disabled
ius-dev IUS Community Packages for Enterprise disabled
ius-dev-debuginfo IUS Community Packages for Enterprise disabled
ius-dev-source IUS Community Packages for Enterprise disabled
ius-source IUS Community Packages for Enterprise disabled
ius-testing IUS Community Packages for Enterprise disabled
ius-testing-debuginfo IUS Community Packages for Enterprise disabled
ius-testing-source IUS Community Packages for Enterprise disabled

```

For Fedora system, run the below command to enable a repository.
```
# dnf config-manager --set-disabled epel-testing

```

Alternatively this can be done by editing the appropriate repo file manually. To do, open the corresponding repo file and change the value from `enabled=0`
to `enabled=1` (To enable the repo) or from `enabled=1` to `enabled=0` (To disable the repo).

From:
```
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
failovermethod=priority
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

```

To:
```
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-add-enable-disable-a-repository-dnf-yum-config-manager-on-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]:https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[4]:https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
