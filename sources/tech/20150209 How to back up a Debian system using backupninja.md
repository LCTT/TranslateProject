How to back up a Debian system using backupninja
================================================================================
Prudence or experience by disaster can teach every [sysadmin][1] the importance of taking frequent system backups. You can do so by writing good old shell scripts, or using one (or more) of the many backup tools available for the job. Thus the more tools you become acquainted with, the better informed decisions you will make when implementing a backup solution.

In this article we will present [backupninja][2], a lightweight and easy-to-configure system backup tool. With the help of programs like **rdiff-backup**, **duplicity**, **mysqlhotcopy** and **mysqldump**, Backupninja offers common backup features such as remote, secure and incremental file system backups, encrypted backup, and MySQL/MariaDB database backup. You can selectively enable status email reports, and can back up general hardware and system information as well. One key strength of backupninja is a built-in console-based wizard (called **ninjahelper**) that allows you to easily create configuration files for various backup scenarios.

The downside, so to speak, is that backupninja requires other "helper" programs to be installed in order to take full advantage of all its features. While backupninja's RPM package is available for Red Hat-based distributions, backupninja's dependencies are optimized for Debian and its derivatives. Thus it is not recommended to try backupninja for Red Hat based systems.

In this tutorial, we will cover the backupninja installation for Debian-based distributions.

### Installing Backupninja ###

Run the following command as root: 

    # aptitude install backupninja 

During installation, several files and directories will be created:

- **/usr/sbin/backupninja** is the main bash shell script.
- **/etc/cron.d/backupninja**, by default, instructs cron to run the main script once per hour.
- **/etc/logrotate.d/backupninja** rotates the logs created by the program.
- **/etc/backup.d/** is the directory where the configuration files for backup actions reside.
- **/etc/backupninja.conf** is the main configuration file that includes general options. It is well commented and explains each option in detail.
- **/usr/share/backupninja** is the directory where the scripts used by backupninja are located (aka "handlers"). These are the scripts which are in charge of doing the actual work. In this directory you will also find .helper files, which are used to configure and set up ninjahelper menus.
- **/usr/share/doc/backupninja/examples** contains templates for action configuration files (the kind of files that are created through ninjahelper). 

### Running Ninjahelper for the First Time ###

When we try to launch ninjahelper, we can see that an internal dependency may be required. If prompted, enter "yes" and press the ENTER key to install dialog (a tool that displays user-friendly dialog boxes from shell scripts).

![](https://farm8.staticflickr.com/7537/15700597667_6618fbc142_z.jpg)

When you press Enter after typing yes, backupninja will install dialog and present the following screen once it's done.

![](https://farm8.staticflickr.com/7469/15884374871_29f1c9acf1_z.jpg)

#### Example 1: Back up Hardware and System Info ####

After launching ninjahelper, we will create a new backup action:

![](https://farm9.staticflickr.com/8637/15885715132_eb3156678e_z.jpg)

If necessary helper programs are not installed, we will be presented with the following screens. Disregard this step if these packages have already been installed on your system.

![](https://farm8.staticflickr.com/7508/15700315139_4c6117ef32_z.jpg)

The next step consists of selecting the items that you want to be a part of this backup. The first four are selected by default, but you can deselect them by pressing the spacebar.

![](https://farm8.staticflickr.com/7507/15699051870_65abaf52e5_z.jpg)

Once you are done, press OK to continue. You will be able to choose whether you want to use the default configuration file for this backup action (/etc/backup.d/10.sys), or if you want to create a new one. In the latter case, a new file with the same contents as the default one will be created under the same directory but named 11.sys, and so on for future system backup actions. Note that you can edit the configuration file once it's created with your preferred text editor. 

![](https://farm9.staticflickr.com/8654/15885715072_1e6126e929_o.png)

#### Example 2: Incremental Rsync Pull Backup of a Remote Directory ####

As you most likely know, rsync is widely used to synchronize files and folders over a network. In the following example we will discuss an approach to take incremental pull backups of a remote directory with hardlinking to save historical data and store them in our local file server. This approach will help us save space and increase security on the server side.

**Step 1**: Write a custom script in the /etc/backup.d directory with the following contents and chmod it to 600. Note that this directory may contain, besides plain configuration files, scripts that you want to run when backupninja is executed, with the advantage of using variables present in the main configuration file.

    # REMOTE USER
    user=root
    # REMOTE HOST
    host=dev1
    # REMOTE DIRECTORY
    remotedir=/home/gacanepa/
    # LOCAL DIRECTORY
    localdir=/home/gacanepa/backup.0
    # LOCAL DIRECTORY WHERE PREVIOUS BACKUP WAS STORED
    localdirold=/home/gacanepa/backup.1
    mv $localdir $localdirold
    # RSYNC
    rsync -av --delete --recursive --link-dest=$localdirold $user@$host:$remotedir $localdir

In the above configuration, the '--link-dest' option of rsync is use to hardlink unchanged files (in all attributes) from $localdir-old to the destination directory ($localdir).

**Step 2**: Before backupninja is run for the first time, the parent directory (/home/gacanepa in this case) is empty. The first time we execute:

    # backupninja -n 

the backup.0 directory is created, and later in the process its name is changed to backup.1.

The second time we run backupninja, backup.0 is re-created and backup.1 is kept.

![](https://farm8.staticflickr.com/7581/15700597497_0e0cd89ab9.jpg)

**Step 3**: Verify that the contents of backup.1 are hard links to the files in backup.0 by comparing the respective inode numbers and directory sizes.

![](https://farm9.staticflickr.com/8636/15700315029_e922ce771b.jpg)

### Conclusion ###

Backupninja is not only a classic backup tool, but also an easy-to-configure utility. You can write your own handlers to run backupninja as per the individual configuration files located in /etc/backup.d, and you can even write helpers for ninjahelper in order to include them in its main interface.

For example, if you create a handler named xmodulo in /usr/share/backupninja, it will run by default every file with the .xmodulo extension in /etc/backup.d. If you decide you want to add your xmodulo handler to ninjahelper, you can write the corresponding helper as xmodulo.helper. In addition, if you want backupninja to run an arbitrary script, just add it to /etc/backup.d and you are good to go.

Feel free to leave your comments, questions, or suggestions, using the form below. we will be more than glad to hear from you.

--------------------------------------------------------------------------------

via: http://xmodulo.com/backup-debian-system-backupninja.html

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/recommend/sysadminbook
[2]:https://labs.riseup.net/code/projects/backupninja