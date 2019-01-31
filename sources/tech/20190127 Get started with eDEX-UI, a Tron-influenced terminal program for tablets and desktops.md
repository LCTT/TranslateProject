[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with eDEX-UI, a Tron-influenced terminal program for tablets and desktops)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-edex-ui)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with eDEX-UI, a Tron-influenced terminal program for tablets and desktops
======
Make work more fun with eDEX-UI, the 15th in our series on open source tools that will make you more productive in 2019.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the 15th of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### eDEX-UI

I was 11 years old when [Tron][1] was in movie theaters. I cannot deny that, despite the fantastical nature of the film, it had an impact on my career choice later in life.

![](https://opensource.com/sites/default/files/uploads/edex-ui-1.png)

[eDEX-UI][2] is a cross-platform terminal program designed for tablets and desktops that was inspired by the user interface in Tron. It has five terminals in a tabbed interface, so it is easy to switch between tasks, as well as useful displays of system information.

At launch, eDEX-UI goes through a boot sequence with information about the ElectronJS system it is based on. After the boot, eDEX-UI shows system information, a file browser, a keyboard (for tablets), and the main terminal tab. The other four tabs (labeled EMPTY) don't have anything loaded and will start a shell when you click on one. The default shell in eDEX-UI is Bash (if you are on Windows, you will likely have to change it to either PowerShell or cmd.exe).

![](https://opensource.com/sites/default/files/uploads/edex-ui-2.png)

Changing directories in the file browser will change directories in the active terminal and vice-versa. The file browser does everything you'd expect, including opening associated applications when you click on a file. The one exception is eDEX-UI's settings.json file (in .config/eDEX-UI by default), which opens the configuration editor instead. This allows you to set the shell command for the terminals, change the theme, and modify several other settings for the user interface. Themes are also stored in the configuration directory and, since they are also JSON files, creating a custom theme is pretty straightforward.

![](https://opensource.com/sites/default/files/uploads/edex-ui-3.png)

eDEX-UI allows you to run five terminals with full emulation. The default terminal type is xterm-color, meaning it has full-color support. One thing to be aware of is that the keys light up on the keyboard while you type, so if you're using eDEX-UI on a tablet, the keyboard could present a security risk in environments where people can see the screen. It is better to use a theme without the keyboard on those devices, although it does look pretty cool when you are typing.

![](https://opensource.com/sites/default/files/uploads/edex-ui-4.png)

While eDEX-UI supports only five terminal windows, that has been more than enough for me. On a tablet, eDEX-UI gives me that cyberspace feel without impacting my productivity. On a desktop, eDEX-UI allows all of that and lets me look cool in front of my co-workers.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-edex-ui

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Tron
[2]: https://github.com/GitSquared/edex-ui
