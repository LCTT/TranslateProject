[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Update a Fedora Linux System [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/update-fedora/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

How To Update a Fedora Linux System [Beginner’s Tutorial]
======

_**This quick tutorial shows various ways to update a Fedora Linux install.**_

So, the other day, I installed the [newly released Fedora 31][1]. I’ll be honest with you, it was my first time with a [non-Ubuntu distribution][2].

The first thing I did after installing Fedora was to try and install some software. I opened the software center and found that the software center was ‘broken’. I couldn’t install any application from it.

I wasn’t sure what went wrong with my installation. Discussing within the team, Abhishek advised me to update the system first. I did that and poof! everything was back to normal. After updating the [Fedora][3] system, the software center worked as it should.

Sometimes we just ignore the updates and keep troubleshooting the issue we face. No matter how big/small the issue is – to avoid them, you should keep your system up-to-date.

In this article, I’ll show you various possible methods to update your Fedora Linux system.

  * [Update Fedora using software center][4]
  * [Update Fedora using command line][5]
  * [Update Fedora from system settings][6]



Keep in mind that updating Fedora means installing the security patches, kernel updates and software updates. If you want to update from one version of Fedora to another, it is called version upgrade and you can [read about Fedora version upgrade procedure here][7].

### Updating Fedora From The Software Center

![Software Center][8]

You will most likely be notified that you have some system updates to look at, you should end up launching the software center when you click on that notification.

All you have to do is – hit ‘Update’ and verify the root password to start updating.

In case you did not get a notification for the available updates, you can simply launch the software center and head to the “Updates” tab. Now, you just need to proceed with the updates listed.

### Updating Fedora Using The Terminal

If you cannot load up the software center for some reason, you can always utilize the dnf package managing commands to easily update your system.

Simply launch the terminal and type in the following command to start updating (you should be prompted to verify the root password):

```
sudo dnf upgrade
```

**dnf update vs dnf upgrade
**
You’ll find that there are two dnf commands available: dnf update and dnf upgrade.
Both command do the same job and that is to install all the updates provided by Fedora.
Then why there is dnf update and dnf upgrade and which one should you use?
Well, dnf update is basically an alias to dnf upgrade. While dnf update may still work, the good practice is to use dnf upgrade because that is the real command.

### Updating Fedora From System Settings

![][9]

If nothing else works (or if you’re already in the System settings for a reason), navigate your way to the “Details” option at the bottom of your settings.

This should show up the details of your OS and hardware along with a “Check for Updates” button as shown in the image above. You just need to click on it and provide the root/admin password to proceed to install the available updates.

**Wrapping Up**

As explained above, it is quite easy to update your Fedora installation. You’ve got three available methods to choose from – so you have nothing to worry about.

If you notice any issue in following the instructions mentioned above, feel free to let me know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-fedora/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/fedora-31-release/
[2]: https://itsfoss.com/non-ubuntu-beginner-linux/
[3]: https://getfedora.org/
[4]: tmp.Lqr0HBqAd9#software-center
[5]: tmp.Lqr0HBqAd9#command-line
[6]: tmp.Lqr0HBqAd9#system-settings
[7]: https://itsfoss.com/upgrade-fedora-version/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/software-center.png?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/system-settings-fedora-1.png?ssl=1
