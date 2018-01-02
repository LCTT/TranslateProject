translating---geekpi

Autorandr: automatically adjust screen layout
======
Like many laptop users, I often plug my laptop into different monitor setups (multiple monitors at my desk, projector when presenting, etc.) Running xrandr commands or clicking through interfaces gets tedious, and writing scripts isn't much better.

Recently, I ran across [autorandr][1], which detects attached monitors using EDID (and other settings), saves xrandr configurations, and restores them. It can also run arbitrary scripts when a particular configuration is loaded. I've packed it, and it is currently waiting in NEW. If you can't wait, the [deb is here][2] and the [git repo is here][3].

To use it, simply install the package, and create your initial configuration (in my case, undocked):
```
 autorandr --save undocked

```

then, dock your laptop (or plug in your external monitor(s)), change the configuration using xrandr (or whatever you use), and save your new configuration (in my case, workstation):
```
autorandr --save workstation

```

repeat for any additional configurations you have (or as you find new configurations).

Autorandr has `udev`, `systemd`, and `pm-utils` hooks, and `autorandr --change` should be run any time that new displays appear. You can also run `autorandr --change` or `autorandr --load workstation` manually too if you need to. You can also add your own `~/.config/autorandr/$PROFILE/postswitch` script to run after a configuration is loaded. Since I run i3, my workstation configuration looks like this:
```
 #!/bin/bash

 xrandr --dpi 92
 xrandr --output DP2-2 --primary
 i3-msg '[workspace="^(1|4|6)"] move workspace to output DP2-2;'
 i3-msg '[workspace="^(2|5|9)"] move workspace to output DP2-3;'
 i3-msg '[workspace="^(3|8)"] move workspace to output DP2-1;'

```

which fixes the dpi appropriately, sets the primary screen (possibly not needed?), and moves the i3 workspaces about. You can also arrange for configurations to never be run by adding a `block` hook in the profile directory.

Check it out if you change your monitor configuration regularly!

--------------------------------------------------------------------------------

via: https://www.donarmstrong.com/posts/autorandr/

作者：[Don Armstrong][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.donarmstrong.com
[1]:https://github.com/phillipberndt/autorandr
[2]:https://www.donarmstrong.com/autorandr_1.2-1_all.deb
[3]:https://git.donarmstrong.com/deb_pkgs/autorandr.git
