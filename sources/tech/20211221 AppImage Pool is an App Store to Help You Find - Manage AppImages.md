[#]: subject: "AppImage Pool is an App Store to Help You Find & Manage AppImages"
[#]: via: "https://itsfoss.com/appimagepool/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

AppImage Pool is an App Store to Help You Find & Manage AppImages
======

_**Brief:** An interesting GUI front-end to manage and find AppImage applications; let us find out more about it!_

We have plenty of information on [the history of AppImage and its making][1]. If you are new to Linux, you should also check out our [guide on using AppImage][2].

AppImage makes it easy for applications to work across various distributions without needing to install dependencies or anything.

However, unlike Flathub for [Flatpaks][3], you may not find a portal to browse applications available as AppImages.

NX Software Center in [Nitrux OS][4] does the same job, but it is not available to easily install on other distributions. So, AppImage Pool comes to the rescue as an app store for AppImage applications that you can install in any Linux distribution.

### AppImage Pool: A GUI Front-End to Manage and Find AppImage Applications

![][5]

AppImage Pool is a GUI front-end built using Flutter that fetches application data from [AppImageHub][6] and lets you quickly search, download, and manage AppImage applications.

It does not host any AppImage files, but it lets you download available AppImage files from the project’s GitHub page.

When you attempt to download an AppImage file, it lists all the available options for an app from its GitHub releases section.

I’m not sure whether it is limited to projects from GitHub, but you get all the curated options featured in the [AppImageHub portal][6].

### Features of AppImage Pool

![][7]

AppImage is a straightforward app store that lets you search, download, and manage AppImage files.

Some of the features include:

  * Ability to download a specific version of AppImage file
  * Filter applications by categories
  * Download progress icon
  * Manage all installed AppImages
  * View download history



Considering the app is built using Flutter, it offers a snappy experience.

If you are a developer, you can [install Flutter in Linux][8], too, if this encourages you to make an app using it.

![][9]

### Installing AppImage Pool in Linux

For obvious reasons, the developer offers an AppImage file available to download.

You can also choose to [install the Flatpak package][10] from [Flathub][11]. There’s also a nightly AppImage release if you want to test out any of its upcoming releases.

Explore more about it on its [GitHub page][12].

[AppImage Pool Download][13]

### Thoughts on Using AppImage Pool

![][14]

The application works as expected. However, I noticed that some of the applications listed did not have a download link or any information associated.

After all, the data is being sourced from AppImageHub.

Also, you might find it weird that some applications list only pre-release AppImage files, such as Blender.

![][15]

While this can also be an advantage in selecting the release branch of a project, I don’t think I would download pre-release packages.

Overall, it is good to find something that makes it easy to download and manage AppImages.

I suggest you give it a try and let me know your thoughts in the comments section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/appimagepool/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/appimage-interview/
[2]: https://itsfoss.com/use-appimage-linux/
[3]: https://itsfoss.com/what-is-flatpak/
[4]: https://nxos.org
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool.png?resize=800%2C450&ssl=1
[6]: https://www.appimagehub.com
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-gimp.png?resize=800%2C571&ssl=1
[8]: https://itsfoss.com/install-flutter-linux/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-categories.png?resize=800%2C575&ssl=1
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://flathub.org/apps/details/io.github.prateekmedia.appimagepool
[12]: https://github.com/prateekmedia/appimagepool
[13]: https://github.com/prateekmedia/appimagepool/releases
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-main.png?resize=800%2C543&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-blender.png?resize=800%2C440&ssl=1
