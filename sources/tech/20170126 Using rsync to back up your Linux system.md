translating by trnhoe
Using rsync to back up your Linux system
============================================================

### Find out how to use rsync in a backup scenario.

 ![Using rsync to back up your Linux system](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/hard_drives.png?itok=yZWyaSO6 "Using rsync to back up your Linux system") 
Image credits : [WIlliam][2][ Warby][3]. Modified by [Jason Baker][4]. Creative Commons [BY-SA 2.0][5].

Backups are an incredibly important aspect of a system administrator’s job. Without good backups and a well-planned backup policy and process, it is a near certainty that sooner or later some critical data will be irretrievably lost.

All companies, regardless of how large or small, run on their data. Consider the financial and business cost of losing all of the data you need to run your business. There is not a business today ranging from the smallest sole proprietorship to the largest global corporation that could survive the loss of all or even a large fraction of its data. Your place of business can be rebuilt using insurance, but your data can never be rebuilt.

By loss, here, I don't mean stolen data; that is an entirely different type of disaster. What I mean here is the complete destruction of the data.

Even if you are an individual and not running a large corporation, backing up your data is very important. I have two decades of personal financial data as well as that for my now closed businesses, including a large number of electronic receipts. I also have many documents, presentations, and spreadsheets of various types that I have created over the years. I really don't want to lose all of that.

So backups are imperative to ensure the long-term safety of my data.

### Backup options

There are many options for performing backups. Most Linux distributions are provided with one or more open source programs specially designed to perform backups. There are many commercial options available as well. But none of those directly met my needs so I decided to use basic Linux tools to do the job.

In my article for the Open Source Yearbook last year, [Best Couple of 2015: tar and ssh][6], I showed that fancy and expensive backup programs are not really necessary to design and implement a viable backup program.

Since last year, I have been experimenting with another backup option, the [**rsync**][7] command which has some very interesting features that I have been able to use to good advantage. My primary objectives were to create backups from which users could locate and restore files without having to untar a backup tarball, and to reduce the amount of time taken to create the backups.

This article is intended only to describe my own use of rsync in a backup scenario. It is not a look at all of the capabilities of rsync or the many ways in which it can be used.

### The rsync command

The rsync command was written by Andrew Tridgell and Paul Mackerras and first released in 1996\. The primary intention for rsync is to remotely synchronize the files on one computer with those on another. Did you notice what they did to create the name there? rsync is open source software and is provided with almost all major distributions.

The rsync command can be used to synchronize two directories or directory trees whether they are on the same computer or on different computers but it can do so much more than that. rsync creates or updates the target directory to be identical to the source directory. The target directory is freely accessible by all the usual Linux tools because it is not stored in a tarball or zip file or any other archival file type; it is just a regular directory with regular files that can be navigated by regular users using basic Linux tools. This meets one of my primary objectives.

One of the most important features of rsync is the method it uses to synchronize preexisting files that have changed in the source directory. Rather than copying the entire file from the source, it uses checksums to compare blocks of the source and target files. If all of the blocks in the two files are the same, no data is transferred. If the data differs, only the block that has changed on the source is transferred to the target. This saves an immense amount of time and network bandwidth for remote sync. For example, when I first used my rsync Bash script to back up all of my hosts to a large external USB hard drive, it took about three hours. That is because all of the data had to be transferred. Subsequent syncs took 3-8 minutes of real time, depending upon how many files had been changed or created since the previous sync. I used the time command to determine this so it is empirical data. Last night, for example, it took just over three minutes to complete a sync of approximately 750GB of data from six remote systems and the local workstation. Of course, only a few hundred megabytes of data were actually altered during the day and needed to be synchronized.

The following simple rsync command can be used to synchronize the contents of two directories and any of their subdirectories. That is, the contents of the target directory are synchronized with the contents of the source directory so that at the end of the sync, the target directory is identical to the source directory.

`rsync ``-aH sourcedir targetdir`

The **-a** option is for archive mode which preserves permissions, ownerships and symbolic (soft) links. The -H is used to preserve hard links. Note that either the source or target directories can be on a remote host.

Now let's assume that yesterday we used rsync to synchronized two directories. Today we want to resync them, but we have deleted some files from the source directory. The normal way in which rsync would do this is to simply copy all the new or changed files to the target location and leave the deleted files in place on the target. This may be the behavior you want, but if you would prefer that files deleted from the source also be deleted from the target, you can add the **--delete** option to make that happen.

Another interesting option, and my personal favorite because it increases the power and flexibility of rsync immensely, is the **--link-dest** option. The **--link-dest** option allows a series of daily backups that take up very little additional space for each day and also take very little time to create.

