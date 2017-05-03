(翻译中 by runningwater)
FreeFileSync – Compare and Synchronize Files in Ubuntu
============================================================


FreeFileSync is a free, open source and cross platform folder comparison and synchronization software, which helps you [synchronize files and folders on Linux][2], Windows and Mac OS.

It is portable and can also be installed locally on a system, it’s feature-rich and is intended to save time in setting up and executing backup operations while having attractive graphical interface as well.

#### FreeFileSync Features

Below are it’s key features:

1.  It can synchronize network shares and local disks.
2.  It can synchronize MTP devices (Android, iPhone, tablet, digital camera).
3.  It can also synchronize via [SFTP (SSH File Transfer Protocol)][1].
4.  It can identify moved and renamed files and folders.
5.  Displays disk space usage with directory trees.
6.  Supports copying locked files (Volume Shadow Copy Service).
7.  Identifies conflicts and propagate deletions.
8.  Supports comparison of files by content.
9.  It can be configured to handle Symbolic Links.
10.  Supports automation of sync as a batch job.
11.  Enables processing of multiple folder pairs.
12.  Supports in-depth and detailed error reporting.
13.  Supports copying of NTFS extended attributes such as (compressed, encrypted, sparse).
14.  Also supports copying of NTFS security permissions and NTFS Alternate Data Streams.
15.  Support long file paths with more than 260 characters.
16.  Supports Fail-safe file copy prevents data corruption.
17.  Allows expanding of environment variables such as %UserProfile%.
18.  Supports accessing of variable drive letters by volume name (USB sticks).
19.  Supports managing of versions of deleted/updated files.
20.  Prevent disc space issues via optimal sync sequence.
21.  Supports full Unicode.
22.  Offers a highly optimized run time performance.
23.  Supports filters to include and exclude files plus lots more.

### How To Install FreeFileSync in Ubuntu Linux

We will add official FreeFileSync PPA, which is available for Ubuntu 14.04 and Ubuntu 15.10 only, then update the system repository list and install it like so:

```
-------------- On Ubuntu 14.04 and 15.10 -------------- 
$ sudo apt-add-repository ppa:freefilesync/ffs
$ sudo apt-get update
$ sudo apt-get install freefilesync
```

On Ubuntu 16.04 and newer version, go to the [FreeFileSync download page][3] and get the appropriate package file for Ubuntu and Debian Linux.

Next, move into the Download folder, extract the FreeFileSync_*.tar.gz into the /opt directory as follows:

```
$ cd Downloads/
$ sudo tar xvf FreeFileSync_*.tar.gz -C /opt/
$ cd /opt/
$ ls
$ sudo unzip FreeFileSync/Resources.zip -d /opt/FreeFileSync/Resources/
```

Now we will create an application launcher (.desktop file) using Gnome Panel. To view examples of `.desktop`files on your system, list the contents of the directory /usr/share/applications:

```
$ ls /usr/share/applications
```

In case you do not have Gnome Panel installed, type the command below to install it:

```
$ sudo apt-get install --no-install-recommends gnome-panel
```

Next, run the command below to create the application launcher:

```
$ sudo gnome-desktop-item-edit /usr/share/applications/ --create-new
```

And define the values below:

```
Type: 	   Application 
Name: 	   FreeFileSync
Command:   /opt/FreeFileSync/FreeFileSync		
Comment:   Folder Comparison and Synchronization
```

To add an icon for the launcher, simply clicking on the spring icon to select it: /opt/FreeFileSync/Resources/FreeFileSync.png.

When you have set all the above, click OK create it.

[
 ![Create Desktop Launcher](http://www.tecmint.com/wp-content/uploads/2017/03/Create-Desktop-Launcher.png) 
][4]

Create Desktop Launcher

If you don’t want to create desktop launcher, you can start FreeFileSync from the directory itself.

```
$ ./FreeFileSync
```

### How to Use FreeFileSync in Ubuntu

In Ubuntu, search for FreeFileSync in the Unity Dash, whereas in Linux Mint, search for it in the System Menu, and click on the FreeFileSync icon to open it.

[
 ![FreeFileSync ](http://www.tecmint.com/wp-content/uploads/2017/03/FreeFileSync-launched.png) 
][5]

FreeFileSync

#### Compare Two Folders Using FreeFileSync

In the example below, we’ll use:

```
Source Folder:	/home/aaronkilik/bin
Destination Folder:	/media/aaronkilik/J_CPRA_X86F/scripts
```

To compare the file time and size of the two folders (default setting), simply click on the Compare button.

[
 ![Compare Two Folders in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/compare-two-folders.png) 
][6]

Compare Two Folders in Linux

Press `F6` to change what to compare by default, in the two folders: file time and size, content or file size from the interface below. Note that the meaning of the each option you select is included as well.

[
 ![File Comparison Settings](http://www.tecmint.com/wp-content/uploads/2017/03/comparison-settings.png) 
][7]

File Comparison Settings

#### Synchronization Two Folders Using FreeFileSync

You can start by comparing the two folders, and then click on Synchronize button, to start the synchronization process; click Start from the dialog box the appears thereafter:

```
Source Folder: /home/aaronkilik/Desktop/tecmint-files
Destination Folder: /media/aaronkilik/Data/Tecmint
```
[
 ![Compare and Synchronize Two Folders](http://www.tecmint.com/wp-content/uploads/2017/03/compare-and-sychronize-two-folders.png) 
][8]

Compare and Synchronize Two Folders

[
 ![Start File Synchronization](http://www.tecmint.com/wp-content/uploads/2017/03/start-sychronization.png) 
][9]

Start File Synchronization

[
 ![File Synchronization Completed](http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-complete.png) 
][10]

File Synchronization Completed

To set the default synchronization option: two way, mirror, update or custom, from the following interface; press `F8`. The meaning of the each option is included there.

[
 ![File Synchronization Settings](http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-setttings.png) 
][11]

File Synchronization Settings

For more information, visit FreeFileSync homepage at [http://www.freefilesync.org/][12]

That’s all! In this article, we showed you how to install FreeFileSync in Ubuntu and it’s derivatives such as Linux Mint, Kubuntu and many more. Drop your comments via the feedback section below.

--------------------------------------------------------------------------------

作者简介：

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: [Twitter][00], [Facebook][01] and [Google+][02]

--------------------------------------------------------------------------------


via: http://www.tecmint.com/freefilesync-compare-synchronize-files-in-ubuntu/

作者：[Ravi Saive ][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[00]:https://twitter.com/ravisaive
[01]:https://www.facebook.com/ravi.saive
[02]:https://plus.google.com/u/0/+RaviSaive

[1]:http://www.tecmint.com/sftp-command-examples/
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[3]:http://www.freefilesync.org/download.php
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Create-Desktop-Launcher.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/FreeFileSync-launched.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/compare-two-folders.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/comparison-settings.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/compare-and-sychronize-two-folders.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/start-sychronization.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-complete.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-setttings.png
[12]:http://www.freefilesync.org/
[13]:http://www.tecmint.com/author/admin/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
