[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Find Out How Long Does it Take To Boot Your Linux System)
[#]: via: (https://itsfoss.com/check-boot-time-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Find Out How Long Does it Take To Boot Your Linux System
======

When you power on your system, you wait for the manufacturer’s logo to come up, a few messages on the screen perhaps (booting in insecure mode), [Grub][1] screen, operating system loading screen and finally the login screen.

Did you check how long did it take? Perhaps not. Unless you really need to know, you won’t bother with the boot time details.

But what if you are curious to know long long your Linux system takes to boot? Running a stopwatch is one way to find that but in Linux, you have better and easier ways to find out your system’s start up time.

### Checking boot time in Linux with systemd-analyze

![][2]

Like it or not, [systemd][3] is running on most of the popular Linux distributions. The systemd has a number of utilities to manage your Linux system. One of those utilities is systemd-analyze.

The systemd-analyze command gives you a detail of how many services ran at the last start up and how long they took.

If you run the following command in the terminal:

```
systemd-analyze
```

You’ll get the total boot time along with the time taken by firmware, boot loader, kernel and the userspace:

```
Startup finished in 7.275s (firmware) + 13.136s (loader) + 2.803s (kernel) + 12.488s (userspace) = 35.704s

graphical.target reached after 12.408s in userspace
```

As you can see in the output above, it took about 35 seconds for my system to reach the screen where I could enter my password. I am using Dell XPS Ubuntu edition. It uses SSD storage and despite of that it takes this much time to start.

Not that impressive, is it? Why don’t you share your system’s boot time? Let’s compare.

You can further breakdown the boot time into each unit with the following command:

```
systemd-analyze blame
```

This will produce a huge output with all the services listed in the descending order of the time taken.

```
7.347s plymouth-quit-wait.service
6.198s NetworkManager-wait-online.service
3.602s plymouth-start.service
3.271s plymouth-read-write.service
2.120s apparmor.service
1.503s [email protected]
1.213s motd-news.service
 908ms snapd.service
 861ms keyboard-setup.service
 739ms fwupd.service
 702ms bolt.service
 672ms dev-nvme0n1p3.device
 608ms [email protected]:intel_backlight.service
 539ms snap-core-7270.mount
 504ms snap-midori-451.mount
 463ms snap-screencloud-1.mount
 446ms snapd.seeded.service
 440ms snap-gtk\x2dcommon\x2dthemes-1313.mount
 420ms snap-core18-1066.mount
 416ms snap-scrcpy-133.mount
 412ms snap-gnome\x2dcharacters-296.mount
```

#### Bonus Tip: Improving boot time

If you look at this output, you can see that both network manager and [plymouth][4] take a huge bunch of boot time.

[][5]

Suggested read  How To Fix: No Unity, No Launcher, No Dash In Ubuntu Linux

Plymouth is responsible for that boot splash screen you see before the login screen in Ubuntu and other distributions. Network manager is responsible for the internet connection and may be turned off to speed up boot time. Don’t worry, once you log in, you’ll have wifi working normally.

```
sudo systemctl disable NetworkManager-wait-online.service
```

If you want to revert the change, you can use this command:

```
sudo systemctl enable NetworkManager-wait-online.service
```

Now, please don’t go disabling various services on your own without knowing what it is used for. It may have dangerous consequences.

_**Now that you know how to check the boot time of your Linux system, why not share your system’s boot time in the comment section?**_

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-boot-time-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/grub/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/linux-boot-time.jpg?resize=800%2C450&ssl=1
[3]: https://en.wikipedia.org/wiki/Systemd
[4]: https://wiki.archlinux.org/index.php/Plymouth
[5]: https://itsfoss.com/how-to-fix-no-unity-no-launcher-no-dash-in-ubuntu-12-10-quick-tip/
