如何在 Ubuntu 中切换多个 PHP 版本
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/php-720x340.png)

有时，最新版本的安装包可能无法按预期工作。你的程序可能与更新的软件包不兼容，并且仅支持特定的旧版软件包。在这种情况下，你可以立即将有问题的软件包降级到其早期的工作版本。请参阅我们的旧指南，[在这][1]了解如何降级 Ubuntu 及其衍生版中的软件包以及[在这][1]了解如何降级 Arch Linux 及其衍生版中的软件包。但是，你无需降级某些软件包。我们可以同时使用多个版本。例如，假设你在测试部署在 Ubuntu 18.04 LTS 中的[LAMP 栈][3]的 PHP 程序。过了一段时间，你发现应用程序在 PHP 5.6 中工作正常，但在 PHP 7.2 中不正常（Ubuntu 18.04 LTS 默认安装 PHP 7.x）。你打算重新安装 PHP 或整个 LAMP 栈吗？但是没有必要。你甚至不必将 PHP 降级到其早期版本。在这个简短的教程中，我将向你展示如何在 Ubuntu 18.04 LTS 中切换多个 PHP 版本。它没你想的那么难。请继续阅读。

### 在多个 PHP 版本之间切换

要查看 PHP 的默认安装版本，请运行：

```
$ php -v
PHP 7.2.7-0ubuntu0.18.04.2 (cli) (built: Jul 4 2018 16:55:24) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies
with Zend OPcache v7.2.7-0ubuntu0.18.04.2, Copyright (c) 1999-2018, by Zend Technologies
```

如你所见，已安装的 PHP 的版本为 7.2.7。在测试你的程序几天后，你会发现你的程序不支持 PHP7.2。在这种情况下，同时使用 PHP5.x 和 PHP7.x 是个不错的主意，这样你就可以随时轻松地在任何支持的版本之间切换。

你不必删除 PHP7.x 或重新安装 LAMP 栈。你可以同时使用 PHP5.x 和 7.x 版本。

我假设你还没有在你的系统中卸载 PHP 5.6。万一你已将其删除，你可以使用下面的 PPA 再次安装它。

你可以从 PPA 中安装 PHP 5.6：

```
$ sudo add-apt-repository -y ppa:ondrej/php
$ sudo apt update
$ sudo apt install php5.6
```

#### 从 PHP 7.x 切换到 PHP 5.x.

首先使用命令禁用 PHP 7.2 模块：

```
$ sudo a2dismod php7.2
Module php7.2 disabled.
To activate the new configuration, you need to run:
systemctl restart apache2
```

接下来，启用 PHP 5.6 模块：

```
$ sudo a2enmod php5.6
```

将 PHP 5.6 设置为默认版本：

```
$ sudo update-alternatives --set php /usr/bin/php5.6
```

或者，你可以运行以下命令来设置默认情况下要使用的全局 PHP 版本。

```
$ sudo update-alternatives --config php
```

输入选择的号码将其设置为默认版本，或者只需按回车键保持当前选择。

如果你已安装其他 PHP 扩展，请将它们设置为默认值。

```
$ sudo update-alternatives --set phar /usr/bin/phar5.6
```

最后，重启 Apache Web 服务器：

```
$ sudo systemctl restart apache2
```

现在，检查 PHP 5.6 是否是默认版本：

```
$ php -v
PHP 5.6.37-1+ubuntu18.04.1+deb.sury.org+1 (cli)
Copyright (c) 1997-2016 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies
```

#### 从 PHP 5.x 切换到 PHP 7.x.

同样，你可以从 PHP 5.x 切换到 PHP 7.x 版本，如下所示。

```
$ sudo a2enmod php7.2
$ sudo a2dismod php5.6
$ sudo update-alternatives --set php /usr/bin/php7.2
$ sudo systemctl restart apache2
```

**提醒一句：**

最终稳定版 PHP 5.6 于 2017 年 1 月 19 日达到[**活跃支持截止**][4]。但是，直到 2018 年 12 月 31 日，PHP 5.6 将继续获得对关键安全问题的支持。所以，建议尽快升级所有 PHP 程序并与 PHP 7.x 兼容。

如果你希望防止 PHP 将来自动升级，请参阅以下指南。

就是这些了。希望这有帮助。还有更多的好东西。敬请关注！

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-switch-between-multiple-php-versions-in-ubuntu/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/how-to-downgrade-a-package-in-ubuntu/
[2]:https://www.ostechnix.com/downgrade-package-arch-linux/
[3]:https://www.ostechnix.com/install-apache-mariadb-php-lamp-stack-ubuntu-16-04/
[4]:http://php.net/supported-versions.php
