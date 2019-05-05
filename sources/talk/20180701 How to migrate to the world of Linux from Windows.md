How to migrate to the world of Linux from Windows
======
Installing Linux on a computer, once you know what you’re doing, really isn’t a difficult process. After getting accustomed to the ins and outs of downloading ISO images, creating bootable media, and installing your distribution (henceforth referred to as distro) of choice, you can convert a computer to Linux in no time at all. In fact, the time it takes to install Linux and get it updated with all the latest patches is so short that enthusiasts do the process over and over again to try out different distros; this process is called distro hopping.

With this guide, I want to target people who have never used Linux before. I’ll give an overview of some distros that are great for beginners, how to write or burn them to media, and how to install them. I’ll show you the installation process of Linux Mint, but the process is similar if you choose Ubuntu. For a distro such as Fedora, however, your experience will deviate quite a bit from what’s shown in this post. I’ll also touch on the sort of software available, and how to install additional software.

The command line will not be covered; despite what some people say, using the command line really is optional in distributions such as Linux Mint, which is aimed at beginners. Most distros come with update managers, software managers, and file managers with graphical interfaces, which largely do away with the need for a command line. Don’t get me wrong, the command line can be great – I do use it myself from time to time – but largely for convenience purposes.

This guide will also not touch on troubleshooting or dual booting. While Linux does generally support new hardware, there’s a slight chance that any cutting edge hardware you have might not yet be supported by Linux. Setting up a dual boot system is easy enough, though wiping the disk and doing a clean install is usually my preferred method. For this reason, if you intend to follow the guide, either use a virtual machine to install Linux or use a spare computer that you’ve got lying around.

The chief appeal for most Linux users is the customisability and the diverse array of Linux distributions or distros that are available. For the majority of people getting into Linux, the usual entry point is Ubuntu, which is backed by Canonical. Ubuntu was my gateway Linux distribution in 2008; although not my favourite, it’s certainly easy to begin using and is very polished.

Another beginner-friendly distribution is Linux Mint. It’s the distribution I use day-to-day on every one of my machines. It’s very easy to start using, is generally very stable, and the user interface (UI) doesn’t drastically change; anyone familiar with Windows XP or Windows Vista will be familiar with the the UI of Linux Mint. While everyone went chasing the convergence dream of merging mobile and desktop together, Linux Mint stayed staunchly of the position that an operating system on the desktop should be designed for desktop and therefore totally avoids being mobile-friendly UI; desktop and laptops are front and centre.

For your first dive into Linux, I highly recommend the two mentioned above, simply because they’ve got huge communities and developers tending to them around the clock. With that said, several other operating systems such as elementary OS (based on Ubuntu) and Fedora (run by Red Hat) are also good ways to get started. Other users are fond of options such as Manjaro and Antergos which make the difficult-to-configure Arch Linux easy to use.

Now, we’re starting to get our hands dirty. For this guide, I will include screenshots of Linux Mint 18.3 Cinnamon edition. If you decide to go with Ubuntu or another version of Linux Mint, note that things may look slightly different. For example, when it comes to a distro that isn’t based on Ubuntu – like Fedora or Manjaro – things will look significantly different during installation, but not so much that you won’t be able to work the process out.

In order to download Linux Mint, head on over to the Linux Mint downloads page and select either the 32-bit version or 64-bit version of the Cinnamon edition. If you aren’t sure which version is needed for your computer, pick the 64-bit version; this tends to work on computers even from 2007, so it’s a safe bet. The only time I’d advise the 32-bit version is if you’re planning to install Linux on a netbook.

Once you’ve selected your version, you can either download the ISO image via one of the many mirrors, or as a torrent. It’s best to download it as a torrent because if your internet cuts out, you won’t have to restart the 1.9 GB download. Additionally, the downloaded ISO you receive via torrent will be signed with the correct keys, ensuring authenticity. If you download another distribution, you’ll be able to continue to the next step once you have an ISO file saved to your computer.

Note: If you’re using a virtual machine, you don’t need to write or burn the ISO to USB or DVD, just use the ISO to launch the distro on your chosen virtual machine.

Ten years ago when I started using Linux, you could fit an entire distribution onto a CD. Nowadays, you’ll need a DVD or a USB to boot the distro from.

To write the ISO to a USB device, I recommend downloading a tool called Rufus. Once it’s downloaded and installed, you should insert a USB stick that’s 4GB or more. Be sure to backup the data as the device will be erased.

Next, launch Rufus and select the device you want to write to;﻿ if you aren’t sure which is your USB device, unplug it, check the list, then plug it back in to work out which device you need to write to. Once you’ve worked out which USB drive you want to write to, select ‘MBR Partition Scheme for BIOS or UEFI’ under ‘Partition scheme and target system type’. Once you’ve done that, press the optical drive icon alongside the enabled ‘Create a bootable disk using’ field. You can then navigate to the ISO file that you just downloaded. Once it finishes writing to the USB, you’ve got everything you need to boot into Linux.

