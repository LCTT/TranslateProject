translated by cyleft

Most Useful Linux Commands You Can Run in Windows 10
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wsl-commands.png?itok=91oEXdO8)

In the previous articles of this series, we talked about [getting started with WSL on Windows 10.][1] In the last article of the series, we will talk about some of the widely used Linux commands on Windows 10.

Before we dive further into the topic, let’s make it clear who this is for. This article is meant for greenhorn developers who use Windows 10 machines but want to learn about Linux as it’s the dominant platform in the cloud, whether it be Azure, AWS, or private cloud. In a nutshell, it’s intended for Windows 10 users who are new to Linux.

Which commands you need will depend on your own workload. Your mileage may vary from mine. The goal of the article is to get you comfortable with Linux in Windows 10. Also bear in mind that WSL doesn’t provide access to hardware components like sound cards or GPU. Officially. But Linux users never take a no for an answer. Many users have managed to not only gain access to sound cards and GPU, they also managed to run desktop Linux apps on Windows. But that’s not the scope of this article. We may talk about it at some point, but not today.

Here are a few tasks to get started.

### How to keep your Linux system up to date

Since you are running Linux inside of Windows, you are stripped of all the security that Linux systems offer. In addition, if you don’t keep your Linux systems patched, you will expose your Windows machines to those threats. Always keep your Linux machines up to date.

WSL officially supports openSUSE, SUSE Linux Enterprise and Ubuntu. You can install other distributions as well, but I can get all of my work done with either of these two as all I need is access to some basic Linux utilities.

**Update openSUSE Leap:**
```
sudo zypper up

```

If you want a system upgrade, you can do that after running the above command:
```
sudo zypper dup

```

**Update Ubuntu machine:**
```
sudo apt-get update

sudo apt-get dist-upgrade

```

You are safe and secure. Since updates on Linux systems are incremental, I run system updates on a daily basis. It’s mostly a few KB or a few MB of updates without any downtime, unlike Windows 10 updates where you need to reboot your system.

### Managing files and folders

Once your system is updated, we can look at some mundane, or not so mundane tasks.

The second most important task is to manage your local and remote files using Linux. I must admit that as much as I prefer GUI apps, there are certain tasks, where terminal offers more value and reliability. Try moving 1TB of files using the Explorer app. Good luck. I always use the rsync command to transfer the bulk of files. The good news is that with rsync, if you do stop it in the middle, you can resume from where you left off.

Although you can use cp or mv commands to copy or move files, I prefer rsync as it offers more flexibility over the others and learning it will also help you in transferring files between remote machines. There are three basic tasks that I mostly perform.

**Copy entire directory using rsync:**
```
rsync -avzP /source-directory /destination directory

```

**Move files using rsync:**
```
rsync --remove-source-files -avzP /source-directory /destination-directory

```

This command will delete files from the source directory after successful copying to the destination directory.

**Sync two directories:**

I keep a copy of all of my files on more than one location. However, I continue to add and delete files from the primary location. It could become a challenge to keep all other locations synced without using some application dedicated to file sync, rsync simplifies the process. This is the command that you need to keep two directories synced. Keep it mind that it’s a one way sync -- from source to destination.
```
rsync --delete -avzP /source-directory /destination-directory

```

The above commands deletes the file in the destination folder if they are not found in the source folder. In other way it creates a mirror copy of the source directory.

### Automate file backup

Yes, keeping up with back up is a mundane task. In order to keep my drives fully synced I add a cron job that runs the rsync command at night to keep all directories synced. I do, however, keep one external drive that is synced manually on a weekly basis. I don’t use the --delete flag as it may delete some files that I might have wanted. I use that flag manually.

**To create a cron job, open crontab:**
```
crontab -e

```

I run this at night when both systems are idle as moving huge amount of files can slow your system down. The command runs at 1 am every morning. You can change it appropriately:
```
# 0 1 * * * rsync -avzP /source-directory /destination-directory

```

This is the structure for a cron job using crontab:
```
# m h dom mon dow command

```

Here m = minute, h = hour, dom= day of the month, mon= month; dow= day of the week.

We are running this command at 1 am every day. You could choose to run in a certain day of the week or day of the month (so it will run on the 5th of every month, for example) and so on. You can read more about crontab [here][2].

### Managing your remote servers

One of the reasons you are running WSL on your system is that you manage Linux systems on cloud and WSL provides you with native Linux tools. The first thing you need is to remotely log into your Linux server using the ssh command.

Let’s say my server is 192.168.0.112; the dedicated port is 2018 (never use the default 22 port); the Linux user of that server is swapnil and password is i-wont-tell-you.
```
ssh -p2018 swapnil@192.168.0.112

```

It will ask for the password and, eureka, you are logged into your Linux server. Now you can perform all the tasks that you want to perform as you are literally inside that Linux machine. No need to use puTTY.

You can easily transfer files between your local machine and remote machine using the rsync command. Instead of source or destination directory, depending on whether you are uploading the files to the server or downloading them to local machine, you can use [username@IP][3]-address-of-server:/path-of-directory.

So if I want to copy some text files to the home directory of my server, here is the command:
```
rsync -avzP /source-directory-on-local-machine ‘ssh -p2018’ swapnil@192.168.0.112:/home/swapnil/Documents/

```

It will copy all files to the Documents directory of my remote server.

### Conclusion

The idea of this tutorial was to demonstrate that WSL allows you to perform a wide range of Linux-y tasks on your Windows 10 systems. In most cases, it increases productivity and performance. Now, the whole world of Linux is open to you for exploration on your Windows 10 system. Go ahead and explore it. If you have any questions, or if you would like me to cover more areas of WSL, please share your thoughts in the comments below.

Learn more about the [Administering Linux on Azure (LFS205)][4] course and sign up [here][5].

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/3/most-useful-linux-commands-you-can-run-windows-10

作者：[SAPNIL BHARTIYA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/learn/2018/2/how-get-started-using-wsl-windows-10
[2]:http://www.adminschoice.com/crontab-quick-reference
[3]:mailto:username@IP
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/administering-linux-on-azure
[5]:http://bit.ly/2FpFtPg
