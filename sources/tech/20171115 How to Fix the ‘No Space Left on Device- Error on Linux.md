translating by lujun9972
How to Fix the ‘No Space Left on Device’ Error on Linux
======

![](https://www.maketecheasier.com/assets/uploads/2017/10/no-space-feat.jpg)

So your Linux system is telling you that you have no space left on your hard drive, but you know there is actually a lot of free space left. Why? This is one of those few frustratingly vague errors on Linux systems, but there are a few usual culprits.

## Check du and df

Before you go any further, it's a good idea to check that there really _is_ space left on the disk. While the tools in your desktop environment are good, it 's much better to use the direct ones from the command line.

![Linux Filesystem du][1]

Begin with `du`. Point it to the base directory on the drive that's having the problem. This guide is assuming it's the partition with root.
```
sudo du -sh /
```

![Linux Filesystem df][2]

It'll take some time to go through everything. Now, try with `df`.
```
sudo df -h
```

Add root and the filesystems mounted under it. For example, if you have "/home" on a separate drive, add that in with the reading for root. The total should come out close to what you had with `du`. If not, that might point toward a deleted file being used by a process.

Of course, the main concern here is whether or not the results of these commands come in under the size of the drive. If it did, there's obviously something wrong.

 **Related** : [Use Agedu to Analyze Hard Disk Space Usage in Linux][3]
 
## Possible Causes

There are a couple of main causes here. If you saw a discrepancy between `du` and `df` you can jump down to the first option here. Otherwise, start at the second one.

### Deleted File Reserved by Process

Occasionally, a file will be deleted, but a process is still using it. Linux won't release the storage associated with the file while the process is still running. You just need to find the process and restart it.

![Check processes for deleted files][4]

Try to locate the process.
```
sudo lsof / | grep deleted
```

The problematic process should be listed, then just restart it.
```
sudo systemctl restart service_name
```

### Not Enough Inodes

![Linux check filesystem inodes][5]

There is a set of metadata on filesystems called "inodes." Inodes track information about files. A lot of filesystems have a fixed amount of inodes, so it's very possible to fill the max allocation of inodes without filling the filesystem itself. You can use `df` to check.
```
sudo df -i /
```

Compare the inodes used with the total inodes. If there's no more available, unfortunately, you can't get more. Delete some useless or out-of-date files to clear up inodes.

### Bad Blocks

The last common problem is bad filesystem blocks. Filesystems get corrupt and hard drives die. Your operating system will most likely see those blocks as usable unless they're otherwise marked. The best way to find and mark those blocks is by using `fsck` with the `-cc` flag. Remember that you can't use `fsck` from the same filesystem that you're testing. You'll probably need to use a live CD.
```
sudo fsck -vcck /dev/sda2
```

Obviously, replace the drive location with the drive that you want to check. Also, keep in mind that this will probably take a long time.

 **Related** : [Check and Repair Your Filesystem With fsck [Linux]][6]

Hopefully, one of these solutions solved your problem. This issue isn't exactly easy to diagnose in every instance. With any luck, though, you can get it cleared up and have your hard drive working again as normal.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/fix-linux-no-space-left-on-device-error/

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-du.jpg (Linux Filesystem du)
[2]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-df.jpg (Linux Filesystem df)
[3]:https://www.maketecheasier.com/agedu-analyze-hard-disk-space-usage-in-linux/ (Use Agedu to Analyze Hard Disk Space Usage in Linux)
[4]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-process.jpg (Check processes for deleted files)
[5]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-inode.jpg (Linux check filesystem inodes)
[6]:https://www.maketecheasier.com/check-repair-filesystem-fsck-linux/ (Check and Repair Your Filesystem With fsck [Linux])
