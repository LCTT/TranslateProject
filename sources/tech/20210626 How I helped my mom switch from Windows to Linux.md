[#]: subject: (How I helped my mom switch from Windows to Linux)
[#]: via: (https://opensource.com/article/21/6/mom-switch-linux)
[#]: author: (Tomasz https://opensource.com/users/tomaszwaraksa)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How I helped my mom switch from Windows to Linux
======
With Linux, novice users will gain a smooth, polished desktop experience
with a multitude of familiar applications.
![Red Lego Heart][1]

The Large Hadron Collider is [powered by Linux][2]. Laptops on the International Space Station [run on Linux][3]. So do [Instagram][4] and [Nest thermostats][5]. Recently, we watched Ingenuity fly over Mars, an amazing robo-copter driven by… [Linux][6]! It's yet more proof of how flexible and versatile this operating system can be.

But now, the really big news. It's official. Linux can handle Mom and Dad just as well!

### The story

About a year ago, I decided to migrate my mom to Linux. A year has passed, so it's time for retrospection and conclusions.

Like most of us, I'm officially _Mom's Computer Admin_. Mom is a lovely lady in her late 60s—a real sweetheart. Mom's computer skills are basic. Mom's computer needs are basic, too. Read the internets, send email, type text, browse and edit photos, play videos and music, call family and friends on Skype or Signal.

Until last year, she was using a Windows laptop, old but not too bad. Then one day, through deceit, threats, and obnoxious popups, Microsoft finally made her click that dreaded "UPGRADE TO WINDOWS 10" button.

My life as Mom's Computer Admin quickly turned into hell with her desperate calls for help. Why does everything look so different? Where is my app menu? What, this pile of tiles is now my app menu? Why is the computer so slow? Why does it restart daily for updates, just when I need to use it?! Why is something (she meant the hard drive) making noise all the time? What is it actually doing all the time?

And how would I know that without any ability to look into the source code?

I considered rolling back the upgrade. But with Windows 7 reaching end-of-life soon, I feared the worst: Without security updates, Mom's computer would soon become a member of countless bot networks, mining cryptocurrencies, mailing spam, and launching vicious DDOS attacks on the vital infrastructure of entire countries. And I'd be the one to clean this mess—every weekend.

### Linux to the rescue

With nothing to lose, I decided to migrate her to Linux. I made "the move" five years ago and have never been happier. It surely wouldn't do harm to try it with her.

Mom was happy when I declared to fix her problems once and for all. What she didn't know is that she would become the crucial part of a year-long scientific experiment named: "Can Mom survive Linux?"

![Cowsay "Can Mom Survive Linux?"][7]

(Tomasz Waraksa, [CC BY-SA 4.0][8])

And so, one day in February 2020, I arrived from faraway Dublin with a seven-year-old Lenovo Yoga 13, which had similar specs but a much nicer screen and half the weight. After some deliberations and testing various Linux distributions on VirtualBox, I decided on the [Zorin OS][9] distribution, proudly made in Ireland. My choice was driven by the following factors:

  * It's based on Ubuntu Linux, with which I'm most familiar.
  * It closely resembles Windows 7, being carefully designed with Windows refugees in mind.
  * It feels lightweight, simple, and sufficiently conservative for Mom. No shiny macOS Big Sur glitz anywhere around!



![Zorin OS desktop][10]

(Tomasz Waraksa, [CC BY-SA 4.0][8])

### System installation

I installed the operating system my usual way, with the `/home` folder on a dedicated partition to keep Mom's Stuff safe in the unlikely case of system reinstallation. It's my old trick that makes late-night distro-hopping much easier.

During installation, I chose Polish as the user interface (UI) language. Just like me, Mom is Polish to the bone. No worries, Linux seems to support every possible language, including [Klingon][11].

Then, I installed the following applications to cover Mom's needs:

  * Skype
  * [Signal for Desktop][12]
  * Google Chrome browser
  * [Geary][13] email client
  * [gThumb][14] for photo viewing and editing
  * [VLC][15] for playing video and music
  * Softmaker Office for text editing and spreadsheets



Notice how there's no antivirus on the list. Yay!

An hour later, her Zorin OS box was ready and loaded with applications.

![Zorin OS home folder][16]

(Tomasz Waraksa, [CC BY-SA 4.0][8])

### System configuration

I made myself Mom's Computer Admin by doing the following:

  * Created an admin account for myself
  * Turned Mom's account into non-admin
  * Installed the `ssh` daemon for remote unattended access
  * Added the machine to my Hamachi VPN: This way, I can securely connect via `ssh` without opening port 22 on the router. Hamachi is a VPN service by LogMeIn. An old-school VPN, I mean. Intended not for running Netflix from another country but for connecting computers into a secure network over the internet.
  * Enabled Uncomplicated Firewall ( `ufw`) and allowed ssh traffic
  * Installed AnyDesk for logging in to the desktop



With this, I have secure ssh access to Mom's laptop. I can perform periodic maintenance via shell without Mom even noticing anything. That's because Linux normally _does not_ require a reboot after completed updates; what a miracle, how's that even possible?

![Updating software remotely][17]

(Tomasz Waraksa, [CC BY-SA 4.0][8])

### Can Mom survive Linux?

Without the slightest doubt!

When I showed Mom her new PC, she did ask why this new Windows looked different _again_. I had to reveal that this is not Windows at all, but Linux, and explain why we all love Linux. But she picked it up quickly. The classic Zorin OS desktop is very much like her old Windows 7. I watched her find her way through the system and launch her familiar applications with ease.

She immediately noticed how much faster the computer starts and how much better it performs.

She's been asking me when I will do the usual computer cleanup so that it doesn't become slow again. I've explained that, with her average use, it won't be needed. Linux simply doesn't rot on its own as Windows does. So far, this has been true. Her PC runs as smooth and fast as on day one.

Every now and then, I ask how she feels about her new computer. She invariably answers that she's happy with it. Everything works smoothly. The computer doesn't get busy for no reason. No more interrupting her with Very Important Updates. And the menu is where it should always be. She's comfortable with her usual applications in this entirely new environment.

Over the year, I've logged in remotely a few times to run routine package upgrades. I've logged in with AnyDesk twice. Once, when Mom asked whether photos from an inserted SD card could be imported automatically into the `~/Pictures` folder, and preferably into folders named by dates. Yes, `gThumb` can easily be made to do that with a bit of Bash. Another time, I logged in to add frequently used websites as desktop icons.

And this has been all of my effort as Mom's Linux Admin so far! At this pace, I could be Mom's Computer Admin to 50 other moms!

### Summary

I hope that my story will inspire you to think about migrating to Linux. In the past, we considered Linux to be too difficult for casual users. But today I believe that the opposite is true. The less proficient computer users are, the more reasons they have to migrate to Linux!

With Linux, novice users will gain a smooth, polished desktop experience with a multitude of familiar applications. They will be much safer than on any other popular computing platform. And helping them with remote access has never been easier and more secure!

_Disclaimer: This article is not promoting any of the described products, services, or vendors. I don't have any commercial interest nor associations with them. I'm not trying to suggest that these products or services are best for you, nor promising that your experience will be the same._

* * *

_This article originally appeared on [Let's Debug It][18] and is reused with permission._

Sandstorm's Jade Wang shares some of her favorite open source web apps that are self-hosted...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/mom-switch-linux

作者：[Tomasz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomaszwaraksa
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/heart_lego_ccby20.jpg?itok=VRpHf4iU (Red Lego Heart)
[2]: https://www.redhat.com/en/about/press-releases/red-hat-provides-cern-platform-mission-critical-applications
[3]: https://www.extremetech.com/extreme/155392-international-space-station-switches-from-windows-to-linux-for-improved-reliability
[4]: https://instagram-engineering.com/what-powers-instagram-hundreds-of-instances-dozens-of-technologies-adf2e22da2ad
[5]: https://www.theverge.com/2011/11/14/2559567/tony-fadell-nest-learning-thermostat
[6]: https://www.zdnet.com/article/to-infinity-and-beyond-linux-and-open-source-goes-to-mars/
[7]: https://opensource.com/sites/default/files/uploads/intro.png (Cowsay "Can Mom Survive Linux?")
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://zorinos.com/
[10]: https://opensource.com/sites/default/files/uploads/zorin-os-desktop.png (Zorin OS desktop)
[11]: https://blogs.gnome.org/muelli/2010/04/klingon-language-support/
[12]: https://github.com/signalapp
[13]: https://wiki.gnome.org/Apps/Geary
[14]: https://wiki.gnome.org/Apps/Gthumb
[15]: https://www.videolan.org/vlc/
[16]: https://opensource.com/sites/default/files/uploads/zorin-os-home-folder.png (Zorin OS home folder)
[17]: https://opensource.com/sites/default/files/uploads/upgrading-software.png (Updating software remotely)
[18]: https://letsdebug.it/post/16-linux-for-mars-copters-moms-and-pops/
