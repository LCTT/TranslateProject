[#]: subject: "How to Upgrade to Ubuntu 22.04 “Jammy Jellyfish” From Ubuntu 20.04 LTS"
[#]: via: "https://www.debugpoint.com/2022/04/upgrade-ubuntu-22-04-from-20-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade to Ubuntu 22.04 “Jammy Jellyfish” From Ubuntu 20.04 LTS
======
HERE ARE THE COMPLETE STEPS AND PRECAUTIONS YOU NEED TO TAKE BEFORE
UPGRADING TO UBUNTU 22.04 LTS FROM UBUNTU 20.04 LTS.
[Ubuntu 22.04 LTS Jammy Jellyfish][1] releases on April 21, 2022. I recommend you wait for a month or two after April 21st to upgrade. Ideally, it would be best if you plan to Upgrade to any major release after the first point release.

But if you are in a hurry or want to experience the stunning changes and features that Ubuntu 22.04 brings to the table, then read below the steps required for a flawless upgrade process.

### Before Upgrade

For any upgrade, it is always wiser to follow some best practices. These prevent some post-upgrade problems and lead to a successful upgrade process.

  * Backup data to another drive or USB storage from your home directory includes your pictures, videos, or other personal files.
  * Keep a [LIVE USB ready with Ubuntu][2] if you run into an unstable system.
  * If you upgrade to a GNOME workstation, disable all the GNOME extensions because they will be incompatible as they work with GNOME 3.36+.
  * After a successful upgrade, you can enable the extensions one at a time.
  * Ensure that your system is up to date with packages by running the command `sudo apt update && sudo apt upgrade`
  * Close all your running applications.
  * Restart your system.



With that said, if you are ready, then follow the instructions below to Upgrade to Ubuntu 22.04 From Ubuntu 20.04 LTS.

### Upgrade to Ubuntu 22.04 from Ubuntu 20.04 and Ubuntu 21.10

#### Before April 21, 2022

If you want to upgrade before the release day, open a terminal window and run the following command.

```

    sudo do-release-upgrade -d

```

![Upgrade to Ubuntu 22.04 LTS from Ubuntu 20.04 LTS][3]

The above command will override the system “focal” branches with “jammy” to get the new packages. Not only that, but the command will also disable all third-party PPA that you may have added over the years.

Furthermore, the command will take some time to finish depending on your internet speed.

In addition to that, keep a watch on the terminal for occasional prompts which require your input as Y/N. Also, if you cancel the upgrade process midway, the third party PPA will not be enabled. So, you have to enable them manually.

![Summary of the upgrade][4]

Finally, the command will calculate the size of the upgrade and give you the estimated time required with a summary as shown below. Please read it carefully and give your permission to upgrade to Ubuntu 22.04 LTS Jammy Jellyfish.

[][5]

SEE ALSO:   Ubuntu 22.04 Jammy Jellyfish Daily Builds Are Now Available

After the upgrade process is complete, restart your system and enjoy the exciting Ubuntu 22.04 LTS.

#### After April 21, 2022

On the day or after April 21, 2022, Ubuntu will not give you any visual upgrade prompt for an upgrade until the first point release in July 2022 because the first point release is considered the most stable version after initial bugs are ironed out.

That said, you either wait until July, or you can force the upgrade. How? Open the Software and Updates, and go to the Updates tab. And change “notify me of new ubuntu version” to “any new version”.

Once you do that, you should see a prompt for an upgrade on the desktop. Follow the on-screen instructions and continue with the upgrade process.

The prompt also calculates the list of packages required to upgrade with the needed time, so read the updater output carefully. Once you are ready, start the process.

Finally, after the upgrade process is finished, reboot the system to enjoy the brand new Ubuntu 22.04 LTS Jammy Jellyfish.

#### Upgrade to Ubuntu 22.04 from Ubuntu 21.10

You can follow the above exact instructions for Ubuntu 21.10 as well. There are no extra steps required to Upgrade to Ubuntu 22.04 from Ubuntu 21.10.

#### How long does the upgrade to the Ubuntu 22.04 process take?

As per my test, the default install requires a little more than 30 minutes of total time to finish the entire upgrade process. It might be higher for your system based on how many software of packages you installed plus the age of your installation. So plan your time accordingly.

### Conclusion

Finally, I hope these steps help you successfully upgrade your Ubuntu system to Jammy Jellyfish. If you are planning to upgrade, I wish you all the best.

Do let me know in the comment box below how the upgrade process goes.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][6], [Twitter][7], [YouTube][8], and [Facebook][9] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/upgrade-ubuntu-22-04-from-20-04/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://releases.ubuntu.com/22.04/
[2]: https://www.debugpoint.com/2018/09/how-to-create-ubuntu-linux-os-bootable-usb-in-windows/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/04/Upgrade-to-Ubuntu-22.04-LTS-from-Ubuntu-20.04-LTS-1024x540.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Summary-of-the-upgrade-1024x581.jpg
[5]: https://www.debugpoint.com/2021/10/ubuntu-22-04-daily-builds/
[6]: https://t.me/debugpoint
[7]: https://twitter.com/DebugPoint
[8]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[9]: https://facebook.com/DebugPoint
