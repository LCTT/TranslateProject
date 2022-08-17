[#]: subject: "4 cool new projects to try in Copr for August 2022"
[#]: via: "https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-august-2022/"
[#]: author: "Jiri Kyjovsky https://fedoramagazine.org/author/nikromen/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 cool new projects to try in Copr for August 2022
======

![4 packages to try from the Copr repos][1]

[Copr][2] is a build system for anyone in the Fedora community. It hosts thousands of projects for various purposes and audiences. Some of them should never be installed by anyone, some are already being transitioned to the official Fedora Linux repositories, and the rest are somewhere in between. Copr gives you the opportunity to install third-party software that is not available in Fedora Linux repositories, try nightly versions of your dependencies, use patched builds of your favorite tools to support some non-standard use cases, and just experiment freely.

If you don’t know [how to enable a repository][3] or if you are concerned about whether [it is safe to use Copr][4], please consult the [project documentation][5].

This article takes a closer look at interesting projects that recently landed in Copr.

### **Ntfy**

[Ntfy][6] is a simple HTTP-based notification service that allows you to send notifications to your devices using scripts from any computer. To send notifications ntfy uses PUT/POST commands or it is possible to send notifications via ntfy __CLI without any registration or login_._ For this reason, choose a hard-to guess topic name, as this is essentially a password.

In the case of sending notifications, it is as simple as this:

```

    $ ntfy publish beer-lovers "Hi folks. I love beer!"
    {"id":"4ZADC9KNKBse", "time":1649963662, "event":"message", "topic":"beer-lovers", "message":"Hi folks. I love beer!"}

```

And a listener who subscribes to this topic will receive:

```

    $ ntfy subscribe beer-lovers
    {"id":"4ZADC9KNKBse", "time":1649963662, "event":"message", "topic":"beer-lovers", "message":"Hi folks. I love beer!"}

```

If you wish to receive notifications on your phone, then ntfy also has a [mobile app][7] for Android so you can send notifications from your laptop to your phone.

![][8]

#### **Installation instructions**

The [repo][9] currently provides _ntfy_ for Fedora Linux 35, 36, 37, and Fedora Rawhide. To install it, use these commands:

```

    sudo dnf copr enable cyqsimon/ntfysh
    sudo dnf install ntfysh

```

### Koi

If you use light mode during the day but want to protect your eyesight overnight and switch to dark mode, you don’t have to do it manually anymore. [Koi][10] will do it for you!

Koi provides KDE Plasma Desktop functionality to automatically switch between light and dark mode according to your preferences. Just set the time and themes.

![][11]

#### **Installation instructions**

The [repo][12] currently provides _Koi_ for Fedora Linux 35, 36, 37, and Fedora Rawhide. To install it, use these commands:

```

    sudo dnf copr enable birkch/Koi
    sudo dnf install Koi

```

### **SwayNotificationCenter**

[SwayNotificationCenter][13] provides a simple and nice looking GTK GUI for your desktop notifications.

You will find some key features such as do-not-disturb mode, a panel to view previous notifications, track pad/mouse gestures, support for keyboard shortcuts, and customizable widgets. SwayNotificationCenter also provides a good way to [configure and customize][14] via JSON and CSS files.

More information on <https://github.com/ErikReider/SwayNotificationCenter> with screenshots at the bottom of the page.

#### **Installation instructions**

The [repo][15] currently provides _SwayNotificationCenter_ for Fedora Linux 35, 36, 37, and Fedora Rawhide. To install it, use these commands:

```

    sudo dnf copr enable erikreider/SwayNotificationCenter
    sudo dnf install SwayNotificationCenter

```

### **Webapp Manager**

Ever want to launch your favorite websites from one place? With [WebApp][16] manager, you can save your favorite websites and run them later as if they were an apps.

You can set a browser in which you want to open the website and much more. For example, with Firefox, all links are always opened within the WebApp.

![][17]

#### **Installation instructions**

The [repo][18] currently provides _WebApp_ for Fedora Linux 35, 36, 37, and Fedora Rawhide. To install it, use these commands:

```

    sudo dnf copr enable perabyte/webapp-manager
    sudo dnf install webapp-manager

```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-august-2022/

作者：[Jiri Kyjovsky][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nikromen/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/how_to_enable_repo.html#how-to-enable-repo
[4]: https://docs.pagure.org/copr.copr/user_documentation.html#is-it-safe-to-use-copr
[5]: https://docs.pagure.org/copr.copr/user_documentation.html
[6]: https://github.com/binwiederhier/ntfy
[7]: https://play.google.com/store/apps/details?id=io.heckel.ntfy
[8]: https://fedoramagazine.org/wp-content/uploads/2022/08/beer.jpg
[9]: https://copr.fedorainfracloud.org/coprs/cyqsimon/ntfysh/
[10]: https://github.com/baduhai/Koi
[11]: https://fedoramagazine.org/wp-content/uploads/2022/08/Screenshot_20220813_133028.png
[12]: https://copr.fedorainfracloud.org/coprs/birkch/Koi/
[13]: https://github.com/ErikReider/SwayNotificationCenter
[14]: https://github.com/ErikReider/SwayNotificationCenter#scripting
[15]: https://copr.fedorainfracloud.org/coprs/erikreider/SwayNotificationCenter/
[16]: https://github.com/linuxmint/webapp-manager
[17]: https://fedoramagazine.org/wp-content/uploads/2022/08/Screenshot_20220810_182415.png
[18]: https://copr.fedorainfracloud.org/coprs/perabyte/webapp-manager/
