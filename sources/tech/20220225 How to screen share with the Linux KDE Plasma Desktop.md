[#]: subject: "How to screen share with the Linux KDE Plasma Desktop"
[#]: via: "https://opensource.com/article/22/2/screen-share-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to screen share with the Linux KDE Plasma Desktop
======
The combination of krfb and krdc are valuable tools for making remote
Linux support frustration-free.
![Person using a laptop][1]

If you've ever done remote support professionally or out of familial obligation, then you've been on a call where solving problems are only secondary to the impossible task of visualizing what's actually on your user's screen. How many times have you described complex desktop tasks only to later realize that your user hasn't even turned their computer on yet? Support is important, but the frustration is real, and it's a shared experience for both the people in need of support and the people who graciously try to provide it. I believe it's important for people to perform tasks themselves as a way to learn a new skill, but there's also an argument for observing the way it's meant to be done by an expert. That's what screen sharing is for, and the KDE Plasma Desktop has it built-in.

### Network safety

The Plasma Desktop uses a point-to-point invitation model for screen sharing. The user launches an application, which starts a Virtual Network Connection (VNC) server, at which point the support person is able to view and even control the computer remotely. If it sounds like this is potentially unsafe, that's because it can be, but for the intervention of firewalls. If you're the support person for somebody who's not on the same network as you, then you must set up a safe pathway from your network to your user's network before screen sharing can work. Ideally, you would do this before emergency strikes:

  1. [Configure the user's router][2] to route the VNC port (5900 by default, but you can use any port you like) to their computer.
  2. [Open a service in the user's local firewall][3] to permit VNC traffic (on the port you specified in the first step).



### Remote invitation

To start a screen sharing session, the user must start the **krfb** (that stands for _KDE remote frame buffer_) application. This starts a VNC server, and creates a temporary password.

![krfb][4]

(Seth Kenlon, [CC BY-SA 4.0][5])

The default port **krfb** uses is 5900, but you can change that if you need to in **krfb** settings. This is something you probably would want to do in advance, however, so you can avoid trying to explain to your user how to change a protocol's port.

### Viewing and controlling

While this window is open, you can log in over VNC using your favorite VNC client. KDE includes the **krdc** (that stands for _KDE remote desktop client_) application. On the support computer, launch it and provide it with the destination IP address. When you're prompted for a password, enter the one showing in the **krfb** session you're connecting to.

![Screen sharing with krdc][6]

(Seth Kenlon, [CC BY-SA 4.0][5])

Once you've connected, you can view your user's screen, and you can guide them as they follow your instructions. If they're having trouble following your directions, then you can take control of their mouse and demonstrate how something is done. By default, **krfb** (that's the application _they're_ running) asks them for permission before relinquishing control to you.

### Help is on the way

Having the ability to see what your user sees can speed up troubleshooting and lessen frustration on both sides of a support call. Provided that you set up the network for your support in advance, the combination of **krfb** and **krdc** are valuable tools for the Linux professional guiding new users through their journey of Linux desktop discovery.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/screen-share-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/9/firewall
[3]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[4]: https://opensource.com/sites/default/files/kde-krfb.jpg (krfb)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/kde-krdc-session.jpg (Screen sharing with krdc)
