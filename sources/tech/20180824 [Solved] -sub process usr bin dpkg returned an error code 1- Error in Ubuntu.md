translating---geekpi

[Solved] “sub process usr bin dpkg returned an error code 1″ Error in Ubuntu
======
If you are encountering “sub process usr bin dpkg returned an error code 1” while installing software on Ubuntu Linux, here is how you can fix it.

One of the common issue in Ubuntu and other Debian based distribution is the broken packages. You try to update the system or install a new package and you encounter an error like ‘Sub-process /usr/bin/dpkg returned an error code’.

That’s what happened to me the other day. I was trying to install a radio application in Ubuntu when it threw me this error:
```
Unpacking python-gst-1.0 (1.6.2-1build1) ...
Selecting previously unselected package radiotray.
Preparing to unpack .../radiotray_0.7.3-5ubuntu1_all.deb ...
Unpacking radiotray (0.7.3-5ubuntu1) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for desktop-file-utils (0.22-1ubuntu5.2) ...
Processing triggers for bamfdaemon (0.5.3~bzr0+16.04.20180209-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for gnome-menus (3.13.3-6ubuntu3.1) ...
Processing triggers for mime-support (3.59ubuntu1) ...
Setting up polar-bookshelf (1.0.0-beta56) ...
ln: failed to create symbolic link '/usr/local/bin/polar-bookshelf': No such file or directory
dpkg: error processing package polar-bookshelf (--configure):
subprocess installed post-installation script returned error exit status 1
Setting up python-appindicator (12.10.1+16.04.20170215-0ubuntu1) ...
Setting up python-gst-1.0 (1.6.2-1build1) ...
Setting up radiotray (0.7.3-5ubuntu1) ...
Errors were encountered while processing:
polar-bookshelf
E: Sub-process /usr/bin/dpkg returned an error code (1)

```

The last three lines are of the utmost importance here.
```
Errors were encountered while processing:
polar-bookshelf
E: Sub-process /usr/bin/dpkg returned an error code (1)

```

It tells me that the package polar-bookshelf is causing and issue. This might be crucial to how you fix this error here.

### Fixing Sub-process /usr/bin/dpkg returned an error code (1)

![Fix update errors in Ubuntu Linux][1]

Let’s try to fix this broken error package. I’ll show several methods that you can try one by one. The initial ones are easy to use and simply no-brainers.

You should try to run sudo apt update and then try to install a new package or upgrade after trying each of the methods discussed here.

#### Method 1: Reconfigure Package Database

The first method you can try is to reconfigure the package database. Probably the database got corrupted while installing a package. Reconfiguring often fixes the problem.
```
sudo dpkg --configure -a

```

#### Method 2: Use force install

If a package installation was interrupted previously, you may try to do a force install.
```
sudo apt-get install -f

```

#### Method 3: Try removing the troublesome package

If it’s not an issue for you, you may try to remove the package manually. Please don’t do it for Linux Kernels (packages starting with linux-).
```
sudo apt remove

```

#### Method 4: Remove post info files of the troublesome package

This should be your last resort. You can try removing the files associated to the package in question from /var/lib/dpkg/info.

**You need to know a little about basic Linux commands to figure out what’s happening and how can you use the same with your problem.**

In my case, I had an issue with polar-bookshelf. So I looked for the files associated with it:
```
ls -l /var/lib/dpkg/info | grep -i polar-bookshelf
-rw-r--r-- 1 root root 2324811 Aug 14 19:29 polar-bookshelf.list
-rw-r--r-- 1 root root 2822824 Aug 10 04:28 polar-bookshelf.md5sums
-rwxr-xr-x 1 root root 113 Aug 10 04:28 polar-bookshelf.postinst
-rwxr-xr-x 1 root root 84 Aug 10 04:28 polar-bookshelf.postrm

```

Now all I needed to do was to remove these files:
```
sudo mv /var/lib/dpkg/info/polar-bookshelf.* /tmp

```

Use the sudo apt update and then you should be able to install software as usual.

#### Which method worked for you (if it worked)?

I hope this quick article helps you in fixing the ‘E: Sub-process /usr/bin/dpkg returned an error code (1)’ error.

If it did work for you, which method was it? Did you manage to fix this error with some other method? If yes, please share that to help others with this issue.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dpkg-returned-an-error-code-1/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/fix-common-update-errors-ubuntu.jpeg
