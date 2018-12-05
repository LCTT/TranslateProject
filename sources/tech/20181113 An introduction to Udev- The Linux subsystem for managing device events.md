Translating by qhwdw
An introduction to Udev: The Linux subsystem for managing device events
======
Create a script that triggers your computer to do a specific action when a specific device is plugged in.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opensourceprescription.png?itok=gFrc_GTH)

Udev is the Linux subsystem that supplies your computer with device events. In plain English, that means it's the code that detects when you have things plugged into your computer, like a network card, external hard drives (including USB thumb drives), mouses, keyboards, joysticks and gamepads, DVD-ROM drives, and so on. That makes it a potentially useful utility, and it's well-enough exposed that a standard user can manually script it to do things like performing certain tasks when a certain hard drive is plugged in.

This article teaches you how to create a [udev][1] script triggered by some udev event, such as plugging in a specific thumb drive. Once you understand the process for working with udev, you can use it to do all manner of things, like loading a specific driver when a gamepad is attached, or performing an automatic backup when you attach your backup drive.

### A basic script

The best way to work with udev is in small chunks. Don't write the entire script upfront, but instead start with something that simply confirms that udev triggers some custom event.

Depending on your goal for your script, you can't guarantee you will ever see the results of a script with your own eyes, so make sure your script logs that it was successfully triggered. The usual place for log files is in the **/var** directory, but that's mostly the root user's domain. For testing, use **/tmp** , which is accessible by normal users and usually gets cleaned out with a reboot.

Open your favorite text editor and enter this simple script:

```
#!/usr/bin/bash

echo $date > /tmp/udev.log
```

Place this in **/usr/local/bin** or some such place in the default executable path. Call it **trigger.sh** and, of course, make it executable with **chmod +x**.

```
$ sudo mv trigger.sh /usr/local/bin
$ sudo chmod +x /usr/local/bin/trigger.sh
```

This script has nothing to do with udev. When it executes, the script places a timestamp in the file **/tmp/udev.log**. Test the script yourself:

```
$ /usr/local/bin/trigger.sh
$ cat /tmp/udev.log
Tue Oct 31 01:05:28 NZDT 2035
```

The next step is to make udev trigger the script.

### Unique device identification

In order for your script to be triggered by a device event, udev must know under what conditions it should call the script. In real life, you can identify a thumb drive by its color, the manufacturer, and the fact that you just plugged it into your computer. Your computer, however, needs a different set of criteria.

Udev identifies devices by serial numbers, manufacturers, and even vendor ID and product ID numbers. Since this is early in your udev script's lifespan, be as broad, non-specific, and all-inclusive as possible. In other words, you want first to catch nearly any valid udev event to trigger your script.

With the **udevadm monitor** command, you can tap into udev in real time and see what it sees when you plug in different devices. Become root and try it.

```
$ su
# udevadm monitor
```

The monitor function prints received events for:

  * UDEV: the event udev sends out after rule processing
  * KERNEL: the kernel uevent



With **udevadm monitor** running, plug in a thumb drive and watch as all kinds of information is spewed out onto your screen. Notice that the type of event is an **ADD** event. That's a good way to identify what type of event you want.

The **udevadm monitor** command provides a lot of good info, but you can see it with prettier formatting with the command **udevadm info** , assuming you know where your thumb drive is currently located in your **/dev** tree. If not, unplug and plug your thumb drive back in, then immediately issue this command:

```
$ su -c 'dmesg | tail | fgrep -i sd*'
```

If that command returned **sdb: sdb1** , for instance, you know the kernel has assigned your thumb drive the **sdb** label.

Alternately, you can use the **lsblk** command to see all drives attached to your system, including their sizes and partitions.

Now that you have established where your drive is located in your filesystem, you can view udev information about that device with this command:

```
# udevadm info -a -n /dev/sdb | less
```

This returns a lot of information. Focus on the first block of info for now.

Your job is to pick out parts of udev's report about a device that are most unique to that device, then tell udev to trigger your script when those unique attributes are detected.

