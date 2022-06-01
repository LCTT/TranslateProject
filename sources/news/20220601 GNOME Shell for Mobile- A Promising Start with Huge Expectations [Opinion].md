[#]: subject: "GNOME Shell for Mobile: A Promising Start with Huge Expectations [Opinion]"
[#]: via: "https://www.debugpoint.com/2022/06/gnome-shell-mobile-announcement/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNOME Shell for Mobile: A Promising Start with Huge Expectations [Opinion]
======
The GNOME devs gave ideas about porting GNOME Shell entirely to a mobile phone in a recent blog post. Here are some insights about the project.

### GNOME Shell for Mobile Phones

GNOME as a desktop environment evolved over the last decade to become [GNOME 40][1]. The GNOME 40 was a significant release that changed the complete user interface design with a modern approach.

Looking at how GNOME 40 is designed, you may feel that the Shell and its underlying tech are ready for smaller screens. Because the gesture-driven workspaces, icons grid, and dock – somehow feel closer to a mobile operating system such as Android than a desktop environment.

Moreover, the system tray, calendar, notifications and the native apps – can efficiently work well in smaller form factor devices. Thanks to GTK4 and libadwaita, the design is responsive, and the looks of apps and controls match a mobile platform well.

After GNOME 40, the GNOME developers worked on several concepts of GNOME Shell for smaller form factor devices such as tablets and mobile phones.

#### Why Now?

The development and research efforts cost time and money for any project. Although there are donations to GNOME from major tech companies, this time a “Prototype Fund” helped the team to carry on with this effort. The [Prototype Fund][2] is a grant program supporting public interest software by the German Ministry of Education (BMBF).

#### What is in scope?

Designing a complete mobile user interface and integrating it with a mobile operating system is a very complex project. It requires a well-designed vision to support thousands of mobile hardware and user support. Not to mention, the privacy and security of users on a mobile device.

![GNOME Shell Running on a prototype Pinephone][3]

Hence, with this fund, the team concentrates on a proof of concept that caters to some essential user interactions in GNOME Shell.

* Launcher
* Application Grids
* Swipe, gestures and navigations
* Search with mobile keyboard
* Detect screen size and screen rotation support
* Workspaces and multitasking
* Settings
* on-screen keyboard

![GNOME Shell Mobile mock-up][4]

It is always important to remember that a mobile experience is much more than just the user interface. Also, GNOME itself is not an operating system. It consists of the underlying stable operating system, which gives much-needed privacy and security. Plus, the “App Store” like the concept. The phone manufacturers need to work with GNOME devs for their products to adopt this concept.

#### The Progress

The team gave us a quick demo of the progress made while writing this article. See yourself in the below video.

![][5]

The complex task is to recognize various gestures in a touchscreen mobile. For example, you may use long touch, a short touch, a two-finger swipe and drag, and many possibilities that are only feasible in a small form factor device. It requires an absolute rework in the respective GNOME shell components.

And developing them entirely on the existing GNOME Shell base is challenging work.

Furthermore, the team uses the famous Pinephone Pro for development and testing. The Pinephone is already a commercial product featuring the “friendly neighbour” KDE Plasma mobile and other Linux OSes.

![][6]

### Conclusion

And if all goes according to plan, we all may get a native GNOME experience in a complete open-source mobile phone. And you can have your privacy back!

On a side note, I am not sure what will happen to Phosh (which is also based on GNOME). Although Phosh is developed and managed by Purism, it will be interesting to see what direction both GNOME Shell for mobile initiative and PHosh takes in the coming days.

So, what do you think about the prospects of this project? Let me know in the comment box below.

*[Image and video credits: GNOME Developers. Via blogs.][7]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/gnome-shell-mobile-announcement/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/gnome-40
[2]: http://www.prototypefund.de
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/GNOME-Shell-Running-on-a-prototype-Pinephone.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/GNOME-Shell-Mobile-mock-up.jpg
[5]: 
[6]: 
[7]: https://blogs.gnome.org/shell-dev/2022/05/30/towards-gnome-shell-on-mobile/
