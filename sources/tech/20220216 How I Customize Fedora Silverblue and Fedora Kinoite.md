[#]: subject: "How I Customize Fedora Silverblue and Fedora Kinoite"
[#]: via: "https://fedoramagazine.org/how-i-customize-fedora-silverblue-and-fedora-kinoite/"
[#]: author: "Muhammed Yasin Özsaraç https://fedoramagazine.org/author/harnapazade/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I Customize Fedora Silverblue and Fedora Kinoite
======

![][1]

Silver coin images excerpted from photo by [Kanchanara][2] on [Unsplash][3]; kinoite image excerpted from photo by Rob Lavinsky, iRocks.com – CC-BY-SA-3.0, CC BY-SA 3.0 , via Wikimedia Commons

Hello everyone. My name is Yasin and I live in Turkey. I am 28 years old and have used Fedora Silverblue for two months and I am an active Fedora Kinoite user. I want to share the information I’ve learned in the process of using the systems. So I’ve decided to write this article. I hope you like it. Let’s get started.

When one says Fedora Linux, the first edition that comes to mind is [Fedora Workstation][4]. However, do not overlook the _emerging_ editions Fedora Silverblue (featuring the [GNOME][5] desktop environment) and Fedora Kinoite (featuring the [KDE][6] desktop environment). Both of these are [reprovisionable][7] operating systems based on [libostree][8]. They are created exclusively from official RPM packages from the Fedora Project. In this article, I will demonstrate some common steps you might take after a clean installation of Fedora Silverblue or Fedora Kinoite. Everything listed in this article is optional. Exactly what you want to install or how you want to configure your system will depend on your particular needs. What is demonstrated below is just meant to give you some ideas and to provide some examples.

**Disclaimer**: _Packages from Flathub, RPM Fusion, the Copr build system, GitHub, GitLab, et al. are not managed by the Fedora release team and they do not provide official software builds. Use packages from these sources at your own risk._

### System upgrades

Fedora Linux in particular releases feature updates and security updates quite often. So you will want to run the below command regularly to keep your system up-to-date. Open the terminal and enter the following command. Afterwards, restart the computer so the changes will take effect.

```

    $ rpm-ostree upgrade

```

If you want to preview which packages will be updated, use the follow command first.

```

    $ rpm-ostree update --preview

```

It is also possible to configure automatic updates by editing the _rpm-ostreed.conf_ file as demonstrated below.

```

    $ sudo nano /etc/rpm-ostreed.conf

```

Change _AutomaticUpdatePolicy_ to _check_. Then save the change and quit the editor. After that you need to reload _rpm-ostree_ and enable the automatic timer.

```

    $ rpm-ostree reload
    $ systemctl enable rpm-ostreed-automatic.timer --now

```

### Adding Flatpak remotes and other third-party repositories

Fedora Silverblue and Fedora Kinoite come preloaded with the basic Fedora Linux repos. In addition, you might want [Flatpak][9], [RPM Fusion][10] or some [Copr][11] repos.

#### Flathub remotes

Flatpak is at the top of the list of ways to install applications on Fedora Silverblue and Fedora Kinoite because it is container-based and it does not require a reboot after installation. To add some remote software libraries and try it out, open the terminal again and enter the following commands.

**Fedora Flatpaks remote**:

```

    $ flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

```

**Flathub remote**:

```

    $ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

```

**Flabhub Beta remote**:

```

    $ flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

```

**KDE nightly remote**:

```

    $ flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

```

**GNOME nightly remote**:

```

    $ flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo

```

After the repositories are added, you need to enter the code below in order to update the application catalog in the GNOME Software and Discover stores. In this way, you will be able to manage applications directly from the store without going to [flathub.org][12].

```

    $ flatpak update --appstream

```

After that, you can use the store to update Flatpak applications, or if you want to update directly from the terminal, you can enter the code below.

```

    $ flatpak update

```

If you want to see all installed Flatpaks:

```

    $ flatpak list

```

#### RPM Fusion repos

Another remote software library you can add is RPM Fusion. To add it on Fedora Silverblue or Fedora Kinoite, open the terminal, enter the following commands and restart.

```

    $ sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

```

```

    $ sudo rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

```

#### Copr repos

Copr repos are yet another source of applications that can be installed on Fedora Silverblue and Fedora Kinoite. To add the repos, enter commands in the following form.

```

    $ sudo ostree remote add <name-of-repo> <repository-url>

```

Example (Heroic Games launcher repo):

```

    $ sudo ostree remote add heroic-games-launcher https://download.copr.fedorainfracloud.org/results/atim/heroic-games-launcher/fedora-$releasever-$basearch/

```

If you want another option, you can download the repository configuration file from [Copr][13]‘s own site and put it in the _/etc/yum.repos.d_ folder.

### Examples of popular Flatpak applications

**Libre Office**

```

    $ flatpak install flathub org.libreoffice.LibreOffice

```

**Lutris**

```

    $ flatpak install —user flathub-beta net.lutris.Lutris//beta

```

**Steam**

```

    $ flatpak install flathub com.valvesoftware.Steam

```

**VLC**

```

    $ flatpak install flathub org.videolan.VLC

```

**Firefox**

```

    $ flatpak install flathub org.mozilla.firefox

```

**Note**: _Fedora Firefox normally comes preloaded with Fedora Silverblue and Fedora Kinoite. However, the Flatpak version of Firefox has more comprehensive codec support._

### Installing the Nvidia driver and a specific kernel

If you have installed RPM Fusion repositories, you can install the Nvidia driver by entering the code below and restarting the computer so the changes will take effect.

```

    $ sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia

```

If you are using the Nvidia System Management Interface (nvidia-smi) or CUDA:

```

    $ sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia-cuda

```

If you want to install specific kernel, you can always download a kernel from [Koji][14] and install it on Fedora Silverblue or Fedora Kinoite using the following command:

```

    $ sudo rpm-ostree override replace ./kernel*.rpm

```

If you want to install multiple kernels, you will need to pin your deployment by issuing the _ostree admin pin 0_ command then use the same code above. After restarting, if you pin the new kernel, then you will have two deployments with specific kernels. Remember that you must update them individually because you cannot pin two deployments at the same time.

### Toolbx

The Toolbx utility is used primarily for CLI apps, development and debugging tools, etc. However, you can install supported any operating system. In this article, I will give an example of Fedora 35 Workstation installation and use. Fedora Silverblue and Fedora Kinoite come preloaded with Toolbx. So you can start directly.

First, create a toolbox.

```

    $ toolbox create

```

When the above is complete, enter:

```

    $ toolbox enter

```

When you see the code that starts with _toolbox_, then you are in the container operating system. You can list the container(s) by means of:

```

    $ toolbox list

```

If you want to remove the container, enter:

```

    $ toolbox rmi <container name>

```

If you need more help, enter:

```

    $ toolbox --help

```

Thanks to Toolbx, your main operating system will never break. You can pretend to be on Fedora Workstation, install and delete packages, and do things you cannot do on the libostree-based host system. Let’s illustrate with a few examples.

Many users use Toolbx for their developer tools. But it is a really useful tool for regular users as well. For example, you can install Xtreme Download Manager and combine it with Firefox to download content such as music and videos from the internet. It will make your job even easier if you download the file manager before downloading XDM. Now that you are in Toolbx, try installing Nautilus.

```

    $ sudo dnf install nautilus

```

After that, you can get XDM from here:

<https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz>

Start Nautilus with _sudo nautilus_ while in Toolbx. Then unarchive XDM, open the folder, right click on some empty space and select _Open in Terminal_. Then enter the below code.

```

    $ su -c ./install.sh

```

Congratulations! You have successfully installed XDM. After that you will need to open XDM, install Firefox and then open XDM again. Finally, you will want to make the XDM plugin available for Firefox.

```

    $ sudo xdm

```

```

    $ sudo dnf install firefox

```

```

    $ sudo firefox

```

A few more example things that you could do in Toolbx include:

  * Add the repositories from Fedora Silverblue or Fedora Kinoite using the terminal. Alternatively, you could copy the repo files from _/etc/yum.repos.d_ in Fedora Silverblue or Fedora Kinoite to _/etc/yum.repos.d_ in Toolbx.


  * Keep the container updated by running _sudo dnf update_ periodically. (Tip: For faster downloads, you might want to try adding the _fastestmirror=1_ and _max_parallel_downloads=10_ options to the container’s _/etc/dnf/dnf.conf_ file.)


  * Use the _dnf history_ command to see what changes you’ve made to the container.


  * You could install multimedia codecs and Windows fonts. But it’s not necessary because rpm-ostree can handle them and the _google-croscore-fonts_ and _liberation-fonts_ are both designed to be compatible with the most common MS fonts.



### Layering packages

The package layering method modifies the existing installation. You can permanently install almost any RPM package on Fedora Silverblue or Fedora Kinoite. However, you should only layer packages that you consider essential because, after the layering is complete, you will need to reboot the system before you will be able to use the package. For most packages, I recommend using Toolbx.

Package layering is almost identical to installing a RPM package on Fedora Workstation. It’s just _rpm-ostree_ replacing _dnf_. For example:

```

    $ rpm-ostree install htop

```

If you want to remove layered packages:

```

    $ rpm-ostree uninstall htop

```

If you want to see the all layered packages:

```

    $ rpm-ostree status

```

If you want to remove all layered packages:

```

    $ rpm-ostree uninstall --all

```

If you are wondering which packages I’ve chosen to layer on my libostree systems, here are my favorites.

  * **tlp, tlp-rdw**: helps to reduce the battery use on laptops


  * **stacer**: system optimizer and monitoring


  * **WoeUSB**: for preparing bootable Windows ISO images


  * **unrar**: for extracting and viewing RAR archives



### Gaming

Some ways of playing games on Fedora Silverblue or Fedora Kinoite include the following.

  * Using platforms (Steam, Lutris, [itch.io][15], GOG and other emulators)


  * Using compatibility tools (Wine, Proton and others)


  * Native Linux games (These games can be found in official or third-party repositories; or on their official website)


  * Other (Virtualbox, web browser games, etc.)



People are often advised to play games designed to run on Linux or Windows using Proton on Steam. However, not all Windows games are compatible with Proton; especially online games with cheat protection software. So it is useful to check the site below before installing the game.

[][16]<https://www.protondb.com/>

In Fedora Silverblue or Fedora Kinoite, there are two ways to install Proton.

**From Flathub (using the terminal)**:

```

    $ flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton

```

**From GitHub (manually)**:

[][17]<https://github.com/GloriousEggroll/proton-ge-custom>

My advice is to use the proton-ge-custom version (Gloruious Eggroll) because it contains extra patches and fixes for many popular games. You can read about how to install proton-ge-custom and how to activate it on Steam in the README.md file in the above GitHub repo.

If you do not want to use an online platform, it is possible to play the game using Wine. But you need to go to [Wine][18]‘s official site and read the reports about the game or try it yourself to see if the game works. Also, don’t think of it as just a game engine. Wine can run a wide verity of Windows programs. So how do you install Wine? Unfortunately, Wine cannot be directly installed on Fedora Silverblue or Fedora Kinoite as a layered package due to rpm-ostree’s lack of 32-bit support. It is possible, however, to install Wine using some indirect methods. The Winepak repo is dead now. So I’ll skip that.

**Method 1:** Use a Flathub application as a Wine launcher.

Lutris, Bottles, ProtonUp-Qt and finally Phoenicis PlayOnLinux

**Method 2:** Install Wine or Lutris in Toolbx with Steam.

```

    $ sudo dnf install wine lutris steam

```

**Method 3:** Partially install Wine on rpm-ostree.

```

    $ rpm-ostree install wine-core wine-core.i686 lutris

```

There are other methods of playing games on Linux. Native Linux games, for example, are available in many repositories. Browser games are also easy to access. Installing Windows in a virtual machine is another method. However, while a virtual machine may work for simpler games, I do not recommend it for games that require a lot of processing power.

### Other tips and suggestions

In this final section, I would like to mention a few more things that do not depend on anything mentioned earlier in this article.

#### rpm-ostree tips

You can use the _override_ sub-command to manage base packages. For example, to remove the pre-loaded Firefox:

```

    $ rpm-ostree override remove firefox

```

If you want to remove all overlays, overrides and initramfs:

```

    $ rpm-ostree ex reset

```

rpm-ostree provides an _experimental_ live update feature so that you can avoid rebooting after installing packages.

```

    $ rpm-ostree install --apply-live htop

```

Since you are on Fedora Silverblue or Fedora Kinoite, switching systems or updating to rawhide can be done with just a few commands. Also, reverting is easier than ever.

Substitute _system_ with _kinoite_ or _silverblue_ in the below examples.

**Switch systems**:

```

    $ rpm-ostree rebase fedora/35/x86_64/system

```

**Upgrade to rawhide**:

```

    $ rpm-ostree rebase fedora/rawhide/x86_64/system

```

**Rollback to a previous version**:

```

    $ rpm-ostree rollback fedora/35/x86_64/system

```

#### Listing packages

On Fedora Workstation you can use _dnf_ to list the packages in the repositories. But this does not work on Fedora Silverblue or Fedora Kinoite. So how do you do it? If you want to list the installed RPM packages on your system, you can use the following command.

**To list the installed RPM packages**:

```

    $ rpm -qa

```

However, if you want to list the packages in the repositories, you must either layer the _dnfdragora_ package or enter Toolbx. Then you can use the following _dnf_ commands.

**To list all RPM packages (both installed and available)**:

```

    $ dnf list

```

**To search for a specific RPM package**:

```

    $ dnf search <packagename>

```

#### Miscellaneous tips

  * When you want to install an application, first look at the Flatpak remotes. If it’s not there, use Toolbx. Finally, if you cannot run it in Toolbx, layer the package. If you still cannot get what you want to install, the last option is to install Windows in a virtual machine or on a separate partition or hard drive and configure [multi-booting][19].


  * I do not recommend using any other repositories besides the Fedora, RPM Fusion, and Copr repositories unless required.


  * Remember that only KDE (Fedora Kinoite) and GNOME (Fedora Silverblue) desktop environments are officially supported by the Fedora Project.


  * If you want your system to stay the same speed, you can try to avoid doing too much customization (global theme, Conky, Plank, etc.)


  * For Fedora Kinoite users: To add the option to open folder or file as root in the Dolphin file manager on the right click, install the “Dolphin as root” plugin from the Discover application.


  * If you want to preview video files without opening them, you can enter: $ rpm-ostree install ffmpegthumbs kffmpegthumbnailer.

**Note:** For now, do not install Dolphin from Flatpak because it replaces the preinstalled Dolphin on the system. With the Flatpak version of Dolphin, you will not be able to preview videos because it does not contain the packages mentioned above



  * For Kinoite users: If you want to install a global theme, the installation from the system settings can sometimes cause problems. Instead, download the global theme file from the [KDE Store][20] and enter: $ kpackagetool5 -i /home/username/theme folder


  * Courtesy of Daniel’s guidance on Fedora Discussion, it is possible to [install Windows fonts without any package layering][21].


  * Courtesy of Badhshah, the following can be used to [enable hardware video acceleration if you have an Intel Graphics 4600 chipset][22]: $ rpm-ostree install intel-gpu-tools libva-intel-driver libva-intel-hybrid-driver libva-utils libva-vdpau-driver libvdpau-va-gl mpv vdpauinfo



### Conclusion

Dear friends, you have come to the end of this article. If you have anything you want to add to this topic or if you have questions, I am waiting for you in the comments section below. Also, special thanks to Badhshah, Timothée Ravier and Daniels for helping me with some information in preparing this article. Finally, if you want to contribute to Fedora Silverblue or Fedora Kinoite or get more information, check the links below. Thank you for reading.

  * [][23]<https://docs.fedoraproject.org/en-US/fedora-silverblue/>


  * [][24]<https://docs.fedoraproject.org/en-US/fedora-kinoite/>



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-i-customize-fedora-silverblue-and-fedora-kinoite/

作者：[Muhammed Yasin Özsaraç][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/harnapazade/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/02/fsb-fk-816x345.jpg
[2]: https://unsplash.com/@kanchanara?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/silver?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://getfedora.org/
[5]: https://en.wikipedia.org/wiki/GNOME
[6]: https://en.wikipedia.org/wiki/KDE
[7]: https://blog.verbum.org/2020/08/22/immutable-%E2%86%92-reprovisionable-anti-hysteresis/
[8]: https://projectatomic.io/
[9]: https://en.wikipedia.org/wiki/Flatpak
[10]: https://en.wikipedia.org/wiki/RPM_Fusion
[11]: https://copr.fedorainfracloud.org/
[12]: http://flathub.org
[13]: https://copr.fedorainfracloud.org/coprs/
[14]: https://koji.fedoraproject.org/koji/packageinfo?packageID=8
[15]: http://itch.io
[16]: https://www.protondb.com/
[17]: https://github.com/GloriousEggroll/proton-ge-custom
[18]: https://appdb.winehq.org/index.php
[19]: https://en.wikipedia.org/wiki/Multi-booting
[20]: http://store.kde.org
[21]: https://discussion.fedoraproject.org/t/ms-core-fonts-on-silverblue/1916/5
[22]: https://discussion.fedoraproject.org/t/anything-else-you-would-suggest-in-kinoite-silverblue-after-post-installation/35762/4
[23]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[24]: https://docs.fedoraproject.org/en-US/fedora-kinoite/
