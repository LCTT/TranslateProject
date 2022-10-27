[#]: subject: (Open source tools and tips for improving your Linux PC's performance)
[#]: via: (https://opensource.com/article/21/7/improve-linux-pc-performance)
[#]: author: (Howard Fosdick https://opensource.com/users/howtech)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Open source tools and tips for improving your Linux PC's performance
======
Make changes to your software (and how you use it) to improve your Linux
computer's performance.
![Business woman on laptop sitting in front of window][1]

This is the third in a series of articles that explain how to improve your Linux personal computer's performance. My first article described how to unleash performance by [identifying and resolving bottlenecks][2]. My second article showed how to improve performance by [upgrading your PC's hardware][3].

This article completes the series by presenting software performance tips. It also explores ways to improve performance by changing how you use your computer. Some of these behavioral changes may be obvious to many Opensource.com readers, but they might not be to the end users you support.

The goal is a simple approach to improving Linux PC performance. As in my previous articles, I use all open source tools. There's no need for anything else.

### How to measure improvements

Before you make any change to your computer, assess performance to ensure that the change would be beneficial. After making the update, you might want to inspect the system a second time to verify that the modification succeeded.

Several open source graphical tools make performance monitoring easy. They include the [GNOME System Monitor][4], [KDE System Guard][5], [GKrellM][6], [Stacer][7], [Conky][8], and [Glances][9]. (In my first article in this series, I showed how to monitor performance using the GNOME System Monitor.)

Whichever tool you pick, look very closely at your processor and memory use. You might also want to monitor other hardware resources, such as disk and USB storage, the graphics processor, and the internet connection.

The ultimate performance arbiter for a personal computer is its responsiveness. Quick? You're good. Sluggish… that indicates room for improvement.

Most Linux distributions require little configuration by personal computer users: they're efficient from the start. However, an overview of the important tools you use daily can be useful when you're narrowing your focus on what could use optimization.

### Tweak your browser

Most users run their browser nearly all the time. For some, it's their only app. So browser selection and tuning potentially offer big payoffs.

Here are some tuning tips:

  * As research by the Brave browser indicates, many website ads and trackers [consume over half the CPU][10] your PC spends on page processing. So block ads with a browser extension like [uBlock Origin][11], and block trackers with a tool like [Privacy Badger][12].
  * Disable autoplay for videos and animation (including those little video windows that automatically appear and run in the corner of your screen). In Firefox, you can install the open source [Disable HTML5 Autoplay][13] extension. In Chromium or Google Chrome, install the open source [Yet Another Autoplay Blocker][14] extension.
  * Remove all non-essential add-ons and extensions from the browser. Carefully consider whether each is worth its overhead.



#### Browser tips for powerful PCs

For a high-end PC, select a browser that leverages your abundant processor and memory resources to provide optimal web surfing. Multiprocess, multithread browsers work best. Your goal is to apply all your hardware power for a better browsing experience.

Which browser performs best? That's a highly debatable issue that requires a separate article for an answer. Many people start their search with Chromium or Firefox, popular open source products that are widely respected for their ability to leverage hardware for high-performance browsing. There are many other [open source browsers][15] you might try, though.

#### Browser tips for low-end PCs

For a limited-resource PC, you don't want a browser that consumes resources and swamps your PC. Instead, you want one that performs efficiently using limited resources. Call it a lightweight browser. It probably won't be the one that spawns lots of processes and threads.

Users hold different views about which lightweight browser performs best. I've had good experience with [Dillo][16]. [Wikipedia][17] provides a comprehensive list of lightweight browsers, if you'd like to research others. Keep in mind that most lightweight browsers sacrifice some features and functions to reduce PC resource consumption.

For a limited-resource PC, you can reduce browser resource consumption by opening only a couple of tabs at a time rather than a dozen. Close tabs you're done using. And run only a single instance of one browser at a time.

JavaScript can add a lot of demand on your browser, so toggle it off when you don't need it. Most browsers offer add-ons that allow you to manage JavaScript on a per-website basis or by flipping it on or off at your direction. Firefox offers several such extensions. I use one called [JavaScript Toggle On and Off][18].

On low-end PCs, you can also tailor browser performance to your liking by manually starting and stopping background tab processing. Just click on the page-load button in the browser to toggle processing on or off for a web page. In Firefox, for example, this button is located on the left side of the toolbar.

Here's how to use this. If you want to load a specific web page quickly, toggle off page loading in other tabs so that they don't compete with your page of interest. Conversely, if you're spending a lot of time reading a web page you've already loaded, let other tabs load their pages in the background while you're occupied. In this way, you can often browse with decent performance, even on a minimal-resource computer.

### Stop multitasking

Some apps, including games, video editors, and virtual machine hosts, require more resources than others. For best performance when you run a resource hog, run _only_ that program. Conversely, don't run a resource hog in the background while focusing on some other app.

This performance principle applies everywhere: Limit how many apps you use at one time, and close any you aren't using. Limit concurrency, and you improve performance for the apps you run.

Background processing presents a similar opportunity. Virus scanners, software updates, backups, image copies, filesystem verification, and big downloads are resource-intensive. Schedule these activities for off-hours to optimize performance. A good open source GUI scheduler makes this easy. For example, you can [install and use Zeit][19], and [KCron][20] is available in many repositories.

### Choose software wisely

Your software choices make a big difference in how much processor and memory your computer uses.

For many people today, this hardly matters. Their state-of-the-art personal computers have more than enough processing power and memory to quickly run any app they choose. (If this is you, you can skip this section.) Yet, software choices remain crucial for others.

#### Office suites

If you run LibreOffice or OpenOffice, but you don't use **Base** (the database creation component), then it's safe to disable the Java runtime. You can do this in the **Tools** &gt; **Options** &gt; **LibreOffice** &gt; **Advanced** setting panel.

Alternately, replace your big office suite with what's commonly known as **GNOME Office**. This includes [AbiWord][21] and [Gnumeric][22], both of which require less from your hardware and are functionally equivalent to a word processor and spreadsheet for many users.

You could even consider ditching the local office suite altogether. Instead, offload your workload to the cloud with a product like [Etherpad][23], [EtherCalc][24], or the [ONLYOFFICE suite][25].

This principle applies generally. If you have a low-end computer, offload whatever you can to the cloud. This is why [Chromebooks][26] are effective, even though most offer low-power hardware.

#### Desktop environment

Your desktop environment runs every minute you use your PC. If it's not responsive, install a lighter desktop that requires fewer resources. I recommend [Xfce][27], [LXQt or LXDE][28].

Whichever desktop you use, you can increase its responsiveness by disabling visual effects. Turn off things like animation, compositing, and the thumbnail images in your file manager, or use a file manager (such as [PCManFM, XFE, or Thunar][29]) without those features. This can have a noticeable impact on slower computers because your screen is involved in every mouse click. Use keyboard shortcuts to eliminate having to move your hand between the mouse and keyboard.

You can configure some desktops to use a lightweight window manager. The window manager dictates how windows look and feel and how users interact with these elements.

If you really want to skimp on resources, forgo a desktop altogether in favor of a simple windows manager. Popular choices include [JWM][30], [Openbox][31], and [Fluxbox][32]. These run faster than a full desktop but at the cost of a less user-friendly interface. For example, you often can't put icons on your desktop, and you may not have a system tray or dock.

### Right-size your Linux distribution for your PC

Your Linux distribution can impact PC performance. Some distros assume they're running on powerful state-of-the-art computers, while others are designed to run with fewer resources. So if you're running a full-featured distro and it doesn't perform well, test a lightweight alternative to see if it improves responsiveness.

Testing different distros is easy. Just download the Linux distro you want to try. [Write it to a USB memory stick][33] with an open source tool like [Fedora Media Writer][34] or [Unetbootin][35]. Then boot your PC from the memory stick to test drive the distro. Start up one of the system monitoring tools I mentioned earlier, and measure whether the new distro uses hardware more efficiently.

The lightest distros I've used are AntiX and Puppy Linux. These use window managers instead of a desktop, bundle lightweight apps, and are specifically designed to run on limited-resource computers. They even run well on 15-year-old machines! (You can even [refurbish old computers using lightweight Linux software][36].)

The tradeoff is that their desktops aren't glitzy. Their interfaces may be unfamiliar to you, and you may have to learn how to configure them as you would a full desktop environment. For some people, that's frustrating, but for others, it's a fun challenge and an opportunity to learn something new.

### Make PC configuration changes

I'll conclude with some basic Linux configuration changes you may want to try. Taken individually, each won't improve performance enough that you'd notice. But in the aggregate, they can have a measurable impact:

  * Verify that you have optimal device drivers for all devices.
  * Avoid overheating to prevent step-downs in CPU speed (CPU throttling).
  * Reduce boot time by [reducing the default GRUB_TIMEOUT parameter][37] for the Grub menu.)
  * Eliminate unneeded apps and services from your startup list (the programs that run every time you boot your computer). Linux desktop environments typically provide GUI panels for this so that you don't need to edit configuration files or scripts directly.
  * Speed updates and downloads by using the fastest mirror available.
  * Avoid using swap memory.
  * If you do use swap, place it on your fastest device.
  * Verify your WiFi is operating at peak bandwidth by comparing its WiFi speed versus when it's directly cabled to your modem.
  * Verify your router isn't causing a slowdown by testing internet connection speeds without it.
  * Match USB standards between your USB ports and devices to ensure they don't step down to the speed of the slower partner.
  * Verify your USB transfer rates with the benchmark feature in GNOME Disks.
  * If you must use virtual machines, tune them for performance.
  * Clean out old history, log, and junk files with open source GUI tools like [BleachBit][38] and [Sweeper][39].
  * Clean out unused junk files by uninstalling apps you don't use. On Debian-based systems, clean the APT cache.
  * Find and delete duplicate files by using an open source GUI tool like [FSlint][40].



If readers express interest, I'll discuss these tweaks in detail in a future article. (Please let me know in the comments if you'd like to see this.)

