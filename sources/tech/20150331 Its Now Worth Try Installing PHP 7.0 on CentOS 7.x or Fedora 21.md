translating wi-cuckoo LLAP
Its Now Worth Try Installing PHP 7.0 on CentOS 7.x / Fedora 21
================================================================================
PHP is a well known general purpose, server side web scripting language. A vast majority of online websites are coded in this language. PHP is ever evolving, feature rich, easy to use and well organized scripting language.  Currently PHP development team is working on next major release of PHP, named PHP 7. The current production PHP version is PHP 5.6, as you might already know that PHP 6 was aborted in the past, the supporters of PHP 7 did not want the next important PHP version to be confused with that branch that was killed long time in the past. So it has been decided to name the next major release of PHP as PHP 7 instead of 6.  PHP 7.0 is supposed to be released in November this year.

Here are some of the prominent features in next major PHP release.

- In order to improve performance and memory footprints PHPNG feature has been added to this new release.
- JIT engine has been included to dynamically compile Zend opcodes into native machine code in order to achieve faster processing. This feature will allow subsequent calls to the same code so that it may run much faster.
- AST (Abstract Syntax Tree) is a newly added feature which will enhance support for php extensions and userland applications.
- Asynchronous Programming feature will add support for parallel tasks within the same request.
- New version will support for stand alone multi-threading web server so that it may handle many simultaneous requests using a single memory pool.

### Installing PHP 7 on Centos / Fedora ###

Lets see how we can install PHP7 on Centos 7 and Fedora 21.  In order to install PHP7 we will need to first clone php-src repository. Once cloning process is complete, we will configure and compile it. Before we proceed, lets ensure that we do have followings installed on our Linux system otherwise PHP compile process will return errors and abort.

- Git
- autoconf
- gcc
- bison

All of the above metioned prerequisits can be installed using Yum package manager. The following single command should take care of this:

    yum install git autoconf gcc bison

Ready to start PHP7 installation process ? Lets first create PHP7 directory and make it your working directory.

    mkdir php7

    cd php7

Now clone php-src repo, run following command on the terminal.

    git clone https://git.php.net/repository/php-src.git

The process should complete in few min, here is sample output which you should see at the completion of this task.

    [root@localhost php7]# git clone https://git.php.net/repository/php-src.git

    Cloning into 'php-src'...

    remote: Counting objects: 615064, done.

    remote: Compressing objects: 100% (127800/127800), done.

    remote: Total 615064 (delta 492063), reused 608718 (delta 485944)

    Receiving objects: 100% (615064/615064), 152.32 MiB | 16.97 MiB/s, done.

    Resolving deltas: 100% (492063/492063), done.

Lets configure and compile PHP7, run following commands on the terminal to start the configuration process:

     cd php-src

    ./buildconf

Here is sample output for ./buildconf command.

    [root@localhost php-src]# ./buildconf

    buildconf: checking installation...

    buildconf: autoconf version 2.69 (ok)

    rebuilding aclocal.m4

    rebuilding configure

    rebuilding main/php_config.h.in

Proceed further with the configuration process using following command:

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

It will take a sweet amount to time, once completed, you should see output like this:

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

     

Run following command to complete the compilation process.

    make

Sample output for “make” command is shown below:

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

That’s all, its time to install PHP7 now, run following to install it.

    make install

Sample output for successful install process should look like:

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

Conguratulaion, PHP 7 has been installed on your Linux system now. Once installation is complete, move to sapi/cli direcoty inside php7 installation folder.

    cd  sapi/cli

and verify PHP version from here.

    [root@localhost cli]# ./php -v

    PHP 7.0.0-dev (cli) (built: Mar 28 2015 00:54:11)

    Copyright (c) 1997-2015 The PHP Group

    Zend Engine v3.0.0-dev, Copyright (c) 1998-2015 Zend Technologies

### Conclusion ###

PHP 7 is also [added in remi repositories][1], this upcoming version is mainly focused on performance improvements, its new features are aimed to make PHP as a well fit for modern programming needs and trends. PHP 7.0 will have many new features and some deprecations to the old items. We hope to see details about new features and deprecations in the coming months. Enjoy!

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-php-7-centos-7-fedora-21/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:http://blog.famillecollet.com/post/2015/03/25/PHP-7.0-as-Software-Collection
