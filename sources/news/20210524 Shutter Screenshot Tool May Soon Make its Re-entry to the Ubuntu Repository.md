[#]: subject: (Shutter Screenshot Tool May Soon Make its Re-entry to the Ubuntu Repository)
[#]: via: (https://news.itsfoss.com/shutter-0-96-release/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Shutter Screenshot Tool May Soon Make its Re-entry to the Ubuntu Repository
======

Only a few months back, [Shutter had its first major release in years][1] getting rid of the old libraries and dependencies.

Now, with a new 0.96 update, Shutter is prepping to make its way to the Ubuntu universe repository and other Linux distro repositories.

In case you did not know, Shutter was removed from the main Ubuntu repository and some other repos because outdated Gnome 2 libraries were dropped as well. Considering it is one of the best ways to [take a screenshot in Linux][2], Shutter getting back to repositories will be a good thing.

### Shutter 0.96 Release: What’s New?

With the latest 0.96 version release, Shutter aims to drop dependency on GTK 2 so that it could work just fine when included in the main Ubuntu repository.

Of course, [GTK 4][3] is the latest release that comes with GNOME 40, that will take a while for all Linux distros to adopt with their next upgrade.

However, Shutter 0.96 has managed to include **GTK 3 support**, better late than never.

With GTK 3 support onboard, it now relies on new dependencies that are present in the Ubuntu repositories. As per the [announcement][4], here’s a list of them:

  * Gtk3
  * Gtk3::ImageView &gt;= 9
  * GooCanvas2 
  * GooCanvas2::CairoTypes
  * Pango
  * libwnck-3



It is worth noting that while goocanvas was an optional dependency for older releases, goocanvas2 is essentially needed for it to work.

In case you’re curious about what’s gone, here’s a list for that:

  * Gtk2
  * Gtk2::ImageView
  * Gtk2::Unique
  * Gtk2::AppIndicator
  * Gnome2::Wnck
  * Goo::Canvas



Unfortunately, there are no significant feature additions with this release. In fact, a feature has been removed as per the announcement:

> The feature of taking a section of window is removed (or, rather, commented out), because it didn’t work with the way how modern Qt and Gtk were drawing their windows anyway.

It makes sense while it wasn’t the most used option for many users, I assume.

Also, there a few pointers mentioned in the release notes for potential issues which you can explore more about in their [GitHub page][5]:

  * Multiple screens might or might not be broken
  * HiDPI screens might do screenshot of a nested menu in a wrong place



[Download Shutter 0.96][6]

### Wrapping Up

While this is not entirely an exciting release for the users, the support for GTK 3 should help make Shutter available in the main Ubuntu repository.

Until then, you may have to rely on Linux Uprising’s PPA to get the latest release. It should be also available via [AUR][7] for Arch Linux users.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/shutter-0-96-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/shutter-0-95-release/
[2]: https://itsfoss.com/take-screenshot-linux/
[3]: https://news.itsfoss.com/gtk-4-release/
[4]: https://shutter-project.org/releases/0.96/
[5]: https://github.com/shutter-project/shutter
[6]: https://shutter-project.org/downloads/third-party-packages/
[7]: https://itsfoss.com/aur-arch-linux/
