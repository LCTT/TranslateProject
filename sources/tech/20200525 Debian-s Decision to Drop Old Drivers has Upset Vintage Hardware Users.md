[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Debian’s Decision to Drop Old Drivers has Upset Vintage Hardware Users)
[#]: via: (https://itsfoss.com/debian-dropping-old-drivers/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Debian’s Decision to Drop Old Drivers has Upset Vintage Hardware Users
======

It is always a tough decision to drop support for older hardware for the latest Linux distribution releases. Just like [Ubuntu decided to drop support for 32-bit systems][1], Debian’s X Strike Force (XFS) team decided to drop a list of input and video drivers.

### Debian is considering to drop support for really old hardware

![][2]

In case you didn’t know, the XFS team is responsible for maintaining packages the [X Window System][3] in [Debian][4]. And, the list of drivers that [they want to remove][5] are:

  * xserver-xorg-input-aiptek
  * xserver-xorg-input-elographics
  * xserver-xorg-input-mtrack
  * xserver-xorg-input-mutouch
  * xserver-xorg-input-void
  * server-xorg-video-ast
  * xserver-xorg-video-mach64


  * xserver-xorg-video-neomagic
  * xserver-xorg-video-r128
  * xserver-xorg-video-savage
  * xserver-xorg-video-siliconmotion
  * xserver-xorg-video-sisusb
  * xserver-xorg-video-tdfx
  * xserver-xorg-video-trident



So, Mach 64, [ATI Rage R128][6], Savage, Silicon Motion, SiS, Trident, and NeoMagic are some of the graphics chipsets that would be affected. The reason (as stated by them) to drop these drivers is:

> They are either unmaintained upstream or provide no value to the distribution.

Now, that could make sense, if the packages are no longer maintained. But, upstream some of these X.org drivers are still **maintained** even if there are no frequent updates to them. For instance, in 2018, a [new display driver update was released for the ATI RAGE 128][7], as reported by Phoronix.

### Vintage hardware owners are going to be upset

Obviously, the vintage hardware users aren’t quite happy with the decision because a handful of people still own (or actively use) old hardware i.e. around 20 years older.

From the original list of drivers mentioned in the [bug report][5], **Geode display driver** was initially decided to be removed but wasn’t dropped.

It was also reported that the “**xserver-xorg-video-r128**” driver is required for older Apple hardware (iMac). And, a user reported about the missing video driver on his iMac.

For most of the users, this decision may not actually affect any “production” systems because I don’t think anyone is probably going to utilize 20-year old hardware for commercial purposes.

The hobbyists and collectors who like to preserve older tech are surely going to be impacted by this decision.

### Wrapping Up

In my opinion, dropping the support for incredibly dated hardware is not entirely a bad move.

But, if there is a demand for the support of vintage hardware, the fair share of users who want the drivers to be added in Debian should help maintain those packages. If not, I don’t think it won’t be a wise choice to have an unmaintained piece of code in Debian.

What do you think about this? Feel free to share your thoughts in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/debian-dropping-old-drivers/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-drops-32-bit-desktop/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/debian-bug-report-driver-drop.jpg?ssl=1
[3]: https://en.wikipedia.org/wiki/X_Window_System
[4]: https://www.debian.org/
[5]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=955603
[6]: https://en.wikipedia.org/wiki/ATI_Rage_series
[7]: https://www.phoronix.com/scan.php?page=news_item&px=ATI-RAGE-128-DDX-6.11.0
