[#]: subject: "GNOME 42 to Introduce a System-wide Dark Style Preference, Thanks to elementary OS"
[#]: via: "https://news.itsfoss.com/gnome-42-dark-style-preference/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNOME 42 to Introduce a System-wide Dark Style Preference, Thanks to elementary OS
======

There’s still time for GNOME 42, but it looks like it will implement a system-wide dark mode preference similar to [elementary OS 6][1].

If you have been reading our coverages, you must have noticed mentioning it as one of the [best elementary OS 6 features][2].

And for all the right reasons. Unlike a GTK theme change, elementary OS 6 approached the dark style preference as an opt-in preference that application developers can detect and choose to respect.

Even though this means that there’s more to be expected from the app developers, but when successful, it should result in a consistent dark mode experience.

In a [blog post][3] by GNOME developer _Alex_, he mentioned that GNOME would be following elementary OS’s approach while making it a standard to introduce a system-wide dark style preference in GNOME 42.

### Consistent Dark Mode Experience Even with Flatpak Sandbox

When it comes to a GTK theme, it is often a problem for Flatpak applications to inherit it because of the sandboxing.

However, with an implementation planned for GNOME 42, any application (including Flatpak apps) can access the settings portal and know the dark style preference without cutting down the security provided by the sandboxing.

This work aims to ensure that every type of application (built with any toolkit) and on any desktop should be able to detect and respect the dark style preference.

The only difference between elementary OS and GNOME’s implementation will be the use of libadwaita API with GNOME 42. You may want to check out an older [blog post][4] by Adrien, another GNOME developer, to know more about Libadwaita.

Alex also shared a video giving a sneak peek at how the transitions may look like (which is, of course, a work in progress).

![][5]

As you can notice, application developers need to update their applications to respect this preference to make the switch/transition from light/dark mode a seamless experience.

And, further, to bring this change to GNOME 42, there is a couple of significant development work remaining:

  * A preference option in the settings menu that’s easy to use (probably under “Background/Appearance” settings)
  * A switch in gnome-shell to quickly toggle the preference
  * Day/night scheduling option
  * A dark mode version of the wallpaper synchronized to the preference



### Wrapping Up

The core and first-party applications will have to support the dark style preference before GNOME 42 release to kick things off.

While third-party developers should also get on the bandwagon, given the difference this makes, it would take time for all your essential/favorite tools to support it.

_What do you think about GNOME 42 bringing a system-wide dark mode preference, following the footsteps of elementary OS? You are welcome to share your thoughts in the comments down below_.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-42-dark-style-preference/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/elementary-os-6-release/
[2]: https://news.itsfoss.com/elementary-os-6-features/
[3]: https://blogs.gnome.org/alexm/2021/10/04/dark-style-preference/
[4]: https://aplazas.pages.gitlab.gnome.org/blog/blog/2021/03/31/introducing-libadwaita.html
[5]: https://i0.wp.com/i.ytimg.com/vi/urXch15ySGU/hqdefault.jpg?w=780&ssl=1
