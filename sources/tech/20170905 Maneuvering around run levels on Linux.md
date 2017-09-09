@penghuster is translating

Maneuvering around run levels on Linux
============================================================

### Learn how run levels are configured and how you can change the run level interactively or modify what services are available.

![Maneuvering around run levels on Linux](https://images.idgesg.net/images/article/2017/09/run-levels-vincent_desjardins-100734685-large.jpg)
[Vincent Desjardins][15] [(CC BY 2.0)][16]


On Linux systems, run levels are operational levels that describe the state of the system with respect to what services are available.

One run level is restrictive and used only for maintenance; network connections will not be operational, but admins can log in through a console connection.

Others allow anyone to log in and work, but maybe with some differences in the available services. This post examines how run levels are configured and how you can change the run level interactively or modify what services are available.

The default run state on Linux systems — the one that will be used when the system starts up (unless instructed otherwise) — is usually configured in the **/etc/inittab** file, which generally looks something like this:

```
id:3:initdefault:
```

Some, including Debian systems, default to run state 2, rather than 3, and don’t generally have an /etc/inittab file at all.

How run levels are set up by default and how they are configured depends in part on the particular distribution you are running. On some systems, for example, run level 2 is multi-user, and run level 3 is multi-user with NFS (file system sharing) support. On others, run levels 2-5 are basically identical. Run level 1 is single-user mode. Run levels on Debian systems, for example, will default to this kind of setup:

Run levels on Debian systems default to this kind of setup:

```
0 = halted
1 = single user (maintenance mode)
2 = multi-user mode
3-5 = same as 2
6 = reboot
```

On Linux systems that use run level 3 to share file systems with other systems, it easy to start or stop file system sharing without changing anything about the system but the run level. Changing run level from 2 to 3 would allow the file systems to be shared. Changing the run level from 3 to 2 would disable sharing.

<aside class="nativo-promo tablet desktop" id="" style="overflow: hidden; margin-bottom: 16px; max-width: 620px;"></aside>

What processes are run in any run level depends on the contents of the /etc/rc?.d directory where ? might be 2, 3, 4, or 5 (corresponding to the run level).

On the system used in the example below (an Ubuntu system), we can see that the content of the directories for these four run states are all set up the same — because the configuration of the directories are the same.

```
/etc/rc2.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
/etc/rc2.d$ cd ../rc3.d
/etc/rc3.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
/etc/rc3.d$ cd ../rc4.d
/etc/rc4.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
/etc/rc4.d$ cd ../rc5.d
/etc/rc5.d$ ls
README         S20smartmontools      S50saned      S99grub-common
S20kerneloops  S20speech-dispatcher  S70dns-clean  S99ondemand
S20rsync       S20sysstat            S70pppd-dns   S99rc.local
```

And what are these files? They’re all symbolic links that point to scripts in the /etc/init.d directory that start services. And the names of the files are important because they determine the order in which the scripts are run. For example, S20 scripts are run before S50 scripts.

```
$ ls -l
total 4
-rw-r--r-- 1 root root 677 Feb 16  2016 README
lrwxrwxrwx 1 root root  20 Aug 30 14:40 S20kerneloops -> ../init.d/kerneloops
lrwxrwxrwx 1 root root  15 Aug 30 14:40 S20rsync -> ../init.d/rsync
lrwxrwxrwx 1 root root  23 Aug 30 16:10 S20smartmontools -> ../init.d/smartmontools
lrwxrwxrwx 1 root root  27 Aug 30 14:40 S20speech-dispatcher -> ../init.d/speech-dispatcher
lrwxrwxrwx 1 root root  17 Aug 31 14:12 S20sysstat -> ../init.d/sysstat
lrwxrwxrwx 1 root root  15 Aug 30 14:40 S50saned -> ../init.d/saned
lrwxrwxrwx 1 root root  19 Aug 30 14:40 S70dns-clean -> ../init.d/dns-clean
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S70pppd-dns -> ../init.d/pppd-dns
lrwxrwxrwx 1 root root  21 Aug 30 14:40 S99grub-common -> ../init.d/grub-common
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S99ondemand -> ../init.d/ondemand
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S99rc.local -> ../init.d/rc.local
```

The /etc/rc1.d directory, as you’d probably suspect, is different because run level 1 is so different. It contains symbolic links that point to a very different set of scripts. Notice, too, that some of the symbolic links start with the letter K, while others start with the more normal S. This is because some services need to  **_stop_**  when a system enters single user mode. While some of these links point to the same scripts that are used in other run levels, the K (kill) indicates that these scripts will be run with an argument that instructs the services to stop rather than one that instructs them to start.

```
/etc/rc1.d$ ls -l
total 4
lrwxrwxrwx 1 root root  20 Aug 30 14:40 K20kerneloops -> ../init.d/kerneloops
lrwxrwxrwx 1 root root  15 Aug 30 14:40 K20rsync -> ../init.d/rsync
lrwxrwxrwx 1 root root  15 Aug 30 14:40 K20saned -> ../init.d/saned
lrwxrwxrwx 1 root root  23 Aug 30 16:10 K20smartmontools -> ../init.d/smartmontools
lrwxrwxrwx 1 root root  27 Aug 30 14:40 K20speech-dispatcher -> ../init.d/speech-dispatcher
-rw-r--r-- 1 root root 369 Mar 12  2014 README
lrwxrwxrwx 1 root root  19 Aug 30 14:40 S30killprocs -> ../init.d/killprocs
lrwxrwxrwx 1 root root  19 Aug 30 14:40 S70dns-clean -> ../init.d/dns-clean
lrwxrwxrwx 1 root root  18 Aug 30 14:40 S70pppd-dns -> ../init.d/pppd-dns
lrwxrwxrwx 1 root root  16 Aug 30 14:40 S90single -> ../init.d/single
```

You can change the default run level on a system, though there is rarely a need to do so. For example, you could configure a Debian system to default to a run level of 3 (rather than 2) by setting up an /etc/inittab file that looks, for example, like this one:

```
id:3:initdefault:
```

Once you make the change and reboot, the runlevel command would show you this:

```
$ runlevel
N 3
```

Alternately, if you used the **init 3** command, you would also change run levels (rebooting is not required to change run states) and your runlevel output would look like this:

```
$ runlevel
2 3
```

Of course, there’s little reason to change your default state by creating or modifying **/etc/inittab** unless you modify the symbolic links in the corresponding /etc/rc?.d directory to differentiate what will be running in the modified run state.

### How to use run levels on Linux

To recap, here's a quick Q&A on run levels:

#### How do you tell what run level you are in?

Use the **runlevel** command.

#### How do you see what processes are associated with a particular run level?

Look at the associated run level start directory (e.g., /etc/rc2.d for run level 2).

#### How do you know what the default run level is?

Check **/etc/inittab** if it exists. If not, just ask runlevel. You’re likely already in that run level.

#### How do you change run levels?

Use the **init** command (e.g., init 3) to change it temporarily. Modify or set up /etc/inittab to make a permanent change.

#### Can you change what services run in some particular run level?

Of course — by modifying the symbolic links in the associated /etc/rc?.d directory.

#### What else should you consider?

You should always exercise some caution when changing run levels on a Linux server to ensure that you’re not going to be affecting services that are currently in use or users who are logged in.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3222070/linux/maneuvering-around-run-levels-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.networkworld.com/article/3218728/linux/how-log-rotation-works-with-logrotate.html
[2]:https://www.networkworld.com/article/3219684/linux/half-a-dozen-clever-linux-command-line-tricks.html
[3]:https://www.networkworld.com/article/3219736/linux/how-to-use-the-motd-file-to-get-linux-users-to-pay-attention.html
[4]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[5]:https://www.networkworld.com/article/3222828/home-tech/52-off-299-piece-all-purpose-first-aid-kit-deal-alert.html
[6]:https://www.networkworld.com/article/3222847/mobile/save-a-whopping-100-on-amazon-echo-right-now-by-going-refurbished-deal-alert.html
[7]:https://www.networkworld.com/article/3221348/mobile/35-off-etekcity-smart-plug-2-pack-energy-monitoring-and-alexa-compatible-deal-alert.html
[8]:https://www.networkworld.com/article/3218728/linux/how-log-rotation-works-with-logrotate.html
[9]:https://www.networkworld.com/article/3219684/linux/half-a-dozen-clever-linux-command-line-tricks.html
[10]:https://www.networkworld.com/article/3219736/linux/how-to-use-the-motd-file-to-get-linux-users-to-pay-attention.html
[11]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[12]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[13]:https://www.networkworld.com/article/3222847/mobile/save-a-whopping-100-on-amazon-echo-right-now-by-going-refurbished-deal-alert.html
[14]:https://www.networkworld.com/article/3221348/mobile/35-off-etekcity-smart-plug-2-pack-energy-monitoring-and-alexa-compatible-deal-alert.html
[15]:https://www.flickr.com/photos/endymion120/4824696883/in/photolist-8mkQi2-8vtyRx-8vvYZS-i31xQj-4TXTS2-S7VRNC-azimYK-dW8cYu-Sb5b7S-S7VRES-fpSVvo-61Zpn8-WxFwGi-UKKq3x-q6NSnC-8vsBLr-S3CPxn-qJUrLr-nDnpNu-8d7a6Q-T7mGpN-RE26wj-SeEXRa-5mZ7LG-Vp7t83-fEG5HS-Vp7sU7-6JpNBi-RCuR8P-qLzCL5-6WsfZx-5nU1tF-6ieGFi-3P5xwh-8mnxpo-hBXwSj-i3iCur-9dmrST-6bXk8d-8vtDb4-i2KLwU-5jhfU6-8vwbrN-ShAtNm-XgzXmb-8rad18-VfXm4L-8tQTrh-Vp7tcb-UceVDB
[16]:https://creativecommons.org/licenses/by/2.0/legalcode
