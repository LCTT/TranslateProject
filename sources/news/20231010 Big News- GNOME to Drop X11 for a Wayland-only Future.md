[#]: subject: "Big News! GNOME to Drop X11 for a Wayland-only Future"
[#]: via: "https://news.itsfoss.com/gnome-wayland-xorg/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Big News! GNOME to Drop X11 for a Wayland-only Future
======
GNOME is choosing to go the Wayland way. But, is it the right move? Too
soon? What do you think?
We have been increasingly seeing the [X11 windowing system][1] being phased out in favor of [Wayland][2], and with a recent merge request, we are seeing yet another major name from the Linux space opting for the same.

Allow me to take you through this.

**What's happening:** I recently came across an article from [Phoronix][3] that spotted the new [merge request][4] opened in the GitLab repos of GNOME titled “ **session: Remove x11 session targets** ”.

This has been dubbed by GNOME developer, [Jordan Petridis][5], as the **first step towards removing the X11 session from GNOME**.

![][6]

With the main reason behind this decision, the following:

> X11 has been receiving less and less testing. We have been defaulting to the wayland session since 2016 and it's about time we drop the x11 session completely.

Well, that seems like the logical thing to do, especially seeing when X11 has been the center of many functionality-breaking bugs, and is quite older than Wayland.

**However, there have been a few concerns.**

On the above-mentioned merge request and another related [draft merge request][7] for completely removing X11 code from GNOME, a few people have raised some questions.

Take, for instance, [Jehan][8], a _maintainer of GIMP_ , mentioned that even though Wayland may be ready for different types of use cases, it is not quite there for graphics professionals thanks to the **lack of color management**.

Even [Joshua Strobl][9] (the creator of [Budgie][10] desktop) had some **critical views of this move** , stating the following:

> What do you expect the fallout to be of this removal for desktop environments which currently support X11 and leverage GNOME Session? Both Budgie Desktop and Pantheon Desktop, both of which are working on moving to Wayland, currently only fully support X11.

> These desktop environments leverage gnome-session for their session launching currently. If the removal of this support prevents the launching of those desktop environments, then it seems premature for this support to be removed.

Similarly, the consensus among many is that **plenty of existing apps and operating systems might face issues if X11 were to be completely removed**.

![][11]

One of the **suggestions to avoid breakage** , was to fork 'gnome-session' and do your tweaks for running X11, another was to have **some sort of alternate version** with the X11 session code in it.

Nevertheless, **this change is going to happen** , and GNOME will not feature X11 support in the near future when all is said and done.

**When to Expect:** Well, according to GNOME dev, [Michael Catanzaro][12], **the initial merge request for removing X11 session is meant to act as a 'jump-scare'** for users and developers to take notice.

The draft state of the merge request for the final removal of X11 code from GNOME just means “do not merge”, but they do intend to merge it eventually.

**As for when?**

According to Michael, this will take some time, and **GNOME 48 is the most likely candidate** for the implementation of this change.

That puts it in **a far away timeline of March 2025** , which should be enough time for people to adapt to this upcoming change.

_💬 What do you think of this major shift from X11 to Wayland on GNOME? Are you for it or against it?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-wayland-xorg/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/X_Window_System
[2]: https://wayland.freedesktop.org/
[3]: https://www.phoronix.com/news/GNOME-MR-Drop-X11-Session
[4]: https://gitlab.gnome.org/GNOME/gnome-session/-/merge_requests/98
[5]: https://gitlab.gnome.org/alatiera
[6]: https://news.itsfoss.com/content/images/2023/10/GNOME_Remove_Xsession_1.png
[7]: https://gitlab.gnome.org/GNOME/gnome-session/-/merge_requests/99
[8]: https://gitlab.gnome.org/Jehan
[9]: https://github.com/JoshStrobl
[10]: https://buddiesofbudgie.org/
[11]: https://news.itsfoss.com/content/images/2023/10/GNOME_Remove_Xsession_2.png
[12]: https://gitlab.gnome.org/mcatanzaro
