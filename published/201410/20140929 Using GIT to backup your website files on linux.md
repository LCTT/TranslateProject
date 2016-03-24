使用 GIT 备份 linux 上的网页文件
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/09/git_logo-1024x480-580x271.png)

BUP 并不单纯是 Git, 而是一款基于 Git 的软件. 一般情况下, 我使用 rsync 来备份我的文件, 而且迄今为止一直工作的很好. 唯一的不足就是无法把文件恢复到某个特定的时间点. 因此, 我开始寻找替代品, 结果发现了 BUP, 一款基于 git 的软件, 它将数据存储在一个仓库中, 并且有将数据恢复到特定时间点的选项.

要使用 BUP, 你先要初始化一个空的仓库, 然后备份所有文件. 当 BUP 完成一次备份是, 它会创建一个还原点, 你可以过后还原到这里. 它还会创建所有文件的索引, 包括文件的属性和验校和. 当要进行下一个备份时, BUP 会对比文件的属性和验校和, 只保存发生变化的数据. 这样可以节省很多空间.

### 安装 BUP (在 Centos 6 & 7 上测试通过) ###

首先确保你已经安装了 RPMFORGE 和 EPEL 仓库

    [techarena51@vps ~]$ sudo yum groupinstall "Development Tools"
    [techarena51@vps ~]$ sudo yum install python python-devel
    [techarena51@vps ~]$ sudo yum install fuse-python pyxattr pylibacl
    [techarena51@vps ~]$ sudo yum install perl-Time-HiRes
    [techarena51@vps ~]$ git clone git://github.com/bup/bup
    [techarena51@vps ~]$ cd bup
    [techarena51@vps ~]$ make
    [techarena51@vps ~]$ make test
    [techarena51@vps ~]$ sudo make install

对于 debian/ubuntu 用户, 你可以使用 "apt-get build-dep bup". 要获得更多的信息, 可以查看 https://github.com/bup/bup

在 CentOS 7 上, 当你运行 "make test" 时可能会出错, 但你可以继续运行 "make install".

第一步时初始化一个空的仓库, 就像 git 一样.

    [techarena51@vps ~]$ bup init

默认情况下, bup 会把仓库存储在 "~/.bup" 中, 但你可以通过设置环境变量 "export BUP_DIR=/mnt/user/bup" 来改变设置.

然后, 创建所有文件的索引. 这个索引, 就像之前讲过的那样, 存储了一系列文件和它们的属性及 git 目标 id (sha1 哈希表). (属性包括了软链接, 权限和不可改变字节)

    bup index /path/to/file
    bup save -n nameofbackup /path/to/file
    
    #Example
    [techarena51@vps ~]$ bup index /var/www/html
    Indexing: 7973, done (4398 paths/s).
    bup: merging indexes (7980/7980), done.
    
    [techarena51@vps ~]$ bup save -n techarena51 /var/www/html
    
    Reading index: 28, done.
    Saving: 100.00% (4/4k, 28/28 files), done.
    bloom: adding 1 file (7 objects).
    Receiving index from server: 1268/1268, done.
    bloom: adding 1 file (7 objects).

"BUP save" 会把所有内容分块, 然后把它们作为对象储存. "-n" 选项指定备份名.

你可以查看备份列表和已备份文件.

    [techarena51@vps ~]$ bup ls
    local-etc    techarena51  test
    #Check for a list of backups available for my site
    [techarena51@vps ~]$ bup ls techarena51
    2014-09-24-064416  2014-09-24-071814  latest
    #Check for the files available in these backups
    [techarena51@vps ~]$ bup ls techarena51/2014-09-24-064416/var/www/html
    apc.php                      techarena51.com              wp-config-sample.php         wp-load.php

在同一个服务器上备份文件从来不是一个好的选择. BUP 允许你远程备份网页文件, 但你必须保证你的 SSH 密钥和 BUP 都已经安装在远程服务器上.

    bup index path/to/dir
    bup save-r remote-vps.com -n backupname path/to/dir

### 例子: 备份 "/var/www/html" 文件夹 ###

    [techarena51@vps ~]$bup index /var/www/html
    [techarena51@vps ~]$ bup save -r user@remotelinuxvps.com: -n techarena51 /var/www/html
    Reading index: 28, done.
    Saving: 100.00% (4/4k, 28/28 files), done.
    bloom: adding 1 file (7 objects).
    Receiving index from server: 1268/1268, done.
    bloom: adding 1 file (7 objects).

### 恢复备份 ###

登入远程服务器并输入下面的命令

    [techarena51@vps ~]$bup restore -C ./backup techarena51/latest
    
    #Restore an older version of the entire working dir elsewhere
    [techarena51@vps ~]$bup restore -C /tmp/bup-out /testrepo/2013-09-29-195827
    #Restore one individual file from an old backup
    [techarena51@vps ~]$bup restore -C /tmp/bup-out /testrepo/2013-09-29-201328/root/testbup/binfile1.bin

唯一的缺点是你不能把文件恢复到另一个服务器, 你必须通过 SCP 或者 rsync 手动复制文件.

通过集成的 web 服务器查看备份.

    bup web
    #specific port
    bup web :8181

你可以使用 shell 脚本来运行 bup, 并建立一个每日运行的定时任务.

    #!/bin/bash
    
    bup index /var/www/html 
    bup save -r user@remote-vps.com: -n techarena51 /var/www/html 

BUP 并不完美, 但它的确能够很好地完成任务. 我当然非常愿意看到这个项目的进一步开发, 希望以后能够增加远程恢复的功能.

你也许喜欢阅读这篇——使用[inotify-tools][1]实时文件同步. 

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/using-git-backup-website-files-on-linux/

作者：[Leo G][a]
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://techarena51.com/index.php/inotify-tools-example/
