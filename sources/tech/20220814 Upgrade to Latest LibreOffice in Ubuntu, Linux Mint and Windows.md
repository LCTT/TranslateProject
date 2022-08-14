[#]: subject: "Upgrade to Latest LibreOffice in Ubuntu, Linux Mint and Windows"
[#]: via: "https://www.debugpoint.com/libreoffice-upgrade-update-latest/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Upgrade to Latest LibreOffice in Ubuntu, Linux Mint and Windows
======
This beginner’s guide explains the steps required to upgrade to the latest LibreOffice in Ubuntu, Linux Mint

![LibreOffice 7.3.x Community Edition in Ubuntu 22.04 LTS Jammy Jellyfish][1]

[LibreOffice][2], used by millions of users worldwide, is the most popular free office suite today. It consists of a spreadsheet program (Calc), document processor (Writer), presentation (Impress), drawing (Draw), and Math module to help you with most of the office, business, academic, and day-to-day work.

LibreOffice can act as an excellent replacement for paid Microsoft Office suite due to its compatibility with proprietary file formats such as DOCX, PPTX, and XLSX. It is a fork of the Apache OpenOffice productivity suite and is actively developed by thousands of global contributors.

![LibreOffice Logo][3]

### Upgrade to Latest LibreOffice

LibreOffice recently changed its versioning methods from the Fresh and Still concept. Now, LibreOffice has a **community** edition and a recommended **enterprise** edition. This is because many businesses use the latest LibreOffice version with cutting-edge features, hampering the development effort. Hence the team suggested the business users get paid support from official LibreOffice partners for long-term support. You can read the blog post [here][4].

That said, here are the current versions.

#### Latest LibreOffice Versions

* The current LibreOffice Community version series is LibreOffice 7.4.x.
* And the LibreOffice stable recommended version for business is LibreOffice 7.3.x.

#### Upgrade to Latest LibreOffice in Ubuntu, Linux Mint, and Other Ubuntu Based distributions

[Ubuntu 22.04 LTS Jammy Jellyfish][5] have LibreOffice 7.3.x.

**Ubuntu 20.04 LTS** has LibreOffice 6.4.7 at the moment, and soon it will get the update for the next iteration.

**Ubuntu 18.04 LTS,** supported until[April 2023][6], has the LibreOffice 6.2 version. Linux Mint 19.x also provides the same. You can still download and install LibreOffice 6.3.x version in Ubuntu 18.04 or Linux Mint 19.x.

It is always wiser to stick to the LibreOffice version provided by the distribution. Moreover, unless you need the latest features, you should not upgrade. If you like to experiment, you can go ahead.

##### Via PPA

* You can install and upgrade to the latest Fresh version using the official LibreOffice PPA. Open a terminal and run the below commands in Ubuntu or Linux Mint.

```
sudo add-apt-repository ppa:libreoffice/ppa
```

```
sudo apt update && sudo apt install libreoffice
```

* To downgrade LibreOffice and remove the PPA, run the below commands from the terminal sequentially.

```
sudo add-apt-repository --remove ppa:libreoffice/ppa
```

```
sudo apt install ppa-purge && sudo ppa-purge ppa:libreoffice/ppa
```

##### Via Snap

You can also have the option to install the latest LibreOffice as Snap via the below option. [Snap packages][7] can be used across supported Linux distributions as a standalone package. Thus, you can keep your existing installation of LibreOffice and still run the latest Snap version.

Remember that technically you can run two versions of LibreOffice in parallel using one Snap version. However, ensure there might be slight file association issues and other problems. This applies to Flatpak as well.

[Download LibreOffice as Snap][8]

##### Via Flatpak

Flatpak is another way by which you can have the latest LibreOffice alongside the distro-provided version. You can [set up your system for Flatpak][9] and download LibreOffice via the below link.

[Download LibreOffice as Flatpak][10]

#### Upgrade for Windows

For Windows, you can’t upgrade directly from the existing installation. You can download the latest LibreOffice from [this page][11] and do the installation. During installation, your existing version would be uninstalled.

### Upgrade Troubleshooting

If you encounter any problems or system instability after the upgrade, it is better to do a clean install. So, you can download the latest copy from [this link][11] and install it. If you are using Ubuntu or Linux Mint, don’t forget to remove the stock version first before installing the latest version.

Finally, drop a comment below if you face issues while upgrading to the latest LibreOffice in Ubuntu Linux and others.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/libreoffice-upgrade-update-latest/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2019/09/LibreOffice-7.3.x-Community-Edition-in-Ubuntu-22.04-LTS-Jammy-Jellyfish.jpg
[2]: https://www.libreoffice.org/
[3]: https://www.debugpoint.com/wp-content/uploads/2019/09/LibreOffice-Icon.png
[4]: https://blog.documentfoundation.org/blog/2021/02/03/libreoffice-7-1-community/
[5]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[6]: https://www.debugpoint.com/ubuntu-release-dates-wiki/
[7]: https://www.debugpoint.com/2016/07/how-to-install-and-use-snap-packages-in-ubuntu/
[8]: https://snapcraft.io/libreoffice
[9]: https://www.debugpoint.com/2018/07/how-to-install-flatpak-apps-ubuntu-linux/
[10]: https://flathub.org/apps/details/org.libreoffice.LibreOffice
[11]: https://www.libreoffice.org/download/download/
