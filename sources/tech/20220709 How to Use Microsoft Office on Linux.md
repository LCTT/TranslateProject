[#]: subject: "How to Use Microsoft Office on Linux"
[#]: via: "https://itsfoss.com/use-microsoft-office-linux/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Use Microsoft Office on Linux
======
For many users, not having native support for Microsoft Office is the only reason why they do not switch to Linux.

Yes, **Microsoft Office is not available to install on Linux**.

For some existing users, not having Microsoft Office on Linux creates additional pain.

Sure, there are several good open source office suites available and they are sufficient for most users.

But there are situations when you are compelled to use MS Office.

If other people at work send you Office documents with complex macros, it may not work well with LibreOffice.

Similarly, if your university or workplace requires you to write in .docx or .xlsx and you use LibreOffice, there might be compatibility issues if tables, macros and other elements are involved.

These are practical difficulties that are encountered by people who have to collaborate with MS office users.

**If you are in a situation where you must use Microsoft Office, you don’t need to ditch Linux altogether.**

Here are a few suggestions on how you could use Microsoft Office on the Linux desktop.

### Your options for using Microsoft Office on Linux

There are various **alternative methods** you can use to access Microsoft’s Office on Linux.

Sure, it’s not the same using MS Office on Windows, but at least it allows you to work with Office documents.

#### 1. Use Microsoft Office 365 Online

Yes, you can use Microsoft Office applications in your web browser. And this works on any operating system. That includes Linux, of course.

This is the best way to access Microsoft Office apps if you have a stable internet connection.

Do note that the online Office version doesn’t have all the features you get in the desktop version. Still, it’s a good enough choice in many cases.

If you have a Microsoft account, you can [sign in to Microsoft 365 directly][1]. If you don’t have one, you must create a Microsoft account.

Without any paid subscription, you can use a lite version of all the essential office tools like Microsoft Word, Excel, and more, right on your web browser.

Sounds good, right?

![microsoft office linux][2]

The best part of this service is you can utilize free 5 GB of OneDrive storage to keep your documents online, and it integrates well will all the apps available in the suit. Not to forget, you can also use the mobile app on the go.

Note that there are some feature differences between Office Online and its native desktop applications. You can know more about it in its [official documentation][3].

Moreover, if you want to make the most out of it, with more cloud storage, and some premium features, you may opt for the Microsoft 365 subscription as well.

##### Pros

* Comes free with Microsoft account
* Documents are saved in the cloud and can be accessed from any device
* 5 GB of free storage with OneDrive
* Can be used on any operating system without installing the software

##### Cons

* You must create a Microsoft account
* Free version lacks features
* You can only store documents up to 5 GB for free
* Needs internet connection to access and edit files

#### 2. Using a Windows compatibility program

What if you would like to experience the desktop app of Microsoft Office from within your Linux system?

You can use a virtual machine to install Windows, but we discuss that next, considering it is time-consuming.

Instead, you can use Windows compatibility layers for specific software, by which you can run them on Linux machines.

I’ll suggest two ways to install Microsoft Office desktop application on Linux

* Using PlayOnLinux (free but provides older versions of MS office)
* Using CrossOver (paid and comes with proper support)

Let me give you a brief overview of how to use them

##### Using PlayOnLinux

[PlayOnLinux][4] is one of the best ways to run Windows applications on Linux.

On Ubuntu, you can install it using a command through the terminal as follows:

```
sudo apt install winbind playonlinux winetricks -y
```

After installation, launch the program and click on the Install button which will sync available packages and will allow us to install MS Office (desired version).

![Using PlayOnLinux on Ubuntu][5]

Now, you’ll be given a prompt where we will be searching for our desired software.

If you already purchased Microsoft Office earlier, you can have the installation media or the ISO file ready from their [official download page][6].

Enable the option labeled as “No-cd needed” if you do not plan to use your installer, and search “Office”.

It will list all compatible Microsoft Office programs. Select your desired version and click on the **Install** button to download/install it automatically.

![Searching for MS Office in PlayOnLinux][7]

It will automatically create a virtual space for MS Office and will install Wine through the installer. Once you are done with the basic steps, it will show you a prompt where you have to choose the installation method between the setup file and DVD.

We’ll be going with the first option for convenience. After selecting the first option, locate the setup file and all the other processes will be handled automatically.

![using setup file][8]

Soon the installer will start the installation process and in no time you will get your favorite office suite installed on your system. You can directly access it without PlayOnLinux from your Linux system or from within the application as well.

![MS Office suit on Linux with PlayOnLinux][9]

For example, let’s try launching MS Word. Here’s what it looks like:

![Running MS Office][10]

Note that you won’t find the latest version of Microsoft Office with this method, and probably not the best experience in terms of performance.

##### Using CrossOver

[CrossOver][11] is a paid software that lets you run Windows applications on Linux in the best way possible.

![crossover][12]

It is built on top of Wine, and several open-source projects. The CrossOver developers contribute heavily to the [WINE project][13].

You just need to purchase it once and use it as long as you want. Unfortunately, you still cannot get the latest Microsoft Office version 2021 to work with it. The [ratings are poor][14]. The newest that works well with CrossOver is Office 2016 at the time of writing this article.

Oh, yes! CrossOver has a [compatibility database][15]. You can search for the desired Windows software and see if it is well supported or not.

If you want convenience, and a tool to run Windows applications on Linux (not just Microsoft Office) and you don’t mind paying for it, you should try it out.

##### Pros

* No need for internet while using Office
* Your existing Office license may work the same

##### Cons

* Only older versions are available

[Use Windows Software on Linux with Crossover][16]

Thousands of Windows games and programs to run on your favorite Linux distro.

Supported Windows apps will run at native speed, play games at full fps all while maintaining the Linux OS integration. Simply magic!

Your purchase supports WINE development as well.

![Use Windows Software on Linux with Crossover][17]

[Get it now][18]

We earn a commission if you make a purchase, at no additional cost to you.

#### 3. Use a virtual machine to run Windows

So if you are someone with enough system resources to spare, this option will enable you to use a wide range of exclusive software. It’s because, you will be using Windows from within Linux, as a virtual machine.

If you are not familiar with it, the virtual machine mechanism allows you to use another operating system (like Windows) inside Linux like a regular application.

![A Video from YouTube][19]

You can choose to use options like [Quickgui][20], VMware, [GNOME Boxes][21], or VirtualBox.

As an example, you can follow our guide on [installing Windows 10 using VirtualBox on Linux][22].

It can be exciting, you know! But to run a virtual machine, you need to have a computer with enough system resources. It will struggle miserably if you try to use it on a 4 GB RAM and i3 processor.

It’s not perfect. As you may have trouble sharing clipboards and files between the guest OS (Windows) and host OS (Linux).

Another thing is about Windows licensing. If you have a new system that came preinstalled with Windows, your license is linked to your machine on BIOS/firmware level. You should be able to use Windows in the virtual machine without issues. But if that was not the case, you may have to activate Windows.

##### Pros

* No need for internet while using Office
* Use the latest version of MS Office
* Use other Windows-only software

##### Cons

* Only works well with high-end computers with good system resources
* Licensing could be an issue

#### 4. Use alternative office suits that are compatible with MS Office files

So if you are using Linux for a while, the chances of your distro being shipped with LibreOffice are quite high. But LibreOffice is not always compatible with MS Office file formats.

I would suggest **two office suites which are known for better compatibilty with your Microsoft Office files**:

##### 1. OnlyOffice

![onlyoffice][23]

If you are looking for an office suite that is identical to Microsoft Office with several essential features, [OnlyOffice][24] can be a great choice.

You can download the desktop edition for free on Linux, Windows, and macOS.

If you have a [Nextcloud][25] instance or similar, you can also integrate it with that for usage.

##### 2. WPS Office

![wps office][26]

WPS Office was previously known as Kingsoft Office. The Chinese developers of WPS Offices are unabashed about imitating the look and feel of the MS Office products.

**This is not open-source, though.**

WPS is fine-tuned for personal use and provides good compatibility with Microsoft Office documents.

Being one of the best alternatives to MS Office, you can follow [our guide][27] for easy installation and get WPS running in no time on Linux.

##### Pros

* No need for internet while using Office
* Use the latest version of MS Office
* Use other Windows-only software

##### Cons

* Only works well with high-end computers with good system resources
* Licensing could be an issue

### No real love for Linux from Microsoft but you’ll always find a way

Microsoft has clarified that it loves open-source as much as everyone. But, we still need to resort to numerous ways to run Microsoft Office on Linux. Instead of bringing its Office suite to Linux, [Microsoft gifted its calculator][28] to the community.

Linux users always find a way around things. Though MS Office is not officially available for Linux, you can still employ one of the workarounds I suggested here.

In my opinion, Office 365 is a pretty good option if you are always connected to the internet.

What do you think?

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-microsoft-office-linux/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://www.microsoft.com/en-in/microsoft-365/free-productivity-apps
[2]: https://itsfoss.com/wp-content/uploads/2022/07/microsoft-office-linux.jpg
[3]: https://docs.microsoft.com/en-us/office365/servicedescriptions/office-online-service-description/office-online-service-description
[4]: https://www.playonlinux.com/en/
[5]: https://itsfoss.com/wp-content/uploads/2022/07/Sync-available-software-1-2.png
[6]: https://www.microsoft.com/en-us/download/office.aspx
[7]: https://itsfoss.com/wp-content/uploads/2022/07/Searching-for-MS-Office-2.png
[8]: https://itsfoss.com/wp-content/uploads/2022/07/Using-setup-file-2.png
[9]: https://itsfoss.com/wp-content/uploads/2022/07/Installed-office-suit-800x445.png
[10]: https://itsfoss.com/wp-content/uploads/2022/07/MS-Office-800x660.png
[11]: https://itsfoss.com/go/crossover/
[12]: https://itsfoss.com/wp-content/uploads/2022/07/crossover-21-1-0.png
[13]: https://www.winehq.org/
[14]: https://www.codeweavers.com/compatibility/crossover/microsoft-office-2021
[15]: https://www.codeweavers.com/compatibility
[16]: https://itsfoss.com/go/crossover/
[17]: https://itsfoss.com/go/crossover/
[18]: https://itsfoss.com/go/crossover/
[19]: https://youtu.be/_Kh_Y3xg890
[20]: https://itsfoss.com/quickgui/
[21]: https://itsfoss.com/share-files-gnome-boxes/
[22]: https://itsfoss.com/install-windows-10-virtualbox-linux/
[23]: https://itsfoss.com/wp-content/uploads/2022/07/OnlyOffice-800x518.png
[24]: https://itsfoss.com/recommends/onlyoffice/
[25]: https://itsfoss.com/nextcloud/
[26]: https://itsfoss.com/wp-content/uploads/2022/07/WPS-office-1-800x443.png
[27]: https://itsfoss.com/wps-office-linux/
[28]: https://itsfoss.com/windows-calculator-linux/
