[#]: subject: "How to rebase to Fedora Linux 36 on Silverblue"
[#]: via: "https://fedoramagazine.org/how-to-rebase-to-fedora-linux-36-on-silverblue/"
[#]: author: "Michal Konečný https://fedoramagazine.org/author/zlopez/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to rebase to Fedora Linux 36 on Silverblue
======
![][1]

Fedora Silverblue is [an operating system for your desktop built][2][on Fedora Linux][3]. It’s excellent for daily use, development, and container-based workflows. It offers [numerous advantages][4] such as being able to roll back in case of any problems. If you want to update or rebase to Fedora Linux 36 on your Fedora Silverblue system (these instructions are similar for Fedora Kinoite), this article tells you how. It not only shows you what to do, but also how to revert things if something unforeseen happens.

Prior to actually doing the rebase to Fedora Linux 36, you should apply any pending updates. Enter the following in the terminal:

```
$ rpm-ostree update
```

or install updates through GNOME Software and reboot.

### Rebasing using GNOME Software

GNOME Software shows you that there is new version of Fedora Linux available on the Updates screen.

![Fedora 36 update available][5]

First thing you need to do is download the new image, so click on the *Download* button. This will take some time. When it’s done you will see that the update is ready to install.

![Fedora 36 update ready to install][6]

Click on the *Restart & Upgrade* button. This step will take only a few moments and the computer will be restarted at the end. After restart you will end up in new and shiny release of Fedora Linux 36. Easy, isn’t it?

### Rebasing using terminal

If you prefer to do everything in a terminal, then this part of the guide is for you.

Rebasing to Fedora Linux 36 using the terminal is easy. First, check if the 36 branch is available:

```
$ ostree remote refs fedora
```

You should see the following in the output:

```
fedora:fedora/36/x86_64/silverblue
```

If you want to pin the current deployment (this deployment will stay as option in GRUB until you remove it), you can do it by running:

```
$ sudo ostree admin pin 0
```

To remove the pinned deployment use the following command:

```
$ sudo ostree admin pin --unpin 2
```

where 2 is the position in the $rpm-ostree status

Next, rebase your system to the Fedora Linux 36 branch.

```
$ rpm-ostree rebase fedora:fedora/36/x86_64/silverblue
```

Finally, the last thing to do is restart your computer and boot to Fedora Linux 36.

### How to roll back

If anything bad happens—for instance, if you can’t boot to Fedora Linux 36 at all—it’s easy to go back. Pick the previous entry in the GRUB menu at boot (if you don’t see it, try to press ESC during boot), and your system will start in its previous state before switching to Fedora Linux 36. To make this change permanent, use the following command:

```
$ rpm-ostree rollback
```

That’s it. Now you know how to rebase Fedora Silverblue to Fedora Linux 36 and roll back. So why not do it today?

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-rebase-to-fedora-linux-36-on-silverblue/

作者：[Michal Konečný][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/silverblue-rebase-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[3]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[4]: https://fedoramagazine.org/give-fedora-silverblue-a-test-drive/
[5]: https://fedoramagazine.org/wp-content/uploads/2022/05/Screenshot-from-2022-05-11-09-33-55.png
[6]: https://fedoramagazine.org/wp-content/uploads/2022/05/Screenshot-from-2022-05-11-09-40-07.png
