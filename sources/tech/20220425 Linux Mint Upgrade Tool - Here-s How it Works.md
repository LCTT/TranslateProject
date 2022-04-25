[#]: subject: "Linux Mint Upgrade Tool – Here’s How it Works"
[#]: via: "https://www.debugpoint.com/2022/04/mint-upgrade-tool/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint Upgrade Tool – Here’s How it Works
======
WE TESTED THE LINUX MINT UPGRADE TOOL (MINTUPGRADE GUI) WITH AN ACTUAL
UPGRADE. HERE’S WHAT WE FOUND.
This utility is under development and may contain bugs. Please do not use it in your daily driver unless you want to experiment.

### Linux Mint Upgrade Tool

The Linux Mint team [announced][1] that they built a new utility to upgrade the Linux Mint significant versions. It’s called the “mintupgrade2”. It is currently under development and planned for upgrading to the major versions—for example, Linux Mint 20 to 21 and not the minor version upgrades.

Although you can upgrade the versions using the standard apt commands, however, the Mint team believes major version upgrades are tricky. It would be difficult for the new users to perform a seamless upgrade because it involves the terminal and a set of complex steps with commands.

Moreover, the GUI is a wrapper with additional features to the mintupgrade program, which brings a set of pre-system checks and upgrade processes with a one-click Fix.

In addition to that, the mintupgrade checks basic checks whether you are connected to power, the system is up to date, disk space availability and many more features.

To give you all how it looks and works, we set up a testbed with LMDE 4 and give it a go.

But before that, here’s a quick set of features:

  * Entirely GUI driven upgrade process
  * Multi-language support
  * Pre-upgrade checks: system backup, power, disk space, list of removed packages
  * Configurable
  * Alert you about the orphaned packages from the prior version
  * It gives you the option to fix issues



### How it works

When we ran the mint upgrade utility via command mintupgrade, the GUI, the friendly welcome screen gives you an excellent starting point and starts the upgrade process. And then it begins with a series of checks on its own.

![Starting the upgrade process][2]

In addition to that, when it finds some problem in your system, it stops and gives you sufficient details about it. Once you click on Fix, it can resume the process again.

[][1]

SEE ALSO:   Linux Mint 21 Code Name Announced with New Upgrade Utility and More

That’s not all; it can also resume the upgrade process if interrupted due to network or internet or any other problem.

The utility found the following errors in our test system during our test and fixed them with just one click.

![Apt Cache check][3]

![Mint Upgrade detects that system snapshots are not present][4]

![Check for Orphan Packages][5]

![Status before upgrade][6]

![Mint Upgrade can detect the packages that require a downgrade][7]

Lastly, we successfully upgraded a test system from LMDE 4 to LMDE 5.

![Upgrade Complete][8]

#### How to get this upgrade utility

The installation of the utility is easy using the commands below. But as the team suggests, it is now in BETA, so do not use it for serious upgrades.

```

    sudo apt update

```

```

    sudo apt install mintupgrade

```

### Closing Notes

Finally, I think it’s one of the best utilities by the Linux Mint team. As you can see above, it handled many errors on its own. All I did was click the “Fix” button. And the utility is smart enough to understand all the failure points and took care of the remediations.

The [mintupgrade utility][9] will be released before the Linux Mint 21 “Vanessa” release around Q3 2022 end or beginning of Q4 2022.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][10], [Twitter][11], [YouTube][12], and [Facebook][13] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/mint-upgrade-tool/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/04/linux-mint-21-announcement/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Starting-the-upgrade-process.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/04/Apt-Cache-check-1024x521.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Mint-Upgrade-detects-that-system-snapshots-not-present-1024x522.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/04/Check-for-Orphan-Packages-1024x522.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/04/Status-before-upgrade-1024x528.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Mint-Upgrade-can-detect-the-packages-require-downgrade-1024x612.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Upgrade-Complete-1024x612.jpg
[9]: https://github.com/linuxmint/mintupgrade
[10]: https://t.me/debugpoint
[11]: https://twitter.com/DebugPoint
[12]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[13]: https://facebook.com/DebugPoint
