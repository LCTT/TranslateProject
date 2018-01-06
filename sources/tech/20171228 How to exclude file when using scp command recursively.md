translating---geekpi

How to exclude file when using scp command recursively
======

I need to copy all the *.c files from local laptop named hostA to hostB including all directories. I am using the following scp command but do not know how to exclude specific files (such as *.out):
```
$ scp -r ~/projects/ user@hostB:/home/delta/projects/
```

How do I tell scp command to exclude particular file or directory at the Linux/Unix command line?

One can use scp command to securely copy files between hosts on a network. It uses ssh for data transfer and authentication purpose. Typical syntax is:

```
scp file1 user@host:/path/to/dest/
scp -r /path/to/source/ user@host:/path/to/dest/ 
```

## Scp exclude files

I don't think so you can filter or exclude files when using scp command. However, there is a great workaround to exclude files and copy it securely using ssh. This page explains how to filter or excludes files when using scp to copy a directory recursively.

## How to use rsync command to exclude files

The syntax is:
`rsync av -e ssh --exclude='*.out' /path/to/source/ [[email protected]][1]:/path/to/dest/`
Where,

  1.  **-a** : Recurse into directories i.e. copy all files and subdirectories. Also, turn on archive mode and all other options (-rlptgoD)
  2.  **-v** : Verbose output
  3.  **-e ssh** : Use ssh for remote shell so everything gets encrypted
  4.  **\--exclude='*.out'** : exclude files matching PATTERN e.g. *.out or *.c and so on.


### Example of rsync command

In this example copy all file recursively from ~/virt/ directory but exclude all *.new files:
`$ rsync -av -e ssh --exclude='*.new' ~/virt/ [[email protected]][1]:/tmp`
Sample outputs:
[![Scp exclude files but using rsync exclude command][2]][2]

Rsync command will fail if rsync not found on the remote server. In that case try the following scp command that uses [bash shell pattern matching][3] in the current directory (it won't work with the -r option):
`$ ls `
Sample outputs:
```
centos71.log centos71.qcow2 centos71.qcow2.new centos71.v2.qcow2.new meta-data user-data
```

centos71.log centos71.qcow2 centos71.qcow2.new centos71.v2.qcow2.new meta-data user-data

Copy everything in the current directory except .new file(s):
```
$ shopt -s extglob
$ scp !(.new)* [[email protected]][1]:/tmp/
```
Sample outputs:
```
centos71.log 100 % 4262 1.3MB/s 00:00
centos71.qcow2 100 % 836MB 32.7MB/s 00: 25 
meta-data 100 % 47 18.5KB/s 00:00
user-data 100 % 1543 569.7KB/s 00:00
```


See the following man pages for more info:
```
$ [man rsync][4]
$ man bash
$ [man scp][5]
```


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/scp-exclude-files-when-using-command-recursively-on-unix-linux/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[2]:https://www.cyberciti.biz/media/new/faq/2017/12/scp-exclude-files-on-linux-unix-macos-bash-shell-command-line.jpg
[3]:https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html#Pattern-Matching
[4]:https://www.samba.org/ftp/rsync/rsync.html
[5]:https://man.openbsd.org/scp