Note: If you’re using a virtual machine, you don’t need to write or burn the ISO to USB or DVD, just use the ISO to launch the distro on your chosen virtual machine.

If you’re on Windows 7 or above and want to burn the ISO to a DVD, simply insert a blank DVD into the computer, then right-click the ISO file and select ‘Burn disc image’, from the dialogue window which appears, select the drive where the DVD is located, and tick ‘Verify disc after burning’, then hit Burn.

If you’re on Windows Vista, XP, or lower, download an install Infra Recorder and insert your blank DVD into your computer, selecting ‘Do nothing’ or ‘Cancel’ if any autorun windows pop up. Next, open Infra Recorder and select ‘Write Image’ on the main screen or go to Actions > Burn Image. From there find the Linux ISO you want to burn and press ‘OK’ when prompted.

Once you’ve got your DVD or USB media ready you’re ready to boot into Linux; doing so won’t harm your Windows install in any way.

Once you’ve got your installation media on hand, you’re ready to boot into the live environment. The operating system will load entirely from your DVD or USB device without making changes to your hard drive, meaning Windows will be left intact. The live environment is used to see whether your graphics card, wireless devices, and so on are compatible with Linux before you install it.

To boot into the live environment you’re going to have to switch off the computer and boot it back up with your installation media already inserted into the computer. It’s also a must to ensure that your boot up sequence is set to launch from USB or DVD before your current operating system boots up from the hard drive. Configuring the boot sequence is beyond the scope of this guide, but if you can’t boot from the USB or DVD, I recommend doing a web search for how to access the BIOS to change the boot sequence order on your specific motherboard. Common keys to enter the BIOS or select the drive to boot from are F2, F10, and F11.

If your boot up sequence is configured correctly, you should see a ten second countdown, that when completed, will automatically boot Linux Mint.

![][1]

![][2]

Those who opted to try Linux Mint can let the countdown run to zero and the boot up will commence normally. On Ubuntu you’ll probably be prompted to choose a language, then press ‘Try Ubuntu without installing’, or the equivalent option on Linux Mint if you interrupted the automatic countdown by pressing the keyboard. If at any time you have the choice between trying or installing your Linux distribution of choice, always opt to try it, as the install option can cause irreversible damage to your Windows installation.

Hopefully, everything went according to plan, and you’ve made it through to the live environment. The first thing to do now is to check to see whether your Wi-Fi is available. To connect to Wi-Fi press the icon to the left of the clock, where you should see the usual list of available networks; if this is the case, great! If not, don’t despair just yet. In the second case, when wireless card doesn’t seem to be working, either establish a wired connection via Ethernet or connect your phone to the computer – provided your handset supports tethering (via Wi-Fi, not data).

Once you’ve got some sort of internet connection via one of those methods, press ‘Menu’ and use the search box to look for ‘Driver Manager’. This usually requires an internet connection and may let you enable your wireless card driver. If that doesn’t work, you’re probably out of luck, but the vast majority of cards should work with Linux Mint.

For those who have a fancy graphics card, chances are that Linux is using an open source driver alternative instead of the proprietary driver you use on Windows. If you notice any issues pertaining to graphics, you can check the Driver Manager and see whether any proprietary drivers are available.

Once those two critical components are confirmed to be up and running, you may want to check printer and webcam compatibility. To test your printer, go to ‘Menu’ > ‘Office’ > ‘LibreOffice Writer’ and try printing a document.﻿ If it works, that’s great, if not, some printers may be made to work with some effort, but that’s outside the scope of this particular guide. I’d recommend searching something like ‘Linux [your printer model]’ and there may be solutions available. As for your webcam, go to ‘Menu’ again and use the search box to look for ‘Software Manager’; this is the Microsoft Store equivalent on Linux Mint. S﻿earch for a program named ‘Cheese’ and install it. Once installed,﻿ open it up using the ‘Launch’ button in Software Manager, or have a look in ‘Menu’ and find it manually. If it detects a webcam it means it’s compatible!

![][3]

By now, you’ve probably had a good look at Linux Mint or your distribution of choice and, hopefully, everything is working for you. If you’ve had enough and want to return to Windows, simply press Menu and then the power off button which is located right above ‘Menu’, then press ‘Shut Down’ if a dialogue box pops up.

Given that you’re sticking with me and want to install Linux Mint on your computer, thus erasing Windows, ensure that you’ve backed up everything on your computer. Dual boot installations are available from the installer, but in this guide I’ll explain how to install Linux as the sole operating system. Assuming you do decide to deviate and set up a dual boot system, then ensure you still back up your files from Windows first, because things could potentially go wrong for you.

In order to do a clean install, close down any programs that you’ve got running in the live environment. On the desktop, you should see a disc icon labelled ‘Install Linux Mint’ – click that to continue.

![][4]

On the first screen of the installer, choose your language and press continue.

![][5]

On the second screen, most users will want to install third-party software to ensure hardware and codecs work.

![][6]

