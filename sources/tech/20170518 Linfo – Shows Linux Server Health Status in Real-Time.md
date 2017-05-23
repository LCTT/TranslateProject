ucasFL translating
Linfo – Shows Linux Server Health Status in Real-Time
============================================================


Linfo is a free and open source, cross-platform server statistics UI/library which displays a great deal of system information. It is extensible, easy-to-use (via composer) PHP5 library to get extensive system statistics programmatically from your PHP application. It’s a Ncurses CLI view of Web UI, which works in Linux, Windows, *BSD, Darwin/Mac OSX, Solaris, and Minix.

It displays system info including [CPU type/speed][2]; architecture, mount point usage, hard/optical/flash drives, hardware devices, network devices and stats, uptime/date booted, hostname, memory usage (RAM and swap, if possible), temperatures/voltages/fan speeds and RAID arrays.

#### Requirements:

*   PHP 5.3

*   pcre extension

*   Linux – /proc and /sys mounted and readable by PHP and Tested with the 2.6.x/3.x kernels

### How to Install Linfo Server Stats UI/library in Linux

First, create a Linfo directory in your Apache or Nginx web root directory, then clone and move repository files into `/var/www/html/linfo` using the [rsync command][3] as shown below:

```
$ sudo mkdir -p /var/www/html/linfo 
$ git clone git://github.com/jrgp/linfo.git 
$ sudo rsync -av linfo/ /var/www/html/linfo/
```

Then rename sample.config.inc.php to config.inc.php. This is the Linfo config file, you can define your own values in it:

```
$ sudo mv sample.config.inc.php config.inc.php 
```

Now open the URL `http://SERVER_IP/linfo` in web browser to see the Web UI as shown in the screenshots below.

This screenshot shows the Linfo Web UI displaying core system info, hardware components, RAM stats, network devices, drives and file system mount points.

 [![Linux Server Health Information](https://www.tecmint.com/wp-content/uploads/2017/05/Linux-Server-Health-Information.png)][4] 

Linux Server Health Information

You can add the line below in the config file `config.inc.php` to yield useful error messages for troubleshooting purposes:

```
$settings['show_errors'] = true;
```

### Running Linfo in Ncurses Mode

Linfo has a simple ncurses-based interface, which rely on php’s ncurses extension.

```
# yum install php-pecl-ncurses                    [On CentOS/RHEL]
# dnf install php-pecl-ncurses                    [On Fedora]
$ sudo apt-get install php5-dev libncurses5-dev   [On Debian/Ubuntu] 
```

Now compile the php extension as follows

```
$ wget http://pecl.php.net/get/ncurses-1.0.2.tgz
$ tar xzvf ncurses-1.0.2.tgz
$ cd ncurses-1.0.2
$ phpize # generate configure script
$ ./configure
$ make
$ sudo make install
```

Next, if you successfully compiled and installed the php extension, run the commands below.

```
$ sudo echo extension=ncurses.so > /etc/php5/cli/conf.d/ncurses.ini
```

Verify the ncurses.

```
$ php -m | grep ncurses
```

Now run the Linfo.

```
$ cd /var/www/html/linfo/
$ ./linfo-curses
```
 [![Linux Server Information](https://www.tecmint.com/wp-content/uploads/2017/05/Linux-Server-Information.png)][5] 

Linux Server Information

The following features yet to be added in Linfo:

1.  Support for more Unix operating systems (such as Hurd, IRIX, AIX, HP UX, etc)

2.  Support for less known operating systems: Haiku/BeOS

3.  Extra superfluous features/extensions

4.  Support for [htop-like][1] features in ncurses mode

For more information, visit Linfo Github repository: [https://github.com/jrgp/linfo][6]

That’s all! From now on, you can view a Linux system’s information from within a web browser using Linfo. Try it out and share with us your thoughts in the comments. Additionally, have you come across any similar useful tools/libraries? If yes, then give us some info about them as well.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

---------------

via: https://www.tecmint.com/linfo-shows-linux-server-health-status-in-real-time/

作者：[ Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
