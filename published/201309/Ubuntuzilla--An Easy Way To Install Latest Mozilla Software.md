Ubuntuzilla: 安装最新版Mozilla软件的简单方法
================================================================================

[**Ubuntuzilla**][1] 是一个包含最新版本 **Mozilla Firefox，Mozilla Thunderbird** ，和 **Mozilla Seamonkey** 软件的 **APT** 仓库，这个仓库将适用于Ubuntu以及所有的Debian衍生发行版。Ubuntuzilla在[Ubuntu论坛][3]的第三方项目区域有一个[支持论坛][2]，因此，如果用户有任何问题、意见或者建议就可以使用它来反馈。

###为什么要用Ubuntuzilla?

回答这个很简单。对于一个特定版本的Ubuntu发行版，官方仓库包含这个版本的Ubuntu发布日期时的软件包的最新版本。发布之后，再次更新的软件包不被加入这个仓库，除非是修复安全漏洞。使用Ubuntuzilla的用户可以得到，并及时更新还没有加入到Ubuntu/Debian官方仓库的Mozilla软件，听起来还不错吧?恩，就是这样。

###添加Ubuntuzilla仓库

添加Ubuntuzilla并不困难，但是如果你已经在使用旧版的ubuntuzilla脚本，你应该先删除掉它，否则由于已经有了一个**/usr/bin**下的符号链接，在安装时候后，依旧会使用旧版的脚本。

运行一下命令来移除旧版本的Ubuntuzilla脚本：

    $ sudo ubuntuzilla.py -a remove -p <package-name>

首先，强烈建议大家备份已存在的Firefox/Thunderbird/Seamonkey的用户个人文件。它被存放在你的主目录。Firefox和Seamonkey个人文件存放在 **.mozilla** 目录中。Thunderbird 的个人文件存放在 **.thunderbird** 或者 **.mozilla-thunderbird** 目录中。

使用任意编辑器打开**/etc/apt/sources.list**文件。

    $ sudo nano /etc/apt/sources.list

在里面添加下面一行：

    deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main

保存并退出文件。

使用以下命令在apt 的 keyring中添加下面的软件包签名公钥：

    $ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29

使用下行命令更新源文件表:

    $ sudo apt-get update

现在你可以从Ubuntuzilla安装你想要的Mozilla 软件了。

**安装Mozilla Firefox:**

    $ sudo apt-get install firefox-mozilla-build

**安装Mozilla Thunderbird:**

    $ sudo apt-get install thunderbird-mozilla-build

**安装Mozilla Seamonkey:**

    $ sudo apt-get install seamonkey-mozilla-build

这些命令可以移除软件包:

    $ sudo apt-get remove firefox-mozilla-build
    $ sudo apt-get remove thunderbird-mozilla-build
    $ sudo apt-get remove seamonkey-mozilla-build

我发现它对那些想要最新版Mozilla产品的人非常有用。使用愉快!


via: http://www.unixmen.com/ubuntuzilla-easy-way-install-latest-mozilla-products/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf01]:http://linux.cn/space/flsf01
[Caroline]:http://linux.cn/space/14763

[1]:http://sourceforge.net/apps/mediawiki/ubuntuzilla/index.php?title=Main_Page
[2]:http://ubuntuforums.org/forumdisplay.php?f=251
[3]:http://ubuntuforums.org/ 
