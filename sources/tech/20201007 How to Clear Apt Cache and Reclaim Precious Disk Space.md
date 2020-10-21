[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Clear Apt Cache and Reclaim Precious Disk Space)
[#]: via: (https://itsfoss.com/clear-apt-cache/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Clear Apt Cache and Reclaim Precious Disk Space
======

How do you clear the apt cache? You simply use this [apt-get command][1] option:

```
sudo apt-get clean
```

But there is more to cleaning apt cache than just running the above command.

In this tutorial, I’ll explain what is apt cache, why is it used, why you would want to clean it and what other things you should know about purging apt cache.

I am going to use Ubuntu here for reference but since this is about apt, it is applicable to [Debian][2] and other Debian and Ubuntu-based distributions like Linux Mint, Deepin and more.

### What is apt cache? Why is it used?

When you install a package using apt-get or [apt command][3] (or DEB packages in the software center), the apt [package manager][4] downloads the package and its dependencies in .deb format and keeps it in /var/cache/apt/archives folder.

![][5]

While downloading, apt keeps the deb package in /var/cache/apt/archives/partial directory. When the deb package is downloaded completely, it is moved out to /var/cache/apt/archives directory.

Once the deb files for the package and its dependencies are downloaded, your system [installs the package from these deb files][6].

Now you see the use of cache? The system needs a place to keep the package files somewhere before installing them. If you are aware of the [Linux directory structure][7], you would understand that /var/cache is the appropriate here.

#### Why keep the cache after installing the package?

The downloaded deb files are not removed from the directory immediately after the installation is completed. If you remove a package and reinstall it, your system will look for the package in the cache and get it from here instead of downloading it again (as long as the package version in the cache is the same as the version in remote repository).

This is much quicker. You can try this on your own and see how long a program takes to install the first time, remove it and install it again. You can [use the time command to find out how long does it take to complete a command][8]: _**time sudo apt install package_name**_.

I couldn’t find anything concrete on the cache retention policy so I cannot say how long does Ubuntu keep the downloaded packages in the cache.

#### Should you clean apt cache?

It depends on you. If you are running out of disk space on root, you could clean apt cache and reclaim the disk space. It is one of the [several ways to free up disk space on Ubuntu][9].

Check how much space the cache takes with the [du command][10]:

![][11]

Sometime this could go in 100s of MB and this space could be crucial if you are running a server.

#### How to clean apt cache?

If you want to clear the apt cache, there is a dedicated command to do that. So don’t go about manually deleting the cache directory. Simply use this command:

```
sudo apt-get clean
```

This will remove the content of the /var/cache/apt/archives directory (except the lock file). Here’s a dry run (simulation) of what the apt-get clean command deletes:

![][12]

There is another command that deals with cleaning the apt cache:

```
sudo apt-get autoclean
```

Unlike clean, autoclean only removes the packages that are not possible to download from the repositories.

Suppose you installed package xyz. Its deb files remain in the cache. If there is now a new version of xyz package available in the repository, this existing xyz package in the cache is now outdated and useless. The autoclean option will delete such useless packages that cannot be downloaded anymore.

#### Is it safe to delete apt cache?

![][13]

Yes. It is completely safe to clear the cache created by apt. It won’t negatively impact the performance of the system. Maybe if you reinstall the package it will take a bit longer to download but that’s about it.

Again, use the apt-get clean command. It is quicker and easier than manually deleting cache directory.

You may also use graphical tools like [Stacer][14] or [Bleachbit][15] for this purpose.

#### Conclusion

At the time of writing this article, there is no built-in option with the newer apt command. However, keeping backward compatibility, _**apt clean**_ can still be run (which should be running apt-get clean underneath it). Please refer to this article to [know the difference between apt and apt-get][16].

I hope you find this explanation about apt cache interesting. It is not something essential but knowing this little things make you more knowledgeable about your Linux system.

I welcome your feedback and suggestions in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/clear-apt-cache/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/apt-get-linux-guide/
[2]: https://www.debian.org/
[3]: https://itsfoss.com/apt-command-guide/
[4]: https://itsfoss.com/package-manager/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-get-clean-cache.png?resize=800%2C470&ssl=1
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://linuxhandbook.com/linux-directory-structure/
[8]: https://linuxhandbook.com/time-command/
[9]: https://itsfoss.com/free-up-space-ubuntu-linux/
[10]: https://linuxhandbook.com/find-directory-size-du-command/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-archive-size.png?resize=800%2C233&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-get-clean-ubuntu.png?resize=800%2C339&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/Clear-Apt-Cache.png?resize=800%2C450&ssl=1
[14]: https://itsfoss.com/optimize-ubuntu-stacer/
[15]: https://itsfoss.com/use-bleachbit-ubuntu/
[16]: https://itsfoss.com/apt-vs-apt-get-difference/