### Summary

In a previous article, I discussed how to identify and remove performance bottlenecks. In my last article, I explained how to efficiently upgrade your Linux PC hardware. This article completes the series by presenting software and behavioral changes that improve PC performance.

I'm sure you have many good performance tips of your own. Please add your favorites in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/improve-linux-pc-performance

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/21/3/linux-performance-bottlenecks
[3]: https://opensource.com/article/21/4/upgrade-linux-hardware
[4]: https://wiki.gnome.org/Apps/SystemMonitor
[5]: https://apps.kde.org/ksysguard/
[6]: http://gkrellm.srcbox.net/
[7]: https://oguzhaninan.github.io/Stacer-Web/
[8]: https://github.com/brndnmtthws/conky
[9]: https://nicolargo.github.io/glances/
[10]: https://brave.com/accurately-predicting-ad-blocker-savings/
[11]: https://github.com/gorhill/uBlock
[12]: https://privacybadger.org/
[13]: https://addons.mozilla.org/en-US/firefox/addon/disable-autoplay/
[14]: https://chrome.google.com/webstore/detail/yet-another-autoplay-bloc/fjekfkbibnnjlkfjaeifgecjfmpmdaad
[15]: https://opensource.com/article/19/7/open-source-browsers
[16]: https://www.dillo.org
[17]: https://en.wikipedia.org/wiki/Comparison_of_lightweight_web_browsers
[18]: https://addons.mozilla.org/en-US/firefox/addon/javascript-toggler/
[19]: https://github.com/loimu/zeit
[20]: https://apps.kde.org/kcron/
[21]: https://flathub.org/apps/details/com.abisource.AbiWord
[22]: http://www.gnumeric.org
[23]: https://etherpad.org/
[24]: http://ethercalc.net
[25]: https://opensource.com/article/20/12/onlyoffice-docs
[26]: https://opensource.com/article/21/2/chromebook-linux
[27]: https://opensource.com/article/19/12/xfce-linux-desktop
[28]: https://opensource.com/article/19/12/lxqt-lxde-linux-desktop
[29]: https://opensource.com/business/15/4/eight-linux-file-managers
[30]: https://opensource.com/article/19/12/joes-window-manager-linux-desktop
[31]: https://opensource.com/article/19/12/openbox-linux-desktop
[32]: https://opensource.com/article/19/12/fluxbox-linux-desktop
[33]: https://opensource.com/article/20/4/first-linux-computer
[34]: https://opensource.com/article/20/10/fedora-media-writer
[35]: https://opensource.com/life/14/10/test-drive-linux-nothing-flash-drive
[36]: https://opensource.com/article/19/7/how-make-old-computer-useful-again
[37]: https://www.unixmen.com/quick-tip-change-grub-2-default-timeout/
[38]: https://www.bleachbit.org/
[39]: https://apps.kde.org/sweeper/
[40]: https://github.com/pixelb/fslint
