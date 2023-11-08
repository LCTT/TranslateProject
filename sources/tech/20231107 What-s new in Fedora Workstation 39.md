[#]: subject: "What’s new in Fedora Workstation 39"
[#]: via: "https://fedoramagazine.org/whats-new-fedora-workstation-39/"
[#]: author: "Merlin Cooper https://fedoramagazine.org/author/mxanthropocene/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What’s new in Fedora Workstation 39
======

![][1]

Cover image by [Jackub Steiner][2]

Fedora Workstation is the premier open source desktop operating system, built by a worldwide community including you! This article describes some of the major user-facing changes in the latest version, Fedora Workstation 39. Get it today from the [Fedora Workstation webpage][3], or upgrade your existing install within the Software app or with _[dnf system-upgrade][4]_ in your favourite terminal emulator!

### GNOME 45

Fedora Workstation 39 includes the latest version of the GNOME desktop environment, GNOME 45. This version features stylish new widgets in several core apps, a brand new Image Viewer app, a new keyboard backlight setting on supported systems, a more informative Activities button, improved performance, and many other refinements to the user experience all throughout. More details are available in the [GNOME 45 release notes][5].

#### Little big things

GNOME 45 features several refinements all throughout the experience. Here are just a few:

  * A dynamic workspace indicator replaces the static Activities button. This new indicator is more informative, showing the number of workspaces and the currently-focused one all at a glance.



![The new dynamic workspace indicator][6]

  * A new camera activity indicator appears when accessing a camera via Pipewire. This joins the microphone, screencast, and screen recording indicators.
  * The Quick Settings menu features a new keyboard backlight setting on supported hardware.



![The new keyboard backlight setting][7]

  * The default cursors have been redesigned, fixing several long-standing issues with the original set.
  * The Adwaita-qt and QGnomePlatform Qt themes are no longer available in Fedora Workstation 39. Qt apps now use the upstream default theme.



#### Core apps

Many apps in GNOME 45 now use the new user interface widgets featured in libadwaita **1.4. This gives them a beautiful two-tone design with sidebars extending to the full height of the window. Not only does this look great, it also enhances the apps’ adaptability, making them easier to use with smaller window sizes. More details are available [here][8]. Additionally, the new headerbar widget enhances visual separation between the headerbar itself and the window’s contents.

![Files, Settings, and Calendar showing the new sidebar widget][9]

Fedora Workstation 39 features GNOME’s new Image Viewer app, internally known as Loupe. It has been written from the ground-up for high performance and adaptability using Rust, GTK 4, and libadwaita.

![The new Image Viewer app \(artwork shown in screenshot is public domain\)][10]

Several smaller refinements have been made in the core apps. Among many others are the following:

  * The Settings app features a new System Details section, a new keyboard layout viewer, easier to understand descriptions, and better keyboard navigability.



![The new System Details window][11]

  * Better ordering of search results in Files.
  * It is now possible to remove user data when uninstalling Flatpaks in the Software app.



![The new prompt shown when uninstalling a Flatpak app][12]

  * Line-by-line scrolling and more useful search results in Calendar.
  * Support for copying files, images, and text when using RDP connections in Connections.



#### Performance improvements

GNOME 45 features a number of performance improvements.

  * Hardware-accelerated video decoding is now automatically preferred, where possible.
  * Thumbnailing in the Files app is now multithreaded.
  * Cursor stutter and latency is significantly reduced.
  * Search performance is greatly enhanced in GNOME Shell and within several apps, including Files, Software, and Characters.



Several performance improvements have also been made across the whole stack, including in GLib, GTK’s OpenGL renderer, and systemd. A lot of these performance optimisations would not have been possible without the enabling of frame pointers in the previous version of Fedora Workstation!

### Under-the-hood changes throughout Fedora Linux 39

Fedora Linux 39 features many under-the-hood changes. Here are some notable ones:

  * Fedora Linux 39 now features a coloured Bash prompt by default!



![The coloured Bash prompt][13]

  * The Noto fonts are now the default for languages using the Indic script. This replaces the older Lohit font set.
  * The [modular][14] repository is no longer available in Fedora Linux 39 due to low usage and lack of active maintenance.
    * The Fedora Module Build Service will be sunset around the end-of-life of Fedora Linux 38, i.e. in May 2024.



### Also check out…

Cool happenings throughout the Fedora Project!

  * November 6, 2023 marks the Fedora Project’s 20th anniversary. Keep your eye on Fedora Magazine for a special 20th anniversary article! 🎉



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-workstation-39/

作者：[Merlin Cooper][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mxanthropocene/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/10/f39workstation-816x345.jpg
[2]: https://fedoraproject.org/wiki/User:Jimmac
[3]: https://fedoraproject.org/workstation/
[4]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
[5]: https://release.gnome.org/45/
[6]: https://fedoramagazine.org/wp-content/uploads/2023/10/Activites5-1.gif
[7]: https://fedoramagazine.org/wp-content/uploads/2023/10/Keyboard.png
[8]: https://blogs.gnome.org/alicem/2023/09/15/libadwaita-1-4/
[9]: https://fedoramagazine.org/wp-content/uploads/2023/10/New-sidebars-1024x545.png
[10]: https://fedoramagazine.org/wp-content/uploads/2023/10/Screenshot-from-2023-10-20-02-54-42.png
[11]: https://fedoramagazine.org/wp-content/uploads/2023/10/Screenshot-from-2023-10-20-02-58-49.png
[12]: https://fedoramagazine.org/wp-content/uploads/2023/10/image-1.png
[13]: https://fedoramagazine.org/wp-content/uploads/2023/10/Screenshot-from-2023-10-20-03-14-17.png
[14]: https://docs.fedoraproject.org/en-US/modularity/