The **udevadm info** process reports on a device (specified by the device path), then  "walks" up the chain of parent devices. For every device found, it prints all possible attributes using a key-value format. You can compose a rule to match according to the attributes of a device plus attributes from one single parent device.

```
looking at device '/devices/000:000/blah/blah//block/sdb':
  KERNEL=="sdb"
  SUBSYSTEM=="block"
  DRIVER==""
  ATTR{ro}=="0"
  ATTR{size}=="125722368"
  ATTR{stat}==" 2765 1537 5393"
  ATTR{range}=="16"
  ATTR{discard\_alignment}=="0"
  ATTR{removable}=="1"
  ATTR{blah}=="blah"
```

A udev rule must contain one attribute from one single parent device.

Parent attributes are things that describe a device from the most basic level, such as it's something that has been plugged into a physical port or it is something with a size or this is a removable device.

Since the KERNEL label of **sdb** can change depending upon how many other drives were plugged in before you plugged that thumb drive in, that's not the optimal parent attribute for a udev rule. However, it works for a proof of concept, so you could use it. An even better candidate is the SUBSYSTEM attribute, which identifies that this is a  "block" system device (which is why the **lsblk** command lists the device).

Open a file called **80-local.rules** in **/etc/udev/rules.d** and enter this code:

```
SUBSYSTEM=="block", ACTION=="add", RUN+="/usr/local/bin/trigger.sh"
```

Save the file, unplug your test thumb drive, and reboot.

Wait, reboot on a Linux machine?

Theoretically, you can just issue **udevadm control --reload** , which should load all rules, but at this stage in the game, it's best to eliminate all variables. Udev is complex enough, and you don't want to be lying in bed all night wondering if that rule didn't work because of a syntax error or if you just should have rebooted. So reboot regardless of what your POSIX pride tells you.

When your system is back online, switch to a text console (with Ctl+Alt+F3 or similar) and plug in your thumb drive. If you are running a recent kernel, you will probably see a bunch of output in your console when you plug in the drive. If you see an error message such as Could not execute /usr/local/bin/trigger.sh, you probably forgot to make the script executable. Otherwise, hopefully all you see is a device was plugged in, it got some kind of kernel device assignment, and so on.

Now, the moment of truth:

```
$ cat /tmp/udev.log
Tue Oct 31 01:35:28 NZDT 2035
```

If you see a very recent date and time returned from **/tmp/udev.log** , udev has successfully triggered your script.

### Refining the rule into something useful

The problem with this rule is that it's very generic. Plugging in a mouse, a thumb drive, or someone else's thumb drive will indiscriminately trigger your script. Now is the time to start focusing on the exact thumb drive you want to trigger your script.

One way to do this is with the vendor ID and product ID. To get these numbers, you can use the **lsusb** command.

```
$ lsusb
Bus 001 Device 002: ID 8087:0024 Slacker Corp. Hub
Bus 002 Device 002: ID 8087:0024 Slacker Corp. Hub
Bus 003 Device 005: ID 03f0:3307 TyCoon Corp.
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 hub
Bus 001 Device 003: ID 13d3:5165 SBo Networks
```

In this example, the **03f0:3307** before **TyCoon Corp.** denotes the idVendor and idProduct attributes. You can also see these numbers in the output of **udevadm info -a -n /dev/sdb | grep vendor** , but I find the output of **lsusb** a little easier on the eyes.

You can now include these attributes in your rule.

```
SUBSYSTEM=="block", ATTRS{idVendor}=="03f0", ACTION=="add", RUN+="/usr/local/bin/thumb.sh"
```

