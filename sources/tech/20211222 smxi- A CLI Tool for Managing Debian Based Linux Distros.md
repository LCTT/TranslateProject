[#]: subject: "smxi: A CLI Tool for Managing Debian Based Linux Distros"
[#]: via: "https://itsfoss.com/smxi/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

smxi: A CLI Tool for Managing Debian Based Linux Distros
======

_**Brief: smxi is an interactive console script that helps you maintain your Debian installation. You can use it to install upgrades, install graphics drivers, upgrade kernels and much more.**_

I know that you can do it all with their respective commands. This smxi script gives you everything at one place and in an interactive manner.

smxi is limited to only direct derivates of Debian. Only distributions like AntiX, Aptosid, Epidemic, Linux Mint Debian Edition (LMDE), Mepis are supported. It also supports the testing and Sid branches of Debian. That means Ubuntu and Ubuntu-based distributions are NOT supported as there are [many differences between Ubuntu and Debian][1].

### smxi: A Debian sysadmin’s maintenance script

[smxi][2] is a maintenance script with a few features that you will appreciate once you start using it. It varies from helping you install a specific office suite to managing multiple Linux kernels on the same machine.

Below are a few features that it offers:

  * Automatic installation of GPU drivers, along with necessary patches (even nVidia)
  * Installing software (from a simple package to a full fledged Desktop Environment)
  * Removing any given software
  * System clean up (clearing apt cache, removing old kernels and kernel modules, etc)
  * Manage and deploy system upgrades
  * Kernel upgrades / Kernel module upgrades



### Installing smxi on Debian

smxi tool is not available in Debian repositories. You need to manually download a zip archive from the developer which contains smxi along with some other tools offered by the developer.

It’s just a script so you extract the content of the folder to /usr/local/bin directory.

Use the wget command (you should have it installed) to download the archive file:

```

    wget -N -c https://smxi.org/smxi.zip

```

Once the zip archive is downloaded, the next step is to extract the archive contents to “/usr/local/bin”:

```

    sudo unzip smxi.zip -d /usr/local/bin/

```

![Extracting the zip archive directly to “/usr/local/bin” directory][3]

That is it. You now have smxi “installed” on your Debian machine!

### Running smxi

You need to be a superuser (root) to execute the script. Escalating permissions via **sudo command will not work**.

Become root with this command:

```

    sudo su -

```

Once you are logged in as root, run the script

```

    smxi

```

![smxi will tell you how the super user executed smxi][4]

NOTE

**smxi is written as a console script, and it will provide best results (especially when working with Graphics [re-]installation) when it is executed from a console. If you have a GUI already installed, please switch to a [tty][5] using Ctrl + Alt + F3.**

The only reason why this guide includes screenshots with a GUI terminal emulator is because you cannot take a screenshot from a console :)

Every time you smxi, it will always do an “apt-get update” for you.

As the next step, smxi will ask you if you want either ‘dist-upgrade’ or ‘upgrade’ or ‘continue’ – move ahead without upgrading anything.

![smxi asking giving you a few options to upgrade or move ahead][6]

Choosing ‘dist-upgrade’ will present you with the following screen.

![smxi presents user with option to choose their Debian branch: Stable or Testing or Sid][7]

Reliably identifying which branch of Debian you are running is hard for the script, so now it is asking you which branch of Debian you are on.

Since I am on the stable branch of Debian 11 Bullseye, I will go ahead with the first option ‘debian-stable’.

Once the ‘dist-upgrade’ process is complete, you will see an overview of your system which contains your current kernel version and the latest kernel that is available for your system, date and time when your apt package database was last updated and some hardware information.

![smxi screen with some information regarding the system that it is being executed on][8]

Once the upgrade is complete and you are past the system information screen, you now have all the options to take action that smxi offers.

![list of all available options in smxi that you can take action on][9]

### Package Install

‘package-install’ is the first option available at your fingertips in the script menu. As you might have guessed, selecting this option will help you install a set of applications.

There are a few options here for you that can be chosen from.

Office: For installing LibreOffice, AbiWord and a few other office and productivity tools. There is also option to hold LibreOffice package from upgrading.

Non-free: This sub-menu of ‘package-install’ allows you to install the non-free packages, which are not in the Debian repositories. This includes applications like Chrome, Opera, Skype etc.

Utilities: Under the ‘package-install’ is another sub-menu which helps you install various utilities like htop, gzip etc. This allows you to install the [terminal based browsers][10] like Lynx. There are a lot of utilities in categories here. Somewhat like a smaller, command line version of software center. Feel free to explore it.

#### Desktop Environment

Another option for you to choose under the ‘package-install’ sub menu is to install a variety of desktop environments like KDE, LXDE, window managers, display manager etc. There are various packages available for a single desktop environment, so choose accordingly.

#### Servers

The ‘package-install’ option also allows you to install one or more servers (or it’s client). The choices are as follows.

apache-mysql-php: This is the first option to install as a server. It installs the Apache2 server, MySQL server and PHP server.

nfs: This [second] option install the NFS (Network File Sharing) server or the NFS client. You get to choose if you want the NFS server or NFS client installed.

samba: This [third] option will prompt you to either install samba (SMB) client or samba server; it also has the option to install “fuse-smb”.

### Package Removal

Under the ‘package-removal’ option, you will once again be presented with an unprecedented amount of choices in a list.

The setup here is a bit different. Lets say that you want to remove bluetooth [drivers], input the number for bluetooth (1) and then select the option ‘remove-chosen’ (18) to remove bluetooth.

This allows you to select multiple items to select together for removal, and then remove all of them all at once.

### Clean-up

If you go under the ‘clean-up’ option, you will get the following choices to choose from

  1. apt-clean
  2. apt-autoclean
  3. kernel-remover
  4. remove-kernel-modules
  5. clean-smxi-stuff (remove all the items that smxi has created over time)
  6. debian-orphans
  7. remove-xorg-modules
  8. clean-cruft (remove all of the files related to an already removed package)



### Miscellaneous tweaks

‘miscellaneous-tweaks’ is the fourth option available in smxi menu. This option allows you to perform the following tasks

  1. mozilla-tweaks
  2. install-graphics
  3. advanced-tweaks
  4. legacy-tweaks
  5. libreoffice-hold-install



mozilla-tweaks has more options which include dumping gtk file handler in all Mozilla browsers (Firefox, Iceweasel, Swiftfox, etc), tweak Gecko (Firefox’s browser engine) preferences and add plug-ins to Switftox.

install-graphics: Updates your bashrc, updates locales, change Debian mirrors, change the default run level ([read more about run levels here][11]).

The fourth option is ‘legacy-tweaks’. These are tweaks that are considered legacy because they are either obsolete tweaks or that they are no longer required by newer versions of Debian. This option is available for the older installations of Debian.

### Kernel Options

The sixth option in smxi’s main menu is ‘kernel-options’ helps you configure, add and remove one or more kernel(s).

  1. alternate-kernel-install
  2. advanced-kernel-options
  3. kernel-remover



The first option in the ‘kernel-options’ sub menu allows you install archived kernels. This option exists because sometimes newer kernels can have some hardware issues at times.

The ‘advance-kernel-options’ allows you to add or remove kernel meta package, which includes adding [Liquorix kernel][12] sources (if it is supported by your Debian install).

And the final option, ‘kernel-remover’, helps you remove unused kernels (one at a time).

### Conclusion

As I said in the beginning of this article, you can do all of this using the regular package manager in Debian. It just presents many things at one place in an interactive manner.

This is something old school and maybe liked by a seasoned sysadmin. I am not sure about you.

Share your thoughts on using smxi and smxi-like tools in the 2020s.

And if you like this tool, consider [donating to its developer][13] who also created [inxi][14] for us.

--------------------------------------------------------------------------------

via: https://itsfoss.com/smxi/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/debian-vs-ubuntu/
[2]: https://github.com/smxi/smxi
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/02_extract_the_zip-2.webp?resize=800%2C500&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/04_smxi_showing_su.webp?resize=800%2C500&ssl=1
[5]: https://itsfoss.com/what-is-tty-in-linux/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/05_smxi_first_launch.webp?resize=800%2C500&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/06_choose_branch-1.webp?resize=800%2C500&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/07_smxi_sys_info_CONSECUTIVE_RUN-1.webp?resize=800%2C500&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/08_smxi_main_menu.webp?resize=800%2C500&ssl=1
[10]: https://itsfoss.com/terminal-web-browsers/
[11]: https://www.geeksforgeeks.org/run-levels-linux/
[12]: https://liquorix.net/
[13]: https://smxi.org/site/donations.htm
[14]: https://itsfoss.com/inxi-system-info-linux/
