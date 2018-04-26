How to share files between Linux and Windows
======

![](https://images.idgesg.net/images/article/2018/04/cats-eating-100755724-large.jpg)
Many people today work on mixed networks, with both Linux and Windows systems playing important roles. Sharing files between the two can be critical at times and is surprisingly easy with the right tools. With fairly little effort, you can copy files from Windows to Linux or Linux to Windows. In this post, we'll look at what is needed to configure your Linux and Windows system to allow you to easily move files from one OS to the other.

### Copying files between Linux and Windows

The first step toward moving files between Windows and Linux is to download and install a tool such as PuTTY's pscp. You can get PuTTY from [putty.org][1] and set it up on your Windows system easily. PuTTY comes with a terminal emulator (putty) as well as tools like **pscp** for securely copying files between Linux and Windows systems. When you go to the PuTTY site, you can elect to install all of the tools or pick just the ones you want to use by choosing either the installer or the individual .exe files.

You will also need to have ssh-server set up and running on your Linux system. This allows it to support the client (Windows side) connection requests. If you don't already have an ssh server set up, the following steps should work on Debian systems (Ubuntu, etc.).
```
sudo apt update
sudo apt install ssh-server
sudo service ssh start

```

For Red Hat and related Linux systems, use similar commands:
```
sudo yum install openssh-server
sudo systemctl start sshd

```

Note that if you are running a firewall such as ufw, you may have to open port 22 to allow the connections.

Using the **pscp** command, you can then move files from Windows to Linux or vice versa. The syntax is quite straightforward with its  "copy from to" commands.

#### Windows to Linux

In the command shown below, we are copying a file from a user's account on a Windows system to the /tmp directory on the Linux system.
```
C:\Program Files\PuTTY>pscp \Users\shs\copy_me.txt shs@192.168.0.18:/tmp
shs@192.168.0.18's password:
copy_me.txt | 0 kB | 0.1 kB/s | ETA: 00:00:00 | 100%

```

#### Linux to Windows

Moving the files from Linux to Windows is just as easy. Just reverse the arguments.
```
C:\Program Files\PuTTY>pscp shs@192.168.0.18:/tmp/copy_me.txt \Users\shs
shs@192.168.0.18's password:
copy_me.txt | 0 kB | 0.1 kB/s | ETA: 00:00:00 | 100%

```

The process can be made a little smoother and easier if 1) pscp is in your Windows search path and 2) your Linux system is in your Windows hosts file.

#### Windows search path

If you install the PuTTY tools with the PuTTY installer, you will probably find that **C:\Program files\PuTTY** is on your Windows search path. You can check to see if this is the case by typing **echo %path%** in a Windows command prompt (type  "cmd" in the search bar to open the command prompt). If it is, you don't need to be concerned with where you are in the file system relative to the pscp executable. Moving into the folder containing the files you want to move will likely prove easier.
```
C:\Users\shs>pscp copy_me.txt shs@192.168.0.18:/tmp
shs@192.168.0.18's password:
copy_me.txt | 0 kB | 0.1 kB/s | ETA: 00:00:00 | 100%

```

#### Updating your Windows hosts file

Here's the other little fix. With administrator rights, you can add your Linux system to the Windows host file (C:\Windows\System32\drivers\etc\hosts) and then use the host name in place of its IP address. Keep in mind that this will not work indefinitely if the IP address on your Linux system is dynamically assigned.
```
C:\Users\shs>pscp copy_me.txt shs@stinkbug:/tmp
shs@192.168.0.18's password:
hosts | 0 kB | 0.8 kB/s | ETA: 00:00:00 | 100%

```

Note that Windows host files are formatted like the /etc/hosts file on Linux systems — IP address, white space and host name. Comments are prefaced with pound signs.
```
# Linux systems
192.168.0.18        stinkbug

```

#### Those pesky line endings

Keep in mind that lines in text files on Windows end with both a carriage return and a linefeed. The pscp tool will not remove the carriage returns to make the files look like Linux text files. Instead, it simply copies the files intact. You might consider installing the **tofrodos** package to enable you to use the **fromdos** and **todos** commands on your Linux system to adjust the files you are moving between platforms.

### Sharing folders between Windows and Linux

Sharing folders is an entirely different operation. You end up mounting a Windows directory on your Linux system or a Linux directory on your Windows box so that both systems can use the same set of files rather than copying the files from one system to the other. One of the best tools for this is Samba, which emulates Windows protocols and runs on the Linux system.

Once Samba is installed, you will be able to mount a Linux folder on Windows or a Windows folder on Linux. This is, of course, very different than copying files as described earlier in this post. Instead, each of the two systems involved will have access to the same files at the same time.

More tips on choosing the right tool for sharing files between Linux and Windows systems are available [here][2].

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3269189/linux/sharing-files-between-linux-and-windows.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.putty.org
[2]:https://www.infoworld.com/article/2617683/linux/linux-moving-files-between-unix-and-windows-systems.html
[3]:https://www.facebook.com/NetworkWorld/
[4]:https://www.linkedin.com/company/network-world
