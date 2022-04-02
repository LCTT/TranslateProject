[#]: subject: "Nautilus File Manager Looks Amazing with GTK4 and Libadwaita – A Deep Dive"
[#]: via: "https://www.debugpoint.com/2022/03/gnome-files-43/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Nautilus File Manager Looks Amazing with GTK4 and Libadwaita – A Deep Dive
======
WE TEST-DRIVE THE DEVELOPMENT VERSION OF GNOME FILES VERSION 43 AND GIVE
YOU DETAILS ABOUT ITS LOOKS, FEATURES AND PERFORMANCE.
GNOME Files (formerly Nautilus) is perhaps the most used desktop application today in GNOME eco-space. And it never received much of an overhaul since its first release while the rest of the GNOME applications and the desktop itself moved to a newer tech stack.

Everything changes now. The GNOME developers are adopting GTK4 and libadwaita for the entire desktop and Files.

GNOME Files version 43, which would release with GNOME 43 release later in 2022, would be impressive. The much-needed [rework][1] brings native dark mode, great UI with nice libadwaita touch and GTK4 performance boost.

### GNOME Files 43

We installed the development Flatpak version of GNOME Files 43, and here’s what we found.

At first glance, you should notice the nice UI touch – thanks to Libadwaita. The close button is nice and round, while the address bar, selection highlighter, and entire Files window are all properly spaced with rounded corners.

The border highlighters are not present for all the components.

Here’s a quick comparison of the light and dark modes for versions 43 (left) and 42 (right).

![GNOME Files 43 and 42 – Light Mode Comparison][2]

![GNOME Files 43 and 42 – Dark Mode Comparison][3]

The address bar folder separator remains the same. However, the fonts are a little polished. The address bar context menu changed. The option is gone; instead, you get **Open in Other application** menu item. A new option, **Create Link**, is introduced. I think many users will miss the Open in Terminal option.

![New option in address bar menu][4]

Another significant change you should notice in the two main toolbar menus – a) view button and the b) main hamburger menu. Those context menu items show the keyboard shortcuts along with menu items. This makes them look a little more prominent as well.

![The Hamburger menu now have keyboard shortcuts][5]

The folder’s context menu now has a little up arrow pointing to the folder from where it popped up. The right-click context menu for a folder is well organized with groups. For example, the opening actions are grouped while cut, copy, paste are distinctively separate with a horizontal bar in the context menu.

![Context Menu for folder changes][6]

I also noticed a new option, “Paste into the folder”, which is nice.

The Nautilus Search remains almost the same as Files 42, except you can search by Created date/time in Files 43.

However, I noticed one exciting change. The application name for file association in the context menu is removed. For example, if you try to open a text document today in Files 42, it shows the application name associated with it in the context menu. In Files 43, it just shows “Open”. This change, I feel, was unnecessary. It was better earlier.

![A subtle change in context menu for file association][7]

So, that’s the overall changes I found in the new GTK4 version of this application. But it looks nice? Isn’t it. Moreover, if you are coming straight from Ubuntu 20.04 LTS, which contains Files 3.38, then perhaps your experience would be a “wow”. Most of the sections changed if you compare Files 43 with Files 3.38. It would be quite an experience for those users.

[][8]

SEE ALSO:   Access Google Drive and Sync Calendar in Ubuntu 16.04 using Nautilus

You should remember version 43 is still in development so that things may change in the coming days in the final shipment.

### Wish List

If I compare various Linux file managers, others have far more options than GNOME Files today.

I agree.

For example, Nemo or Dolphin – the two best file managers outsmart Files in various ways. To compare the features, GNOME Files doesn’t have some popular features –

  * Dual-pane or split view
  * Opening a root folder from the context menu is difficult
  * An up arrow for folder browsing
  * No option to create a new file (text, spreadsheet, etc.) from the context menu
  * More Sorting and Searching Functions



We hope these features come to GNOME Files soon.

### When it will be available

As stated above, this version of GNOME Files will be available with GNOME 43. Hence, you should have it on Ubuntu 22.10 during the October 2022 cycle and Fedora 37 later this year from the Linux Distribution schedule perspective.

Unfortunately, [Ubuntu 22.04 LTS][9] (Jammy Jellyfish) and [GNOME 42][10] with [Fedora 36][11] would not have GNOME Files 43. The primary reason is the schedule mismatch, and it is one of the complex applications to port to GTK4 and test thoroughly. However, most of the above stated internal features would still be available with Files 42. But it may lack the nice UI changes and theme.

That said, I believe the popular file manager looks nice, and users should be thrilled to use it when it releases. Let me know your opinion about the new changes in GNOME Files 43 below in the comment box.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][12], [Twitter][13], [YouTube][14], and [Facebook][15] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/gnome-files-43/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://gitlab.gnome.org/GNOME/nautilus
[2]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Files-43-and-42-Light-Mode-Comparison-1024x502.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Files-43-and-42-Dark-Mode-Comparison-1024x493.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/03/New-option-in-address-bar-menu-1024x267.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/03/The-Hamburger-menu-now-have-keyboard-shortcuts-1024x331.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/03/Context-Menu-for-folder-changes-1024x560.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/03/A-subtle-change-in-context-menu-for-file-association-1024x524.jpg
[8]: https://www.debugpoint.com/2016/05/access-google-drive-and-sync-calendar-in-ubuntu-16-04-using-nautilus/
[9]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[10]: https://www.debugpoint.com/2021/12/gnome-42/
[11]: https://www.debugpoint.com/2022/02/fedora-36/
[12]: https://t.me/debugpoint
[13]: https://twitter.com/DebugPoint
[14]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[15]: https://facebook.com/DebugPoint
