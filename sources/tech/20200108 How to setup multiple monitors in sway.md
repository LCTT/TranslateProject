[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to setup multiple monitors in sway)
[#]: via: (https://fedoramagazine.org/how-to-setup-multiple-monitors-in-sway/)
[#]: author: (arte219 https://fedoramagazine.org/author/arte219/)

How to setup multiple monitors in sway
======

![][1]

Sway is a tiling Wayland compositor which has mostly the same features, look and workflow as the [i3 X11 window manager][2]. Because Sway uses Wayland instead of X11, the tools to setup X11 don’t always work in sway. This includes tools like _xrandr_, which are used in X11 window managers or desktops to setup monitors. This is why monitors have to be setup by editing the sway config file, and that’s what this article is about.

## **Getting your monitor ID’s**

First, you have to get the names sway uses to refer to your monitors. You can do this by running:

```
$ swaymsg -t get_outputs
```

You will get information about all of your monitors, every monitor separated by an empty line.

You have to look for the first line of every section, and for what’s after “Output”. For example, when you see a line like “_Output DVI-D-1 ‘Philips Consumer Electronics Company’_”, the output ID is “DVI-D-1”. Note these ID’s and which physical monitors they belong to.

## **Editing the config file**

If you haven’t edited the Sway config file before, you have to copy it to your home directory by running this command:

```
cp -r /etc/sway/config ~/.config/sway/config
```

Now the default config file is located in _~/.config/sway_ and called “config”. You can edit it using any text editor.

Now you have to do a little bit of math. Imagine a grid with the origin in the top left corner. The units of the X and Y coordinates are pixels. The Y axis is inverted. This means that if you, for example, start at the origin and you move 100 pixels to the right and 80 pixels down, your coordinates will be (100, 80).

You have to calculate where your displays are going to end up on this grid. The locations of the displays are specified with the top left pixel. For example, if we want to have a monitor with name HDMI1 and a resolution of 1920×1080, and to the right of it a laptop monitor with name eDP1 and a resolution of 1600×900, you have to type this in your config file:

```
output HDMI1 pos 0 0
output eDP1 pos 1920 0
```

You can also specify the resolutions manually by using the _res_ option: 

```
output HDMI1 pos 0 0 res 1920x1080
output eDP1 pos 1920 0 res 1600x900
```

## **Binding workspaces to monitors**

Using sway with multiple monitors can be a little bit tricky with workspace management. Luckily, you can bind workspaces to a specific monitor, so you can easily switch to that monitor and use your displays more efficiently. This can simply be done by the workspace command in your config file. For example, if you want to bind workspace 1 and 2 to monitor DVI-D-1 and workspace 8 and 9 to monitor HDMI-A-1, you can do that by using:

```
workspace 1 output DVI-D-1
workspace 2 output DVI-D-1
```

```
workspace 8 output HDMI-A-1
workspace 9 output HDMI-A-1
```

That’s it! These are the basics of multi monitor setup in sway. A more detailed guide can be found at <https://github.com/swaywm/sway/wiki#Multihead>.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-setup-multiple-monitors-in-sway/

作者：[arte219][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/arte219/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/sway-multiple-monitors-816x345.png
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/