Specify the previous day's target directory with this option and a new directory for today. rsync then creates today's new directory and a hard link for each file in yesterday's directory is created in today's directory. So we now have a bunch of hard links to yesterday's files in today's directory. No new files have been created or duplicated. Just a bunch of hard links have been created. Wikipedia has a very good description of [hard links][8]. After creating the target directory for today with this set of hard links to yesterday's target directory, rsync performs its sync as usual, but when a change is detected in a file, the target hard link is replaced by a copy of the file from yesterday and the changes to the file are then copied from the source to the target.

So now our command looks like the following.

`rsync ``-aH --delete --link-dest=yesterdaystargetdir sourcedir todaystargetdir`

There are also times when it is desirable to exclude certain directories or files from being synchronized. For this, there is the **--exclude** option. Use this option and the pattern for the files or directories you want to exclude. You might want to exclude browser cache files so your new command will look like this.

`rsync -aH --delete --exclude Cache --link-dest=yesterdaystargetdir sourcedir todaystargetdir`

Note that each file pattern you want to exclude must have a separate exclude option.

rsync can sync files with remote hosts as either the source or the target. For the next example, let's assume that the source directory is on a remote computer with the hostname remote1 and the target directory is on the local host. Even though SSH is the default communications protocol used when transferring data to or from a remote host, I always add the ssh option. The command now looks like this.

`rsync -aH -e ssh --delete --exclude Cache --link-dest=yesterdaystargetdir remote1:sourcedir todaystargetdir`

This is the final form of my rsync backup command.

rsync has a very large number of options that you can use to customize the synchronization process. For the most part, the relatively simple commands that I have described here are perfect for making backups for my personal needs. Be sure to read the extensive man page for rsync to learn about more of its capabilities as well as the options discussed here.

### Performing backups

I automated my backups because – “automate everything.” I wrote a BASH script that handles the details of creating a series of daily backups using rsync. This includes ensuring that the backup medium is mounted, generating the names for yesterday and today's backup directories, creating appropriate directory structures on the backup medium if they are not already there, performing the actual backups and unmounting the medium.

I run the script daily, early every morning, as a cron job to ensure that I never forget to perform my backups.

My script, rsbu, and its configuration file, rsbu.conf, are available at [https://github.com/opensourceway/rsync-backup-script][9]

### Recovery testing

No backup regimen would be complete without testing. You should regularly test recovery of random files or entire directory structures to ensure not only that the backups are working, but that the data in the backups can be recovered for use after a disaster. I have seen too many instances where a backup could not be restored for one reason or another and valuable data was lost because the lack of testing prevented discovery of the problem.

Just select a file or directory to test and restore it to a test location such as /tmp so that you won't overwrite a file that may have been updated since the backup was performed. Verify that the files' contents are as you expect them to be. Restoring files from a backup made using the rsync commands above simply a matter of finding the file you want to restore from the backup and then copying it to the location you want to restore it to.

I have had a few circumstances where I have had to restore individual files and, occasionally, a complete directory structure. Most of the time this has been self-inflicted when I accidentally deleted a file or directory. At least a few times it has been due to a crashed hard drive. So those backups do come in handy.

### The last step

But just creating the backups will not save your business. You need to make regular backups and keep the most recent copies at a remote location, that is not in the same building or even within a few miles of your business location, if at all possible. This helps to ensure that a large-scale disaster does not destroy all of your backups.

A reasonable option for most small businesses is to make daily backups on removable media and take the latest copy home at night. The next morning, take an older backup back to the office. You should have several rotating copies of your backups. Even better would be to take the latest backup to the bank and place it in your safe deposit box, then return with the backup from the day before.

--------------------------------------------------------------------------------

作者简介：

David Both - David Both is a Linux and Open Source advocate who resides in Raleigh, North Carolina. He has been in the IT industry for over forty years and taught OS/2 for IBM where he worked for over 20 years. While at IBM, he wrote the first training course for the original IBM PC in 1981. He has taught RHCE classes for Red Hat and has worked at MCI Worldcom, Cisco, and the State of North Carolina. He has been working with Linux and Open Source Software for almost 20 years. 

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/rsync-backup-linux

作者：[David Both][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/article/17/1/rsync-backup-linux?rate=xmBjzZgqTu6p-Dw2gXy5cq43KHcSNs4-nisv_jnUgbw
[2]:https://www.flickr.com/photos/wwarby/11644168395
[3]:https://www.flickr.com/photos/wwarby/11644168395
[4]:https://opensource.com/users/jason-baker
[5]:https://creativecommons.org/licenses/by/2.0/
[6]:https://opensource.com/business/15/12/best-couple-2015-tar-and-ssh
[7]:https://en.wikipedia.org/wiki/Rsync
[8]:https://en.wikipedia.org/wiki/Hard_link
[9]:https://github.com/opensourceway/rsync-backup-script
[10]:https://opensource.com/user/14106/feed
[11]:https://opensource.com/article/17/1/rsync-backup-linux#comments
[12]:https://opensource.com/users/dboth