In the ‘Installation type’ section you can choose to erase your hard drive or dual boot. You can encrypt the entire drive if you check ‘Encrypt the new Linux Mint installation for security’ and ‘Use LVM with the new Linux Mint installation’. You can press ‘Something else’ for a specific custom set up. In order to set up a dual boot system, the hard drive which you’re installing to must already have Windows installed first.

![][7]

Now pick your location so that the operating system’s time can be set correctly, and press continue.

![][8]

Now set your keyboard’s language, and press continue.

![][9]

On the ‘Who are you’ screen, you’ll create a new user. Pop in your name, leave the computer’s name as default or enter a custom name, pick a username, and enter a password. You can choose to have the system log you in automatically or require a password. If you choose to require a password then you can also encrypt your home folder, which is different from encrypting your entire system. However, if you encrypt your entire system, there’s not a lot of point to encrypting your home folder too.

![][10]

Once you’ve completed the ‘Who are you’ screen, Linux Mint will begin installing. You’ll see a slideshow detailing what the operating system offers.

![][11]

Once the installation finishes, you’ll be prompted to restart. Go ahead and do so.

Now that you’ve restarted the computer and removed the Linux media, your computer should boot up straight to your new install. If everything has gone smoothly, you should arrive at the login screen where you just need to enter the password you created during the set up.

![][12]

Once you reach the desktop, the first thing you’ll want to do is apply all the system updates that are available. On Linux Mint you should see a shield icon with a blue logo in the bottom right-hand corner of the desktop near the clock, click on it to open the Update Manager.

![][13]

You should be prompted to pick an update policy, give them all a read over and apply whichever you think is most appropriate for you then press ‘OK’.

![][14]

![][15]

You’ll probably be asked to pick a more local mirror too. This is optional, but could allow your updates to download quicker. Now, apply any updates offered, until the shield icon has a green tick indicating that all updates have been applied. In future, the Update Manager will continually check for new updates and alert you to them.

You’ve got all the necessary tasks out the way for setting up Linux Mint and now you’re free to start using the system for whatever you like. By default, Mozilla Firefox is installed, so if you’ve got a Sync account it’s probably a good idea to go pull in all your passwords and bookmarks. If you’re a Chrome user, you can either run Chromium which is in the Software Manager, or download Google Chrome from the internet. If you opt to get Chrome, you’ll be offered a .deb file which you should save to your system and then double-click to install. Installing .deb files is straightforward enough, just press ‘Install’ when prompted and the system will handle the rest, you’ll find the new software in ‘Menu’.

![][16]

Other pre-installed software includes LibreOffice which has decent compatibility with Microsoft Office; Mozilla’s Thunderbird for managing your emails; GIMP for editing images; Transmission is readily available for you to begin torrenting files, it supports adding IP block lists too; Pidgin and Hexchat will allow you to send instant messages and connect to IRC respectively. As for media playback, you will find VLC and Rhythmbox under ‘Sound and Video’ to satisfy all your music and video needs. If you need any other software, check out the Software Manager, there are lots of popular packages including Skype, Minecraft, Google Earth, Steam, and Private Internet Access Manager.

Throughout this guide, I’ve explained that it will not touch on troubleshooting problems. However, the Linux Mint community can help you overcome any complications. The first port of call is definitely a quick web search, as most problems have been resolved by others in the past and you might be able to find your solution online. If you’re still stuck, you can try the Linux Mint forums as well as the Linux Mint subreddit, both of which are oriented towards troubleshooting.

Linux definitely isn’t for everyone. It still lacks on the gaming front, despite the existence of Steam on Linux, and the growing number of games. In addition, some commonly used software isn’t available on Linux, but usually there are alternatives available. If, however, you have a computer lying around that isn’t powerful enough to support Windows any more, then Linux could be a good option for you. Linux is also free to use, so it’s great for those who don’t want to spend money on a new copy of Windows too.

loading...

--------------------------------------------------------------------------------

via: http://infosurhoy.com/cocoon/saii/xhtml/en_GB/technology/how-to-migrate-to-the-world-of-linux-from-windows/

作者：[Marta Subat][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://infosurhoy.com/cocoon/saii/xhtml/en_GB/author/marta-subat/
[1]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139198_autoboot_linux_mint.jpg
[2]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139206_bootmenu_linux_mint.jpg
[3]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139213_cheese_linux_mint.jpg
[4]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139254_install_1_linux_mint.jpg
[5]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139261_install_2_linux_mint.jpg
[6]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139270_install_3_linux_mint.jpg
[7]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139278_install_4_linux_mint.jpg
[8]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139285_install_5_linux_mint.jpg
[9]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139293_install_6_linux_mint.jpg
[10]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139302_install_7_linux_mint.jpg
[11]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139317_install_8_linux_mint.jpg
[12]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139224_first_boot_1_linux_mint.jpg
[13]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139232_first_boot_2_linux_mint.jpg
[14]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139240_first_boot_3_linux_mint.jpg
[15]:https://cdn.neow.in/news/images/uploaded/2018/02/1519139248_first_boot_4_linux_mint.jpg
[16]:https://cdn.neow.in/news/images/uploaded/2018/02/1519219725_software_1_linux_mint.jpg
