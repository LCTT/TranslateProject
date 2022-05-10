[#]: subject: "How to Upgrade to Fedora 36 from Fedora 35 Workstation (GUI and CLI Method)"
[#]: via: "https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade to Fedora 36 from Fedora 35 Workstation (GUI and CLI Method)
======
COMPLETE STEPS TO UPGRADE TO FEDORA 36 FROM FEDORA 35 WORKSTATION
EDITION WITH GUI AND CLI METHOD.
Fedora 36 brings several important features such as the beautiful GNOME 42, Linux Kernel 5.17, default font changes and many stunning features. Moreover, Fedora 36 also brings Wayland display server as the default NVIDIA proprietary driver. Plus several other significant changes that Fedora 36 brings, which you can read here in our [top 10 feature coverage][1].

If you plan to upgrade to Fedora 36 from Fedora 35 workstation edition, here are the steps you need to perform.

![Fedora 36 Workstation Desktop][2]

### Upgrade to Fedora 36

There are two methods to upgrade to Fedora 36 workstation. The first is the command line method (CLI), and the second is the GUI method which is completely graphical. We will cover both ways in this guide.

However, before you get excited to upgrade, there is some housekeeping that you should do.

#### Steps to Follow before upgrading to Fedora 36

Firstly, Open GNOME Software and check for any pending updates. Or, open a terminal and run the following command to ensure that your system is up-to-date.

```

    sudo dnf update

```

After the above command is complete, reboot your system to ensure all the updates are applied.

Secondly, take backups of your important documents such as pictures, docs or videos from your home directory to a safe place (perhaps a separate partition or USB stick). The Fedora upgrade process never fails, but if you use NVIDIA or any specific hardware with a dual boot system, I recommend you take backups.

Third, install the [Extensions Flatpak application][3] and disable all the GNOME Extensions (for the GNOME desktop). The primary reason is not all the extensions are ported yet to GNOME 42. Hence it is safe to disable all of them before upgrading. And you can enable them later after you complete the upgrade process.

Moreover, glance over the [Fedora 36 common bugs page][4] and the [forum][5] for any ongoing major bugs which may impact the upgrade process. Don’t spend much time on this.

Finally, the upgrade process takes some time (in hours), so ensure you have sufficient time and a stable internet connection.

#### How to Upgrade to Fedora 36 Workstation

##### Graphical Method (GUI)

After the official release of Fedora 36, you should see a prompt in GNOME Software showing that an upgrade is available. If you do not see any prompt, don’t worry. Wait for a day or two, and you should have it.

Also, you can visit the Updates tab in GNOME Software and see if it is available.

Click on the notification and hit Download to start the upgrade process. The upgrader will download the required packages and prompt you to restart. Hit restart to continue the upgrade process.

Fedora will apply the upgrades during reboot.

##### Command-Line method (CLI)

Firstly, you can follow the below steps, even if Fedora 36 is not yet released. And you can follow the same steps after the official release.

If you are comfortable with the command line, you can use the dnf upgrade command to perform the upgrade process.

Open up the terminal and run the below command:

```

    sudo dnf upgrade --refresh

```

This command will refresh the packages for the new upgrade stream to get ready for Fedora 36.

Next, install the dnf upgrade plugin by running the below command. This is required for the upgrade process.

```

    sudo dnf install dnf-plugin-system-upgrade

```

Make sure your system is up-to-date by running the below command and installing any necessary pending updates. Do it once again (if you have done it via pre-upgrade steps)

```

    sudo dnf --refresh upgrade

```

Initiate the download process by running the below command. This command will fetch all required packages and save them locally before the upgrade.

```

    sudo dnf system-upgrade download --releasever=36

```

If you installed many packages and applications manually and are unsure whether they are correctly supported by Fedora 36, run the above command with “–allowerasing” flag. When you provide this, dnf will remove the packages that are blockers for your system upgrade.

The above command displays what will be replaced, updated, upgraded, or downgraded. Carefully glance through the list if you want to review the list. Or, you can check the red-marked items and start the upgrade process—something like below.

![Fedora 36 upgrade via CLI][2]

![Review the RED marked items][2]

![Start the Fedora 36 Upgrade from CLI][2]

Remember, the download size ideally is in GB, so that it might take some time based on your internet speed.

After the above command is complete, run the below command to start the upgrade.

```

    sudo dnf system-upgrade reboot

```

The system will reboot automatically and wait until the entire upgrade process completes. As I mentioned earlier, this might take time in terms of hours, depending on your system hardware. Hence be patient.

You will be greeted with a brand new Fedora 36 system if all goes well.

Good luck! 🤞

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][6], [Twitter][7], [YouTube][8], and [Facebook][9] and never miss an update!

#### Share this:

  * [Twitter][10]

  * [Facebook][11]

  * [Print][12]

  * [LinkedIn][13]

  * [Reddit][14]

  * [Telegram][15]

  * [WhatsApp][16]

  * [Email][17]

  *


--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/04/fedora-34-features/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://flathub.org/apps/details/org.gnome.Extensions
[4]: https://fedoraproject.org/wiki/Common_F36_bugs
[5]: https://ask.fedoraproject.org/tags/c/common-issues/141/none/f36/l/latest
[6]: https://t.me/debugpoint
[7]: https://twitter.com/DebugPoint
[8]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[9]: https://facebook.com/DebugPoint
[10]: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/?share=twitter (Click to share on Twitter)
[11]: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/?share=facebook (Click to share on Facebook)
[12]: tmp.qWNnWrQWsn#print (Click to print)
[13]: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/?share=linkedin (Click to share on LinkedIn)
[14]: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/?share=reddit (Click to share on Reddit)
[15]: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/?share=telegram (Click to share on Telegram)
[16]: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/?share=jetpack-whatsapp (Click to share on WhatsApp)
[17]: https://www.debugpoint.com/2022/05/upgrade-fedora-36-from-fedora-35/?share=email (Click to email this to a friend)
