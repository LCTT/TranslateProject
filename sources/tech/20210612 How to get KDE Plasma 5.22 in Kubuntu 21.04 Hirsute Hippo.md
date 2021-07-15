[#]: subject: (How to get KDE Plasma 5.22 in Kubuntu 21.04 Hirsute Hippo)
[#]: via: (https://www.debugpoint.com/2021/06/plasma-5-22-kubuntu-21-04/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to get KDE Plasma 5.22 in Kubuntu 21.04 Hirsute Hippo
======
The KDE team enabled the backports PPA which you can use to install and
upgrade to KDE Plasma 5.22 in Kubuntu 21.04 Hirsute Hippo._This guide
outlines the following topics_ppa:kubuntu-ppa/backports
![Kubnutu 21.04 running with KDE Plasma 5.22][1]

KDE team released the KDE Plasma 5.22 recently with a fair amount of enhancements, bug fixes along with updated KDE Framework and applications versions. This release brings several improvements such as Adaptive transparency in panels, user-friendly notification on file operation popups, package type display in Discover, various Wayland changes, and more. Check out more details about features [here][2].

If you are running Kubuntu 21.04 Hirsute Hippo Or, have a custom KDE Plasma installed in [Ubuntu 21.04 Hisrsute Hippo][3], you can upgrade to the latest version using the following steps. The current Hirsute Hippo series provides the prior versions of KDE Plasma 5.21.04 with KDE Framework 5.80.

:

  1. [How to install KDE Plasma 5.22 in Kubuntu 21.04][4]
  2. [How to install KDE Plasma 5.22 in Ubuntu 21.04 alongside GNOME][5]
  3. [Can I install KDE Plasma 5.22 in Ubuntu 20.04 LTS?][6]
  4. [How to Uninstall][7]



### Install KDE Plasma 5.22 in Kubuntu 21.04 Hirsute Hippo – Steps

Follow the below steps.

If you want to use the graphical method, then add to the software sources in Discover and hit Update.

Or, use the following terminal method for faster installation.

  * **Step 1**: Open a terminal and add below KDE Backports PPA.



```
sudo add-apt-repository ppa:kubuntu-ppa/backports
```

  * **Step 2**: Then run the following to initiate a system upgrade. This will install the latest KDE Plasma 5.22 in your Hirsute Hippo system.



```
sudo apt update
sudo apt full-upgrade
```

![Upgrade to Plasma 5.22][8]

  * **Step 3**: Reboot after the update and you should be greeted with an updated KDE Plasma 5.22 desktop.



The installation may take some time considering a complete version upgrade of the entire desktop environment.

### Installing KDE Plasma 5.22 in Ubuntu 21.04

If you are running GNOME based default Ubuntu 21.04 Hirsute Hippo desktop, you can use this PPA to install the latest KDE Plasma. Here’s how.

[][9]

SEE ALSO:   Lubuntu 21.04 Hirsute Hippo - Artwork Contest is Here

Open a terminal and add the PPA (like above steps).

```
sudo add-apt-repository ppa:kubuntu-ppa/backports
```

Then, refresh the packages.

```
sudo apt update
```

Then run the below to install the Kubuntu desktop.

```
sudo apt install kubuntu-desktop
```

This will install the KDE Plasma desktop alongside with GNOME in Ubuntu 21.04.

### KDE Plasma 5.22 in Ubuntu 20.04 LTS

Ubuntu 20.04 LTS edition has the earlier KDE Plasma 5.18, KDE Framework 5.68, KDE Applications 19.12.3. So, during its entire lifecycle, it would not receive the latest KDE Update. So, technically you can add the above PPA and install the KDE Plasma 5.22. But I would not recommend it due to incompatible packages, frameworks that may lead to an unstable system.

So, it is recommended that you use either Kubuntu 21.04 with the above backports PPA Or, use KDE neon to experience the latest Plasma desktop.

### Uninstallation of KDE Plasma 5.22

If you change your mind and want to go back to the stock version of the KDE Plasma, then install the ppa-purge and purge the PPA. This will downgrade packages and make the stock version available.

```
sudo apt install ppa-purge
sudo ppa-purge ppa:kubuntu-ppa/backports
sudo apt update
```

### Closing Notes

I hope this quick guide helped you to install the latest KDE Plasma 5.22 in Kubuntu 21.04 Hirsute Hippo. This allows you experience the latest KDE technology coupled with KDE Framework and applications. However, you should be aware that not all the features should be made available in the backports PPA – only the selected features and bug fixes that pass regression and safe to use. That said, you can always install KDE Neon as a fresh system to enjoy the latest tech from KDE.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/plasma-5-22-kubuntu-21-04/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Kubutu-21.04-running-with-KDE-Plasma-5.22-1024x531.jpg
[2]: https://www.debugpoint.com/2021/06/kde-plasma-5-22-release/
[3]: https://www.debugpoint.com/2021/04/ubuntu-21-04-hirsute-hippo-release/
[4]: tmp.wazjcS11If#plasma-kubuntu-2104
[5]: tmp.wazjcS11If#plasma-ubuntu-2104
[6]: tmp.wazjcS11If#plasma-ubuntu-2004
[7]: tmp.wazjcS11If#uninstall-stock-version
[8]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Upgrade-to-Plasma-5.22.jpg
[9]: https://www.debugpoint.com/2020/12/lubuntu-21-04-artwork/
