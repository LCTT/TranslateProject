[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Free Up Space in /boot Partition on Ubuntu Linux?)
[#]: via: (https://itsfoss.com/free-boot-partition-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

How to Free Up Space in /boot Partition on Ubuntu Linux?
======

The other day, I got a warning that boot partition is almost full or has no space left. Yes, I have a separate boot partition, not many people do that these days, I believe.

This was the first time I saw such an error and it left me confused. Now, there are several [ways to free up space on Ubuntu][1] (or Ubuntu-based distros) but not all of them are useful in this case.

This is why I decided to write about the steps I followed to free some space in the /boot partition.

### Free up space in /boot partition on Ubuntu (if your boot partition is running out of space)

![][2]

I’d advise you to carefully read through the solutions and follow the one best suited for your situation. It’s easy but you need to be cautious about performing some of these on your production systems.

#### Method 1: Using apt autoremove

You don’t have to be a terminal expert to do this, it’s just one command and you will be removing unused kernels to free up space in the /boot partition.

All you have to do is, type in:

```
sudo apt autoremove
```

This will not just remove unused kernels but also get rid of the dependencies that you don’t need or isn’t needed by any of the tools installed.

Once you enter the command, it will list the things that will be removed and you just have to confirm the action. If you’re curious, you can go through it carefully and see what it actually removes.

Here’s how it will look like:

![][3]

You have to press **Y** to proceed.

_**It’s worth noting that this method will only work if you’ve a tiny bit of space left and you get the warning. But, if your /boot partition is full, APT may not even work.**_

In the next method, I’ll highlight two different ways by which you can remove old kernels to free up space using a GUI and also the terminal.

#### Method 2: Remove Unused Kernel Manually (if apt autoremove didn’t work)

Before you try to [remove any older kernels][4] to free up space, you need to identify the current active kernel and make sure that you don’t delete that.

To [check your kernel version][5], type in the following command in the terminal:

```
uname -r
```

The [uname command is generally used to get Linux system information][6]. Here, this command displays the current Linux kernel being used. It should look like this:

![][7]

Now, that you know what your current Linux Kernel is, you just have to remove the ones that do not match this version. You should note it down somewhere so that you ensure you do not remove it accidentally.

Next, to remove it, you can either utilize the terminal or the GUI.

Warning!

Be extra careful while deleting kernels. Identify and delete old kernels only, not the current one you are using otherwise you’ll have a broken system.

##### Using a GUI tool to remove old Linux kernels

You can use the [Synaptic Package Manager][8] or a tool like [Stacer][9] to get started. Personally, when I encountered a full /boot partition with apt broken, I used [Stacer][6] to get rid of older kernels. So, let me show you how that looks.

First, you need to launch “**Stacer**” and then navigate your way to the package uninstaller as shown in the screenshot below.

![][10]

Here, search for “**image**” and you will find the images for the Linux Kernels you have. You just have to delete the old kernel versions and not your current kernel image.

I’ve pointed out my current kernel and old kernels in my case in the screenshot above, so you have to be careful with your kernel version on your system.

You don’t have to delete anything else, just the ones that are the older kernel versions.

Similarly, just search for “**headers**” in the list of packages and delete the old ones as shown below.

![][11]

Just to warn you, you **don’t want to remove “linux-headers-generic”**. Only focus on the ones that have version numbers with them.

And, that’s it, you’ll be done and apt will be working again and you have successfully freed up some space from your /boot partition. Similarly, you can do this using any other package manager you’re comfortable with.

#### Using the command-line to remove old kernels

It’s the same thing but just using the terminal. So, if you don’t have the option to use a GUI (if it’s a remote machine/server) or if you’re just comfortable with the terminal, you can follow the steps below.

First, list all your kernels installed using the command below:

```
ls -l /boot
```

It should look something like this:

![][12]

The ones that are mentioned as “**old**” or the ones that do not match your current kernel version are the unused kernels that you can delete.

Now, you can use the **rm** command to remove the specific kernels from the boot partition using the command below (a single command for each):

```
sudo rm /boot/vmlinuz-5.4.0-7634-generic
```

Make sure to check the version for your system — it may be different for your system.

If you have a lot of unused kernels, this will take time. So, you can also get rid of multiple kernels using the following command:

```
sudo rm /boot/*-5.4.0-{7634}-*
```

To clarify, you need to write the last part/code of the Kernel versions separated by commas to delete them all at once.

Suppose, I have two old kernels 5.4.0-7634-generic and 5.4.0-7624, the command will be:

```
sudo rm /boot/*-5.4.0-{7634,7624}-*
```

If you don’t want to see the old kernel version in the grub boot menu, you can simply [update grub][13] using the following command:

```
sudo update-grub
```

That’s it. You’re done. You’ve freed up space and also potentially fixed the broken APT if it was an issue after your /boot partition filled up.

In some cases, you may need to enter these commands to fix the broken apt (as I’ve noticed in the forums):

```
sudo dpkg --configure -a
sudo apt install -f
```

Do note that you don’t need to enter the above commands unless you find APT broken. Personally, I didn’t need these commands but I found them handy for some on the forums.

--------------------------------------------------------------------------------

via: https://itsfoss.com/free-boot-partition-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/free-up-space-ubuntu-linux/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/free-boot-space-ubuntu-linux.jpg?resize=800%2C450&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/apt-autoremove-screenshot.jpg?resize=800%2C415&ssl=1
[4]: https://itsfoss.com/remove-old-kernels-ubuntu/
[5]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[6]: https://linuxhandbook.com/uname/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/uname-r-screenshot.jpg?resize=800%2C198&ssl=1
[8]: https://itsfoss.com/synaptic-package-manager/
[9]: https://itsfoss.com/optimize-ubuntu-stacer/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/stacer-remove-kernel.jpg?resize=800%2C562&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/stacer-remove-kernel-header.png?resize=800%2C576&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/command-kernel-list.png?resize=800%2C432&ssl=1
[13]: https://itsfoss.com/update-grub/
