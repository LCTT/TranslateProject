[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Got Kids? Limit Computer Usage Per Account in Linux With Timekpr-nExt)
[#]: via: (https://itsfoss.com/timekpr-next/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Got Kids? Limit Computer Usage Per Account in Linux With Timekpr-nExt
======

_**Open source software highlight of this week is Timekpr-nExt. It is a GUI application to limit the computer usage for certain accounts on a Linux system. This is a handy utility for parents who do not want children to spend excessive time on the computer.**_

### Use Timekpr-nExt to limit computer usage on Linux

If you have young children at home who spend too much time on computer, you may want to put some sort of restriction on the usage.

Timekpr-nExt enables you to limit computer usage for certain accounts based on the time of day, number of hours a day, week or month. You may also set time interval to force the account user to take break.

![][1]

After the given time expires, the user is automatically logged out and cannot log back in until the restriction conditions are satisfied.

![][2]

Of course, this means that you need to have separate non-admin (no sudo access) accounts for the children. If the kids accounts also have admin access, they can change the settings easily. Kids are smart, you know.

### Features of Timekpr-nExt

Apart from an annoyingly stylized name, Timekpr-nExt has the following features:

  * Limit system usage as day wise limit, daily limit, weekly or monthly limit
  * You can also set access restrictions based on time and hour
  * Users can be shown notification about how much time they have left
  * Set the lockout action (terminate session, shutdown, suspend or lock screen)
  * Track the time usage of the accounts



Keep the following things in mind:

  * Check carefully which account you are configuring. _**Do not lock yourself out**_.
  * Hit the apply or set button for each configuration changes otherwise the changes won’t be set.
  * Children accounts should not have admin action otherwise they can overwrite the settings.



Read the [documents about more information on using Timekpr-nExt][3].

### Installing Timekpr-nExt on Linux

For Ubuntu-based Linux distributions (like Mint, Linux Lite etc), there is an [official PPA available][4]. You can install it by using the following commands one by one:

```
sudo add-apt-repository ppa:mjasnik/ppa
sudo apt update
sudo apt install timekpr-next
```

Arch Linux users can [find it in AUR][5]. For others, please check your distribution’s repository. If there is no such package, you may try using the source code.

[Timekpr-nExt Source Code][6]

_**Again, do not use Timekpr-nExt for your own main account. You may lock yourself out.**_

You’ll see two instances of the application. Use the one with (SU) at the beginning.

![][7]

#### Removing Timekpr-nExt

I cannot say for certain if removing Timekpr-nExt will also remove the restrictions you put in place for the users. It will be a good idea to manually restore them (putting 24 hr interval a day). There is no reset button here.

To remove this application (if you used PPA to install it), use the following command:

```
sudo apt-get remove --purge timekpr-next
```

Delete the PPA repository as well:

```
sudo add-apt-repository -r ppa:mjasnik/ppa
```

Like [blocking adult content on Linux][8], this application is also children specific. Not everyone would find it useful but people with young children at home may use it if they feel the need.

Do you use some other application to monitor/restrict children from accessing computer?

--------------------------------------------------------------------------------

via: https://itsfoss.com/timekpr-next/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/timekpr-next-ubuntu.png?resize=800%2C612&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/timekpr-next-icon-system-notification-area.png?resize=640%2C94&ssl=1
[3]: https://mjasnik.gitlab.io/timekpr-next/
[4]: https://launchpad.net/~mjasnik/+archive/ubuntu/ppa
[5]: https://aur.archlinux.org/packages/timekpr-next/
[6]: https://launchpad.net/timekpr-next
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/timekeeper-next.jpg?resize=799%2C250&ssl=1
[8]: https://itsfoss.com/how-to-block-porn-by-content-filtering-on-ubuntu/
