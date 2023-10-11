[#]: subject: "Add Minimize and Maximize Buttons in GNOME"
[#]: via: "https://itsfoss.com/gnome-minimize-button/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Add Minimize and Maximize Buttons in GNOME
======

Unlike Ubuntu, [distributions like Fedora][1] and Arch Linux give you vanilla GNOME and one thing that may bother you is the lack of minimize and maximize buttons on the application windows.

![No minimize or maximize button in application windows, only close button][2]

GNOME expects you to use the application switcher (Alt+Tab) or utilize the activities area (Super key) to just switch between running applications, instead of minimizing it.

The good thing is that you don't have to live like that if you don't want it.

Let me share how you can bring back the minimize and maximize buttons in GNOME using both GUI and command line options.

### Method 1: Enable minimize and maximize buttons using GNOME Tweaks

GNOME Tweaks tool allows you customize various aspects of GNOME. Enabling minimize windows buttons is one of them.

Install GNOME Tweaks tool using your distribution's package manager first.

Run the application and go to the Windows Titlebars from the left sidebar. You'll see the options to add minimize and maximize buttons here,

![][3]

You can choose either or both. If you don't want it anymore, **you can disable the buttons the same way in GNOME Tweaks tool**.

💡

You can also choose to put these control buttons on the left side if you want. The option is right there at the end of the Titelbar Buttons options.

### Method 2: Use command line to enable minimize and maximize buttons

The gsettings command has the option to change the button layout and add the minimize and maximize buttons.

```

    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

```

As you can guess, if you want **to disable any of the buttons, you run the same command but omit the undesired one from the command**.

💡

You may also move the windows control buttons to the left by putting the colon in right side in the command:
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

### Getting inspired by macOS is not always a good thing

Clearly, this 'no minimize button' design is inspired by Apple's macOS. I remember that around 10 years back, macOS used to have the Windows control on the left. So Ubuntu Unity also tried keeping controls on the left side by default.

Apple is weird. They have good designs most of the time but they prioritize design over use experience at times. The 'magic mouse' is an example.

> “Magic Mouse loved by users”. You sure about that? [pic.twitter.com/hxGtTxIrlu][4]
>
> — Stuart (@stuwieface) [April 20, 2021][5]

I don't see why GNOME developers have this need of getting inspired by every design, specially the poor ones.

But that's just my opinion. I am happy that there exists a quick and easy solution to bring back the minimize and maximize buttons in GNOME.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-minimize-button/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-fedora-linux-distributions/
[2]: https://itsfoss.com/content/images/2023/10/missing-minimize-button-gnome.png
[3]: https://itsfoss.com/content/images/2023/10/enable-minimize-maximize-windows-option-gnome-tweaks.png
[4]: https://t.co/hxGtTxIrlu
[5]: https://twitter.com/stuwieface/status/1384561367223521286?ref_src=twsrc%5Etfw
