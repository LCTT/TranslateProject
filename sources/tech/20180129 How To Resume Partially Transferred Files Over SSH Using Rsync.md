How To Resume Partially Transferred Files Over SSH Using Rsync
======

![](https://www.ostechnix.com/wp-content/uploads/2016/02/Resume-Partially-Transferred-Files-Over-SSH-Using-Rsync.png)

There are chances that the large files which are being copied over SSH using SCP command might be interrupted or cancelled or broken due to various reasons such as power failure or network failure or user intervention. The other day I was copying the Ubuntu 16.04 ISO file to my remote system. Unfortunately, the power is gone, and the network connection is dropped immediately. The result? The copy process is terminated! This is just a simple example. The Ubuntu ISO is not so big, and I could restart the copy process as soon as the power is restored. But in production environment, you might not want to do it while you're transferring large files.

Also, you can't always resume the aborted process using **scp** command. Because, If you do, It will simply overwrite the existing files. What would you do in such situations? No worries! This is where **Rsync** utility comes in handy! Rsync can help you to resume the interrupted copy or download process where you left it off. For those wondering, Rsync is a fast, versatile file copying utility that can be used to copy and transfer files or folders to and from remote and local systems.

It offers a large number of options that control every aspect of its behavior and permit very flexible specification of the set of files to be copied. It is famous for its delta-transfer algorithm, which reduces the amount of data sent over the network by sending only the differences between the source files and the existing files in the destination. Rsync is widely used for backups and mirroring and as an improved copy command for everyday use.

Just like SCP, rsync will also copy files over SSH. In case you wanted to download or transfer a big files and folders over SSH, I recommend you to use rsync utility. Be mindful that the **rsync utility should be installed on both sides** (remote and local systems) in order to resume partially transferred files.

### Resume Partially Transferred Files Using Rsync

Well, let me show you an example. I am going to copy Ubuntu 16.04 ISO from my local system to remote system with command:

```
$ scp Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

Here,

  * **sk** is my remote system 's username
  * **192.168.43.2** is the IP address of the remote machine.



Now, I terminated it by pressing **CTRL+c**.

**Sample output:**

```
sk@192.168.43.2's password: 
ubuntu-16.04-desktop-amd64.iso 26% 372MB 26.2MB/s 00:39 ETA^c
```

[![][1]][2]

As you see in the above output, I terminated the copy process when it reached 26%.

If I re-run the above command, it will simply overwrite the existing file. In other words, the copy process will not resume where I left it off.

In order to resume the copy process, we can use **rsync** command as shown below.

```
$ rsync -P -rsh=ssh Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

**Sample output:**
```
sk@192.168.1.103's password:
sending incremental file list
ubuntu-16.04-desktop-amd64.iso
                   380.56M 26% 41.05MB/s 0:00:25
```

[![][1]][4]

See? Now, the copying process is resumed where we left it off earlier. You also can use "-partial" instead of parameter "-P" like below.
```
$ rsync --partial -rsh=ssh Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

Here, the parameter "-partial" or "-P" tells the rsync command to keep the partial downloaded file and resumes the process.

Alternatively, we can use the following commands as well to resume partially transferred files over SSH.

```
$ rsync -avP Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

Or,

```
rsync -av --partial Soft_Backup/OS\ Images/Linux/ubuntu-16.04-desktop-amd64.iso sk@192.168.43.2:/home/sk/
```

That's it. You know now how to resume the cancelled, interrupted, and partially downloaded files using rsync command. As you can see, it is not so difficult either. If rsync is installed on both systems, we can easily resume the copy process as described above.

If you find this tutorial helpful, please share it on your social, professional networks and support OSTechNix. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-resume-partially-downloaded-or-transferred-files-using-rsync/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2016/02/scp.png ()
[3]:/cdn-cgi/l/email-protection
[4]:http://www.ostechnix.com/wp-content/uploads/2016/02/rsync.png ()
