在CentOS 7.x / Fedora 21 上面体验 PHP 7.0
===============================================================================

PHP是一种为我们熟知的通用服务器网页脚本语言。非常多的在线网站都是用PHP编写的。PHP这些年来一直在持续进化，丰富其功能，变得易于使用，更好地组织的脚本语言。目前PHP的开发团队正筹备下一个PHP版本的发行，名字是PHP 7。现在的PHP版本为PHP 5.6，可能你清楚PHP 6已经流产了，PHP 7的支持者们不希望下一个重要的版本被其他分支混淆，即过去已经停止很久的PHP 6。所以决定下一个PHP主要的发行版本叫PHP 7，而不是PHP 6。PHP 7.0预计在今年十一月份发行。

在下一代主要PHP版本里有一些不错的功能：

- 为了改善执行效率与内存占用，新的版本添加了PHPNG功能。
- 引入了JIT引擎来动态编译Zend操作码为自然机器码，以此来达到更快的处理性能。这项功能允许随后的程序调用同一份代码，这样会运行快很多。
- AST（抽象语法树）是最新添加的功能，它可以增强支持PHP的扩展性和用户应用。
- 添加异步编程功能以支持同一个请求中的并行任务。
- 新的版本会支持独立的多线程网页服务器，这样可以使用一个单独的存储池处理很多并发的请求。

### 在CentOS/Fedora上安装PHP 7 ###

让我们来看看怎样在CentOS 7和Fedora 21安装PHP7。为了安装PHP7，我们首先需要克隆php-src 仓库。当克隆工作完成，我们再配置和编译它。进行下一步之前，我们要确保已经在LInux系统下安装了如下的组件，否则PHP编译会返回错误中止。

- Git
- autoconf
- gcc
- bison

所有上面提到的要求可以使用Yum软件包管理器安装。以下一条命令即可完成：
	
	yum install git autoconf gcc bison

准备好开始安装PHP7了吗？让我们先创建一个PHP7目录，作为你的当前工作目录。
	
	mkdir php7

	cd php7

现在克隆php-src仓库，在终端里运行下面的命令。
	
	git clone https://git.php.net/repository/php-src.git

工作应该会在几分钟后完成，这里是一个样例输出，你应该会在任务完成时看见。

	[root@localhost php7]# git clone https://git.php.net/repository/php-src.git

    Cloning into 'php-src'...

    remote: Counting objects: 615064, done.

    remote: Compressing objects: 100% (127800/127800), done.

    remote: Total 615064 (delta 492063), reused 608718 (delta 485944)

    Receiving objects: 100% (615064/615064), 152.32 MiB | 16.97 MiB/s, done.

    Resolving deltas: 100% (492063/492063), done.

让我们来配置，编译PHP7，在终端运行下面的命令，开始配置工作：

	cd php-src

	./buildconf

下面是./buildconf命令的样例输出。

    [root@localhost php-src]# ./buildconf

    buildconf: checking installation...

    buildconf: autoconf version 2.69 (ok)

    rebuilding aclocal.m4

    rebuilding configure

    rebuilding main/php_config.h.in

使用下面的命令，继续配置进程：

	./configure \

    --prefix=$HOME/php7/usr \

    --with-config-file-path=$HOME/php7/usr/etc \

    --enable-mbstring \

    --enable-zip \

    --enable-bcmath \

    --enable-pcntl \

    --enable-ftp \

    --enable-exif \

    --enable-calendar \

    --enable-sysvmsg \

    --enable-sysvsem \

    --enable-sysvshm \

    --enable-wddx \

    --with-curl \

    --with-mcrypt \

    --with-iconv \

    --with-gmp \

    --with-pspell \

    --with-gd \

    --with-jpeg-dir=/usr \

    --with-png-dir=/usr \

    --with-zlib-dir=/usr \

    --with-xpm-dir=/usr \

    --with-freetype-dir=/usr \

    --with-t1lib=/usr \

    --enable-gd-native-ttf \

    --enable-gd-jis-conv \

    --with-openssl \

    --with-mysql=/usr \

    --with-pdo-mysql=/usr \

    --with-gettext=/usr \

    --with-zlib=/usr \

    --with-bz2=/usr \

    --with-recode=/usr \

    --with-mysqli=/usr/bin/mysql_config

