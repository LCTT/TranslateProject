[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Explained! Why Your Distribution Still Using an ‘Outdated’ Linux Kernel?)
[#]: via: (https://itsfoss.com/why-distros-use-old-kernel/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Explained! Why Your Distribution Still Using an ‘Outdated’ Linux Kernel?
======

[Check your Linux kernel version][1]. Chances are that you’ll find that the kernel version your system is using has already reached end of life (EOL) as listed on Linux Kernel website.

End of life means a software won’t get bug fixes and support anymore.

That poses some valid questions. Why is my Linux distribution using a kernel that has reached end of life? Is this not a security risk? Is my system safe?

Let me explain all these questions in this article.

Summary

The upstream kernel support and the your distribution’s kernel support are two different things.

For example, Linux kernel 4.15 might have reached end of life (as per the official Linux kernel website) but Ubuntu 18.04 LTS release will use it and maintain it till April 2023 by backporting security patches and bug fixes.

### Checking Linux kernel version and finding its end of life status

Let’s first check the Linux kernel version on your system:

```
uname -r
```

I am using Ubuntu 18.04 here and it shows the Linux kernel version like this:

```
[email protected]:~$ uname -r
5.0.0-37-generic
```

Now, you may go to the official Linux kernel website and see what Linux kernels are still being supported. It’s displayed on the homepage itself.

[Linux Kernel Official Website][2]

You should see a status like this:

![Linux Kernel Status][3]

If you don’t see a kernel version listed on the homepage of kernel website, it means that specific version has reached end of life.

As you can see, kernel 5.0 is not listed here. It indicates that this kernel version is not being supported anymore. Actually, it [reached end of life in June 2019][4].

The life cycle of a Linux kernel doesn’t follow a set pattern, unfortunately. It’s NOT like a regular kernel stable release will be supported for X months and a long term support(LTS) kernel will be supported for Y years.

Based on the demand and requirements, there could be several LTS kernel versions with different EOL. You can find them along with their projected EOL on [this page][5].

Now comes the big question. Why is Ubuntu providing kernel 5.0 if the Linux kernel website shows that it has reached its end of life?

### Your distribution uses an EOL Linux kernel but that’s Okay!

![][6]

Have you ever wondered why Ubuntu/Debian/Fedora etc are called Linux distributions? It’s because they ‘distribute’ the Linux kernel.

They have their own modification of the Linux kernel, they add the GUI elements (desktop environment, display server etc) and software and they make it available to their users.

In the typical workflow, a Linux distribution will choose a kernel to provide to its users. And then it will hold on to this kernel for months or years even after the kernel has reached end of life.

How is it safe then? It’s because the _**distribution maintains the kernel by backporting all the important fixes to its kernel**_.

In other words, your Linux distribution makes sure that your Linux kernel is patched well and has all the bug fixes and important new features backported to it. There will be thousands of changes on top of the ‘old outdated Linux kernel’.

When the Linux kernel website says that a certain kernel version has reached EOL, it means that the core Linux kernel maintainers are not going to update/patch that kernel version anymore.

But at the same time, the developers at Debian/Ubuntu or other distributions work to keep the same old version alive by bringing the relevant changes from the newer kernel versions (being maintained by the core kernel team) to your distribution’s old kernel.

Bottom line is that even if it seems like your distribution is using an outdated Linux kernel, it is actually being well maintained and not really outdated.

### Should you use the latest stable kernel version?

![][7]

A new stable Linux kernel version is released every 2-3 months. And this makes many users wonder who they can get their hands on that new shiny thing.

To be frank, you should not do that unless you have a pretty good reason for it. Your distribution doesn’t provide it to you. You cannot just use ‘_sudo apt give-me-the-latest-stable-kernel_‘.

Now, manually [installing the mainline Linux kernel version][8] could be a challenge in itself. Even if you manage to install it, it is now up to you to make sure that this kernel is updated every time there is a bug fix. And when this new kernel reaches end of life, it becomes your responsibility to upgrade to the newer kernel version. It won’t be handled with apt upgrade like regular [Ubuntu updates][9].

You should also keep in mind that your distribution also has drivers and patches which you may not be able to use if you switch to the mainline kernel.

As [Greg Kroah-Hartman][10] puts it, “_**the best kernel you can use is one that someone else supports**_“. And who can be better at this job then your Linux distribution!

I hope you have a better understanding on this topic and you won’t panic the next time you find out that the kernel version your system is using has reached end of life.

I welcome your questions and suggestions. Please feel free to use the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/why-distros-use-old-kernel/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[2]: https://www.kernel.org/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/linux-kernel-status.jpg?ssl=1
[4]: http://lkml.iu.edu/hypermail/linux/kernel/1906.0/02354.html
[5]: https://www.kernel.org/category/releases.html
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/Keep_Calm_and_Trust_Your_Distribution.png?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/using_latest_kernel.png?ssl=1
[8]: https://wiki.ubuntu.com/Kernel/MainlineBuilds
[9]: https://itsfoss.com/update-ubuntu/
[10]: https://en.wikipedia.org/wiki/Greg_Kroah-Hartman
