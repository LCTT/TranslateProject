Linux有问必答：如何检查MariaDB服务端版本
================================================================================
> **提问**: 我使用的是一台运行MariaDB的VPS。我该如何检查MariaDB服务端的版本？

有时候你需要知道你的数据库版本，比如当你升级你数据库或对已知缺陷打补丁时。这里有几种方法找出MariaDB版本的方法。

### 方法一 ###

第一种找出版本的方法是登录MariaDB服务器，登录之后，你会看到一些MariaDB的版本信息。

![](https://farm6.staticflickr.com/5807/20669891016_91249d3239_c.jpg)

另一种方法是在登录MariaDB后出现的命令行中输入‘status’命令。输出会显示服务器的版本还有协议版本。

![](https://farm6.staticflickr.com/5801/20669891046_73f60e5c81_c.jpg)

### 方法二 ###

如果你不能访问MariaDB服务器，那么你就不能用第一种方法。这种情况下你可以根据MariaDB的安装包的版本来推测。这种方法只有在MariaDB通过包管理器安装的才有用。

你可以用下面的方法检查MariaDB的安装包。

#### Debian、Ubuntu或者Linux Mint: ####

    $ dpkg -l | grep mariadb

下面的输出说明MariaDB的版本是10.0.17。

![](https://farm1.staticflickr.com/607/20669890966_b611fcd915_c.jpg)

#### Fedora、CentOS或者 RHEL: ####

    $ rpm -qa | grep mariadb

下面的输出说明安装的版本是5.5.41。

![](https://farm1.staticflickr.com/764/20508160748_23d9808256_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-mariadb-server-version.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
