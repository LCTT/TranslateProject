[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Update Grub on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/update-grub/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Update Grub on Ubuntu and Other Linux Distributions
======

In this tutorial, you’ll learn to update grub on Ubuntu or any other Linux distribution. You’ll also learn a thing or two about how this grub update process works.

### How to update grub

Ubuntu and many other Linux distributions provide a handy command line utility called update-grub.

To update grub, all you have to do is to run this command in the terminal with sudo.

```
sudo update-grub
```

You should see an output like this:

```
[email protected]:~$ sudo update-grub
[sudo] password for abhishek:
Sourcing file `/etc/default/grub'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-5.0.0-37-generic
Found initrd image: /boot/initrd.img-5.0.0-37-generic
Found linux image: /boot/vmlinuz-5.0.0-36-generic
Found initrd image: /boot/initrd.img-5.0.0-36-generic
Found linux image: /boot/vmlinuz-5.0.0-31-generic
Found initrd image: /boot/initrd.img-5.0.0-31-generic
Found Ubuntu 19.10 (19.10) on /dev/sda4
Found MX 19 patito feo (19) on /dev/sdb1
Adding boot menu entry for EFI firmware configuration
done
```

You may see a similar command called update-grub2. No need to be alarmed or confused between update-grub and update-grub2. Both of these commands do the same action.

Around ten years ago, when grub2 was just introduced, update-grub2 command was also introduced. Today, update-grub2 is just a symbolic link to update-grub and both update grub2 configuration (because grub2 is the default).

#### Can’t find update-grub command? Here’s what to do in that case

It’s possible that your Linux distribution might not have update-grub command available.

What do you do in that case? How do you update grub on such a Linux distribution?

There is no need to panic. The update-grub command is simply a stub for running ‘grub-mkconfig -o /boot/grub/grub.cfg’ to generate grub2 config file.

Which means that you can update grub with the following command on any Linux distribution:

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Of course, remembering update-grub command is a lot easier than the above command and this is the reason why it was created in the first place.

### How does update-grub work?

When you install a Linux distribution, it (usually) asks you to install the [grub boot loader][1].

Part of grub is installed on the MBR/ESP partition. Rest of the grub lies in /boo/grub directory of the Linux distributions.

As per its [man page][2], update-grub works by looking into the /boot directory. All the files starting with [vmlinuz-][3] will be treated as kernels and they will get a grub menu entry. It will also add initrd lines for [ramdisk][4] images found with the same version as kernels found.

It also looks into all disk partitions for other operating systems with [os-prober][5]. If it finds other operating systems, it adds them to the grub menu.

![Representational image of Grub Menu][6]

### Why would you need to update grub?

There could be a number of scenarios when you need to update grub.

Suppose you changed the grub config file (/etc/default/grub) to [change the default boot order][7] or reduce the default boot time. Your changes won’t take into effect unless you update the grub.

Another scenario is when you have multiple Linux distributions installed on the same system.

For example, on my Intel NUC, I have two disks. The first disk had Ubuntu 19.10 and then I installed Ubuntu 18.04 on it. The second OS (Ubuntu 18.04) also installed its own grub and now the grub screen is controlled by Ubuntu 18.04 grub.

On the second disk, I installed MX Linux but I didn’t install grub this time. I want the existing grub (controlled by Ubuntu 18.04) to handle all the OS entries.

Now, in this scenario, the grub on Ubuntu 18.04 needs to be updated so that it can see [MX Linux][8].

![][9]

As you can see in the image above, when I update the grub, it finds various Linux kernels installed on 18.04 along with Ubuntu 19.10 and MX Linux on different partition.

If I want MX Linux to control the grub, I can install grub on MX Linux with [grub-install][10] command and then the grub on MX Linux will start controlling the grub screen. You get the gist, right?

Using a GUI tool like [Grub Customizer][11] is a simpler way to make changes in grub.

**In the end…**

Initially, I had intended to keep it a short article as a quick tip. But then I thought of explaining a few things associated with it so that (relatively) new Linux users could learn more than just a simple command.

Did you like it? Do you have some questions or suggestions? Please feel free to leave a comment.

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-grub/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/GNU_GRUB
[2]: https://manpages.debian.org/testing/grub-legacy/update-grub.8.en.html
[3]: https://www.ibm.com/developerworks/community/blogs/mhhaque/entry/anatomy_of_the_initrd_and_vmlinuz?lang=en
[4]: https://en.wikipedia.org/wiki/Initial_ramdisk
[5]: https://packages.debian.org/sid/utils/os-prober
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/grub_screen.png?ssl=1
[7]: https://itsfoss.com/grub-customizer-ubuntu/
[8]: https://mxlinux.org/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/update_grub.png?ssl=1
[10]: https://www.gnu.org/software/grub/manual/grub/html_node/Installing-GRUB-using-grub_002dinstall.html
[11]: https://itsfoss.com/customize-grub-linux/
