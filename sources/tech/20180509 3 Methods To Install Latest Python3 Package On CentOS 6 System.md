3 Methods To Install Latest Python3 Package On CentOS 6 System
======
CentOS is RHEL clone and comes with free of cost. It’s a industry standard and cutting edge operating system, this has been used by 90% of webhosting provider since it’s supporting the leading edge server control panel called cPanel/WHM.

This control panel allowing users to manage everything through control panel without entering into terminal.

As we already know that RHEL has long term support and doesn’t offer the latest version of packages due to stability.

If you want to install latest version of packages, which is not available in the default repository and you have to install manually by compiling the source package.

It’s a high risk because we can’t upgrade the manually installed packages to latest version if they release new version and we have to reinstall manually.

In this case what will be the solution and suggested method to install latest version of package? Yes, this can be done by adding the necessary third party repository to system.

There are many third party repositories are available for Enterprise Linux but only few of repositories are suggested to use by CentOS communicant, which doesn’t alter the base packages in large scale.

They are usually well maintained and provide a substantial number of additional packages to CentOS.

In this tutorial, we will teach you, how to install latest Python 3 package on CentOS 6 system.

### Method-1 : Using Software Collections Repository (SCL)

The SCL repository is now maintained by a CentOS SIG, which rebuilds the Red Hat Software Collections and also provides some additional packages of their own.

It contains newer versions of various programs that can be installed alongside existing older packages and invoked by using the scl command.

Run the following command to install Software Collections Repository on CentOS
```
# yum install centos-release-scl

```

Check the available python 3 version.
```
# yum info rh-python35
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: ewr.edge.kernel.org
 * remi-safe: mirror.team-cymru.com
Available Packages
Name : rh-python35
Arch : x86_64
Version : 2.0
Release : 2.el6
Size : 0.0
Repo : installed
From repo : centos-sclo-rh
Summary : Package that installs rh-python35
License : GPLv2+
Description : This is the main package for rh-python35 Software Collection.

```

Run the below command to install latest available python 3 package from scl.
```
# yum install rh-python35

```

Run the below special scl command to enable the installed package version at the shell.
```
# scl enable rh-python35 bash

```

Run the below command to check installed python3 version.
```
# python --version
Python 3.5.1

```

Run the following command to get a list of SCL packages have been installed on system.
```
# scl -l
rh-python35

```

### Method-2 : Using EPEL Repository (Extra Packages for Enterprise Linux)

EPEL stands for Extra Packages for Enterprise Linux maintained by Fedora Special Interest Group.

They creates, maintains, and manages a high quality set of additional packages for Enterprise Linux, including, but not limited to, Red Hat Enterprise Linux (RHEL), CentOS and Scientific Linux (SL), Oracle Linux (OL).

EPEL packages are usually based on their Fedora counterparts and will never conflict with or replace packages in the base Enterprise Linux distributions.

**Suggested Read :** [Install / Enable EPEL Repository on RHEL, CentOS, Oracle Linux & Scientific Linux][1]

EPEL package is included in the CentOS Extras repository and enabled by default so, we can install this by running below command.
```
# yum install epel-release

```

Check the available python 3 version.
```
# yum --disablerepo="*" --enablerepo="epel" info python34
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: ewr.edge.kernel.org
Available Packages
Name : python34
Arch : x86_64
Version : 3.4.5
Release : 4.el6
Size : 50 k
Repo : epel
Summary : Version 3 of the Python programming language aka Python 3000
URL : http://www.python.org/
License : Python
Description : Python 3 is a new version of the language that is incompatible with the 2.x
 : line of releases. The language is mostly the same, but many details, especially
 : how built-in objects like dictionaries and strings work, have changed
 : considerably, and a lot of deprecated features have finally been removed.


```

Run the below command to install latest available python 3 package from EPEL repository.
```
# yum --disablerepo="*" --enablerepo="epel" install python34

```

