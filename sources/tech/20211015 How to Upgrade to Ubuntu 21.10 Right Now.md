[#]: subject: "How to Upgrade to Ubuntu 21.10 Right Now"
[#]: via: "https://itsfoss.com/upgrade-ubuntu-to-newer-version/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade to Ubuntu 21.10 Right Now
======

[Ubuntu 21.10 ‘Impish Indri’ has just been released][1]. If you are using Ubuntu 21.04, you should be provided the option to upgrade to Ubuntu 21.10.

![Ubuntu 21.04 users should eventually be notified for the upgrade][2]

However, this roll out will be gradual. This means not everyone will be notified about the availability of the new version immediately. It may take a couple of weeks before you see the upgrade option.

But what if you are itching to get your hands on Ubuntu 21.10 that comes with GNOME 40 and other new features? Do you really have to wait? The answer is no.

### Upgrading to Ubuntu 21.10 from Ubuntu 21.04 right now

Here’s what you do. Open the Software &amp; Updates application:

![Start the Software & Updates application][3]

And make sure that you have set “**Notify me of a new Ubuntu version**” to “**For any new version**” under the **Updates** tab.

![Make sure that settings are right for new Ubuntu version notification][4]

Now open a terminal and enter the following command to make sure that your system is updated:

```
sudo apt update && sudo apt upgrade
```

Once your Ubuntu 21.04 system has all the updates installed, run the update manager to look for development release (Ubuntu 21.10 in this case).

```
update-manager -d
```

It will open the Update Manager tool that looks for updates. Since you have already updated the system, it won’t find new updates to install. However, it will see that Ubuntu 21.10 is now available.

![Hit the upgrade button][2]

You can hit the upgrade button and follow the on-screen option to start the upgrade procedure. You should have good internet speed to download the 2 GB worth of updates. Make sure that your system stays connected to a power source during the upgrade.

Enjoy Ubuntu 21.10!

--------------------------------------------------------------------------------

via: https://itsfoss.com/upgrade-ubuntu-to-newer-version/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/ubuntu-21-10-release/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/upgrade-to-Ubuntu-21-10.webp?resize=797%2C287&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/software-and-updates.webp?resize=800%2C166&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/ubuntu-upgrade-settings.webp?resize=800%2C338&ssl=1
