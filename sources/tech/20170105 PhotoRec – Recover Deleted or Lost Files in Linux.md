#rusking translating

PhotoRec – Recover Deleted or Lost Files in Linux
============================================================

When you delete a file accidentally or intentionally on your system using ‘shift + delete‘ or delete option or empty Trash, the file content is not destroyed from the hard disk (or any storage media).

It is simply removed from the the directory structure and you cannot see the file in the directory where you deleted it, but it still remains somewhere in your hard drive.

If you have the appropriate tools and knowledge, you can [recover lost files from your computer][1]. However, as you store more files on your hard disk, the deleted files are overwritten, you may only recover recently deleted files.

In this tutorial, we will explain how to recover lost or deleted files on a hard disk in Linux using Testdisk, is a remarkable recovery tool ships in with a free tool called PhotoRec.

PhotoRec is used to recover lost files from storage media such as hard drives, digital camera and cdrom.

### Install Testdisk (PhotoRec) in Linux Systems

To install Testdisk by running the relevant command below for your distribution:

```
------- On Debian/Ubuntu/Linux Mint ------- 
$ sudo apt-get install testdisk
------- On CentOS/RHEL/Fedora ------- 
$ sudo yum install testdisk
------- On Fedora 22+ ------- 
$ sudo dnf install testdisk   
------- On Arch Linux ------- 
$ pacman -S testdisk             
------- On Gentoo ------- 
$ emerge testdisk  
```

In case it is not available on your Linux distribution’s repositories, download it from [here][2] and run it on a Live CD.

It can also be found in rescue CD such as Gparted LiveCD, Parted Magic, Ubuntu Boot CD, Ubuntu-Rescue-Remix and many more.

Once the installation is complete, start PhotoRec in a text window as follows with root privileges and specify the partition from which the files where deleted:

```
$ sudo photorec /dev/sda3
```

You’ll see the interface below:

[
 ![PhotoRec Data Recovery Tool for Linux](http://www.tecmint.com/wp-content/uploads/2017/01/PhotoRec-Data-Recovery-Tool.png) 
][3]

PhotoRec Data Recovery Tool for Linux

Use the `right` and `left` arrow keys to select a menu item, and press Enter. To continue with the recovery operation, select `[Proceed]` and hit Enter.

You will be at the following interface:

[
 ![Select Partition to Proceed File Recovery](http://www.tecmint.com/wp-content/uploads/2017/01/Select-Partition-to-Proceed-File-Recovery.png) 
][4]

Select Partition to Proceed File Recovery

Select `[Options]` to view available recovery operation options as in the interface below:

[
 ![Linux File Recovery Options](http://www.tecmint.com/wp-content/uploads/2017/01/Linux-File-Recovery-Options.png) 
][5]

Linux File Recovery Options

Press `Q` to move back, at the interface below, you can specify the file extensions you want to search and recover. Therefore, select `[File Opt]` and press Enter.

Press `s` to disable/enable all file extensions, and in case you have disabled all file extensions, only choose types of files you want to recover by selecting them using `right` arrow keys (or `left` arrow key to deselect).

For instance, I want to recover all `.mov` files that I lost on my system.

[
 ![Specify Recovery File Type](http://www.tecmint.com/wp-content/uploads/2017/01/Specify-Recovery-File-Type.png) 
][6]

Specify Recovery File Type

Then press `b` to save the setting, you should see the message below after pressing it. Move back by hitting Enter (or simply press `Q` button), then press `Q` again to go back to the main menu.

[
 ![Save File Recovery Settings](http://www.tecmint.com/wp-content/uploads/2017/01/Save-File-Recovery-Settings.png) 
][7]

Save File Recovery Settings

Now select `[Search]` to start the recovery process. In the interface below, choose the filesystem type where the file(s) were stored and hit Enter.

[
 ![Select Filesystem to Recover Deleted Files](http://www.tecmint.com/wp-content/uploads/2017/01/Select-Filesystem-to-Recover-Files.png) 
][8]

Select Filesystem to Recover Deleted Files

Next, choose if only free space or the whole partition needs to be analyzed as below. Note that choosing whole partition will make the operation slower and longer. Once you have selected the appropriate option, press Enterto proceed.

[
 ![Choose Filesystem to Analyze](http://www.tecmint.com/wp-content/uploads/2017/01/Select-Filesystem-to-Analyze.png) 
][9]

Choose Filesystem to Analyze

Closely select a directory where recovered files will be stored, if the destination is correct, press `C` button to continue. Choose a directory on a different partition to avoid deleted files being overwritten when more data is stored on the partition.

To move back until the root partition, use the `left` arrow key.

[
 ![Select Directory to Save Recovered Files](http://www.tecmint.com/wp-content/uploads/2017/01/Select-Directory-to-Save-Recovered-Files.png) 
][10]

Select Directory to Save Recovered Files

The screenshot below shows deleted files of the specified type being recovered. You can stop the operation by pressing Enter.

Note: Your system may become slow, and possibly freeze at certain moments, so you need to be patient until when the process is complete.

[
 ![Recovering Deleted Files in Linux](http://www.tecmint.com/wp-content/uploads/2017/01/Recover-Deleted-Files-in-Linux.png) 
][11]

Recovering Deleted Files in Linux

At the end of the operation, Photorec will show you the number and the location of files recovered.

[
 ![Linux File Recovery Summary](http://www.tecmint.com/wp-content/uploads/2017/01/Linux-File-Recovery-Summary.png) 
][12]

Linux File Recovery Summary

The recovered files will be stored with root privileges by default, therefore open your file manager with elevated privileges to access the files.

Use the command below (specify your file manager):

```
$ gksudo nemo
or
$ gksudo nautilus 
```

For more information, visit PhotoRec homepage: [http://www.cgsecurity.org/wiki/PhotoRec][13].

That’s all! In this tutorial, we explained the necessary steps to recover deleted or lost files from hard disk using PhotoRec. This is so far the most reliable and effective recovery tool I have ever used, if you know any other similar tool, do share with us in the comments.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/photorec-recover-deleted-lost-files-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/recover-deleted-file-in-linux/
[2]:http://www.cgsecurity.org/wiki/TestDisk_Download
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/PhotoRec-Data-Recovery-Tool.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/Select-Partition-to-Proceed-File-Recovery.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Linux-File-Recovery-Options.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Specify-Recovery-File-Type.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/01/Save-File-Recovery-Settings.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/Select-Filesystem-to-Recover-Files.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/01/Select-Filesystem-to-Analyze.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/01/Select-Directory-to-Save-Recovered-Files.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/01/Recover-Deleted-Files-in-Linux.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/01/Linux-File-Recovery-Summary.png
[13]:http://www.cgsecurity.org/wiki/PhotoRec
