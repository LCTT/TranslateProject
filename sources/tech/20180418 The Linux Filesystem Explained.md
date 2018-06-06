The Linux Filesystem Explained
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/search.jpg?itok=7hj0YYjF)
Back in 1996 I learned how to install software on my spanking new Linux before really understanding the topography of the filesystem. This turned out to be a problem, not so much for programs, because they would just magically work even though I hadn't a clue of where the actual executable files landed. The problem was the documentation.

You see, back then, Linux was not the intuitive, user-friendly system it is today. You had to read a lot. You had to know things about the frequency rate of your CRT monitor and the ins and outs of your noisy dial-up modem, among hundreds of other things. I soon realized I would need to spend some time getting a handle on how the directories were organized and what all their exotic names like /etc (not for miscellaneous files), /usr (not for user files), and /*bin *(not a trash can) meant.

This tutorial will help you get up to speed faster than I did.

### Structure

It makes sense to explore the Linux filesystem from a terminal window, not because the author is a grumpy old man and resents new kids and their pretty graphical tools -- although there is some truth to that -- but because a terminal, despite being text-only, has better tools to show the map of Linux's directory tree.

In fact, that is the name of the first tool you'll install to help you on the way: _tree_. If you are using Ubuntu or Debian, you can do:
```
sudo apt install tree

```

On Red Hat or Fedora, do:
```
sudo dnf install tree

```

For SUSE/openSUSE use `zypper`:
```
sudo zypper install tree

```

For Arch-like distros (Manjaro, Antergos, etc.) use:
```
sudo pacman -S tree

```

... and so on.

Once installed, stay in your terminal window and run _tree_ like this:
```
tree /

```

`The /` in the instruction above refers to the _root_ directory. The root directory is the one from which all other directories branch off from. When you run `tree` and tell it to start with _/_ , you will see the whole directory tree, all directories and all the subdirectories in the whole system, with all their files, fly by.

If you have been using your system for some time, this may take a while, because, even if you haven't generated many files yourself, a Linux system and its apps are always logging, cacheing, and storing temporal files. The number of entries in the file system can grow quite quickly.

Don't feel overwhelmed, though. Instead, try this:
```
tree -L 1 /

```

And you should see what is shown in Figure 1.

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/f01_tree01.png?itok=aGKzzC0C)

The instruction above can be translated as " _show me only the 1st Level of the directory tree starting at / (root)_ ". The `-L` option tells `tree` how many levels down you want to see.

Most Linux distributions will show you the same or a very similar layout to what you can see in the image above. This means that even if you feel confused now, master this, and you will have a handle on most, if not all, Linux installations in the whole wide world.

To get you started on the road to mastery, let's look at what each directory is used for. While we go through each, you can peek at their contents using ls.

### Directories

From top to bottom, the directories you are seeing are as follows.

#### _/bin_

_/bin_ is the directory that contains _bin_ aries, that is, some of the applications and programs you can run. You will find the _ls_ program mentioned above in this directory, as well as other basic tools for making and removing files and directories, moving them around, and so on. There are more _bin_ directories in other parts of the file system tree, but we'll be talking about those in a minute.

#### _/boot_

The _/boot_ directory contains files required for starting your system. Do I have to say this? Okay, I'll say it: **DO NOT TOUCH!**. If you mess up one of the files in here, you may not be able to run your Linux and it is a pain to repair. On the other hand, don't worry too much about destroying your system by accident: you have to have superuser privileges to do that.

#### _/dev_

_/dev_ contains _dev_ ice files. Many of these are generated at boot time or even on the fly. For example, if you plug in a new webcam or a USB pendrive into your machine, a new device entry will automagically pop up here.

#### _/etc_

_/etc_ is the directory where names start to get confusing. _/etc_ gets its name from the earliest Unixes and it was literally  "et cetera" because it was the dumping ground for system files administrators were not sure where else to put.

Nowadays, it would be more appropriate to say that _etc_ stands for  "Everything to configure," as it contains most, if not all system-wide configuration files. For example, the files that contain the name of your system, the users and their passwords, the names of machines on your network and when and where the partitions on your hard disks should be mounted are all in here. Again, if you are new to Linux, it may be best if you don't touch too much in here until you have a better understanding of how things work.

#### _/home_

_/home_ is where you will find your users' personal directories. In my case, under _/home_ there are two directories: _/home/paul_ , which contains all my stuff; and _/home/guest_ , in case anybody needs to borrow my computer.

#### _/lib_

_/lib_ is where _lib_ raries live. Libraries are files containing code that your applications can use. They contain snippets of code that applications use to draw windows on your desktop, control peripherals, or send files to your hard disk.

There are more _lib_ directories scattered around the file system, but this one, the one hanging directly off of _/_ is special in that, among other things, it contains the all-important kernel modules. The kernel modules are drivers that make things like your video card, sound card, WiFi, printer, and so on, work.

#### _/media_

The _/media_ directory is where external storage will be automatically mounted when you plug it in and try to access it. As opposed to most of the other items on this list, _/media_ does not hail back to 1970s, mainly because inserting and detecting storage (pendrives, USB hard disks, SD cards, external SSDs, etc) on the fly, while a computer is running, is a relatively new thing.

#### _/mnt_

The _/mnt_ directory, however, is a bit of remnant from days gone by. This is where you would manually mount storage devices or partitions. It is not used very often nowadays.

####  _/opt_

The _/opt_ directory is often where software you compile (that is, you build yourself from source code and do not install from your distribution repositories) sometimes lands. Applications will end up in the _/opt/bin_ directory and libraries in the _/opt/lib_ directory.

A slight digression: another place where applications and libraries end up in is _/usr/local_ , When software gets installed here, there will also be _/usr/local/bin_ and _/usr/local/lib_ directories. What determines which software goes where is how the developers have configured the files that control the compilation and installation process.

#### _/proc_

_/proc_ , like _/dev_ is a virtual directory. It contains information about your computer, such as information about your CPU and the kernel your Linux system is running. As with _/dev_ , the files and directories are generated when your computer starts, or on the fly, as your system is running and things change.

#### _/root_

_/root_ is the home directory of the superuser (also known as the  "Administrator") of the system. It is separate from the rest of the users' home directories BECAUSE YOU ARE NOT MEANT TO TOUCH IT. Keep your own stuff in you own directories, people.

#### _/run_

_/run_ is another new directory. System processes use it to store temporary data for their own nefarious reasons. This is another one of those DO NOT TOUCH folders.

#### _/sbin_

_/sbin_ is similar to _/bin_ , but it contains applications that only the superuser (hence the initial _s_ ) will need. You can use these applications with the `sudo` command that temporarily concedes you superuser powers on many distributions. _/sbin_ typically contains tools that can install stuff, delete stuff and format stuff. As you can imagine, some of these instructions are lethal if you use them improperly, so handle with care.

#### _/usr_

The _/usr_ directory was where users' home directories were originally kept back in the early days of UNIX. However, now _/home_ is where users kept their stuff as we saw above. These days, _/usr_ contains a mish-mash of directories which in turn contain applications, libraries, documentation, wallpapers, icons and a long list of other stuff that need to be shared by applications and services.

You will also find _bin_ , _sbin_ and _lib_ directories in _/usr_. What is the difference with their root-hanging cousins? Not much nowadays. Originally, the _/bin_ directory (hanging off of root) would contain very basic commands, like `ls`, `mv` and `rm`; the kind of commands that would come pre-installed in all UNIX/Linux installations, the bare minimum to run and maintain a system. _/usr/bin_ on the other hand would contain stuff the users would install and run to use the system as a work station, things like word processors, web browsers, and other apps.

But many modern Linux distributions just put everything into _/usr/bin_ and have _/bin_ point to _/usr/bin_ just in case erasing it completely would break something. So, while Debian, Ubuntu and Mint still keep _/bin_ and _/usr/bin_ (and _/sbin_ and _/usr/sbin_ ) separate; others, like Arch and its derivatives just have one "real" directory for binaries, _/usr/bin_ , and the rest or _*bin_ s are "fake" directories that point to _/usr/bin_.

#### _/srv_

The _/srv_ directory contains data for servers. If you are running a web server from your Linux box, your HTML files for your sites would go into _/srv/http_ (or _/srv/www_ ). If you were running an FTP server, your files would go into _/srv/ftp_.

#### _/sys_

_/sys_ is another virtual directory like _/proc_ and _/dev_ and also contains information from devices connected to your computer.

In some cases you can also manipulate those devices. I can, for example, change the brightness of the screen of my laptop by modifying the value stored in the _/sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1/intel_backlight/brightness_ file (on your machine you will probably have a different file). But to do that you have to become superuser. The reason for that is, as with so many other virtual directories, messing with the contents and files in _/sys_ can be dangerous and you can trash your system. DO NOT TOUCH until you are sure you know what you are doing.

#### _/tmp_

_/tmp_ contains temporary files, usually placed there by applications that you are running. The files and directories often (not always) contain data that an application doesn't need right now, but may need later on. So, to free up RAM, it gets stored here.

You can also use _/tmp_ to store your own temporary files -- _/tmp_ is one of the few directories hanging of _/_ which you can actually interact with without becoming superuser. The problem is that applications sometimes don't come back to retrieve and delete files and directories and _/tmp_ can often end up eating up space on your hard disk, filling it up with junk. Later on in this series we'll see how to clean it up.

#### _/var_

_/var_ was originally given its name because its contents was deemed _variable_ , in that it changed frequently. Today it is a bit of a misnomer because there are many other directories that also contain data that changes frequently, especially the virtual directories we saw above.

Be that as it may, _/var_ contains things like logs in the _/var/log_ subdirectories. Logs are files that register events that happen on the system. If something fails in the kernel, it will be logged in a file in _/var/log_ ; if someone tries to break into your computer from outside, your firewall will also log the attempt here. It also contains _spools_ for tasks. These  "tasks" can be the jobs you send to a shared printer when you have to wait because another user is printing a long document, or mail that is waiting to be delivered to users on the system.

Your system may have some more directories we haven't mentioned above. In the screenshot, for example, there is a _/snap_ directory. That's because the shot was captured on an Ubuntu system. Ubuntu has recently incorporated [snap][1] packages as a way of distributing software. The _/snap_ directory contains all the files and the software installed from snaps.

### Digging Deeper

That is the root directory covered, but many of the subdirectories lead to their own set of files and subdirectories. Figure 2 gives you an overall idea of what the basic file system tree looks like (the image is kindly supplied under a CC By-SA license by Paul Gardner) and [Wikipedia has a break down with a summary of what each directory is used for][2].


![filesystem][4]

Figure 2: Standard Unix filesystem hierarchy.

[Used with permission][5]

Paul Gardner

To explore the filesystem yourself, use the `cd` command:
```
cd

```

will take you to the directory of your choice ( _cd_ stands for _change directory_.

If you get confused,
```
pwd

```

will always tell you where you ( _pwd_ stands for _print working directory_ ). Also,
```
cd

```

with no options or parameters, will take you back to your own home directory, where things are safe and cosy.

Finally,
```
cd ..

```

will take you up one level, getting you one level closer to the _/_ root directory. If you are in _/usr/share/wallpapers_ and run `cd ..`, you will move up to _/usr/share_.

To see what a directory contains, use
```
ls

```

or simply
```
ls

```

to list the contents of the directory you are in right now.

And, of course, you always have `tree` to get an overview of what lays within a directory. Try it on _/usr/share_ \-- there is a lot of interesting stuff in there.

### Conclusion

Although there are minor differences between Linux distributions, the layout for their filesystems are mercifully similar. So much so that you could say: once you know one, you know them all. And the best way to know the filesystem is to explore it. So go forth with `tree`, `ls`, and `cd` into uncharted territory.

You cannot damage your filesystem just by looking at it, so move from one directory to another and take a look around. Soon you'll discover that the Linux filesystem and how it is laid out really makes a lot of sense, and you will intuitively know where to find apps, documentation, and other resources.

Learn more about Linux through the free ["Introduction to Linux" ][6]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/4/linux-filesystem-explained

作者：[PAUL BROWN][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.ubuntu.com/desktop/snappy
[2]:https://en.wikipedia.org/wiki/Unix_filesystem#Conventional_directory_layout
[3]:https://www.linux.com/files/images/standard-unix-filesystem-hierarchypng
[4]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/standard-unix-filesystem-hierarchy.png?itok=CVqmyk6P (filesystem)
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
