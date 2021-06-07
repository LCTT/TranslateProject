[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora Silverblue, an introduction for developers)
[#]: via: (https://fedoramagazine.org/fedora-silverblue-brings-future-tech-to-the-desktop/)
[#]: author: (Nick Hardiman https://fedoramagazine.org/author/nickhardiman/)

Fedora Silverblue, an introduction for developers
======

![][1]

The Fedora [Silverblue project][2] takes Fedora workstation, libostree and podman, puts them in a blender, and creates a new Immutable Fedora Workstation. Fedora Silverblue is an OS that stops you from changing the core system files arbitrarily, and readily allows you to change the environment system files. The article [What is Silverblue][3] describes the big picture, and this article drills down into details for the developer.

Fedora Silverblue ties together a few different projects to make a system that is a git-like object, capable of layering packages, and has a container focused work flow. Silverblue is not the only distribution going down this road. It is the desktop equivalent of [CoreOS][4], the server OS used by [Red Hat Openshift][5].

Silverblue’s idea of ‘immutable’ has nothing to do with immutable layers in a container. Silverblue keeps system files immutable by making them read-only.

### Why immutable?

Has an upgrade left your system in an unusable state? Have you wondered why one server in a pool of identical machines is being weird? These problems can happen when one system library – one tiny little file out of hundreds – is corrupted, badly configured or the wrong version. Or maybe your upgrade works fine but it’s not what you’d hoped for, and you want to roll back to the previous state.

An immutable OS is intended to stop problems like these biting you. This is not an easy thing to achieve – simple changes, like flipping the file system between read-write and read-only, may only change a fault-finding headache to a maintenance headache.

Freezing the system is good news for sysadmins, but what about developers? Setting up a development environment means heavily customizing the system, and filling it with living code that changes over time. The answer is partly a case of combining components, and partly the ability to swap between OS versions.

### How it works

So how do you get the benefits of immutability without losing the ability to do your work? If you’re thinking ‘containers’, good guess – part of the solution uses [podman][6]. But much of the work happens underneath the container layer, at the OS level.

Fedora Silverblue ties together a few different projects to turn an immutable OS into a usable workstation. Silverblue uses libostree to provide the base system, lets you edit config files in /etc/, and provides three different ways to install packages.

  * [rpm-ostree][7] installs RPM packages, similar to DNF in the traditional Fedora workstation. Use this for things that shouldn’t go in containers, like KVM/libvirt.
  * [flatpak][8] installs packages from a central flathub repo. This is the one-stop shop for graphical desktop apps like LibreOffice.
  * The traditional _dnf install_ still works, but only inside a [toolbox][9] (a Fedora container). A developer’s workbench goes in a toolbox.



If you want to know more about these components, check out [Pieces of Silverblue][10].

### Rolling back and pinning upgrades

All operating systems need upgrades. Features are added, security holes are plugged and bugs are squashed. But sometimes an upgrade is not a developer’s friend.

A developer depends on many things to get the job done. A good development environment is stuffed with libraries, editors, toolchains and apps that are controlled by the OS, not the developer. An upgrade may cause trouble. Have any of these situations happened to you?

  * A new encryption library is too strict, and an upgrade stopped an API working.
  * Code works well, but has deprecated syntax. An upgrade brought error-throwing misery.
  * The development environment is lovingly hand-crafted. An upgrade broke dependencies and added conflicts.



In a traditional environment, unpicking a troublesome upgrade is hard. In Silverblue, it’s easy. Silverblue keeps two copies of the OS – your current upgrade and your previous version. Point the OS at the previous version, reboot, and you’ve got your old system files back.

You aren’t limited to two copies of your file system – you can keep more by pinning your favorite versions. Dusty Mabe, one of the engineers who has been working on the system since the [Project Atomic][11] days, describes how to pin extra copies of the OS in his article [Pinning Deployments in OSTree Based Systems][12].

Your home directory is not affected by rolling back. Rpm-ostree does not touch /etc/ and /var/.

### System updates and package installs

Silverblue’s rpm-ostree treats all the files as one object, stored in a repository. The working file system is a checked-out copy of this object. After a system update, you get two objects in that repository – one current object and one updated object. The updated object is checked out and becomes the new file system.

You install your workhorse applications in toolboxes, which provide container isolation. And you install your desktop applications using Flatpak.

This new OS requires a shift in approach. For instance, you don’t have to keep only one copy of your system files – you can store a few and select which one you use. That means you can swap back and forth between an old Fedora release and the rawhide (development) version in a matter of minutes.

### Build your own Silverblue VM

You can safely install Fedora Silverblue in a VM on your workstation. If you’ve got a hypervisor and half an hour to spare (10 minutes for ISO download, and 20 minutes for the build), you can see for yourself.

  1. Download Fedora Silverblue ISO from
  2. <https://silverblue.fedoraproject.org/download> (not Fedora workstation from <https://getfedora.org/>).
  3. Boot a VM with the Fedora Silverblue ISO. You can squeeze Fedora into compute resources of 1 CPU, 1024MiB of memory and 12GiB of storage, but bigger is better.
  4. Answer [Anaconda][13]’s questions.
  5. Wait for the [Gnome][14] desktop to appear.
  6. Answer [Initial Setup][15]’s questions.



Then you’re ready to set up your developer’s tools. If you’re looking for an IDE, check these out. Use flatpak on the desktop to install them.

  * [Gnome Builder][16] (Gnome’s official IDE)
  * [Eclipse][17]
  * [Code::Blocks][18]



Finally, use the CLI to create your first toolbox. Load it with modules using [npm][19], [gem][20], [pip][21], [git][22] or your other favorite tools.

### Help!

If you get stuck, ask questions at the [forum][23].

If you’re looking for ideas about how to use Silverblue, read articles in the [magazine][24].

### Is Silverblue for you?

Silverblue is full of shiny new tech. That in itself is enough to attract the cool kids, like moths to a flame. But this OS is not for everyone. It’s a young system, so some bugs will still be lurking in there. And pioneering tech requires a change of habit – that’s extra cognitive load that the new user may not want to take on.

The OS brings immutable benefits, like keeping your system files safe. It also brings some drawbacks, like the need to reboot after adding system packages. Silverblue also enables new ways of working. If you want to explore new directions in the OS, find out if Silverblue brings benefits to your work.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-silverblue-brings-future-tech-to-the-desktop/

作者：[Nick Hardiman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nickhardiman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/silverblue-introfordev-816x345.png
[2]: https://silverblue.fedoraproject.org/
[3]: https://fedoramagazine.org/what-is-silverblue/
[4]: http://coreos.com/
[5]: https://www.openshift.com/products/container-platform
[6]: https://github.com/containers/libpod
[7]: https://rpm-ostree.readthedocs.io/en/latest/
[8]: https://docs.flatpak.org/en/latest/
[9]: https://github.com/containers/toolbox
[10]: https://fedoramagazine.org/pieces-of-fedora-silverblue/
[11]: https://www.projectatomic.io/
[12]: https://www.projectatomic.io/blog/2018/05/pinning-deployments-ostree-based-systems/
[13]: https://fedoraproject.org/wiki/Anaconda
[14]: https://www.gnome.org/
[15]: https://fedoraproject.org/wiki/InitialSetup
[16]: https://wiki.gnome.org/Apps/Builder
[17]: https://www.eclipse.org/ide/
[18]: http://www.codeblocks.org/
[19]: https://www.npmjs.com/package/package
[20]: https://rubygems.org/
[21]: https://pypi.org/
[22]: https://git-scm.com/
[23]: https://discussion.fedoraproject.org/c/desktop/silverblue/6
[24]: https://fedoramagazine.org/?s=silverblue
