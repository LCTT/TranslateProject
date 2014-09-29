Using GIT to backup your website files on linux
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/09/git_logo-1024x480-580x271.png)

Well not exactly Git but a software based on Git known as BUP. I generally use rsync to backup my files and that has worked fine so far. The only problem or drawback is that you cannot restore your files to a particular point in time. Hence, I started looking for an alternative and found BUP a git based software which stores your data in repositories and gives you the option to restore data to a particular point in time.

With BUP you will first need to initialize an empty repository, then take a backup of all your files. When BUP takes a backup it creates a restore point which you can later restore to. It also creates an index of all your files, this index contains file attributes and checksum. When another backup is scheduled BUP compares the files with this attribute and only saves data if anything has changed. This saves you a lot of space.

### Installing BUP (Tested on Centos 6 & 7) ###

Ensure you have RPMFORGE and EPEL repos installed.

    [techarena51@vps ~]$sudo yum groupinstall "Development Tools"
    [techarena51@vps ~]$ sudo yum install python python-devel
    [techarena51@vps ~]$ sudo yum install fuse-python pyxattr pylibacl
    [techarena51@vps ~]$ sudo yum install perl-Time-HiRes
    [techarena51@vps ~]$ git clone git://github.com/bup/bup
    [techarena51@vps ~]$cd bup
    [techarena51@vps ~]$ make
    [techarena51@vps ~]$ make test
    [techarena51@vps ~]$sudo make install 

For debian/ubuntu users you can do “apt-get build-dep bup” on recent versions for more information check out https://github.com/bup/bup
You may get errors on CentOS 7 at “make test”, but you can continue to run make install.

The first step like git is to initialize an empty repository. 

    [techarena51@vps ~]$bup init

By default, bup will store it’s repository under “~/.bup” but you can change that by setting the “export BUP_DIR=/mnt/user/bup” environment variable

Next you create an index of all files. The index, as I mentioned earlier stores a listing of files, their attributes, and their git object ids (sha1 hashes). ( Attributes include soft links, permissions as well as the immutable bit 

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

“BUP save” will split all the contents of the file into chunks and store them as objects. The “-n” option takes the name of backup.

You can check a list of backups as well as a list of backed up files.

    [techarena51@vps ~]$ bup ls
    local-etc    techarena51  test
    #Check for a list of backups available for my site
    [techarena51@vps ~]$ bup ls techarena51
    2014-09-24-064416  2014-09-24-071814  latest
    #Check for the files available in these backups
    [techarena51@vps ~]$ bup ls techarena51/2014-09-24-064416/var/www/html
    apc.php                      techarena51.com              wp-config-sample.php         wp-load.php                  

Backing up files on the same server is never a good option. BUP allows you to remotely backup your website files, you however need to ensure that your SSH keys and BUP are installed on the remote server.

    bup index path/to/dir
    bup save-r remote-vps.com -n backupname path/to/dir

### Example: Backing up the “/var/www/html” directory ###

    [techarena51@vps ~]$bup index /var/www/html
    [techarena51@vps ~]$ bup save -r user@remotelinuxvps.com: -n techarena51 /var/www/html
    Reading index: 28, done.
    Saving: 100.00% (4/4k, 28/28 files), done.
    bloom: adding 1 file (7 objects).
    Receiving index from server: 1268/1268, done.
    bloom: adding 1 file (7 objects).

### Restoring your Backup ###

Log into the remote server and type the following

    [techarena51@vps ~]$bup restore -C ./backup techarena51/latest
    
    #Restore an older version of the entire working dir elsewhere
    [techarena51@vps ~]$bup restore -C /tmp/bup-out /testrepo/2013-09-29-195827
    #Restore one individual file from an old backup
    [techarena51@vps ~]$bup restore -C /tmp/bup-out /testrepo/2013-09-29-201328/root/testbup/binfile1.bin

The only drawback is you cannot restore files to another server, you have to manually copy the files via SCP or even rsync.

View your backups via an integrated web server

    bup web
    #specific port
    bup web :8181

You can run bup along with a shell script and a cron job once everyday.

    #!/bin/bash
    
    bup index /var/www/html 
    bup save -r user@remote-vps.com: -n techarena51 /var/www/html 

BUP may not be perfect, but it get’s the job done pretty well. I would definitely like to see more development on this project and hopefully a remote restore as well.

You may also like to read using [inotify-tools][1] for real time file syncing.

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/using-git-backup-website-files-on-linux/

作者：[Leo G][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://techarena51.com/index.php/inotify-tools-example/