这会花去不少的时间，当完成后你应该会看到如下面的输出：

    creating libtool

    appending configuration tag "CXX" to libtool

    Generating files

    configure: creating ./config.status

    creating main/internal_functions.c

    creating main/internal_functions_cli.c

    +--------------------------------------------------------------------+

    | License:                                                           |

    | This software is subject to the PHP License, available in this     |

    | distribution in the file LICENSE.  By continuing this installation |

    | process, you are bound by the terms of this license agreement.     |

    | If you do not agree with the terms of this license, you must abort |

    | the installation process at this point.                            |

    +--------------------------------------------------------------------+

     

    Thank you for using PHP.

     

    config.status: creating php7.spec

    config.status: creating main/build-defs.h

    config.status: creating scripts/phpize

    config.status: creating scripts/man1/phpize.1

    config.status: creating scripts/php-config

    config.status: creating scripts/man1/php-config.1

    config.status: creating sapi/cli/php.1

    config.status: creating sapi/cgi/php-cgi.1

    config.status: creating ext/phar/phar.1

    config.status: creating ext/phar/phar.phar.1

    config.status: creating main/php_config.h

    config.status: executing default commands

     
运行下面的命令，完成编译过程。

	make

“make”命令的样例输出如下所示：

    Generating phar.php

    Generating phar.phar

    PEAR package PHP_Archive not installed: generated phar will require PHP's phar extension be enabled.

    clicommand.inc

    directorytreeiterator.inc

    directorygraphiterator.inc

    pharcommand.inc

    invertedregexiterator.inc

    phar.inc

     

    Build complete.

    Don't forget to run 'make test'.

活儿干完了，该安装PHP7了，运行下面的命令安装它。
	
    make install

成功安装的进程的样例输出应该像这样：

    [root@localhost php-src]# make install

    Installing shared extensions:     /root/php7/usr/lib/php/extensions/no-debug-non-zts-20141001/

    Installing PHP CLI binary:        /root/php7/usr/bin/

    Installing PHP CLI man page:      /root/php7/usr/php/man/man1/

    Installing PHP CGI binary:        /root/php7/usr/bin/

    Installing PHP CGI man page:      /root/php7/usr/php/man/man1/

    Installing build environment:     /root/php7/usr/lib/php/build/

    Installing header files:          /root/php7/usr/include/php/

    Installing helper programs:       /root/php7/usr/bin/

    program: phpize

    program: php-config

    Installing man pages:             /root/php7/usr/php/man/man1/

    page: phpize.1

    page: php-config.1

    Installing PEAR environment:      /root/php7/usr/lib/php/

    [PEAR] Archive_Tar    - installed: 1.3.13

    [PEAR] Console_Getopt - installed: 1.3.1

    [PEAR] Structures_Graph- installed: 1.0.4

    [PEAR] XML_Util       - installed: 1.2.3

    [PEAR] PEAR           - installed: 1.9.5

    Wrote PEAR system config file at: /root/php7/usr/etc/pear.conf

    You may want to add: /root/php7/usr/lib/php to your php.ini include_path

    /root/php7/php-src/build/shtool install -c ext/phar/phar.phar /root/php7/usr/bin

    ln -s -f /root/php7/usr/bin/phar.phar /root/php7/usr/bin/phar

    Installing PDO headers:          /root/php7/usr/include/php/ext/pdo/

恭喜你，PHP7已经安装在你的Linux系统上了。安装完后，进入PHP7安装文件里的sapi/cli里面。

    cd sapi/cli

验证一下PHP的版本。

    [root@localhost cli]# ./php -v

    PHP 7.0.0-dev (cli) (built: Mar 28 2015 00:54:11)

    Copyright (c) 1997-2015 The PHP Group

    Zend Engine v3.0.0-dev, Copyright (c) 1998-2015 Zend Technologies

### 总结 ###

PHP 7也[添加到了remi仓库][1]，这个即将到来的版本主要关注执行效率的提升，它的新特性致力于使PHP较好满足现代编程的需求和趋势。PHP 7.0将会有许多新的特性、丢弃一些老版本的东西。在接下来的日子里，我们希望看到新特性和弃用功能的具体情况。希望你喜欢！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-php-7-centos-7-fedora-21/

作者：[Aun Raza][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:http://blog.famillecollet.com/post/2015/03/25/PHP-7.0-as-Software-Collection
