How to preconfigure LXD containers with cloud-init
======
You are creating containers and you want them to be somewhat preconfigured. For example, you want them to run automatically **apt update** as soon as they are launched. Or, get some packages pre-installed, or run a few commands. Here is how to perform this early initialization with [**cloud-init**][1] through [LXD to container images that support **cloud-init**][2].

In the following, we are creating a separate LXD profile with some cloud-init instructions, then launch a container using that profile.

### How to create a new LXD profile

Let's see the existing profiles.
```
$ **lxc profile list**
+---------|---------+
| NAME | USED BY |
+---------|---------+
| default | 11 |
+---------|---------+
```

There is one profile, **default**. We copy it to a new name, so that we can start adding our instructions on that profile.
```
$ **lxc profile copy default devprofile**

$ **lxc profile list**
+------------|---------+
| NAME | USED BY |
+------------|---------+
| default | 11 |
+------------|---------+
| devprofile | 0 |
+------------|---------+
```

We have a new profile to work on, **devprofile**. Here is how it looks,
```
$ **lxc profile show devprofile**
config:
 environment.TZ: ""
description: Default LXD profile
devices:
 eth0:
 nictype: bridged
 parent: lxdbr0
 type: nic
 root:
 path: /
 pool: default
 type: disk
name: devprofile
used_by: []
```

Note the main sections, **config:** , **description:** , **devices:** , **name:** , and **used_by:**. There is careful indentation in the profile, and when you make edits, you need to take care of the indentation.

### How to add cloud-init to an LXD profile

In the **config:** section of a LXD profile, we can insert [cloud-init][1] instructions. Those[ cloud-init][1] instructions will be passed to the container and will be used when it is first launched.

Here are those that we are going to use in the example,
```
 package_upgrade: true
 packages:
 - build-essential
 locale: es_ES.UTF-8
 timezone: Europe/Madrid
 runcmd:
 - [touch, /tmp/simos_was_here]
```

**package_upgrade: true** means that we want **cloud-init** to run **sudo apt upgrade** when the container is first launched. Under **packages:** we list the packages that we want to get automatically installed. Then we set the **locale** and **timezone**. In the Ubuntu container images, the default locale for **root** is **C.UTF-8** , for the **ubuntu** account it 's **en_US.UTF-8**. The timezone is **Etc/UTC**. Finally, we show [how to run a Unix command with **runcmd**][3].

The part that needs a bit of attention is how to insert the **cloud-init** instructions into the LXD profile. My preferred way is
```
$ **lxc profile edit devprofile**
```

This opens up a text editor and allows to paste the instructions. Here is [how the result should look like][4],
```
$ **lxc profile show devprofile**
config:
 environment.TZ: ""


 user.user-data: |
 #cloud-config
 package_upgrade: true
 packages:
 - build-essential
 locale: es_ES.UTF-8
 timezone: Europe/Madrid
 runcmd:
 - [touch, /tmp/simos_was_here]


description: Default LXD profile
devices:
 eth0:
 nictype: bridged
 parent: lxdbr0
 type: nic
 root:
 path: /
 pool: default
 type: disk
name: devprofile
used_by: []
```

WordPress can get a bit messed with indentation when you copy/paste, therefore, you may use [this pastebin][4] instead.

### How to launch a container using a profile

Let's launch a new container using the profile **devprofile**.
```
$ **lxc launch --profile devprofile ubuntu:x mydev**
```

Let's get into the container and figure out whether our instructions took effect.
```
$ **lxc exec mydev bash**
root@mydev:~# **ps ax**
 PID TTY STAT TIME COMMAND
 1 ? Ss 0:00 /sbin/init
 ...
 427 ? Ss 0:00 /usr/bin/python3 /usr/bin/cloud-init modules --mode=f
 430 ? S 0:00 /bin/sh -c tee -a /var/log/cloud-init-output.log
 431 ? S 0:00 tee -a /var/log/cloud-init-output.log
 432 ? S 0:00 /usr/bin/apt-get --option=Dpkg::Options::=--force-con
 437 ? S 0:00 /usr/lib/apt/methods/http
 438 ? S 0:00 /usr/lib/apt/methods/http
 440 ? S 0:00 /usr/lib/apt/methods/gpgv
 570 ? Ss 0:00 bash
 624 ? S 0:00 /usr/lib/apt/methods/store
 625 ? R+ 0:00 ps ax
root@mydev:~#
```

We connected quite quickly, and **ps ax** shows that the package update is indeed taking place! We can get the full output at /var/log/cloud-init-output.log and in there,
```
Generating locales (this might take a while)...
 es_ES.UTF-8... done
Generation complete.
```

The locale got set. The **root** user keeps having the **C.UTF-8** default locale. It is only the non-root account **ubuntu** that gets the new locale.
```
Hit:1 http://archive.ubuntu.com/ubuntu xenial InRelease
Get:2 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [102 kB]
Get:3 http://security.ubuntu.com/ubuntu xenial-security InRelease [102 kB]
```

Here is **apt update** that is required before installing packages.
```
The following packages will be upgraded:
 libdrm2 libseccomp2 squashfs-tools unattended-upgrades
4 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 211 kB of archives.
```

Here is runs **package_upgrade: true** and installs any available packages.
```
The following NEW packages will be installed:
 binutils build-essential cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5
 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl
```

This is from our instruction to install the **build-essential** meta-package.

What about the **runcmd** instruction?
```
root@mydev:~# **ls -l /tmp/**
total 1
-rw-r--r-- 1 root root 0 Jan 3 15:23 simos_was_here
root@mydev:~#
```

It worked as well!

### Conclusion

When we launch LXD containers, we often need some configuration to be enabled by default and avoid repeated actions. The way to solve this, is to create LXD profiles. Each profile captures those configurations. Finally, when we launch the new container, we specify which LXD profile to use.


--------------------------------------------------------------------------------

via: https://blog.simos.info/how-to-preconfigure-lxd-containers-with-cloud-init/

作者：[Simos Xenitellis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.simos.info/author/simos/
[1]:http://cloudinit.readthedocs.io/en/latest/index.html
[2]:https://github.com/lxc/lxd/blob/master/doc/cloud-init.md
[3]:http://cloudinit.readthedocs.io/en/latest/topics/modules.html#runcmd
[4]:https://paste.ubuntu.com/26313399/
