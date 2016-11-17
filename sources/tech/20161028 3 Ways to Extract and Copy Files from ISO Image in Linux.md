3 Ways to Extract and Copy Files from ISO Image in Linux
============================================================

Let’s say you have a large ISO file on your Linux server and you wanted to access, extract or copy one single file from it. How do you do it? Well in Linux there are couple ways do it.

For example, you can use standard mount command to mount an ISO image in read-only mode using the loop device and then copy the files to another directory.

### Mount or Extract ISO File in Linux

To do so, you must have an ISO file (I used ubuntu-16.10-server-amd64.iso ISO image) and mount point directory to mount or extract ISO files.

First create an mount point directory, where you will going to mount the image as shown:

```
$ sudo mkdir /mnt/iso
```

Once directory has been created, you can easily mount ubuntu-16.10-server-amd64.iso file and verify its content by running following command.

```
$ sudo mount -o loop ubuntu-16.10-server-amd64.iso /mnt/iso
$ ls /mnt/iso/
```
[
 ![Mount ISO File in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Mount-ISO-File-in-Linux.png) 
][1]

Mount ISO File in Linux

Now you can go inside the mounted directory (/mnt/iso) and access the files or copy the files to `/tmp`directory using [cp command][2].

```
$ cd /mnt/iso
$ sudo cp md5sum.txt /tmp/
$ sudo cp -r ubuntu /tmp/
```
[
 ![Copy Files From ISO File in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Copy-Files-From-ISO-File-in-Linux.png) 
][3]

Copy Files From ISO File in Linux

Note: The `-r` option used to copy directories recursively, if you want you can also [monitor progress of copy command][4].

### Extract ISO Content Using 7zip Command

If you don’t want to mount ISO file, you can simply install 7zip, is an open source archive program used to pack or unpack different number of formats including TAR, XZ, GZIP, ZIP, BZIP2, etc..

```
$ sudo apt-get install p7zip-full p7zip-rar [On Debian/Ubuntu systems]
$ sudo yum install p7zip p7zip-plugins      [On CentOS/RHEL systems]
```

Once 7zip program has been installed, you can use 7z command to extract ISO file contents.

```
$ 7z x ubuntu-16.10-server-amd64.iso
```
[
 ![7zip - Extract ISO File Content in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Extract-ISO-Content-in-Linux.png) 
][5]

7zip – Extract ISO File Content in Linux

Note: As compared to Linux mount command, 7zip seems much faster and smart enough to pack or unpack any archive formats.

### Extract ISO Content Using isoinfo Command

The isoinfo command is used for directory listings of iso9660 images, but you can also use this program to extract files.

As I said isoinfo program perform directory listing, so first list the content of ISO file.

```
$ isoinfo -i ubuntu-16.10-server-amd64.iso -l
```
[
 ![List ISO Content in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/List-ISO-Content-in-Linux.png) 
][6]

List ISO Content in Linux

Now you can extract a single file from an ISO image like so:

```
$ isoinfo -i ubuntu-16.10-server-amd64.iso -x MD5SUM.TXT > MD5SUM.TXT
```

Note: The redirection is needed as `-x` option extracts to stdout.

[
 ![Extract Single File from ISO in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Extract-Single-File-from-ISO-in-Linux.png) 
][7]

Extract Single File from ISO in Linux

Well, there are many ways to do, if you know any useful command or program to extract or copy files from ISO file do share us via comment section.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/extract-files-from-iso-files-linux

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Mount-ISO-File-in-Linux.png
[2]:http://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Copy-Files-From-ISO-File-in-Linux.png
[4]:http://www.tecmint.com/monitor-copy-backup-tar-progress-in-linux-using-pv-command/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Extract-ISO-Content-in-Linux.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/List-ISO-Content-in-Linux.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Extract-Single-File-from-ISO-in-Linux.png
