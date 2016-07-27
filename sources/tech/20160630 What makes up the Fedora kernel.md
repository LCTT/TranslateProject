Being translated by ChrisLeeGit

What makes up the Fedora kernel?
====================================

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/kernel-945x400.png)

Every Fedora system runs a kernel. Many pieces of code come together to make this a reality.

Each release of the Fedora kernel starts with a baseline release from the [upstream community][1]. This is often called a ‘vanilla’ kernel. The upstream kernel is the standard. The goal is to have as much code upstream as possible. This makes it easier for bug fixes and API updates to happen as well as having more people review the code. In an ideal world, Fedora would be able to to take the kernel straight from kernel.org and send that out to all users.

Realistically, using the vanilla kernel isn’t complete enough for Fedora. Some features Fedora users want may not be available. The [Fedora kernel][2] that users actually receive contains a number of patches on top of the vanilla kernel. These patches are considered ‘out of tree’. Many of these patches will not exist out of tree patches very long. If patches are available to fix an issue, the patches may be pulled in to the Fedora tree so the fix can go out to users faster. When the kernel is rebased to a new version, the patches will be removed if they are in the new version.

Some patches remain in the Fedora kernel tree for an extended period of time. A good example of patches that fall into this category are the secure boot patches. These patches provide a feature Fedora wants to support even though the upstream community has not yet accepted them. It takes effort to keep these patches up to date so Fedora tries to minimize the number of patches that are carried without being accepted by an upstream kernel maintainer.

Generally, the best way to get a patch included in the Fedora kernel is to send it to the ]Linux Kernel Mailing List (LKML)][3] first and then ask for it to be included in Fedora. If a patch has been accepted by a maintainer it stands a very high chance of being included in the Fedora kernel tree. Patches that come from places like github which have not been submitted to LKML are unlikely to be taken into the tree. It’s important to send the patches to LKML first to ensure Fedora is carrying the correct patches in its tree. Without the community review, Fedora could end up carrying patches which are buggy and cause problems.

The Fedora kernel contains code from many places. All of it is necessary to give the best experience possible.



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/makes-fedora-kernel/

作者：[Laura Abbott][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/makes-fedora-kernel/
[1]: http://www.kernel.org/
[2]: http://pkgs.fedoraproject.org/cgit/rpms/kernel.git/
[3]: http://www.labbott.name/blog/2015/10/02/the-art-of-communicating-with-lkml/
