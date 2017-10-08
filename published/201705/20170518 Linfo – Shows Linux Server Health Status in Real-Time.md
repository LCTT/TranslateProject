Linfo：实时显示你的 Linux 服务器运行状况
============================================================


Linfo 是一个自由开源的跨平台的服务器统计 UI 或库，它可以显示大量的系统信息。Linfo 是可扩展的，通过 `composer`，很容易使用 PHP5 库以程序化方式获取来自 PHP 应用的丰富的系统统计数据。它有 Web UI 及其Ncurses CLI 视图，在 Linux、Windows、BSD、Darwin/Mac OSX、Solaris 和 Minix 系统上均可用。

Linfo 显示的系统信息包括 [CPU 类型/速度][2]、服务器的体系结构、挂载点用量、硬盘/光纤／Flash 驱动器、硬件设备、网络设备和统计信息、运行时间／启动日期、主机名、内存使用量（RAM 和 swap）、温度/电压/风扇速度和 RAID 阵列等。

### 环境要求：

*   PHP 5.3
*   pcre 扩展
*   Linux – `/proc` 和 `/sys` 已挂载且可对 `PHP` 可读，已经在 2.6.x/3.x 内核中测试过

### 如何在 Linux 中安装 Linfo 服务器统计 UI及库

首先，在 Apache 或 Nginx 的 Web 根目录下创建 Linfo 的目录，然后，使用下面展示的 [rsync 命令][3] 克隆仓库文件并将其移动到目录 `/var/www/html/linfo` 下：

```
$ sudo mkdir -p /var/www/html/linfo 
$ git clone git://github.com/jrgp/linfo.git 
$ sudo rsync -av linfo/ /var/www/html/linfo/
```

接下来，将 `sample.config.inc.php` 重命名为 `config.inc.php`。这是 Linfo 的配置文件，你可以在里面定义你想要的值：

```
$ sudo mv sample.config.inc.php config.inc.php 
```

现在，在 Web 浏览器中打开链接 `http://SERVER_IP/linfo` 来查看这个 Web UI，正如下面的截图所展示的。

从截图中可以看到， Linfo 显示了系统内核信息、硬件组成、RAM 统计、网络设备、驱动器以及文件系统挂载点。

 [![Linux Server Health Information](https://www.tecmint.com/wp-content/uploads/2017/05/Linux-Server-Health-Information.png)][4] 

*Linux 服务器运行信息*

你可以将下面一行内容加入配置文件 `config.inc.php` 中，以便进行故障排查时看到错误信息。

```
$settings['show_errors'] = true;
```

### 以 Ncurses 模式运行 Linfo

Linfo 有一个基于 `ncurses` 的简单界面，它依赖于 `php` 的 `ncurses` 扩展。

```
# yum install php-pecl-ncurses                    [在 CentOS/RHEL 上]
# dnf install php-pecl-ncurses                    [在 Fedora 上]
$ sudo apt-get install php5-dev libncurses5-dev   [在 Debian/Ubuntu 上] 
```

现在，像下面这样编译这个 php 扩展：

```
$ wget http://pecl.php.net/get/ncurses-1.0.2.tgz
$ tar xzvf ncurses-1.0.2.tgz
$ cd ncurses-1.0.2
$ phpize # generate configure script
$ ./configure
$ make
$ sudo make install
```

接下来，如果编译成功并安装好了该 php 扩展，运行下面的命令：

```
$ sudo echo extension=ncurses.so > /etc/php5/cli/conf.d/ncurses.ini
```

验证 ncurse：

```
$ php -m | grep ncurses
```

现在，运行 Info：

```
$ cd /var/www/html/linfo/
$ ./linfo-curses
```

[![Linux Server Information](https://www.tecmint.com/wp-content/uploads/2017/05/Linux-Server-Information.png)][5] 

*Linux 服务器信息*

Info 中尚欠缺下面这些功能：

1.  支持更多 Unix 操作系统（比如 Hurd、IRIX、AIX 和 HP UX 等）
2.  支持不太出名的操作系统 Haiku/BeOS
3.  额外功能/扩展
5.  在 ncurses 模式中支持 [htop 类][1] 特性

如果想了解更多信息，请访问 Linfo 的 GitHub 仓库： [https://github.com/jrgp/linfo][6]

这就是本文的全部内容了。从现在起，你可以使用 Linfo 在 Web 浏览器中查看 Linux 系统的信息。尝试一下，并在评论中和我们分享你的想法。另外，你是否还知道与之类似的有用工具/库？如果有，请给我们提供一些相关信息。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux 系统管理员和网络开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识

---------------

via: https://www.tecmint.com/linfo-shows-linux-server-health-status-in-real-time/

作者：[Aaron Kili][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/
[2]:https://www.tecmint.com/corefreq-linux-cpu-monitoring-tool/
[3]:https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[4]:https://www.tecmint.com/wp-content/uploads/2017/05/Linux-Server-Health-Information.png
[5]:https://www.tecmint.com/wp-content/uploads/2017/05/Linux-Server-Information.png
[6]:https://github.com/jrgp/linfo
[7]:https://www.tecmint.com/author/aaronkili/
[8]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[9]:https://www.tecmint.com/free-linux-shell-scripting-books/
