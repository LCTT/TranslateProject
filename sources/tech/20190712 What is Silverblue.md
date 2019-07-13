[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is Silverblue?)
[#]: via: (https://fedoramagazine.org/what-is-silverblue/)
[#]: author: (Tomáš Popela https://fedoramagazine.org/author/tpopela/)

What is Silverblue?
======

![][1]

Fedora Silverblue is becoming more and more popular inside and outside the Fedora world. So based on feedback from the community, here are answers to some interesting questions about the project. If you do have any other Silverblue related questions, please leave it in the comments section and we will try to answer them in a future article.

### What is Silverblue?

Silverblue is a codename for the new generation of the desktop operating system, previously known as Atomic Workstation. The operating system is delivered in images that are created by utilizing the _[rpm-ostree][2]_ [project][2]. The main benefits of the system are speed, security, atomic updates and immutability.

### What does “Silverblue” actually mean?

“Team Silverblue” or “Silverblue” in short doesn’t have any hidden meaning. It was chosen after roughly two months when the project, previously known as Atomic Workstation was rebranded. There were over 150 words or word combinations reviewed in the process. In the end _Silverblue_ was chosen because it had an available domain as well as the social network accounts. One could think of it as a new take on Fedora’s blue branding, and could be used in phrases like “Go, Team Silverblue!” or “Want to join the team and improve Silverblue?”.

### What is ostree?

[OSTree or libostree is a project][3] that combines a “git-like” model for committing and downloading bootable filesystem trees, together with a layer to deploy them and manage the bootloader configuration. OSTree is used by rpm-ostree, a hybrid package/image based system that Silverblue uses. It atomically replicates a base OS and allows the user to “layer” the traditional RPM on top of the base OS if needed.

### Why use Silverblue?

Because it allows you to concentrate on your work and not on the operating system you’re running. It’s more robust as the updates of the system are atomic. The only thing you need to do is to restart into the new image. Also, if there’s anything wrong with the currently booted image, you can easily reboot/rollback to the previous working one, if available. If it isn’t, you can download and boot any other image that was generated in the past, using the _ostree_ command.

Another advantage is the possibility of an easy switch between branches (or, in an old context, Fedora releases). You can easily try the _[Rawhide][4]_ or _[updates-testing][5]_ branch and then return back to the one that contains the current stable release. Also, you should consider Silverblue if you want to try something new and unusual.

### What are the benefits of an immutable OS?

One of the main benefits is security. The base operating system is mounted as read-only, and thus cannot be modified by malicious software. The only way to alter the system is through the _rpm-ostree_ utility.

Another benefit is robustness. It’s nearly impossible for a regular user to get the OS to the state when it doesn’t boot or doesn’t work properly after accidentally or unintentionally removing some system library. Try to think about these kind of experiences from your past, and imagine how Silverblue could help you there.

### How does one manage applications and packages in Silverblue?

For graphical user interface applications, [Flatpak][6] is recommended, if the application is available as a flatpak. Users can choose between Flatpaks from either Fedora and built from Fedora packages and in Fedora-owned infrastructure, or Flathub that currently has a wider offering. Users can install them easily through GNOME Software, which already supports Fedora Silverblue.

One of the first things users find out is there is no _dnf_ preinstalled in the OS. The main reason is that it wouldn’t work on Silverblue — and part of its functionality was replaced by the _rpm-ostree_ command. Users can overlay the traditional packages by using the _rpm-ostree install PACKAGE_. But it should only be used when there is no other way. This is because when the new system images are pulled from the repository, the system image must be rebuilt every time it is altered to accommodate the layered packages, or packages that were removed from the base OS or replaced with a different version.

Fedora Silverblue comes with the default set of GUI applications that are part of the base OS. The team is working on porting them to Flatpaks so they can be distributed that way. As a benefit, the base OS will become smaller and easier to maintain and test, and users can modify their default installation more easily. If you want to look at how it’s done or help, take a look at the official [documentation][7].

### What is Toolbox?

[_Toolbox_][8] is a project to make containers easily consumable for regular users. It does that by using _podman_’s rootless containers. _Toolbox_ lets you easily and quickly create a container with a regular Fedora installation that you can play with or develop on, separated from your OS.

### Is there any Silverblue roadmap?

Formally there isn’t any, as we’re focusing on problems we discover during our testing and from community feedback. We’re currently using Fedora’s [Taiga][9] to do our planning.

### What’s the release life cycle of the Silverblue?

It’s the same as regular Fedora Workstation. A new release comes every 6 months and is supported for 13 months. The team plans to release updates for the OS bi-weekly (or longer) instead of daily as they currently do. That way the updates can be more thoroughly tested by QA and community volunteers before they are sent to the rest of the users.

### What is the future of the immutable OS?

From our point of view the future of the desktop involves the immutable OS. It’s safest for the user, and Android, ChromeOS, and the last macOS Catalina all use this method under the hood. For the Linux desktop there are still problems with some third party software that expects to write to the OS. HP printer drivers are a good example.

Another issue is how parts of the system are distributed and installed. Fonts are a good example. Currently in Fedora they’re distributed in RPM packages. If you want to use them, you have to overlay them and then restart to the newly created image that contains them.

### What is the future of standard Workstation?

There is a possibility that the Silverblue will replace the regular Workstation. But there’s still a long way to go for Silverblue to provide the same functionality and user experience as the Workstation. In the meantime both desktop offerings will be delivered at the same time.

### How does Atomic Workstation or Fedora CoreOS relate to any of this?

Atomic Workstation was the name of the project before it was renamed to Fedora Silverblue.

Fedora CoreOS is a different, but similar project. It shares some fundamental technologies with Silverblue, such as _rpm-ostree_, _toolbox_ and others. Nevertheless, CoreOS is a more minimal, container-focused and automatically updating OS.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/what-is-silverblue/

作者：[Tomáš Popela][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tpopela/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/what-is-fedora-silverblue-816x345.jpg
[2]: https://rpm-ostree.readthedocs.io/en/latest/
[3]: https://ostree.readthedocs.io/en/latest/
[4]: https://fedoraproject.org/wiki/Releases/Rawhide
[5]: https://fedoraproject.org/wiki/QA:Updates_Testing
[6]: https://flatpak.org/
[7]: https://docs.fedoraproject.org/en-US/flatpak/tutorial/
[8]: https://github.com/debarshiray/toolbox
[9]: https://teams.fedoraproject.org/project/silverblue/
