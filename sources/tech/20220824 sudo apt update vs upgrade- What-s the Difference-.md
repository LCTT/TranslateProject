[#]: subject: "sudo apt update vs upgrade: What’s the Difference?"
[#]: via: "https://itsfoss.com/apt-update-vs-upgrade/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

sudo apt update vs upgrade: What’s the Difference?
======

If you want to keep your Ubuntu or Debian system updated, you use the combination of **sudo apt update** and **sudo apt upgrade** commands.

Some older tutorial also mention **sudo apt-get update** and **sudo apt-get upgrade**.

Both apt and apt-get commands work pretty much the same except for some minor differences that I’ll discuss later in this later.

Let’s first discuss the difference between update and upgrade. Are not the two the same thing?

### Difference between apt update and upgrade

Though it sounds like running the apt update will give you the latest version of the package, it’s not true. The update command only gets the information about the latest version of packages available for your system. It doesn’t download or install any package. It is the apt upgrade command that actually downloads and upgrades the package to the new version.

Still confused? Let me explain a bit more. I advise [reading up on the concept of package manager][1]. It will help you understand things even better.

![Linux Package Manager Explanation][2]

Basically your system works on a database (cache) of available packages. Note that this cache or database doesn’t contain the packages themselves, just the metadata (version, repository, dependency etc) on the package.

If you don’t update this database, the system won’t know if there are newer packages available or not.

When you run the apt update or apt-get update command, it will fetch the updated metadata (package version etc) on the packages.

![apt update][3]

Your local package cache has been updated and there are packages that can be upgraded. You can upgrade all of the (upgradable) packages with sudo apt upgrade.

It shows the packages that are going to be upgraded and ask you to confirm by pressing enter (for default choice Y) or Y key. To cancel the upgrade at this stage, you can press N.

![apt upgrade][4]

If it helps you remember:

* apt update: updates the package cache (to know which package versions can be installed or upgraded)
* apt upgrade: upgrades packages to the new version

Since these are administrative commands, you need to run them as root. And hence you use sudo with both commands. The sudo part lets you run commands as root in Ubuntu and Debian.

Now that you understand how the combination update and upgrade works, let’s discuss the use of apt and apt-get.

### apt or apt-get? Which one should you be using?

Debian and Ubuntu use the APT package management system. Don’t confuse it with the apt command.

There are many commands that interact with the APT package management; apt-get, apt, dpkg, aptitude etc.

The apt-get command was the most popular of them all. It is a low-level, feature rich command. apt is a newer and simpler version of apt-get.

You can [read this article to learn on the differences of apt and apt-get commands][5]. Let me focus on difference between the update and upgrade options of these commands.

#### apt update vs apt-get update

Both `apt-get update` and `apt update` do the same task of updating the local package cache so that your system is aware of the available package versions.

Technically, there is no difference. However, apt update does one thing better than apt-get update. It **tells you the number of packages that can be upgraded**.

```
Hit:15 https://ppa.launchpadcontent.net/slimbook/slimbook/ubuntu jammy InRelease
Fetched 213 kB in 4s (55.8 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
6 packages can be upgraded. Run 'apt list --upgradable' to see them.
```

apt-get update doesn’t even tell you if any package can be upgraded.

![apt get update][6]

![apt update output][7]

You can see the [list of upgradable packages][8] with apt but apt-get doesn’t have this option.

```
[email protected]:~$ apt list --upgradable 
Listing... Done
fprintd/jammy-updates 1.94.2-1ubuntu0.22.04.1 amd64 [upgradable from: 1.94.2-1]
gnome-control-center-data/jammy-updates,jammy-updates 1:41.7-0ubuntu0.22.04.4 all [upgradable from: 1:41.7-0ubuntu0.22.04.1]
gnome-control-center-faces/jammy-updates,jammy-updates 1:41.7-0ubuntu0.22.04.4 all [upgradable from: 1:41.7-0ubuntu0.22.04.1]
gnome-control-center/jammy-updates 1:41.7-0ubuntu0.22.04.4 amd64 [upgradable from: 1:41.7-0ubuntu0.22.04.1]
libpam-fprintd/jammy-updates 1.94.2-1ubuntu0.22.04.1 amd64 [upgradable from: 1.94.2-1]
vivaldi-stable/stable 5.4.2753.40-1 amd64 [upgradable from: 5.4.2753.37-1]
```

Let’s talk compare the upgrade option of both commands.

#### apt upgrade vs apt-get upgrade

Both apt-get upgrade and apt upgrade commands install the newer version of the upgradable packages based on the data in the local package cache (refreshed by the update command).

However, the apt upgrade command does couple of things differently than its apt-get counterpart.

The **apt upgrade command can upgrade the Linux kernel version, apt-get upgrade cannot** do that. You need to use [apt-get dist-upgrade][9] for upgrading the kernel version with apt-get command.

![apt-get upgrade command cannot upgrade Linux kernel version][10]

This is because upgrading the kernel version means installing a completely new package. apt-get upgrade command cannot install a new package. It can only upgrade existing packages.

Another small thing that apt upgrade does better than apt-get upgrade is to **show a progress bar** at the bottom.

![apt upgrade progress bar][11]

### Conclusion

The word update and upgrades are similar and this is why it confuses a lot of new users. At times, I think the apt update command should be merged with the apt upgrade command.

I mean the upgrade (of installed package versions) works in conjugation with the update (of local package metadata cache). Why have two separate commands for that? Combine them in a single upgrade command. This is what Fedora has done with the DNF command. That’s just my opinion.

I hope this article cleared some air around the usage of apt-get update, apt-get upgrade and apt update and apt upgrade commands.

Do let me know if you have any questions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-update-vs-upgrade/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/package-manager/
[2]: https://itsfoss.com/wp-content/uploads/2020/10/linux-package-manager-explanation.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/apt-update.png
[4]: https://itsfoss.com/wp-content/uploads/2022/08/apt-upgrade.png
[5]: https://itsfoss.com/apt-get-upgrade-vs-dist-upgrade/
[6]: https://itsfoss.com/wp-content/uploads/2022/08/apt-get-update.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/apt-update-output.png
[8]: https://itsfoss.com/apt-list-upgradable/
[9]: https://itsfoss.com/apt-get-upgrade-vs-dist-upgrade/
[10]: https://itsfoss.com/wp-content/uploads/2022/08/apt-get-upgrade.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/apt-upgrade-progress-bar.png
