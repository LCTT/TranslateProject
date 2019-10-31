[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora 31 Released! Check Out The New Features)
[#]: via: (https://itsfoss.com/fedora-31-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Fedora 31 Released! Check Out The New Features
======

After six months of [Fedora 30][1] release, we have the next major version – Fedora 31 – available to download.

With this release, quite a few things have changed visually including several under-the-hood improvements

### Changes and new features in Fedora 31

![][2]

Here, I will highlight a few key changes so that you can decide whether you should upgrade to Fedora 31 or not. Also, we have a useful guide to help you [upgrade your Fedora version][3] – if you’re not sure how to do that.

#### Latest GNOME 3.34 Release

![][4]

This is a big deal of Fedora Workstation users, with the latest and greatest GNOME update 3.34, you will find some visual changes and performance improvements.

It is easier to change the background or lock screen wallpaper with GNOME 3.34, the options are user-friendly and useful.

In addition to this, you can also create application folders in the overview to organize your app drawer.

![Fedora Folder Icons][5]

Basically, what’s new with GNOME 3.34 directly reflects here. You can check our coverage on [GNOME 3.34 features][6] to know more about. There’s also a separate [blog post][7] on GNOME.org covering the important changes with GNOME 3.34 for Fedora 31, you might want to check that as well.

#### Dropping 32-Bit Support

With Fedora 31, you will no longer find 32-bit bootable images. They have completely dropped the support for 32-bit i686 kernel.

Most popular 32-bit packages like Steam and Wine will continue to work, but do not expect great 32-bit support.

### Docker Package Removed From Fedora 31

If you are using Docker, it is worth noting that with Fedora 31, they have enabled [CGroups V2][8].

To highlight this, I would quote the [official Fedora wiki page][9] (the bug report page) addressing this particular change as follows:

> The Docker package has been removed from Fedora 31. It has been replaced by the upstream package moby-engine, which includes the Docker CLI as well as the Docker Engine. However, we recommend instead that you use [podman][10], which is a Cgroups v2-compatible container engine whose CLI is compatible with Docker’s. Fedora 31 uses Cgroups v2 by default.

### Updated Packages

Of course, with a major release, several packages will be updated. Some of the notable upgrades are:

  * Glibc 2.30
  * NodeJS 12
  * Python 3 (Python 2 is reaching its end of life)



#### Updated Fedora Flavors &amp; Improved Hardware Support

For desktop users, Fedora 31 Workstation matters. But, if you utilize other editions of Fedora, the new release will have a significant effect there as well.

For instance, [Fedora Astronomy][11], [Fedora IoT][12] and so on.

They have also improved their support for certain SoCs like Rock64, RockPro 64 and several other chips.

#### Other Improvements

There’s actually a bunch of under-the-hood changes like disabling root password login in SSH.

Overall, it’s a good upgrade with a lot of positive changes for the users/developers. If you want more details, you can take a look at its [official changelog][13].

### Getting Fedora 31

Like any other Fedora release, Fedora 31 will also be supported for next thirteen months. This also means that Fedora 29 will reach end of life in a month. So if you are using Fedora 29, you should definitely plan upgrading.

Even if you are using Fedora 30, you should upgrade to the new release sooner or later. _**Abhishek’s advise is to wait for a couple of weeks for the bug fixes and then upgrade to the new version.**_

You can [upgrade Fedora version from within your current Fedora install][3]. You should be notified of the availability of the new release in the software center.

You can also download the ISO and install it afresh.

[Get Fedora 31][14]

**Wrapping Up**

Fedora 31 will be a new experience for me personally. I might share my experience with Fedora 31 as a follow up to this release post.

If you have already upgraded, what did you like the most about the new Fedora 31 release? Was it a smooth upgrade for you? Let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-31-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/fedora-30/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/Fedora_31.jpg?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/upgrade-fedora-version/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/fedora-31-background.jpg?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/fedora-folder-icons.jpg?ssl=1
[6]: https://itsfoss.com/gnome-3-34-release/
[7]: https://blogs.gnome.org/uraeus/2019/09/23/fedora-workstation-31-whats-new/
[8]: https://www.kernel.org/doc/Documentation/cgroup-v2.txt
[9]: https://fedoraproject.org/wiki/Common_F31_bugs#Docker_package_no_longer_available_and_will_not_run_by_default_.28due_to_switch_to_cgroups_vhttps://fedoraproject.org/wiki/Common_F31_bugs#Docker_package_no_longer_available_and_will_not_run_by_default_.28due_to_switch_to_cgroups_v2.29
[10]: https://apps.fedoraproject.org/packages/podman
[11]: https://labs.fedoraproject.org/en/astronomy/
[12]: https://iot.fedoraproject.org/
[13]: https://fedoraproject.org/wiki/Releases/31/ChangeSet
[14]: https://getfedora.org/en/
