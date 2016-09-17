17 tar command practical examples in Linux
=====

Tar (tape archive ) is the most widely used command in Unix like operating system for creating archive of multiple files and folders into a single archive file and that archive file can be further compressed using  gzip and bzip2 techniques. In other words we can say that tar command is used to take backup by archiving multiple files and directory into a single tar or archive file and later on files & directories can be extracted from the tar compressed file.

In this article we will discuss 17 practical examples of tar command in Linux.

Syntax of tar command:

```
# tar <options> <files>
```

Some of the commonly used options in tar command are listed below :

![](http://www.linuxtechi.com/wp-content/uploads/2016/09/tar-command-options.jpg)

Note : hyphen ( – ) in the tar command options are optional.

### Example: 1 Create a tar archive file

Let’s create a tar file of /etc directory and ‘/root/ anaconda-ks.cfg’ file.

```
[root@linuxtechi ~]# tar -cvf myarchive.tar /etc /root/anaconda-ks.cfg
```

Above command will create a tar file with the name “myarchive” in the current folder. Tar file contains all the files and directories of /etc folder and anaconda-ks.cfg file.

In the tar command ‘-c‘ option specify to create a tar file, ‘-v’ is used for verbose output and ‘-f’ option is used to specify the archive file name.

```
[root@linuxtechi ~]# ls -l myarchive.tar
-rw-r--r--. 1 root root 22947840 Sep 7 00:24 myarchive.tar
[root@linuxtechi ~]#
```

### Example:2 List the contents of tar archive file.

Using ‘–t‘ option in tar command we can view the contents of tar files without extracting it.

```
[root@linuxtechi ~]# tar -tvf myarchive.tar
```

Listing a specific file or directory from tar file. In the below example i am trying to view whether ‘anaconda-ks.cfg’ file is there in the tar file or not.

```
[root@linuxtechi ~]# tar -tvf myarchive.tar root/anaconda-ks.cfg
-rw------- root/root 953 2016-08-24 01:33 root/anaconda-ks.cfg
[root@linuxtechi ~]#
```

### Example:3 Append or add files to end of archive or tar file.

‘-r‘ option in the tar command is used to append or add file to existing tar file. Let’s add /etc/fstab file in ‘data.tar‘

```
[root@linuxtechi ~]# tar -rvf data.tar /etc/fstab
```

Note: In the Compressed tar file we can’t append file or directory.

### Example:4 Extracting files and directories from tar file.

‘-x‘ option is used to extract the files and directories from the tar file. Let’s extract the content of above created tar file.

```
[root@linuxtechi ~]# tar -xvf myarchive.tar
```

This command will extract all the files and directories of myarchive tar file in the current working directory.

### Example:5 Extracting tar file to a particular folder.

In case you want to extract tar file to a particular folder or directory then use ‘-C‘ option and after that specify the path of a folder.

```
[root@linuxtechi ~]# tar -xvf myarchive.tar -C /tmp/
```

### Example:6 Extracting particular file or directory from tar file.

Let’s assume you want to extract only anaconda-ks.cfg file from the tar file under /tmp folder.

Syntax :

```
# tar –xvf {tar-file } {file-to-be-extracted } -C {path-where-to-extract}

[root@linuxtechi tmp]# tar -xvf /root/myarchive.tar root/anaconda-ks.cfg -C /tmp/
root/anaconda-ks.cfg
[root@linuxtechi tmp]# ls -l /tmp/root/anaconda-ks.cfg
-rw-------. 1 root root 953 Aug 24 01:33 /tmp/root/anaconda-ks.cfg
[root@linuxtechi tmp]#
```

### Example:7 Creating and compressing tar file (tar.gz or .tgz )

Let’s assume that we want to create a tar file of /etc and /opt folder and also want to compress it using gzip tool. This can be achieved using ‘-z‘ option in tar command. Extensions of such tar files will be either tar.gz or .tgz

```
[root@linuxtechi ~]# tar -zcpvf myarchive.tar.gz /etc/ /opt/
```

Or

```
[root@linuxtechi ~]# tar -zcpvf myarchive.tgz /etc/ /opt/
```

### Example:8 Creating and compressing tar file ( tar.bz2 or .tbz2 )

Let’s assume that we want to create compressed (bzip2) tar file of /etc and /opt folder. This can be achieved by using the option ( -j) in the tar command.Extensions of such tar files will be either tar.bz2 or .tbz

```
[root@linuxtechi ~]# tar -jcpvf myarchive.tar.bz2 /etc/ /opt/
```

Or

```
[root@linuxtechi ~]# tar -jcpvf myarchive.tbz2 /etc/ /opt/
```

### Example:9 Excluding particular files or type while creating tar file.

Using “–exclude” option in tar command we can exclude the particular file or file type while creating tar file. Let’s assume we want to exclude the file type of html while creating the compressed tar file.

```
[root@linuxtechi ~]# tar -zcpvf myarchive.tgz /etc/ /opt/ --exclude=*.html
```

### Example:10 Listing the contents of tar.gz or .tgz file

Contents of tar file with the extensions tar.gz or .tgz is viewed by using the option ‘-t’. Example is shown below :

```
[root@linuxtechi ~]# tar -tvf myarchive.tgz  | more 
............................................. 
drwxr-xr-x root/root         0 2016-09-07 08:41 etc/ 
-rw-r--r-- root/root       541 2016-08-24 01:23 etc/fstab 
-rw------- root/root         0 2016-08-24 01:23 etc/crypttab 
lrwxrwxrwx root/root         0 2016-08-24 01:23 etc/mtab -> /proc/self/mounts 
-rw-r--r-- root/root       149 2016-09-07 08:41 etc/resolv.conf 
drwxr-xr-x root/root         0 2016-09-06 03:55 etc/pki/ 
drwxr-xr-x root/root         0 2016-09-06 03:15 etc/pki/rpm-gpg/ 
-rw-r--r-- root/root      1690 2015-12-09 04:59 etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 
-rw-r--r-- root/root      1004 2015-12-09 04:59 etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-7 
-rw-r--r-- root/root      1690 2015-12-09 04:59 etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Testing-7 
-rw-r--r-- root/root      3140 2015-09-15 06:53 etc/pki/rpm-gpg/RPM-GPG-KEY-foreman 
..........................................................
```

### Example:11 Listing the contents of tar.bz2 or .tbz2 file.

Contents of tar file with the extensions tar.bz2 or .tbz2 is viewed by using the option ‘-t’. Example is shown below :

```
[root@linuxtechi ~]# tar -tvf myarchive.tbz2  | more 
........................................................ 
rwxr-xr-x root/root         0 2016-08-24 01:25 etc/pki/java/ 
lrwxrwxrwx root/root         0 2016-08-24 01:25 etc/pki/java/cacerts -> /etc/pki/ca-trust/extracted/java/cacerts 
drwxr-xr-x root/root         0 2016-09-06 02:54 etc/pki/nssdb/ 
-rw-r--r-- root/root     65536 2010-01-12 15:09 etc/pki/nssdb/cert8.db 
-rw-r--r-- root/root      9216 2016-09-06 02:54 etc/pki/nssdb/cert9.db 
-rw-r--r-- root/root     16384 2010-01-12 16:21 etc/pki/nssdb/key3.db 
-rw-r--r-- root/root     11264 2016-09-06 02:54 etc/pki/nssdb/key4.db 
-rw-r--r-- root/root       451 2015-10-21 09:42 etc/pki/nssdb/pkcs11.txt 
-rw-r--r-- root/root     16384 2010-01-12 15:45 etc/pki/nssdb/secmod.db 
drwxr-xr-x root/root         0 2016-08-24 01:26 etc/pki/CA/ 
drwxr-xr-x root/root         0 2015-06-29 08:48 etc/pki/CA/certs/ 
drwxr-xr-x root/root         0 2015-06-29 08:48 etc/pki/CA/crl/ 
drwxr-xr-x root/root         0 2015-06-29 08:48 etc/pki/CA/newcerts/ 
drwx------ root/root         0 2015-06-29 08:48 etc/pki/CA/private/ 
drwx------ root/root         0 2015-11-20 06:34 etc/pki/rsyslog/ 
drwxr-xr-x root/root         0 2016-09-06 03:44 etc/pki/pulp/ 
..............................................................
```

### Example:12 Extracting or unzip tar.gz or .tgz files.

tar files with extension tar.gz or .tgz is extracted or unzipped with option ‘-x’ and ‘-z’. Example is shown below :

```
[root@linuxtechi ~]# tar -zxpvf myarchive.tgz -C /tmp/
```

Above command will extract tar file under /tmp folder.

Note : Now a days tar command will take care compression file types automatically while extracting, it means it is optional for us to specify compression type in tar command. Example is shown below :

```
[root@linuxtechi ~]# tar -xpvf myarchive.tgz -C /tmp/
```

### Example:13 Extracting or unzip tar.bz2 or .tbz2 files

tar files with the extension tar.bz2 or .tbz2 is extract with option ‘-j’ and ‘-x’. Example is shown below:

```
[root@linuxtechi ~]# tar -jxpvf myarchive.tbz2 -C /tmp/
```

Or

```
[root@linuxtechi ~]# tar xpvf myarchive.tbz2 -C /tmp/
```

### Example:14 Scheduling backup with tar command

There are some real time scenarios where we have to create the tar files of particular files and directories for backup purpose on daily basis. Let’s suppose we have to take backup of whole /opt folder on daily basis, this can be achieved by creating a cron job of tar command. Example is shown below :

```
[root@linuxtechi ~]# tar -zcvf optbackup-$(date +%Y-%m-%d).tgz /opt/
```

Create a cron job for above command.

### Example:15 Creating compressed archive or tar file with -T and -X option.

There are some real time scenarios where we want tar command to take input from a file and that file will consists of path of files & directory that are to be archived and compressed, there might some files that we would like to exclude in the archive which are mentioned in input file.

In the tar command input file is specified after ‘-T’ option and file which consists of exclude list is specified after ‘-X’ option.

Let’s suppose we want to archive and compress the directories like /etc , /opt and /home and want to exclude the file ‘/etc/sysconfig/kdump’ and ‘/etc/sysconfig/foreman‘, Create a text file ‘/root/tar-include’ and ‘/root/tar-exclude’ and put the following contents in respective file.

```
[root@linuxtechi ~]# cat /root/tar-include
/etc
/opt
/home
[root@linuxtechi ~]#
[root@linuxtechi ~]# cat /root/tar-exclude
/etc/sysconfig/kdump
/etc/sysconfig/foreman
[root@linuxtechi ~]#
```

Now run the below command to create and compress archive file.

```
[root@linuxtechi ~]# tar zcpvf mybackup-$(date +%Y-%m-%d).tgz -T /root/tar-include -X /root/tar-exclude
```

### Example:16 View the size of .tar , .tgz and .tbz2 file.

Use the below commands to view the size of tar and compressed tar files.

```
[root@linuxtechi ~]# tar -czf - data.tar | wc -c
427
[root@linuxtechi ~]# tar -czf - mybackup-2016-09-09.tgz | wc -c
37956009
[root@linuxtechi ~]# tar -czf - myarchive.tbz2 | wc -c
30835317
[root@linuxtechi ~]#
```

### Example:17 Splitting big tar file into smaller files.

In Unix like operating big file is divided or split into smaller files using split command. Big tar file can also be divided into the smaller parts using split command.

Let’s assume we want to split ‘mybackup-2016-09-09.tgz‘ file into smaller parts of each 6 MB.

```
Syntax :  split -b <Size-in-MB> <tar-file-name>.<extension> “prefix-name”
```

```
[root@linuxtechi ~]# split -b 6M mybackup-2016-09-09.tgz mybackup-parts
```

Above command will split the mybackup compressed tar file into the smaller files each of size 6 MB in current working directory and split file names will starts from mybackup-partsaa … mybackup-partsag. In case if you want to append numbers in place of alphabets then use ‘-d’ option in above split command.

```
[root@linuxtechi ~]# ls -l mybackup-parts*
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsaa
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsab
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsac
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsad
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsae
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsaf
-rw-r--r--. 1 root root 637219  Sep 10 03:05 mybackup-partsag
[root@linuxtechi ~]#
```

Now we can move these files into another server over the network and then we can merge all the files into a single tar compressed file using below mentioned command.

```
[root@linuxtechi ~]# cat mybackup-partsa* > mybackup-2016-09-09.tgz
[root@linuxtechi ~]#
```

That’s all, hope you like different examples of tar command. Please share your feedback and comments.

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/17-tar-command-examples-in-linux/

作者：[Pradeep Kumar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
