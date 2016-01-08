A Linux User Using ‘Windows 10′ After More than 8 Years – See Comparison
================================================================================
Windows 10 is the newest member of windows NT family of which general availability was made on July 29, 2015. It is the successor of Windows 8.1. Windows 10 is supported on Intel Architecture 32 bit, AMD64 and ARMv7 processors.

![Windows 10 and Linux Comparison](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-10-vs-Linux.jpg)

Windows 10 and Linux Comparison

As a Linux-user for more than 8 continuous years, I thought to test Windows 10, as it is making a lots of news these days. This article is a breakthrough of my observation. I will be seeing everything from the perspective of a Linux user so you may find it a bit biased towards Linux but with absolutely no false information.

1. I searched Google with the text “download windows 10” and clicked the first link.

![Search Windows 10](http://www.tecmint.com/wp-content/uploads/2015/08/Search-Windows-10.jpg)

Search Windows 10

You may directly go to link : [https://www.microsoft.com/en-us/software-download/windows10ISO][1]

2. I was supposed to select a edition from ‘windows 10‘, ‘windows 10 KN‘, ‘windows 10 N‘ and ‘windows 10 single language‘.

![Select Windows 10 Edition](http://www.tecmint.com/wp-content/uploads/2015/08/Select-Windows-10-Edition.jpg)

Select Windows 10 Edition

For those who want to know details of different editions of Windows 10, here is the brief details of editions.

- Windows 10 – Contains everything offered by Microsoft for this OS.
- Windows 10N – This edition comes without Media-player.
- Windows 10KN – This edition comes without media playing capabilities.
- Windows 10 Single Language – Only one Language Pre-installed.

3. I selected the first option ‘Windows 10‘ and clicked ‘Confirm‘. Then I was supposed to select a product language. I choose ‘English‘.

I was provided with Two Download Links. One for 32-bit and other for 64-bit. I clicked 64-bit, as per my architecture.

![Download Windows 10](http://www.tecmint.com/wp-content/uploads/2015/08/Download-Windows-10.jpg)

Download Windows 10

With my download speed (15Mbps), it took me 3 long hours to download it. Unfortunately there were no torrent file to download the OS, which could otherwise have made the overall process smooth. The OS iso image size is 3.8 GB.

I could not find an image of smaller size but again the truth is there don’t exist net-installer image like things for Windows. Also there is no way to calculate hash value after the iso image has been downloaded.

Wonder why so ignorance from windows on such issues. To verify if the iso is downloaded correctly I need to write the image to a disk or to a USB flash drive and then boot my system and keep my finger crossed till the setup is finished.

Lets start. I made my USB flash drive bootable with the windows 10 iso using dd command, as:

    # dd if=/home/avi/Downloads/Win10_English_x64.iso of=/dev/sdb1 bs=512M; sync

It took a few minutes to complete the process. I then rebooted the system and choose to boot from USB flash Drive in my UEFI (BIOS) settings.

#### System Requirements ####

If you are upgrading

- Upgrade supported only from Windows 7 SP1 or Windows 8.1

If you are fresh Installing

- Processor: 1GHz or faster
- RAM : 1GB and Above(32-bit), 2GB and Above(64-bit)
- HDD: 16GB and Above(32-bit), 20GB and Above(64-bit)
- Graphic card: DirectX 9 or later + WDDM 1.0 Driver

### Installation of Windows 10 ###

1. Windows 10 boots. Yet again they changed the logo. Also no information on whats going on.

![Windows 10 Logo](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-10-Logo.jpg)

Windows 10 Logo

2. Selected Language to install, Time & currency format and keyboard & Input methods before clicking Next.

![Select Language and Time](http://www.tecmint.com/wp-content/uploads/2015/08/Select-Language-and-Time.jpg)

Select Language and Time

3. And then ‘Install Now‘ Menu.

![Install Windows 10](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Windows-10.jpg)

Install Windows 10

4. The next screen is asking for Product key. I clicked ‘skip’.

![Windows 10 Product Key](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-10-Product-Key.jpg)

Windows 10 Product Key

5. Choose from a listed OS. I chose ‘windows 10 pro‘.

![Select Install Operating System](http://www.tecmint.com/wp-content/uploads/2015/08/Select-Install-Operating-System.jpg)

Select Install Operating System

6. oh yes the license agreement. Put a check mark against ‘I accept the license terms‘ and click next.

![Accept License](http://www.tecmint.com/wp-content/uploads/2015/08/Accept-License.jpg)

Accept License

7. Next was to upgrade (to windows 10 from previous versions of windows) and Install Windows. Don’t know why custom: Windows Install only is suggested as advanced by windows. Anyway I chose to Install windows only.

![Select Installation Type](http://www.tecmint.com/wp-content/uploads/2015/08/Select-Installation-Type.jpg)

Select Installation Type

8. Selected the file-system and clicked ‘next’.

![Select Install Drive](http://www.tecmint.com/wp-content/uploads/2015/08/Select-Install-Drive.jpg)

Select Install Drive

9. The installer started to copy files, getting files ready for installation, installing features, installing updates and finishing up. It would be better if the installer would have shown verbose output on the action is it taking.

![Installing Windows](http://www.tecmint.com/wp-content/uploads/2015/08/Installing-Windows.jpg)

Installing Windows

10. And then windows restarted. They said reboot was needed to continue.

![Windows Installation Process](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-Installation-Process.jpg)

Windows Installation Process

11. And then all I got was the below screen which reads “Getting Ready”. It took 5+ minutes at this point. No idea what was going on. No output.

![Windows Getting Ready](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-Getting-Ready.jpg)

Windows Getting Ready

12. yet again, it was time to “Enter Product Key”. I clicked “Do this later” and then used expressed settings.

![Enter Product Key](http://www.tecmint.com/wp-content/uploads/2015/08/Enter-Product-Key.jpg)

Enter Product Key

![Select Express Settings](http://www.tecmint.com/wp-content/uploads/2015/08/Select-Express-Settings.jpg)

Select Express Settings

14. And then three more output screens, where I as a Linuxer expected that the Installer will tell me what it is doing but all in vain.

![Loading Windows](http://www.tecmint.com/wp-content/uploads/2015/08/Loading-Windows.jpg)

Loading Windows

![Getting Updates](http://www.tecmint.com/wp-content/uploads/2015/08/Getting-Updates.jpg)

Getting Updates

![Still Loading Windows](http://www.tecmint.com/wp-content/uploads/2015/08/Still-Loading-Windows.jpg)

Still Loading Windows

15. And then the installer wanted to know who owns this machine “My organization” or I myself. Chose “I own it” and then next.

![Select Organization](http://www.tecmint.com/wp-content/uploads/2015/08/Select-Organization.jpg)

Select Organization

16. Installer prompted me to join “Azure Ad” or “Join a domain”, before I can click ‘continue’. I chooses the later option.

![Connect Windows](http://www.tecmint.com/wp-content/uploads/2015/08/Connect-Windows.jpg)

Connect Windows

17. The Installer wants me to create an account. So I entered user_name and clicked ‘Next‘, I was expecting an error message that I must enter a password.

![Create Account](http://www.tecmint.com/wp-content/uploads/2015/08/Create-Account.jpg)

Create Account

18. To my surprise Windows didn’t even showed warning/notification that I must create password. Such a negligence. Anyway I got my desktop.

![Windows 10 Desktop](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-10-Desktop.jpg)

Windows 10 Desktop

#### Experience of a Linux-user (Myself) till now ####

- No Net-installer Image
- Image size too heavy
- No way to check the integrity of iso downloaded (no hash check)
- The booting and installation remains same as it was in XP, Windows 7 and 8 perhaps.
- As usual no output on what windows Installer is doing – What file copying or what package installing.
- Installation was straight forward and easy as compared to the installation of a Linux distribution.

### Windows 10 Testing ###

19. The default Desktop is clean. It has a recycle bin Icon on the default desktop. Search web directly from the desktop itself. Additionally icons for Task viewing, Internet browsing, folder browsing and Microsoft store is there. As usual notification bar is present on the bottom right to sum up desktop.

![Deskop Shortcut Icons](http://www.tecmint.com/wp-content/uploads/2015/08/Deskop-Shortcut-icons.jpg)

Deskop Shortcut Icons

20. Internet Explorer replaced with Microsoft Edge. Windows 10 has replace the legacy web browser Internet Explorer also known as IE with Edge aka project spartan.

![Microsoft Edge Browser](http://www.tecmint.com/wp-content/uploads/2015/08/Edge-browser.jpg)

Microsoft Edge Browser

It is fast at least as compared to IE (as it seems it testing). Familiar user Interface. The home screen contains news feed updates. There is also a search bar title that reads ‘Where to next?‘. The browser loads time is considerably low which result in improving overall speed and performance. The memory usages of Edge seems normal.

![Windows Performance](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-Performance.jpg)

Windows Performance

Edge has got cortana – Intelligent Personal Assistant, Support for chrome-extension, web Note – Take notes while Browsing, Share – Right from the tab without opening any other TAB.

#### Experience of a Linux-user (Myself) on this point ####

21. Microsoft has really improved web browsing. Lets see how stable and fine it remains. It don’t lag as of now.

22. Though RAM usages by Edge was fine for me, a lots of users are complaining that Edge is notorious for Excessive RAM Usages.

23. Difficult to say at this point if Edge is ready to compete with Chrome and/or Firefox at this point of time. Lets see what future unfolds.

#### A few more Virtual Tour ####

24. Start Menu redesigned – Seems clear and effective. Metro icons make it live. Populated with most commonly applications viz., Calendar, Mail, Edge, Photos, Contact, Temperature, Companion suite, OneNote, Store, Xbox, Music, Movies & TV, Money, News, Store, etc.

![Windows Look and Feel](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-Look.jpg)

Windows Look and Feel

In Linux on Gnome Desktop Environment, I use to search required applications simply by pressing windows key and then type the name of the application.

![Search Within Desktop](http://www.tecmint.com/wp-content/uploads/2015/08/Search-Within-Desktop.jpg)

Search Within Desktop

25. File Explorer – seems clear Designing. Edges are sharp. In the left pane there is link to quick access folders.

![Windows File Explorer](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-File-Explorer.jpg)

Windows File Explorer

Equally clear and effective file explorer on Gnome Desktop Environment on Linux. Removed UN-necessary graphics and images from icons is a plus point.

![File Browser on Gnome](http://www.tecmint.com/wp-content/uploads/2015/08/File-Browser.jpg)

File Browser on Gnome

26. Settings – Though the settings are a bit refined on Windows 10, you may compare it with the settings on a Linux Box.

**Settings on Windows**

![Windows 10 Settings](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-10-Settings.jpg)

Windows 10 Settings

**Setting on Linux Gnome**

![Gnome Settings](http://www.tecmint.com/wp-content/uploads/2015/08/Gnome-Settings.jpg)

Gnome Settings

27. List of Applications – List of Application on Linux is better than what they use to provide (based upon my memory, when I was a regular windows user) but still it stands low as compared to how Gnome3 list application.

**Application Listed by Windows**

![Application List on Windows 10](http://www.tecmint.com/wp-content/uploads/2015/08/Application-List-on-Windows-10.jpg)

Application List on Windows 10

**Application Listed by Gnome3 on Linux**

![Gnome Application List on Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Gnome-Application-List-on-Linux.jpg)

Gnome Application List on Linux

28. Virtual Desktop – Virtual Desktop feature of Windows 10 is one of those topic which are very much talked about these days.

Here is the virtual Desktop in Windows 10.

![Windows Virtual Desktop](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-Virtual-Desktop.jpg)

Windows Virtual Desktop

and the virtual Desktop on Linux we are using for more than 2 decades.

![Virtual Desktop on Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Virtual-Desktop-on-Linux.jpg)

Virtual Desktop on Linux

#### A few other features of Windows 10 ####

29. Windows 10 comes with wi-fi sense. It shares your password with others. Anyone who is in the range of your wi-fi and connected to you over Skype, Outlook, Hotmail or Facebook can be granted access to your wifi network. And mind it this feature has been added as a feature by microsoft to save time and hassle-free connection.

In a reply to question raised by Tecmint, Microsoft said – The user has to agree to enable wifi sense, everytime on a new network. oh! What a pathetic taste as far as security is concerned. I am not convinced.

30. Up-gradation from Windows 7 and Windows 8.1 is free though the retail cost of Home and pro editions are approximately $119 and $199 respectively.

31. Microsoft released first cumulative update for windows 10, which is said to put system into endless crash loop for a few people. Windows perhaps don’t understand such problem or don’t want to work on that part don’t know why.

32. Microsoft’s inbuilt utility to block/hide unwanted updates don’t work in my case. This means If a update is there, there is no way to block/hide it. Sorry windows users!

#### A few features native to Linux that windows 10 have ####

Windows 10 has a lots of features that were taken directly from Linux. If Linux were not released under GNU License perhaps Microsoft would never had the below features.

33. Command-line package management – Yup! You heard it right. Windows 10 has a built-in package management. It works only in Windows Power Shell. OneGet is the official package manager for windows. Windows package manager in action.

![Windows 10 Package Manager](http://www.tecmint.com/wp-content/uploads/2015/08/Windows-10-Package-Manager.jpg)

Windows 10 Package Manager

- Border-less windows
- Flat Icons
- Virtual Desktop
- One search for Online+offline search
- Convergence of mobile and desktop OS

### Overall Conclusion ###

- Improved responsiveness
- Well implemented Animation
- low on resource
- Improved battery life
- Microsoft Edge web-browser is rock solid
- Supported on Raspberry pi 2.
- It is good because windows 8/8.1 was not upto mark and really bad.
- It is a the same old wine in new bottle. Almost the same things with brushed up icons.

What my testing suggest is Windows 10 has improved on a few things like look and feel (as windows always did), +1 for Project spartan, Virtual Desktop, Command-line package management, one search for online and offline search. It is overall an improved product but those who thinks that Windows 10 will prove to be the last nail in the coffin of Linux are mistaken.

Linux is years ahead of Windows. Their approach is different. In near future windows won’t stand anywhere around Linux and there is nothing for which a Linux user need to go to Windows 10.

That’s all for now. Hope you liked the post. I will be here again with another interesting post you people will love to read. Provide us with your valuable feedback in the comments below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/a-linux-user-using-windows-10-after-more-than-8-years-see-comparison/

作者：[vishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://www.microsoft.com/en-us/software-download/windows10ISO
