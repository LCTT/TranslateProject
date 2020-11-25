[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to rebase to Fedora 33 on Silverblue)
[#]: via: (https://fedoramagazine.org/how-to-rebase-to-fedora-33-on-silverblue/)
[#]: author: (Michal Konečný https://fedoramagazine.org/author/zlopez/)

How to rebase to Fedora 33 on Silverblue
======

![][1]

Silverblue is [an operating system for your desktop built on Fedora][2]. It’s excellent for daily use, development, and container-based workflows. It offers [numerous advantages][3] such as being able to roll back in case of any problems. If you want to update to Fedora 33 on your Silverblue system, this article tells you how. It not only shows you what to do, but also how to revert things if something unforeseen happens.

Prior to actually doing the rebase to Fedora 33, you should apply any pending updates. Enter the following in the terminal:

```
$ rpm-ostree update
```

or install updates through GNOME Software and reboot.

### Rebasing using GNOME Software

The GNOME Software shows you that there is new version of Fedora available on the Updates screen.

![Fedora 33 is available][4]

First thing you need to do is to download the new image, so click on the _Download_ button. This will take some time and after it’s done you will see that the update is ready to install.

![Fedora 33 is ready for installation][5]

Click on the _Install_ button. This step will take only a few moments and then you will be prompted to restart your computer.

![Restart is needed to rebase to Fedora 33 Silverblue][6]

Click on _Restart_ button and you are done. After restart you will end up in new and shiny release of Fedora 33. Easy, isn’t it?

### Rebasing using terminal

If you prefer to do everything in a terminal, than this next guide is for you.

Rebasing to Fedora 33 using terminal is easy. First, check if the 33 branch is available:

```
$ ostree remote refs fedora
```

You should see the following in the output:

```
fedora:fedora/33/x86_64/silverblue
```

Next, rebase your system to the Fedora 33 branch.

```
$ rpm-ostree rebase fedora:fedora/33/x86_64/silverblue
```

Finally, the last thing to do is restart your computer and boot to Fedora 33.

### How to roll back

If anything bad happens—for instance, if you can’t boot to Fedora 33 at all—it’s easy to go back. Pick the previous entry in the GRUB menu at boot, and your system will start in its previous state before switching to Fedora 33. To make this change permanent, use the following command:

```
$ rpm-ostree rollback
```

That’s it. Now you know how to rebase Silverblue to Fedora 33 and roll back. So why not do it today?

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-rebase-to-fedora-33-on-silverblue/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/fedora-silverblue-logo.png
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[3]: https://fedoramagazine.org/give-fedora-silverblue-a-test-drive/
[4]: https://fedoramagazine.org/wp-content/uploads/2020/10/Screenshot-from-2020-10-29-12-53-37-1024x725.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/10/Screenshot-from-2020-10-29-13-00-15-1024x722.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/10/Screenshot-from-2020-10-29-13-01-32-1024x727.png
