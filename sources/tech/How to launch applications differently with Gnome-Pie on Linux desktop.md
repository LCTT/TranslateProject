How to launch applications differently with Gnome-Pie on Linux desktop
================================================================================
The biggest complaint you can hear those days about Ubuntu is the new Unity interface. I remember leaving for Archlinux precisely when Unity started to rise, and when it was made clear that it was here to stay. However, Unity indirectly has led to good consequences: it allowed other distributions and other desktop environments to become more prominent as people were unhappy with it. If your system can support it, no one is against a bit of eye candy.

So today I shall propose you a different type of application launcher which is definitely original: Gnome-Pie. Some of you may recognize the inspiration from the World of Warcraft addon "OPie." The concept is similar: a keyboard shortcut opens a circular "pie" from which you can select an application or a command to launch. The main idea behind that design is that a user does not have to remember the name of a command, but its direction. The fact that it is circular makes every application at the same distance from the pointer. Plus we get the combo that so many gamers adopted: left hand on the keyboard and right hand on the mouse. The two combined intend to minimize the amount of time needed and maximize the ergonomy.

### Gnome-Pie Installation ###

On Ubuntu, Gnome-Pie is available from the universe repository, but for some reason this version crashes at startup. Instead, I advise you to get it from the official PPA repository:

    $ sudo add-apt-repository ppa:simonschneegans/testing
    $ sudo apt-get update
    $ sudo apt-get install gnome-pie 

On Fedora, use this command to install it:

    $ sudo yum install gnome-pie 

For Archlinux, the package is on [AUR][1].

### Basic Usage of Gnome-Pie ###

By default, Gnome-Pie comes with a very decent initial configuration. The first pie, summoned with Ctrl+Alt+a, displays your system's basic applications. 

![](https://farm3.staticflickr.com/2917/14040269128_6dc6544c14_z.jpg)

The second pie, associated with Ctrl+Alt+b, brings your file manager's bookmarks.

![](https://farm3.staticflickr.com/2903/14040269088_8de29edd18.jpg)

The third pie is maybe the most useful as it displays your application menu, callable by Ctrl+Alt+Space.

![](https://farm3.staticflickr.com/2903/14040345657_071f40b22f_z.jpg)

The fourth pie is exclusively to control the music player. As you can guess, the shortcut is Ctrl+Alt+m.

![](https://farm3.staticflickr.com/2925/14226915065_8b0e3841c6_o.png)

The fifth pie is a quick access to the reboot, shutdown, and log out commands (with Ctrl+Alt+q, q for quit I suppose).

![](https://farm3.staticflickr.com/2931/14040303600_5b3a517335_o.png)

Finally, the sixth pie controls the windows, allowing you to minimize, scale, close, etc. And of course, the shortcut is Ctrl+Alt+w. 

![](https://farm3.staticflickr.com/2904/14226699514_42d364a4d4_o.png)

I find this default setup already pretty satisfactory, almost as good as an out-of-the-box launcher. However, if I wanted to be picky, I would say that some shortcuts are hard to perform with just one hand, and it is kind of frustrating to use two hands to call a pie, and then go back to the mouse to select the option. But again I am being picky.

However, we are on Linux! Who cares about the default? The whole point is to configure like crazy, and make the system our own. With Gnome-Pie, you are well served. The configuration screen lets you edit the current pies, change the shortcuts, select the icons, make your own pie, change the theme, and even make pie menu that summons another pie. 

[![](https://farm6.staticflickr.com/5508/14247093043_1fe1188709_z.jpg)][2]

You can even edit the pie to launch an URL, simulate a hotkey activation, or just your own command. The only thing that is potentially missing is the possibility to have widgets. 

![](https://farm3.staticflickr.com/2927/14040264609_b7aa66f078_z.jpg)

In conclusion, Gnome-Pie is a quite attractive visual application launcher which differs from traditional text-based launchers. I really like the combo left hand on the keyboard and right hand on the mouse, which does indeed remind me of Warcraft or even Leagues of Legend. If players adopted this kind of system, it is because it is convenient and efficient. I would even advise it if you are trying to save some space on the screen, and don't want a launcher constantly on the screen. As a last word, I would even dare to say that it provides an interesting alternative to the awesome Gnome-Do.

What do you think? Do you believe in eye candy at all? Or is Gnome-Pie out of the question since the new Gnome shell entered the competition? Please let us know in the comments. 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/launch-applications-differently-gnome-pie-linux-desktop.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://aur.archlinux.org/packages/gnome-pie/
[2]:https://www.flickr.com/photos/xmodulo/14247093043/
