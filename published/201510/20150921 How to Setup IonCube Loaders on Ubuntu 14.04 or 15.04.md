如何在Ubuntu 14.04 / 15.04中设置IonCube Loaders
================================================================================
IonCube Loaders是一个PHP中用于加解密的工具，并带有加速页面运行的功能。它也可以保护你的PHP代码不会查看和运行在未授权的计算机上。要使用ionCube编码、加密的PHP文件，需要在web服务器上安装一个叫ionCube Loader的文件，并需要让 PHP 可以访问到，很多 PHP 应用都在用它。它可以在运行时读取并执行编码过后的代码。PHP只需在‘php.ini’中添加一行就可以使用这个loader。

### 前提条件 ###

在这篇文章中，我们将在Ubuntu14.04/15.04安装Ioncube Loader ，以便它可以在所有PHP模式中使用。本教程的唯一要求就是你系统安装了LEMP，并有“php.ini”文件。

### 下载 IonCube Loader ###

根据你系统的架构是32位或者64位来下载最新的IonCube loader包。你可以用超级用户权限或者root用户运行下面的命令。

    # wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz

![download ioncube](http://blog.linoxide.com/wp-content/uploads/2015/09/download1.png)

下载完成后用下面的命令解压到“/usr/local/src/"。

    # tar -zxvf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local/src/

![extracting archive](http://blog.linoxide.com/wp-content/uploads/2015/09/2-extract.png)

解压完成后我们就可以看到所有提供的模块。但是我们只需要我们所安装的PHP版本的对应模块。

要检查PHP版本，你可以运行下面的命令来找出相应的模块。

    # php -v

![ioncube modules](http://blog.linoxide.com/wp-content/uploads/2015/09/modules.png)

根据上面的命令我们知道我们安装的是PHP 5.6.4，因此我们需要拷贝合适的模块到PHP模块目录下。

首先我们在“/usr/local/”创建一个叫“ioncube”的目录并复制所需的ioncube loader到这里。

    root@ubuntu-15:/usr/local/src/ioncube# mkdir /usr/local/ioncube
    root@ubuntu-15:/usr/local/src/ioncube# cp ioncube_loader_lin_5.6.so ioncube_loader_lin_5.6_ts.so /usr/local/ioncube/

### PHP 配置 ###

我们要在位于"/etc/php5/cli/"文件夹下的"php.ini"中加入如下的配置行并重启web服务和php模块。

    # vim /etc/php5/cli/php.ini

![ioncube zend extension](http://blog.linoxide.com/wp-content/uploads/2015/09/zend-extension.png)

此时我们安装的是nginx，因此我们用下面的命令来重启服务。

    # service php5-fpm restart
    # service nginx restart

![web services](http://blog.linoxide.com/wp-content/uploads/2015/09/web-services.png)

### 测试 IonCube Loader ###

要为我们的网站测试ioncube loader。用下面的内容创建一个"info.php"文件并放在网站的web目录下。

    # vim /usr/share/nginx/html/info.php

加入phpinfo的脚本后重启web服务后用域名或者ip地址访问“info.php”。

你会在最下面的php模块信息里看到下面这段。

![php info](http://blog.linoxide.com/wp-content/uploads/2015/09/php-info.png)

在终端中运行下面的命令来验证php版本并显示PHP Loader已经启用了。

    # php -v

![php ioncube loader](http://blog.linoxide.com/wp-content/uploads/2015/09/php-ioncube.png)

上面的php版本输出明显地显示了IonCube loader已经成功与PHP集成了。

### 总结 ###

教程的最后你已经了解了如何在安装有nginx的Ubuntu中安装和配置ionCube Loader，如果你正在使用其他的web服务，这与其他服务没有明显的差别。因此安装Loader是很简单的，并且在大多数服务器上的安装都不会有问题。然而并没有一个所谓的“标准PHP安装”，服务可以通过许多方式安装，并启用或者禁用功能。

如果你是在共享服务器上，那么确保运行了ioncube-loader-helper.php脚本，并点击链接来测试运行时安装。如果安装时你仍然遇到了问题，欢迎联系我们及给我们留下评论。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-ioncube-loaders-ubuntu-14-04-15-04/

作者：[Kashif Siddique][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
