[#]: subject: "Exciting New Features Revealed for KDE Plasma 5.25! Take a Look Here"
[#]: via: "https://news.itsfoss.com/plasma-5-25-features/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "PeterPan0106"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Exciting New Features Revealed for KDE Plasma 5.25! Take a Look Here
======

[KDE Plasma 5.24][1] was an interesting upgrade with an updated breeze theme and the new overview effect.

Now, the developers have geared up to introduce exciting new features for KDE Plasma 5.25.

### KDE Plasma 5.25: What’s New?

In a blog post by Nate Graham, some of the most intriguing changes were highlighted. Let us take a look at them here.

#### Ability to Selectively Apply the Global Theme

![Credits: Pointiestick Blog / Nate Graham][2]

When you proceed to apply a Global Theme from the system settings, you will be prompted to confirm if you want the theme to be applied everywhere or to certain parts of it.

For instance, you may not want to change the cursors and icons but the window background and application style.

Overall, you get more control when applying the Global Theme to your KDE-powered system.

Impressive work by **Dominic Hayes** for this [merged commit][3].

#### Auto-Generated Accent Based on Current Wallpaper

Having the ability to choose a custom or a preset accent is already good enough.

With KDE Plasma 5.25, they are getting one step ahead by giving the option to generate and select an accent color based on the current wallpaper.

And, it all happens automatically as you change the wallpaper, given that you have the option enabled.

You can find the option to enable it here:

![Credits: Pointiestick Blog / Nate Graham][4]

So, if you want something to match your background, you do not have to tweak around the custom accent colors to get it right. This should make things easier.

A small but mighty addition to the arsenal of new features. All thanks to **Tanbir Jishan** for this [merged commit][5].

#### Tint Color Scheme with Accent Color

For even greater customization to the look/feel, KDE Plasma 5.25 will let you add a tint to your selected accent color.

![Credits: Jan Blackquill][6]

You can enable/disable it if you like the user experience with the tinted theme.

To explore more about this change in the [merged commit][7] by **Jan Blackquill**.

#### Create Desktop Files for Flatpak/Snap Applications

Initially, sandboxed applications like Flatpak and Snap did not have the support for desktop files on KDE.

Thanks to a new **Dynamic launcher** portal (via [merged commit][8] by Harald Sitter). It allows you to create and edit .desktop files for seamless system integration with sandboxed applications.

#### Improvements to Discover

There are some subtle changes to the Discover software center where you can find all the application categories in the sidebar without needing to navigate through categories like “Applications”, “Add-ons”, and “Plasma Add-ons” separately.

KDE Discover Before vs After (Credits: **[Taavi Juursalu][9]**)

Use the cursor to slide through the before/after in the images above.

To explore more about the change, head to its [merged request][10].

#### Other Improvements

There are several other refinements and changes planned for KDE Plasma 5.25. Some of them include:

  * Improvements to the performance of KRunner
  * Network widget adds details for frequency and BSSID of the Wi-Fi network



You can look at all the bug fixes and technical improvements in [Nate’s blog post][11].

_Exciting about KDE Plasma 5.25? Well, with these feature additions, I am eagerly awaiting its release. Let me know your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/plasma-5-25-features/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[PeterPan0106](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/kde-plasma-5-24-lts-release/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijc3OSIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[3]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1043
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijc3OCIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[5]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1325
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjExNDMiIHdpZHRoPSIxNTU4IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIvPg==
[7]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1620
[8]: https://invent.kde.org/plasma/xdg-desktop-portal-kde/-/commit/d5f958e149705e27bbba9f3bbec659ff5bed1d80
[9]: https://invent.kde.org/taavi
[10]: https://invent.kde.org/plasma/discover/-/merge_requests/234
[11]: https://pointieststick.com/2022/04/22/this-week-in-kde-major-accent-color-and-global-theme-improvements/
