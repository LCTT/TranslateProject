[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Enable ‘Tap to click’ on Ubuntu Login Screen [Quick Tip])
[#]: via: (https://itsfoss.com/enable-tap-to-click-on-ubuntu-login-screen/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Enable ‘Tap to click’ on Ubuntu Login Screen [Quick Tip]
======

_**Brief: The tap to click option doesn’t work on the login screen in Ubuntu 18.04 GNOME desktop. In this tutorial, you’ll learn to enable the ‘tap to click’ on the Ubuntu login screen.**_

One of the first few things I do after installing Ubuntu is to make sure that tap to click has been enabled. As a laptop user, I prefer to tap the touchpad for making a left click. This is more convenient than using the left click button on the touchpad all the time.

This is what happens when I have logged in and using the operating system. But if you are at the login screen, the tap to click doesn’t work and that’s an annoyance.

On the [GDM login screen][1] in Ubuntu (or other distributions using GNOME desktop), you have to click the username in order to bring the password field. Now if you are habitual of tap to click, it doesn’t work on the login screen even if you have it enabled and use it after logging into the system.

This is a minor annoyance but an annoyance nonetheless. The good news is that you can fix this annoyance.Let me show you how to do that in this quick tip.

### Enabling tap to click on Ubuntu login screen

![][2]

You’ll have to use the terminal and a few commands here. I hope you are comfortable with it.

[Open a terminal using Ctrl+Alt+T shortcut in Ubuntu][3]. Since Ubuntu 18.04 is still using X server, you need to enable it to connect to the [x server][4]. For that, you can add gdm to access control list.

Switch to root user first. It’s required because you have to switch as gdm user later and you cannot do that as a non-root user.

```
sudo -i
```

[There is no password set for root user in Ubuntu][5]. You access it with your admin user account. So when asked for password, use your own password. You won’t see anything being typed on the screen when you type in your password.

```
xhost +SI:localuser:gdm
```

Here’s the output for me:

```
xhost +SI:localuser:gdm
localuser:gdm being added to access control list
```

Now run this command so that the the ‘user gdm’ has the correct tap to click setting.

```
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
```

If you see a warning like this: (process:6339): dconf-WARNING **: 19:52:21.217: Unable to open /root/.local/share/flatpak/exports/share/dconf/profile/user: Permission denied . Don’t worry. Just ignore it.

[][6]

Suggested read  How To Change Hostname on Ubuntu &amp; Other Linux Distributions

This will enable you to perform a tap to click on the login screen. Why were you not able to use tap to click when you made the changes in the system settings before? It’s because at the login screen, you haven’t selected your username yet. You get to use your account only when you select the user on the screen. This is why you had to use the user gdm and add the correct settings with it.

Restart Ubuntu and you’ll see that you can now use the tap to select your user account now.

#### Revert the changes

If you are not happy with the tap to click on the Ubuntu login screen for some reason, you can revert the changes.

You’ll have to perform all the steps you did in the previous section: switch to root, connect gdm with x server, switch to gdm user. But instead of the last command, you need to run this command:

```
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
```

That’s it.

As I said, it’s a tiny thing. I mean you can easily do a left click instead of the tap to click. It’s just a matter of one single click.However, it breaks the ‘continuity’ when you are forced to use the left click after a few taps.

I hope you liked this quick little tweak. If you know some other cool tweaks, do share it with us.

--------------------------------------------------------------------------------

via: https://itsfoss.com/enable-tap-to-click-on-ubuntu-login-screen/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.archlinux.org/index.php/GDM
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/tap-to-click-on-ubuntu-login.jpg?ssl=1
[3]: https://itsfoss.com/ubuntu-shortcuts/
[4]: https://en.wikipedia.org/wiki/X.Org_Server
[5]: https://itsfoss.com/change-password-ubuntu/
[6]: https://itsfoss.com/change-hostname-ubuntu/
