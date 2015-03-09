15 Basic ‘ls’ Command Examples in Linux
================================================================================
ls command is one of the most frequently used command in Linux. I believe ls command is the first command you may use when you get into the command prompt of Linux Box. We use ls command daily basis and frequently even though we may not aware and never use all the option available. In this article, we’ll be discussing basic ls command where we have tried to cover as much parameters as possible.

![Linux ls Command](http://www.tecmint.com/wp-content/uploads/2012/08/Linux-ls-Commands.png)
Linux ls Command

### 1. List Files using ls with no option ###

ls with no option list files and directories in bare format where we won’t be able to view details like file types, size, modified date and time, permission and links etc.

    # ls
    
    0001.pcap        Desktop    Downloads         index.html   install.log.syslog  Pictures  Templates
    anaconda-ks.cfg  Documents  fbcmd_update.php  install.log  Music               Public    Videos

### 2 List Files With option –l ###

Here, ls -l (-l is character not one) shows file or directory, size, modified date and time, file or folder name and owner of file and it’s permission.

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

### 3. View Hidden Files ###

List all files including hidden file starting with ‘.‘.

    # ls -a
    
    .                .bashrc  Documents         .gconfd          install.log         .nautilus     .pulse-cookie
    ..               .cache   Downloads         .gnome2          install.log.syslog  .netstat.swp  .recently-used.xbel
    0001.pcap        .config  .elinks           .gnome2_private  .kde                .opera        .spice-vdagent
    anaconda-ks.cfg  .cshrc   .esd_auth         .gtk-bookmarks   .libreoffice        Pictures      .tcshrc
    .bash_history    .dbus    .fbcmd            .gvfs            .local              .pki          Templates
    .bash_logout     Desktop  fbcmd_update.php  .ICEauthority    .mozilla            Public        Videos
    .bash_profile    .digrc   .gconf            index.html       Music               .pulse        .wireshark

### 4. List Files with Human Readable Format with option -lh ###

With combination of -lh option, shows sizes in human readable format.

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

### 5. List Files and Directories with ‘/’ Character at the end ###

Using -F option with ls command, will add the ‘/’ Character at the end each directory.

    # ls -F
    
    0001.pcap        Desktop/    Downloads/        index.html   install.log.syslog  Pictures/  Templates/
    anaconda-ks.cfg  Documents/  fbcmd_update.php  install.log  Music/              Public/    Videos/

### 6. List Files in Reverse Order ###

The following command with ls -r option display files and directories in reverse order.

    # ls -r
    
    Videos     Public    Music               install.log  fbcmd_update.php  Documents  anaconda-ks.cfg
    Templates  Pictures  install.log.syslog  index.html   Downloads         Desktop    0001.pcap

### 7. Recursively list Sub-Directories ###

ls -R option will list very long listing directory trees. See an example of output of the command.

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

### 8. Reverse Output Order ###

With combination of -ltr will shows latest modification file or directory date as last.

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

### 9. Sort Files by File Size ###

With combination of -lS displays file size in order, will display big in size first.

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

### 10. Display Inode number of File or Directory ###

We can see some number printed before file / directory name. With -i options list file / directory with inode number.

    # ls -i
    
    20112 0001.pcap        23610 Documents         23793 index.html          23611 Music     23597 Templates
    23564 anaconda-ks.cfg  23595 Downloads            22 install.log         23612 Pictures  23613 Videos
    23594 Desktop          23585 fbcmd_update.php     35 install.log.syslog  23601 Public

### 11. Shows version of ls command ###

Check version of ls command.

    # ls --version
    
    ls (GNU coreutils) 8.4
    Copyright (C) 2010 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    Written by Richard M. Stallman and David MacKenzie.

### 12. Show Help Page ###

List help page of ls command with their option.

    # ls --help
    
    Usage: ls [OPTION]... [FILE]...

### 13. List Directory Information ###

With ls -l command list files under directory /tmp. Wherein with -ld parameters displays information of /tmp directory.

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

### 14. Display UID and GID of Files ###

To display UID and GID of files and directories. use option -n with ls command.

    # ls -n
    
    total 36
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Downloads
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Music
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Pictures
    -rw-rw-r--. 1 500 500   12 Aug 21 13:06 tmp.txt
    drwxr-xr-x. 2 500 500 4096 Aug  2 01:52 Videos

### 15. ls command and it’s Aliases ###

We have made alias for ls command, when we execute ls command it’ll take -l option by default and display long listing as mentioned earlier.

    # alias ls="ls -l"

Note: We can see number of alias available in your system with below alias command and same can be unalias as shown below example.

    # alias
    
    alias cp='cp -i'
    alias l.='ls -d .* --color=auto'
    alias ll='ls -l --color=auto'
    alias ls='ls --color=auto'
    alias mv='mv -i'
    alias rm='rm -i'
    alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

To remove an alias previously defined, just use the unalias command.

    # unalias ls

In our next article we’ll cover up more or advanced ls command with their examples. If we’ve missed anything in the list, please update us via comment section.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/15-basic-ls-command-examples-in-linux/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/