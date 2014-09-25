wangjiezhe translating

Unix: stat -- more than ls
================================================================================
> Tired of ls and want to see more interesting information on your files? Try stat!

![](http://www.itworld.com/sites/default/files/imagecache/large_thumb_150x113/stats.jpg)

The ls command is probably one of the first commands that anyone using Unix learns, but it only shows a small portion of the information that is available with the stat command.

The stat command pulls information from the file's inode. As you might be aware, there are actually three sets of dates and times that are stored for every file on your system. These include the date the file was last modified (i.e., the date and time that you see when you use the ls -l command), the time the file was last changed (which includes renaming the file), and the time that file was last accessed.

View a long listing for a file and you will see something like this:

    $ ls -l trythis
    -rwx------ 1 shs unixdweebs 109 Nov 11  2013 trythis

Use the stat command and you see all this:

    $ stat trythis
      File: `trythis'
      Size: 109      Blocks: 8   IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731691    Links: 1
    Access: (0700/-rwx------)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-09-09 19:27:58.000000000 -0400
    Modify: 2013-11-11 08:40:10.000000000 -0500
    Change: 2013-11-11 08:40:10.000000000 -0500

The file's change and modify dates/times are the same in this case, while the access time is fairly recent. We can also see that the file is using 8 blocks and we see the permissions in each of the two formats -- the octal (0700) format and the rwx format. The inode number, shown in the third line of the output, is 12731681. There are no additional hard links (Links: 1). And the file is a regular file.

Rename the file and you will see that the change time will be updated.

This, the ctime information, was originally intended to hold the creation date and time for the file, but the field was turned into the change time field somewhere a while back.

    $ mv trythis trythat
    $ stat trythat
      File: `trythat'
      Size: 109      Blocks: 8   IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731691    Links: 1
    Access: (0700/-rwx------)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-09-09 19:27:58.000000000 -0400
    Modify: 2013-11-11 08:40:10.000000000 -0500
    Change: 2014-09-21 12:46:22.000000000 -0400

Changing the file's permissions would also register in the ctime field.

You can also use wilcards with the stat command and list your files' stats in a group:

    $ stat myfile*
      File: `myfile'
      Size: 20              Blocks: 8          IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731803    Links: 1
    Access: (0640/-rw-r-----)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-08-23 03:00:36.000000000 -0400
    Modify: 2014-08-22 12:02:12.000000000 -0400
    Change: 2014-08-22 12:02:12.000000000 -0400
      File: `myfile2'
      Size: 20              Blocks: 8          IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731806    Links: 1
    Access: (0640/-rw-r-----)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-08-23 03:00:36.000000000 -0400
    Modify: 2014-08-22 12:03:30.000000000 -0400
    Change: 2014-08-22 12:03:30.000000000 -0400
      File: `myfile3'
      Size: 40              Blocks: 8          IO Block: 262144 regular file
    Device: 18h/24d Inode: 12730533    Links: 1
    Access: (0640/-rw-r-----)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-08-23 03:00:36.000000000 -0400
    Modify: 2014-08-22 12:03:59.000000000 -0400
    Change: 2014-08-22 12:03:59.000000000 -0400

We can get some of this information with other commands if we like.

Add the "u" option to a long listing and you'll see something like this. Notice this shows us the last access time while adding "c" shows us the change time (in this example, the time when we renamed the file).

    $ ls -lu trythat
    -rwx------ 1 shs unixdweebs 109 Sep  9 19:27 trythat
    $ ls -lc trythat
    -rwx------ 1 shs unixdweebs 109 Sep 21 12:46 trythat

The stat command can also work against directories.

In this case, we see that there are a number of links.

    $ stat bin
      File: `bin'
      Size: 12288    Blocks: 24  IO Block: 262144 directory
    Device: 18h/24d Inode: 15089714    Links: 9
    Access: (0700/drwx------)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-09-21 03:00:45.000000000 -0400
    Modify: 2014-09-15 17:54:41.000000000 -0400
    Change: 2014-09-15 17:54:41.000000000 -0400

Here, we're looking at a file system.

    $ stat -f /dev/cciss/c0d0p2
      File: "/dev/cciss/c0d0p2"
        ID: 0 Namelen: 255     Type: tmpfs
    Block size: 4096Fundamental block size: 4096
    Blocks: Total: 259366     Free: 259337     Available: 259337
    Inodes: Total: 223834     Free: 223531

Notice the Namelen (name length) field. Good luck if you had your heart set on file names with greater than 255 characters!

The stat command can also display some of its information a field at a time for those times when that's all you want to see, In the example below, we just want to see the file type and then the number of hard links.

    $ stat --format=%F trythat
    regular file
    $ stat --format=%h trythat
    1

In the examples below, we look at permissions -- in each of the two available formats -- and then the file's SELinux security context.

--------------------------------------------------------------------------------

via: http://www.itworld.com/operating-systems/437351/unix-stat-more-ls

作者：[Sandra Henry-Stocker][a]
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.itworld.com/sandra-henry-stocker
