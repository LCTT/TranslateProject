在 CentOS 6 系统上安装最新版 Python3 软件包的 3 种方法
======

CentOS 克隆自 RHEL，无需付费即可使用。CentOS 是一个企业级标准的、前沿的操作系统，被超过 90% 的网络主机托管商采用，因为它提供了技术领先的服务器控制面板 cPanel/WHM。

该控制面板使得用户无需进入命令行即可通过其管理一切。

众所周知，RHEL 提供长期支持，出于稳定性考虑，不提供最新版本的软件包。

如果你想安装的最新版本软件包不在默认源中，你需要手动编译源码安装。但手动编译安装的方式有不小的风险，即如果出现新版本，无法升级手动安装的软件包；你不得不重新手动安装。

那么在这种情况下，安装最新版软件包的推荐方法和方案是什么呢？是的，可以通过为系统添加所需的第三方源来达到目的。

可供企业级 Linux 使用的第三方源有很多，但只有几个是 CentOS 社区推荐使用的，它们在很大程度上不修改基础软件包。

这几个推荐的源维护的很好，为 CentOS 提供大量补充软件包。

在本教程中，我们将向你展示，如何在 CentOS 6 操作系统上安装最新版本的 Python 3 软件包。

### 方法 1：使用 Software Collections 源 （SCL）

SCL 源目前由 CentOS SIG 维护，除了重新编译构建 Red Hat 的 Software Collections 外，还额外提供一些它们自己的软件包。

该源中包含不少程序的更高版本，可以在不改变原有旧版本程序包的情况下安装，使用时需要通过 `scl` 命令调用。

运行如下命令可以在 CentOS 上安装 SCL 源：

```
# yum install centos-release-scl
```

检查可用的 Python 3 版本：

```
# yum info rh-python35
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: ewr.edge.kernel.org
 * remi-safe: mirror.team-cymru.com
Available Packages
Name        : rh-python35
Arch        : x86_64
Version     : 2.0
Release     : 2.el6
Size        : 0.0
Repo        : installed
From repo   : centos-sclo-rh
Summary     : Package that installs rh-python35
License     : GPLv2+
Description : This is the main package for rh-python35 Software Collection.
```

运行如下命令从 `scl` 源安装可用的最新版 python 3：

```
# yum install rh-python35
```

运行如下特殊的 `scl` 命令，在当前 shell 中启用安装的软件包：

```
# scl enable rh-python35 bash
```

运行如下命令检查安装的 python3 版本：

```
# python --version
Python 3.5.1
```

运行如下命令获取系统已安装的 SCL 软件包列表：

```
# scl -l
rh-python35
```

### 方法 2：使用 EPEL 源 (Extra Packages for Enterprise Linux）

EPEL 是 Extra Packages for Enterprise Linux 的缩写，该源由 Fedora SIG （Special Interest Group）维护。

该 SIG 为企业级 Linux 创建、维护并管理了一系列高品质补充软件包，受益的企业级 Linux 发行版包括但不限于红帽企业级 Linux （RHEL）、 CentOS、 Scientific Linux （SL） 和 Oracle Linux （OL）等。

EPEL 通常基于 Fedora 对应代码提供软件包，不会与企业级 Linux 发行版中的基础软件包冲突或替换其中的软件包。

**推荐阅读：** [在 RHEL, CentOS, Oracle Linux 或 Scientific Linux 上安装启用 EPEL 源][1]

EPEL 软件包位于 CentOS 的 Extra 源中，已经默认启用，故我们只需运行如下命令即可：

```
# yum install epel-release
```

检查可用的 python 3 版本：

```
# yum --disablerepo="*" --enablerepo="epel" info python34
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: ewr.edge.kernel.org
Available Packages
Name        : python34
Arch        : x86_64
Version     : 3.4.5
Release     : 4.el6
Size        : 50 k
Repo        : epel
Summary     : Version 3 of the Python programming language aka Python 3000
URL         : http://www.python.org/
License     : Python
Description : Python 3 is a new version of the language that is incompatible with the 2.x
            : line of releases. The language is mostly the same, but many details, especially
            : how built-in objects like dictionaries and strings work, have changed
            : considerably, and a lot of deprecated features have finally been removed.
```

运行如下命令从 EPEL 源安装可用的最新版 python 3 软件包：

```
# yum --disablerepo="*" --enablerepo="epel" install python34
```

默认情况下并不会安装 `pip` 和 `setuptools`，我们需要运行如下命令手动安装：

```
# curl -O https://bootstrap.pypa.io/get-pip.py
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 1603k  100 1603k    0     0  2633k      0 --:--:-- --:--:-- --:--:-- 4816k

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

运行如下命令检查已安装的 python3 版本：

```
# python3 --version
Python 3.4.5
```

### 方法 3：使用 IUS 社区源

IUS 社区是 CentOS 社区批准的第三方 RPM 源，为企业级 Linux （RHEL 和 CentOS） 5、 6 和 7 版本提供最新上游版本的 PHP、 Python、 MySQL 等软件包。

IUS 社区源依赖于 EPEL 源，故我们需要先安装 EPEL 源，然后再安装 IUS 社区源。按照下面的步骤安装启用 EPEL 源和 IUS 社区源，利用该 RPM 系统安装软件包。

**推荐阅读：** [在 RHEL 或 CentOS 上安装启用 IUS 社区源][2]

EPEL 软件包位于 CentOS 的 Extra 源中，已经默认启用，故我们只需运行如下命令即可：

```
# yum install epel-release
```

下载 IUS 社区源安装脚本：

```
# curl 'https://setup.ius.io/' -o setup-ius.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1914  100  1914    0     0   6563      0 --:--:-- --:--:-- --:--:--  133k
```

安装启用 IUS 社区源：

```
# sh setup-ius.sh
```

检查可用的 python 3 版本：

```
# yum --enablerepo=ius info python36u
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: ewr.edge.kernel.org
 * ius: mirror.team-cymru.com
 * remi-safe: mirror.team-cymru.com
Available Packages
Name        : python36u
Arch        : x86_64
Version     : 3.6.5
Release     : 1.ius.centos6
Size        : 55 k
Repo        : ius
Summary     : Interpreter of the Python programming language
URL         : https://www.python.org/
License     : Python
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

运行如下命令从 IUS 源安装最新可用版本的 python 3 软件包：

```
# yum --enablerepo=ius install python36u
```

运行如下命令检查已安装的 python3 版本：

```
# python3.6 --version
Python 3.6.5
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/3-methods-to-install-latest-python3-package-on-centos-6-system/

作者：[PRAKASH SUBRAMANIAN][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[2]:https://www.2daygeek.com/install-enable-ius-community-repository-on-rhel-centos/
