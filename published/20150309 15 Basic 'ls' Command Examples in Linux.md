Linux中的15个基本‘ls’命令示例
================================================================================
ls命令是Linux系统中最被频繁使用的命令之一，我相信ls命令一定是你进入一台Linux系统的电脑打开命令提示符后第一个使用的命令。我们每天都在频繁地使用ls命令,即使我们可能没有意识也从来用不到所有可用的选项。本文中，我们将讨论下一些基本的ls命令并且覆盖尽可能多的有关参数来讲解。

![Linux ls Command](http://www.tecmint.com/wp-content/uploads/2012/08/Linux-ls-Commands.png)

*Linux的ls命令*

### 1. 不带任何选项列出文件 ###

不带选项的ls命令来光秃秃地列出文件和目录，我们是不能看到像文件类型、大小、修改日期和时间、权限以及链接这样具体的信息的。

    # ls
    
    0001.pcap        Desktop    Downloads         index.html   install.log.syslog  Pictures  Templates
    anaconda-ks.cfg  Documents  fbcmd_update.php  install.log  Music               Public    Videos

### 2 带 –l 选项列出文件列表 ###

你看，ls -l（-l是字母不是“1”）就能展示出是文件还是目录，它的大小、修改日期和时间、文件或目录的名字以及文件的属主和它的权限。

    # ls -l
    
    total 176
    -rw-r--r--. 1 root root   683 Aug 19 09:59 0001.pcap
    -rw-------. 1 root root  1586 Jul 31 02:17 anaconda-ks.cfg
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Documents
    drwxr-xr-x. 4 root root  4096 Aug 16 02:55 Downloads
    -rw-r--r--. 1 root root 21262 Aug 12 12:42 fbcmd_update.php
    -rw-r--r--. 1 root root 46701 Jul 31 09:58 index.html
    -rw-r--r--. 1 root root 48867 Jul 31 02:17 install.log
    -rw-r--r--. 1 root root 11439 Jul 31 02:13 install.log.syslog
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Music
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Public
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Videos

### 3. 浏览隐藏文件 ###

列出所有文件包括以‘.’开头的隐藏文件。

    # ls -a
    
    .                .bashrc  Documents         .gconfd          install.log         .nautilus     .pulse-cookie
    ..               .cache   Downloads         .gnome2          install.log.syslog  .netstat.swp  .recently-used.xbel
    0001.pcap        .config  .elinks           .gnome2_private  .kde                .opera        .spice-vdagent
    anaconda-ks.cfg  .cshrc   .esd_auth         .gtk-bookmarks   .libreoffice        Pictures      .tcshrc
    .bash_history    .dbus    .fbcmd            .gvfs            .local              .pki          Templates
    .bash_logout     Desktop  fbcmd_update.php  .ICEauthority    .mozilla            Public        Videos
    .bash_profile    .digrc   .gconf            index.html       Music               .pulse        .wireshark

### 4. 用 -lh 选项来以易读方式列出文件  ###

用-lh组合选项，以易读方式来显示大小。

    # ls -lh
    
    total 176K
    -rw-r--r--. 1 root root  683 Aug 19 09:59 0001.pcap
    -rw-------. 1 root root 1.6K Jul 31 02:17 anaconda-ks.cfg
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Documents
    drwxr-xr-x. 4 root root 4.0K Aug 16 02:55 Downloads
    -rw-r--r--. 1 root root  21K Aug 12 12:42 fbcmd_update.php
    -rw-r--r--. 1 root root  46K Jul 31 09:58 index.html
    -rw-r--r--. 1 root root  48K Jul 31 02:17 install.log
    -rw-r--r--. 1 root root  12K Jul 31 02:13 install.log.syslog
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Music
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Public
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root 4.0K Jul 31 02:48 Videos

### 5. 以尾部以‘/’字符结尾的方式列出文件和目录 ###

使用 ls 命令的 -F 选项，会在每个目录的末尾添加“/”字符显示。

    # ls -F
    
    0001.pcap        Desktop/    Downloads/        index.html   install.log.syslog  Pictures/  Templates/
    anaconda-ks.cfg  Documents/  fbcmd_update.php  install.log  Music/              Public/    Videos/

### 6. 倒序列出文件 ###

ls -r 选项能以倒序方式显示文件和目录。

    # ls -r
    
    Videos     Public    Music               install.log  fbcmd_update.php  Documents  anaconda-ks.cfg
    Templates  Pictures  install.log.syslog  index.html   Downloads         Desktop    0001.pcap

### 7. 递归列出子目录 ###

ls -R 选项能列出非常长的目录树，来看看示例输出：

    # ls -R
    
    total 1384
    -rw-------. 1 root     root      33408 Aug  8 17:25 anaconda.log
    -rw-------. 1 root     root      30508 Aug  8 17:25 anaconda.program.log
    
    ./httpd:
    total 132
    -rw-r--r--  1 root root     0 Aug 19 03:14 access_log
    -rw-r--r--. 1 root root 61916 Aug 10 17:55 access_log-20120812
    
    ./lighttpd:
    total 68
    -rw-r--r--  1 lighttpd lighttpd  7858 Aug 21 15:26 access.log
    -rw-r--r--. 1 lighttpd lighttpd 37531 Aug 17 18:21 access.log-20120819
    
    ./nginx:
    total 12
    -rw-r--r--. 1 root root    0 Aug 12 03:17 access.log
    -rw-r--r--. 1 root root  390 Aug 12 03:17 access.log-20120812.gz

### 8. 以修改时间倒序列出 ###

带-ltr组合选项能以文件或目录的最新修改时间的次序来显示它们。

    # ls -ltr
    
    total 176
    -rw-r--r--. 1 root root 11439 Jul 31 02:13 install.log.syslog
    -rw-r--r--. 1 root root 48867 Jul 31 02:17 install.log
    -rw-------. 1 root root  1586 Jul 31 02:17 anaconda-ks.cfg
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Videos
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Public
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Music
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Documents
    -rw-r--r--. 1 root root 46701 Jul 31 09:58 index.html
    -rw-r--r--. 1 root root 21262 Aug 12 12:42 fbcmd_update.php
    drwxr-xr-x. 4 root root  4096 Aug 16 02:55 Downloads
    -rw-r--r--. 1 root root   683 Aug 19 09:59 0001.pcap

### 9. 按文件大小排序 ###

带-lS组合选项能按文件从大到小的次序显示。

    # ls -lS
    
    total 176
    -rw-r--r--. 1 root root 48867 Jul 31 02:17 install.log
    -rw-r--r--. 1 root root 46701 Jul 31 09:58 index.html
    -rw-r--r--. 1 root root 21262 Aug 12 12:42 fbcmd_update.php
    -rw-r--r--. 1 root root 11439 Jul 31 02:13 install.log.syslog
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Desktop
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Documents
    drwxr-xr-x. 4 root root  4096 Aug 16 02:55 Downloads
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Music
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Pictures
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Public
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Templates
    drwxr-xr-x. 2 root root  4096 Jul 31 02:48 Videos
    -rw-------. 1 root root  1586 Jul 31 02:17 anaconda-ks.cfg
    -rw-r--r--. 1 root root   683 Aug 19 09:59 0001.pcap

### 10. 显示文件或目录的索引节点号 ###

我们有时候可以看到一些数字打印在文件或目录名之前，带-i选项就能列出文件或目录的索引节点号。

    # ls -i
    
    20112 0001.pcap        23610 Documents         23793 index.html          23611 Music     23597 Templates
    23564 anaconda-ks.cfg  23595 Downloads            22 install.log         23612 Pictures  23613 Videos
    23594 Desktop          23585 fbcmd_update.php     35 install.log.syslog  23601 Public

### 11. 显示ls命令的版本 ###

查看ls命令的版本。

    # ls --version
    
    ls (GNU coreutils) 8.4
    Copyright (C) 2010 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    Written by Richard M. Stallman and David MacKenzie.

### 12. 显示帮助页面 ###

列出ls命令的选项帮助页面。

    # ls --help
    
    Usage: ls [OPTION]... [FILE]...

### 13. 列出目录信息 ###

用ls -l命令列出/tmp目录下的文件，其中-ld参数可以只显示/tmp目录的信息。

    # ls -l /tmp
    total 408
    drwx------. 2 narad narad   4096 Aug  2 02:00 CRX_75DAF8CB7768
    -r--------. 1 root  root  384683 Aug  4 12:28 htop-1.0.1.tar.gz
    drwx------. 2 root  root    4096 Aug  4 11:20 keyring-6Mfjnk
    drwx------. 2 root  root    4096 Aug 16 01:33 keyring-pioZJr
    drwx------. 2 gdm   gdm     4096 Aug 21 11:26 orbit-gdm
    drwx------. 2 root  root    4096 Aug 19 08:41 pulse-gl6o4ZdxQVrX
    drwx------. 2 narad narad   4096 Aug  4 08:16 pulse-UDH76ExwUVoU
    drwx------. 2 gdm   gdm     4096 Aug 21 11:26 pulse-wJtcweUCtvhn
    -rw-------. 1 root  root     300 Aug 16 03:34 yum_save_tx-2012-08-16-03-34LJTAa1.yumtx

----------

    # ls -ld /tmp/
    
    drwxrwxrwt. 13 root root 4096 Aug 21 12:48 /tmp/

### 14. 显示文件的UID和GID ###

用ls -n命令来显示文件和目录的UID（译者注：userid，用户ID）和GID（译者注：groupid，组ID）。

    # ls -n
    
    total 36
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Downloads
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Music
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Pictures
    -rw-rw-r--. 1 500 500   12 Aug 21 13:06 tmp.txt
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Videos

### 15. ls命令和它的别名 ###

我们给ls命令设置如下别名之后，当我们执行ls命令的时候它会默认执行-l选项并且像上文提到的那样显示长列表。

    # alias ls="ls -l"

注意：我们可以通过不加任何参数的alias命令来看到目前系统中可用的所有alias设置，当然它们同时也可以unalias来取消。

    # alias
    
    alias cp='cp -i'
    alias l.='ls -d .* --color=auto'
    alias ll='ls -l --color=auto'
    alias ls='ls --color=auto'
    alias mv='mv -i'
    alias rm='rm -i'
    alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

删除一项之前定义的alias设置，只需用unalias命令即可。

    # unalias ls

下篇文章我们将讨论更多更高级的ls命令以及示例，如果我们在本文有遗漏了任何东西，请通过评论让我们获悉。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/15-basic-ls-command-examples-in-linux/

作者：[Ravi Saive][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
