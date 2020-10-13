[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The pieces of Fedora Silverblue)
[#]: via: (https://fedoramagazine.org/pieces-of-fedora-silverblue/)
[#]: author: (Nick Hardiman https://fedoramagazine.org/author/nickhardiman/)

The pieces of Fedora Silverblue
======

![][1]

Fedora Silverblue provides a useful workstation build on an immutable operating system. In “[What is Silverblue?][2]“, you learned about the benefits that an immutable OS provides. But what pieces go into making it? This article examines some of the technology that powers Silverblue.

### The filesystem

Fedora Workstation users may find the idea of an immutable OS to be the most brain-melting part of Silverblue. What does that mean? Find some answers by taking a look at the filesystem.

At first glance, the layout looks pretty much the same as a regular Fedora file system. It has some differences, like making _/home_ a symbolic link to _/var/home_. And you can get more answers by looking at how libostree works. libostree treats the whole tree like it’s an object, checks it into a code repository, and checks out a copy for your machine to use.

#### libostree

The [libostree project][3] supplies the goods for managing Silverblue’s file system. It is an upgrade system that the user can control using [rpm-ostree commands][4].

libostree knows nothing about packages—an upgrade means replacing one complete file system with another complete file system. libostree treats the file system tree as one atomic object (an unbreakable unit). In fact, the forerunner to Silverblue was named [Project Atomic][5].

The libostree project provides a library and set of tools. It’s an upgrade system that carries out these tasks.

  1. Pull in a new file system
  2. Store the new file system
  3. Deploy the new file system



##### Pull in a new file system

Pulling in a new file system means copying an object (the entire file system) from a remote source to its own store. If you’ve worked with virtual machine image files, you already understand the concept of a file system object that you can copy.

##### Store the new file system

The libostree store has some source code control qualities—it stores many file system objects, and checks one out to be used as the root file system. libostree’s store has two parts:

  * a repository database at _/sysroot/ostree/repo/_
  * file systems in _/sysroot/ostree/deploy/fedora/deploy/_



libostree keeps track of what’s been checked in using commit IDs. Each commit ID can be found in a directory name, nested deep inside _/sysroot_ .A libostree commit ID is a long checksum, and looks similar to a git commit ID.

```
$ ls -d /sysroot/ostree/deploy/fedora/deploy/*/
/sysroot/ostree/deploy/fedora/deploy/c4bf7a6339e6be97d0ca48a117a1a35c9c5e3256ae2db9e706b0147c5845fac4.0/
```

_rpm-ostree status_ gives a little more information about that commit ID. The output is a little confusing; it can take a while to see this file system is Fedora 31.

```
$ rpm-ostree status
State: idle
AutomaticUpdates: disabled
Deployments:
● ostree://fedora:fedora/31/x86_64/silverblue
                   Version: 31.1.9 (2019-10-23T21:44:48Z)
                    Commit: c4bf7a6339e6be97d0ca48a117a1a35c9c5e3256ae2db9e706b0147c5845fac4
              GPGSignature: Valid signature by 7D22D5867F2A4236474BF7B850CB390B3C3359C4
```

##### Deploy the new filesystem

libostree deploys a new file system by checking out the new object from its store. libostree doesn’t check out a file system by copying all the files—it uses hard links instead. If you look inside the commit ID directory, you see something that looks suspiciously like the root directory. That’s because it _is_ the root directory. You can see these two directories are pointing to the same place by checking their inodes.

```
$ ls -di1 / /sysroot/ostree/deploy/fedora/deploy/*/
260102 /
260102 /sysroot/ostree/deploy/fedora/deploy/c4bf7a6339e6be97d0ca48a117a1a35c9c5e3256ae2db9e706b0147c5845fac4.0/
```

This is a fresh install, so there’s only one commit ID. After a system update, there will be two. If more copies of the file system are checked into libostree’s repo, more commit IDs appear here.

##### Upgrade process

Putting the pieces together, the update process looks like this:

  1. libostree checks out a copy of the file system object from the repository
  2. DNF installs packages into the copy
  3. libostree checks in the copy as a new object
  4. libostree checks out the copy to become the new file system
  5. You reboot to pick up the new system files



In addition to more safety, there is more flexibility. You can do new things with libostree’s repo, like store a few different file systems and check out whichever one you feel like using.

#### Silverblue’s root file system

Fedora keeps its system files in all the usual Linux places, such as _/boot_ for boot files, _/etc_ for configuration files, and _/home_ for user home directories. The root directory in Silverblue looks much like the root directory in traditional Fedora, but there are some differences.

  * The filesystem has been checked out by libostree
  * Some directories are now symbolic links to new locations. For example, _/home_ is a symbolic link to _/var/home_
  * _/usr_ is a read-only directory
  * There’s a new directory named _/sysroot_. This is libostree’s new home



#### Juggling file systems

You can store many file systems and switch between them. This is called _rebasing_, and it’s similar to git rebasing. In fact, upgrading Silverblue to the next Fedora version is not a big package install—it’s a pull from a remote repository and a rebase.

You could store three copies with three different desktops: one KDE, one GNOME, and one XFCE. Or three different OS versions: how about keeping the current version, the nightly build, and an old classic? Switching between them is a matter of rebasing to the appropriate file system object.

Rebasing is also how you upgrade from one Fedora release to the next. See “[How to rebase to Fedora 32 on Silverblue][6]” for more information.

### Flatpak

The [Flatpak project][7] provides a way of installing applications like LibreOffice. Applications are pulled from remote repositories like [Flathub][8]. It’s a kind of package manager, although you won’t find the word _package_ in the [docs][9]. Traditional Fedora variants like Fedora Workstation can also use Flatpak, but the sandboxed nature of flatpaks make it particularly good for Silverblue. This way you do not have to do the entire ostree update process every time you wish to install an application.

Flatpak is well-suited to desktop applications, but also works for command line applications. You can install the [vim][10] editor with the command _flatpak install flathub org.vim.Vim_ and run it with _flatpak run org.vim.Vim_.

### toolbox

The [toolbox project][11] provides a traditional operating system inside a container. The idea is that you can mess with the mutable OS inside your toolbox (the Fedora container) as much as you like, and leave the immutable OS outside your toolbox untouched. You pack as many toolboxes as you want on your system, so you can keep work separated. Behind the scenes, the executable _/usr/bin/toolbox_ is a shell script that uses [podman][12].

A fresh install does not include a default toolbox. The _toolbox create_ command checks the OS version (by reading _/usr/lib/os-release_), looks for a matching version at the Fedora container registry, and downloads the container.

```
$ toolbox create
Image required to create toolbox container.
Download registry.fedoraproject.org/f31/fedora-toolbox:31 (500MB)? [y/N]: y
Created container: fedora-toolbox-31
Enter with: toolbox enter
```

Hundreds of packages are installed inside the toolbox. The _dnf_ command and the usual Fedora repos are set up, ready to install more. The _ostree_ and _rpm-ostree_ commands are not included – no immutable OS here.

Each user’s home directory is mounted on their toolbox, for storing content files outside the container.

### Put the pieces together

Spend some time exploring Fedora Silverblue and it will become clear how these components fit together. Like other Fedora variants, all these of tools come from open source projects. You can get as up close and personal as you want, from reading their docs to contributing code. Or you can [contribute to Silverblue][13] itself.

Join the Fedora Silverblue conversations on [discussion.fedoraproject.org][14] or in [#silverblue on Freenode IRC][15].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/pieces-of-fedora-silverblue/

作者：[Nick Hardiman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nickhardiman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/silverblue-pieces-816x345.png
[2]: https://fedoramagazine.org/what-is-silverblue/
[3]: https://ostree.readthedocs.io/en/latest/
[4]: https://rpm-ostree.readthedocs.io/en/latest/manual/administrator-handbook/#administering-an-rpm-ostree-based-system
[5]: https://www.projectatomic.io/
[6]: https://fedoramagazine.org/how-to-rebase-to-fedora-32-on-silverblue/
[7]: https://github.com/flatpak/flatpak
[8]: https://flathub.org/
[9]: http://docs.flatpak.org/en/latest/index.html
[10]: https://www.vim.org/
[11]: https://github.com/containers/toolbox
[12]: https://github.com/containers/libpod
[13]: https://silverblue.fedoraproject.org/contribute
[14]: https://discussion.fedoraproject.org/c/desktop/silverblue
[15]: https://webchat.freenode.net/#silverblue
