如何在 Linux 上设置密码策略
================================================================================
用户帐号管理是系统管理员最重要的工作之一。而密码安全是系统安全中最受关注的一块。在本教程中，我将为大家介绍**如何在 Linux 上设置密码策略**。

假设你已经在你的 Linux 系统上使用了 [PAM (Pluggable Authentication Modules，插入式验证模块)][1]，因为这些年所有的 Linux 发行版都在使用它。

### 准备工作 ###

安装 PAM 的 cracklib 模块，cracklib 能提供额外的密码检查能力。

Debian、Ubuntu 或 Linux Mint 系统上：

    $ sudo apt-get install libpam-cracklib 

CentOS、Fedora、RHEL 系统已经默认安装了 cracklib PAM 模块，所以在这些系统上无需执行上面的操作。

为了强制实施密码策略，我们需要修改 /etc/pam.d 目录下的 PAM 配置文件。一旦修改，策略会马上生效。

注意：此教程中的密码策略只对非 root 用户有效，对 root 用户无效。

### 禁止使用旧密码 ###

找到同时有 “password” 和 “pam_unix.so” 字段并且附加有 “remember=5” 的那行，它表示禁止使用最近用过的5个密码（己使用过的密码会被保存在 /etc/security/opasswd 下面）。

Debian、Ubuntu 或 Linux Mint 系统上：

    $ sudo vi /etc/pam.d/common-password 

> password     [success=1 default=ignore]    pam_unix.so obscure sha512 remember=5

CentOS、Fedora、RHEL 系统上：

    $ sudo vi /etc/pam.d/system-auth 

> password   sufficient   pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5

### 设置最短密码长度 ###

找到同时有 “password” 和 “pam_cracklib.so” 字段并且附加有 “minlen=10” 的那行，它表示最小密码长度为（10 - 类型数量）。这里的 “类型数量” 表示不同的字符类型数量。PAM 提供4种类型符号作为密码（大写字母、小写字母、数字和标点符号）。如果你的密码同时用上了这4种类型的符号，并且你的 minlen 设为10，那么最短的密码长度允许是6个字符。

Debian、Ubuntu 或 Linux Mint 系统上：

    $ sudo vi /etc/pam.d/common-password 

> password   requisite    pam_cracklib.so retry=3 minlen=10 difok=3

CentOS、Fedora、RHEL 系统上： 

    $ sudo vi /etc/pam.d/system-auth 

> password   requisite   pam_cracklib.so retry=3 difok=3 minlen=10

### 设置密码复杂度 ###

找到同时有 “password” 和 “pam_cracklib.so” 字段并且附加有 “ucredit=-1 lcredit=-2 dcredit=-1 ocredit=-1” 的那行，它表示密码必须至少包含一个大写字母（ucredit），两个小写字母（lcredit），一个数字（dcredit）和一个标点符号（ocredit）。

Debian、Ubuntu 或 Linux Mint 系统上：

    $ sudo vi /etc/pam.d/common-password 

> password   requisite    pam_cracklib.so retry=3 minlen=10 difok=3 ucredit=-1 lcredit=-2 dcredit=-1 ocredit=-1

CentOS、Fedora、RHEL 系统上：

    $ sudo vi /etc/pam.d/system-auth 

> password   requisite   pam_cracklib.so retry=3 difok=3 minlen=10 ucredit=-1 lcredit=-2 dcredit=-1 ocredit=-1

### 设置密码过期期限 ###

编辑 /etc/login.defs 文件，可以设置当前密码的有效期限，具体变量如下所示：

    $ sudo vi /etc/login.defs 

> PASS_MAX_DAYS   150
> PASS_MIN_DAYS   0
> PASS_WARN_AGE   7

这些设置要求用户每6个月改变他们的密码，并且会提前7天提醒用户密码快到期了。

如果你想为每个用户设置不同的密码期限，使用 chage 命令。下面的命令可以查看某个用户的密码限期：

    $ sudo chage -l xmodulo 

> Last password change                                    : Dec 30, 2013
> Password expires                                        : never
> Password inactive                                       : never
> Account expires                                         : never
> Minimum number of days between password change          : 0
> Maximum number of days between password change          : 99999
> Number of days of warning before password expires       : 7

默认情况下，用户的密码永不过期。

下面的命令用于修改 xmodulo 用户的密码期限：

    $ sudo chage -E 6/30/2014 -m 5 -M 90 -I 30 -W 14 xmodulo 

上面的命令将密码期限设为2014年6月3日。另外，修改密码的最短周期为5天，最长周期为90天。密码过期前14天会发送消息提醒用户，过期后帐号会被锁住30天。

[![](http://farm4.staticflickr.com/3779/11640903324_474963b7bb.jpg)][2]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/set-password-policy-linux.html

译者：[bazz2](https://github.com/bazz2) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linux-pam.org/
[2]:http://www.flickr.com/photos/xmodulo/11640903324/
