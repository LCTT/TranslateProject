[#]: subject: "I Tried System76’s New Rust-based COSMIC Desktop!"
[#]: via: "https://news.itsfoss.com/system76-rust-cosmic-desktop/"
[#]: author: "Community https://news.itsfoss.com/author/team/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

I Tried System76’s New Rust-based COSMIC Desktop!
======

If you didn’t know already, System76 developers have been [working on a new Desktop Environment][1] (dubbed COSMIC) written in [Rust][2]: a memory-safe and superfast programming language.

Creating a desktop environment from scratch is no small feat. That involves creating everything from the compositor, panel, window manager to the APIs for your desktop environment and other back-end tasks.

It is not an easy task, and maintaining it is another story.

And, it looks like System76 has already started working on it!

On GitHub, you will notice there is already a repository called [cosmic][3], but it is mainly in JavaScript (the language used to create GNOME shell extensions). This is the cosmic shell extension repository, which is what Pop!_OS ships with now.

There are a couple of newer repositories on their GitHub profile, which happen to be the elements of their upcoming Rust-based COSMIC Desktop.

So, it is time to build, test, and get an early look!

**Note:** _To clarify, the current GNOME-based desktop environment on Pop!_OS is COSMIC. This article discusses the Rust-based COSMIC desktop environment, built from scratch_, _meant to replace the current offering._

### Rust-based COSMIC Desktop Experience

The three repositories intended to be a part of the COSMIC desktop environment as a whole are

  * [Settings app][4]
  * [Top panel][5] (currently for X11 systems)
  * [Compositor][6] (appears to have support for native wayland, xwayland and X11 systems)



#### COSMIC Settings

![][7]

**Note:** This is a half-baked early preview to get an idea. The user interface can be fundamentally different as the development continues. So, hold your thoughts!

This is the settings app for Pop!_OS’s new COSMIC Desktop. It is currently WIP and not ready for use, although if you want to run it and play around with the GUI, feel free!

So, how does it look different from the current COSMIC experience?

![Rust-based COSMIC Settings vs. GNOME-based COSMIC][8]

When writing this, the GUI does not seem to be connected to any back-end APIs. Enabling and disabling “Enable top-left hot corner for Workspaces” toggle does not make a difference, nor does any other toggles, except for the information shown by the ‘About’ section of the Settings app.

Looking closer at the screenshot, the placements are messy but expected from an early preview (or prototype).

It looks like they are approaching everything with rounded corners and a cleaner look to it.

The toggle animation feels quick, smooth and snappy (even inside a virtual machine, cannot wait to try it on bare metal). Considering it’s not even functional, let’s forget about the performance.

![][9]

Personally, not a fan of the rounded corner look they are going with. GNOME’s implementation of rounded corners seems perfect to me. But, it should be interesting to see how it turns out.

#### Top Panel

As part of the COSMIC desktop environment, the top panel is also being implemented using Rust language.

As for the appearance of this top panel, I am not exactly sure how to test it without being unfair to it. Launching it from GNOME opens it behind the top bar that GNOME has. So I thought of opening it in a separate window manager (tried only with [bspwm][10] and [i3-wm][11] so far), but that resulted in some quirky behavior like the panel taking full vertical space like a normal GUI software.

#### COSMIC Compositor

The compositor for COSMIC desktop environment compiled successfully but would not launch when used with bspwm or i3-wm. I tried launching it in window managers because GNOME does not allow changing compositors.

This is due to the mess of video drivers in a virtual machine using VirtualBox and the fact that the COSMIC compositor is not ready.

But, there’s more!

Developer **Eduardo Flores** also tried the new COSMIC Desktop, sharing some screenshots of the app launcher and the dock in his [blog post][12].

![Credits: Eduardo Flores][13]

The application launcher looks similar, but built using GTK. Similarly, you can also expect a similar-looking application library, introduced with [Pop!_OS 21.10][14], and the good-old dock.

![Credits: Eduardo Flores][15]

### Concluding Thoughts

Sure, it is too early to tell where the development is heading.

It should take a while to expect a beta release for a full-fledged Rust-based COSMIC Desktop experience.

But, from what we’ve seen here, I am excited!

_What do you think? You are welcome to share your thoughts in the comments down below!_

_Originally written by [Pratham Patel][16]._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/system76-rust-cosmic-desktop/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/team/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/pop-os-cosmic-rust/
[2]: https://research.mozilla.org/rust/
[3]: https://github.com/pop-os/cosmic
[4]: https://github.com/pop-os/cosmic-settings
[5]: https://github.com/pop-os/cosmic-panel
[6]: https://github.com/pop-os/cosmic-comp
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4MyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM1MSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQwNCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[10]: https://github.com/baskerville/bspwm
[11]: https://github.com/i3/i3
[12]: https://blog.edfloreshz.dev/articles/linux/system76/rust-based-desktop-environment/
[13]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzNSIgd2lkdGg9Ijc3MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[14]: https://news.itsfoss.com/pop-os-21-10/
[15]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ4OSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[16]: https://itsfoss.com/author/pratham/
