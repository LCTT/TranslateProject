Translating----geekpi

How to use Rsync Command In Linux With Examples
================================================================================
For organization and companies, data is most important for them, even specially E-commerce business, data is very critical to them. Rsysnc is tool or software which helps taking backup of critical data over the network. It also network protocol for Unix-like and Windows systems that synchronizes files and directories from one system to another system over the network. Rsysnc can copy or display directory and copy files. Rsysncd listens the defaults TCP port 873, copying files via a remote shell such as rsh or ssh. Rysync package must be installed on both remote system as well as local machine.

The main advantages of the rsysnc is :

**Speed**: Initially copies the whole content between local and remote system. Next time, it transfers only the changed blocks or bytes to the destination.

**Security**: Encrypted form of data can be transferred using ssh protocol.

**Less Bandwidth**: rsysnc uses compression and decompression of data block by block at both the end.

Syntax:
#rsysnc [options] source path destination path

### Example: 1 - Enable Compression ###

    [root@localhost /]# rsync -zvr /home/aloft/ /backuphomedir
    building file list ... done
    .bash_logout
    .bash_profile
    .bashrc
    sent 472 bytes received 86 bytes 1116.00 bytes/sec
    total size is 324 speedup is 0.58

In above command rsysnc uses –z for enable compression, -v for verbose, -r for recursive. Here above command synchronizes two directory /home/aloft/ and /backuphomedir in local system.

### Example: 2 - Preserve File/Directory Attributes ###

    [root@localhost /]# rsync -azvr /home/aloft/ /backuphomedir
    building file list ... done
    ./
    .bash_logout
    .bash_profile
    .bashrc

    sent 514 bytes received 92 bytes 1212.00 bytes/sec
    total size is 324 speedup is 0.53

Above example we used –a option, it preserves owner and groups, it preserve timestamp, symbolic links, permission, recursive mode.

### Example: 3 - Synchronize local to remote host ###

    root@localhost /]# rsync -avz /home/aloft/ azmath@192.168.1.4:192.168.1.4:/share/rsysnctest/
    Password:

    building file list ... done
    ./
    .bash_logout
    .bash_profile
    .bashrc
    sent 514 bytes received 92 bytes 1212.00 bytes/sec
    total size is 324 speedup is 0.53

Above command allow you synchronize between local machines to remote machine. You can see , while synchronizing files to another system, it asks password. While doing synchronization with the remote server, you need to specify user name and IP or Hostname of the remote system.

### Example: 4 - Synchronize remote to local host ###

    [root@localhost /]# rsync -avz azmath@192.168.1.4:192.168.1.4:/share/rsysnctest/ /home/aloft/
    Password:
    building file list ... done
    ./
    .bash_logout
    .bash_profile
    .bashrc
    sent 514 bytes received 92 bytes 1212.00 bytes/sec
    total size is 324 speedup is 0.53

Above command will synchronizes files from remote to local system

### Example: 5 - Find difference in files ###

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

Above command helps to find any differences in the files or directories between source and destination

### Example: 6 - Take backup ###

rsync command could be used take linux backup.

You can schedule backup in cron using rsync command

    0 0 * * * /usr/local/sbin/bkpscript &> /dev/null

----------

    vi /usr/local/sbin/bkpscript

    rsync -avz -e ‘ssh -p2093′ /home/test/ root@192.168.1.150:/oracle/data/

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/rsync-copy/

作者：[Bobbin Zachariah][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
