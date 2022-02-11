[#]: subject: "First Look at the Maui Shell – The Future of Linux Desktop"
[#]: via: "https://www.debugpoint.com/2022/01/maui-shell-first-look-1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

First Look at the Maui Shell – The Future of Linux Desktop
======
WE TEST DRIVE THE BRAND NEW MAUI SHELL. HERE’S THE FIRST LOOK ON THIS
AMAZING VISION OF LINUX DESKTOP.
The Nitrux OS team recently announced a brand new “convergent” Linux user interface named “Maui Shell” that works across all form factor devices. The team gave us some screenshots of their vision of real convergent Linux desktop with several UI models and its functions.

Right now, KDE Plasma and GNOME – the two major Linux Desktop have their own mobile variant. And the respective ecosystem apps are slowly developed to work across mobile and desktops. For example, there are several GNOME Circle Apps (for example GNOME Web) already runs in both desktop and GNOME based mobile OS (i.e. Phosh).

### The Maui Shell

The Nitrux OS team (the team behind Maui Shell) already ships KDE Plasma based Nitrux OS with its native apps (e.g. Index File Manager). With that in mind, the new Maui Shell is completing their vision of a simple desktop with the same set of native application – that works in Tablets, Mobile phones, and traditional Linux desktops.

The idea is interesting, and from the screenshots it looks insane.

![MAUI Shell in Desktop-1][1]

![MAUI Shell in Mobile Phone][2]

![MAUI Shell in Tablet Mode][3]

#### First Look in our test run

The code is very unstable at the moment and many features are still under development.

So, with that said, I was trying to compile the source of Maui shell for a couple of days and eventually managed to compile successfully after troubleshooting several dependency and Qt related package issues.

Here’s a quick view of how it works, just after a fresh compile.

When you first experience Maui Shell, it definitely feels a combination of GNOME and KDE Plasma. Not exactly same. But the best of both the worlds.

Let’s get into the components and its designs one by one.

#### Cask and Zpace

The Maui Shell consists of a shell layer called . And it comes with its own compositor called **Zpace**. Both of them are designed from ground up. The Shell takes care of the panels, cards, pop up menus and Zpace handles the windows, their positions into the Cask containers.

#### The Top Panel

At the top, Maui shell has a panel that has two sections. The left section of the top panel is for notifications, calendar and date/time. The right section gives you quick access to several major controls – such as – Wi-Fi, volume, display brightness, login/logout menu and other options.

The top panel is not spanned across the entire top section of the desktop – which is kind of efficient use of the screen space, in my opinion. And one of the interesting take is when you move a window towards the panel, the window goes behind the panel items to use the entire desktop space.

![The Top Panel remains at top and window is behind][4]

The popup menus are fairly animated and have around 4px rounded corners in all four corners. The only design I feel can be improved is the gap between the panel items and drop down menus. I hope, it changes in future iterations.

![The gap between panel items and cards][5]

#### The Bottom Dock

At the bottom, there is a dock with default two options. A main launcher and workspace summary view. The dock is visible all time by default; but can be hidden with mouse-down or swipe-down gesture. And it can be visible again intelligently when you move the pointer to the dock indicator.

![Dock hide animation][6]

Cool? Isn’t it.

[][7]

SEE ALSO:   Nitrux 2.0.0 Brings Default XanMod Kernel 5.16, Visual Uplifts + More

The dock also adapts with icons when you start opening multiple applications. The dock icons also have nice little indicators (a dot and a dash) to show which apps are in focus. How cool is that!

![Focus items are in dash][8]

The main launcher design is well thought of. The launcher has a search bar at the top which searches for applications and files in your system. Then followed by categorized group of applications. Those individual category groups can be browsed to get inside to launch any application. The launcher adapts itself for various form factors and supports multiple pages.

Another interesting feature is when you open the launcher, the background applications remain visible and the launcher opens on the top. This is very helpful, specially when you are working with multiple applications.

![Main Launcher open while background windows are visible][9]

The icon beside launcher gives you an overview of your workspace by showing the list of open windows or apps with a blurred background. This is similar to the KDE Plasma’s activities overview. However, like the launcher, this overview also paints itself on top of the desktop.

For example, if you open launcher, then click on overview – the launcher remains open in the background. It doesn’t go away. Neat trick.

You should also notice that, the workspace view doesn’t have the dock or the top panel.

![The workspace view shows all open apps][10]

_For more details, visit the [announcement][11] and follow the project in [GitHub][12]._

#### Upcoming work and features

As of writing this, there are a huge list of ongoing items that are expected to arrive in the future, possibly before Beta. A quick list is below.

Missing features

  * Multiscreen support
  * Session manager
  * Settings center
  * XWayland shell extension



Work in progress features

  * Pulseaudio
  * Bluetooth via Bluedevil
  * Drag and drop
  * Network toggles
  * Workspaces
  * MPRIs control.
  * Launcher
  * Dock and Panels
  * XDG-shell extension



#### When is the stable release?

As per the official announcement, a stable release of Maui Shell is expected on September 2022. Before that, an Alpha copy is expected in March 2022 followed by a Beta around June 2022.

### Closing Notes

The only item I am curious to know is how the UI adapts itself in multi display situations. Think about, you plugged a mobile phone with Maui shell to an external monitor. Does the external monitor display the desktop layout while the mobile phone is showing the phone layout? Don’t know. Let’s hope the developers get around those use cases and implement the best possible solution.

So, what is your take on this desktop? Is it going to be a game changer? Let me know in the comment section below.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][13], [Twitter][14], [YouTube][15], and [Facebook][16] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/maui-shell-first-look-1/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/01/MAUI-Shell-in-Desktop-1-1024x617.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/01/MAUI-Shell-in-Mobile-Phone-1024x421.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/01/MAUI-Shell-in-Tablet-Mode-1024x380.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/01/The-Top-Panel-remains-at-top-and-window-is-behind.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/01/The-gap-between-panel-items-and-cards.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/01/Dock-hide-animation.gif
[7]: https://www.debugpoint.com/2022/01/nitrux-2-0-release/
[8]: https://www.debugpoint.com/wp-content/uploads/2022/01/Focus-items-are-in-dash.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/01/Main-Launcher-open-while-background-windows-are-visible-1024x555.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/01/The-workspace-view-shows-all-open-apps-1024x565.jpg
[11]: https://nxos.org/maui/introducing-maui-shell/
[12]: https://github.com/Nitrux/maui-shell/
[13]: https://t.me/debugpoint
[14]: https://twitter.com/DebugPoint
[15]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[16]: https://facebook.com/DebugPoint
