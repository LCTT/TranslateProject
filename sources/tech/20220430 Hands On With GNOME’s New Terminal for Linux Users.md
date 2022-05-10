[#]: subject: "Hands On With GNOME’s New Terminal for Linux Users"
[#]: via: "https://itsfoss.com/gnome-console/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hands On With GNOME’s New Terminal for Linux Users
======
A few days ago, I shared my experience with the new GNOME Text Editor which is a replacement for the older Gedit editor.

A few days ago, I shared my [experience with the new GNOME Text Editor][1] which is a replacement for the older Gedit editor.

But that’s not the only ‘new’ replacement of an older application. GNOME 42 also has a new terminal called [Console][2].

Let me share what’s new in this new terminal offering from GNOME and what it is like to use it.

### Console: GNOME’s new Terminal Emulator

The aim of this new application is to provide a “simple user-friendly terminal emulator”. And it is indeed a ‘simple’ application in terms that it doesn’t offer many features you are accustomed to in the older application, GNOME Terminal.

I’ll come back to that point later. Let’s first see what’s new in GNOME Console.

#### Desktop notifications

GNOME Terminal in Ubuntu never had this feature though I have seen it in distributions like elementary and Fedora.

This is a handy feature that sends a desktop notification when a long-running command finishes its execution.

![Notification from GNOME Console][3]

Getting notified of command completion helps you stay productive when you are distracted by something else while the command runs.

#### Changes color for root operations

This is probably a unique feature I haven’t seen in any other terminal application.

When you use a command with sudo or [switch to the root user][4], the application window turns red.

![GNOME Console turns red when using sudo or root][5]

I presume the idea here is to warn the users that they are using escalated privileges and hence be careful while running the commands.

#### Themes

Following the new design guidelines, Console offers three theme variants: light, dark and system theme.

![themes gnome console][6]

System theme is used by default and based on whether your OS is using the dark or light theme, it changes the color. With dedicated dark and light options, you can change the theme irrespective of the system theme.

And that’s about it. There is not a lot of [terminal customization][7] you can perform here.

#### Transparent interface

GNOME Console has a transparent interface by default. In normal mode, you can see the background a little.

For example, you can see some blurred text from the background application:

![GNOME Console has a transparent interface][8]

What I noticed is that when Console goes into full-screen mode, the interface is no longer transparent. Also, you cannot configure the transparency.

#### Other features

You get to use tabs in Console, thankfully.

![Tabbed interface][9]

You can perform a search operation the same as the good old GNOME Terminal.

![Search operation in GNOME Console][10]

There are not a lot of options here. The hamburger menu allows you to look at all the available keyboard shortcuts at a glance.

![keyboard shortcuts in GNOME Console][11]

And that’s everything about the GNOME Console.

### Installing GNOME Console on Ubuntu 22.04

If you are using a distribution that uses vanilla GNOME 42, you should have the new terminal available by default.

Though Ubuntu 22.04 uses GNOME 22.04, it still uses the older GNOME Terminal. However, you can install the new one using this command:

```
sudo apt install gnome-console
```

### Conclusion

You might be wondering why a new Terminal application when we already have a better and more featureful GNOME Terminal. It’s because GNOME has new design guidelines. Transforming the old code base of these applications is too complicated and probably not worth the effort. Writing from scratch is easier and hence you see more ‘new’ GNOME applications like Console and Text Editor.

And as the idea of this new application is to keep things simpler, you don’t get a lot of features here. You cannot customize it, change the color, font, etc. Since there is no scope for customization, there is no need for profiles.

For people who seldom use the terminal, Console is sufficient. Although, I think that they should have added the feature to show asterisks while typing passwords. [Beginner-focused distros][12] like Mint use it to avoid confusing new Linux users.

What do you think of the new GNOME Console and the entire approach of creating ‘new GNOME apps’?

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-console/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/gnome-text-editor/
[2]: https://gitlab.gnome.org/GNOME/console
[3]: https://itsfoss.com/wp-content/uploads/2022/04/notification-from-gnome-console.png
[4]: https://itsfoss.com/root-user-ubuntu/
[5]: https://itsfoss.com/wp-content/uploads/2022/04/GNOME-Console-turns-red-when-using-sudo-or-root-800x442.webp
[6]: https://itsfoss.com/wp-content/uploads/2022/04/themes-gnome-console.png
[7]: https://itsfoss.com/customize-linux-terminal/
[8]: https://itsfoss.com/wp-content/uploads/2022/04/transparent-gnome-console.png
[9]: https://itsfoss.com/wp-content/uploads/2022/04/tabs-GNOME-Console.png
[10]: https://itsfoss.com/wp-content/uploads/2022/04/search-GNOME-Console.png
[11]: https://itsfoss.com/wp-content/uploads/2022/04/keyboard-shortcuts-gnome-console.png
[12]: https://itsfoss.com/best-linux-beginners/
