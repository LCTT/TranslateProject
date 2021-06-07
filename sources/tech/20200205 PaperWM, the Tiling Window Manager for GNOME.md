[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (PaperWM, the Tiling Window Manager for GNOME)
[#]: via: (https://itsfoss.com/paperwm/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

PaperWM, the Tiling Window Manager for GNOME
======

Lately, tiling window managers have been gaining popularity even among the regular desktop Linux users. Unfortunately, it can be difficult and time-consuming for a user to install and set up a tiling window manager.

This is why projects like [Regolith][1] and PaperWM has come up to provide tiling window experience with minimal efforts.

We have already discussed [Regolith desktop][2] in details. In this article, we’ll check out PaperWM.

### What is PaperWM?

According to its GitHub repo, [PaperWM][3] is “an experimental [Gnome Shell extension][4] providing scrollable tiling of windows and per monitor workspaces. It’s inspired by paper notebooks and tiling window managers.”

PaperWM puts all of your windows in a row. You can quickly switch between windows very quickly. It’s a little bit like having a long spool of paper in front of you that you can move back and forth.

This extension supports GNOME Shell 3.28 to 3.34. It also supports both X11 and Wayland. It is written in JavaScript.

![PaperWM Desktop][5]

# How to Install PaperWM?

To install the PaperWM extension, you will need to clone the Github repo. Use this command:

```
git clone 'https://github.com/paperwm/PaperWM.git' "${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/[email protected]:matrix.org"
```

Now all you have to do is run:

```
./install.sh
```

The installer will set up and enable PaperWM.

If you are an Ubuntu user, there are a couple of things that you will need to consider. There are currently three different versions of the Gnome desktop available with Ubuntu:

  * ubuntu-desktop
  * ubuntu-gnome-desktop
  * vanilla-gnome-desktop



Ubuntu ships ubuntu-desktop by default and includes the _desktop-icons_ package, which causes issues with PaperWM. The PaperWM devs recommend that you turn off the desktop-icons extension [using GNOME Tweaks tool][6]. However, while this step does work in 19.10, they say that users have reported that it is not working 19.04.

According to the PaperWM devs, using _ubuntu-gnome-desktop_ produces the best out of the box results. _vanilla-gnome-desktop_ has some keybindings that raise havoc with PaperWM.

**Recommended Read:**

![][7]

#### [Get a Preconfigured Tiling Window Manager on Ubuntu With Regolith][2]

Using tiling window manager in Linux can be tricky with all those configuration. Regolith gives you an out of box i3wm experience within Ubuntu.

### How to Use PaperWM?

Like most tiling window managers, PaperWM uses the keyboard to control and manage the windows. PaperWM also supports mouse and touchpad controls. For example, if you have Wayland installed, you can use a three-fingered swipe to navigate.

![PaperWM in action][8]

Here is a list of a few of the keybinding that preset in PaperWM:

  * Super + , or Super + . to activate the next or previous window
  * Super + Left or Super + Rightto activate the window to the left or right
  * Super + Up or Super + Downto activate the window above or below
  * Super + , or Super + . to activate the next or previous window
  * Super + Tab or Alt + Tab to cycle through the most recently used windows
  * Super + C to center the active window horizontally
  * Super + R to resize the window (cycles through useful widths)
  * Super + Shift + R to resize the window (cycles through useful heights)
  * Super + Shift + F to toggle fullscreen
  * Super + Return or Super + N to create a new window from the active application
  * Super + Backspace to close the active window



The Super key is the Windows key on your keyboard. You can find the full list of keybindings on the PaperWM [GitHub page][9].

### Final Thoughts on PaperWM

As I have stated previously, I don’t use tiling managers. However, this one has me thinking. I like the fact that you don’t have to do a lot of configuring to get it working. Another big plus is that it is built on GNOME, which means that getting a tiling manager working on Ubuntu is fairly straight forward.

The only downside that I can see is that a system running a dedicated tiling window manager, like [Sway][10], would use fewer system resources and be faster overall.

What are your thoughts on the PaperWM GNOME extension? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][11].

--------------------------------------------------------------------------------

via: https://itsfoss.com/paperwm/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://regolith-linux.org/
[2]: https://itsfoss.com/regolith-linux-desktop/
[3]: https://github.com/paperwm/PaperWM
[4]: https://itsfoss.com/gnome-shell-extensions/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/paperwm-desktop.png?ssl=1
[6]: https://itsfoss.com/gnome-tweak-tool/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/regolith-linux.png?fit=800%2C450&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/paperwm-desktop2.png?fit=800%2C450&ssl=1
[9]: https://github.com/paperwm/PaperWM#usage
[10]: https://itsfoss.com/sway-window-manager/
[11]: https://reddit.com/r/linuxusersgroup
