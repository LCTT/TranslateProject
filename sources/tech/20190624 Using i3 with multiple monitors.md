[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using i3 with multiple monitors)
[#]: via: (https://fedoramagazine.org/using-i3-with-multiple-monitors/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

Using i3 with multiple monitors
======

![][1]

Are you using multiple monitors with your Linux workstation? Seeing many things at once might be beneficial. But there are often much more windows in our workflows than physical monitors — and that’s a good thing, because seeing too many things at once might be distracting. So being able to switch what we see on individual monitors seems crucial.

Let’s talk about i3 — a popular tiling window manager that works great with multiple monitors. And there is one handy feature that many other window managers don’t have — the ability to switch workspaces on individual monitors independently.

### Quick introduction to i3

The [Fedora Magazine has already covered i3][2] about three years ago. And it was one of the most popular articles ever published! Even though that’s not always the case, i3 is pretty stable and that article is still very accurate today. So — not to repeat ourselves too much — this article only covers the very minimum to get i3 up and running, and you’re welcome to go ahead and read it if you’re new to i3 and want to learn more about the basics.

To install i3 on your system, run the following command:

```
$ sudo dnf install i3
```

When that’s done, log out, and on the log in screen choose i3 as your window manager and log back in again.

When you run i3 for the first time, you’ll be asked if you wish to proceed with automatic configuration — answer yes here. After that, you’ll be asked to choose a “mod key”. If you’re not sure here, just accept the default which sets you Windows/Super key as the mod key. You’ll use this key for mostly all the shortcuts within the window manager.

At this point, you should see a little bar at the bottom and an empty screen. Let’s have a look at some of the basic shortcuts.

Open a terminal using:

```
$mod + enter
```

Switch to a second workspace using:

```
$mod + 2
```

Open firefox in two steps, first by:

```
$mod + d
```

… and then by typing “firefox” and pressing enter.

Move it to the first workspace by:

```
$mod + shift + 1
```

… and switch to the first workspace by:

```
$mod + 1
```

At this point, you’ll see a terminal and a firefox window side by side. To close a window, press:

```
$mod + shift + q
```

There are more shortcuts, but these should give you the minimum to get started with i3.

Ah! And to exit i3 (to log out) press:

```
$mod + shift + e
```

… and then confirm using your mouse at the top-right corner.

### Getting multiple screens to work

Now that we have i3 up and running, let’s put all those screens to work!

To do that, we’ll need to use the command line as i3 is very lightweight and doesn’t have gui to manage additional screens. But don’t worry if that sounds difficult — it’s actually quite straightforward!

The command we’ll use is called xrandr. If you don’t have xrandr on your system, install it by running:

```
$ sudo dnf install xrandr
```

When that’s installed, let’s just go ahead and run it:

```
$ xrandr
```

The output lists all the available outputs, and also indicated which have a screen attached to them (a monitor connected with a cable) by showing supported resolutions. Good news is that we don’t need to really care about the specific resolutions to make the them work.

This specific example shows a primary screen of a laptop (named eDP1), and a second monitor connected to the HDMI-2 output, physically positioned right of the laptop. To turn it on, run the following command:

```
$ xrandr --output HDMI-2 --auto --right-of eDP1
```

And that’s it! Your screen is now active.

![Second screen active. The commands shown on this screenshot are slightly different than in the article, as they set a smaller resolution to make the screenshots more readable.][3]

### Managing workspaces on multiple screens

Switching workspaces and creating new ones on multiple screens is very similar to having just one screen. New workspaces get created on the screen that’s currently active — the one that has your mouse cursor on it.

So, to switch to a specific workspace (or to create a new one in case it doesn’t exist), press:

```
$mod + NUMBER
```

And you can switch workspaces on individual monitors independently!

![Workspace 2 on the left screen, workspace 4 on the right screen.][4]

![Left screen switched to workspace 3, right screen still showing workspace 4.][5]

![Right screen switched to workspace 4, left screen still showing workspace 3.][6]

### Moving workspaces between monitors

The same way we can move windows to different workspaces by the following command:

```
$mod + shift + NUMBER
```

… we can move workspaces to different screens as well. However, there is no default shortcut for this action — so we have to create it first.

To create a custom shortcut, you’ll need to open the configuration file in a text editor of your choice (this article uses _vim_):

```
$ vim ~/.config/i3/config
```

And add the following lines to the very bottom of the configuration file:

```
# Moving workspaces between screens
bindsym $mod+p move workspace to output right
```

Save, close, and to reload and apply the configuration, press:

```
$mod + shift + r
```

Now you’ll be able to move your active workspace to the second monitor by:

```
$mod + p
```

![Workspace 2 with Firefox on the left screen][7]

![Workspace 2 with Firefox moved to the second screen][8]

And that’s it! Enjoy your new multi-monitor experience, and to learn more about i3, you’re welcome to read the previous article about i3 on the Fedora Magazine, or consult the official i3 documentation.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-i3-with-multiple-monitors/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/i3-title-816x345.jpg
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/06/0-1-1024x384.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/06/1-1-1024x384.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/06/1-2-1024x384.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/06/1-3-1024x384.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/06/2-1-1024x384.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/06/2-2-1024x384.png
