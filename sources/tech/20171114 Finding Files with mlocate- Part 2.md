Finding Files with mlocate: Part 2
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/question-mark-locate_0.jpg?itok=JfoE_G5f)

[In the previous article][1], we discussed some ways to find a specific file out of the thousands that may be present on your filesystems and introduced the locate tool for the job. Here we explain how the important updatedb tool can help.

### Well Situated

Incidentally, you might get a little perplexed if trying to look up the manuals for updatedb and the locate command. Even though it's actually the mlocate command and the binary is /usr/bin/updatedb on my filesystem, you probably want to use varying versions of the following man commands to find what you're looking for:
```
# man locate


# man updatedb


# man updatedb.conf

```

Let's look at the important updatedb command in a little more detail now. It's worth mentioning that, after installing the locate utility, you will need to initialize your file-list database before doing anything else. You have to do this as the "root" user in order to reach all the relevant areas of your filesystems or the locate command will complain. Initialize or update your database file, whenever you like, with this command:
```
# updatedb
```

Obviously, the first time this command is run it may take a little while to complete, but when I've installed the locate command afresh I've almost always been pleasantly surprised at how quickly it finishes. After a hop, a skip, and a jump, you can immediately query your file database. However, let's wait a moment before doing that.

We're dutifully informed by its manual that the database created as a result of running updatedb resides at the following location: /var/lib/mlocate/mlocate.db.

If you want to change how updatedb is run, then you need to affect it with your config file -- a reminder that it should live here: /etc/updatedb.conf. Listing 1 shows the contents of it on my system:
```
PRUNE_BIND_MOUNTS = "yes"

PRUNEFS = "9p afs anon_inodefs auto autofs bdev binfmt_misc cgroup cifs coda configfs
cpuset debugfs devpts ecryptfs exofs fuse fusectl gfs gfs2 hugetlbfs inotifyfs iso9660
jffs2 lustre mqueue ncpfs nfs nfs4 nfsd pipefs proc ramfs rootfs rpc_pipefs securityfs
selinuxfs sfs sockfs sysfs tmpfs ubifs udf usbfs"

PRUNENAMES = ".git .hg .svn"

PRUNEPATHS = "/afs /media /net /sfs /tmp /udev /var/cache/ccache /var/spool/cups
/var/spool/squid /var/tmp"
```

Listing 1: The innards of the file /etc/updatedb.conf which affects how our database is created.

The first thing that my eye is drawn to is the PRUNENAMES section. As you can see by stringing together a list of directory names, delimited with spaces, you can suitably ignore them. One caveat is that only directory names can be skipped, and you can't use wildcards. As we can see, all of the otherwise-hidden files in a Git repository (the .git directory might be an example of putting this option to good use.

If you need to be more specific then, again using spaces to separate your entries, you can instruct the locate command to ignore certain paths. Imagine for example that you're generating a whole host of temporary files overnight which are only valid for one day. You're aware that this is a special directory of sorts which employs a familiar naming convention for its thousands of files. It would take the locate command a relatively long time to process the subtle changes every night adding unnecessary stress to your system. The solution is of course to simply add it to your faithful "ignore" list.

### Well Appointed

As seen in Listing 2, the file /etc/mtab offers not just a list of the more familiar filesystems such as /dev/sda1 but also a number of others that you may not immediately remember.
```
/dev/sda1 /boot ext4 rw,noexec,nosuid,nodev 0 0

proc /proc proc rw 0 0

sysfs /sys sysfs rw 0 0

devpts /dev/pts devpts rw,gid=5,mode=620 0 0

/tmp /var/tmp none rw,noexec,nosuid,nodev,bind 0 0

none /proc/sys/fs/binfmt_misc binfmt_misc rw 0 0
```

Listing 2: A mashed up example of the innards of the file /etc/mtab.

Some of the filesystems shown in Listing 2 contain ephemeral content and indeed content that belongs to pseudo-filesystems, so it is clearly important to ignore their files -- if for no other reason than because of the stress added to your system during each overnight update.

