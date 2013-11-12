SBackup: A Simple Backup Solution For Your Linux Desktop
================================================================================
**SBackup**, Simple Backup, is an Open Source, easy to use backup solution intended for desktop use. It can backup any subset of files and folders. All configuration is accessable via Gnome interface. File and paths can be included and excluded directly or by regex, It supports local and as well as remote backups. Though it looks simple, it has many features to meet the advanced backup functionality.

### Features ###

SBackup will do the following things for you:

- It creates both compressed and uncompressed backups.
- It can split uncompressed backups into multiple parts.
- It support of multiple backup profiles. You can create and edit the profiles as per your requirement, but you can’t delete the default profile.
- It has options such as logging, email notification and status icon presenting progress and notifications.
- It supports scheduled backups and manual backups.
- It can backup files either to local destinations (e.g. hard disk) or remote destinations (e.g. NAS over FTP).

### Install SBackup On Ubuntu, Linux Mint and Debian ###

SBackup is available in the default repositories of Ubuntu, Debian and Linux Mint. So just install it using command:

    sudo apt-get install sbackup

### Launch SBackup ###

Open up SBackup either from Dash or Menu.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Menu_0011.jpg)

It will look like as shown below.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_002.jpg)

### SBackup Profiles ###

Initially SBackup won’t have any user profiles. Only “default profile” will be available. Be mindful that you can’t delete the default profile. To create a new profile, go to Tools -> Profile Manager. You will have a following like window.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_003.jpg)

Click Add to create a new profile, let me name the profile as “sk”.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_004.jpg)

Now a new profile has been created. If you want to use your custom profile, just select the profile and click Edit.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Configuration-Profile-Manager_005.jpg)

Now you may see that SBackup profile has been switched to “sk” profile.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_006.jpg)

However you can use default profile and edit it as per your requirements if you wish.

**Important Note**: If you launch it from a normal user you can’t schedule the backup. To schedule your backup you must run SBackup as root user. As see you in the above screenshots, the schedule tab is greyed out, because i launched it from a normal user.

In this how-to tutorial, i am going to use **default profile** with root user privileges.

Open up your Terminal and run the following command to open SBackup with root user privileges.

    sudo sbackup-config-gtk

The above command will open SBackup with default profile with administrative mode.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_001.jpg)

### General ###

In General section you can define how often do you want to do a full backup. The default option is 7 days. By default SBackup will do full backup every 7 days. Then you can define the compression format for your backup file.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0021.jpg)

### Include ###

This tab pretty self-explanatory. You can include the files/folders that you want to backup using SBackup. Here you can either select individual files or entire folder to backup. I deleted all directories in the include section and added single directory called “Resume”.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0031.jpg)

### Exclude ###

Just like Include tab, we can define the files/folders path to exclude from being backed-up by SBackup. Just select the path of the files/folders that needs to be excluded from backup. By default SBackup will exclude the /media, /var/run/, /var/cache/, /var/spool/ and /vat/tmp/ directories.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0041.jpg)

Further more, you can add the file types that you want to exclude from backup such mp3 or avi etc. By default SBackup exclude files such as mp3, avi, mpeg, mkv, ogg and iso from backup. If you want to include them in your backup, just select and click remove to add them in your backup. Also if you want to add some other file types in the exclude list, just add them by clicking on the add button.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_005.jpg)

By default SBackup won’t backup the folders .gvfs, .thumbnails,  .Trash and .cache etc.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0061.jpg)

Also you can omit the files/folders of certain size from backup. Here i excluded the files/folders which are bigger than 100MB in size.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0071.jpg)

### Destination ###

This is the path where you want to store your backup file. As i mentioned above, you can backup files/folders either in your local hard drive or to an external destination such as FTP, NAS etc. Here i am going to save my backups in /home/sk/My Backup directory.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_019.jpg)

**Note:** Make sure that destination has enough free space to store the backup.

### Schedule ###

In this section you can schedule the backups at a particular time. Click on the **Simple** radio button and select your schedule type such as hourly, daily, weekly and monthly.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_010.jpg)

If you’re good at command line crontab, select custom and define the cron job. If you select the daily schedule type, a cron job will be created in the **/etc/cron.daily/** location.

    sudo ls -l /etc/cron.daily/sbackup

Sample output:

    lrwxrwxrwx 1 root root 33 Nov  8 15:34 /etc/cron.daily/sbackup -> /usr/share/sbackup/sbackup-launch

### Purging ###

This section gives you the option to delete the backup files after a particular period. By default, your backup files will be deleted after 30 days.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0111.jpg)

### Report ###

Report is the final section. From here you can define to receive the mail notification directly in your inbox after the backups got finished. Enter your mail id, smtp server address, email username and password and click Test settings. Be mindful that, before test the mail settings save the configuration by clicking on the Save Configuration button on the Tool bar.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_0121.jpg)

You’ll see a message “Test Successful” after testing your mail settings.

### Start Backup ###

If you want to start backup immediately, click **Make Backup now button** on the SBackup tool bar.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Selection_015.jpg)

A new window will open. Click Yes to create backup.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/sbackup-config-gtk_024.jpg)

Now you can see that a backup process will be started  in the background. You can monitor the progress of the backup by means of the status indicator displayed in the notification area.

After completing the backup, close SBackup and check for your backup in the destination directory. In my case my destination directory is /home/sk/My Backup.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Selection_020.jpg)

### Restore backup ###

From your Terminal run command:

    sudo sbackup-restore-gtk

In the SBackup restoration window, select the date to get the list of the available backups and select the  any one of the available snapshots. Click on the any one of the files to restore on the Restoration management pane. Once you done, click **restore** to save them in the default location or click **restore as** to save the files in a custom location.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Simple-Backup-Suite_023.jpg)

Now the data will be restored from the selected backup. That’s it.

### Sources: ###

- [https://launchpad.net/sbackup][1]
- [http://sourceforge.net/projects/sbackup/][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-desktop-backup-made-easy-sbackup/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://launchpad.net/sbackup
[2]:http://sourceforge.net/projects/sbackup/