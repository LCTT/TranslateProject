[#]: subject: "Here’s What Devs Are Planning for GNOME 43"
[#]: via: "https://news.itsfoss.com/gnome-43-dev-plans/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Here’s What Devs Are Planning for GNOME 43
======

It hasn’t been that long since GNOME 42 was released.

While it was an exciting upgrade over GNOME 41, you may not be able to find it on every mainstream Linux distribution (except OpenSUSE, Arch, and Clear Linux).

Fedora 36 and Ubuntu 22.04 should be the most popular options featuring GNOME 42 with their releases in the following weeks.

What’s next? **GNOME 43**, yes.

### GNOME 43: Planned New Features

In a [blog post][1], a GNOME developer (Chris Davis) shared some improvements/changes planned for GNOME 43 and beyond.

Let me highlight some major highlights of it.

Note that the planned changes or improvements mentioned here may/may not debut with GNOME 43.

#### Global Accent Colors

![Accent colors in Ubuntu 22.04 Beta][2]

With the introduction of Libadwaita, it is now possible to add a feature for global accent colors.

You do not have to depend on the distribution to provide the ability to use accent colors (just like one [added to Ubuntu 22.04][3]).

The GNOME desktop experience can be more personalized with the accent colors. Moreover, it will not be limited just presets, but customizable accent colors, which will be opt-in for app developers.

#### Recoloring API

![][4]

While this is not particularly interesting for the end-users, it will help app developers offer preset color schemes and let their app blend in better with various accent colors.

As per the blog post:

> Developers using the recoloring API will be able to programmatically change colors in their apps and have dependent colors update automatically. They’ll be able to easily create presets which can be used, for example, to recolor the window based on a text view’s color scheme.

This is technically already possible with CSS in libadwaita 1.0. However, the API should make things easier to implement.

#### Adaptive Nautilus File Manager

![][5]

The Nautius file manager will receive some upgrades like adaptive design for mobile form factor with a new file chooser mode within it.

It will help the GNOME platform keep up with new features without relying on GTK’s file chooser, which does not support all GNOME feature like starred files.

#### New Image Viewer (Loupe) + Screenshot Annotation

A new image viewer, a.k.a. Loupe is in development, written in Rust using GTK4 and libadwaita.

![][6]

The image viewer is aimed to be adaptive, touchpad and touchscreen friendly, and easy to use. You can expect it to be integrated with Nautilus to follow sorting settings for any folder in the file manager.

In addition to the integration, the new image viewer will also receive some feature upgrades in the form of basic image editing capabilities like cropping, rotation, and annotations.

![][7]

With the annotations’ capability, it must work well with the screenshot flow, allowing you to take screenshots and annotate them without any third-party programs.

#### New Design for Disk Usage Analyser (Rewritten in Rust)

The Disk Usage Analyzer is currently written in Vala.

While it does the work expected, it does not have a lot of potential with the way it is now.

![Design Mockups for Disk Usage Analyzer, Credits: Allan Day][8]

So, the development plans include rewriting it using Rust, which should improve it for the foreseeable future, providing the best performance.

![Design Mockups for Disk Usage Analyzer, Credits: Allan Day][9]

Not just limited to its core, it will also receive a design overhaul (similar to the mockups above) in a bid to modernize the user experience.

### Other Improvements

As development progresses, we should hear more about the planned changes to the GNOME shell and more.

I will be updating this article with more GNOME 43 features as we learn more about it.

If you are curious about the technical details, you can head to the [blog post by Chris][1]. You can also sponsor his work on GNOME and anything related to it.

_What are your expectations from GNOME 43? Let me know your thoughts in the comments down below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-43-dev-plans/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://blogs.gnome.org/christopherdavis/2022/04/03/plans-for-gnome-43-and-beyond/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4OSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://news.itsfoss.com/ubuntu-22-04-accent-color/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4MSIgd2lkdGg9Ijc2OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ5NyIgd2lkdGg9Ijc2OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYyMCIgd2lkdGg9IjcyMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUyMyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY4MCIgd2lkdGg9Ijc2MyIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY4MiIgd2lkdGg9Ijc1OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
