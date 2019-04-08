[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to rebase to Fedora 30 Beta on Silverblue)
[#]: via: (https://fedoramagazine.org/how-to-rebase-to-fedora-30-beta-on-silverblue/)
[#]: author: (Michal Konečný https://fedoramagazine.org/author/zlopez/)

How to rebase to Fedora 30 Beta on Silverblue
======

![][1]

Silverblue is [an operating system for your desktop built on Fedora][2]. It’s excellent for daily use, development, and container-based workflows. It offers [numerous advantages][3] such as being able to roll back in case of any problems. If you want to test Fedora 30 on your Silverblue system, this article tells you how. It not only shows you what to do, but also how to revert back if anything unforeseen happens.

### Switching to Fedora 30 branch

Switching to Fedora 30 on Silverblue is easy. First, check if the _30_ branch is available, which should be true now:

```
ostree remote refs fedora-workstation
```

You should see the following in the output:

```
fedora-workstation:fedora/30/x86_64/silverblue
```

Next, import the GPG key for the Fedora 30 branch. Without this step, you won’t be able to rebase.

```
sudo ostree remote gpg-import fedora-workstation -k /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-30-primary
```

Next, rebase your system to the Fedora 30 branch.

```
rpm-ostree rebase fedora-workstation:fedora/30/x86_64/silverblue
```

Finally, the last thing to do is restart your computer and boot to Fedora 30.

### How to revert things back

Remember that Fedora 30’s still in beta testing phase, so there could still be some issues. If anything bad happens — for instance, if you can’t boot to Fedora 30 at all — it’s easy to go back. Just pick the previous entry in GRUB, and your system will start in its previous state before switching to Fedora 30. To make this change permanent, use the following command:

```
rpm-ostree rollback
```

That’s it. Now you know how to rebase to Fedora 30 and back. So why not test it today? 🙂

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-rebase-to-fedora-30-beta-on-silverblue/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/silverblue-f30beta-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[3]: https://fedoramagazine.org/give-fedora-silverblue-a-test-drive/
