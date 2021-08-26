[#]: subject: "Ulauncher: A Super Useful Application Launcher for Linux"
[#]: via: "https://itsfoss.com/ulauncher/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ulauncher: A Super Useful Application Launcher for Linux
======

_**Brief:**_ _Ulauncher is a fast application launcher with extension and shortcut support to help you quickly access application and files in Linux._

An application launcher lets you quickly access or open an app without hovering over the application menu icons.

By default, I found the application launcher with Pop!_OS super handy. But, not every Linux distribution offers an application launcher out-of-the-box.

Fortunately, there is a solution with which you can add the application launcher to most of the popular distros out there.

### Ulauncher: Open Source Application Launcher

![][1]

Ulauncher is a quick application launcher built using Python while utilizing GTK+.

It gives a decent amount of customization and control options to tweak. Overall, you can adjust its behavior and experience to suit your taste.

Let me highlight some of the features that you can expect with it.

### Ulauncher Features

The options that you get with Ulauncher are super accessible and easy to customize. Some key highlights include:

  * Fuzzy search algorithm, which lets you find applications even if you misspell them
  * Remembers your last searched application in the same session
  * Frequently used apps display (optional)
  * Custom color themes
  * Preset color themes that include a dark theme
  * Shortcut to summon the launcher can be easily customized
  * Browse files and directories
  * Support for extensions to get extra functionality (emoji, weather, speed test, notes, password manager, etc.)
  * Shortcuts for browsing sites like Google, Wikipedia, and Stack Overflow



It provides almost every helpful ability that you may expect in an application launcher, and even better.

### How to Use Ulauncher in Linux?

By default, you need to press **Ctrl + Space** to get the application launcher after you open it from the application menu for the first time.

Start typing in to search for an application. And, if you are looking for a file or directory, start typing with “**~**” or “**/**” (ignoring the quotes).

![][2]

There are default shortcuts like “**g XYZ**” where XYZ is the search term you want to search for in Google.

![][3]

Similarly, you can search for something directly taking you to Wikipedia or Stack Overflow, with “**wiki**” and “**so**” shortcuts, respectively.

Without any extensions, you can also calculate things on the go and copy the results directly to the keyboard.

![][4]

This should come in handy for quick calculations without needing to launch the calculator app separately.

You can head to its [extensions page][5] and browse for useful extensions along with screenshots that should instruct you how to use it.

To change how it works, enable frequent applications display, and adjust the theme — click on the gear icon on the right side of the launcher.

![][6]

You can set it to auto-start. But, if it does not work on your Systemd enabled distro, you can refer to its GitHub page to add it to the service manager.

The options are self-explanatory and are easy to customize, as shown in the screenshot below.

![][7]

### Installing Ulauncher in Linux

Ulauncher provides a **.deb** package for Debian or Ubuntu-based distributions. You can explore [how to install Deb][8] [f][8][iles][8] if you’re new to Linux.

In either case, you can also add its PPA and install it via terminal by following the commands below:

```
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update
sudo apt install ulauncher
```

You can also find it available in the [AUR][9] for Arch and Fedora’s default repositories.

For more information, you can head to its official website or the [GitHub page][10].

[Ulauncher][11]

Ulauncher should be an impressive addition to any Linux distro. Especially, if you want the functionality of a quick launcher like Pop!_OS offers, this is a fantastic option to consider.

_Have you tried Ulauncher yet? You are welcome to share your thoughts on how this might help you get things done quickly._

--------------------------------------------------------------------------------

via: https://itsfoss.com/ulauncher/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher.png?resize=800%2C512&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-directory.png?resize=800%2C503&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-google.png?resize=800%2C449&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-calculator.png?resize=800%2C429&ssl=1
[5]: https://ext.ulauncher.io
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-gear-icon.png?resize=800%2C338&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-settings.png?resize=800%2C492&ssl=1
[8]: https://itsfoss.com/install-deb-files-ubuntu/
[9]: https://itsfoss.com/aur-arch-linux/
[10]: https://github.com/Ulauncher/Ulauncher/
[11]: https://ulauncher.io
