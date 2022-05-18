[#]: subject: "Trinity Desktop Environment (TDE) Latest Release Brings PolicyKit Support and Updates"
[#]: via: "https://www.debugpoint.com/2022/05/tde-release-r14-0-12/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Trinity Desktop Environment (TDE) Latest Release Brings PolicyKit Support and Updates
======
Trinity Desktop Environment (TDE) brings the latest application updates, bug fixes, and enhancements to its release Trinity R14.0.12.

Trinity Desktop Environment is a Fork of KDE version 3.5 and a continuation of feature updates and bug fixes by a small development team. This independent and standalone desktop project is still alive today for those who believe how excellent the KDE 3 desktop methodology is.

Trinity Desktop Environment release R14.0.12 brings new applications, enhancements and significant bug fixes.

[TDE release R14.0.12][1] is the 12th maintenance release of the R14.0 series built upon its previous iteration released in Oct 2021. This release brings new applications, 10+ enhancements, bug fixes and support for the latest [Ubuntu 22.04 Jammy Jellyfish][2] and other distributions.

![Trinity Desktop Environment – TDE release R14.0.12][3]

### Trinity Desktop Environment – TDE release R14.0.12

Firstly, TDE R14.0.12 introduces Polkit-agent-tde and Polkit-tqt, which helps with the PolicyKit authentication triggered by the TQt interfaces. That means, when required, the admin password prompt is now invoked via PolicyKit for authentication. Also, a new embeddable lightweight markdown document viewer is introduced in this release.

Secondly, the list of enhancements includes the Konsole applications improvements, support for complex characters and HTML5 in Quanta (web dev editor), and support for Let’s Encrypt certificates. Not only that, TDE’s overall look is improved in addition to translation updates, and support for Python3 are some of the exciting enhancements in this release.

Moreover, on the building aspect, several packages migrated to the CMake build system while automake build system dropped for others.

Other than that, the application bug fixes include, Kaffeine seeing a fix on the libdvdcss codec detection in its player module, Amarok fixing errors for the latest Ruby programming language, and KMail correcting the email redirection to the default account.

Among all, other notable core bug fixes include a timeout fix in dbus service startup and a system hang fix during the shutdown.

Furthermore, following the other Linux distribution’s latest releases, TDE R14.0.12 introduces Ubuntu 22.04 LTS Jammy Jellyfish support, dropped support for Debian Jessie and improvements for Gentoo.

All of these changes with some additional updates for developers who build applications for this KDE 3.5 tech can be found in the official changelog of TDE R14.0.12 on this [page][4].

Finally, you should be happy to know that Good ol’ Trinity Desktop Environment is available for all mainstream Linux Distribution for installation, including Ubuntu, Fedora, Arch Linux, etc. A list of installation instructions is available [here][5].

#### Installing TDE in Ubuntu 22.04 LTS

Open a terminal and run the following commands in sequence to install this desktop environment. Also, make sure to log off after completion and choose TDE from the login. While installing, the installer would prompt you to choose the display manager. Choose the option gdm (GNOME Display Manager).

```
sudo gedit /etc/apt/sources.list
```

Add the following line and save the file.

```
deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-sb jammy deps-r14 main-r14deb-src http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-sb jammy deps-r14 main-r14
```

```
wget http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-keyring.debsudo dpkg -i trinity-keyring.debsudo apt updatesudo apt install kubuntu-default-settings-trinity kubuntu-desktop-trinity
```

### Video walkthrough of this release

Here’s a quick video we prepared for you of this release. Don’t forget to subscribe to us!

![Trinity Desktop Environment TDE R14 0 12 Walkthrough Video][6]

As always, make sure to check out the official [contribution][7] page to help the dev team with your expertise and capacity.

*Via Release announcement*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/tde-release-r14-0-12/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://wiki.trinitydesktop.org/Release_Notes_For_R14.0.12
[2]: https://www.debugpoint.com/2022/04/ubuntu-studio-22-04-lts/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/05/Trinity-Desktop-Environment-TDE-release-R14.0.12.jpg
[4]: https://wiki.trinitydesktop.org/Release_Notes_For_R14.0.12
[5]: https://wiki.trinitydesktop.org/Category:Installation
[6]: https://youtu.be/qoGylRyAJEo
[7]: https://www.trinitydesktop.org/helpwanted.php
