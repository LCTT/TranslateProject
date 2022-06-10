[#]: subject: "Manage Flatpak Permission Using Flatseal"
[#]: via: "https://www.debugpoint.com/2022/06/manage-flatpak-permission-flatseal/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage Flatpak Permission Using Flatseal
======
Learn how to manage Flatpak permission using the Flatseal app, which gives you a friendly GUI and additional features.

Installing applications can be challenging in Linux from a new user standpoint. The primary reason is there are so many [Linux distributions][1]. And you need different installation methods or instructions for various Linux distributions. It can be overwhelming for some users. In addition, it’s also difficult for developers to create separate packages and builds for different distributions.

### Flatpak solved this problem. How?

It uses container tech so that the same application executable runs similarly on all Linux platforms. For example, one single executable can run in Ubuntu, Fedora, OpenSUSE, Arch Linux and many others.

Moreover, the developers also spend fewer efforts on packaging the same app for different platforms. And they can concentrate on the app features rather than the distributions or deployments.

In addition, Flatpak apps also get updates instantly, and you get the newest version as soon as it’s available.

All these benefits also open up an important question. What is the permission a Flatpak app needs? How do you manage them easily? For example, one app may require only network access, not disk space. Or another may have access to take screenshots, but it might not be required at all.

So, it is essential to review the permission of a Flatpak app. This is similar to your Android or iOS app permission.

Finally, even if you are a new user, it’s not that difficult to manage and review the permissions, thanks to the graphical app – Flatseal.

### What is Flatseal?

Flatseal is a Flatpak application which gives you a friendly user interface to view and change permissions of all the Flatpak apps in your system.

It is an excellent little app with an easy-to-use toggle button for each of the permission sections per application. Here’s how it looks (Figure 1).

![Figure 1 – Flatseal App][2]

### How do you use Flatseal to manage Flatpak Permission?

When opening the Flatseal app, it should list all the Flatpak apps at the left navigation bar. And once you select one application, it shows the available permission settings in the main window at the right.

Now, for each Flatpak permission control, the current value is shown in the toggle switch. If the permission is in use, it should be set. Otherwise, it should be greyed out.

First, to set permission, you must navigate to your system’s application. Then, you can enable or disable any respective control from the permission list.

Second, if you want to set a global control that applies to all the Flatpak in your system, you can choose “All Applications” at the left-top and apply the global setting (Figure 2).

![Figure 2: Manage Flatpak Permission using Flatseal][3]

It’s super easy. Isn’t it?

### Example of Managing Flatpak Permission using Flatseal

Let’s take an example.

In my system, I have the above Flatpak installed (Figure 2). Let’s pick the Telegram Desktop app. Currently, the Telegram desktop does not have permission to access any home directory or user files (Figure 3).

![Figure 3: Telegram Desktop Flatpak App does not have permission to the home folders][4]

Now, if I want to permit all user files and any specific folder (e.g. /home/Downloads), you can give it by turning the enable switch on. See the Figure 4 below.

![Figure 4: Permission changed of Telegram Desktop to give access to folders][5]

Similarly, you can enable or disable the permission you want. Under the hood, Flatseal performs the internal Flatpak commands to achieve this.

For example, the above scenario may translate to the following command.

```
flatpak override org.telegram.desktop --filesystem=/home/Downloads
```

And to remove:

```
flatpak override org.telegram.desktop --nofilesystem=/home/Downloads
```

There is also another cool feature of Flatseal which shows a small alert icon beside the user-specific permission changes (See Figure 4).

### Can I install Flatseal in all Linux distributions?

Yes, you can install [Flatseal][6] in all Linux Distributions as Flatpak. You can set up your system using [this guide][7] and run the following command to install. Or, [click here][8] to launch the system-specific installer directly.

```
flatpak install flathub com.github.tchx84.Flatseal
```

### Closing Notes

I hope the above guide to managing Flatpak permission is easy enough for you to understand and start with Flatpak. It’s super easy to control and far easier to use. Also, you may want to visit our more Flatpak [guide here][9].

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/manage-flatpak-permission-flatseal/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/category/distributions
[2]: https://www.debugpoint.com/wp-content/uploads/2022/06/Flatseal-App.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/Manage-Flatpak-Permission-using-Flatseal.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/Telegram-Desktop-Flatpak-App-does-not-have-permission-to-the-home-folders.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/06/Permission-changed-of-Telegram-Desktop-to-give-access-to-folders.jpg
[6]: https://flathub.org/apps/details/com.github.tchx84.Flatseal
[7]: https://flatpak.org/setup/
[8]: https://dl.flathub.org/repo/appstream/com.github.tchx84.Flatseal.flatpakref
[9]: https://www.debugpoint.com/tag/flatpak/