By default this will not install matching pip & setuptools and we have to install by running below command.
```
# curl -O https://bootstrap.pypa.io/get-pip.py
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 1603k 100 1603k 0 0 2633k 0 --:--:-- --:--:-- --:--:-- 4816k

# /usr/bin/python3.4 get-pip.py
Collecting pip
 Using cached https://files.pythonhosted.org/packages/0f/74/ecd13431bcc456ed390b44c8a6e917c1820365cbebcb6a8974d1cd045ab4/pip-10.0.1-py2.py3-none-any.whl
Collecting setuptools
 Downloading https://files.pythonhosted.org/packages/8c/10/79282747f9169f21c053c562a0baa21815a8c7879be97abd930dbcf862e8/setuptools-39.1.0-py2.py3-none-any.whl (566kB)
 100% |████████████████████████████████| 573kB 4.0MB/s
Collecting wheel
 Downloading https://files.pythonhosted.org/packages/1b/d2/22cde5ea9af055f81814f9f2545f5ed8a053eb749c08d186b369959189a8/wheel-0.31.0-py2.py3-none-any.whl (41kB)
 100% |████████████████████████████████| 51kB 8.0MB/s
Installing collected packages: pip, setuptools, wheel
Successfully installed pip-10.0.1 setuptools-39.1.0 wheel-0.31.0

```

Run the below command to check installed python3 version.
```
# python3 --version
Python 3.4.5

```

### Method-3 : Using IUS Community Repository

IUS Community is a CentOS Community Approved third-party RPM repository which contains latest upstream versions of PHP, Python, MySQL, etc.., packages for Enterprise Linux (RHEL & CentOS) 5, 6 & 7.

IUS Community Repository have dependency with EPEL Repository so we have to install EPEL repository prior to IUS repository installation. Follow the below steps to install & enable EPEL & IUS Community Repository to RPM systems and install the packages.

**Suggested Read :** [Install / Enable IUS Community Repository on RHEL & CentOS][2]

EPEL package is included in the CentOS Extras repository and enabled by default so, we can install this by running below command.
```
# yum install epel-release

```

Download IUS Community Repository Shell script
```
# curl 'https://setup.ius.io/' -o setup-ius.sh
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 1914 100 1914 0 0 6563 0 --:--:-- --:--:-- --:--:-- 133k

```

Install/Enable IUS Community Repository.
```
# sh setup-ius.sh

```

Check the available python 3 version.
```
# yum --enablerepo=ius info python36u
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: ewr.edge.kernel.org
 * ius: mirror.team-cymru.com
 * remi-safe: mirror.team-cymru.com
Available Packages
Name : python36u
Arch : x86_64
Version : 3.6.5
Release : 1.ius.centos6
Size : 55 k
Repo : ius
Summary : Interpreter of the Python programming language
URL : https://www.python.org/
License : Python
Description : Python is an accessible, high-level, dynamically typed, interpreted programming
 : language, designed with an emphasis on code readability.
 : It includes an extensive standard library, and has a vast ecosystem of
 : third-party libraries.
 :
 : The python36u package provides the "python3.6" executable: the reference
 : interpreter for the Python language, version 3.
 : The majority of its standard library is provided in the python36u-libs package,
 : which should be installed automatically along with python36u.
 : The remaining parts of the Python standard library are broken out into the
 : python36u-tkinter and python36u-test packages, which may need to be installed
 : separately.
 :
 : Documentation for Python is provided in the python36u-docs package.
 :
 : Packages containing additional libraries for Python are generally named with
 : the "python36u-" prefix.

```

Run the below command to install latest available python 3 package from IUS repository.
```
# yum --enablerepo=ius install python36u

```

Run the below command to check installed python3 version.
```
# python3.6 --version
Python 3.6.5

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/3-methods-to-install-latest-python3-package-on-centos-6-system/

作者：[PRAKASH SUBRAMANIAN][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[2]:https://www.2daygeek.com/install-enable-ius-community-repository-on-rhel-centos/
