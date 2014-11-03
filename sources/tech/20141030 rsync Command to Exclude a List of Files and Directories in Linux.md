Translating by GOLinux!
rsync Command to Exclude a List of Files and Directories in Linux
================================================================================
**rsync** is a very useful and popular linux tool being used for backup and restoring files, but also for comparing and syncing them. We already shown you in the past [how to use rsync command in linux with examples][1] and today we will add a few more useful tricks you can use rsync at.

### Exclude a list of files and directories ###

Sometimes when we do large syncs we may wish to exclude a list of files and directories from syncing, in general files that can't by synced like device files and some system files, or files that would take up unnecessary disk space like temporary or cache files.

First let's make a file called "excluded" (you can name it whatever you wish) and write each folder or file we would like to exclude on a separate line like this. For our example if you wish to do a full backup of your root partition you should exclude devices directories that get created at boot time and directories that hold temporary files, your list may look like this:

![rsync excluded](http://blog.linoxide.com/wp-content/uploads/2014/10/rsync-excluded.jpg)

Then you can run the following command to backup your system:

    $ sudo rsync -aAXhv --exclude-from=excluded / /mnt/backup

![rsync exclude file](http://blog.linoxide.com/wp-content/uploads/2014/10/rsync-exclude-file.jpg)

### Exclude files from the command line ###

You can also exclude files directly from the command line, this is useful when you have a smaller number of files to exclude and you wish to include this in a script or crontab and don't want your script or cron to depend on another file to run successful.

For example if you wish to sync /var to a backup directory but you don't wish to include cache and tmp folder that usualy don't hold important content between restarts you can use the following command:

    $ sudo rsync -aAXhv --exclude={"/var/cache","/var/tmp"} /var /home/adrian/var

![rsync exclude](http://blog.linoxide.com/wp-content/uploads/2014/10/rsync-exclude.jpg)

This command will be easy to use in any script or cron and will not depend on another file.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/exclude-files-rsync-examples/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://linoxide.com/how-tos/rsync-copy/
