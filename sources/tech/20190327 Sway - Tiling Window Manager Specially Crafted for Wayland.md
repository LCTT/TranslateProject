[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sway – Tiling Window Manager Specially Crafted for Wayland)
[#]: via: (https://itsfoss.com/sway-window-manager/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Sway – Tiling Window Manager Specially Crafted for Wayland
======

Tiling window managers are popular lightweight alternatives to full [desktop environments][1], especially among power users. Recently, a newer window manager reached its 1.0 release. This window manager, named Sway, is designed solely for systems that can use [Wayland][2]).

### What is a Tiling Window Manager?

A [tiling window manager][3] is a windows manager that organizes applications into a series of frames across the screen. These frames do not overlap, like the desktops that you are used to. Stacking windows managers, on the other hand, allow the applications to overlap. Such windows managers include [Fluxbox][4] and [Openbox][5].

For example, when you boot into a tiling window manager, you will see a blank screen (probably with a wallpaper). When you open your first application (say Firefox), it will take up the whole screen. Next, you open a terminal and a file manager. The frame that your first application is using will shrink to make room for the two new applications. You can have the frames for the terminal and a file manager take up the right third of the screen and stack on top of one another.

Tiling Window Manager in action ([Video Credit][6])

Since applications are stored in frames, you don’t need to use a mouse. Some tiling windows managers support the use of a mouse, but most are designed to be used solely with the keyboard. The idea is to work faster without having to constantly move your hand to the mouse and back again.

### Meet Sway Window Manager

![Fresh install of the Sway window manager][7]

According to the project’s [website][8], Sway is a “tiling Wayland compositor and a drop-in replacement for the i3 window manager for X11”. Since it is designed to replace i3, Sway supports all i3 setting and key-bindings. It is designed to work on both Linux and FreeBSD.

Note: If you are moving to Sway from i3, the Sway wiki has a [page][9] to help with the transition.

Sway just recently hit its [1.0 release][10]. The whole system was rewritten from scratch. It took 9,000 commits and 100,000 lines of code. According to the release notes, Sway is 100% compatible with i3, i3 IPC, i3-gaps, and i3bar. There are a couple features that were not included, such as “layout save/restore or features which only make sense on X11”.

As part of the development of Sway, the developers saw a [need for][10] “a stable & flexible common base library” for Wayland. To answer this need, they created [wlroots][11]. wlroots is used by [many other Wayland related projects][12] including the Librem 5.

[Drew Devault][13], the creator of the Sway project, doesn’t plan to rest on his laurels now that 1.0 is out. He had a list of features to add including:

  * Better Wayland-native tools for internationalized input methods like CJK
  * Better accessibility tools including improved screen reader support, high-contrast mode, a magnifying glass tool, and so on
  * Integration with xdg-portal & pipewire for interoperable screen capture
  * Improved touch screen support for use on the [Librem 5][14] and on [postmarketOS][15]
  * Better support for drawing tablets and additional hardware
  * Sandboxing and security features



![Sway window manager with open applications][16]

### Installing Sway Windows Manager

Note: Sway will not work with proprietary graphics drivers. If you have an Nvidia card, you’ll need to use the Nouveau driver.

I attempted to install Sway on Fedora 29. I chose Fedora because I knew that Fedora uses Wayland. However, when I entered `sudo dnf install sway` the latest version available in the Fedora repos was 0.15. I did some hunting around and found [a repo][17] with a more up-to-date version. I added the repo and was able to install quickly Sway.

### Experience with Sway

I’ve spent most of my life using the typical desktop metaphor. Needless to say, I was kinda lost when I logged into Sway. Thankfully, I found an [i3 keyboard reference sheet][18] that helped me figure out how to at least get started.

Ever after finding the reference sheet, I really felt lost because the workflow that I have used to years was not there. The tiling forced me to close applications that I did not need to recover screen space. On a regular system, I would have minimized that application until I needed it again.

I can see that using a tiling window manager could get a user to work faster and more efficiently. However, it would take a lot of practice and patience to get there.

When I was using Sway, I missed a lot of features and applications that I usually use, including my screenshot software. I think that was partly because they lack Wayland support, which should be fixed in the future.

**Final Thoughts on Sway**

Wayland is the future for desktop Linux, I think we can safely say that. So, I’m glad that people are working to created software for it. Most systems still depend on X11, so the Wayland applications can’t be used by everyone. But when they do, the Wayland applications will be mature and ready to use.

Have you ever used Sway? What is your favorite tiling windows manager? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][19].

--------------------------------------------------------------------------------

via: https://itsfoss.com/sway-window-manager/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-desktop-environments/
[2]: https://en.wikipedia.org/wiki/Wayland_(display_server_protocol
[3]: https://en.wikipedia.org/wiki/Tiling_window_manager
[4]: https://en.wikipedia.org/wiki/Fluxbox
[5]: https://en.wikipedia.org/wiki/Openbox
[6]: https://warosu.org/g/thread/44550594
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/sway-wm.jpg?ssl=1
[8]: https://swaywm.org/
[9]: https://github.com/swaywm/sway/wiki/i3-Migration-Guide
[10]: https://drewdevault.com/2019/03/11/Sway-1.0-released.html
[11]: https://github.com/swaywm/wlroots
[12]: https://github.com/swaywm/wlroots/wiki/Projects-which-use-wlroots
[13]: https://github.com/ddevault
[14]: https://itsfoss.com/librem-linux-phone/
[15]: https://postmarketos.org/
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/sway-wm2.jpg?ssl=1
[17]: https://thomas-leister.de/en/sway-window-manager/
[18]: https://i3wm.org/docs/refcard.html
[19]: http://reddit.com/r/linuxusersgroup
