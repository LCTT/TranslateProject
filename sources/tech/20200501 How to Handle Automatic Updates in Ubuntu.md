[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Handle Automatic Updates in Ubuntu)
[#]: via: (https://itsfoss.com/auto-updates-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Handle Automatic Updates in Ubuntu
======

_**Brief: This tutorial teaches you how to handle the unattended upgrade i.e. the automatic system updates in Ubuntu Linux.**_

Sometimes, when you try to [shutdown your Ubuntu system][1], you may come across this screen that stops you from shutting down:

**Unattended-upgrade in progress during shutdown, please don’t turn off the computer.**

![Unattended Upgrade In Progress In Ubuntu][2]

You might wonder what is this “unattended upgrade” and how come it is running without your knowledge.

The reason is that [Ubuntu][3] takes your system’s security very seriously. By default, it automatically checks for system updates daily and if it finds any security updates, it downloads those updates and install them on its own. For normal system and application updates, it notifies you via the Software Updater tool.

Since all this happens in the background, you don’t even realize it until you try to shutdown your system or try to install applications on your own.

Trying to install a new software when these unattended upgrades are in progress leads to the famous [could not get lock error][4].

![][5]

As you can see, the automatic updates present a couple of minor annoyance. You may choose to disable the auto updates but that would mean that you’ll have to check and [update your Ubuntu system][6] manually all the time.

Do you really need to disable auto updates?

Please note that this is a security feature. Linux allows you to do practically everything in your system even disabling these security features.
But in my opinion, as a regular user, _**you should not disable the automatic updates**_. It keeps your system safe after all.
For the sake of your system’s security, you may tolerate the minor annoyances that come with the automatic updates.

Now that you have been warned and you think it is better to take up the additional task of manually updating your system, let’s see how to handle the auto updates.

As always, there are two ways to do it: GUI and command line. I’ll show you both methods.

I have used Ubuntu 20.04 here but the steps are valid for Ubuntu 18.04 and any other Ubuntu version.

### Method 1: Disable automatic updates in Ubuntu graphically

Go to the menu and look for ‘software &amp; updates’ tool.

![Software & Updates Settings][7]

In here, go to Updates tab. Now look for the “Automatically check for updates”. By default it is set to Daily.

You can change it to Never and your system will never check for updates on its own again. And if it won’t check for updates, it won’t find new updates to install.

![Disable Auto Updates in Ubuntu Completely][8]

If you do this, you must manually update your system from time to time. But that’s an additional chore to do and you may not remember it all the time.

#### Slightly better way to handle auto updates in Ubuntu

Personally, I would suggest to let it check for updates on its own. If you don’t want it installing the updates automatically, you can change that behavior to get notified about the availability of security updates.

Keep “Automatically check for updates” to Daily and change “When there are security updates” option to “Display immediately” instead of “Download and install automatically”.

![Get notified for security updates instead of automatically installing them][9]

This way, it checks for updates and if there are updates, instead of installing them automatically in the background, the Software Updater tool notifies you that updates are available for your system. Your system already does that for normal system and software updates.

![Get notified about security updates][10]

With this setup, you won’t see the “unattended upgrades in progress” when you shutdown your system However, you may still encounter the ‘could not get lock’ error because two separate processes cannot use apt package manager at the same time.

I believe this is a better solution, don’t you you think?

As I promised both GUI and command line methods, let me show you how to disable unattended upgrades in the terminal.

### How to disable automatic updates in Ubuntu using command line

You’ll find the auto-upgrades settings in the **/etc/apt/apt.conf.d/20auto-upgrades** file. The default text editor in Ubuntu terminal is Nano so you can use this command to edit this configuration file:

```
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

Now, if you don’t want your system to check for updates automatically, you can change the value of APT::Periodic::Update-Package-Lists to 0.

```
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
```

If you want it to check for updates but don’t install the unattended-upgrades automatically, you can choose to set it like this:

```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "0";
```

**In the end…**

The automatic security updates are enabled automatically for a reason and I recommend you keep it like this. A couple of minor annoyances are not really worth risking the security of your system. What do you think?

--------------------------------------------------------------------------------

via: https://itsfoss.com/auto-updates-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/schedule-shutdown-ubuntu/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/unattended-upgrade-in-progress-in-ubuntu.png?ssl=1
[3]: https://ubuntu.com/
[4]: https://itsfoss.com/could-not-get-lock-error/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/Could_not_get_lock.jpg?ssl=1
[6]: https://itsfoss.com/update-ubuntu/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-updates-settings-ubuntu-20-04.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/disable-auto-updates-ubuntu.jpg?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/handle-auto-updates-ubuntu.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/updates-available-ubuntu.png?ssl=1
