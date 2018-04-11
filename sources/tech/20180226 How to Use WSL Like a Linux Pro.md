translating---geekpi

How to Use WSL Like a Linux Pro
============================================================

![WSL](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wsl-pro.png?itok=e65wEEAw "WSL")
Learn how to perform tasks like mounting USB drives and manipulating files in this WSL tutorial. (Image courtesy: Microsoft)[Used with permission][1][Microsoft][2]

In the [previous tutorial][4], we learned about setting up WSL on your Windows 10 system. You can perform a lot of Linux command like tasks in Windows 10 using WSL. Many sysadmin tasks are done inside a terminal, whether it’s a Linux based system or macOS. Windows 10, however, lacks such capabilities. You want to run a cron job? No. You want to ssh into your server and then rsync files? No way. How about managing your local files with powerful command line utilities instead of using slow and unreliable GUI utilities?

In this tutorial, you’ll see how to perform additional tasks beyond managing your servers using WSL - things like mounting USB drives and manipulating files. You need to be running a fully updated Windows 10 and the Linux distro of your choice. I covered these steps in the [previous article][5], so begin there if you need to catch up. Let’s get started.

### Keep your Linux system updated

The fact is there is no Linux kernel running under the hood when you run Ubuntu or openSUSE through WSL. Yet, you must keep your distros fully updated to keep your system protected from any new known vulnerabilities. Since only two free community distributions are officially available in Windows Store, out tutorial will cover only those two: openSUSE and Ubuntu.

Update your Ubuntu system:

```
# sudo apt-get update

# sudo apt-get dist-upgrade
```

To run updates for openSUSE:

```
# zypper up
```

You can also upgrade openSUSE to the latest version with the  _dup_  command. But before running the system upgrade, please run updates using the previous command.

```
# zypper dup
```

**Note: **openSUSE defaults to the root user. If you want to perform any non-administrative tasks, please switch to a non-privileged user. You can learn how to create a user on openSUSE in this [article][6].

### Manage local files

If you want to use great Linux command line utilities to manage your local files, you can easily do that with WSL. Unfortunately, WSL doesn’t yet support things like _lsblk_ or  _mnt_  to mount local drives. You can, however,  _cd _ to the C drive and manage files:

/mnt/c/Users/swapnil/Music

I am now in the Music directory of the C drive.

To mount other drives, partitions, and external USB drives, you will need to create a mount point and then mount that drive.

Open File Explorer and check the mount point of that drive. Let’s assume it’s mounted in Windows as S:\

In the Ubuntu/openSUSE terminal, create a mount point for the drive.

```
sudo mkdir /mnt/s
```

Now mount the drive:

```
mount -f drvfs S: /mnt/s
```

Once mounted, you can now access that drive from your distro. Just bear in mind that distro running with WSL will see what Windows can see. So you can’t mount ext4 drives that can’t be mounted on Windows natively.

You can now use all those magical Linux commands here. Want to copy or move files from one folder to another? Just run the  _cp_  or  _mv_ command.

```
cp /source-folder/source-file.txt /destination-folder/

cp /music/classical/Beethoven/symphony-2.mp3 /plex-media/music/classical/
```

If you want to move folders or large files, I would recommend  _rsync_ instead of the  _cp_  command:

```
rsync -avzP /music/classical/Beethoven/symphonies/ /plex-media/music/classical/
```

Yay!

Want to create new directories in Windows drives, just use the awesome  _mkdir_ command.

Want to set up a cron job to automate a task at certain time? Go ahead and create a cron job with  _crontab -e_ . Easy peasy.

You can also mount network/remote folders in Linux so you can manage them with better tools. All of my drives are plugged into either a Raspberry Pi powered server or a live server, so I simply ssh into that machine and manage the drive. Transferring files between the local machine and remote system can be done using, once again, the  _rsync_  command.

WSL is now out of beta, and it will continue to get more new features. Two features that I am excited about are the lsblk command and the dd command that allow me to natively manage my drives and create bootable drives of Linux from within Windows. If you are new to the Linux command line, this [previous tutorial ][7]will help you get started with some of the most basic commands.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/how-use-wsl-linux-pro

作者：[SWAPNIL BHARTIYA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://blogs.msdn.microsoft.com/commandline/learn-about-windows-console-and-windows-subsystem-for-linux-wsl/
[3]:https://www.linux.com/files/images/wsl-propng
[4]:https://www.linux.com/blog/learn/2018/2/how-get-started-using-wsl-windows-10
[5]:https://www.linux.com/blog/learn/2018/2/how-get-started-using-wsl-windows-10
[6]:https://www.linux.com/blog/learn/2018/2/how-get-started-using-wsl-windows-10
[7]:https://www.linux.com/learn/how-use-linux-command-line-basics-cli
