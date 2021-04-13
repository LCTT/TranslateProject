[#]: subject: (Why I love using bspwm for my Linux window manager)
[#]: via: (https://opensource.com/article/21/4/bspwm-linux)
[#]: author: (Stephen Adams https://opensource.com/users/stevehnh)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why I love using bspwm for my Linux window manager
======
Install, configure, and start using the bspwm window manager on Fedora
Linux.
![Tall building with windows][1]

Some folks like to rearrange furniture. Other folks like to try new shoes or redecorate their bedroom on the regular. Me? I try out Linux desktops.

After drooling over some of the incredible desktop environments I've seen online, I got curious about one window manager in particular: [bspwm][2].

![bspwm desktop][3]

(Stephen Adams, [CC BY-SA 4.0][4])

I've been a fan of the [i3][5] window manager for quite a while, and I enjoy the way everything is laid out and the ease of getting started. But something about bspwm called to me. There are a few reasons I decided to try it out:

  * It is _only_ a window manager.
  * It is managed by a few easy-to-configure scripts.
  * It supports gaps between windows by default.



The first reason—that it is simply a window manager—is probably the top thing to point out. Like i3, there are no graphical bells and whistles applied by default. You can certainly customize it to your heart's content, but _you_ will be putting in all the work to make it look like you want. That's part of its appeal to me.

Although it is available on many distributions, my examples use Fedora Linux.

### Install bspwm

Bspwm is packaged in most common distributions, so you can install it with your system's package manager. This command also installs [sxkhd][6], a daemon for the X Window System "that reacts to input events by executing commands," and [dmenu][7], a generic X Window menu:


```
`dnf install bspwm sxkhd dmenu`
```

Since bspwm is _just_ a window manager, there aren't any built-in shortcuts or keyboard commands. This is where it stands in contrast to something like i3. sxkhd makes it easier to get going. So, go ahead and configure sxkhd before you fire up the window manager for the first time:


```
systemctl start sxkhd
systemctl enable sxkhd
```

This enables sxkhd at login, but you also need a configuration with some basic functionality ready to go:


```
`curl https://raw.githubusercontent.com/baskerville/bspwm/master/examples/sxhkdrc --output ~/.config/sxkhd/sxkhdrc`
```

It's worth taking a look at this file before you get much further, as some commands that the scripts call may not exist on your system. A good example is the `super + Return` shortcut that calls `urxvt`. Change this to your preferred terminal, especially if you do not have urxvt installed:


```
#
# wm independent hotkeys
#
   
# terminal emulator
super + Return
        urxvt
   
# program launcher
super + @space
        dmenu_run
```

If you are using GDM, LightDM, or another display manager, just choose bspwm before logging in.

### Configure bspwm

Once you are logged in, you'll see a whole lot of nothing on the screen. That's not a sense of emptiness you feel. It's possibility! You are now ready to start fiddling with all the parts of a desktop environment that you have taken for granted all these years. Building from scratch is not easy, but it's very rewarding once you get the hang of it.

The most difficult thing about any window manager is getting a handle on the shortcuts. You're going to be slow to start, but in a short time, you'll be flying around your system using your keyboard alone and looking like an ultimate hacker to your friends and family.

You can tailor the system as much as you want by editing `~/.config/bspwm/bspwmrc` to add apps at launch, set up your desktops and monitors, and set rules for how your windows should behave. There are a few examples set by default to get you going. Keyboard shortcuts are all managed by the **sxkhdrc** file.

There are plenty more open source projects to install to really get things looking nice—like [Feh][8] for desktop backgrounds, [Polybar][9] for that all-important status bar, [Rofi][10] to really help your app launcher pop, and [Compton][11] to give you the shadows and transparency to get things nice and shiny.

Happy hacking!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/bspwm-linux

作者：[Stephen Adams][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stevehnh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://github.com/baskerville/bspwm
[3]: https://opensource.com/sites/default/files/uploads/bspwm-desktop.png (bspwm desktop)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://i3wm.org/
[6]: https://github.com/baskerville/sxhkd
[7]: https://linux.die.net/man/1/dmenu
[8]: https://github.com/derf/feh
[9]: https://github.com/polybar/polybar
[10]: https://github.com/davatorium/rofi
[11]: https://github.com/chjj/compton
