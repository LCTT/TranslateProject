Shell脚本：使用rsync备份文件/目录
================================================================================
本文我们介绍一个shell脚本，用来使用rsync命令将你本地Linux机器上的文件/目录备份到远程Linux服务器上。使用该脚本会以交互的方式实施备份，你需要提供远程备份服务器的主机名/ip地址和文件夹位置。我们使用一个单独的列表文件，在这个文件中你需要列出要备份的文件/目录。我们添加了两个脚本，**第一个脚本**在每次拷贝完一个文件后询问密码（如果你启用了ssh密钥验证，那么就不会询问密码），而第二个脚本中，则只会提示一次输入密码。

我们打算备份bckup.txt，dataconfig.txt，docs和orcledb。

    [root@Fedora21 tmp]# ls -l
    total 12
    -rw-r--r--. 1 root root 0 May 15 10:43 bckrsync.sh
    -rw-r--r--. 1 root root 0 May 15 10:44 bckup.txt
    -rw-r--r--. 1 root root 0 May 15 10:46 dataconfig.txt
    drwxr-xr-x. 2 root root 4096 May 15 10:45 docs
    drwxr-xr-x. 2 root root 4096 May 15 10:44 oracledb

bckup.txt文件包含了需要备份的文件/目录的详情

    [root@Fedora21 tmp]# cat /tmp/bckup.txt
    /tmp/oracledb
    /tmp/dataconfig.txt
    /tmp/docs
    [root@Fedora21 tmp]#

### 脚本 1： ###

    #!/bin/bash

    # 将备份列表文件的路径保存到变量中
    backupf='/tmp/bckup.txt'

    # 输入一个提示信息
    echo "Shell Script Backup Your Files / Directories Using rsync"

    # 检查是否输入了目标服务器，如果为空就再次提示用户输入
    while [ x$desthost = "x" ]; do

    # 提示用户输入目标服务器地址并保存到变量
    read -p "Destination backup Server : " desthost

    # 结束循环
    done

    # 检查是否输入了目标文件夹，如果为空就再次提示用户输入
    while [ x$destpath = "x" ]; do

    # 提示用户输入目标文件夹并保存到变量
    read -p "Destination Folder : " destpath

    # 结束循环
    done

    # 逐行读取备份列表文件
    for line in `cat $backupf`

    # 对每一行都进行处理
    do

    # 显示要被复制的文件/文件夹名称
    echo "Copying $line ... "
    # 通过 rsync 复制文件/文件夹到目标位置

    rsync -ar "$line" "$desthost":"$destpath"

    # 显示完成
    echo "DONE"

    # 结束
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

    # 将备份列表文件的路径保存到变量中
    backupf='/tmp/bckup.txt'

    # 输入一个提示信息
    echo "Shell Script Backup Your Files / Directories Using rsync"

    # 检查是否输入了目标服务器，如果为空就再次提示用户输入
    while [ x$desthost = "x" ]; do

    # 提示用户输入目标服务器地址并保存到变量
    read -p "Destination backup Server : " desthost

    # 结束循环
    done

    # 检查是否输入了目标文件夹，如果为空就再次提示用户输入
    while [ x$destpath = "x" ]; do

    # 提示用户输入目标文件夹并保存到变量
    read -p "Destination Folder : " destpath

    # 结束循环
    done

    # 检查是否输入了目标服务器密码，如果为空就再次提示用户输入
    while [ x$password = "x" ]; do
    # 提示用户输入密码并保存到变量
    # 使用 -s 选项不回显输入的密码
    read -sp "Password : " password
    # 结束循环
    done

    # 逐行读取备份列表文件
    for line in `cat $backupf`

    # 对每一行都进行处理
    do

    # 显示要被复制的文件/文件夹名称
    echo "Copying $line ... "
    # 使用 expect 来在脚本中输入密码
    /usr/bin/expect << EOD
    # 推荐设置超时为 -1 
    set timeout -1
    # 通过 rsync 复制文件/文件夹到目标位置，使用 expect 的组成部分 spawn 命令

    spawn rsync -ar ${line} ${desthost}:${destpath}
    # 上一行命令会等待 “password” 提示
    expect "*?assword:*"
    # 在脚本中提供密码
    send "${password}\r"
    # 等待文件结束符（远程服务器处理完了所有事情）
    expect eof
    # 结束 expect 脚本
    EOD
    # 显示结束
    echo "DONE"

    # 完成
    done

#### 运行第二个带有输出结果的脚本的屏幕截图 ####

![rsync script](http://blog.linoxide.com/wp-content/uploads/2015/05/bckuprsync-script.png)

希望这些脚本对你备份会有帮助！！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/shell-script-backup-files-directories-rsync/

作者：[Yevhen Duma][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/yevhend/
