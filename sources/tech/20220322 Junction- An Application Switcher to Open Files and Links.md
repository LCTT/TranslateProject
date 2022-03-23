[#]: subject: "Junction: An Application Switcher to Open Files and Links"
[#]: via: "https://itsfoss.com/junction/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Junction: An Application Switcher to Open Files and Links
======

**Brief:** _An interesting tool to make things easy when accessing files or opening links. Let us check it out_.

The workflow is not often seamless for users who dabble with multiple applications for accessing different files and open links using various browsers.

You probably get used to it, but it may not be the fastest way to get things done.

Meet **Junction**, an application switcher that helps you quickly open files/links with your favorite applications.

### Junction: Open-Source Application or Browser Switcher for Linux

![][1]

While we can use the “**Open with**” option from the right-click menu to choose a certain application when opening a file, it isn’t the fastest way.

With [Junct][2][i][2][on][2], instead of looking for the application that you can want a file to open with (or constantly changing defaults), you have to set the “**Junction**” app as your default.

In that way, whenever you open a link or access a file, launch email composer, etc., the Junction app will launch to show you relevant applications that you may want to access.

Furthermore, it supports keyboard navigation, making it a useful addition for keyboard power users.

![][3]

Basically, it saves you a few clicks every time you want to access the file/link in a different application.

### Features of Junction

![][4]

It is a simple tool fit for a specific group of users. You may or may not find it redundant, but the features should make up for it in case you want to try:

  * Choose the application to open with through a launcher/switcher
  * Show the location before launching
  * Ability to edit the URL before opening it
  * Hint for insecure link
  * Keyboard navigation
  * Ability to add more applications to the switcher/launcher (it remembers the addition for next time as well)



![][5]

### Using Junction to Access Files and Links

To set it up, you need to launch the app and set Junction as the default for Web, as shown below.

![][6]

For using it on any file type, you can head to the respective file properties and change the default application for it as shown below:

![][7]

For links, you can test it by clicking on “**Test Junction**” as shown in the previous screenshot above. Or, you can click on any link from another app to see the Junction app in action.

Here’s how it looks when you attempt to click a link and get Junction to help you choose:

![][8]

### Install Junction in Linux

Junction is primarily available as a Flatpak application. So, you can install the package from [Flathub][9] or look for it on your software center (if Flatpak integration is in place).

Considering you have [Flatpak set up][10], you can type in the following command to install it:

```

    flatpak install flathub re.sonny.Junction

```

You can also check out its [GitHub page][11] to learn more use-cases or tips/tricks to utilize it.

[Junction][9]

_What do you think about an application switcher like Junction? Is it useful for you? Let me know your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/junction/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/Junction-ft.png?resize=800%2C450&ssl=1
[2]: https://apps.gnome.org/app/re.sonny.Junction/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-action-screenshot.jpg?resize=800%2C450&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-app-screenshot.jpg?resize=800%2C455&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-app-more.jpg?resize=800%2C540&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-app.jpg?resize=800%2C586&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-properties.png?resize=800%2C511&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/junction-link-click.jpg?resize=800%2C505&ssl=1
[9]: https://flathub.org/apps/details/re.sonny.Junction
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://github.com/sonnyp/Junction
