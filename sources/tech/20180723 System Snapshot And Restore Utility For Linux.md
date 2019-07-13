System Snapshot And Restore Utility For Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/07/backup-restore-720x340.jpg)

**CYA** , stands for **C** over **Y** our **A** ssets, is a free, open source system snapshot and restore utility for any Unix-like operating systems that uses BASH shell. Cya is portable and supports many popular filesystems such as EXT2/3/4, XFS, UFS, GPFS, reiserFS, JFS, BtrFS, and ZFS etc. Please note that **Cya will not backup the actual user data**. It only backups and restores the operating system itself and not your actual user data. **Cya is a system restore utility**. By default, it will backup all key directories like /bin/, /lib/, /usr/, /var/ and several others. You can, however, define your own directories and files path to include in the backup, so Cya will pick those up as well. Also, it is possible define some directories/files to skip from the backup. For example, you can skip /var/logs/ if you don’t log files. Cya actually uses **Rsync** backup method under the hood. However, Cya is super easier than Rsync when creating rolling backups.

When restoring your operating system, Cya will rollback the OS using your backup profile which you created earlier. You can either restore the entire system or any specific directories only. Also, you can easily access the backup files even without a complete rollback using your terminal or file manager. ANother notable feature is we can generate a custom recovery script to automate the mounting of your system partition(s) when you restore off a live CD, USB, or network image. In a nutshell, CYA can help you to restore your system to previous states when you end-up with a broken system caused by software update, configuration changes, intrusions/hacks, etc.

### Installing CYA

Installing CYA is very easy. All you have to do is download Cya binary and put it in your system path.
```
$ git clone https://github.com/cleverwise/cya.git

```

This will clone the latest cya version in a directory called cya in your current working directory.

Next, copy the cya binary to your path or wherever you want.
```
$ sudo cp cya/cya /usr/local/bin/

```

CYA as been installed. Now let us go ahead and create snapshots.

### Creating Snapshots

Before creating any snapshots/backups, create a recovery script using command:
```
$ cya script
☀ Cover Your Ass(ets) v2.2 ☀

ACTION ⯮ Generating Recovery Script

Generating Linux recovery script ...
Checking sudo permissions...
Complete

IMPORTANT: This script will ONLY mount / and /home. Thus if you are storing data on another mount point open the recovery.sh script and add the additional mount point command where necessary. This is also a best guess and should be tested before an emergency to verify it works as desired.


‣ Disclaimer: CYA offers zero guarantees as improper usage can cause undesired results
‣ Notice: Proper usage can correct unauthorized changes to system from attacks

```

Save the resulting **recovery.sh** file in your USB drive which we are going to use it later when restoring backups. This script will help you to setup a chrooted environment and mount drives when you rollback your system.

Now, let us create snapshots.

To create a standard rolling backup, run:
```
$ cya save

```

The above command will keep **three backups** before overwriting.

**Sample output:**
```
☀ Cover Your Ass(ets) v2.2 ☀

ACTION ⯮ Standard Backup

Checking sudo permissions...
[sudo] password for sk:
We need to create /home/cya/points/1 ... done
Backing up /bin/ ... complete
Backing up /boot/ ... complete
Backing up /etc/ ... complete
.
.
.
Backing up /lib/ ... complete
Backing up /lib64/ ... complete
Backing up /opt/ ... complete
Backing up /root/ ... complete
Backing up /sbin/ ... complete
Backing up /snap/ ... complete
Backing up /usr/ ... complete
Backing up /initrd.img ... complete
Backing up /initrd.img.old ... complete
Backing up /vmlinuz ... complete
Backing up /vmlinuz.old ... complete
Write out date file ... complete
Update rotation file ... complete

‣ Disclaimer: CYA offers zero guarantees as improper usage can cause undesired results
‣ Notice: Proper usage can correct unauthorized changes to system from attacks

```

You can view the contents of the newly created snapshot, under **/home/cya/points/** location.
```
$ ls /home/cya/points/1/
bin cya-date initrd.img lib opt sbin usr vmlinuz
boot etc initrd.img.old lib64 root snap var vmlinuz.old

```

To create a backup with a custom name that will not be overwritten, run:
```
$ cya keep name BACKUP_NAME

```

Replace **BACKUP_NAME** with your own name.

To create a backup with a custom name that will overwrite, do:
```
$ cya keep name BACKUP_NAME overwrite

```

To create a backup and archive and compress it, run:
```
$ cya keep name BACKUP_NAME archive

```

This command will store the backups in **/home/cya/archives** location.

