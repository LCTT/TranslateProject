[#]: subject: "Help improve GNOME!"
[#]: via: "https://fedoramagazine.org/help-improve-gnome-using-gnome-info-collect/"
[#]: author: "Vojtěch Staněk https://fedoramagazine.org/author/vstanek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Help improve GNOME!
======
![][1]

[gnome-info-collect][2] is a new tool that collects anonymous data about how GNOME systems are configured. It sends that information back to GNOME servers where it can be analyzed. The goal of this tool is to help improve GNOME, by providing data that can inform design decisions, influence where resources are invested, and generally help GNOME understand its users better.

The more people who provide data, the better! So, if you would like to help us improve GNOME, please consider installing and running *gnome-info-collect* on your system. It only takes a second.

As of last week, *gnome-info-collect* is ready to be used, and we are asking all GNOME users to install and run it!

Simply install the package from [Fedora Copr repository][3] by running the following commands:

```
$ dnf copr enable vstanek/gnome-info-collect
$ dnf install gnome-info-collect
```

The Copr repository also contains instructions on how to install on systems without dnf (useful for Silverblue users).

After installing, simply run

```
$ gnome-info-collect
```

from the Terminal. The tool will show you what information will be shared and won’t upload anything until you give your consent.

There are packages for other distributions as well. See the [project’s README][4] for more information.

*gnome-info-collect* is a simple client-server application. The client can be run on any GNOME system. There, it collects various system data including:

* Hardware information, including the manufacturer and model
* Various system settings, including workspace configuration, and which sharing features are enabled
* Application information, such as which apps are installed, and which ones are favourited
* Which GNOME shell extensions are installed and enabled

You can find the [full list of collected information][5] in the *gnome-info-collect* README. The tool shows the data that will be collected prior to uploading and, if the user consents to the upload, is then securely sent to GNOME’s servers for processing.

The collected data is completely anonymous and will be used only for the purpose of enhancing usability and user experience of GNOME. No personal information, like usernames or email addresses, is recorded. Any potentially identifying information, such as the IP address of the sender and the precise time of receiving the data, is discarded on the server side. To prevent the same client from sending data multiple times, a salted hash of the machine ID and username is used.

All of this ensures that the collected data is confidential and untraceable.

The best way to help is to take part by running *gnome-info-collect* and uploading your anonymous data.

You can also help by sharing this article with other GNOME users, and by encouraging others to run the collection tool themselves. The more users running *gnome-info-collect*, the better conclusions we can make from the collected data. This will result in an improved GNOME system that is more comfortable for its users.

So, do not hesitate to help improve GNOME. Simply install *gnome-info-collect*, run it and go tell all your GNOME friends about it! Thank you!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/help-improve-gnome-using-gnome-info-collect/

作者：[Vojtěch Staněk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/vstanek/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/08/improve_gnome-1-816x345.jpg
[2]: https://gitlab.gnome.org/vstanek/gnome-info-collect/
[3]: https://copr.fedorainfracloud.org/coprs/vstanek/gnome-info-collect
[4]: https://gitlab.gnome.org/vstanek/gnome-info-collect/#how-to-install
[5]: https://gitlab.gnome.org/vstanek/gnome-info-collect/#client-collected-information
