How to find and tar files into a tar ball
======

The find command used to search for files in a directory hierarchy as per given criteria. The tar command is an archiving utility for Linux and Unix-like system to create tarballs.
[![How to find and tar files on linux unix][1]][1]
Let us see how to combine tar command with find command to create a tarball in a single command line option.

I would like to find all documents file *.doc and create a tarball of those files and store in /nfs/backups/docs/file.tar. Is it possible to find and tar files on a Linux or Unix-like system?The find command used to search for files in a directory hierarchy as per given criteria. The tar command is an archiving utility for Linux and Unix-like system to create tarballs.Let us see how to combine tar command with find command to create a tarball in a single command line option.

## Find command

The syntax is:
```
find /path/to/search -name "file-to-search" -options
## find all Perl (*.pl) files ##
find $HOME -name "*.pl" -print
## find all *.doc files ##
find $HOME -name "*.doc" -print
## find all *.sh (shell scripts) and run ls -l command on it ##
find . -iname "*.sh" -exec ls -l {} +
```
Sample outputs from the last command:
```
-rw-r--r-- 1 vivek vivek 1169 Apr 4 2017 ./backups/ansible/cluster/nginx.build.sh
-rwxr-xr-x 1 vivek vivek 1500 Dec 6 14:36 ./bin/cloudflare.pure.url.sh
lrwxrwxrwx 1 vivek vivek 13 Dec 31 2013 ./bin/cmspostupload.sh -> postupload.sh
lrwxrwxrwx 1 vivek vivek 12 Dec 31 2013 ./bin/cmspreupload.sh -> preupload.sh
lrwxrwxrwx 1 vivek vivek 14 Dec 31 2013 ./bin/cmssuploadimage.sh -> uploadimage.sh
lrwxrwxrwx 1 vivek vivek 13 Dec 31 2013 ./bin/faqpostupload.sh -> postupload.sh
lrwxrwxrwx 1 vivek vivek 12 Dec 31 2013 ./bin/faqpreupload.sh -> preupload.sh
lrwxrwxrwx 1 vivek vivek 14 Dec 31 2013 ./bin/faquploadimage.sh -> uploadimage.sh
-rw-r--r-- 1 vivek vivek 778 Nov 6 14:44 ./bin/mirror.sh
-rwxr-xr-x 1 vivek vivek 136 Apr 25 2015 ./bin/nixcraft.com.301.sh
-rwxr-xr-x 1 vivek vivek 547 Jan 30 2017 ./bin/paypal.sh
-rwxr-xr-x 1 vivek vivek 531 Dec 31 2013 ./bin/postupload.sh
-rwxr-xr-x 1 vivek vivek 437 Dec 31 2013 ./bin/preupload.sh
-rwxr-xr-x 1 vivek vivek 1046 May 18 2017 ./bin/purge.all.cloudflare.domain.sh
lrwxrwxrwx 1 vivek vivek 13 Dec 31 2013 ./bin/tipspostupload.sh -> postupload.sh
lrwxrwxrwx 1 vivek vivek 12 Dec 31 2013 ./bin/tipspreupload.sh -> preupload.sh
lrwxrwxrwx 1 vivek vivek 14 Dec 31 2013 ./bin/tipsuploadimage.sh -> uploadimage.sh
-rwxr-xr-x 1 vivek vivek 1193 Oct 18 2013 ./bin/uploadimage.sh
-rwxr-xr-x 1 vivek vivek 29 Nov 6 14:33 ./.vim/plugged/neomake/tests/fixtures/errors.sh
-rwxr-xr-x 1 vivek vivek 215 Nov 6 14:33 ./.vim/plugged/neomake/tests/helpers/trap.sh
```

## Tar command

To [create a tar ball of /home/vivek/projects directory][2], run:
```
$ tar -cvf /home/vivek/projects.tar /home/vivek/projects
```

## Combining find and tar commands

The syntax is:
```
find /dir/to/search/ -name "*.doc" -exec tar -rvf out.tar {} \;
```
OR
```
find /dir/to/search/ -name "*.doc" -exec tar -rvf out.tar {} +
```
For example:
```
find $HOME -name "*.doc" -exec tar -rvf /tmp/all-doc-files.tar "{}" \;
```
OR
```
find $HOME -name "*.doc" -exec tar -rvf /tmp/all-doc-files.tar "{}" +
```
Where, find command options:

  *  **-name "*.doc"** : Find file as per given pattern/criteria. In this case find all *.doc files in $HOME.
  *  **-exec tar ...** : Execute tar command on all files found by the find command.

Where, tar command options:

  *  **-r** : Append files to the end of an archive. Arguments have the same meaning as for -c option.
  *  **-v** : Verbose output.
  *  **-f** : out.tar : Append all files to out.tar file.



It is also possible to pipe output of the find command to the tar command as follows:
```
find $HOME -name "*.doc" -print0 | tar -cvf /tmp/file.tar --null -T - 
```
The -print0 option passed to the find command deals with special file names. The -null and -T - option tells the tar command to read its input from stdin/pipe. It is also possible to use the xargs command:
```
find $HOME -type f -name "*.sh" | xargs tar cfvz /nfs/x230/my-shell-scripts.tgz
```
See the following man pages for more info:
```
$ man tar
$ man find
$ man xargs
$ man bash
```


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/linux-unix-find-tar-files-into-tarball-command/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/12/How-to-find-and-tar-files-on-linux-unix.jpg
[2]:https://www.cyberciti.biz/faq/creating-a-tar-file-linux-command-line/
