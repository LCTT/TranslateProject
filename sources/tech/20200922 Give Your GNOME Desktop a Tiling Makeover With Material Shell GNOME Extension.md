[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Give Your GNOME Desktop a Tiling Makeover With Material Shell GNOME Extension)
[#]: via: (https://itsfoss.com/material-shell/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Give Your GNOME Desktop a Tiling Makeover With Material Shell GNOME Extension
======

There is something about tiling windows that attracts many people. Perhaps it looks good or perhaps it is time-saving if you are a fan of [keyboard shortcuts in Linux][1]. Or maybe it’s the challenge of using the uncommon tiling windows.

![Tiling Windows in Linux | Image Source][2]

From i3 to [Sway][3], there are so many tiling window managers available for Linux desktop. Configuring a tiling window manager itself requires a steep learning curve.

This is why projects like [Regolith desktop][4] exist to give you preconfigured tiling desktop so that you can get started with tiling windows with less effort.

Let me introduce you to a similar project named Material Shell that makes using tiling feature even easier than [Regolith][5].

### Material Shell GNOME Extension: Convert GNOME desktop into a tiling window manager

[Material Shell][6] is a GNOME extension and that’s the best thing about it. This means that you don’t have to log out and log in to another desktop environment or window manager. You can enable or disable it from within your current session.

I’ll list the features of Material Shell but it will be easier to see it in action:

[Subscribe to our YouTube channel for more Linux videos][7]

The project is called Material Shell because it follows the [Material Design][8] guideline and thus gives the applications an aesthetically pleasing interface. Here are its main features:

#### Intuitive interface

Material Shell adds a left panel for quick access. On this panel, you can find the system tray at the bottom and the search and workspaces on the top.

All the new apps are added to the current workspace. You can create new workspace and switch to it for organizing your running apps into categories. This is the essential concept of workspace anyway.

In Material Shell, every workspace can be visualized as a row with several apps rather than a box with several apps in it.

#### Tiling windows

In a workspace, you can see all your opened applications on the top all the time. By default, the applications are opened to take the entire screen like you do in GNOME desktop. You can change the layout to split it in half or multiple columns or a grid of apps using the layout changer in the top right corner.

This video shows all the above features at a glance:

#### Persistent layout and workspaces

That’s not it. Material Shell also remembers the workspaces and windows you open so that you don’t have to reorganize your layout again. This is a good feature to have as it saves time if you are particular about which application goes where.

#### Hotkeys/Keyboard shortcut

Like any tiling windows manager, you can use keyboard shortcuts to navigate between applications and workspaces.

  * `Super+W` Navigate to the upper workspace.
  * `Super+S` Navigate to the lower workspace.
  * `Super+A` Focus the window at the left of the current window.
  * `Super+D` Focus the window at the right of the current window.
  * `Super+1`, `Super+2` … `Super+0` Navigate to specific workspace
  * `Super+Q` Kill the current window focused.
  * `Super+[MouseDrag]` Move window around.
  * `Super+Shift+A` Move the current window to the left.
  * `Super+Shift+D` Move the current window to the right.
  * `Super+Shift+W` Move the current window to the upper workspace.
  * `Super+Shift+S` Move the current window to the lower workspace.



### Installing Material Shell

Warning!

Tiling windows could be confusing for many users. You should be familiar with GNOME Extensions to use it. Avoid trying it if you are absolutely new to Linux or if you are easily panicked if anything changes in your system.

Material Shell is a GNOME extension. So, please [check your desktop environment][9] to make sure you are running _**GNOME 3.34 or higher version**_.

I would also like to add that tiling windows could be confusing for many users.

Apart from that, I noticed that after disabling Material Shell it removes the top bar from Firefox and the Ubuntu dock. You can get the dock back by disabling/enabling Ubuntu dock extension from the Extensions app in GNOME. I haven’t tried but I guess these problems should also go away after a system reboot.

I hope you know [how to use GNOME extensions][10]. The easiest way is to just [open this link in the browser][11], install GNOME extension plugin and then enable the Material Shell extension.

![][12]

If you don’t like it, you can disable it from the same extension link you used earlier or use the GNOME Extensions app:

![][13]

**To tile or not?**

I use multiple screens and I found that Material Shell doesn’t work well with multiple monitors. This is something the developer(s) can improve in the future.

Apart from that, it’s a really easy to get started with tiling windows with Material Shell. If you try Material Shell and like it, appreciate the project by [giving it a star or sponsoring it on GitHub][14].

For some reasons, tiling windows are getting popular. Recently released [Pop OS 20.04][15] also added tiling window features.

But as I mentioned previously, tiling layouts are not for everyone and it could confuse many people.

How about you? Do you prefer tiling windows or you prefer the classic desktop layout?

--------------------------------------------------------------------------------

via: https://itsfoss.com/material-shell/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-shortcuts/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux-ricing-example-800x450.jpg?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/sway-window-manager/
[4]: https://itsfoss.com/regolith-linux-desktop/
[5]: https://regolith-linux.org/
[6]: https://material-shell.com
[7]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[8]: https://material.io/
[9]: https://itsfoss.com/find-desktop-environment/
[10]: https://itsfoss.com/gnome-shell-extensions/
[11]: https://extensions.gnome.org/extension/3357/material-shell/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/install-material-shell.png?resize=800%2C307&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/material-shell-gnome-extension.png?resize=799%2C497&ssl=1
[14]: https://github.com/material-shell/material-shell
[15]: https://itsfoss.com/pop-os-20-04-review/
