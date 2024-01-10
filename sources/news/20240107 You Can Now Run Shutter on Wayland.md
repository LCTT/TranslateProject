[#]: subject: "You Can Now Run Shutter on Wayland!"
[#]: via: "https://news.itsfoss.com/shutter-wayland-linux/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

You Can Now Run Shutter on Wayland!
======
You don't have to stop using Shutter on Wayland!
Oh man, I was dreading the day I would have to switch to a Wayland-only Linux distribution, only to see that [Shutter][1] does not work.

It is one of the [best tools for taking and editing screenshots in Linux][2] and I use it daily for taking all kinds of screenshots for my work here and elsewhere.

I know that the GNOME screenshot tool has come a long way, but as they say, “ **Old habits die hard** ”. So, naturally, I was quite excited when I found out that there was a way to run Shutter on Wayland in all its glory.

Join me as I take you through this **wonderful open-source project that was started by a fellow Shutter enthusiast** with the sole aim of making it work on Wayland-equipped distros.

**Suggested Read** 📖

![][3]

### Shutter on Wayland: What to Expect?

Kick-started by Maurizio, an IT developer from Italy who likes Linux, **Shutter on Wayland is a project that was born because he was unhappy** that Shutter was not playing nice on his Ubuntu system.

So, he began by forking the Shutter repo and started by leveraging the [gnome-screenshot][4] command line utility, **while also keeping the user interface and behavior untouched**.

As you can see below, **the project is identical to what you expect from Shutter** , with all the usual options found in the interface. I didn't feel any differences while I used it to take screenshots on a virtual machine running Ubuntu 23.10.

![][5]

I could also **take window-only and selection area screenshots with ease**. It is just that the dropdown menu that you usually get for taking screenshots of specific windows or desktops didn't seem to work, rather it was replaced by a different behavior.

📋

That's the result of the selection capture I did on Ubuntu 23.10 with Wayland.

![][6]

For taking screenshots of specific desktops in your system, you will have to switch to that and bring Shutter for Wayland to the same screen, then use the “Desktop” option to capture a screenshot.

![][7]

It is the same for taking window screenshots too, just bring the app and Shutter for Wayland in the same screen and use the “Window” option to take a screenshot of that.

**For now, that is enough for me**. I really hope that Shutter's development picks up soon, and we get to see such improvements implemented into the original project.

### 📥 Download Shutter on Wayland

Before you begin, you have to ensure that you uninstall any previously installed version of Shutter.

Then, opt for one of two ways of getting this Shutter variant. The first is by heading over to its [GitHub repo][8] and downloading the provided “ _.deb_ ” file.

[Shutter on Wayland (GitHub)][9]

The second approach is the one that I would recommend **for Ubuntu 23.10 and later** , since it handles all the dependencies. You just have to run the following commands:

```

    setfacl -m u:_apt:rx .
    wget https://github.com/mvivarelli/shutter-on-wayland/raw/master/shutter-on-wayland_0.99.4-6_all.deb
    sudo apt -f install ./shutter-on-wayland_0.99.4-6_all.deb

```

If Shutter hangs or lags after being launched post-install, you can do a system reboot to resolve the issue.

_💬 What do you think of this project? Would you use it?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/shutter-wayland-linux/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://shutter-project.org/
[2]: https://itsfoss.com/take-screenshot-linux/
[3]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[4]: https://gitlab.gnome.org/GNOME/gnome-screenshot
[5]: https://news.itsfoss.com/content/images/2024/01/Shutter_on_Wayland_1-1.png
[6]: https://news.itsfoss.com/content/images/2024/01/Shutter_on_Wayland_2-1.png
[7]: https://news.itsfoss.com/content/images/2024/01/Shutter_on_Wayland_3.png
[8]: https://github.com/mvivarelli/shutter-on-wayland/tree/master
[9]: https://github.com/mvivarelli/shutter-on-wayland/blob/master/shutter-on-wayland_0.99.4-6_all.deb
