[#]: subject: "How to Get KDE Plasma 5.24 in Kubuntu 21.10 Impish Indri"
[#]: via: "https://www.debugpoint.com/2022/02/kde-plasma-5-24-kubuntu-21-10/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Get KDE Plasma 5.24 in Kubuntu 21.10 Impish Indri
======
THE KDE DEVS ENABLED THE FAMOUS BACKPORTS PPA FOR YOU TO INSTALL/UPGRADE
TO KDE PLASMA 5.24 IN KUBUNTU 21.10. HERE’S HOW.
KDE Plasma 5.24 was [released][1] recently with exciting changes. You get a brand new overview screen with this new release, much like GNOME’s own overview. Also, a refreshed default Breeze theme, performance updates, tweaks to the notification looks and much more. Read more about the features at our [official round-up page here][2].

If you are in a hurry and have no time to read the article, here’s the brief set of commands that does the trick. 😃

```

    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt update
    sudo apt full-upgrade

```

If you run Kubuntu 21.10 Impish Indri, you will not get this update out of the box. Because Kubuntu 21.10 Impish Indri currently have KDE Plasma 5.22.5 as a stable version. Although Kubuntu 21.10 is scheduled to end of life on July 2022, you can still install KDE Plasma 5.24 via the backports PPA.

However, note that you will get KDE Plasma 5.24 in Kubuntu 22.04 LTS due on April 2022, much before Kubuntu 21.10 life ends.

### Contents

  * [How to install KDE Plasma 5.24 in Kubuntu 21.10][3]
  * [How to install KDE Plasma 5.24 in Ubuntu 21.10 alongside GNOME][4]
  * [Can I install KDE Plasma 5.24 in Ubuntu 20.04 LTS?][5]
  * [How to Uninstall][6]



### How to Install KDE Plasma 5.24 in Kubuntu 21.10

Here’s how you can update your existing KDE Plasma in Kubuntu 21.10 to the latest version.

#### How to install KDE Plasma 5.24 in Kubuntu 21.10

If you are comfortable with Discover, add the backports PPA `ppa:kubuntu-ppa/backports` as software sources and hit update. Then installation once updated package information are retrieved.

I would recommend the following terminal method for faster and error-free installation.

  * Open Konsole and run the following command to add the backports PPA. If you fancy, you can verify what version of Plasma you are running.



```

    sudo add-apt-repository ppa:kubuntu-ppa/backports

```

![Add the PPA][7]

Now, refresh the package list and verify whether the latest 5.24 packages are available for upgrade.

![Check the latest KDE Plasma 5.24 packages before upgrading][8]

Now run the final command to kick off the upgrade.

```

    sudo apt full-upgrade

```

The above command would download around 270 MB+ worth of packages. The upgrade process takes approximately 10 minutes. Once the command is complete, restart your system.

[][2]

SEE ALSO:   KDE Plasma 5.24 – Top New Features and Release Details

And you should get the brand new KDE Plasma 5.24 with Kubuntu 21.10 Impish Indri.

![KDE Plasma 5.24 in Kubuntu 21.10][9]

#### How to install KDE Plasma 5.24 in Ubuntu 21.10 alongside GNOME

If you are running Ubuntu 21.10 Impish Indri with default GNOME, you can also experience the brand new KDE Plasma desktop with just a minor modification of the above commands.

Open a terminal and run the below commands in sequence.

```

    sudo add-apt-repository ppa:kubuntu-ppa/backpots
    sudo apt update
    sudo apt install kubuntu-desktop

```

Once the above commands are complete, restart the system. And from the login screen, choose KDE Plasma as a desktop environment. And you are good to go.

This will install the KDE Plasma 5.24 along with the GNOME desktop.

#### Can I install KDE Plasma 5.24 in Ubuntu 20.04 LTS?

Ubuntu 20.04 LTS edition has the earlier KDE Plasma 5.18, KDE Framework 5.68, KDE Applications 19.12.3. So, it would not receive the latest KDE Update during its entire lifecycle. So, technically you can add the above PPA and install the KDE Plasma 5.24. But I would not recommend it due to incompatible packages frameworks that may lead to an unstable system.

So, it is recommended that you use either Kubuntu 21.10 with the above backports PPA Or use KDE Neon to experience the latest Plasma desktop.

### How to Uninstall

At any moment, if you would like to go back to the stock version of KDE Plasma desktop, then you can install ppa-purge and remove the PPA, followed by refreshing the package.

Open a terminal and execute the following commands in sequence.

```

    sudo apt install ppa-purge
    sudo ppa-purge ppa:kubuntu-ppa/backports
    sudo apt update

```

Once the above commands are complete, restart your system.

### Closing Notes

I hope this quick guide gives you comprehensive upgrade steps to KDE Plasma 5.24 from different use cases. Hopefully, you can complete the upgrade without any errors.

Do let me know in the commend box below how it goes.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][10], [Twitter][11], [YouTube][12], and [Facebook][13] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/kde-plasma-5-24-kubuntu-21-10/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://kde.org/announcements/plasma/5/5.24.0/
[2]: https://www.debugpoint.com/2022/01/kde-plasma-5-24/
[3]: tmp.iA5hKjVLOx#how-to-install-kde-plasma-5-24-in-kubuntu-21-10-1
[4]: tmp.iA5hKjVLOx#how-to-install-kde-plasma-5-24-in-ubuntu-21-10-alongside-gnome
[5]: tmp.iA5hKjVLOx#can-i-install-kde-plasma-5-24-in-ubuntu-20-04-lts
[6]: tmp.iA5hKjVLOx#how-to-uninstall
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/Add-the-PPA.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/02/Check-the-latest-KDE-Plasma-5.24-packages-before-upgrade.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/02/KDE-Plasma-5.24-in-Kubuntu-21.10-1024x579.jpg
[10]: https://t.me/debugpoint
[11]: https://twitter.com/DebugPoint
[12]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[13]: https://facebook.com/DebugPoint
