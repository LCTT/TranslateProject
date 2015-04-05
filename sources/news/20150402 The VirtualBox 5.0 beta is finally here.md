Translating ictlyh
The VirtualBox 5.0 beta is finally here
=======================================
**Oracle's desktop virtualization software gets its first major point revision in almost five years, but the changes are more evolutionary than revolutionary.**

VirtualBox, the open source virtualization system originally created by Sun and now under Oracle's stewardship, has released its first revision to the left of the decimal point in nearly five years.

Don't expect anything truly revolutionary, though, judging from the release notes for and the behavior of the beta itself. With this release, VirtualBox picks up a bit more polish, both visually and technologically, but its main advantage over VMware remains with its offer of a free incarnation of many of the same core features.

The last major version of VirtualBox 4.0 was released in December 2010, and it delivered a heavily reworked version of the program with a new GUI, new virtual hardware, and a reorganized project design. But the pace of major releases for the project was slow, with the last major release (version 4.3) arriving in late 2013. Everything since then has been officially designated as a "maintenance" release.

**VirtualBox 5.0**

*The first beta of VirtualBox 5.0 adds features like the ability to edit the menus and shortcut icons for VM windows, as shown here.*

Among the biggest changes for VirtualBox 5.0 is support for more instruction set extensions that run with hardware-assisted virtualization. The AES-NI instruction set, typically used for hardware acceleration of encryption, and the SSE 4.1 and SSE 4.2 instructions sets were included among them. Also new is paravirtualization support for Windows and Linux guests, a new architecture for abstracting host audio, and support for USB 3 (xHCI) controller in guests.

Most of the usability updates are improvements to the VirtualBox GUI. One big change is the ability to customize the menus and the toolbar for individual virtual machines so that little- or never-used options can be removed entirely. Another major addition is the ability to encrypt virtual volumes from within the VirtualBox interface, rather than relying on the guest OS's own disk-encryption system (assuming it has one).

Oracle warns that this is beta software and should be treated accordingly. Sure enough, the main GUI and the guest OS windows all sport black-and-red Beta warnings in one corner. But a Windows 10 VM created with the previous VirtualBox release (4.3.26) booted and ran fine, and the 5.0 version of the VirtualBox Guest Additions -- for better video support, bidirectional copy and paste, and other features -- installed without issues. (Fixes to better support Windows 10 have been showing up since version 4.3.18.)

No word has been given yet on when the final version of 5.0 will be out, but Oracle [encourages users][1] to download and try out the beta -- in a nonproduction environment -- and file bug reports with their [beta feedback forum][2].

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2905098/virtualization/oracle-virtualbox-5-0-beta-is-finally-here.html

作者：[Serdar Yegulalp][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Serdar-Yegulalp/
[1]:https://forums.virtualbox.org/viewtopic.php?f=15&t=66904
[2]:https://forums.virtualbox.org/viewforum.php?f=15
