[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Advice for getting started with GNOME)
[#]: via: (https://opensource.com/article/20/6/gnome-users)
[#]: author: (Opensource.com https://opensource.com/users/admin)

Advice for getting started with GNOME
======
The GNOME desktop is a unified interface for Linux that offers lots of
extensions to customize your experience. Here's some advice from GNOME
users on how to get the most from it.
![Digital images of a computer desktop][1]

GNOME is one of the most popular Linux desktops today. It started as a humble desktop called the GNU Network Object Model Environment (GNOME) and was built on top of the GIMP GTK libraries. Its 1.0 release [was announced in 1999][2], just two years after the project got started.

Today, the most widely used Linux distributions provide GNOME 3 as their graphical desktop, and it's a great place to start learning Linux. As with any open source desktop, GNOME is extremely amenable to customization. You can alter and add to GNOME until it best suits your unique style of work.

But the eternal question is: should you?

We asked GNOME users their thoughts on this question, and some argue it's easier to learn GNOME (and Linux in the process) by using the desktop as delivered from the GNOME developers.

> Going against the grain, I’d recommend using stock GNOME first and getting completely comfortable with it before delving into any extensions. —John Allison

> GNOME may need some getting used to. It might turn out to be indigestible, or it might turn out to be the single best way to interact with a Linux machine. Your mileage may vary. —Alexey Rusakov

> I don’t necessarily like the idea of recommending extensions. While they can be useful, every time someone complains about GNOME being unstable, it ends up being due to some sort of extension. Sometimes I feel as though recommending extensions to GNOME users creates the culture of installing a ginormous number of extensions to make GNOME something that it isn’t, and then the entire desktop comes crashing down. For me, my policy is to use as few extensions as possible. I really like the default GNOME layout with few or no changes. —Jay LaCroix

It was a common theme among the responses—users new to GNOME should learn GNOME before changing it.

### New users

GNOME is deceptively simple—when you turn on your Linux computer, you end up on a desktop with only a few obvious prompts. There's the Activities menu in the upper left corner of the screen and a typical system tray in the upper right.

Clicking on the Activities menu reveals an overlay containing an application dock. Clicking on the grid icon on the dock shows your installed applications.

Default apps include the same kinds of services you'd expect from any other desktop—a file manager, PDF reader, network manager, system settings or control panel, and so on. There are also some unexpected but nice defaults. For instance, GNOME includes a robust [virtualization application][3].

GNOME has worked its way into becoming the unifying interface for most Linux users. While each distribution has its own convention for package management, software development practices, and nearly everything else, GNOME is a unified front. If you learn GNOME, you learn a common "language" for interacting with the graphical side of Linux.

GNOME works hard at consistency, too. For instance, one key that is often ignored on keyboards is the Super key, which is the key with (usually) a Windows logo on it, or the Command key on Mac. GNOME uses this as a global hotkey, meaning that, no matter what application you're in, the Super key always talks to GNOME (any application can use the Super key, but few do). That means you have access to desktop functions regardless of what window is currently in focus.

That's not true for most key combos based around Control or Alt. Being able to "jump" out of an application to access desktop functions is an underrated feature, and once you get used to it, you start to miss it when using other desktops.

Here's some insight from our responders about acclimating to the GNOME way of doing things:

> Learn one environment well, and then you may try other ones. —Marcin Juszkiewicz

> Learn some of the handy shortcuts before attempting to define your own.
>
>   * Super+Arrowup to maximize a window
>   * Super+Arrowup to minimize a window
>   * Super+Arrowleft or Super+ArrowRight to tile the window to take up half the screen
>   * Super+PageUP or Super+PageDown to change workspace
>   * Launch apps: Super, and then type 3-4 letters of the app you want to Launch (for example, f-i-r-e for Firefox, and so on)
>   * Calculations: Super, and then type a simple equation (9*9) for a quick calculation
>

>
> It’s a beautiful desktop, and it makes learning a new environment fun. Then again, learning something new can also be hard, so if you’re a new user, most of the people responding to us agreed that a slow and steady approach is best. Get familiar with your surroundings before jumping to change everything. —Andreas Nilsson

> This might be a tough habit to unlearn for many users, but change from _mouse first_ to _Super key first_ for window switching, desktop navigation, launching, and searching. —Tim Quinlan

### Built-in help

Need help? There is a tutorial built-in.

> We have a Help application in GNOME that gets launched at first boot. It has quick videos showing how to launch applications, manage windows and workspaces, and more. You can always find the Help application by searching for it in the Activities screen, or launch help from a terminal. —Felipe Borges

### Get more apps

Getting to know a desktop is one thing, but a desktop can only do so much. Obviously, at some point, you're going to want more applications so you can get work done.

GNOME has an "app store" called Software that offers hundreds of open source applications you can install with a single click. It's topical, convenient, and easy.

![GNOME software installer][4]

### Experienced users

If you're used to trying out different Linux desktops, then customizing your environment is nothing new to you. For GNOME, the easiest and most obvious way to customize the desktop beyond what GNOME provides you in Settings is [Tweaks][5], available from your Software app.

![GNOME tweaks menu][6]

Tweaks lets you customize practically anything—themes, the buttons that show up in your window bars, GNOME extensions, fonts, power settings, startup applications, and much more.

Here is how some users set up their GNOME desktops:

> [Matt Broberg][7]
>
>   * Learn how to [get started with GNOME extensions][8].
>   * Customize the look of GNOME with [GNOME-look.org][9].
>   * All GNOME customizations (extensions included) are saved to a user’s `$HOME/.config` directory, so if I migrate my home directory to another computer, or I put my configs into Git management, I can keep my environment consistent.
>


> Daniel Alley
>
>   * Install [Dash to Dock][10], [Caffeine][11], [Disconnect Wifi][12], and [Sound Input and Output Device Chooser][13] extensions.
>   * Enable minimize and maximize buttons in window bars with GNOME Tweak tool.
>


> Grzegorz Grzybek
>
>   * One of my favorite extensions is [GTK Title Bar][14], which removes title bars of non-GNOME apps when they’re put into fullscreen mode.
>


### Try something the same, or try something different

GNOME was a direct response to the KDE desktop, which, at the time, was not licensed as [free software][15], and its original design played to the expectations of a KDE user.

![GNOME desktop example with Fedora][16]

It has come a long way since the early days and stands beside (and in many ways surpasses) the best-known desktops on other platforms. GNOME 3 is a progressive desktop, moving toward a unified interface for interfaces driven by keyboard, mouse, and touch. It's designed to balance beauty with resource requirements, innovation with familiarity, and efficiency with intuition.

![GNOME 3 desktop][17]

But if you're finding that you're familiar enough with GNOME but still not enjoying it, then there's nothing stopping you from trying something entirely different. In fact, it's common to try many different [desktops and window managers][18] on Linux and BSD because having choice in how you interact with your own computer is arguably the best embodiment of the open source spirit. You get to use your technology on your own terms. You never have to settle for what somebody else thinks is best.

How do you configure GNOME? Do you use GNOME or a different desktop? Tell us in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/gnome-users

作者：[Opensource.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/admin
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://www.gnome.org/press/1999/03/gnome-1-0-released/
[3]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[4]: https://opensource.com/sites/default/files/uploads/gnome-software-installer.png (GNOME software installer)
[5]: https://wiki.gnome.org/action/show/Apps/Tweaks?action=show&redirect=Apps%2FGnomeTweakTool
[6]: https://opensource.com/sites/default/files/uploads/gnome-tweaks.png (GNOME tweaks menu)
[7]: https://opensource.com/users/mbbroberg
[8]: https://extensions.gnome.org
[9]: https://www.gnome-look.org
[10]: https://extensions.gnome.org/extension/307/dash-to-dock/
[11]: https://extensions.gnome.org/extension/517/caffeine/
[12]: https://extensions.gnome.org/extension/904/disconnect-wifi/
[13]: https://extensions.gnome.org/extension/906/sound-output-device-chooser/
[14]: https://extensions.gnome.org/extension/1732/gtk-title-bar/
[15]: https://www.fsf.org/about/what-is-free-software
[16]: https://opensource.com/sites/default/files/uploads/gnome_desktop.png (GNOME desktop example with Fedora)
[17]: https://opensource.com/sites/default/files/uploads/advent-gnome_0.jpg (GNOME 3 desktop)
[18]: https://opensource.com/article/20/5/linux-desktops
