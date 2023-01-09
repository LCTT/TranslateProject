[#]: subject: "What’s new in GNOME 43?"
[#]: via: "https://opensource.com/article/22/10/whats-new-gnome-43-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What’s new in GNOME 43?
======

I love the [GNOME][1] desktop, and I use it as my daily [Linux desktop environment][2]. I find with GNOME, I can focus on the stuff I need to get done, but I still have flexibility to make the desktop look and act the way I want.

The GNOME Project recently released GNOME 43, the latest version of the GNOME desktop. I met with GNOME developer Emmanuele Bassi to ask a few questions about this latest release:

**Jim Hall (Jim): GNOME has lots of great desktop features. What are some of the new features in GNOME 43?**

**Emmanuele Bassi (Emmanuele):** GNOME 43 has a complete redesign of the system status menu in the Shell. The new design is meant to give quick and easy access to various settings: network connections and VPNs; audio input and output sources and volumes; toggling between light and dark styles. It also has a shortcut for taking a screenshot or starting a screen recording.

GNOME core applications have also been ported to the new major version of the GNOME toolkit, GTK4. GTK4 is more efficient when it comes to its rendering pipeline, which leads to smoother transitions and animations. Additionally, GNOME applications use libadwaita, which provides new UI elements and adaptive layouts that can seamlessly scale between desktop and mobile form factors.

The GNOME file manager, Nautilus, is one of the applications that has been ported over to GTK4 and libadwaita, and it has benefitted from the new features in the core platform; it’s now faster, and it adapts its UI when the window is resized.

The system settings can now show device security information, including manufacturing errors and hardware misconfiguration, as well as possible security issues like device tampering. Lots of work is planned for future releases, as device security is an area of growing concern.

**Jim: What do you love most about GNOME 43?**

**Emmanuele:** The most important feature of GNOME, one that I constantly take advantage of and that I always miss when I have to deal with other operating systems is how much the OS does not get in the way of what I’m doing. Everything is designed to let me concentrate on my job, without interruptions. I don’t have bells and whistles constantly on my screen, competing for attention. Everything is neatly tucked away, ready to be used only when I need to.

**Jim: Many folks are familiar with GNOME today, but may not be familiar with its history. How did GNOME get started?**

**Emmanuele:** GNOME started in 1997, 25 years ago, as a project for using existing free and open source components to create a desktop environment for everyone that would be respectful of users’ and developers’ freedom. At the time there were only commercial desktops for Unix, or desktops that were based on non-free components. Being able to take the entire desktop, learn from it, and redistribute it has always been a powerful motivator for contributors—even commercial ones.

Over the past 25 years, GNOME contributors have worked not just on making the desktop, but creating a platform capable of developing and distributing applications.

**Jim: Open source projects keep going because of a strong community. What keeps the GNOME community strong?**

**Emmanuele:** I don’t pretend to speak for everyone in the project, but for myself I think the main component is the respect of every voice within the community of contributors, which comes from the shared vision of creating an entirely free and open platform. We all know where we want to go, and we are all working towards the same goal. Sometimes, we may end up pulling in different directions, which is why donating to entities like the GNOME Foundation, which sponsor gatherings and conferences, is crucial: they allow a more comprehensive communication between all the involved parties, and at the end we get better results for it.

GNOME also takes very seriously respectful communication between members of the community; we have a strong code of conduct, which is enforced within the community itself and covers all venues of communication, including in person events.

**Jim: GNOME established the Human Interface Guidelines (HIG) to unify the GNOME design and GNOME app interfaces. How did the HIG come about?**

**Emmanuele****:**The Human Interface Guidelines (HIG) came into being after Sun did a usability study on GNOME 1, one of the very first usability studies for a free software project. The findings from that study led to the creation of a standardized document that projects under the GNOME umbrella would have to follow, which is how we ended up with GNOME 2, back in 2002.

The HIG was a rallying point and a symbol, a way to demonstrate that the entire project cared about usability and accessibility, and it provided the tools to both desktop and application developers to create a consistent user experience.

Over the years, the HIG moved away from being a complete checklist of pixels of padding and grids of components, and instead it now provides design principles, UI patterns, conventions, and resources for contributors and application developers. The HIG now has its own implementation library, called libadwaita, which application developers can use when targeting GNOME, and immediately benefit from a deeper integration within the platform without having to re-implement the various styles and patterns manually.

_Thanks to Emmanuele Bassi for answering this interview. You can find GNOME at_[_https://www.gnome.org/_][3]

_Read the release announcement for GNOME 43 at_[_https://release.gnome.org/43/_][4]

_Learn about what’s new in GNOME 43 for developers at_[_https://release.gnome.org/43/developers/_][5]

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/whats-new-gnome-43-linux

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/article/19/12/gnome-linux-desktop
[2]: https://opensource.com/article/20/5/linux-desktops
[3]: https://www.gnome.org/
[4]: https://release.gnome.org/43/
[5]: https://release.gnome.org/43/developers/
