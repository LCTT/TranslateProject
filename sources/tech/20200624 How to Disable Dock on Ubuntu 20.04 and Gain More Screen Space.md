[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Disable Dock on Ubuntu 20.04 and Gain More Screen Space)
[#]: via: (https://itsfoss.com/disable-ubuntu-dock/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Disable Dock on Ubuntu 20.04 and Gain More Screen Space
======

The launcher on the left side has become the identity of [Ubuntu][1] desktop. It was introduced with [Unity desktop][2] and even [when Ubuntu switched to GNOME][3], it forked Dash to Panel to create a similar dock on [GNOME][4] as well.

Personally, I find it handy for quickly accessing the frequently used applications. But not everyone wants it to take some extra space on the screen.

Starting with [Ubuntu 20.04][5], you can easily disable this dock. Let me show you how to do that graphically and via command line in this quick tutorial.

![][6]

### Disable Ubuntu dock with Extensions app

One of the [main features of Ubuntu 20.04][7] was the introduction of Extensions to manage GNOME extensions on your system. Just look for it in the GNOME menu (press Windows key and start typing):

![Look for Extensions app in the menu][8]

Don’t have Extensions app?

If you don’t have it installed already, you should enable GNOME Shell Extensions. The Extensions GUI app is part of this package.

```
sudo apt install gnome-shell-extensions
```

This is only valid for [GNOME 3.36][9] or higher version available in Ubuntu 20.04 and higher versions.

Start the extensions app and you should see Ubuntu Dock under the Built-in extensions section. You just have to toggle the button off to disable the dock.

![Disable Ubuntu Dock][10]

The change is immediate and you’ll see that dock disappears immediately.

You can bring it back the same way. Just toggle it on and it will appear immediately.

So easy to hide the dock in Ubuntu 20.04, isn’t it?

### Alternative Method: Disable Ubuntu dock via command line

If you are a terminal enthusiast and prefer to do things in the terminal, I have good news for you. You can disable the Ubuntu dock from command line.

Open a terminal using Ctrl+Alt+T. You probably already know that [keyboard shortcut in Ubuntu][11].

In the terminal, use the following command to list all the available GNOME extensions:

```
gnome-extensions list
```

This will show you an output similar to this:

![List GNOME Extensions][12]

The default Ubuntu dock extension is [[email protected]][13] You can disable it using this command:

```
gnome-extensions disable [email protected]
```

There will be no output message displayed on the screen but you’ll notice that the launcher or dock disappears from the left side.

If you want, you can enable it again using the same command as above but with enable option this time:

```
gnome-extensions enable [email protected]
```

**Conclusion**

There are ways to disable the dock in Ubuntu 18.04 as well. However, it may lead to unwarranted situations if you try to remove it in 18.04. Removing this package also removes the ubuntu-desktop package and you may end up with a system with broken functionalities like no application menu.

This is the reason why I won’t recommend removing it on Ubuntu 18.04.

It’s good that Ubuntu 20.04 gives a way to hide the taskbar. Users have more freedom and more screen space. Speaking of more screen space, did you know that you can [remove the top title bar from Firefox and gain more screen space][14]?

I am wondering how do you prefer your Ubuntu desktop? With the dock, without dock or without GNOME?

--------------------------------------------------------------------------------

via: https://itsfoss.com/disable-ubuntu-dock/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://ubuntu.com/
[2]: https://itsfoss.com/keeping-ubuntu-unity-alive/
[3]: https://itsfoss.com/ubuntu-unity-shutdown/
[4]: https://www.gnome.org/
[5]: https://itsfoss.com/download-ubuntu-20-04/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/disable-dock-in-ubuntu.png?ssl=1
[7]: https://itsfoss.com/ubuntu-20-04-release-features/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/GNOME-extensions-app-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/gnome-3-36-release/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/disable-ubuntu-dock.png?ssl=1
[11]: https://itsfoss.com/ubuntu-shortcuts/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/list-gnome-extensions.png?ssl=1
[13]: https://itsfoss.com/cdn-cgi/l/email-protection
[14]: https://itsfoss.com/remove-title-bar-firefox/
