How to roll your own backup solution with BorgBackup, Rclone, and Wasabi cloud storage
============================================================

### Protect your data with an automated backup solution built on open source software and inexpensive cloud storage.

![Build your own backup solution with Borg](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/biz_cinderblock_cloud_yellowhat_0.jpg?itok=pvMW5Cyq "Build your own backup solution with Borg")
Image by : opensource.com

For several years, I used CrashPlan to back up my family's computers, including machines belonging to my wife and siblings. The fact that CrashPlan was essentially "always on" and doing frequent backups without ever having to think about it was fantastic. Additionally, the ability to do point-in-time restores came in handy on several occasions. Because I'm generally the IT person for the family, I loved that the user interface was so easy to use that family members could recover their data without my help.

Recently [CrashPlan announced][5] that it was dropping its consumer subscriptions to focus on its enterprise customers. It makes sense, I suppose, as it wasn't making a lot of money off folks like me, and our family plan was using a whole lot of storage on its system.

I decided that the features I would need in a suitable replacement included:

*   Cross-platform support for Linux and Mac

*   Automation (so there's no need to remember to click "backup")

*   Point-in-time recovery (or something close) so if you accidentally delete a file but don't notice until later, it's still recoverable

*   Low cost

*   Replicated data store for backup sets, so data exists in more than one place (i.e., not just backing up to a local USB drive)

*   Encryption in case the backup files fall into the wrong hands

I searched around and asked my friends about services similar to CrashPlan. One was really happy with [Arq][6], but no Linux support meant it was no good for me. [Carbonite][7] is similar to CrashPlan but would be expensive, because I have multiple machines to back up. [Backblaze][8] offers unlimited backups at a good price (US$ 5/month), but its backup client doesn't support Linux. [BackupPC][9] was a strong contender, but I had already started testing my solution before I remembered it. None of the other options I looked at matched everything I was looking for. That meant I had to figure out a way to replicate what CrashPlan delivered for me and my family.

I knew there were lots of good options for backing up files on Linux systems. In fact, I've been using [rdiff-backup][10] for at least 10 years, usually for saving snapshots of remote filesystems locally. I had hopes of finding something that would do a better job of deduplicating backup data though, because I knew there were going to be some things (like music libraries and photos) that were stored on multiple computers.

I think what I worked out came pretty close to meeting my goals.

### My backup solution

### [backup-diagram.png][1]

![backup solution diagram](https://opensource.com/sites/default/files/u128651/backup-diagram.png "backup solution diagram")

Ultimately, I landed on a combination of [BorgBackup][11], [Rclone][12], and [Wasabi cloud storage][13], and I couldn't be happier with my decision. Borg fits all my criteria and has a pretty healthy [community of users and contributors][14]. It offers deduplication and compression, and works great on PC, Mac, and Linux. I use Rclone to synchronize the backup repositories from the Borg host to S3-compatible storage on Wasabi. Any S3-compatible storage will work, but I chose Wasabi because its price can't be beat and it outperforms Amazon's S3\. With this setup, I can restore files from the local Borg host or from Wasabi.

Installing Borg on my machine was as simple as **sudo apt install borgbackup**. My backup host is a Linux machine that's always on with a 1.5TB USB drive attached to it. This backup host could be something as lightweight as a Raspberry Pi if you don't have a machine available. Just make sure all the client machines can reach this server over SSH and you are good to go.

On the backup host, initialize a new backup repository with:

```
$ borg init /mnt/backup/repo1
```

Depending on what you're backing up, you might choose to make multiple repositories per machine, or possibly one big repository for all your machines. Because Borg deduplicates, if you have identical data on many computers, sending backups from all those machines to the same repository might make sense.

Installing Borg on the Linux client machines was straightforward. On Mac OS X I needed to install XCode and Homebrew first. I followed a [how-to][15] to install the command-line tools, then used **pip3 install borgbackup**.

### Backing up

Each machine has a **backup.sh** script (see below) that is kicked off by **cron** at regular intervals; it will make only one backup set per day, but it doesn't hurt to try a few times in the same day. The laptops are set to try every two hours, because there's no guarantee they will be on at a certain time, but it's very likely they'll be on during one of those times. This could be improved by writing a daemon that's always running and triggers a backup attempt anytime the laptop wakes up. For now, I'm happy with the way things are working.

I could skip the cron job and provide a relatively easy way for each user to trigger a backup using [BorgWeb][16], but I really don't want anyone to have to remember to back things up. I tend to forget to click that backup button until I'm in dire need of a restoration (at which point it's way too late!).

The backup script I'm using came from the Borg [quick start][17] docs, plus I added a little check at the top to see if Borg is already running, which will exit the script if the previous backup run is still in progress. This script makes a new backup set and labels it with the hostname and current date. It then prunes old backup sets with an easy retention schedule.

Here is my **backup.sh** script:

```
#!/bin/sh

REPOSITORY=borg@borgserver:/mnt/backup/repo1

#Bail if borg is already running, maybe previous run didn't finish
if pidof -x borg >/dev/null; then
    echo "Backup already running"
    exit
fi

# Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE='thisisnotreallymypassphrase'
# or this to ask an external program to supply the passphrase:
export BORG_PASSCOMMAND='pass show backup'

# Backup all of /home and /var/www except a few
# excluded directories
borg create -v --stats                          \
    $REPOSITORY::'{hostname}-{now:%Y-%m-%d}'    \
    /home/doc                                   \
    --exclude '/home/doc/.cache'                \
    --exclude '/home/doc/.minikube'             \
    --exclude '/home/doc/Downloads'             \
    --exclude '/home/doc/Videos'                \
    --exclude '/home/doc/Music'                 \

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}-' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=6
```

The output from a backup run looks like this:

```
------------------------------------------------------------------------------
Archive name: x250-2017-10-05
Archive fingerprint: xxxxxxxxxxxxxxxxxxx
Time (start): Thu, 2017-10-05 03:09:03
Time (end):   Thu, 2017-10-05 03:12:11
Duration: 3 minutes 8.12 seconds
Number of files: 171150
------------------------------------------------------------------------------
                       Original size      Compressed size Deduplicated size
This archive:               27.75 GB             27.76 GB 323.76 MB
All archives:                3.08 TB              3.08 TB 262.76 GB

                       Unique chunks         Total chunks
Chunk index:                 1682989             24007828
------------------------------------------------------------------------------
[...]
Keeping archive: x250-2017-09-17                      Sun, 2017-09-17 03:09:02
Pruning archive: x250-2017-09-28                      Thu, 2017-09-28 03:09:02
```

Once I had all the machines backing up to the host, I followed [the instructions for installing a precompiled Rclone binary][18] and set it up to access my Wasabi account.

This script runs each night to synchronize any changes to the backup sets:

```
#!/bin/bash
set -e

repos=( repo1 repo2 repo3 )

#Bail if rclone is already running, maybe previous run didn't finish
if pidof -x rclone >/dev/null; then
    echo "Process already running"
    exit
fi

for i in "${repos[@]}"
do
    #Lets see how much space is used by directory to back up
    #if directory is gone, or has gotten small, we will exit
    space=`du -s /mnt/backup/$i|awk '{print $1}'`

    if (( $space < 34500000 )); then
       echo "EXITING - not enough space used in $i"
       exit
    fi

    /usr/bin/rclone -v sync /mnt/backup/$i wasabi:$i >> /home/borg/wasabi-sync.log 2>&1
done
```

The first synchronization of the backup set to Wasabi with Rclone took several days, but it was around 400GB of new data, and my outbound connection is not super-fast. But the daily delta is very small and completes in just a few minutes.

### Restoring files

Restoring files is not as easy as it was with CrashPlan, but it is relatively straightforward. The fastest approach is to restore from the backup stored on the Borg backup server. Here are some example commands used to restore:

```
#List which backup sets are in the repo
$ borg list borg@borgserver:/mnt/backup/repo1
Remote: Authenticated with partial success.
Enter passphrase for key ssh://borg@borgserver/mnt/backup/repo1: 
x250-2017-09-17                      Sun, 2017-09-17 03:09:02
#List contents of a backup set
$ borg list borg@borgserver:/mnt/backup/repo1::x250-2017-09-17 | less
#Restore one file from the repo
$ borg extract borg@borgserver:/mnt/backup/repo1::x250-2017-09-17 home/doc/somefile.jpg
#Restore a whole directory
$ borg extract borg@borgserver:/mnt/backup/repo1::x250-2017-09-17 home/doc
```

If something happens to the local Borg server or the USB drive holding all the backup repositories, I can also easily restore directly from Wasabi. If the machine has Rclone installed, using **[rclone mount][3]** I can mount the remote storage bucket as though it were a local filesystem:

```
#Mount the S3 store and run in the background
$ rclone mount wasabi:repo1 /mnt/repo1 &
#List archive contents
$ borg list /mnt/repo1
#Extract a file
$ borg extract /mnt/repo1::x250-2017-09-17 home/doc/somefile.jpg
```

### How it's working

Now that I've been using this backup approach for a few weeks, I can say I'm really happy with it. Setting everything up and getting it running was a lot more complicated than just installing CrashPlan of course, but that's the difference between rolling your own solution and using a service. I will have to watch closely to be sure backups continue to run and the data is properly synchronized to Wasabi.

But, overall, replacing CrashPlan with something offering comparable backup coverage at a really reasonable price turned out to be a little easier than I expected. If you see room for improvement please let me know.

 _This was originally published on _  [_Local Conspiracy_][19]  _ and is republished with permission._

--------------------------------------------------------------------------------

作者简介：

Christopher Aedo - Christopher Aedo has been working with and contributing to open source software since his college days. Most recently he can be found leading an amazing team of upstream developers at IBM who are also developer advocates. When he’s not at work or speaking at a conference, he’s probably using a RaspberryPi to brew and ferment a tasty homebrew in Portland OR.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/backing-your-machines-borg

作者：[ Christopher Aedo ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/docaedo
[1]:https://opensource.com/file/375066
[2]:https://opensource.com/article/17/10/backing-your-machines-borg?rate=Aa1IjkXuXy95tnvPGLWcPQJCKBih4Wo9hNPxhDs-mbQ
[3]:https://rclone.org/commands/rclone_mount/
[4]:https://opensource.com/user/145976/feed
[5]:https://www.crashplan.com/en-us/consumer/nextsteps/
[6]:https://www.arqbackup.com/
[7]:https://www.carbonite.com/
[8]:https://www.backblaze.com/
[9]:http://backuppc.sourceforge.net/BackupPCServerStatus.html
[10]:http://www.nongnu.org/rdiff-backup/
[11]:https://www.borgbackup.org/
[12]:https://rclone.org/
[13]:https://wasabi.com/
[14]:https://github.com/borgbackup/borg/
[15]:http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/
[16]:https://github.com/borgbackup/borgweb
[17]:https://borgbackup.readthedocs.io/en/stable/quickstart.html
[18]:https://rclone.org/install/
[19]:http://localconspiracy.com/2017/10/backup-everything.html
[20]:https://opensource.com/users/docaedo
[21]:https://opensource.com/users/docaedo
[22]:https://opensource.com/article/17/10/backing-your-machines-borg#comments
