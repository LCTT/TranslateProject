[#]: subject: (What’s new in Fedora Workstation 34)
[#]: via: (https://fedoramagazine.org/whats-new-fedora-34-workstation/)
[#]: author: (Christian Fredrik Schaller https://fedoramagazine.org/author/uraeus/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What’s new in Fedora Workstation 34
======

![][1]

Fedora Workstation 34 is the latest version of our leading-edge operating system and this time there are major improvements heading your way. Best of all, you can download it from [the official website][2]. What’s new, I hear you ask!?  Well let’s get to it.

### GNOME 40

[GNOME 40][3] is a major update to the GNOME desktop, which Fedora community members played a key role in designing and implementing, so you can be sure that the needs of Fedora users were taken into account.

The first thing you notice as you log into the GNOME 40 desktop is that you are now taken directly to a redesigned overview screen. You will notice that the dash bar has moved to the bottom of the screen. Another major change to GNOME 40 is the virtual work spaces are now horizontal which brings GNOME more in line with most other desktops out there and should thus make getting used to GNOME and Fedora easier for new users.

Work has also been done to improve gesture support in the desktop with 3-finger horizontal swipes for switching workspaces, and 3-finger vertical swipes for bringing up the overview.

![][4]

The updated overview design brings a collection of other improvements, including:

  * The dash now separates favorite and non-favorite running apps. This makes it clear which apps have been favorited and which haven’t.
  * Window thumbnails have been improved, and now have an app icon over each one, to help identification.
  * When workspaces are set to be on all displays, the workspace switcher is now shown on all displays rather than just the primary one.
  * App launcher drag and drop has been improved, to make it easier to customize the arrangement of the app grid.



The changes in GNOME 40 underwent a good deal of user testing, and have had a very positive reaction so far, so we’re excited to be introducing them to the Fedora community. For more information, see [forty.gnome.org][3] or the [GNOME 40 release notes][5].

### App Improvements

GNOME Weather has been redesigned for this release with two views, one for the hourly forecast for the next 48 hours, and one for the daily forecast for the next 10 days.

The new version now shows more information, and is more mobile-friendly, as it supports narrower sizes.

![][6]

Other apps which have been improved include Files, Maps, Software and Settings. See the [GNOME 40 release notes][5] for more details.

### **PipeWire**

PipeWire is the new audio and video server, created by Wim Taymans, who also co-created the GStreamer multimedia framework. Until now, it has only been used for video capture, but in Fedora Workstation 34 we are making the jump to also use it for audio, replacing PulseAudio.

PipeWire is designed to be compatible with both PulseAudio and Jack, so applications should generally work as before. We have also worked with Firefox and Chrome to ensure that they work well with PipeWire. PipeWire support is also coming soon in OBS Studio, so if you are a podcaster, we’ve got you covered.

PipeWire has had a very positive reception from the pro-audio community. It is prudent to say that there may be pro-audio applications that will not work 100% from day one, but we are receiving a constant stream of test reports and patches, which we will be using to continue the pro-audio PipeWire experience during the Fedora Workstation 34 lifecycle.

### **Improved Wayland support**

Support for running Wayland on top of the proprietary NVIDIA driver is expected to be resolved within the Fedora Workstation 34 lifetime. Support for running a pure Wayland client on the NVIDIA driver already exists. However, this currently lacks support for the Xwayland compatibility layer, which is used by many applications. This is why Fedora still defaults to X.Org when you install the NVIDIA driver.

We are [working upstream with NVIDIA][7]  to ensure Xwayland  works in Fedora with NVIDIA hardware acceleration.

### **QtGNOME platform and Adwaita-Qt**

Jan Grulich has continued his great work on the QtGNOME platform and Adawaita-qt themes, ensuring that  Qt applications integrate well with Fedora Workstation. The Adwaita theme that we use in Fedora has evolved over the years, but with the updates to QtGNOME platform and Adwaita-Qt in Fedora 34, Qt applications will more closely match the current GTK style in Fedora Workstation 34.

As part of this work, the appearance and styling of Fedora Media Writer has also been improved.

![][8]

### **Toolbox**

Toolbox is our great tool for creating development environments that are isolated from your host system, and it has seen lots of improvements for Fedora 34. For instance we have put a lot of work into improving the CI system integration for toolbox to avoid breakages in our stack causing Toolbox to stop working.

A lot of work has been put into the RHEL integration in Toolbox, which means that you can easily set up a containerized RHEL environment on a Fedora system, and thus conveniently do development for RHEL servers and cloud instances. Creating a RHEL environment on Fedora is now as easy as running: toolbox create –distro rhel –release 8.4. 

This gives you the advantage of an up to date desktop which supports the latest hardware, while being able to do RHEL-targeted development in a way that feels completely native.
![][9]

### **Btrfs**

Fedora Workstation has been using Btrfs as its default file system since Fedora 33. Btrfs is a modern filesystem that is developed by many companies and projects. Workstation’s adoption of Btrfs came about through fantastic collaboration between Facebook and the Fedora community. Based on user feedback so far, people feel that Btrfs provides a snappier and more responsive experience, compared with the old ext4 filesystem.

With Fedora 34, new workstation installs now use Btrfs transparent compression by default. This saves significant disk space compared with uncompressed Btrfs, often in the range of 20-40%. It also increases the lifespan of SSDs and other flash media.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-34-workstation/

作者：[Christian Fredrik Schaller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/uraeus/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/f34-workstation-816x345.jpg
[2]: https://getfedora.org/workstation
[3]: https://forty.gnome.org/
[4]: https://lh3.googleusercontent.com/xDklMWAGBWvRGRp2kby-XKr6b0Jvan8Obmn11sfmkKnsnXizKePYV9aWdEgyxmJetcvwMifYRUm6TcPRCH9szZfZOE9pCpv2bkjQhnq2II05Yu6o_DjEBmqTlRUGvvUyMN_VRtq8zkk2J7GUmA
[5]: https://help.gnome.org/misc/release-notes/40.0/
[6]: https://lh6.googleusercontent.com/pQ3IIAvJDYrdfXoTUnrOcCQBjtpXqd_5Rmbo4xwxIj2qMCXt7ZxJEQ12OoV7yUSF8zpVR0VFXkMP0M8UK1nLbU7jhgQPJAHPayzjAscQmTtqqGsohyzth6-xFDjUXogmeFmcP-yR9GWXfXv-yw
[7]: https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/587
[8]: https://lh6.googleusercontent.com/PDXxFS7SBFGI-3jRtR-TmqupvJRxy_CbWTfjB4sc1CKyO1myXkqfpg4jGHQJRK2e1vUh1KD_jyBsy8TURwCIkgAJcETCOlSPFBabqB5yDeWj3cvygOOQVe3X0tLFjuOz3e-ZX6owNZJSqIEHOQ
[9]: https://lh6.googleusercontent.com/dVRCL14LGE9WpmdiH3nI97OW2C1TkiZqREvBlHClNKdVcYvR1nZpZgWfup_GP5SN17iQtSJf59FxX2GYqoajXbdXLRfOwAREn7gVJ1fa_bspmcTZ81zkUQC4tNUx3f7D7uD7Peeg2Zc9Kldpww
