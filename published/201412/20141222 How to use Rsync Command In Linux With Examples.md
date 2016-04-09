如何在Linux下使用rsync
================================================================================
对于各种组织和公司，数据对他们是最重要的，即使对于电子商务，数据也是同样重要的。Rsync是一款通过网络备份重要数据的工具/软件。它同样是一个在类Unix和Window系统上通过网络在系统间同步文件夹和文件的网络协议。Rsync可以复制或者显示目录并复制文件。Rsync默认监听TCP 873端口，通过远程shell如rsh和ssh复制文件。Rsync必须在远程和本地系统上都安装。

rsync的主要好处是：

**速度**：最初会在本地和远程之间拷贝所有内容。下次，只会传输发生改变的块或者字节。

**安全**：传输可以通过ssh协议加密数据。

**低带宽**：rsync可以在两端压缩和解压数据块。

语法:

	#rsysnc [options] source path destination path

### 示例： 1 - 启用压缩 ###

    [root@localhost /]# rsync -zvr /home/aloft/ /backuphomedir
    building file list ... done
    .bash_logout
    .bash_profile
    .bashrc
    sent 472 bytes received 86 bytes 1116.00 bytes/sec
    total size is 324 speedup is 0.58

上面的rsync命令使用了-z来启用压缩，-v是可视化，-r是递归。上面在本地的/home/aloft/和/backuphomedir之间同步。

### 示例： 2 - 保留文件和文件夹的属性 ###

    [root@localhost /]# rsync -azvr /home/aloft/ /backuphomedir
    building file list ... done
    ./
    .bash_logout
    .bash_profile
    .bashrc

    sent 514 bytes received 92 bytes 1212.00 bytes/sec
    total size is 324 speedup is 0.53

上面我们使用了-a选项，它保留了所有人和所属组、时间戳、软链接、权限，并以递归模式运行。

### 示例： 3 - 同步本地到远程主机 ###

    root@localhost /]# rsync -avz /home/aloft/ azmath@192.168.1.4:192.168.1.4:/share/rsysnctest/
    Password:

    building file list ... done
    ./
    .bash_logout
    .bash_profile
    .bashrc
    sent 514 bytes received 92 bytes 1212.00 bytes/sec
    total size is 324 speedup is 0.53

上面的命令允许你在本地和远程机器之间同步。你可以看到，在同步文件到另一个系统时提示你输入密码。在做远程同步时，你需要指定远程系统的用户名和IP或者主机名。

### 示例： 4 - 远程同步到本地 ###

    [root@localhost /]# rsync -avz azmath@192.168.1.4:192.168.1.4:/share/rsysnctest/ /home/aloft/
    Password:
    building file list ... done
    ./
    .bash_logout
    .bash_profile
    .bashrc
    sent 514 bytes received 92 bytes 1212.00 bytes/sec
    total size is 324 speedup is 0.53

上面的命令同步远程文件到本地。

### 示例： 5 - 找出文件间的不同 ###

    [root@localhost backuphomedir]# rsync -avzi /backuphomedir /home/aloft/
    building file list ... done
    cd+++++++ backuphomedir/
    >f+++++++ backuphomedir/.bash_logout
    >f+++++++ backuphomedir/.bash_profile
    >f+++++++ backuphomedir/.bashrc
    >f+++++++ backuphomedir/abc
    >f+++++++ backuphomedir/xyz

    sent 650 bytes received 136 bytes 1572.00 bytes/sec
    total size is 324 speedup is 0.41

上面的命令帮助你找出源地址和目标地址之间文件或者目录的不同。

### 示例: 6 - 备份 ###

rsync命令可以用来备份linux。

你可以在cron中使用rsync安排备份。

    0 0 * * * /usr/local/sbin/bkpscript &> /dev/null

----------

    vi /usr/local/sbin/bkpscript

    rsync -avz -e ‘ssh -p2093′ /home/test/ root@192.168.1.150:/oracle/data/

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/rsync-copy/

作者：[Bobbin Zachariah][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
