Budgie Desktop v8 Released With Improved Menu, Panel
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/budgie-desktop.jpg)

**A new version of [Evolve OS][1]‘s simple ‘[Budgie Desktop Environment][2]‘ has been released, and the improvements under its wing are impressive.**

Made up of 78 commits, the lightweight desktop lands with a host of new options and applets to play with. Its plumage has also benefitted from a bit of TLC, with key parts of the shell feeling fresher and looking more refined.

But will the changes ruffle the feathers of the Budgie flock or leave them squawking in awe? Let’s take a closer look.

### Budgie v8 ###

#### Menu Changes ####

The **Budgie Menu** now uses a narrower compact layout by default. This style lists the applications in categories (as previously) but sorted by usage rather than name.

Software that you open most often sit nearer the top of each category header. It’s an efficacious decision that should help save time for those who hunt n’ scroll for apps rather than use the handy search filter.

![The Menu uses ‘compact’ mode by default](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/budgie-desktop-8.jpg)

The Menu uses ‘compact’ mode by default

The old two-pane setup that featured in earlier builds remains available; you can toggle it back on in Budgie’s preferences (**right click on the menu applet > Preferences**).

The power option menu that previously
resided in the main menu has been moved over to the System Tray applet (i.e., ‘volume‘). Additionally, you can now access System Settings entries from the menu itself — no more scratching of heads!

#### Panel Changes ####

![Quicklist support in Budgie 0.8](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/quicklist-support-in-budgie.jpg)

Quicklist support in Budgie 0.8

The Budgie Panel and task list applet both benefit from a raft of improvements, including new auto-hide options, dynamic theming support and a new ‘GNOME 2′-style menu bar option.

- Auto-hide (optional)
- Quicklist support
- Dark theme support
- Application pinning
- App ‘attention’ hint
- GNOME Panel theming
- Old-school ‘Menu Bar’ applet (optional)

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/classic-menu.jpg)

#### Elsewhere ####

Other changes include support for GNOME 3.10 and up; improved animations when changing wallpapers; and the run dialog has been hugely improved in design, sporting an almost Alfred/GNOME-Do-esque design. Mmmhm!

![Run, Run, Run](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/budgie-run-dialog.jpg)

Run, Run, Run

### Install Budgie Desktop on Ubuntu ###

Budgie 0.8 is, as with previous releases, available to install in Ubuntu 14.04 LTS and Ubuntu 14.10 by way of an official PPA. The desktop can be installed alongside Unity, GNOME Shell and Cinnamon without much (if any) issue.

To install, open a new Terminal window and enter the following commands. Enter your password where prompted.

    sudo add-apt-repository ppa:evolve-os/ppa

    sudo apt-get update && sudo apt-get install budgie-desktop

After the install has completed you will need to log out of Unity (or whichever desktop you’re currently using). At the Unity Greeter click the Ubuntu logo emblem, select the Budgie session from the session list, and then log in as normal. The Budgie desktop will load.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/select-budgie.jpg)

#### Notes for Ubuntu Users ####

![Expect Odd Theming Issues in Ubuntu](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/not-all-perfect.jpg)

Expect Odd Theming Issues in Ubuntu

While Budgie is now easy for Ubuntu users to install it is not designed for it specifically (the Evolve OS distribution is the best way to experience it).

Naturally, you might not fancy upheaving to another OS. That’s fine, but if you plan on keeping Budgie caged in Ubuntu you’ll need to note the following caveats (lest you end up bird-brained).

First up, **Budgie is under active development**. Several key features remain missing, including native network management support. An applet can be added to the panel that supports Ubuntu’s Indicator Applets, but it’s a little rough around the edges.

You should also expect some theming issues when using the shell with Ambiance/Radiance. The Adwaita theme (and other GNOME themes) work best. You should also disable Ubuntu’s Overlay Scrollbars.

Finally, logout (volume > power button) **does not work under Ubuntu**. To log out you should use the run dialog (Alt+F2) and the following command:

    gnome-session-quit

If all of that sounds like fun rather than faff, there’s plenty to enjoy in Budgie – and not just its minimal system footprint! Let us know your own thoughts on it, what you’d like to see it add next, etc. in the comments below.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/11/budgie-desktop-0-8-released-big-changes

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://evolve-os.com/
[2]:http://www.omgubuntu.co.uk/2014/07/install-budgie-evolve-os-desktop-ubuntu-14-04