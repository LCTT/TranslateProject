A Kernel Module That Forcibly Shutdown Your System
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/kgotobed-720x340.png)
I know that staying up late is bad for the health. But, who cares? I have been a night owl for years. I usually go to bed after 12 am, sometimes after 1 am. The next morning, I snooze my alarm at least three times, wake up tired and grumpy. Everyday, I promise myself I will go to bed earlier, but ended up going to bed very late as usual. And, this cycle continues! If you’re anything like me, here is a good news. A fellow late nighter has developed a Kernel module named **“Kgotobed”** that forces you to go to bed at a specific time. That said it will forcibly shutdown your system.

Why should I use this? I have plenty of other options. I can set a cron job to schedule system shutdown at a specific time. I can set up a reminder or alarm clock. I can use a browser plugin or a software. You might ask! However, they all are can easily be ignored or bypassed. Kgotobed is something that you can’t ignore. Something that **can’t be disabled even if you’re a root user**. Yes, it will forcibly power off your system at the specified time. There is no snooze option. You can’t postpone the power off process or you can’t cancel it either. Your system will go down at the specified time no matter what. You have been warned!!

### Install Kgotobed

Make sure you have installed **dkms**. It is available in the default repositories of most Linux distributions.

For example on Fedora, you can install it using the following command:
```
$ sudo dnf install kernel-devel-$(uname -r) dkms

```

On Debian, Ubuntu, linux Mint:
```
$ sudo apt install dkms

```

Once installed the prerequisites, git clone Kgotobed project.
```
$ git clone https://github.com/nikital/kgotobed.git

```

This command will clone all contents of Kgotobed repository in a folder named “kgotobed” in your current working directory. Cd to that directory:
```
$ cd kgotobed/

```

And, install Kgotobed driver using command:
```
$ sudo make install

```

The above command will register **kgotobed.ko** module with **DKMS** (so that it will be rebuilt for every kernel you run) and Install **gotobed** utility in **/usr/local/bin/** location and then register, enable and start kgotobed service.

### How it works

By default, Kgotobed sets bedtime to **1:00 AM**. That said, your computer will shutdown at 1:00 AM no matter what you’re doing.

To view the current bed time, run:
```
$ gotobed
Current bedtime is 2018-04-10 01:00:00

```

To move the bed time earlier, for example 22:00 (10 PM), run:
```
$ sudo gotobed 22:00
[sudo] password for sk:
Current bedtime is 2018-04-10 00:58:00
Setting bedtime to 2018-04-09 22:00:00
Bedtime will be in 2 hours 16 minutes

```

This can be helpful when you want to sleep earlier!

However, you can’t move the bed time later i.e after 1:00 AM. You can’t unload the module, and adjusting system clock won’t help either. The only way out is a reboot!!

To set different default time, you need to customize **kgotobed.service** (by editing it or by using systemd drop-in).

### Uninstall Kgotobed

Not happy with Kgotobed? No worries! Go to the “kgotobed” folder which we cloned earlier and run the following command to uninstall it.
```
$ sudo make uninstall

```

Again, I warn you there is no way to snooze, postpone, or cancel the power off process, even if you’re a root user. Your system will go down forcibly at the specified time. This is not for everyone! It may drive you nuts when you’re working on an important task. In such cases, make sure you have saved the work from time to time or use some advanced utilities that help you to auto shutdown, reboot, suspend, and hibernate your system at a specific time as described in the following link.

And, that’s for now. Hope you find this guide useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/kgotobed-a-kernel-module-that-forcibly-shutdown-your-system/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
