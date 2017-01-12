How to change the Linux I/O scheduler to fit your needs
============================================================

In order to eek out as much performance from Linux servers as possible, learn how to change your I/O scheduler to meet your needs.


 ![](http://tr1.cbsistatic.com/hub/i/r/2016/05/04/f765c3c7-ee08-4f3a-876a-66137ad4e6df/resize/770x/131c6931386ecf37104e8ada8d01e903/hackershero.jpg) 


The Linux I/O scheduler controls the way the kernel commits read and writes to disk. Since the 2.6 kernel, administrators have been able to change the scheduler, so they can customize their platforms to perfectly suit their needs.

There are three schedulers to choose from, and each one has its benefits. Those schedulers are:

*   **CFQ (cfq):** the default scheduler for many Linux distributions; it places synchronous requests, submitted by processes, into a number of per-process queues and then allocates timeslices for each of the queues to access the disk.
*   **Noop scheduler (noop):** the simplest I/O scheduler for the Linux kernel based on the First In First Out (FIFO) queue concept. This scheduler is best suited for SSDs.
*   **Deadline scheduler (deadline):** attempts to guarantee a start service time for a request.


When you want to squeeze the most performance out of your Linux-powered machines, this might be one of the areas you turn. Fortunately, it is quite simple to change the scheduler that powers I/O. Let me show you how.

### Finding out which scheduler you have

The first thing you need to do is find out which scheduler is handling I/O on your system. This is done from the command line, and you must know the name of your disk. For simplicity sake, I'll assume the disk is question is sda. With that information in hand, open a terminal window and issue the following command:

```
cat /sys/block/sda/queue/scheduler
```

The results of the command will display the current running scheduler (**Figure A**).

**Figure A**

 ![Figure A](http://tr3.cbsistatic.com/hub/i/2017/01/03/abba7f22-3252-4b76-91c0-bb15630fd42c/6b4a6d971202b70926b2d991e6c9afe3/schedulera.jpg) 

Elementary OS Loki running the noop scheduler.

### Changing your scheduler

You can change your scheduler in two ways: on the fly or persistently. If you change the scheduler on the fly, it can revert to the default scheduler (after a reboot). You might want to do an on the fly change first, to see which scheduler brings about the best performance for your needs.

Say you want to change to the noop scheduler on the fly. To do this, you would issue the following command:

```
sudo echo noop > /sys/block/hda/queue/scheduler
```

You can change _noop_ to _cfq_, or _deadline_.

This change can be done without having to reboot your machine. Once changed, the I/O scheduler will switch and (hopefully) you'll see a performance increase (again, depending upon your needs).

If you want to change the scheduler to be persistent, you must do this within the GRUB configuration file. To do that, issue the command sudo nano /etc/default/grub and then change the line:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

to

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash elevator=noop"
```

Again, you can change noop to whatever scheduler you need. If you make this change after you do an on the fly change, you won't have to do a reboot to have the new scheduler take effect.

That's all there is to it.

### Choose wisely

You should do research to find out what scheduler is best suited for your particular situation. To find out more about each scheduler, check out these Wiki pages: [CFS][7], [Noop][8], and [Deadline][9].


--------------------------------------------------------------------------------

via: http://www.techrepublic.com/article/how-to-change-the-linux-io-scheduler-to-fit-your-needs/

作者：[Jack Wallen ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.techrepublic.com/meet-the-team/us/jack-wallen/
[1]:http://www.techrepublic.com/article/why-the-earliest-open-source-licenses-are-still-the-most-relevant/
[2]:http://www.techrepublic.com/article/raspberry-pi-in-2017-new-boards-new-oses-and-more/
[3]:http://www.techrepublic.com/article/open-source-predictions-for-2017/
[4]:http://www.techrepublic.com/newsletters/
[5]:http://www.techrepublic.com/article/how-to-change-the-linux-io-scheduler-to-fit-your-needs/#postComments
[6]:http://www.techrepublic.com/article/open-source-predictions-for-2017/
[7]:https://en.wikipedia.org/wiki/Completely_Fair_Scheduler
[8]:https://en.wikipedia.org/wiki/Noop_scheduler
[9]:https://en.wikipedia.org/wiki/Deadline_scheduler
[10]:http://intent.cbsi.com/redir?tag=medc-content-top-leaderboard&siteId=11&rsid=cbsitechrepublicsite&pagetype=article&sl=en&sc=us&topicguid=0aed1ce4-8606-11e2-a661-024c619f5c3d&assetguid=b1120b55-9a41-4a43-b0c6-23f7beb58c5b&assettype=content_article&ftag_cd=LGN3588bd2&devicetype=desktop&viewguid=d21156e0-d86f-11e6-85ae-35117859b3ea&q=&ctype=docids;promo&cval=33159110;7205&ttag=&ursuid=&bhid=&destUrl=http%3A%2F%2Fwww.techrepublic.com%2Fresource-library%2Fwhitepapers%2Fthe-web-developer-bootcamp%2F%3Fpromo%3D7205%26ftag%3DLGN3588bd2%26cval%3Dcontent-top-leaderboard
[11]:http://intent.cbsi.com/redir?tag=medc-content-top-leaderboard&siteId=11&rsid=cbsitechrepublicsite&pagetype=article&sl=en&sc=us&topicguid=0aed1ce4-8606-11e2-a661-024c619f5c3d&assetguid=b1120b55-9a41-4a43-b0c6-23f7beb58c5b&assettype=content_article&ftag_cd=LGN3588bd2&devicetype=desktop&viewguid=d21156e0-d86f-11e6-85ae-35117859b3ea&q=&ctype=docids;promo&cval=33159110;7205&ttag=&ursuid=&bhid=&destUrl=http%3A%2F%2Fwww.techrepublic.com%2Fresource-library%2Fwhitepapers%2Fthe-web-developer-bootcamp%2F%3Fpromo%3D7205%26ftag%3DLGN3588bd2%26cval%3Dcontent-top-leaderboard
[12]:http://www.techrepublic.com/rssfeeds/topic/data-centers/
[13]:http://www.techrepublic.com/meet-the-team/us/jack-wallen/
[14]:https://twitter.com/intent/user?screen_name=jlwallen
