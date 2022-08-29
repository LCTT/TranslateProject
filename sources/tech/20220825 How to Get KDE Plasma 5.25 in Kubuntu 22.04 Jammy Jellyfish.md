[#]: subject: "How to Get KDE Plasma 5.25 in Kubuntu 22.04 Jammy Jellyfish"
[#]: via: "https://www.debugpoint.com/kde-plasma-5-25-kubuntu-22-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Get KDE Plasma 5.25 in Kubuntu 22.04 Jammy Jellyfish
======
The KDE developers now enabled the popular backports PPA with necessary updates with KDE Plasma 5.25 which you can install now in Kubuntu 22.04 Jammy Jellyfish. Here’s how.

KDE Plasma 5.25 released a few days back on June 14, 2022 with some stunning updates. With this release, you get the **dynamic accent colour**, revamped login avatars, **floating panel** and many such features which we covered in the [feature highlight article][1].

But, if you are running [Kubuntu 22.04 Jammy Jellyfish][2] which was released long back on April 2022, you have the KDE Plasma 5.24 with KDE Framework 5.92.

You probably waiting to enjoy the new features in your stable Kubuntu 22.04 release, and now its possible to install it in Kubuntu 22.04 via the famous backports PPA.

### How to Install KDE Plasma 5.25 in Kubuntu 22.04

Here’s how you can upgrade Kubuntu 22.04 with latest KDE Plasma 5.25.

#### GUI Method

If you are comfortable with KDE’s software app Discover, then open the app. Then browse to the Settings > Sources and add the PPA `ppa:kubuntu-ppa/backports-extra`. Then Click on Updates.

#### Terminal Method (recommended)

I would recommend you to open a terminal and do this upgrade for faster execution and installation.

* Open Konsole and run the following commands to add the [backport PPA][3].

```
sudo add-apt-repository ppa:kubuntu-ppa/backports-extra
```

![Upgrade Kubuntu 22.04 with KDE Plasma 5.25][4]

* Now, refresh the package list by running the following command. Then verify the 5.25 packages are available.

```
sudo apt update
```

```
apt list --upgradable | grep 5.25
```

![KDE Plasma 5.25 packages are available now][5]

Finally, run the last command to kick-off the upgrade.

```
sudo apt full-upgrade
```

The total download size is around 200 MB worth of packages. The entire process takes around 10 minutes of your time based on your internet connection speed.

After the above command is complete, restart your system.

Post-restart, you should see the new KDE Plasma 5.25 in Kubuntu 22.04 LTS.

![KDE Plasma 5.25 in Kubuntu 22.04 LTS][6]

### Other backport PPA

Please note that the [other backport PPA][7]  `ppa:kubuntu-ppa/backports` is currently have Plasma 5.24. So do not use the following PPA which is different than the above. I am not sure whether this PPA would get this update.

```
sudo add-apt-repository ppa:kubuntu-ppa/backports // don't use this
```

### How to Uninstall

At any moment, if you would like to go back to the stock version of KDE Plasma desktop, then you can install ppa-purge and remove the PPA, followed by refreshing the package.

Open a terminal and execute the following commands in sequence.

```
sudo apt install ppa-purge
sudo ppa-purge ppa:kubuntu-ppa/backports-extra
sudo apt update
```

Once the above commands are complete, restart your system.

### Closing Notes

There you have it. A nice and simple steps to upgrade stock KDE Plasma to Plasma 5.25 in Jammy Jellyfish. I hope, your upgrade goes fine.

Do let me know in the comment section if you face any error.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/kde-plasma-5-25-kubuntu-22-04/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/kde-plasma-5-25/
[2]: https://www.debugpoint.com/kubuntu-22-04-lts/
[3]: https://launchpad.net/~kubuntu-ppa/+archive/ubuntu/backports-extra
[4]: https://www.debugpoint.com/wp-content/uploads/2022/08/Upgrade-Kubuntu-22.04-with-KDE-Plasma-5.25.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/08/KDE-Plasma-5.25-packages-are-available-now.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/08/KDE-Plasma-5.25-in-Kubuntu-22.04-LTS-1024x575.jpg
[7]: https://launchpad.net/~kubuntu-ppa/+archive/ubuntu/backports
