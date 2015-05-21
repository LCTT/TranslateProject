Shell Script to Backup Files / Directories Using rsync
================================================================================
This article we bring shell scripts to backup your files / directories from you local linux machine to a remote linux server using rsync command. This would be an interactive way to perform backup , where you need to provide remote backup server hostname / ip address and folder location. We keep a separate file where you need to provide files / directories that need backup. We have added two scripts where **first script** ask password after each file had been copied (if you have enabled ssh authentication keys , then password will be not be asked) and in second script password will be prompted only once.

We are going to backup bckup.txt, dataconfig.txt, docs and oracledb.

    [root@Fedora21 tmp]# ls -l
    total 12
    -rw-r--r--. 1 root root 0 May 15 10:43 bckrsync.sh
    -rw-r--r--. 1 root root 0 May 15 10:44 bckup.txt
    -rw-r--r--. 1 root root 0 May 15 10:46 dataconfig.txt
    drwxr-xr-x. 2 root root 4096 May 15 10:45 docs
    drwxr-xr-x. 2 root root 4096 May 15 10:44 oracledb

This file contains backup files / dir details

    [root@Fedora21 tmp]# cat /tmp/bckup.txt
    /tmp/oracledb
    /tmp/dataconfig.txt
    /tmp/docs
    [root@Fedora21 tmp]#

### Script 1 : ###

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

#### Running the script with output ####

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

### Script 2 : ###

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

#### Screenshot running the second script with output ####

![rsync script](http://blog.linoxide.com/wp-content/uploads/2015/05/bckuprsync-script.png)

Hope these scripts help you to take backup !!

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/shell-script-backup-files-directories-rsync/

作者：[Yevhen Duma][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/yevhend/