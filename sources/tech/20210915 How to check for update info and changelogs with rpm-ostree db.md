[#]: subject: "How to check for update info and changelogs with rpm-ostree db"
[#]: via: "https://fedoramagazine.org/how-to-check-for-update-info-and-changelogs-with-rpm-ostree-db/"
[#]: author: "Mateus Rodrigues Costa https://fedoramagazine.org/author/mateusrodcosta/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to check for update info and changelogs with rpm-ostree db
======

![][1]

Photo by [Dan-Cristian Pădureț][2] on [Unsplash][3]

This article will teach you how to check for updates, check the changed packages, and read the changelogs with _rpm-ostree db_ and its subcommands.

The commands will be demoed on a Fedora Silverblue installation and should work on any OS that uses _rpm-ostree_.

### Introduction

Let’s say you are interested in immutable systems. Using a base system that is read-only while you build your use cases on top of containers technology sounds very attractive and it persuades you to select a distro that uses _rpm-ostree_.

You now find yourself on [Fedora Silverblue][4] (or another similar distro) and you want to check for updates. But you hit a problem. While you can find the updated packages on Fedora Silverblue with GNOME Software, you can’t actually read their changelogs. You also can’t [use _dnf updateinfo_ to read them on the command line][5], since there’s no DNF on the host system.

So, what should you do? Well, _rpm-ostree_ has subcommands that can help in this situation.

### Checking for updates

The first step is to check for updates. Simply run _rpm-ostree upgrade –check_:

```
$ rpm-ostree upgrade --check
...
AvailableUpdate:
        Version: 34.20210905.0 (2021-09-05T20:59:47Z)
         Commit: d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
   GPGSignature: Valid signature by 8C5BA6990BDB26E19F2A1A801161AE6945719A39
  SecAdvisories: 1 moderate
           Diff: 4 upgraded
```

Notice that while it doesn’t tell the updated packages in the output, it does show the Commit for the update as _d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4_. This will be useful later.

Next thing you need to do is find the Commit for the current deployment you are running. Run _rpm-ostree status_ to get the BaseCommit of the current deployment:

```
$ rpm-ostree status
State: idle
Deployments:
● fedora:fedora/34/x86_64/silverblue
                   Version: 34.20210904.0 (2021-09-04T19:16:37Z)
                BaseCommit: e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e
              GPGSignature: Valid signature by 8C5BA6990BDB26E19F2A1A801161AE6945719A39
       RemovedBasePackages: ...
           LayeredPackages: ...
...
```

For this example BaseCommit is _e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e_.

Now you can find the diff of the two commits with _rpm-ostree db diff [commit1] [commit2]_. In this command _commit1_ will be the BaseCommit from the current deployment and _commit2_ will be the Commit from the upgrade checking command.

```
$ rpm-ostree db diff e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
ostree diff commit from: e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e
ostree diff commit to:   d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
Upgraded:
  soundtouch 2.1.1-6.fc34 -> 2.1.2-1.fc34
```

The diff output shows that _soundtouch_ was updated and indicates the version numbers. View the changelogs by adding _–changelogs_ to the previous command:

```
$ rpm-ostree db diff e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4 --changelogs
ostree diff commit from: e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e
ostree diff commit to:   d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
Upgraded:
  soundtouch 2.1.1-6.fc34.x86_64 -> 2.1.2-1.fc34.x86_64
    * dom ago 29 2021 Uwe Klotz <uwe.klotz@gmail.com> - 2.1.2-1
    - Update to new upstream version 2.1.2
      Bump version to 2.1.2 to correct incorrect version info in configure.ac

    * sex jul 23 2021 Fedora Release Engineering <releng@fedoraproject.org> - 2.1.1-7
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_35_Mass_Rebuild
```

This output shows the commit notes as well as the version numbers.

### Conclusion

Using _rpm-ostree db_ you are now able to have the functionality equivalent to _dnf check-update_ and _dnf updateinfo_.

This will come in handy if you want to inspect detailed info about the updates you install.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-check-for-update-info-and-changelogs-with-rpm-ostree-db/

作者：[Mateus Rodrigues Costa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mateusrodcosta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/09/rpm-ostree-db_changelog-816x345.jpg
[2]: https://unsplash.com/@dancristianp?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/backdrop?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/what-is-silverblue/
[5]: https://fedoramagazine.org/use-dnf-updateinfo-to-read-update-changelogs/
