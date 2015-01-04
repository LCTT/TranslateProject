How to set up a cross-platform backup server on Linux with BackupPC
================================================================================
Just in case you haven't been able to tell from my earlier posts on [backupninja][1] and [backup-manager][2], I am a big backup fan. When it comes to backup, I'd rather have too much than not enough, because if the need arises, you will be grateful that you took the time and effort to generate extra copies of your important data.

In this post, I will introduce you to [BackupPC][3], a cross-platform backup server software which can perform pull backup of Linux, Windows and MacOS client hosts over network. BackupPC adds a number of features that make managing backups an almost fun thing to do.

### Features of BackupPC ###

BackupPC comes with a robust web interface that allows you to collect and manage backups of other remote client hosts in a centralized fashion. Using the web interface, you can examine logs and configuration files, start/cancel/schedule backups of other remote hosts, and visualize current status of backup tasks. You can also browse through archived files and restore individual files or entire jobs from backup archives very easily. To restore individual single files, you can download them from any previous backup directly from the web interface. As if this weren't enough, no special client-side software is needed for client hosts. On Windows clients, the native SMB protocol is used, whereas on *nix clients, you will use `rsync` or tar over SSH, RSH or NFS.

### Installing BackupPC ###

On Debian, Ubuntu and their derivatives, run the following command.

    # aptitude install backuppc 

On Fedora, use `yum` command. Note the case sensitive package name.

On CentOS/RHEL 6, first enable [EPEL repository][4]. On CentOS/RHEL 7, enable [Nux Dextop][5] repository instead. Then go ahead with `yum` command:

    # yum install BackupPC 

As usual, both package management systems will take care of dependency resolution automatically. In addition, as part of the installation process, you may be asked to configure, or reconfigure the web server that will be used for the graphical user interface. The following screenshot is from a Debian system:

![](https://farm8.staticflickr.com/7573/16163781711_6218b620ef_c.jpg)

Select your choice by pressing the space bar, and then move to Ok with the tab key and hit ENTER.

You will then be presented with the following screen informing you that an administrative user account 'backuppc', along with its corresponding password (which can be changed later if desired), has been created to manage BackupPC. Note that both a HTTP user account and a regular Linux account of the same name 'backuppc' will be created with an identical password. The former is needed to access BackupPC's protected web interface, while the latter is needed to perform backup using rsync over SSH.

![](https://farm8.staticflickr.com/7579/15979622809_25e734658d_c.jpg)

You can change the default password for the HTTP user 'backuppc' with the following command:

    # htpasswd /path/to/hash/file backuppc 

As for a regular 'backuppc' [Linux][6] user account, use passwd command to change its default password.

    # passwd backuppc 

Note that the installation process creates the web and the program's configuration files automatically.

### Launching BackupPC and Configuring Backups ###

To start, open a browser window and point to http://<server's FQDN or IP address>/backuppc/. When prompted, enter the default HTTP user credentials that were supplied to you earlier. If the authentication succeeds, you will be taken to the main page of the web interface.

![](https://farm9.staticflickr.com/8601/15543330314_f6fdaa235e_z.jpg)

Most likely the first thing that you will want to do is add a new client host to back up. Go to "Edit Hosts" in the Task pane. We will add two client hosts:

- Host #1: CentOS 7 [IP 192.168.0.17]
- Host #2: Windows 7 [IP 192.168.0.103] 

We will back up the CentOS host using rsync over SSH and the Windows host using SMB. Prior to performing the backup, we need to set up [key-based authentication][7] to our CentOS host and a shared folder in our Windows machine.

Here are the instructions for setting up key-based authentication for a remote CentOS host. We create the 'backuppc' user's RSA key pair, and transfer its public key to the root account of the CentOS host.

    # usermod -s /bin/bash backuppc
    # su - backuppc
    # ssh-keygen -t rsa
    # ssh-copy-id root@192.168.0.17 

When prompted, type yes and enter root's password for 192.168.0.17.

![](https://farm8.staticflickr.com/7496/16164929932_8fc817125d_b.jpg)

You will need root access for a remote CentOS host to grant write access to all its file system in case of restoring a backup of files or directories owned by root.

Once the CentOS and Windows hosts are ready, add them to BackupPC using the web interface:

![](https://farm9.staticflickr.com/8586/15979622709_76c2dcf68c_z.jpg)

The next step consists of modifying each host's backup settings:

![](https://farm8.staticflickr.com/7461/16163781611_765c147f9f_z.jpg)

The following image shows the configuration for the backup of the Windows machine:

![](https://farm8.staticflickr.com/7480/16139884676_bddfafed75_z.jpg)

And the following screenshot shows the settings for the backup of the CentOS box:

![](https://farm8.staticflickr.com/7557/16139884666_34ff8fd858_z.jpg)

### Starting a Backup ###

To start each backup, go to each host's settings, and then click "Start Full Backup":

![](https://farm8.staticflickr.com/7536/15978247428_458c023f4c.jpg)

At any time, you can view the status of the process by clicking on the host's home as shown in the image above. If it fails for some reason, a link to a page with the error message(s) will appear in the host menu as well. When a backup completes successfully, a directory with the host's name or IP address is created under /var/lib/backuppc/pc in the server:

![](https://farm8.staticflickr.com/7549/16165680115_196ee42a49_z.jpg)

Feel free to browse those directories for the files from the command line, but there is an easier way to look for those files and restore them.

### Restoring Backup ###

To view the files that have been saved, go to "Browse backups" under each host's main menu. You can visualize the directories and files at a glance, and select those that you want to restore. Alternatively, you can click on files to open them with the default program, or right click and choose Save link as to download it to the machine where you're working at the time:

![](https://farm8.staticflickr.com/7506/16165680105_bd5883e0da_c.jpg)

If you want, you can download a zip or tar file containing the backup's contents:

![](https://farm8.staticflickr.com/7507/15978247398_18e81667cd_z.jpg)

or just restore the file(s):

![](https://farm8.staticflickr.com/7545/15545911003_2aca8a36fc_z.jpg)

### Conclusion ###

There is a saying that goes, "the simpler, the better", and that is just what BackupPC has to offer. In BackupPC, you will not only find a backup tool but also a very versatile interface to manage your backups of several operating systems without needing any client-side application. I believe that's more than reason enough for you to give it at least a try. 

Feel free to leave your comments and questions, if you have any, using the form below. I am always happy to hear what readers have to say!

--------------------------------------------------------------------------------

via: http://xmodulo.com/backuppc-cross-platform-backup-server-linux.html

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/backup-debian-system-backupninja.html
[2]:http://xmodulo.com/linux-backup-manager.html
[3]:http://backuppc.sourceforge.net/
[4]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[5]:http://ask.xmodulo.com/enable-nux-dextop-repository-centos-rhel.html
[6]:http://xmodulo.com/recommend/linuxguide
[7]:http://xmodulo.com/how-to-enable-ssh-login-without.html