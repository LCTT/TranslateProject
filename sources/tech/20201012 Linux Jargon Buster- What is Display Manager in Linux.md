[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What is Display Manager in Linux?)
[#]: via: (https://itsfoss.com/display-manager/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Jargon Buster: What is Display Manager in Linux?
======

_**In this chapter of the Linux Jargon Buster, you’ll learn about display manager in Linux. Is it part of the desktop environment? What does it do?**_

### What is display manager in Linux?

In simple words, a display manager is a program that provides graphical login capabilities for your Linux distribution. It controls the user sessions and manages user authentication. Display manager starts the [display server][1] and loads the [desktop environment][2] right after you enter your username and password.

The display manager is often synonymous to the login screen. It is the visible part of it after all. However, the visible login screen, also called greeter, is only a part of the display manager.

![Login screen is the visible part of a display manager][3]

Like [various desktop environments][4] and display servers, there are various display managers available as well. Let’s have a look at them.

### Different display managers

Some people think of the display manager as part of the desktop environment but that’s not true. It is a separate program.

A desktop environment may recommend a certain display manager but it doesn’t mean that it won’t work with some other display manager. If you ever installed more than one desktop environment in the same system, you would remember that a login screen (i.e. the display manager) allows you to switch the desktop environment.

![A display manager can be used with various desktop environments][5]

Though display manager is not part of the desktop environment itself, it is often developed by the same development team as the desktop environment. It also becomes identity of the desktop environment.

For example, the GNOME desktop environment develops GDM (GNOME Display Manager) and just by looking at the login screen, you would think of GNOME desktop environment.

![GNOME Login Screen with GDM][6]

Some popular display managers are:

  * GDM ([GNOME Display Manager][7]): preferred by GNOME
  * [SDDM][8] (Simple Desktop Display Manager): preferred by KDE
  * LightDM: Developed by Ubuntu for Unity desktop



### Display managers can be customized

There are so many desktop environments available. Do they all have their own display managers? No. That’s not the case.

As I mentioned previously, the visible login screen is called greeter. This greeter can be customized to change the looks of the login screen.

In fact, many distributions and/or desktop environments have written their own greeter to give users a login screen that resembles their brand.

For example, Mint’s Cinnamon desktop uses LightDM but has its own greeter to give it more Minty (or should I say Cinnamon) looks.

![Linux Mint login screen based on LightDM][9]

Take a look at Kali Linux’s login screen:

![Kali Linux Login Screen][10]

If you are into coding and tweaking, you may modify or code your own greeter as per your liking.

### Changing display manager

You may [change the display manager][11] if you want. You need to install the display manager first. You’ll see the option to switch the display manager while installing.

![][12]

If you didn’t do it at that time, then you can change the display manager by manually configuring it later. The method to reconfigure the display manager is slightly different for different distributions and not in the scope of this article.

**Conclusion**

I hope you have a slight better understanding of the term display manager in Linux. The aim of this jargon buster series is to explain common Linux colloquial and technical terms in non-technical language without going into too much detail.

I welcome your comments and suggestion.

--------------------------------------------------------------------------------

via: https://itsfoss.com/display-manager/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/display-server/
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/05/login-screen-opensuse.jpg?resize=800%2C474&ssl=1
[4]: https://itsfoss.com/best-linux-desktop-environments/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/deepin-session-ubuntu.jpg?resize=800%2C414&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Login-screen-1.png?resize=800%2C450&ssl=1
[7]: https://wiki.gnome.org/Projects/GDM
[8]: https://github.com/sddm
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/linux-mint-login-screen.jpg?resize=800%2C418&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/kali-linux-login-screen.jpg?resize=799%2C450&ssl=1
[11]: https://itsfoss.com/switch-gdm-and-lightdm-in-ubuntu-14-04/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2014/06/Switch_between_gdm_and_lightgdm_Ubuntu.jpeg?resize=700%2C448&ssl=1
