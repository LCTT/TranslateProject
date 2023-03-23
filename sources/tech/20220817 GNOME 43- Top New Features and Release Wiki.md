[#]: subject: "GNOME 43: Top New Features and Release Wiki"
[#]: via: "https://www.debugpoint.com/gnome-43/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNOME 43: Top New Features and Release Wiki
======
An extensive feature analysis of the GNOME 43 desktop environment bringing impactful changes to your day-to-day needs and workflow.

![GNOME 43 Running via GNOME OS][1]

This article summarises all necessary information about GNOME 43, including features, release schedule and more. The GNOME 43 release (upcoming) is probably the most impactful release since the GNOME 40 in terms of the features and their impact on your workflow.

The feature includes updated and faster Shell performance, wrapping up GTK4 and libadwaita conversion, renovated Files and fantastic Web changes.

All these necessary changes were long overdue and will change your traditional workflow in the GNOME desktop to make you more productive.

### Schedule

The BETA is out. The release candidate is expected on September 3rd, 2022. GNOME 43 finally releases on September 21, 2022.

* GNOME 43 Beta: August 31, 2022 (Complete)
* GNOME 43 RC: September 3, 2022
* GNOME 43 final release: September 21, 2022

### GNOME 43: The Features

#### 1. Core Shell Changes

* Finally, the high-resolution scroll wheel support lands in GNOME thanks to recent work in Wayland. So, if you have a high-resolution display, scrolling with an advanced mouse (such as Logitech MX Master 3) should be a treat for you.
* In addition to the above, the direct scanout support in GNOME 43 will help with multi-monitor setup situations.
* The server-side decorations get essential colour support.
* Shell also implemented a feature where the notifications get away when the focus changes, and it doesn’t wait for the timeout.
* Like every release, you experience better animation performance across the desktop, improved grid and overview navigation and critical updates, which gives you a seamless experience.

So, that are the key summaries of the core changes. Now, let’s talk about the Quick settings.

#### 2. New Quick Settings Menu

The quick settings in the system tray are entirely changed. The quick settings items and menus now feature pill-shaped toggle buttons with vibrant colours to show what is happening in your system. The menu is also dynamic and makes way for cascading menu items. In addition, you can choose the audio devices in the quick settings.

Here’s a quick demo, and for additional screenshots and write-up – read our exclusive coverage: [GNOME 43 Quick settings][2].

![Quick Settings Demo in GNOME 43][3]

#### 3. Files

GNOME Files gets the most features in GNOME 43 release. The list of improvements in this application is enormous. The file manager is the most used app in any desktop environment. Hence the changes in Files are the most impactful across the user base.

For the first time, Files with GTK4 arrive (it was not ready during GNOME 42 release), and it will change your workflow for good.

I will try to explain most of them in a brief list. Otherwise, this will be a lengthy post. I will push out another separate article on the File features.

##### Adaptive sidebar

So the sidebar of Files which gives you access to navigations, favourites, network drives, etc. – is not responsive. And it [autohides][4] itself when Files window size reaches a point. A familiar and handy feature if you work with many open windows and have smaller displays.

Another exciting feature is that when the sidebar is wholly hidden, an icon appears at the left top for you to make it visible.

![Files 43 with autohide sidebar][5]

##### Emblems

We had the emblems in GNOME long back, and they went away. So, Emblems make a comeback with GNOME 43 with small icons beside the files and directories. These icons imply the type, such as symbolic link, read-only, etc. Moreover, the icons change their colour based on your theme, and multiple emblems are also available for a single file.

![Emblems in GNOME 43][6]

##### Rubberband Selection

Next up is the much-awaited rubberband selection feature, which [finally arrived][7]. Now you can select the files and folders by drag-selection mechanism. One of the most requested features from the users.

![Rubberband Selection Feature][8]

##### GtkColumnView replacing GtkTreeView

When you mouse over the items in the column view, you see a focused row which is another critical feature of Files in GNOME 43. But the [tree view could not make it][9] and probably planned for the next iteration.

![GtkColumnView enables row focus][10]

##### Redesigned properties window with interactive permission and executable detection

The properties window is [wholly changed][11], thanks to the adaptation of GTK4. The window is now much cleaner and well-designed, showing essential items only when required.

Furthermore, the properties dialog can determine the file type and provide suitable options. For example, if you view the properties of a shell script or text file, you will get an option to make it executable. In contrast, the properties of an image file do not give you an executable option.

![Intelligent properties window][12]

**Tabbed View improvements**

The tabbed view of Files gets some [additional updates][13]. The most noteworthy ones are the proper focus when dragging a file to tag, the creation of tabs after the current focussed tab and so on.

**Redesigned Right-click menu**

The primary right-click context menu on files or folders is restricted. Firstly, the OPEN option is clubbed under a submenu. Secondly, the copy/paste/cut options are consolidated in a group. And finally, the Trash, Rename and Compress options are grouped.

In addition, the Open in terminal option is available for all files and folders. However, create a new file option is still missing (which I expected in this release).

![Various Context Menu][14]

##### Other changes in Files

Other prominent changes in Files are the Trash icon, and other locations (network drive, disk) gets the properties option in right-click context menu.

Finally, the Files preference window was revamped to show you more essential items. The redesign makes it easy for the average user to find the proper Files settings.

#### 4. Web

Let’s spare some moments to talk about our beloved Epiphany, a.k.a. GNOME Web, the WebKit-based native web browser for the GNOME desktop.

The updates were long overdue and finally started landing from this release onwards.

First and foremost, GNOME Web now supports WebExtension API. It lets you download and install the Firefox and Google Chrome extensions inside the Web. Here’s how you can do it.

* Download any extension file (xpi or crx file) from Firefox Add-on or Google Chrome extension page.
* Click on the hamburger menu and select Extensions.
* Finally, click add to install them.

WebExtension support is a crucial step for making the Web usable soon.

Secondly, the Firefox Sync option is available, which lets you log in to the Web via a Firefox account to sync bookmarks and other browser items.

![Login to the Web using a Firefox account][15]

Other noteworthy changes in the Web include support for “view source”, GTK4 porting work and an updated PDF library (PDF.js 2.13.216).

One of the critical components which are still missing in Web is the [WebRTC support via GStreamer][16]. Once that feature arrives, it will be a decent browser for daily usage.

Hopefully, one day, we all have a decent alternative browser which is non-Firefox or non-Chromium.

#### 5. Settings

In the settings window, mostly improvements and visual fine-tuning arrive in this release. The important change includes the “Dog Bark” sound in Alert is gone now after a long and [interesting conversation][17].

In addition, a new device security panel is introduced, and the TImezone map in the Date & Time panel is revamped.

The settings sidebar is also responsive and gives you autohide features like the Files shown above.

#### 6. Software

Two crucial changes are coming to GNOME Software. These changes enable you to view more information on a single page for any application.

Firstly, a new section, “Other apps by Author”, gives you a list of apps by the author of the current app. This helps in discovery and tells you how popular the creator is.

Secondly, GNOME 43 Software now provides you with a detailed list of permission required by the Flatpak apps in a separate window. Hence, you can verify the app before you install them.

Another crucial visual change is a new “Available for Fedora/any distro” section on the application main overview page, which requires configuration.

![Other APPS by developer section in Software][18]

#### 7. Climate Change Wallpaper

I am not sure whether this feature landed. Because I could not find it, but I heard about it. So, I though I should mention it here.

The feature is that GNOME 43 brings a background wallpaper showing how the global temperature has risen over the decades from [ocean stripes][19]. The wallpaper contains vertical colour-coded bars denoting low and high temperatures. I think it’s a nice touch and an effort to raise awareness. Here’s the [commit][20] in GitLab.

In addition, a couple of new [“days and nights”][21] fresh wallpapers are available.

That’s all about the essential changes I could find and summarise here. Besides those, a vast list of bug fixes, performance improvements and code clean up lands in GNOME 43.

Fedora 37 will feature GNOME 43 when released, and some parts of it should be in Ubuntu 22.10, due in October.

### Wrapping Up

GNOME 43 is an iconic release because it changes several basic designs and impacts millions of users’ workflow. The quick settings transformation is fantastic and long overdue. In addition, the necessary changes in Files, Web and Settings will improve your productivity.

Furthermore, the new features arrive while keeping the design guideline and aesthetics in mind. A good user interface requires a well-thought-out process, and the devs did a perfect job in this release.

So, that’s pretty much it. That’s GNOME 43 for you. Let me know if you plan to get this update and want to hop from KDE to GNOME!

Do let me know your favourite feature in the comment section below.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-43/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/GNOME-43-Running-via-GNOME-OS.jpg
[2]: https://www.debugpoint.com/gnome-43-quick-settings/
[3]: https://www.debugpoint.com/?attachment_id=10682
[4]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/877
[5]: https://www.debugpoint.com/?attachment_id=10684
[6]: https://www.debugpoint.com/?attachment_id=10685
[7]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/817
[8]: https://www.debugpoint.com/wp-content/uploads/2022/08/Rubberband-Selection-Feature.gif
[9]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/817
[10]: https://www.debugpoint.com/wp-content/uploads/2022/08/GtkColumnView-enables-row-focus.gif
[11]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/745
[12]: https://www.debugpoint.com/wp-content/uploads/2022/08/Intelligent-properties-window.jpg
[13]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/595
[14]: https://www.debugpoint.com/?attachment_id=10689
[15]: https://www.debugpoint.com/wp-content/uploads/2022/08/Login-to-Web-using-Firefox-account.jpg
[16]: https://twitter.com/_philn_/status/1490391956970684422
[17]: https://discourse.gnome.org/t/dog-barking-error-message-sound/9529/2
[18]: https://www.debugpoint.com/wp-content/uploads/2022/08/Other-APPS-by-developer-section-in-Software.jpg
[19]: https://showyourstripes.info/s/globe/
[20]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/commit/a142d5c88702112fae3b64a6d90d10488150d8c1
[21]: https://www.debugpoint.com/custom-light-dark-wallpaper-gnome/
