[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Kali Linux Will No Longer Have The Default Root User)
[#]: via: (https://itsfoss.com/kali-linux-root-user/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Kali Linux Will No Longer Have The Default Root User
======

Kali Linux is a specialized Linux distribution for cyber security testing and hacking related tasks.

If you’ve used [Kali Linux][1], you probably know that it followed a default root user policy. In other words, you are always root in Kali Linux. Whatever you do – you will be accessing tools/applications as root by default.

It looks like everything back then was kind of “root for all” for everything. So, the default root user policy existed.

They also explained the history for this in their [announcement post][2]:

> A lot of those tools back then either required root access to run or ran better when ran as root. With this operating system that would be ran from a CD, never be updated, and had a lot of tools that needed root access to run it was a simple decision to have a “everything as root” security model. It made complete sense for the time.

### Kali Linux will now have a default non-root user (like most other distributions)

![][3]

A default non-root model was necessary because a lot of users now use Kali Linux as their daily driver.

Of course, they [do not recommend using Kali Linux][4] as a replacement for stable distributions like Ubuntu/Fedora/Manjaro – however, with its active development, some users do consider using it on a day-to-day basis instead of just using it for its tools.

So, with a wide mainstream usage of the distro, the Kali Linux team thought of switching to a default non-root model because nowadays a lot of applications/tools do not require root access.

> While we don’t encourage people to run Kali as their day to day operating system, over the last few years more and more users have started to do so _(even if they are not using it to do penetration testing full time)_, including some members of the Kali development team. When people do so, they obviously don’t run as default root user. With this usage over time, there is the obvious conclusion that default root user is no longer necessary and Kali will be better off moving to a more traditional security model.

So I am reiterating that you should not consider Kali Linux to be fit for your daily tasks if you do not utilize security-related [Kali Linux tools][5]. Feel free to experiment – but I wouldn’t be so sure to rely on it.

So from the next release, when you install Kali Linux, you’ll be asked to create non-root user that will have admin privileges. Tools and commands that require root access will be run with sudo.

![][6]

#### [Pretend to be Using Windows with Kali Linux Undercover Mode][7]

The new undercover mode in Kali Linux switches the desktop layout to make it look like Windows 10. Find out how to activate the undercover mode.

### New default user and password for Kali Linux live mode

![Kali Linux has new user-password in the live system][8]

Technically, you won’t find a groundbreaking difference. Just note that the default user ID and password in live mode is “**kali**“.

You can find the new non-root model implemented in the new daily/weekly builds if you want to test it early.

In either case, you can wait for the 2020.1 release scheduled for late January to take a look at the new default non-root user model.

### Getting back the old root model in Kali Linux

If you are a long time Kali Linux user, you may not find it convenient to add sudo before commands and then manually enter the password.

The good news here is that you can still get the old password-less root rights with this command:

```
sudo dpkg-reconfigure kali-grant-root
```

What do you think about the default non-root user model? Is it a good decision? Let me know your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/kali-linux-root-user/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.kali.org/
[2]: https://www.kali.org/news/kali-default-non-root-user/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/kali_linux_default_root_user.png?ssl=1
[4]: https://itsfoss.com/kali-linux-review/
[5]: https://itsfoss.com/best-kali-linux-tools/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/kali_linux_undercover_mode.jpg?fit=800%2C450&ssl=1
[7]: https://itsfoss.com/kali-linux-undercover-mode/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/kali-linux-live-password.png?ssl=1
