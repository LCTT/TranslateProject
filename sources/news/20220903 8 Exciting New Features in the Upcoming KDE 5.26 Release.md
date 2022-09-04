[#]: subject: "8 Exciting New Features in the Upcoming KDE 5.26 Release"
[#]: via: "https://news.itsfoss.com/KDE-plasma-5-26-features/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

8 Exciting New Features in the Upcoming KDE 5.26 Release
======
KDE Plasma 5.26 is an exciting upcoming update with plenty of useful feature additions. Let's check it out.

![8 Exciting New Features in the Upcoming KDE 5.26 Release][1]

KDE Plasma, the popular desktop environment, has been receiving some major updates and tons of fixes over the last five months.

The previous release—Plasma 5.25—saw many new features and improvements, especially to the user interface and experience, and the next release sounds even more exciting.

### KDE Plasma 5.26: What's New?

Let's take a sneak peek at some new features coming to KDE Plasma 5.26.

#### 1. User Interface Improvements

Just like the last release, Plasma 5.26 brings in numerous refinements and how you interact with the UI. You will find subtle changes, and tweaks to **give more information to the users** while interacting/searching for things on KDE Plasma 5.26.

For instance, the Settings pages for “Format” and “Language” pages have now been merged to give you a cleaner look and get rid of some usual bugs associated with it.

Great work by **Han Young** for [merging these two pages][4]!

So, you can easily set default formats, and [set your address, name style, phone numbers][5], and more from these settings.

![KDE plasma 5.26][6]

Another example includes- if you add a shell script under the **Login Scripts** section in the system settings Autostart window, a warning is displayed if that script is not marked executable. Additionally, it also includes a button to make it executable in a single click.

Thanks to **Nicolas Fella** for this [contribution][7]!

![KDE plasma 5.26 screenshot][8]

Not to forget, the "Cover" and "Flip" task switch Effects used a Plasma dialog as the background.

The same UI components used in the overview effects are now applied instead, giving a more consistent look. This includes a uniform background and blurring effect too.

Thanks to **Ismael Asensio** for this [addition][9]!

![KDE plasma 5.26 screenshot][10]

Similarly, more UI betterment include:

* Polishing KDE apps for a cleaner UX.
* Adjustments to the system settings for a cleaner look.
* Improvements to configure a folder for sharing with Samba.
* Refinements to the Dolphin file manager UI.

#### 2. Dolphin's New Selection Mode

Users, especially those using a touchscreen, can easily select or deselect items by performing a long press on a folder or file, just like on a smartphone. If you're using a mouse and keyboard, pressing the space bar will enter or exit this optional mode.

A context menu with a range of options will also be displayed, just like the right-click menu.

Kudos to **Felix Ernst** for this cool [addition][11]!

![KDE plasma 5.26 screenshot][12]

#### 3. New "Compact" Mode for Kickoff 

Kickoff, Plasma's native application launcher, now supports a new mode called Compact view.

As the name suggests, the contents have been scaled down so that more items are visible. Do note that this setting is not ideal for users using Touch Mode and is thus disabled.

Awesome work by **Nate Graham** for this helpful [addition][13]!

![KDE plasma 5.26 screenshot][14]

#### 4. Non-Blurry XWayland Apps

Wayland users with HiDPI screens face many issues related to the scaling of apps. To counter this, users have two options to choose how their XWayland apps would be scaled.

One way is to allow uniform scaling using the compositor, which may lead to slight blurriness.

The other one is to allow the apps to scale themselves. Do note that apps that support pre-existing X11 HiDPI will only benefit from this setting.

There's even a help icon added to each of the options that elaborates what the option does, so users get a clearer idea.

Kudos to **David Edmundson and Aleix Pol Gonzales** for adding the scaling feature and **Nate Graham**for the [help tooltips][15]!

![KDE plasma 5.26 screenshot][16]

#### 5. Support for More Hardware and Firmware Data

The "**About This System**" page in System Settings has been updated to support newer hardware and firmware. Apple Mac/Macbook users will be pleased to know that support for the Apple M1 is also included.

Thanks to **James Calligeros** for this [addition][17]!

![KDE plasma 5.26 screenshot][18]

#### 6. Enhancements to Discover

KDE's flagship app store—Discover—has received a couple of helpful additions that should help users avoid confusion when choosing software.

For instance, Discover will display a message box if the beta version of the software is being viewed on the app page. Moreover, a warning will also be displayed if the beta channel is outdated or older than the stable channel.

![KDE plasma 5.26 screenshot][19]

If the software is an add-on, the “Distributed by” label won't show the project's source unlickable URL anymore, but display "KDE Store" instead.

Moreover, users can finally set the notification frequencies accordingly for any software updates.

Great work by **Aleix Pol Gonzalez** for all these amazing additions!

#### 7. Re-bindable Mouse buttons

![mouse extra button config KDE plasma][20]

If you use a mouse that has extra buttons, you can assign those to keystrokes or keyboard shortcuts.

This was made possible by **David Rdondo**, a pretty good feature with KDE Plasma 5.26!

#### 8. Launch Executable files from File searches

With KDE Plasma 5.26, you get a prompt when you try to open an executable that find through file searches.

You can either execute the file or open it. I think this is a pretty useful addition.

#### 🛠️ Other Features and Improvements

Apart from the key highlights listed above, there are tons of other additions and plenty of bug fixes.

Some extra refinements worth noting include:

* Ability to set and track two different calendars simultaneously under the main calendars.
* Elisa player has a full-screen mode.
* Resizable panel widget pop-ups.
* Preview desktop wallpapers with a single click without applying.
* Wallpapers automatically adjust the image according to the active light or dark color scheme.
* Option to disable middle-click paste for Wayland session.
* Switching between widgets using the “Alternate” panel saves the settings of the older widget.

💬 *Are you excited about the changes coming to KDE Plasma 5.26? Share your thoughts in the comments down below.*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/KDE-plasma-5-26-features/

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/KDE-5-26-release.png
[4]: https://invent.KDE.org/plasma/plasma-workspace/-/merge_requests/1147
[5]: https://bugs.KDE.org/show_bug.cgi?id=430801
[6]: https://news.itsfoss.com/content/images/2022/08/more-things-to-configure.webp
[7]: https://invent.KDE.org/plasma/plasma-workspace/-/merge_requests/878
[8]: https://news.itsfoss.com/content/images/2022/08/needs-to-be-executable.webp
[9]: https://invent.KDE.org/plasma/KDEplasma-addons/-/merge_requests/168
[10]: https://news.itsfoss.com/content/images/2022/08/switchui.webp
[11]: https://bugs.KDE.org/show_bug.cgi?id=427202
[12]: https://news.itsfoss.com/content/images/2022/08/selection-mode-in-dolphin.jpeg
[13]: https://invent.KDE.org/plasma/plasma-desktop/-/merge_requests/699
[14]: https://news.itsfoss.com/content/images/2022/08/compact_mode.png
[15]: https://invent.KDE.org/plasma/kscreen/-/merge_requests/108
[16]: https://news.itsfoss.com/content/images/2022/08/kscreen-kcm-help-in-a-tooltip.webp
[17]: https://invent.KDE.org/plasma/kinfocenter/-/merge_requests/104
[18]: https://news.itsfoss.com/content/images/2022/08/m1-in-about.webp
[19]: https://news.itsfoss.com/content/images/2022/08/bender-old-beta.jpeg
[20]: https://news.itsfoss.com/content/images/2022/09/KDE-plasma-5-26-mouse-buttons.png