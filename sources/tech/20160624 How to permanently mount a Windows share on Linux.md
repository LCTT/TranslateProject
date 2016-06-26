How to permanently mount a Windows share on Linux
==================================================

>If you get tired of having to remount Windows shares when you reboot your Linux box, read about an easy way to make those shares permanently mount.

![](http://tr2.cbsistatic.com/hub/i/2016/06/02/e965310b-b38d-43e6-9eac-ea520992138b/68fd9ec5d6731cc405bdd27f2f42848d/linuxadminhero.jpg)
>Image: Jack Wallen

It has never been easier for Linux to interact within a Windows network. And considering how many businesses are adopting Linux, those two platforms have to play well together. Fortunately, with the help of a few tools, you can easily map Windows network drives onto a Linux machine, and even ensure they are still there upon rebooting the Linux machine.

### Before we get started

For this to work, you will be using the command line. The process is pretty simple, but you will be editing the /etc/fstab file, so do use caution.
Also, I assume you already have Samba working properly so you can manually mount shares from a Windows network to your Linux box, and that you know the IP address of the machine hosting the share.

Are you ready? Let's go.

### Create your mount point

The first thing we're going to do is create a folder that will serve as the mount point for the share. For the sake of simplicity, we'll name this folder share and we'll place it in /media. Open your terminal window and issue the command:

```
sudo mkdir /media/share
```

### A few installations

Now we have to install the system that allows for cross-platform file sharing; this system is cifs-utils. From the terminal window, issue the command:

```
sudo apt-get install cifs-utils
```

This command will also install all of the dependencies for cifs-utils.

Once this is installed, open up the file /etc/nsswitch.conf and look for the line:

```
hosts: files mdns4_minimal [NOTFOUND=return] dns
```

Edit that line so it looks like:

```
hosts: files mdns4_minimal [NOTFOUND=return] wins dns
```

Now you must install windbind so that your Linux machine can resolve Windows computer names on a DHCP network. From the terminal, issue this command:

```
sudo apt-get install libnss-windbind windbind
```

Restart networking with the command:

```
sudo service networking restart
```

### Mount the network drive

Now we're going to map the network drive. This is where we must edit the /etc/fstab file. Before you make that first edit, back up the file with this command:

```
sudo cp /etc/fstab /etc/fstab.old
```

If you need to restore that file, issue the command:

```
sudo mv /etc/fstab.old /etc/fstab
```

Create a credentials file in your home directory called .smbcredentials. In that file, add your username and password, like so (USER is the actual username and password is the actual password):

```
username=USER

password=PASSWORD
```

You now have to know the Group ID (GID) and User ID (UID) of the user that will be mounting the drive. Issue the command:

```
id USER
```

USER is the actual username, and you should see something like:

```
uid=1000(USER) gid=1000(GROUP)
```

USER is the actual username, and GROUP is the group name. The numbers before (USER) and (GROUP) will be used in the /etc/fstab file.

It's time to edit the /etc/fstab file. Open that file in your editor and add the following line to the end (replace everything in ALL CAPS and the IP address of the remote machine):

```
//192.168.1.10/SHARE /media/share cifs credentials=/home/USER/.smbcredentials,iocharset=uft8,gid=GID,udi=UID,file_mode=0777,dir_mode=0777 0 0
```

**Note**: The above should be on a single line.

Save and close that file. Issue the command sudo mount -a and the share will be mounted. Check in /media/share and you should see the files and folders on the network share.

### Sharing made easy

Thanks to cifs-utils and Samba, mapping network shares is incredibly easy on a Linux machine. And now, you won't have to manually remount those shares every time your machine boots.

For more networking tips and tricks, sign up for our Data Center newsletter.
[SUBSCRIBE](https://secure.techrepublic.com/user/login/?regSource=newsletter-button&position=newsletter-button&appId=true&redirectUrl=http%3A%2F%2Fwww.techrepublic.com%2Farticle%2Fhow-to-permanently-mount-a-windows-share-on-linux%2F&)

--------------------------------------------------------------------------------

via: http://www.techrepublic.com/article/how-to-permanently-mount-a-windows-share-on-linux/

作者：[Jack Wallen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.techrepublic.com/search/?a=jack+wallen


