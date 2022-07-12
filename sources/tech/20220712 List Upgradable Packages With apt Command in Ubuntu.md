[#]: subject: "List Upgradable Packages With apt Command in Ubuntu"
[#]: via: "https://itsfoss.com/apt-list-upgradable/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

List Upgradable Packages With apt Command in Ubuntu
======

The [apt command][1] is used for package management in Debian and Ubuntu. While you are probably already familiar with the install and remove options, apt provides a few extra features as well.

One of them is the ability to see all the upgradable packages on your system. And to display them, all you have to do is to use this command in the terminal:

```
apt list --upgradable
```

As you can notice, you don’t even need sudo to list the updatable packages. It just lists the packages that can be updated. It doesn’t update them.

In fact, the apt command adds this hint when you run the `sudo apt update` command to update the local package repository cache.

```
Fetched 1,243 kB in 17s (71.4 kB/s)           
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
30 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

I don’t recall any similar direct option in the older apt-get command to list all the upgradable packages. That’s one of the several new features apt has added on top of the older apt-get command.

Let’s talk about it in a bit more detail.

### Listing all the upgradable packages 

What you should know here is that **you only get to list the updates available through the APT package manager.** So, if you have added PPAs or [external repositories][2] to your system’s sources.list, you’ll see the updates from them.

But you won’t get updates for AppImage, Flatpak, Snap or some other packaging formats here.

In other words, it works with apt packages only.

So, to list all the upgradable packages on your Ubuntu or Debian system, you should update the local package cache first:

```
sudo apt update
```

And then your system will be aware of the available package updates. The apt command tells you how many packages can be upgraded at the end of the update command:

![The apt command shows the number of upgradable packages at the bottom of the apt update command output][3]

To see what package can be upgraded, run the command:

```
apt list --upgradable
```

You should see an output like this:

```
[email protected]:~$ apt list --upgradable 
Listing... Done
apparmor/jammy-updates 3.0.4-2ubuntu2.1 amd64 [upgradable from: 3.0.4-2ubuntu2]
brave-browser/stable 1.40.113 amd64 [upgradable from: 1.40.107]
evolution-data-server-common/jammy-updates,jammy-updates 3.44.2-0ubuntu1 all [upgradable from: 3.44.1-0ubuntu2]
evolution-data-server/jammy-updates 3.44.2-0ubuntu1 amd64 [upgradable from: 3.44.1-0ubuntu2]
```

![Listing all the upgradable packages][4]

It **lists all the upgradable packages in alphabetical order** with the information on the currently installed version and the new available package version.

```
brave-browser/stable 1.40.113 amd64 [upgradable from: 1.40.107]
```

For example, It shows that I have Brave browser version 1.40.107 installed on the system, and version 1.40.113 is available.

What can you do with this information? Let me share a few things I can think of.

### Upgrade all the packages

This is probably what most casual Ubuntu users do. You can upgrade all the upgradable packages with the following command:

```
sudo apt upgrade
```

It lists what packages will be upgraded and then asks to confirm the upgrade by pressing enter or Y.

![Upgrade all packages][5]

If you are sure about upgrading all the packages, you can skip the ‘Do you want to continue’ part by giving it the go ahead by adding -y to the command.

```
sudo apt upgrade -y
```

### Simulate an upgrade (but don’t upgrade any packages)

This is what people did before the apt list command. With the simulate option, you don’t actually make any changes. It just shows what packages will be installed or upgraded if you run the upgrade.

```
apt -s upgrade
```

You don’t need to use sudo (even though I have used it in the screenshot below).

![Running an upgrade simulation with apt command][6]

### Upgrade only the selected packages

If you are managing an Ubuntu server and you don’t want to upgrade all the packages but only one of a few selected ones (like MySQL/Ngnix), you can do that easily with the apt command.

```
sudo apt --only-upgrade install package_name
```

Actually, if you run the apt install command on an already installed package for which an update is available, it will upgrade the package.

With the `--only-upgrade` flag, you ensure that a package is only upgraded (if it is already installed). It won’t install the given package if it is not already installed.

You can also upgrade selected few packages by providing their name:

```
sudo apt --only-upgrade install package1 package2
```

You can also do the opposite and [hold selected packages from the upgrade][7].

```
sudo apt-mark hold package_name
```

With that, the given package won’t be upgraded when you upgrade all the system packages.

You can remove the hold with this command:

```
sudo apt-mark unhold package_name
```

### Does it show the kernel upgrades?

This is kind of tricky.

When you run the ‘apt list –upgradable’ command it shows all the packages that can be upgraded.

But if there are new kernel versions available, they might not be shown since the kernel package name starts with linux-headers-x-y. It’s because the system treats them as new packages, not an upgrade on already installed package linux-headers-a-b.

However, you would still see “linux-generic-hwe” kind of package in the list of upgradable packages. Because that package will be upgraded (with the newer kernel).

### Conclusion

The ability to list upgradable packages is one of the several new features the apt command brought over the older apt-get command. For more on this topic, you can read my article [explaining the difference between the apt and apt-get commands][8].

As a desktop user, I don’t always check the packages that can be upgraded. I go for the upgrade straightaway. However, when I am managing a server, I prefer to see what updates are available and then decide whether or not I am going for an upgrade.

How about you? Do you see a good use for this feature for yourself?

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-list-upgradable/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/apt-command-guide/
[2]: https://itsfoss.com/adding-external-repositories-ubuntu/
[3]: https://itsfoss.com/wp-content/uploads/2022/07/update-package-cache-ubuntu.png
[4]: https://itsfoss.com/wp-content/uploads/2022/07/apt-list-upgradable-packages-ubuntu.webp
[5]: https://itsfoss.com/wp-content/uploads/2022/07/upgrade-all-packages-ubuntu.webp
[6]: https://itsfoss.com/wp-content/uploads/2022/07/run-an-upgrade-simulation-apt-ubuntu.webp
[7]: https://itsfoss.com/prevent-package-update-ubuntu/
[8]: https://itsfoss.com/apt-vs-apt-get-difference/
