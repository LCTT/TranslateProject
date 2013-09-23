Ubuntuzilla: 简单的方式来安装最新的Mozilla软件
================================================================================
[**Ubuntuzilla**][1] 是一个包含最近最新版本**Mozilla Firefox,MOzilla Thunderbird**,还有**Mozilla Seamonkey**软件的**APT**仓库,这个仓库将工作于Ubuntu还有所有的Debian衍生发行版。Ubuntuzilla 有一个[支持论坛][2]在[Ubuntu论坛][3]的第三方项目区域,因此,如果用户有任何问题,意见或者建议就可以使用它。

**为什么要用Ubuntuzilla?**

回答这个很简单。对于一个特定版本的Ubuntu,官方仓库包含这个版本的Ubuntu发布日期时的软件包的最新版本。发布之后，再次更新的软件包不被加入这个仓库,以便安全修复异常。使用Ubuntuzilla的用户可以得到并及时更新还没有加入到Ubuntu/Debian官方仓库的Mozilla软件,听起来还不错吧?恩,就是这样。


**加入Ubuntuzilla仓库**

加入Ubuntuzilla 没有什么难的,但是如果你已经在使用旧版的ubuntuzilla脚本,你应该先删除掉。否则当安装Mozilla软件的时候由于已存在将会得到一个指向本地**/usr/bin/**的链接。



移除旧版本的Ubuntuzilla脚本,运行下面的命令:

    $ sudo ubuntuzilla.py -a remove -p <package-name>

首先,明智的选择是备份已存在的Firefox/Thunderbird/Seamonkey用户个人文件。它被存放在你的home文件夹。Firefox 和Seamonkey 个人文件存放在 **.mozilla** 文件夹中。Thunderbird 的个人文件存放在 **.thunderbird** 或者 **.mozilla-thunderbird** 文件夹里。

使用任意编辑器打开**/etc/apt/sources.list**文件。

    $ sudo nano /etc/apt/sources.list

加入下面一行在其中。

    deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main

保存并退出文件。

在keyring中加入下面的包签名key,使用命令:

    $ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29

更新源文件表,使用命令:

    $ sudo apt-get update

现在你可以从Ubuntuzilla安装你想要的Mozilla 软件了。

**安装Mozilla Firefox:**

    $ sudo apt-get install firefox-mozilla-build

**安装Mozilla Thunderbird:**

    $ sudo apt-get install thunderbird-mozilla-build

**安装MOzilla Seamonkey:**

    $ sudo apt-get install seamonkey-mozilla-build

这些命令可以移除软件包:

    $ sudo apt-get remove firefox-mozilla-build
    $ sudo apt-get remove thunderbird-mozilla-build
    $ sudo apt-get remove seamonkey-mozilla-build

我发现它对那些想要最新版Mozilla产品的人非常有用。Enjoy!



via: http://www.unixmen.com/ubuntuzilla-easy-way-install-latest-mozilla-products/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://sourceforge.net/apps/mediawiki/ubuntuzilla/index.php?title=Main_Page
[2]:http://ubuntuforums.org/forumdisplay.php?f=251
[3]:http://ubuntuforums.org/