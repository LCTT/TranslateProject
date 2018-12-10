[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How To Fix Broken Ubuntu OS Without Reinstalling It)
[#]: via: (https://www.ostechnix.com/how-to-fix-broken-ubuntu-os-without-reinstalling-it/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)
[#]: url: ( )

How To Fix Broken Ubuntu OS Without Reinstalling It
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/Fix-Broken-Ubuntu-OS-720x340.jpg)

Today, I was upgrading my Ubuntu 18.04 LTS system. Unfortunately, the power has gone in mid-way and the system powered off while updating Ubuntu OS. When the power is back, I boot the system again. Right after entering the password at the login screen, it’s gone blank and didn’t respond. Keyboard and mouse also didn’t work. All I see is just a blank screen! Thankfully, It’s just a test machine and there were no important data in it. I can simply wipe off the entire OS and install it again. But, I don’t want to do that. Since I have nothing to lose, I just wanted to repair my broken Ubuntu system without reinstalling it completely and it worked!!! If you ever find yourself in a situation like mine, don’t panic. This brief tutorial describes how to easily fix broken Ubuntu OS without losing data and without reinstalling it completely.

### Fix Broken Ubuntu OS

First of all, try to login with live cd and **backup your data** in an external drive. Just in case, if this method didn’t work, you can still have your data and reinstall everything!

At the login screen, press **CTRL+ALT+F1** to switch to **tty1**. You can learn more about switching between TTYs [**here**][1].

Now, type the following commands one by one to fix the broken Ubuntu Linux.

```
$ sudo rm /var/lib/apt/lists/lock

$ sudo rm /var/lib/dpkg/lock

$ sudo rm /var/lib/dpkg/lock-frontend

$ sudo dpkg --configure -a

$ sudo apt clean

$ sudo apt update --fix-missing

$ sudo apt install -f

$ sudo dpkg --configure -a

$ sudo apt upgrade

$ sudo apt dist-upgrade
```

Finally, reboot the system using command:

```
$ sudo reboot
```

You can now be able to login to your Ubuntu system as usual.

After I followed these steps, all of my data in Ubuntu 18.04 test system was there and everything is the same as I left it. This method may not work for everyone. However, this small tip worked for me and saved a couple minutes from reinstalling. If you know any other better way, please let me know in the comment section. I will add them in this guide as well.

And, that’s all for now. Hope this was useful.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-fix-broken-ubuntu-os-without-reinstalling-it/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/how-to-switch-between-ttys-without-using-function-keys-in-linux/
