[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Matthew Arnold: Why I switched to Fedora)
[#]: via: (https://fedoramagazine.org/matthew-arnold-why-i-switched-to-fedora/)
[#]: author: (Matthew Arnold https://fedoramagazine.org/author/marnold512/)

Matthew Arnold: Why I switched to Fedora
======

![][1]

To a veteran user of other distributions, Fedora can be a challenge. Many things are not where you expect them to be. The default LVM volume allocations are a bit tricky. And packages including the kernel are frequently upgraded. So why switch after years of using other distributions?

In my case, for a variety of technical and political reasons, Fedora was the best option if I wanted to continue using Linux as my daily driver. If you are making the transition from another distribution, here are some observations and tips to get you started.

### Firm foundations

In Fedora you will find a community just as fiercely dedicated to its users and free software as Debian, as fanatical about polish and design as anyone in Ubuntu, and as passionate about learning and discovery as users of Arch or Slackware. Flowing under it all you will find a welcoming community dedicated to technical excellence. The form may change, but underneath all the trappings of _systemd_, _dnf_, _rpm_, and other differences, you will find a thriving healthy and growing community of people who have gathered together to make something awesome. Welcome to Fedora, and I hope you stay awhile.

The best way to get to know the Fedora community is to explore it for yourself. I hope a future article will highlight some of the more interesting aspects of Fedora for newcomers. Below are a few tips that I have put together to help you find your way around a new Fedora installation.

### Install and explore

Installation proceeds as you would expect but be aware that you might want to adjust the LVM volume allocations in the install process or shortly afterwards or you might run low on space in a key place unexpectedly! Btrfs is also a supported option that is worth a look if you have lots of small disks.

### Freedom matters

As stated above Fedora has a software freedom commitment similar in spirit to that of Debian. This means that you should be able to give Fedora to anyone, anywhere without violating intellectual property laws. Any software which is either not licensed in a way that Fedora [finds acceptable][2] or that bares US patent encumbrances can be found in the rpmfusion.org repository.

After the install your next concern is undoubtedly configuring things and installing new packages. Fedora’s command-line package manager is _dnf_. It works as you would expect.

Note also that since _rpm_ uses file-based dependency tracking instead of package-based dependency tracking, as almost all others do, there are very few traditional metapackages. There are, however, package groups. To get a list of package groups, the command is:

```
$ dnf group list
```

To get a list of all installed packages on the system, the command is:

```
$ rpm -qa
```

All _rpm_ commands are easily filterable using traditional Unix tools. So you should have no trouble adapting your workflow to the new environment. All the information gathered with the below commands can also be gathered through the _dnf_ command. For information gathering, I prefer to use the _rpm_ command because it presents information in a way that is easily parseable by commands like _grep_. But if you are making changes to the system, it is easier and safer to use _dnf_.

To get a package’s version, description, and other metainformation the command is:

```
$ rpm -qi <packagename>
```

To list the contents of an installed package the command is:

```
$ rpm -ql <packagename>
```

One way in which _rpm_ is easier to use then _dpkg_ or the slack package tools is that _rpm_ stores change log information for each package in the package manager database itself so it is very easy to diagnose whether an update might have broken or changed something unexpectedly. This command is:

```
$ rpm -q --changes <packagname>
```

### On the kernel

Perhaps one of the most exciting differences between Fedora and other projects, for newcomers at least, is Fedora’s policy on the kernel. Fedora’s policy is to align the distribution’s kernel package life cycle with the upstream mainline kernel life cycle. This means that every Fedora release will have multiple major kernel versions during its lifetime.

This offers several advantages for both users and developers. Primarily, Fedora users are among the first to receive all of the latest drivers, security fixes, new features, etc.

If you do not have an installation that uses out-of-tree modules or custom patches this should not be much of concern to you. However, if you rely on a kernel module like _zfs_, for example. Rebuilding the filesystem module every 2-3 months can get tedious and error prone after a while. This problem only compounds if you depend upon custom patches for your system to work correctly. There is good news and bad news on this issue.

The good news is that Fedora’s process for [building a custom kernel is well documented][3]

The bad news is, as with all things kernel related in all projects, going the custom route means you’re on your own in terms of support. The 2-3 month lifecycle means you’ll be building modules and kernels far more often then you are used to. This may be a deal breaker for some. But even this offers an advantage to the discerning or adventuress user. You will find that being encouraged to rebase your custom kernel setup every two to three months will give you far greater insight into what is going on upstream in mainline Linux and the various out of tree projects you rely on.

### Conclusion

Hopefully these tips will get you started exploring and configuring your new Fedora system. Once you have done that. I urge you to explore the community. Like any other free software product of Fedora’s age and size, there are a plethora of communication channels available. You should read the [code of conduct][4] and then head over to the [communication page on the wiki][5] to get started. As with the distribution itself, for all the differences in culture you will find that much remains the same.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/matthew-arnold-why-i-switched-to-fedora/

作者：[Matthew Arnold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/marnold512/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/fedora-switch-816x345.jpg
[2]: https://fedoraproject.org/wiki/Licensing:Main
[3]: https://fedoraproject.org/wiki/Building_a_custom_kernel
[4]: https://docs.fedoraproject.org/en-US/project/code-of-conduct/
[5]: https://fedoraproject.org/wiki/Communicating_and_getting_help
