[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Upgrade to Ubuntu 20.04 Beta from 18.04 & 19.10)
[#]: via: (https://itsfoss.com/upgrade-ubuntu-beta/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Upgrade to Ubuntu 20.04 Beta from 18.04 & 19.10
======

[Ubuntu 20.04 LTS release][1] is less than a month away. It has plenty of visual changes and several performance improvements.

If you are still using Ubuntu 18.04 LTS, you’ll find Ubuntu 20.04 stunningly beautiful with its dark Yaru theme. Here’s a [video showing what Ubuntu 20.04 looks like][2]. Have a look and judge it yourself.

[Subscribe to our YouTube channel for more Linux videos][3]

Looks great, isn’t it? If you are excited about Ubuntu 20.04 and cannot wait till the final stable release on 23rd April, you can start using it even today. It’s fairly stable and it could even help Ubuntu team in testing this release.

There’s always the option to download the daily build and install it afresh. But if you are using Ubuntu 18.04 or Ubuntu 19.10, you can upgrade to Ubuntu 20.04 beta from your existing system.

Please check this tutorial to learn [how to find out which Ubuntu version you are using][4].

In this tutorial, I’ll show you the steps to upgrade to Ubuntu 20.04 beta.

### How to upgrade to Ubuntu 20.04 beta from Ubuntu 18.04 and 19.10

![Upgrade Ubuntu 20 04 Beta][5]

Before you see the steps, let me answer some of the common questions regarding upgrading to Ubuntu beta version.

  * The upgrade from one version to another is an easy process but you need to have a good internet connection that could download a couple of GBs of data at a good speed.
  * Upgrading to a newer version disables the third-party repositories ([PPA][6] you added on your own). Some of these PPAs might not be available for the new version yet. You can manually enable the PPAs after upgrading.
  * Having a backup of your important data on an external USB disk is always recommended. Just copy all your important files from Documents, Pictures, Music, Downloads and other places and put it on an external USB or hard disk.
  * Once you have upgraded to a newer version, you cannot go back to the older version you were using. Reinstalling the older version is the only option.
  * If you upgrade to the Ubuntu 20.04 beta version, you don’t need to install it again when the final stable version is released. Just update your Ubuntu system regularly and you’ll already be using the same 20.04 when it is released.
  * You cannot upgrade to Ubuntu 20.04 directly from Ubuntu 16.04, 17, 18, 19.04.



Alright! You know enough now. Let’s see the steps to upgrade to Ubuntu 20.04 beta from Ubuntu 19.10 and 18.04.

#### Step 1: Make sure the settings are right

Go to Software &amp; Updates application:

![Software & Updates application in Ubuntu][7]

In the Updates tab, check that Notify me of a new Ubuntu version is set to “Any new version” or “LTS version”:

![Ubuntu Upgrade Version Settings][8]

This may reload the Software repository cache.

#### Step 2: Update your system for any pending software updates

Once you have the correct settings in place, open a terminal ([use Ctrl+Alt+T shortcut in Ubuntu][9]) and use the following [command to update your Ubuntu system][10]:

```
sudo apt update && sudo apt full-upgrade
```

The apt full-upgrade or dist-upgrade function the same as ‘apt upgrade’ but it will remove currently installed packages if this is needed to upgrade the system as a whole (i.e. a version upgrade).

Your system may ask to restart after installing updates. That’s fine. Restart and resume upgrading to beta release from step 3.

#### Step 3: Run update manager with development release upgrade option

Now that you have all the necessary updates installed, you can open the update manager but with -d option. The -d option tells it to look for development releases.

```
update-manager -d
```

It may take a couple of minutes before informing you that a new version of Ubuntu is available.

![Availability of Ubuntu 20.04 in Ubuntu 19.10][11]

A similar message is displayed in Ubuntu 18.04 as well:

![Availability of Ubuntu 20.04 in Ubuntu 18.04][12]

Hit the upgrade button when you see the above message.

#### Step 4: Start upgrading to Ubuntu 20.04 beta

The rest of the upgrade procedure is basically waiting for update downloads and clicking okay wherever requested.

![][13]

Hit the upgrade button and follow the on-screen instructions.

![][14]

You might be notified that all the third party sources have been disabled. At some point, it will also inform you of the packages that will be upgraded, removed etc. It will also ask if you want to keep obsolete packages or not. I prefer to remove them.

Depending on your internet speed, the upgrade may take a couple of hours. Once the upgrade process is complete, you’ll be asked to restart your system.

![][15]

This video shows all the steps in action:

See, it wasn’t that difficult. Enjoy all the new features in Ubuntu 20.04.

Questions or suggestions? Feel free to leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/upgrade-ubuntu-beta/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-20-04-release-features/
[2]: https://www.youtube.com/watch?v=9u5B0njRgOw
[3]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[4]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-beta.jpg?ssl=1
[6]: https://itsfoss.com/ppa-guide/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/software-updates-app-ubuntu.jpg?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/ubuntu-upgrade-version-settings.jpg?ssl=1
[9]: https://itsfoss.com/ubuntu-shortcuts/
[10]: https://itsfoss.com/update-ubuntu/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04.jpg?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-from-18-04.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-steps-1.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-steps-2.jpg?ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/restart-to-finish-beta-upgarde-ubuntu-20-04.jpg?ssl=1
