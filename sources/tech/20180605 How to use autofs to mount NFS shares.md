How to use autofs to mount NFS shares
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx)

Most Linux file systems are mounted at boot and remain mounted while the system is running. This is also true of any remote file systems that have been configured in the `fstab` file. However, there may be times when you prefer to have a remote file system mount only on demand—for example, to boost performance by reducing network bandwidth usage, or to hide or obfuscate certain directories for security reasons. The package [autofs][1] provides this feature. In this article, I'll describe how to get a basic automount configuration up and running.

`tree.mydatacenter.net` is up and running. Also assume a data directory named `ourfiles` and two user directories, for Carl and Sarah, are being shared by this server.

First, a few assumptions: Assume the NFS server namedis up and running. Also assume a data directory namedand two user directories, for Carl and Sarah, are being shared by this server.

A few best practices will make things work a bit better: It is a good idea to use the same user ID for your users on the server and any client workstations where they have an account. Also, your workstations and server should have the same domain name. Checking the relevant configuration files should confirm.
```
alan@workstation1:~$ sudo getent passwd carl sarah

[sudo] password for alan:

carl:x:1020:1020:Carl,,,:/home/carl:/bin/bash

sarah:x:1021:1021:Sarah,,,:/home/sarah:/bin/bash



alan@workstation1:~$ sudo getent hosts

127.0.0.1       localhost

127.0.1.1       workstation1.mydatacenter.net workstation1

10.10.1.5       tree.mydatacenter.net tree

```

As you can see, both the client workstation and the NFS server are configured in the `hosts` file. I’m assuming a basic home or even small office network that might lack proper internal domain name service (i.e., DNS).

### Install the packages

You need to install only two packages: `nfs-common` for NFS client functions, and `autofs` to provide the automount function.
```
alan@workstation1:~$ sudo apt-get install nfs-common autofs

```

You can verify that the autofs files have been placed in the `etc` directory:
```
alan@workstation1:~$ cd /etc; ll auto*

-rw-r--r-- 1 root root 12596 Nov 19  2015 autofs.conf

-rw-r--r-- 1 root root   857 Mar 10  2017 auto.master

-rw-r--r-- 1 root root   708 Jul  6  2017 auto.misc

-rwxr-xr-x 1 root root  1039 Nov 19  2015 auto.net*

-rwxr-xr-x 1 root root  2191 Nov 19  2015 auto.smb*

alan@workstation1:/etc$

```

### Configure autofs

Now you need to edit several of these files and add the file `auto.home`. First, add the following two lines to the file `auto.master`:
```
/mnt/tree  /etc/auto.misc

/home/tree  /etc/auto.home

```

Each line begins with the directory where the NFS shares will be mounted. Go ahead and create those directories:
```
alan@workstation1:/etc$ sudo mkdir /mnt/tree /home/tree

```

Second, add the following line to the file `auto.misc`:
```
ourfiles        -fstype=nfs     tree:/share/ourfiles

```

This line instructs autofs to mount the `ourfiles` share at the location matched in the `auto.master` file for `auto.misc`. As shown above, these files will be available in the directory `/mnt/tree/ourfiles`.

Third, create the file `auto.home` with the following line:
```
*               -fstype=nfs     tree:/home/&

```

This line instructs autofs to mount the users share at the location matched in the `auto.master` file for `auto.home`. In this case, Carl and Sarah's files will be available in the directories `/home/tree/carl` or `/home/tree/sarah`, respectively. The asterisk (referred to as a wildcard) makes it possible for each user's share to be automatically mounted when they log in. The ampersand also works as a wildcard representing the user's directory on the server side. Their home directory should be mapped accordingly in the `passwd` file. This doesn’t have to be done if you prefer a local home directory; instead, the user could use this as simple remote storage for specific files.

Finally, restart the `autofs` daemon so it will recognize and load these configuration file changes.
```
alan@workstation1:/etc$ sudo service autofs restart

```

### Testing autofs

If you change to one of the directories listed in the file `auto.master` and run the `ls` command, you won’t see anything immediately. For example, change directory `(cd)` to `/mnt/tree`. At first, the output of `ls` won’t show anything, but after running `cd ourfiles`, the `ourfiles` share directory will be automatically mounted. The `cd` command will also be executed and you will be placed into the newly mounted directory.
```
carl@workstation1:~$ cd /mnt/tree

carl@workstation1:/mnt/tree$ ls

carl@workstation1:/mnt/tree$ cd ourfiles

carl@workstation1:/mnt/tree/ourfiles$

```

To further confirm that things are working, the `mount` command will display the details of the mounted share.
```
carl@workstation1:~$ mount

tree:/mnt/share/ourfiles on /mnt/tree/ourfiles type nfs4 (rw,relatime,vers=4.0,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.1.22,local_lock=none,addr=10.10.1.5)

```

The `/home/tree` directory will work the same way for Carl and Sarah.

I find it useful to bookmark these directories in my file manager for quicker access.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/using-autofs-mount-nfs-shares

作者：[Alan Formy-Duval][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/alanfdoss
[1]:https://wiki.archlinux.org/index.php/autofs
