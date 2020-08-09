[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 Methods to Install the Latest PHP 7 Package on CentOS/RHEL 7 and CentOS/RHEL 6)
[#]: via: (https://www.2daygeek.com/install-php-7-on-centos-6-centos-7-rhel-7-redhat-7/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

3 Methods to Install the Latest PHP 7 Package on CentOS/RHEL 7 and CentOS/RHEL 6
======

PHP is the most popular open-source general-purpose scripting language and is widely used for web development.

It’s part of the LAMP stack application suite and is used to create dynamic websites.

Popular CMS applications WordPress, Joomla and Drupal are developed in PHP language.

These applications require PHP 7 for their installation and configuration.

PHP 7 loads your web application faster and consumes less server resources.

By default the CentOS/RHEL 6 operating system provides PHP 5.3 in their official repository and CentOS/RHEL 7 provides PHP 5.4.

In this article we will show you how to install the latest version of PHP on CentOS/RHEL 7 and CentOS/RHEL 6 systems.

This can be done by adding the necessary **[additional third-party RPM repository][1]** to the system.

### Method-1 : How to Install PHP 7 on CentOS 6/7 Using the Software Collections Repository (SCL)

The SCL repository is now maintained by a CentOS SIG, which rebuilds the Red Hat Software Collections and also provides some additional packages of their own.

It contains newer versions of various programs that can be installed alongside existing older packages and invoked by using the scl command.

Run the following **[yum command][2]** to install Software Collections Repository (SCL) on CentOS

```
# yum install centos-release-scl
```

Run the following command to verify the PHP 7 version available in the scl repository.

```
# yum --disablerepo="*" --enablerepo="centos-sclo-rh" list *php

Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
centos-sclo-rh: centos.mirrors.estointernet.in
Available Packages
php54-php.x86_64                    5.4.40-4.el7                 centos-sclo-rh
php55-php.x86_64                    5.5.21-5.el7                 centos-sclo-rh
rh-php70-php.x86_64                 7.0.27-2.el7                 centos-sclo-rh
rh-php71-php.x86_64                 7.1.30-2.el7                 centos-sclo-rh
rh-php72-php.x86_64                 7.2.24-1.el7                 centos-sclo-rh
```

Run the command below to install the PHP 7.2 on your system from scl.

```
# yum --disablerepo="*" --enablerepo="centos-sclo-rh" install rh-php72-php
```

If you need to install additional modules for PHP 7.2, you can install them by running the command format below. For instance, you can install the **“gd”** and **“pdo”** packages by executing the command below.

```
# yum --disablerepo="*" --enablerepo="centos-sclo-rh" install rh-php72-php-gd rh-php72-php-pdo
```

### Method-1a : How to Install PHP 7 on RHEL 7 Using the Software Collections Repository (SCL)

For Red Hat 7, enable the following repositories to install the latest PHP 7 package.

```
# sudo subscription-manager repos --enable rhel-7-server-extras-rpms
# sudo subscription-manager repos --enable rhel-7-server-optional-rpms
# sudo subscription-manager repos --enable rhel-server-rhscl-7-rpms
```

Run the command below to search the available PHP 7 version from the RHSCL repository.

```
# yum search rh-php*
```

You can easily install PHP 7.3 on the RHEL 7 machine by running the command below from the RHSCL repository.

```
# yum install rh-php73
```

### Method-2 : How to Install PHP 7 on CentOS 6/7 Using the Remi Repository

The **[Remi repository][3]** stores and maintains the latest version of PHP packages with a large collection of libraries, extensions and tools. Some of them are back-ported from Fedora and EPEL.

This is a CentOS community-recognized repository and doesn’t modify or affect any underlying packages.

As a prerequisite, this installs the **[EPEL repository][4]** if it is not already installed on your system.

You can easily find the available version of the PHP 7 package from the Remy repository because it adds a separate repo to each version. You can view them using the **[ls command][5]**.

```
# ls -lh /etc/yum.repos.d/remi-php*

-rw-r--r--. 1 root root  456 Sep  6 01:31 /etc/yum.repos.d/remi-php54.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php70.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php71.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php72.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php73.repo
-rw-r--r--. 1 root root 1.3K Sep  6 01:31 /etc/yum.repos.d/remi-php74.repo
```

You can easily install PHP 7.4 on the CentOS 6/7 systems by running the command below from the remi repository.

```
# yum --disablerepo="*" --enablerepo="remi-php74" install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
```

### Method-2a : How to Install PHP 7 on RHEL 7 Using the Remi Reposiotry

For Red Hat 7, install the following repositories to install the latest PHP 7 package.

To install EPEL Repository on RHEL 7

```
# yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```

To install Remi Repository on RHEL 7

```
# yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```

To enable the optional RPMS repository.

```
# subscription-manager repos --enable=rhel-7-server-optional-rpms
```

You can easily install PHP 7.4 on the RHEL 7 systems by running the below command from the remi repository.

```
# yum --disablerepo="*" --enablerepo="remi-php74" install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
```

To verify the PHP 7 installation, run the following command

```
# php -v

PHP 7.4.1 (cli) (built: Dec 17 2019 16:35:58) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
```

### Method-3 : How to Install PHP 7 on CentOS 6/7 Using the IUS Community Repository

IUS Community is a CentOS Community Approved third-party RPM repository which contains latest upstream versions of PHP, Python, MySQL, etc.., packages for Enterprise Linux (RHEL &amp; CentOS) 5, 6 &amp; 7.

**[IUS Community Repository][6]** have dependency with EPEL Repository so we have to install EPEL repository prior to IUS repository installation. Follow the below steps to install &amp; enable EPEL &amp; IUS Community Repository to RPM systems and install the packages.

EPEL package is included in the CentOS Extras repository and enabled by default so, we can install this by running below command.

```
# yum install epel-release
```

Download IUS Community Repository Shell script

```
# curl 'https://setup.ius.io/' -o setup-ius.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1914  100  1914    0     0   6563      0 --:--:-- --:--:-- --:--:--  133k
```

Install/Enable IUS Community Repository.

```
# sh setup-ius.sh
```

Run the following command to check available PHP 7 version in the IUS repository.

```
# yum --disablerepo="*" --enablerepo="ius" list *php7*

Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
Available Packages
mod_php71u.x86_64                                    7.1.33-1.el7.ius                       ius
mod_php72u.x86_64                                    7.2.26-1.el7.ius                       ius
mod_php73.x86_64                                     7.3.13-1.el7.ius                       ius
php71u-bcmath.x86_64                                 7.1.33-1.el7.ius                       ius
php71u-cli.x86_64                                    7.1.33-1.el7.ius                       ius
php71u-common.x86_64                                 7.1.33-1.el7.ius                       ius
php71u-dba.x86_64                                    7.1.33-1.el7.ius                       ius
php71u-dbg.x86_64                                    7.1.33-1.el7.ius                       ius
php71u-devel.x86_64                                  7.1.33-1.el7.ius                       ius
php71u-embedded.x86_64                               7.1.33-1.el7.ius                       ius
```

You can easily install PHP 7.3 on the CentOS 6/7 systems by running the command below from the IUS Community repository.

```
# yum --disablerepo="*" --enablerepo="ius" install php73-common php73-cli php73-gd php73-gd php73-mysqlnd php73-ldap php73-soap php73-mbstring
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/install-php-7-on-centos-6-centos-7-rhel-7-redhat-7/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/8-additional-thirdparty-yum-repositories-centos-rhel-fedora-linux/
[2]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[3]: https://www.2daygeek.com/install-enable-remi-repository-on-centos-rhel-fedora-linux/
[4]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-oracle-linux/
[5]: https://www.2daygeek.com/linux-unix-ls-command-display-directory-contents/
[6]: https://www.2daygeek.com/install-enable-ius-community-repository-on-rhel-centos/
