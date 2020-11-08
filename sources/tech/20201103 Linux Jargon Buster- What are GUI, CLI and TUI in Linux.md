[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What are GUI, CLI and TUI in Linux?)
[#]: via: (https://itsfoss.com/gui-cli-tui/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Jargon Buster: What are GUI, CLI and TUI in Linux?
======

When you start using Linux and follow Linux-based websites and forums, you’ll often come across terms like GUI, CLI and sometimes TUI.

This chapter of Linux Jargon Buster briefly explains these terms so that you as a (new) Linux user can understand the context better when these acronyms are used.

To be honest, the terms like GUI, CLI or TUI are not exclusive to Linux. These are generic computing terms and you’ll find them used in non-Linux discussions as well.

### GUI – Graphical User Interface

Probably the most common term you’ll across on It’s FOSS. It’s because we focus on desktop Linux users and try to cover the easy to use graphical methods and applications.

A GUI application or graphical application is basically anything that you can interact with your mouse, touchpad or touch screen. You have icons and other visual notions and you can use your mouse pointer to access the functionalities.

![GIMP: A GUI app for photo editing][1]

On Linux, a [desktop environment][2] provides the graphical interface for you to interact with your system. Then you can use GUI applications like GIMP, VLC Firefox, LibreOffice, file manager etc for various tasks.

GUI has made computing easier for the common users otherwise it would have remained a geek-only zone.

### CLI – Command Line Interface

CLI is basically a command line program that accepts inputs to perform a certain function. Basically, any application that you can use via commands in the terminal falls into this category.

![apt-cache is a CLI tool for interacting with APT cache on Debian-based systems][3]

Early computers didn’t have mouse to interact with the operating system. You had to do interact with the machine using commands.

If you think that’s difficult you should know that the earlier computers didn’t even have a screen to see what is being typed on, they had actual paper printer to see their typed commands. I have never used such a computer or seen in my real life. The closest thing I used was the microcontroller kits during my studies.

![Ken Thompson And Dennis Ritchie Working on developing UNIX operating system on PDP 11 computer. | Image Credit][4]

Is CLI relevant these days? Absolutely. Commands always have their benefit specially when you are dealing with the core functioning and configuration of the operating system like setting up firewall, managing network or even [package management][5].

You may have a GUI-based application to do the same task but commands give you more granular access to those features. In any case, you’ll find that GUI application also interact with the operating system with commands (used in their code).

![Handbrake GUI app uses FFMPEG CLI tool underneath][6]

Many popular GUI applications are often based on CLI tools. Take [Handbrake][7] for example. It’s a popular open source media converter and it uses the [FFMPEG command][8] line tool underneath.

Quite evidently, using command line tools is not as easy as the graphical ones. Don’t worry. Unless you have specific needs, you should be able to use your Linux system graphically. However, knowing the basic Linux commands helps a great deal.

### TUI – Terminal User Interface (also known as Text-based User Interface)

This is the most uncommon term of the three. TUI is basically part GUI and part CLI. Confused? Let me explain that for you.

You already know that early computers used CLI. Before the advent of the actual GUI, the text-based user interface provided a very basic kind of graphical interaction in the terminal. You have more visuals and could use mouse and keyboard to interact with the application.

![nnn File Browser in terminal][9]

TUI stands for text-based user interface or terminal user interface. Text-based because primarily, you have a bunch of text on the screen and terminal user interface because they are used only in the terminal.

TUI applications are not that common but you still have a bunch of them. [Terminal based web browsers][10] are good example of TUI programs. [Terminal-based games][11] also fell in this category.

![CMUS is terminal based music player][12]

You may come across TUI when you are [installing multimedia codecs in Ubuntu][13] where you have to accept EULA or make a choice.

TUI apps are not as user-friendly as GUI applications, and they often have a learning curve involved but they are a bit easier to use than the command line tools.

**In the end…**

TUI apps are often also considered as CLI applications because they are restricted to the terminal. In my opinion, it’s up to you if you consider them different from CLI.

I hope you liked this part of Linux Jargon Buster. If you have any suggestions for topics in this series, please let me know in the comments and I’ll try to cover them in the future.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gui-cli-tui/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/04/gimp-2-10-interface.jpg?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-search-names-only.png?resize=759%2C209&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/Ken_Thompson_and_Dennis_Ritchie_at_PDP-11.jpg?resize=800%2C641&ssl=1
[5]: https://itsfoss.com/package-manager/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/handbrake.png?resize=800%2C537&ssl=1
[7]: https://itsfoss.com/handbrake/
[8]: https://itsfoss.com/ffmpeg/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/nnn-file-browser.jpg?resize=800%2C597&ssl=1
[10]: https://itsfoss.com/terminal-web-browsers/
[11]: https://itsfoss.com/best-command-line-games-linux/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2017/07/cmus-interface.png?resize=734%2C436&ssl=1
[13]: https://itsfoss.com/install-media-codecs-ubuntu/
