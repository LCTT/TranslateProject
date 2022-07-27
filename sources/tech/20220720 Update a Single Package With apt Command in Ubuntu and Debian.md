[#]: subject: "Update a Single Package With apt Command in Ubuntu and Debian"
[#]: via: "https://itsfoss.com/apt-upgrade-single-package/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Update a Single Package With apt Command in Ubuntu and Debian
======

How do you [update your Ubuntu system in the command line][1]? You use the apt update (to refresh the package cache) and apt upgrade commands.

```
sudo apt update && sudo apt upgrade
```

It updates all the installed apt packages that can be upgraded at once. This includes the Linux kernel version, too.

This seems like a good thing, especially for desktop users. That may not be the case for Ubuntu server users where you have crucial web services running.

If you want to be selective about the updates and **only want to upgrade a single package**, use this command:

```
sudo apt install --only-upgrade package_name
```

Let’s see it in a bit more detail.

### Upgrade single package using apt command

The first step is to update the local package repository cache so that your system knows about the availability of new package versions.

```
sudo apt update
```

**This is optional**. Check if the package you want to upgrade is in the [list of upgradable packages][2].

```
apt list --upgradable
```

If the desired package has a new version available, you can choose to upgrade only this single package with this command:

```
sudo apt install --only-upgrade package_name
```

If you run the apt install command on an already installed package, it will be upgraded to the next available version.

But if the package is not installed already, the apt command will also install it.

This is why the `--only-upgrade` part is necessary. With that option, the apt command will only upgrade an already installed package. It will not install the package if it is not already installed.

Not the best-suited example for Ubuntu server users, but you can still see how I upgraded only one of the seven upgradable packages in the below screenshot.

![Update only a single package in Ubuntu][3]

### Upgrade selected packages only

If you want to upgrade a selected few packages, you don’t have to update them one by one. Just provide the package names with the command mentioned earlier.

```
sudo apt install --only-upgrade package1 package2 package3
```

Here’s an example.

![Upgrade selected packages in Ubuntu][4]

### Conclusion

When you are faced with a situation where you have to upgrade selected packages, you can use the apt install command with –only-upgrade option.

I recommend reading on [using apt command to use it more effectively][5].

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-upgrade-single-package/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/update-ubuntu/
[2]: https://itsfoss.com/apt-list-upgradable/
[3]: https://itsfoss.com/wp-content/uploads/2022/07/update-single-package-ubuntu-scaled.webp
[4]: https://itsfoss.com/wp-content/uploads/2022/07/upgrade-selected-packages-ubuntu.png
[5]: https://itsfoss.com/apt-command-guide/
