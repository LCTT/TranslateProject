[#]: subject: "Restarting and Offline Updates"
[#]: via: "https://fedoramagazine.org/offline-updates-and-fedora-35/"
[#]: author: "Kevin Degeling https://fedoramagazine.org/author/eonfge/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Restarting and Offline Updates
======

![][1]

A recurring question that goes around the internet is why Fedora Linux has to restart for updates. The truth is, Linux technically doesn’t need to restart for updates. But there is more than meets the eye. In this short guide we’ll look into why Fedora Linux asks you to restart for offline updates.

### Offline Updates

The process of restarting, applying updates, and then restarting again is called Offline Updates. Your computer boots into a special save-mode, where all other systems are disabled and where network access is unavailable. It then applies the updates and restarts.

#### Why Offline Updates exist

Offline Updates is there to protect you. Computers have become way more complex in the past twenty years. Back in the day, it was possible to apply updates without too much worry since the system itself was smaller and less interconnected. Multitasking was also in its infancy, so users were not actually using the computer and updating it at the same time.

The Linux Kernel can change files without restarting, but the services or application using that file don’t have the same luxury. If a file being used by an application changes while the application is running then the application won’t know about the change. This can cause the application to no longer work the same way. As such, the adage that “Linux doesn’t need to restart to update” is a discredited meme. All Linux distributions should restart.

#### How Offline Updates work

For Offline Updates to work, there are a few components collaborating under the hood. First, there is the package manager that downloads updates and then stores them. It won’t actually apply the updates directly, but it will tell the next system that there are updates to be applied.

The second part is done by _systemd_. When _systemd_ starts, it will see if the package manager has prepared any updates. If that’s the case, then _systemd_ won’t go into a full system start-up, but will instead start the package manager and apply the updates. Once the updates are completed _systemd_ will then restart the machine a final time.

![][2]

_Software update pending for Firefox. See how the Flatpak version of Firefox does not need to restart since Flatpaks are designed with reliability in mind._

#### Where Offline Updates comes from

This problem was first realized in 2009 and the [early whiteboard discussions][3] are still visible. Once a possible solution was designed, it was put in development.

Still, it required multiple components to work together. Changes had to be made to _systemd_ to [support this special start-up flow][4] and package managers had to understand the process as well. After that, it was important for users to have a supporting UI, which was included with [GNOME Software Center in 2012][5] and with [KDE Discover in 2021][6].

![][7]

_[Fedora 18 official artwork][8]. Very wild, but also very reliable._

Finally, the feature was [officially deployed in Fedora 18][9], making Fedora Linux the first distribution that does everything it can to ensure that your system is reliable and stable. It was a long road, but this functionality has now been with us for almost 10 years.

### Doing live updates

Now that you’ve been told about Offline Updates and their importance, you’ll of course never do them again… but what if you do? Fedora Linux will not stop you and since we’ve all used DNF at some point, it might be good to talk about live updates as well.

#### Nothing bad happens

First, there is a good chance that nothing bad happens. Perhaps it’s just a minor update, or the application that it affects is not running at the moment. There will be little issue updating SDL for example, when you’re not running a game.

Do keep in mind that running systems may still have the exploits that a previous version of the program might contain. If you update an application without restarting the application, then you’re still running the old version with its vulnerabilities.

Many expert Linux users, like those who professionally maintain servers, will often instinctively know what application can be updated without any risk. For this specific purpose, you can also only install security-updates, which is [discussed in another article][10]. For larger updates, even professionals are encouraged to use _[dnf offline-upgrades][11]_ through the terminal.

#### Firefox restart required

The most common sign of instability is Firefox warning you. When Firefox detects updated packages, it will force you to restart the browser. Firefox can’t reliably run without completely restarting and it will therefor force you to restart.

This also highlights a happy recovery: A complex and security-critical application like Firefox will help you, shielding you from potential crashes or vulnerabilities. While many might consider this a big nuisance, it could be far worse.

![][12]

_Demonstrated with Ubuntu 20.04.3 in GNOME Boxes. I tried to trigger this error using Fedora Linux 34 &amp; 35, but in both cases it completely crashed Firefox. Just to drive the point home: this recovery scenario is a fluke._

#### Crashes

Not every application can recover so gracefully, though, since most will just crash. Firefox might also still crash. While many of you will be familiar with Firefox gracefully terminating, this is still an exception to the rule.

If the system in question is the X Window Server, or the GNOME Shell, then your screen might turn completely black. In many cases, you’ll still be able to complete the updates, but there is no way to know that for sure. Now, the best course of action is to switch to a terminal view.

You can use Ctrl‑Alt‑F3 to enter a text-only instance of Fedora Linux. Once you log-in here, you can use a terminal application like _top_ to see if the update has completed. You might then shut-down all processes and restart the computer.

![][13]

_In top you can filter for certain processes by pressing ‘O’ and then typing a filter like ‘COMMAND=dnf’_

#### Blackouts

At this point, there is still hope. Start your computer and see if the system comes back to life. If the system boots into a graphical environment, everything will likely be fine. If not, you’ll have to enter the text-only interface (TTY) and you should look at the history of DNF and see what happened underneath the hood.

```

    $ dnf history list
    $ dnf history info {LAST ITEM}
    $ dnf history redo {LAST ITEM}

```

Additional information can be found in the [DNF Documentation][14]. There is no guarantee that repeating the last update-action won’t cause the same problems, but it’s the best you can try at this point. Removing third-party drivers (like those from Nvidia) might also help, as this is a known to cause updating-related issues.

#### System bricking

Finally, you can hard brick your system. If the system that crashes happens to be DNF or _systemd_, then it might not be possible for the system to continue its update process. When this happens, even restarting the machine will not be enough to restore it.

There is no one answer about what to do now. First, you should get a USB-Stick with Fedora Linux. You could then try to recover the system using _systemd-nspawn_ but that is highly technical. Regular users might just as well reinstall Fedora Linux and start from scratch.

Keep in mind that all your files are still safe. Booting from a USB Stick will not damage them, and if you make sure that you don’t overwrite your existing /home partition, then all your personal data will still be there afterwards.

### Closing words

Direct updates are a roll of the dice, and while you might get lucky a lot…. We tend to overestimate ourselves and the chances we have. Many of you have never experienced a system bricking, but on the whole those stories are very common on social media. As such, it’s important to spread the word. Encourage others to restart their computer to apply offline updates, and be careful yourself when you apply updates directly.

In the future, problems like these might go away entirely. Systems like [Flatpak][15] and [Fedora Silverblue][16] have technologies that make these kinds of crashes nigh impossible, and the Linux Desktop is slowly moving into that direction. The future is bright, but for the time being we should make do with a progress bar, just like some other operating systems.

![][17]

_Got any personal update-related horror stories? Feel free to share them in the comments. I would also like to point out that I like memes just as much as the next guy… but they should be jokes, not technical advice._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/offline-updates-and-fedora-35/

作者：[Kevin Degeling][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/eonfge/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/01/offline-updates-explained_s-816x345.png
[2]: https://fedoramagazine.org/wp-content/uploads/2022/01/Screenshot-from-2022-01-09-16-39-09-1024x697.png
[3]: https://fedoraproject.org/wiki/Desktop/Whiteboards/UpdateExperience
[4]: https://www.freedesktop.org/wiki/Software/systemd/SystemUpdates/
[5]: https://blogs.gnome.org/hughsie/2012/06/04/offline-os-updates-looking-forward-to-gnome-3-6/
[6]: https://blog.neon.kde.org/2021/03/01/offline-updates-are-coming/
[7]: https://fedoramagazine.org/wp-content/uploads/2022/01/banners_cow2-1024x537.png
[8]: https://fedoraproject.org/wiki/F18_Artwork
[9]: https://fedoraproject.org/wiki/Features/OfflineSystemUpdates
[10]: https://fedoramagazine.org/how-to-install-only-security-and-bugfixes-updates-with-dnf/
[11]: https://dnf-plugins-extras.readthedocs.io/en/latest/system-upgrade.html
[12]: https://fedoramagazine.org/wp-content/uploads/2022/01/Screenshot-from-2022-01-11-21-23-52-1024x632.png
[13]: https://fedoramagazine.org/wp-content/uploads/2022/01/Screenshot-from-2022-01-09-17-24-03.png
[14]: https://dnf.readthedocs.io/en/latest/command_ref.html
[15]: https://www.flatpak.org/
[16]: https://silverblue.fedoraproject.org/
[17]: https://fedoramagazine.org/wp-content/uploads/2022/01/Screenshot-from-2022-01-09-17-37-45-1024x697.png
