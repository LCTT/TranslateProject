[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My open source disaster recovery strategy for the home office)
[#]: via: (https://opensource.com/article/21/2/high-availability-home-office)
[#]: author: (Howard Fosdick https://opensource.com/users/howtech)

My open source disaster recovery strategy for the home office
======
In the remote work era, it's more important than ever to have a disaster
recovery plan for your household infrastructure.
![Person using a laptop][1]

I've worked from home for years, and with the COVID-19 crisis, millions more have joined me. Teachers, accountants, librarians, stockbrokers… you name it, these workers now operate full or part time from their homes. Even after the coronavirus crisis ends, many will continue working at home, at least part time. But what happens when the home worker's computer fails? Whether the device is a smartphone, tablet, laptop, or desktop—and whether the problem is hardware or software—the result might be missed workdays and lots of frustration.

This article explores how to ensure high-availability home computing. Open source software is key. It offers device independence so that home workers can easily move between primary and backup devices. Most importantly, it gives users control of their environment, which is the surest route to high availability. This simple high-availability strategy, based on open source, is easy to modify for your needs.

### Different strategies for different situations

I need to emphasize one point upfront: different job functions require different solutions. Some at-home workers can use smartphones or tablets, while others rely on laptops, and still others require high-powered desktop workstations. Some can tolerate an outage of hours or even days, while others must be available without interruption. Some use company-supplied devices, and others must provide their own. Lastly, some home workers store their data in their company's cloud, while others self-manage their data.

Obviously, no single high-availability strategy fits everyone. My strategy probably isn't "the answer" for you, but I hope it prompts you to think about the challenges involved (if you haven't already) and presents some ideas to help you prepare before disaster strikes.

### Defining high availability

Whatever computing device a home worker uses, high availability (HA) involves five interoperable components:

  * Device hardware
  * System software
  * Communications capability
  * Applications
  * Data



The HA plan must encompass all five components to succeed. Missing any component causes HA failure.

For example, last night, I worked on a cloud-based spreadsheet. If my communications link had failed and I couldn't access my cloud data, that would stop my work on the project… even if I had all the other HA components available in a backup computer.

Of course, there are exceptions. Say last night's spreadsheet was stored on my local computer. If that device failed, I could have kept working as long as I had a backup computer with my data on it, even if I lacked internet access.

To succeed as a high-availability home worker, you must first identify the components you require for your work. Once you've done that, develop a plan to continue working even if one or more components fails.

#### Duplicate replacement

One approach is to create a _duplicate replacement_. Having the exact same hardware, software, communications, apps, and data available on a backup device guarantees that you can work if your primary fails. This approach is simple, though it might cost more to keep a complete backup on hand.

To economize, you might share computers with your family or flatmates. A _shared backup_ is always more cost-effective than a _dedicated backup_, so long as you have top priority on the shared computer when you need it.

#### Functional replacement

The alternative to duplicate replacement is a _functional replacement_. You substitute a working equivalent for the failed component. Say I'm working from my home laptop and connecting through home WiFi. My internet connection fails. Perhaps I can tether my computer to my phone and use the cell network instead. I achieve HA by replacing one technology with an equivalent.

#### Know your requirements

Beyond the five HA components, be sure to identify any special requirements you have. For example, if mobility is important, you might need to replace a broken laptop with another laptop, not a desktop.

HA means identifying all the functions you need, then ensuring your HA plan covers them all.

### Timing, planning, and testing

You must also define your time frame for recovery. Must you be able to continue your work immediately after a failure? Or do you have the luxury of some downtime during which you can react?

The longer your allowable downtime, the more options you have. For example, if you could miss work for several days, you could simply trot a broken device into a repair shop. No need for a backup.

In this article, by "high availability," I mean getting back to work in very short order after a failure, perhaps less than one hour. This typically requires that you have access to a backup device that is immediately available and ready to go. While there might be occasions when you can recover your primary device in a matter of minutes—for example, by working around a failure or by quickly replacing a defective piece of hardware or software—a backup computer is normally part of the HA plan.

HA requires planning and preparation. "Winging it" doesn't suffice; ensure your backup plan works by testing it beforehand.

For example, say your data resides in the cloud. That data is accessible from anywhere, from any device. That sounds ideal. But what if you forget that there's a small but vital bit of data stored locally on your failed computer? If you can't access that essential data, your HA plan fails. A dry run surfaces problems like this.

### Smartphones as backup

Most of us in software engineering and support use laptops and desktops at home. Smartphones and tablets are useful adjuncts, but they aren't at the core of what we do.

The main reasons are screen size and keyboard. For software work, you can't achieve the same level of productivity with a small screen and touchscreen keypad as you can with a large monitor and physical keyboard.

If you normally use a laptop or desktop and opt for a smartphone or tablet as your backup, test it out beforehand to make sure it suffices. Here's an example of the kind of subtlety that might otherwise trip you up. Most videoconferencing platforms run on both smartphones and laptops or desktops, but their mobile apps can differ in small but important ways. And even when the platform does offer an equivalent experience (the way [Jitsi][2] does, for instance), it can be awkward to share charts, slide decks, and documents, to use a chat feature, and so on, just due to the difference in mobile form factors compared to a big computer screen and a variety of input options.

Smartphones make convenient backup devices because nearly everyone has one. But if you designate yours as your functional replacement, then try using it for work one day to verify that it meets your needs.

### Data accessibility

Data access is vital when your primary device fails. Even if you back up your work data, if a device fails, you also may need credentials for VPN or SSH access, specialized software, or forms of data that might not be stored along with your day-to-day documents and directories. You must ensure that when you design a backup scheme for yourself, you include all important data and store encryption keys and other access information securely.

The best way to keep your work data secure is to use your own service. Running [Nextcloud][3] or [Sparkleshare][4] is easy, and hosting is cheap. Both are automated: files you place in a specially designated directory are synchronized with your server. It's not exactly building your own cloud, but it's a great way to leverage the cloud for your own services. You can make the backup process seamless with tools like [Syncthing, Bacula][5], or [rdiff-backup][6].

Cloud storage enables you to access data from any device at any location, but cloud storage will work only if you have a live communications path to it after a failure event. And not all cloud storage meets the privacy and security specifications for all projects. If your workplace has a cloud backup solution, spend some time learning about the cloud vendor's services and find out what level of availability it promises. Check its track record in achieving it. And be sure to devise an alternate way to access your cloud if your primary communications link fails.

### Local backups

If you store your data on a local device, you'll be responsible for backing it up and recovering it. In that case, back up your data to an alternate device, and verify that you can restore it within your acceptable time frame. This is your _time-to-recovery_.

You'll also need to secure that data and meet any privacy requirements your employer specifies.

#### Acceptable loss

Consider how much data you can afford to lose in the event of an outage. For example, if you back up your data nightly, you could lose up to a maximum of one day's work (all the work completed during the day prior to the nightly backup). This is your _backup data timeliness_.

Open source offers many free applications for local data backup and recovery. Generally, the same applications used for remote backups can also apply to local backup plans, so take a look at the [Advanced Rsync][7] or the [Syncthing tutorial][8] articles here on Opensource.com.

Many prefer a data strategy that combines both cloud and local storage. Store your data locally, and then use the cloud as a backup (rather than working on the cloud). Or do it the other way around (although automating the cloud to push backups to you is more difficult than automating your local machine to push backups to the cloud). Storing your data in two separate locations gives your data _geographical redundancy_, which is useful should either site become unavailable.

With a little forethought, you can devise a simple plan to access your data regardless of any outage.

### My high-availability strategy

As a practical example, I'll describe my own HA approach. My goals are a time to recovery of an hour or less and backup data timeliness within a day.

![High Availability Strategy][9]

(Howard Fosdick, [CC BY-SA 4.0][10])

#### Hardware

I use an Android smartphone for phone calls and audioconferences. I can access a backup phone from another family member if my primary fails.

Unfortunately, my phone's small size and touch keyboard mean I can't use it as my backup computer. Instead, I rely on a few generic desktop computers that have standard, interchangeable parts. You can easily maintain such hardware with this simple [free how-to guide][11]. You don't need any hardware experience.

Open source software makes my multibox strategy affordable. It runs so efficiently that even [10-year-old computers work fine][12] as backups for typical office work. Mine are dual-core desktops with 4GB of RAM and any disk that cleanly verifies. These are so inexpensive that you can often get them for free from recycling centers. (In my [charity work][13], I find that many people give them away as unsuitable for running current proprietary software, but they're actually in perfect working order given a flexible operating system like Linux.)

Another way to economize is to designate another family member's computer for your shared backups.

#### Systems software and apps

Running open source software on top of this generic hardware enables me to achieve several benefits. First, the flexibility of open source software enables me to address any possible software failure. For example, with simple operating system commands, I can copy, move, back up, and recover the operating system, applications, and data across partitions, disks, or computers. I don't have to worry about software constraints, vendor lock-in, proprietary backup file formats, licensing or activation restrictions, or extra fees.

Another open source benefit is that you control your operating system. If you don't have control over your own system, you could be subject to forced restarts, unexpected and unwanted updates, and forced upgrades. My relative has run into such problems more than once. Without his knowledge or consent, his computer suddenly launched a forced upgrade from Windows 7 to Windows 10, which cost him three days of lost income (and untold frustration). The lesson: Your vendor's agenda may not coincide with your own.

All operating systems have bugs. The difference is that open source software doesn't force you to eat them.

#### Data classification

I use very simple techniques to make my data highly available.

I can't use cloud services for my data due to privacy requirements. Instead, my data "master copy" resides on a USB-connected disk. I plug it into any of several computers. After every session, I back up any altered data on the computer I used.

Of course, this approach is only feasible if your backups run quickly. For most home workers, that's easy. All you have to do is segregate your data by size and how frequently you update it.

Isolate big files like photos, audio, and video into separate folders or partitions. Make sure you back up only the files that are new or modified, not older items that have already been backed up.

Much of my work involves office suites. These generate small files, so I isolate each project in its own folder. For example, I stored the two dozen files I used to write this article in a single subdirectory. Backing it up is as simple as copying that folder.

Giving a little thought to data segregation and backing up only modified files ensures quick, easy backups for most home workers. My approach is simple; it works best if you only work on a couple of projects in a session. And I can tolerate losing up to a day's work. You can easily automate a more refined backup scheme for yourself.

For software development, I take an entirely different approach. I use software versioning, which transparently handles all software backup issues for me and coordinates with other developers. My HA planning in this area focuses just on ensuring I can access the online tool.

#### Communications

Like many home users, I communicate through both a cellphone network and the internet. If my internet goes down, I can use the cell network instead by tethering my laptop to my Android smartphone.

### Learning from failure

Using my strategy for 15 years, how have I fared? What failures have I experienced, and how did they turn out?

  1. **Motherboard burnout:** One day, my computer wouldn't turn on. I simply moved my USB "master data" external disk to another computer and used that. I lost no data. After some investigation, I determined it was a motherboard failure, so I scrapped the computer and used it for parts.
  2. **Drive failure:** An internal disk failed while I was working. I just moved my USB master disk to a backup computer. I lost 10 minutes of data updates. After work, I created a new boot disk by copying one from another computer—flexibility that only open source software offers. I used the affected computer the next day.
  3. **Fatal software update:** An update caused a failure in an important login service. I shifted to a backup computer where I hadn't yet applied the fatal update. I lost no data. After work, I searched for help with this problem and had it solved in an hour.
  4. **Monitor burnout:** My monitor fizzled out. I just swapped in a backup display and kept working. This took 10 minutes. After work, I determined that the problem was a burned-out capacitor, so I recycled the monitor.
  5. **Power outage:** Now, here's a situation I didn't plan for! A tornado took down the electrical power in our entire town for two days. I learned that one should think through _all_ possible contingencies—including alternate work sites.



### Make your plan

If you work from home, you need to consider what will happen when your home computer fails. If not, you could experience frustrating workdays off while you scramble to fix the problem.

Open source software is the key. It runs so efficiently on older, cheaper computers that they become affordable backup machines. It offers device independence, and it ensures that you can design solutions that work best for you.

For most people, ensuring high availability is very simple. The trick is thinking about it in advance. Create a plan _and then test it_.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/high-availability-home-office

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://jitsi.org/downloads/
[3]: https://opensource.com/article/20/7/nextcloud
[4]: https://opensource.com/article/19/4/file-sharing-git
[5]: https://opensource.com/article/19/3/backup-solutions
[6]: https://opensource.com/life/16/3/turn-your-old-raspberry-pi-automatic-backup-server
[7]: https://opensource.com/article/19/5/advanced-rsync
[8]: https://opensource.com/article/18/9/take-control-your-data-syncthing
[9]: https://opensource.com/sites/default/files/uploads/my_ha_strategy.png (High Availability Strategy)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: http://www.rexxinfo.org/Quick_Guide/Quick_Guide_To_Fixing_Computer_Hardware
[12]: https://opensource.com/article/19/7/how-make-old-computer-useful-again
[13]: https://www.freegeekchicago.org/
