[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Explore the night sky with this open source astronomy app)
[#]: via: (https://opensource.com/article/21/1/kstars)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Explore the night sky with this open source astronomy app
======
Stargaze from your Linux desktop or Android device with KStars.
![Open source stars.][1]

I have always been fascinated with the night sky. When I was younger, the only reference materials available were books, and they seemed to depict a sky that looked different from the one I saw from my home.

More than five years ago, I wrote about my experiences with two open source planetarium apps, [Celestia and Stellarium][2]. Recently, I read about another: [KStars][3]. It's an amazing open source application that helps engage children (and adults) in science and astronomy. Its website says:

> "KStars is free, open source, cross-platform astronomy software. It provides an accurate graphical simulation of the night sky, from any location on Earth, at any date and time. The display includes up to 100 million stars, 13,000 deep-sky objects, all 8 planets, the Sun and Moon, and thousands of comets, asteroids, supernovae, and satellites."

KStars is part of the [KDE Education Project][4]. The latest version, available for Linux, Windows, and macOS, integrates [StellarSolver][5], a cross-platform SExtractor, a program that builds a catalog of objects from an astronomical image.

### Installing KStars

KStars is freely licensed under the GPLv2.0. The source code is available on the official [KDE GitLab instance][6] and as a read-only mirror on GitHub. The KDE Education Project has excellent [installation documentation][7].

I'm using [Pop!_OS][8] and found KStars in the Pop!_Shop.

You can install KStars on Linux from your distribution's software repository. KStars Lite is available for Android from the [Google Play store][9]. The KDE Project maintains an excellent [KStars Handbook][10] to assist users.

### Using KStars

After installation, launch the program from your Applications menu. A startup wizard guides you through the initial setup.

![KStars Startup Wizard][11]

(Don Watkins, [CC BY-SA 4.0][12])

The directions are easy to follow. The wizard prompts you to set your home location; unfortunately, my small village was not listed, but a larger nearby community was.

![KStars location setup][13]

(Don Watkins, [CC BY-SA 4.0][12])

You also have the opportunity to download additional data and extra features for the program.

![KStars add-ons][14]

(Don Watkins, [CC BY-SA 4.0][12])

There are many options available. I chose "Common images displayed in the detail window."

Once you're finished with the setup, KStars presents a map of the night sky as it appears from your location.

![KStars night sky display][15]

(Don Watkins, [CC BY-SA 4.0][12])

It displays the current local time in the upper-left corner (5:58pm on November 30, 2020, in this image).

Using the left mouse button, you can move the display left, right, up, and down. You can zoom in and out using the mouse's scroll wheel. Placing the mouse cursor over an object and right-clicking describes the object you're looking at.

![KStars describes objects][16]

(Don Watkins, [CC BY-SA 4.0][12])

### Get involved

KStars is actively soliciting help with bug reports, astronomy knowledge, code, translations, and more. The lead developer and maintainer is [Jasem Mutlaq][17]. If you'd like to contribute, please visit the [project's website][18] or join the mailing list to learn more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/kstars

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opensourcestars.png?itok=hnrMETFh (Open source stars.)
[2]: https://opensource.com/education/15/7/open-source-apps-explore-night-sky
[3]: https://edu.kde.org/kstars/
[4]: https://edu.kde.org/
[5]: https://github.com/rlancaste/stellarsolver
[6]: https://invent.kde.org/education/kstars
[7]: https://edu.kde.org/kstars/install.php
[8]: https://pop.system76.com/
[9]: https://play.google.com/store/apps/details?id=org.kde.kstars.lite&hl=en
[10]: https://docs.kde.org/trunk5/en/extragear-edu/kstars/index.html
[11]: https://opensource.com/sites/default/files/uploads/kstars_startupwizard.png (KStars Startup Wizard)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://opensource.com/sites/default/files/uploads/kstars_setlocation.png (KStars location setup)
[14]: https://opensource.com/sites/default/files/uploads/kstars_addons.png (KStars add-ons)
[15]: https://opensource.com/sites/default/files/uploads/kstars_sky.png (KStars night sky display)
[16]: https://opensource.com/sites/default/files/uploads/kstars_objectdescription.png (KStars describes objects)
[17]: https://github.com/knro
[18]: https://edu.kde.org/kstars
