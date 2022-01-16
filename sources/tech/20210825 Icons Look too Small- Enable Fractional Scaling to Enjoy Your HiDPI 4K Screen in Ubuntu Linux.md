[#]: subject: "Icons Look too Small? Enable Fractional Scaling to Enjoy Your HiDPI 4K Screen in Ubuntu Linux"
[#]: via: "https://itsfoss.com/enable-fractional-scaling-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Icons Look too Small? Enable Fractional Scaling to Enjoy Your HiDPI 4K Screen in Ubuntu Linux
======

A few months ago, I bought a Dell XPS laptop with a 4K UHD screen. The screen resolution is 3840×2400 resolution with a 16:10 aspect ratio.

When I was installing Ubuntu on it, everything looked so small. The desktop icons, applications, menus, items in the top panel, everything.

It’s because the screen has too many pixels but the desktop icons and rest of the elements remain the same in size (as on a regular screen of 1920×1080). Hence, they look too small on the HiDPI screen.

![Icons and other elements look too small on a HiDPI screen in Ubuntu][1]

This is not pretty and makes it very difficult to use your Linux system. Thankfully, there is a solution for GNOME desktop users.

If you too have a 2K or 4K screen where the desktop icons and other elements look too small, here’s what you need to do.

### Scale-up display if the screen looks too small

If you have a 4K screen, you can scale the display to 200%. This means that you are making every element twice its size.

Press the Windows key and search for Settings:

![Go to Settings][2]

In Settings, go to Display settings.

![Access the Display Settings and look for Scaling][3]

Here, select 200% as the scale factor and click on Apply button.

![Scaling the display in Ubuntu][4]

It will change the display settings and ask you to confirm whether you want to keep the changed settings or revert to the original. If things look good to you, select “Keep Changes.”

Your display settings will be changed and remain the same even after reboots until you change it again.

### Enable fractional scaling (suitable for 2K screens)

200% scaling is good for 4K screens however if you have a 2K screen, the 200% scaling will make the icons look too big for the screen.

Now you are in the soup. You have the screen looking too small or too big. What about a mid-point?

Thankfully, [GNOME][5] has a fractional scaling feature that allows you to set the scaling to 125%, 150%, and 175%.

#### Using fractional scaling on Ubuntu 20.04 and newer versions

Ubuntu 20.04 and the new versions have newer versions of GNOME desktop environment and it allows you to enable or disable fractional scaling from Display settings itself.

Just go to the Display settings and look for the Fractional Scaling switch. Toggle it to enable or disable it.

When you enable the fractional scaling, you’ll see new scaling factors between 100% to 200%. You can choose the one which is suitable for your screen.

![Enable fractional scaling][6]

#### Using fractional scaling on Ubuntu 18.04

You’ll have to make some additional efforts to make it work on the older Ubuntu 18.04 LTS version.

First, [switch to Wayland from Xorg][7].

Second, enable fractional scaling as an experimental feature using this command:

```
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
```

Third, restart your system and then go to the Display settings and you should see the fractional scaling toggle button now.

#### Disabling fractional scaling on Ubuntu 18.04

If you are experiencing issues with fractional scaling, like increased power consumption and mouse lagging, you may want to disable it. Wayland could also be troublesome for some applications.

First, toggle the fractional scaling switch in the display settings. Now use the following command to disable the experimental feature.

```
gsettings reset org.gnome.mutter experimental-features
```

Switch back to Xorg from Wayland again.

### Multi-monitor setup and fractional scaling

4K screen is good but I prefer a multi-monitor setup for work. The problem here is that I have two Full HD (1080p) monitors. Pairing them with my 4K laptop screen requires little settings change.

What I do here is to keep the 4K screen at 200% scaling at 3840×2400 resolution. At the same time, I keep the full-HD monitors at 100% scaling with 1920×1080 resolution.

![HiDPI screen is set at 200%][8]

![Full HD screens are set at 100%][9]

![Full HD screens are set at 100%][10]

To ensure a smooth experience, you should take care of the following:

  * Use Wayland display server: It is a lot better at handling multi-screens and HiDPI screens than the legacy Xorg.
  * Even if you use only 100% and 200% scaling, enabling fractional scaling is a must, otherwise, it doesn’t work properly. I know it sounds weird but that’s what I have experienced.



### Did it help?

HiDPI support in Linux is far from perfect but it is certainly improving. Newer desktop environment versions of GNOME and KDE keep on improving on this front.

Fractional scaling with Wayland works quite well. It is improving with Xorg as well but it struggles especially on a multi-monitor set up.

I hope this quick tip helped you to enable fractional scaling in Ubuntu and enjoy your Linux desktop on a UHD screen.

Please leave your questions and suggestions in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/enable-fractional-scaling-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/wp-content/uploads/2021/08/HiDPI-screen-icons-too-small-in-Ubuntu.webp
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/settings-application-ubuntu.jpg?resize=800%2C247&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/display-settings-scaling-ubuntu.png?resize=800%2C432&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/scale-display-ubuntu.png?resize=800%2C443&ssl=1
[5]: https://www.gnome.org/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/enable-fractional-scaling.png?resize=800%2C452&ssl=1
[7]: https://itsfoss.com/switch-xorg-wayland/
[8]: https://itsfoss.com/wp-content/uploads/2021/08/fractional-scaling-ubuntu-multi-monitor-3.webp
[9]: https://itsfoss.com/wp-content/uploads/2021/08/fractional-scaling-ubuntu-multi-monitor-2.webp
[10]: https://itsfoss.com/wp-content/uploads/2021/08/fractional-scaling-ubuntu-multi-monitor-1.webp
