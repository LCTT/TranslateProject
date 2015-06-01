Shell脚本：使用rsync备份文件/目录
================================================================================
本文，我们带来了shell脚本，用来使用rsync命令将你本地Linux机器上的文件/目录备份到远程Linux服务器上。使用该脚本实施备份会是一个交互的方式，你需要提供远程备份服务器的主机名/ip地址和文件夹位置。我们保留了一个独立文件，在这个文件中你需要提供需要备份的文件/目录。我们添加了两个脚本，**第一个脚本**在每次拷贝完一个文件后询问密码（如果你启用了ssh验证密钥，那么就不会询问密码），而第二个脚本中，则只会提示一次输入密码。

我们打算备份bckup.txt，dataconfig.txt，docs和orcledb。

    [root@Fedora21 tmp]# ls -l
    total 12
    -rw-r--r--. 1 root root 0 May 15 10:43 bckrsync.sh
    -rw-r--r--. 1 root root 0 May 15 10:44 bckup.txt
    -rw-r--r--. 1 root root 0 May 15 10:46 dataconfig.txt
    drwxr-xr-x. 2 root root 4096 May 15 10:45 docs
    drwxr-xr-x. 2 root root 4096 May 15 10:44 oracledb

该文件包含了备份文件/目录的详情

    [root@Fedora21 tmp]# cat /tmp/bckup.txt
    /tmp/oracledb
    /tmp/dataconfig.txt
    /tmp/docs
    [root@Fedora21 tmp]#

### 脚本 1： ###

    #!/bin/bash

    #We will save path to backup file in variable
    backupf='/tmp/bckup.txt'

    #Next line just prints message
    echo "Shell Script Backup Your Files / Directories Using rsync"

    #next line check if entered value is not null, and if null it will reask user to enter Destination Server
    while [ x$desthost = "x" ]; do

    #next line prints what userd should enter, and stores entered value to variable with name desthost
    read -p "Destination backup Server : " desthost

    #next line finishes while loop
    done

    #next line check if entered value is not null, and if null it will reask user to enter Destination Path
    while [ x$destpath = "x" ]; do

    #next line prints what userd should enter, and stores entered value to variable with name destpath
    read -p "Destination Folder : " destpath

    #next line finishes while loop
    done

    #Next line will start reading backup file line by line
    for line in `cat $backupf`

    #and on each line will execute next
    do

    #print message that file/dir will be copied
    echo "Copying $line ... "
    #copy via rsync file/dir to destination

    rsync -ar "$line" "$desthost":"$destpath"

    #this line just print done
    echo "DONE"

    #end of reading backup file
    done

#### 运行带有输出结果的脚本 ####

    [root@Fedora21 tmp]# ./bckrsync.sh
    Shell Script Backup Your Files / Directories Using rsync
    Destination backup Server : 104.*.*.41
    Destination Folder : /tmp
    Copying /tmp/oracledb ...
    The authenticity of host '104.*.*.41 (104.*.*.41)' can't be established.
    ECDSA key fingerprint is 96:11:61:17:7f:fa:......
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '104.*.*.41' (ECDSA) to the list of known hosts.
    root@104.*.*.41's password:
    DONE
    Copying /tmp/dataconfig.txt ...
    root@104.*.*.41's password:
    DONE
    Copying /tmp/docs ...
    root@104.*.*.41's password:
    DONE
    [root@Fedora21 tmp]#

### 脚本 2： ###

    #!/bin/bash

    #We will save path to backup file in variable
    backupf='/tmp/bckup.txt'

    #Next line just prints message
    echo "Shell Script Backup Your Files / Directories Using rsync"

    #next line check if entered value is not null, and if null it will reask user to enter Destination Server
    while [ x$desthost = "x" ]; do

    #next line prints what userd should enter, and stores entered value to variable with name desthost
    read -p "Destination backup Server : " desthost

    #next line finishes while loop
    done

    #next line check if entered value is not null, and if null it will reask user to enter Destination Path
    while [ x$destpath = "x" ]; do

    #next line prints what userd should enter, and stores entered value to variable with name destpath
    read -p "Destination Folder : " destpath

    #next line finishes while loop
    done

    #next line check if entered value is not null, and if null it will reask user to enter password
    while [ x$password = "x" ]; do
    #next line prints what userd should enter, and stores entered value to variable with name password. #To hide password we are using -s key
    read -sp "Password : " password
    #next line finishes while loop
    done

    #Next line will start reading backup file line by line
    for line in `cat $backupf`

    #and on each line will execute next
    do

    #print message that file/dir will be copied
    echo "Copying $line ... "
    #we will use expect tool to enter password inside script
    /usr/bin/expect << EOD
    #next line set timeout to -1, recommended to use
    set timeout -1
    #copy via rsync file/dir to destination, using part of expect — spawn command

    spawn rsync -ar ${line} ${desthost}:${destpath}
    #as result of previous command we expect “password” promtp
    expect "*?assword:*"
    #next command enters password from script
    send "${password}\r"
    #next command tells that we expect end of file (everything finished on remote server)
    expect eof
    #end of expect pard
    EOD
    #this line just print done
    echo "DONE"

    #end of reading backup file
    done

#### 运行第二个带有输出结果的脚本的屏幕截图 ####

![rsync script](http://blog.linoxide.com/wp-content/uploads/2015/05/bckuprsync-script.png)

希望这些脚本对你备份会有帮助！！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/shell-script-backup-files-directories-rsync/

作者：[Yevhen Duma][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/yevhend/
