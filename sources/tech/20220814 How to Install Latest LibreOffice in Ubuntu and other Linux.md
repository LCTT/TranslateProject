[#]: subject: "How to Install Latest LibreOffice in Ubuntu and other Linux"
[#]: via: "https://www.debugpoint.com/install-latest-libreoffice-ubuntu-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Latest LibreOffice in Ubuntu and other Linux
======
Here’s a quick guide on how to install the latest LibreOffice version in Ubuntu and other Linux.

The free and open-source office suite LibreOffice comes with two versions. The Community and Enterprise version. The “community” version is for early adopters who want the latest bleeding-edge software tech. And the “enterprise” version is more stable, and it may not include all the latest features but is ideal for the production environment and professional work.

### Install Latest LibreOffice in Ubuntu and other Linux

#### Remove pre-installed LibreOffice

The Ubuntu operating system and other Linux ideally come with pre-installed LibreOffice. That might not be the latest one because of the distribution-specific release cycles. However, before you do a fresh install, you can remove the stock version of LibreOffice in Ubuntu and its related derivatives via the below command:

Open a terminal and run the below commands to remove the installed LibreOffice in Ubuntu and related distributions. For others, you can use your distro’s package manager to remove it.

```
sudo apt remove –purge libreoffice*
sudo apt autoclean
sudo apt autoremove
```

Do a reboot to ensure everything is okay (though you could skip this step).

#### Install via download

Go to the [official download page][1]. And download the “Fresh” version by choosing the type from the drop-down. For Ubuntu and other derivatives, choose the .deb file.

![LibreOffice download and install from the official website][2]

After downloading, extract the files; you should see all the packages below.

![Extracted LibreOffice DEB files][3]

Now, open a terminal at the extracted files’ exact location and run the commands below in sequence. Firstly, you need to install the `ure` package. The second is the `core` package and followed by all the basic packages. Finally, the main `LibreOffice` packages. A typical set of commands are present below. You need to change the version numbers for other releases.

```
sudo dpkg -i libobasis7.0-ure_7.0.4.2-2_amd64.deb
sudo dpkg -i libobasis7.0-core_7.0.4.2-2_amd64.deb
sudo dpkg -i libobasis7.0*
```

```
sudo dpkg -i libreoffice7.0*
```

![Install LibreOffice via dpkg][4]

Wait for the installation to finish. After completion, you can find LibreOffice via the application menu.

![Latest LibreOffice in Menu][5]

This should complete the steps to install the latest LibreOffice.

#### Install via PPA

After reboot, open the terminal again and add the below PPA

```
sudo add-apt-repository ppa:libreoffice/ppa
```

And finally, run the below commands to install the latest LibreOffice 5.4 series from this official PPA.

```
sudo apt update
sudo apt install libreoffice
```

Once installed, you can launch LibreOffice via Dash search.

![LibreOffice 5.4.2 Running in Ubuntu][6]

#### Install via Snap and Flatpak

If you are a Linux user, you may try the LibreOffice self-contained executable, which runs in a sandbox like Snap or Flatpak.

* To install LibreOffice via [Flatpak][7], visit [this page][8] to set it up and then run the below command to install it.

```
flatpak install flathub org.libreoffice.LibreOffice
```

* Similarly, for the [Snap version][9], use the following command to install.

```
sudo snap install libreoffice
```

### How can I upgrade to the latest LibreOffice version?

If you do not want to remove LibreOffice but want to upgrade to the latest version, please read our complete guide below.

[Upgrade to Latest LibreOffice in Ubuntu, Linux Mint and Windows][10]

![“Upgrade to Latest LibreOffice in Ubuntu, Linux Mint and Windows” — DebugPoint.com][11]

Feel free to leave a comment if you are facing trouble installing the latest LibreOffice.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-latest-libreoffice-ubuntu-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.libreoffice.org/download/download/
[2]: https://www.debugpoint.com/wp-content/uploads/2017/10/LibreOffice-download-and-install-from-official-website.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2017/10/Extracted-LibreOffice-DEB-files.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2017/10/Install-LibreOffice-via-dpkg.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2017/10/Latest-LibreOffice-in-Menu.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2017/10/LibreOffice-5.4.2-Running-in-Ubuntu-.png
[7]: https://flathub.org/apps/details/org.libreoffice.LibreOffice
[8]: https://flatpak.org/setup/
[9]: https://snapcraft.io/libreoffice
[10]: https://www.debugpoint.com/libreoffice-upgrade-update-latest/
[11]: https://www.debugpoint.com/libreoffice-upgrade-update-latest/embed/#