In Listing 1, the PRUNEFS option takes care of this and ditches those not suitable (for most cases). There are a few different filesystems to consider as you can see:
```
PRUNEFS = "9p afs anon_inodefs auto autofs bdev binfmt_misc cgroup cifs coda configfs
cpuset debugfs devpts ecryptfs exofs fuse fusectl gfs gfs2 hugetlbfs inotifyfs iso9660 jffs2
lustre mqueue ncpfs nfs nfs4 nfsd pipefs proc ramfs rootfs rpc_pipefs securityfs selinuxfs
sfs sockfs sysfs tmpfs ubifs udf usbfs"
```

The updatedb.conf manual succinctly informs us of the following information in relation to the PRUNE_BIND_MOUNTS option:

"If PRUNE_BIND_MOUNTS is 1 or yes, bind mounts are not scanned by updatedb(8).  All file systems mounted in the subtree of a bind mount are skipped as well, even if they are not bind mounts.  As an exception, bind mounts of a directory on itself are not skipped."

Assuming that makes sense, before moving onto some locate command examples, you should note one thing. Excluding some versions of the updatedb command, it can also be told to ignore certain "non-directory files." However, this does not always apply, so don't blindly copy and paste config between versions if you use such an option.

### In Need of Modernization

As mentioned earlier, there are times when finding a specific file needs to be so quick that it's at your fingertips before you've consciously recalled the command. This is the irrefutable beauty of the locate command.

And, if you've ever sat in front of a horrendously slow Windows machine watching the hard disk light flash manically as if it were suffering a conniption due to the indexing service running, then I can assure you that the performance that you'll receive from the updatedb command will be a welcome relief.

You should bear in mind, that unlike with the find command, there's no need to remember the base paths of where your file might be residing. By that I mean that all of your (hopefully) relevant filesystems are immediately accessed with one simple command and that remembering paths is almost a thing of the past.

In its most simple form, the locate command looks like this:
```
# locate chrisbinnie.pdf
```

There's also no need to escape hidden files that start with a dot or indeed expand a search with an asterisk:

### # locate .bash

Listing 3 shows us what has been returned, in an instant, from the many partitions the clever locate command has scanned previously.
```
/etc/bash_completion.d/yum.bash

/etc/skel/.bash_logout

/etc/skel/.bash_profile

/etc/skel/.bashrc

/home/chrisbinnie/.bash_history

/home/chrisbinnie/.bash_logout

/home/chrisbinnie/.bash_profile

/home/chrisbinnie/.bashrc

/usr/share/doc/git-1.5.1/contrib/completion/git-completion.bash

/usr/share/doc/util-linux-ng-2.16.1/getopt-parse.bash

/usr/share/doc/util-linux-ng-2.16.1/getopt-test.bash
```

Listing 3: The search results from running the command: "locate .bash"

I'm suspicious that the following usage has altered slightly, from back in the day when the slocate command was more popular or possibly the original locate command, but you can receive different results by adding an asterisk to that query as so:
```
# locate .bash*
```

In Listing 4, you can see the difference from Listing 3. Thankfully, the results make more sense now that we can see them together. In this case, the addition of the asterisk is asking the locate command to return files beginning with .bash as opposed to all files containing that string of characters.
```
/etc/skel/.bash_logout

/etc/skel/.bash_profile

/etc/skel/.bashrc

/home/d609288/.bash_history

/home/d609288/.bash_logout

/home/d609288/.bash_profile

/home/d609288/.bashrc
```

Listing 4: The search results from running the command: "locate .bash*" with the addition of an asterisk.

Stay tuned for next time when we learn more about the amazing simplicity of using the locate command on a day-to-day basis.

Learn more about essential sysadmin skills: Download the [Future Proof Your SysAdmin Career][2] ebook now.

Chris Binnie's latest book, Linux Server Security: Hack and Defend, shows how hackers launch sophisticated attacks to compromise servers, steal data, and crack complex passwords, so you can learn how to defend against these attacks. In the book, he also talks you through making your servers invisible, performing penetration testing, and mitigating unwelcome attacks. You can find out more about DevSecOps and Linux security via his website ([http://www.devsecops.cc][3]).

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/finding-files-mlocate-part-2

作者：[Chris Binnie][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/chrisbinnie
[1]:https://www.linux.com/blog/learn/intro-to-linux/2017/11/finding-files-mlocate
[2]:https://go.pardot.com/l/6342/2017-07-17/3vwshv?utm_source=linco&utm_medium=blog&utm_campaign=sysadmin&utm_content=promo
[3]:http://www.devsecops.cc/