By default, CYA will store its configuration in **/home/cya/** directory and the snapshots with a custom name will be stored in **/home/cya/points/BACKUP_NAME** location. You can, however, change these settings by editing the CYA configuration file stored at **/home/cya/cya.conf**.

Like I already said, CYA will not backup user data by default. It will only backup the important system files. You can, however, include your own directories or files along with system files. Say for example, if you wanted to add the directory named **/home/sk/Downloads** directory in the backup, edit **/home/cya/cya.conf** file:
```
$ vi /home/cya/cya.conf

```

Define your directory data path that you wanted to include in the backup like below.
```
MYDATA_mybackup="/home/sk/Downloads/ /mnt/backup/sk/"

```

Please be mindful that both source and destination directories should end with a trailing slash. As per the above configuration, CYA will copy all the contents of **/home/sk/Downloads/** directory and save them in **/mnt/backup/sk/** (assuming you already created this) directory. Here **mybackup** is the profile name. Save and close the file.

Now to backup the contents of /home/sk/Downloads/ directory, you need to enter the profile name (i.e mybackup in my case) with the **cya mydata** command like below:
```
$ cya mydata mybackup

```

Similarly, you can include multiple user data with a different profile names. All profile names must be unique.

### Exclude directories

Some times, you may not want to backup all system files. You might want to exclude some unimportant such as log files. For example, if you don’t want to include **/var/tmp/** and **/var/logs/** directories, add the following in **/home/cya/cya.conf** file.
```
EXCLUDE_/var/=”tmp/ logs/”

```

Similarly, you can specify all directories one by one that you want to exclude from the backup. Once done, save and close the file.

### Add specific files to the backup

Instead of backing up whole directories, you can include a specific files from a directory. To do so, add the path of your files one by one in **/home/cya/cya.conf** file.
```
BACKUP_FILES="/home/sk/Downloads/ostechnix.txt"

```

### Restore your system

Remember, we already create a recovery script named **recovery.sh** and saved it in an USB drive? Yeah, we will need it now to restore our broken system.

Boot your system with any live bootable CD/DVD, USB drive. The developer of CYA recommends to use a live boot environment from same major version as your installed environment! For example if you use Ubuntu 18.04 system, then use Ubuntu 18.04 live media.

Once you’re in the live system, mount the USB drive that contains the recovery.sh script. Once you mounted the drive(s), your system’s **/** and **/home** will be mounted to the **/mnt/cya** directory. This is made really easy and handled automatically by the **recovery.sh** script for Linux users.

Then, start the restore process using command:
```
$ sudo /mnt/cya/home/cya/cya restore

```

Just follow the onscreen instructions. Once the restoration is done, remove the live media and unmount the drives and finally, reboot your system.

What if you don’t have or lost recovery script? No problem, we still can restore our broken system.

Boot the live media. From the live session, create a directory to mount the drive(s).
```
$ sudo mkdir -p /mnt/cya

```

Then, mount your **/** and **/home** (if on another partition) into the **/mnt/cya** directory.
```
$ sudo mount /dev/sda1 /mnt/cya

$ sudo mount /dev/sda3 /mnt/cya/home

```

Replace /dev/sda1 and /dev/sda3 with your correct partitions (Use **fdisk -l** command to find your partitions).

Finally, start the restoration process using command:
```
$ sudo /mnt/cya/home/cya/cya restore

```

Once the recovery is completed, unmount all mounted partitions and remove install media and reboot your system.

At this stage, you might get a working system. I deleted some important libraries in Ubuntu 18.04 LTS server. I successfully restored it to the working state by using CYA utility.

### Schedule CYA backup

It is always recommended to use crontab to schedule the CYA snapshot process at regular interval. You can setup a cron job using root or setup a user that doesn’t need to enter a sudo password.

The example entry below will run cya at every Monday at 2:05 am with output dumped into /dev/null.
```
5 2 * *  1 /home/USER/bin/cya save >/dev/null 2>&1

```

And, that’s all for now. Unlike Systemback and other system restore utilities, Cya is not a distribution-specific restore utility. It supports many Linux operating systems that uses BASH. It is one of the must-have applications in your arsenal. Install it right away and create snapshots. You won’t regret when you accidentally crashed your Linux system.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cya-system-snapshot-and-restore-utility-for-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
