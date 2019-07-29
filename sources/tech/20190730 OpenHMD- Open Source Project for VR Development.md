[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (OpenHMD: Open Source Project for VR Development)
[#]: via: (https://itsfoss.com/openhmd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

OpenHMD: Open Source Project for VR Development
======

In this day and age, there are open-source alternatives for all your computing needs. There is even an open-source platform for VR goggles and the like. Let’s have a quick look at the OpenHMD project.

### What is OpenHMD?

![][1]

[OpenHMD][2] is a project that aims to create an open-source API and drivers for immersive technology. This category includes head-mounted displays with built-in head tracking.

They currently support quite a few systems, including Android, FreeBSD, Linux, OpenBSD, mac OS, and Windows. The [devices][3] that they support include Oculus Rift, HTC Vive, DreamWorld DreamGlass, Playstation Move, and others. They also offer support for a wide range of languages, including Go, Java, .NET, Perl, Python, and Rust.

The OpenHMD project is released under the [Boost License][4].

### More and Improved Features in the new Release

![][5]

Recently, the OpenHMD project [released version 0.3.0][6] codenamed Djungelvral. ([Djungelvral][7] is a salted licorice from Sweden.) This brought quite a few changes.

The update added support for the following devices:

  * 3Glasses D3
  * Oculus Rift CV1
  * HTC Vive and HTC Vive Pro
  * NOLO VR
  * Windows Mixed Reality HMD support
  * Deepoon E2
  * GearVR Gen1



A universal distortion shader was added to OpenHMD. This additions “makes it possible to simply set some variables in the drivers that gives information to the shader regarding lens size, chromatic aberration, position and quirks.”

They also announced plans to change the build system. OpenHMD added support for Meson and will remove support for Autotools in the next (0.4) release.

The team behind OpenHMD also had to remove some features because they want their system to work for everyone. Support for PlayStation VR has been disabled because of some issue with Windows and mac OS due to incomplete HID headers. NOLO has a bunch of firmware version, many will small changes. OpenHMD is unable to test all of the firmware versions, so some version might not work. They recommend upgrading to the latest firmware release. Finally, several devices only have limited support and therefore are not included in this release.

[][8]

Suggested read  To Do App Remember The Milk Is Now Available For Linux

They accounted that they will be speeding up the OpenHMD release cycle to get newer features and support for more devices to users quicker. Their main priority will be to get “currently disabled devices in master ready for a patch release will be priority as well, among getting the elusive positional tracking functional for supported HMD’s.”

### Final Thoughts

I don’t have a VR device and have never used one. I do believe that they have great potential, even beyond gaming. I am thrill (but not surprised) that there is an open-source implementation that seeks to support many devices. I’m glad that they are focusing on a wide range of devices, instead of focussing on some off-brand VR effort.

I wish the OpenHMD team well and hope they create a platform that will make them the goto VR project.

Have you ever used or encountered OpenHMD? Have you ever used VR for gaming and other pursuits? If yes, have you encountered any open-source hardware or software? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][9].

--------------------------------------------------------------------------------

via: https://itsfoss.com/openhmd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/openhmd-logo.png?resize=300%2C195&ssl=1
[2]: http://www.openhmd.net/
[3]: http://www.openhmd.net/index.php/devices/
[4]: https://github.com/OpenHMD/OpenHMD/blob/master/LICENSE
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/virtual-reality-development.jpg?ssl=1
[6]: http://www.openhmd.net/index.php/2019/07/12/openhmd-0-3-0-djungelvral-released/
[7]: https://www.youtube.com/watch?v=byP5i6LdDXs
[8]: https://itsfoss.com/remember-the-milk-linux/
[9]: http://reddit.com/r/linuxusersgroup
