[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Change your Linux terminal color theme)
[#]: via: (https://opensource.com/article/19/8/add-color-linux-terminal)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Change your Linux terminal color theme
======
Your terminal has plenty of options that allow you to theme what you
see.
![Terminal command prompt on orange background][1]

If you spend most of your day staring into a terminal, it's only natural that you want it to look pleasing. Beauty is in the eye of the beholder, and terminals have come a long way since the days of CRT serial consoles. So, the chances are good that your software terminal window has plenty of options to theme what you see—however you define beauty.

### Settings

Most popular software terminal applications, including GNOME, KDE, and Xfce, ship with the option to change their color theme. Adjusting your theme is as easy as adjusting application preferences. Fedora, RHEL, and Ubuntu ship with GNOME by default, so this article uses that terminal as its example, but the process is similar for Konsole, Xfce terminal, and many others.

First, navigate to the application's Preferences or Settings panel. In GNOME terminal, you reach it through the Application menu along the top of the screen or in the right corner of the window.

In Preferences, click the plus symbol (+) next to Profiles to create a new theme profile. In your new profile, click the Colors tab.

![GNOME Terminal preferences][2]

In the Colors tab, deselect the Use Colors From System Theme option so that the rest of the window will become active. As a starting point, you can select a built-in color scheme. These include light themes, with bright backgrounds and dark foreground text, as well as dark themes, with dark backgrounds and light foreground text.

The Default Color swatches define both the foreground and background colors when no other setting (such as settings from the dircolors command) overrides them. The Palette sets the colors defined by the dircolors command. These colors are used by your terminal, in the form of the LS_COLORS environment variable, to add color to the output of the [ls][3] command. If none of them appeal to you, change them on this screen.

When you're happy with your theme, close the Preferences window.

To change your terminal to your new profile, click on the Application menu, and select Profile. Choose your new profile and enjoy your custom theme.

![GNOME Terminal profile selection][4]

### Command options

If your terminal doesn't have a fancy settings window, it may still provide options for colors in your launch command. The xterm and rxvt terminals (the old one and the Unicode-enabled variant, sometimes called urxvt or rxvt-unicode) provide such options, so you can still theme your terminal emulator—even without desktop environments and big GUI frameworks.

The two obvious options are the foreground and background colors, defined by **-fg** and **-bg**, respectively. The argument for each option is the color _name_ rather than its ANSI number. For example:


```
`$ urxvt -bg black -fg green`
```

These settings set the default foreground and background. Should any other rule govern the color of a specific file or device type, those colors are used. See the [dircolors][5] command for information on how to set those.

You can also set the color of the text cursor (not the mouse cursor) with **-cr**:


```
`$ urxvt -bg black -fg green -cr teal`
```

![Setting color in urxvt][6]

Your terminal emulator may have more options, like a border color (**-bd** in rxvt), cursor blink (**-bc** and **+bc** in urxvt), and even background transparency. Refer to your terminal's man page to find out what cool features are available.

To launch your terminal with your choice of colors, you can add the options either to the command or the menu you use to launch the terminal (such as your Fluxbox menu file, a **.desktop** file in **$HOME/.local/share/applications**, or similar). Alternatively, you can use the [xrdb][7] tool to manage X-related resources (but that's out of scope for this article).

### Home is where the customization is

Customizing your Linux machine doesn't mean you have to learn how to program. You can and should make small but meaningful changes to make your digital home feel that much more comfortable. And there's no better place to start than the terminal!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/add-color-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/sites/default/files/uploads/gnome-terminal-preferences.jpg (GNOME Terminal preferences)
[3]: https://opensource.com/article/19/7/master-ls-command
[4]: https://opensource.com/sites/default/files/uploads/gnome-terminal-profile-select.jpg (GNOME Terminal profile selection)
[5]: http://man7.org/linux/man-pages/man1/dircolors.1.html
[6]: https://opensource.com/sites/default/files/uploads/urxvt-color.jpg (Setting color in urxvt)
[7]: https://www.x.org/releases/X11R7.7/doc/man/man1/xrdb.1.xhtml
