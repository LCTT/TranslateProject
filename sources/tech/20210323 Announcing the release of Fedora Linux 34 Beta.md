[#]: subject: (Announcing the release of Fedora Linux 34 Beta)
[#]: via: (https://fedoramagazine.org/announcing-fedora-34-beta/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Announcing the release of Fedora Linux 34 Beta
======

![Fedora Linux 34 Beta][1]

The Fedora Project is pleased to announce the immediate availability of Fedora Linux 34 Beta, the next step towards our planned Fedora Linux 34 release at the end of April.

Download the prerelease from our Get Fedora site:

  * [Get Fedora 34 Workstation Beta ][2]
  * [Get Fedora 34 Server Beta][3]
  * [Get Fedora 34 IoT Beta][4]



Or, check out one of our popular variants, including KDE Plasma, Xfce, and other desktop environments, as well as images for ARM devices like the Raspberry Pi 2 and 3:

  * [Get Fedora Spins 34 Beta][5]
  * [Get Fedora Labs 34 Beta][6] 
  * [Get Fedora Linux 34 Beta for ARM][7]



### Beta Release Highlights

#### BTRFS transparent compression 

After Fedora Linux 33 made BTRFS the default filesystem for desktop variants, Fedora Linux 34 Beta enables transparent compression for more disk space. This increases the lifespan of flash-based media by reducing write amplification for solid-state disks. This compression improves the read and write performance for larger files, with the potential to add significant time efficiency into workflows. With a foundation for future enhancements, we aim to continue adding to these capabilities in future versions.

#### Replacing PulseAudio with PipeWire

Desktop audio will transition from using PulseAudio to PipeWire to mix and manage audio streams. The supports low-latency for pro audio use cases. PipeWire is better designed to meet the needs of containers and applications shipped in Flatpaks. The integration of PipeWire also creates the space for just one audio infrastructure to serve both desktop and professional use cases for mixing.

#### Fedora Workstation

Fedora 34 Workstation Beta includes GNOME 40, the newest release of the GNOME desktop environment. GNOME 40 represents a significant rewrite and brings user experience enhancements to the GNOME shell overview. It changes features like search, windows, workspaces and applications to be more spatially coherent. GNOME shell will also start in the overview after login, and the GNOME welcome tour that was introduced in Fedora Linux 33 will be adapted to the new design for an integrated, cohesive look for the desktop.

#### Other updates

Fedora Linux 34 Beta provides a better experience in out-of-memory (OOM) situations by enabling systemd-oomd by default. Actions taken by systemd-oomd operate on a per-cgroup level, aligning well with the life cycle of systemd units.

The KDE Plasma desktop now uses the Wayland display server by default. We are also shipping the Fedora KDE Plasma Desktop Spin on the aarch64 architecture for the first time.

A new [i3 Spin][8] introduced in Fedora Linux 34 Beta is our first desktop spin to feature a tiling window manager.

### Testing needed

Since this is a Beta release, we expect that you may encounter bugs or missing features. To report issues encountered during testing, contact the Fedora QA team via the mailing list or in the #fedora-qa channel on Freenode IRC. As testing progresses, common issues are tracked on the [Common F34 Bugs][9] page.

For tips on reporting a bug effectively, read [how to file a bug][10].

### What is the Beta Release?

A Beta release is code-complete and bears a very strong resemblance to the final release. If you take the time to download and try out the Beta, you can check and make sure the things that are important to you are working. Every bug you find and report doesn’t just help you, it improves the experience of millions of Fedora Linux users worldwide! Together, we can make Fedora rock-solid. We have a culture of coordinating new features and pushing fixes upstream as much as we can. Your feedback improves not only Fedora Linux, but the Linux ecosystem and free software as a whole.

### More information

For more detailed information about what’s new on Fedora Linux 33 Beta release, you can consult the [Fedora Linux 34 Change set][11]. It contains more technical information about the new packages and improvements shipped with this release.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-34-beta/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/f34-beta-816x345.jpg
[2]: https://getfedora.org/workstation/download/
[3]: https://getfedora.org/server/download/
[4]: https://getfedora.org/iot/download/
[5]: https://spins.fedoraproject.org/prerelease
[6]: https://labs.fedoraproject.org/prerelease
[7]: https://arm.fedoraproject.org/prerelease
[8]: https://spins.fedoraproject.org/i3
[9]: https://fedoraproject.org/wiki/Common_F34_bugs
[10]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/
[11]: https://fedoraproject.org/wiki/Releases/34/ChangeSet
