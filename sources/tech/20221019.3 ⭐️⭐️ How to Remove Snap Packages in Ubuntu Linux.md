[#]: subject: "How to Remove Snap Packages in Ubuntu Linux"
[#]: via: "https://www.debugpoint.com/remove-snap-ubuntu/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Remove Snap Packages in Ubuntu Linux
======

**A tutorial on how to remove Snap from Ubuntu Linux and getting a snap-free system.**

Snap packages developed by Canonical are beneficial for several use cases. It provides an easy and faster update of applications directly to the end-users. Not only that, it has several other benefits, such as it comes with all dependencies packaged and allows multiple installations of the same applications. Furthermore, it runs in a sandbox mode providing security and other benefits.

Among all these benefits, there are other debatable drawbacks of Snap tech. For example, almost every user who used Snap reported its slower performance, including its startup time, compared to native deb or RPM packages. In addition, due to its design, the application installation size is huge and costs disk space because it packages all the dependencies.

Not only that, but due to its sandbox nature, the Snap apps may not access several areas of your Linux desktop until managed with proper permission.

This guide explains how you can remove the snap from the Ubuntu system altogether.

These steps are tested in [Ubuntu 22.04 LTS Jammy Jellyfish][1]. However, it should work for all applicable Ubuntu versions.

Warning: These steps will remove Software and Firefox, the two critical applications in your Ubuntu system. Make sure you take backups of bookmarks and other Firefox settings before trying these steps.

### Remove Snap Packages in Ubuntu Linux

- Open a terminal and view the list of Snap packages installed in your system using the below command. It shows the snap packages such as Firefox, Software store, themes and other core packages installed by default.

```
snap list
```

![Snap list in Ubuntu][2]

- Remove snap packages in the following order. Firstly remove Firefox. Secondly, snap-store and the other packages that you see in the above command output in your system.

```
sudo snap remove --purge firefoxsudo snap remove --purge snap-storesudo snap remove --purge gnome-3-38-2004
```

```
sudo snap remove --purge gtk-common-themessudo snap remove --purge snapd-desktop-integrationsudo snap remove --purge baresudo snap remove --purge core20sudo snap remove --purge snapd
```

- Finally, remove the snap daemon via apt command.

```
sudo apt remove --autoremove snapd
```

[![remove snap and others][3]][4]

That’s not all. Even if you removed the snaps using the above command, the sudo apt update command again brings back the snap if you don’t stop the apt trigger.

- So, to stop that, we need to create an apt preference file in **/etc/apt/preferences.d/ **and create a new preference file to stop snap. Create a new file called **nosnap.pref** in /etc/apt/preferences.d/

```
sudo gedit /etc/apt/preferences.d/nosnap.pref
```

- And add the following lines, then save the file.

```
Package: snapdPin: release a=*Pin-Priority: -10
```

![create a pref file][5]

_The apt preference is a potent tool if you know how to use it. For example, in the above statements, the Pin-Priority -10 means preventing a package from installation._

_Unrelated to this tutorial, for example, if you want to give super high priority to all the packages from distribution code name=bullseye, then one may see these preferences. If you want to learn more, you can visit the [apt man pages][6]._

```
Package: *Pin: release n=bullseyePin-Priority: 900
```

- Returning to the topic, once you save and close the above file, run the below again from the terminal.

```
sudo apt update
```

- Finally, the steps are complete for getting rid of the snap from Ubuntu.

### Installing Software and Firefox as deb files after removing Snap from Ubuntu

You removed Firefox and Sofware applications, so you need those for your work.

You can use the following command to install the apt version of the Gnome Software. Make sure you use the `--install-suggests`. Otherwise, it will install the snap version again!

```
sudo apt install --install-suggests gnome-software
```

And to install firefox, use the official PPA via the below commands.

```
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install -t 'o=LP-PPA-mozillateam' firefox
```

[![Add the PPA][7]][8]

[![Install Firefox as deb file from PPA][9]][10]

Once you have installed Firefox, enable the automatic update using the below commands. To learn more, [visit thi][11][s page][11].

```
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
```

Last but not least, create another preference file for Firefox to give super high priority to the above PPA while running apt. If you don’t do this, the apt update command again pulls back firefox snap and brings over its “snap friends”. 😂

```
sudo gedit /etc/apt/preferences.d/mozillateamppa
```

Finally, add these lines and save the file.

```
Package: firefox*Pin: release o=LP-PPA-mozillateamPin-Priority: 501
```

That’s it.

### Revert back to Snap in Ubuntu

If you change your mind, remove the preference file and install the applications using the below commands below.

```
sudo rm /etc/apt/preferences.d/nosnap.prefsudo apt update && sudo apt upgradesudo snap install snap-storesudo apt install firefox
```

### Closing Notes

Wrapping up the tutorial on removing snap in Ubuntu, I would say these are unnecessary efforts to eliminate Snap completely. Mainly these are difficult for new users. I hope this guide helps you to get rid of snap. Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/remove-snap-ubuntu/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Snap-list-in-Ubuntu.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/04/remove-snap-and-others-1024x544.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/remove-snap-and-others.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/04/create-a-pref-file.jpg
[6]: https://manpages.ubuntu.com/manpages/focal/man5/apt_preferences.5.html
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Add-the-PPA-1024x550.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Add-the-PPA.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/04/Install-Firefox-as-deb-file-from-PPA-1024x548.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Install-Firefox-as-deb-file-from-PPA.jpg
[11]: https://www.debugpoint.com/2021/09/remove-firefox-snap-ubuntu/