Test this (yes, you should still reboot, just to make sure you're getting fresh reactions from udev), and it should work the same as before, only now if you plug in, say, a thumb drive manufactured by a different company (therefore with a different idVendor) or a mouse or a printer, the script won't be triggered.

Keep adding new attributes to further focus in on that one unique thumb drive you want to trigger your script. Using **udevadm info -a -n /dev/sdb** , you can find out things like the vendor name, sometimes a serial number, or the product name, and so on.

For your own sanity, be sure to add only one new attribute at a time. Most mistakes I have made (and have seen other people online make) is to throw a bunch of attributes into their udev rule and wonder why the thing no longer works. Testing attributes one by one is the safest way to ensure udev can identify your device successfully.

### Security

This brings up the security concerns of writing udev rules to automatically do something when a drive is plugged in. On my machines, I don't even have auto-mount turned on, and yet this article proposes scripts and rules that execute commands just by having something plugged in.

Two things to bear in mind here.

  1. Focus your udev rules once you have them working so they trigger scripts only when you really want them to. Executing a script that blindly copies data to or from your computer is a bad idea in case anyone who happens to be carrying the same brand of thumb drive plugs it into your box.
  2. Do not write your udev rule and scripts and forget about them. I know which computers have my udev rules on them, and those boxes are most often my personal computers, not the ones I take around to conferences or have in my office at work. The more "social" a computer is, the less likely it is to get a udev rule on it that could potentially result in my data ending up on someone else's device or someone else's data or malware on my device.



In other words, as with so much of the power provided by a GNU system, it is your job to be mindful of how you are wielding that power. If you abuse it or fail to treat it with respect, it very well could go horribly wrong.

### Udev in the real world

Now that you can confirm that your script is triggered by udev, you can turn your attention to the function of the script. Right now, it is useless, doing nothing more than logging the fact that it has been executed.

I use udev to trigger [automated backups][2] of my thumb drives. The idea is that the master copies of my active documents are on my thumb drive (since it goes everywhere I go and could be worked on at any moment), and those master documents get backed up to my computer each time I plug the drive into that machine. In other words, my computer is the backup drive and my production data is mobile. The source code is available, so feel free to look at the code of attachup for further examples of constraining your udev tests.

Since that's what I use udev for the most, it's the example I'll use here, but udev can grab lots of other things, like gamepads (this is useful on systems that aren't set to load the xboxdrv module when a gamepad is attached) and cameras and microphones (useful to set inputs when a specific mic is attached), so realize that it's good for a lot more than this one example.

A simple version of my backup system is a two-command process:

```
SUBSYSTEM=="block", ATTRS{idVendor}=="03f0", ACTION=="add", SYMLINK+="safety%n"
SUBSYSTEM=="block", ATTRS{idVendor}=="03f0", ACTION=="add", RUN+="/usr/local/bin/trigger.sh"
```

The first line detects my thumb drive with the attributes already discussed, then assigns the thumb drive a symlink within the device tree. The symlink it assigns is **safety%n**. The **%n** is a udev macro that resolves to whatever number the kernel gives to the device, such as sdb1, sdb2, sdb3, and so on. So **%n** would be the 1 or the 2 or the 3.

This creates a symlink in the dev tree, so it does not interfere with the normal process of plugging in a device. This means that if you use a desktop environment that likes to auto-mount devices, you won't be causing problems for it.

The second line runs the script.

My backup script looks like this:

```
#!/usr/bin/bash

mount /dev/safety1 /mnt/hd
sleep 2
rsync -az /mnt/hd/ /home/seth/backups/ && umount /dev/safety1
```

The script uses the symlink, which avoids the possibility of udev naming the drive something unexpected (for instance, if I have a thumb drive called DISK plugged into my computer already, and I plug in my other thumb drive also called DISK, the second one will be labeled DISK_, which would foil my script). It mounts **safety1** (the first partition of the drive) at my preferred mount point of **/mnt/hd**.

Once safely mounted, it uses [rsync][3] to back up the drive to my backup folder (my actual script uses rdiff-backup, and yours can use whatever automated backup solution you prefer).

### Udev is your dev

Udev is a very flexible system and enables you to define rules and functions in ways that few other systems dare provide users. Learn it and use it, and enjoy the power of POSIX.

This article builds on content from the [Slackermedia Handbook][4], which is licensed under the [GNU Free Documentation License 1.3][5].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/udev

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://linux.die.net/man/8/udev
[2]: https://gitlab.com/slackermedia/attachup
[3]: https://opensource.com/article/17/1/rsync-backup-linux
[4]: http://slackermedia.info/handbook/doku.php?id=backup
[5]: http://www.gnu.org/licenses/fdl-1.3.html
