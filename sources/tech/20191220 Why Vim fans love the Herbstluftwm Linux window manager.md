[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why Vim fans love the Herbstluftwm Linux window manager)
[#]: via: (https://opensource.com/article/19/12/herbstluftwm-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why Vim fans love the Herbstluftwm Linux window manager
======
This article is part of a special series of 24 days of Linux desktops.
If you're a Vim fan, check out herbstluftwm, a tile-based Linux window
manager that takes the "Vim way" as inspiration.
![OpenStack source code \(Python\) in VIM][1]

Everybody loves Vim (aside from Dvorak and Emacs users). Vim is so popular that there are entire web browsers dedicated to navigating the web with Vim keybindings, a Vim mode in the wildly popular [Zsh][2] terminal emulator, and even a text editor. There's also a window manager called [herbstluftwm][3] that models itself partly after the "Vim way." Herbstluftwm does away with windows, as such, and replaces them with tiles, or quadrants, into which applications are loaded and used. You use the keyboard (**Alt+h**, **Alt+j**, **Alt+k**, and **Alt+l**) to navigate from one tile to another.

![Herbstluftwm][4]

Install herbstluftwm from your distribution's software repository. After installing it, log out of your current desktop session so you can log into your new one. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With GDM:

![][5]

With SDDM:

![][6]

### Herbstluftwm desktop tour

The first time you log into herbstluftwm, you are greeted with nothing but a green screen with a darker green border around the edges. What you're seeing is the initial tile with no application loaded into it. To start the default application, xterm, press **Alt+Return**.

The documentation emphasizes the **$HOME/.config/herbstluftwm/autostart** configuration file as a way to start important applications when you log in. For applications you don't necessarily want to start every time you log in, you can use xterm as your launch daemon. As usual, placing an ampersand (**&amp;**) symbol after the command returns control of the shell to you. To start Emacs, for instance:


```
`% emacs &`
```

This launches an Emacs window in a new tile and returns you to a prompt.

![Emacs running in Herbstluftwm][7]

#### Switching tiles

To move from one tile to another, use the classic Vim navigation combination of **h**, **j**, **k**, or **l**, along with the **Alt** key. For example, to switch from the terminal to an application in a tile below it (i.e., at the bottom of the screen), press **Alt+j**. To navigate back up, **Alt+k**. Left and right navigations are **Alt+h** and **Alt+l**, respectively.

#### Split screen

You can manually split a screen vertically with **Alt+o** and horizontally with **Alt+u**.

To remove an empty tile, navigate into it and press **Alt+r**.

### Configuring herbstluftwm

Aside from the **Alt** keybindings, you communicate with herbstluftwm through the **herbstclient** command. This command can be used interactively from a shell, or you can preserve your preferences in a configuration file.

You can view all attributes available in Herbstluftwm with:


```
`$ herbstclient attr`
```

Herbstluftwm's default behavior is defined in the default config file, which you can copy to your home directory and modify. Upon launch, herbstluftwm executes the commands contained in the config file. For instance, if you find it awkward to use keybindings centered around the **Alt** key, which is traditionally a key reserved for in-application shortcuts, you can change the key used to trigger herbstluftwm actions in the config file:


```
% mkdir ~/.config/herbstluftwm
% cp /usr/xdg/herbstluftwm/autostart \
~/.config/herbstluftwm
% sed -i 's/Mod=Mod1/Mod=Mod4/' ~/.config/herbstluftwm
% herbstclient reload
```

This changes the herbstluftwm modifier to the Super key (the "Windows" or "Tux" key, depending on your keyboard).

Using the autostart file, you can set custom keybindings, create tags for applications of a specific type so you can tile applications in a consistent way, and do much more.

### Why you need to try herbstluftwm

Herbstluftwm is a fine example of a tiling window manager. It tiles windows by default and lets the user define exceptions to global rules. It uses Vim-like navigation but allows for quick and easy overrides. It's very likely the tiling manager you've been looking for, so try it soon.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/herbstluftwm-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_2.jpg?itok=4fza48WU (OpenStack source code (Python) in VIM)
[2]: https://opensource.com/article/19/9/getting-started-zsh
[3]: https://herbstluftwm.org
[4]: https://opensource.com/sites/default/files/uploads/advent-herbsluftwm.png (Herbstluftwm)
[5]: https://opensource.com/sites/default/files/advent-gdm_1.jpg
[6]: https://opensource.com/sites/default/files/advent-kdm_0.jpg
[7]: https://opensource.com/sites/default/files/uploads/advent-herbsluftwm-emacs.jpg (Emacs running in Herbstluftwm)
