[#]: subject: (Remap your Caps Lock key on Linux)
[#]: via: (https://opensource.com/article/21/5/remap-caps-lock-key-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Remap your Caps Lock key on Linux
======
Increase your typing and navigation speed and avoid repetitive stress
injuries by remapping your keyboard on GNOME 3 and Wayland.
![Emoji keyboard][1]

There have been many life-changing Linux moments for me, but most fade into my backstory as they become the status quo. There's one little keyboard trick Linux taught me that I'm reminded of every time I use it (maybe 1,000 times a day), and that's converting the **Caps Lock** key to **Ctrl**.

I never use **Caps Lock**, but I use the **Ctrl** key all day for copying, pasting, navigating within [Emacs][2], and [invoking Bash][3], [GNU Screen][4], or [tmux][5] actions. **Caps Lock** occupies valuable real estate on my keyboard, forcing the actually useful **Ctrl** key down to the awkward-to-reach bottom corner.

![Fingers on a keyboard][6]

This is as painful as it looks. (Seth Kenlon, [CC BY-SA 4.0][7])

Remapping **Ctrl** increased my typing and navigation speed and has probably saved me from repetitive stress injuries.

### The case of the disappearing control

Buckle in, this is a roller coaster of a history lesson:

Unfortunately for **Caps Lock** swappers like me, when GNOME 3 came out, it all but removed the ability to change the location of the **Ctrl** key.

Fortunately, the excellent GNOME Tweaks app brought back these "missing" control panels.

Unfortunately, [GNOME 40][8] has no GNOME Tweaks app (yet?)

Also, unfortunately, the old `xmodmap` hack that used to work on X11 is useless on the new [Wayland display server][9].

For a short while (an afternoon at best), I felt things were looking dim for people who hate **Caps Lock**. Then I remembered I am a user of open source, and there's _always_ a way around something as simple as an overlooked GUI control panel.

### dconf

The GNOME desktop uses dconf, a database that stores important configuration options. It's the backend to GSettings, which is the system GNOME applications interface with when they need to discover system preferences. You can query the dconf database using the `gsetting` command, and you can set dconf key values directly with the `dconf` command.

### GSettings

The dconf database isn't necessarily what you might call discoverable. It's a humble database you're not meant to have to think about, and it holds a lot of data you usually don't have to interact with directly. However, it does use a sensible schema that's fun to browse if you want to better understand all of the preference options GNOME has to manage.

You can list all of dconf's schemas with the `list-schemas` subcommand. After browsing hundreds of schemas, you might use [grep][10] to narrow your focus to something that seems especially relevant, such as `org.gnome.desktop`:


```
$ gsettings list-schemas | grep ^org.gnome.desktop
[...]
org.gnome.desktop.background
org.gnome.desktop.privacy
org.gnome.desktop.remote-desktop.vnc
org.gnome.desktop.interface
org.gnome.desktop.default-applications.terminal
org.gnome.desktop.session
org.gnome.desktop.thumbnailers
org.gnome.desktop.app-folders
org.gnome.desktop.notifications
org.gnome.desktop.sound
org.gnome.desktop.lockdown
org.gnome.desktop.default-applications.office
```

Whether through a manual search or through [reading GSetting documentation][11], you may notice the `org.gnome.desktop.input-sources` schema, which helps define the keyboard layout. A GSetting schema, by design, contains keys and values.

### Remapping Caps Lock with dconf

The `xkb-options` key contains optional keyboard overrides. To set this key, use `dconf`, converting the dots (`.`) in the schema above to slashes (`/`) because the dconf database requires it:


```
`$ dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:ctrl_modifier']"`
```

I set `caps` to `ctrl_modifier` because I use the **Ctrl** modifier more than any other modifier, but Vim users may prefer to set it to `escape` instead.

### View your setting

The change takes effect immediately and persists across reboots. It's a preference you've defined in GNOME, so it remains in effect until you change it.

You can view the new value in `dconf` with `gsettings`. First, view the available keys:


```
$ gsettings list-keys \
org.gnome.desktop.input-sources
xkb-options
mru-sources
show-all-sources
current
per-window
sources
```

And then view the settings with the `xkb-options` key:


```
$ gsettings get \
org.gnome.desktop.input-sources \
xkb-options
['caps:ctrl_modifier']
```

### Options aplenty

I use this little trick to set **Caps Lock** as well as the [Compose][12] key (`compose:ralt`) on my GNOME 3.4 system. While I believe there are GUI controls in development to control options like these, I also have to admit that the ability to set them programmatically is a luxury I enjoy. As a former admin of systems that had no reliable way to adjust desktop settings, the ability to script my preferences makes setting up a fresh desktop quick and easy.

There are lots of useful options available with GSettings, and the documentation is thorough. If you have something you want to change, take a look at what's available.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/remap-caps-lock-key-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/emoji-keyboard.jpg?itok=JplrSZ9c (Emoji keyboard)
[2]: https://opensource.com/article/20/12/emacs
[3]: https://opensource.com/article/18/5/bash-tricks#key
[4]: https://opensource.com/article/17/3/introduction-gnu-screen
[5]: https://opensource.com/article/19/6/tmux-terminal-joy
[6]: https://opensource.com/sites/default/files/uploads/bendy-fingers.jpg (Fingers on a keyboard)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://discourse.gnome.org/t/new-gnome-versioning-scheme/4235
[9]: https://wayland.freedesktop.org
[10]: https://opensource.com/downloads/grep-cheat-sheet
[11]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/using_the_desktop_environment_in_rhel_8/configuring-gnome-at-low-level_using-the-desktop-environment-in-rhel-8
[12]: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life
