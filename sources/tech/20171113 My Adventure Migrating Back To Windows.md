My Adventure Migrating Back To Windows
======
I have had linux as my primary OS for about a decade now, and primarily use Ubuntu. But with the latest release I have decided to migrate back to an OS I generally dislike, Windows 10.

![Ubuntu On Windows][1] 
I have always been a fan of Linux, with my two favorite distributions being debian and ubuntu. Now as a server OS, linus is perfect and unquestionable, but there has always been problems of varing degree on the desktop.

The most recent set of problems I had made me realise that I dont need to use linux as my desktop os to still be a fan so based on my experience fresh installing Ubutnu 17.10 I have decided to move back to windows.

### What Caused Me to Switch Back?

The problem was, when 17.10 came out I did a fresh install like usual but faced some really strange an new issues.

  * Dell D3100 Dock no longer worked (Including the Work Arounds)
  * Ubuntu kept Freezing (Randomly)
  * Double Clicking Icons on the desktop did nothing
  * Using the HUD to search for programs such as "tweaks" would try installing MATE versions.
  * The GUI felt worse than standard GNOME



Now I did considor going back to using 16.04 or to another distro. But I feel Unity 7 was the most polished desktop environment, and the only other which is as polished and stable is windows 10.

In addition to the above, there were also the inherent set backs from using Linux over Windows. Such as;

  * Most Propriatry Commerical Software is unavailable, E.G Maya, PhotoShop, Microsoft Office (In most cases the alternatives are not on par)
  * Most Games are not ported to Linux, including games from major studios like EA, Rockstar Ect.
  * Drivers for most hardware is a second thought for the manufacturers when it comes to linux.



Before deciding upon windows I did look at other distributions and operatong systems.

While doing so I looked more at the "Microsoft Loves Linux" compaign and came across WSL. Their new developer focused angle was interesting to me, so I gave it a try.

### What I am Looking For in Windows

I use computers mainly for programming, and I use virtual machines, git , ssh and rely heavily on bash for most of what I do. I also occasionally game, watch netflix and some light office work.

In short I am looking to keep my current workflow in Ubuntu and transplant it onto Windows. I also want to take advantage of Windows strong points.

  * All PC Games Written For Windows
  * Native Support for Most Programs
  * Microsoft Office



Now there are caveats with using windows, but I intend to maintain it correctly so I am not worried about the usual windows nasties such as viruses and malware.

### Windows Subsystem For Linux (Bash on Ubuntu on Windows)

Microsoft has worked closely with Canonical to bring Ubuntu to Windows. After quickly setting up and launching the program, you have a very familiar bash interface.

Now I have been looking into the limitations of this, but the only real limitation I hit at the time of writing this article is that it is abstracted away from the hardware. For instance lsblk won't show what partitions you have, because Ubuntu is not being given that information.

But besides accessing low level tools, I found the experience to be quite familiar and nice.

I utilised this within my workflow for the following.

  * Generating SSH Keypair
  * Using Git with Github to manage my repositories
  * SSH into several servers, including passwordless
  * Running MySQL for Local Databases
  * Monitoring System Resources
  * Using VIM for Config Files
  * Running Bash Scripts
  * Running Local Web Server
  * Running PHP, NodeJS



It has proven so far to be quite the formidable tool, and besides being in the Window 10 UI, my workflow feels almost identical to when I was on Ubuntu itself. Although most of my workload can be handled in WSL, i still intend on having virtual machines on had for mote indepth work which may be beyond the scope of wsl.

### No WINE for me

Another major upside I am experiencing is compatibility.Now I rarely used WINE to enable me to use windows software. But on occasion it was needed, and usually was not very good.

#### HeidiSQL

One of the first Programs I installed was HeidiSQL, one of my favourite DB Clients. It does work under wine, but it felt horrid so I ditched it for MySQL Workbench. Having it back in pride of place in windows is like having a trusty old friend back.

#### Gaming / Steam

What is a Windows PC without a little gaming. I installed steam from its website and was greated with all my linux catalogue, plus my windows catalogue which was 5 times bigger and including AAA titles like GTA V. Something I could only dream about in Ubuntu.

Now I had so much hope for SteamOS and still do, but I don't think it will ever make a dent in the gaming market anywhere in the near future. So if you want to game on a pc, you really do need windows.

Something else noted, the driver support was better for ny nvidia graphics card which made some linux native games like TF2 run slightly better.

**Windows will always be superior in gaming, so this was not much of a surprise**

### Running From a USB HDD and WHY

I run linux on my main sss drives, but have in the past run from usb keys and usb hard drives. I got used to this durability of linux which allowed me to try out multiple versiobs long term without loosing my main os. Now the last time i tried installing windows to a usb connected hdd it just did not work and was impossoble, so when I did a clone of my Windows HDD as a backup, I was surprised when I could boot from it over USB.

This has become a handy option for me as I plan to migrate my work laptop back to windows, but did not want to be risky and just throw it on there.

So for the past few days I have ran it from the USB, and apart from a few buggy messages, I have had no real downside from running it over USB.

The notable issues doing this is:

  * Slower Boot Speed
  * Annoying Don't Unplug Your USB message
  * Not been able to get it to Activate



**I might do an article just on Windows on a USB Drive so we can go into more detail.**

### So what is the verdict?

I have been using windows 10 for about two weeks now, and have not noticed any negative effect to my work flow. All the tools I need are on hand and the OS is generally behaving, although there have been some minor hiccups along the way.

## Will I stay with windows

Although it's early days, I think I will be sticking with windows the the forseable future.

--------------------------------------------------------------------------------

via: https://www.chris-shaw.com/blog/my-adventure-migrating-back-to-windows

作者：[Christopher Shaw][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.chris-shaw.com
[1]:https://winaero.com/blog/wp-content/uploads/2016/07/Ubutntu-on-Windows-10-logo-banner.jpg
