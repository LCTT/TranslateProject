[#]: subject: "What is CloudReady? Is it a Viable Open Source Alternative to Chrome OS?"
[#]: via: "https://itsfoss.com/cloudready/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is CloudReady? Is it a Viable Open Source Alternative to Chrome OS?
======

CloudReady is getting popular, specially among the people with low-end hardware. So, I decided to take a look at it and share my findings with you in this article.

### What is CloudReady?

[CloudReady][1] is an operating system based on Google’s open source Chromium OS code-base. Neverware, the organization behind CloudReady, developed the CloudReady OS to be deployed on already existing PC and Mac hardware and guarantees performance uplift on said hardware due to its minimal hardware requirements. Basically, CloudReady turns your older computer into Chromebooks. [Neverware was acquired by Google][2] itself in late 2020.

Before I share my experience and opinion on it, let me tell you a bit more about it.

### Who should you try CloudReady?

![CloudReady][3]

CloudReady is primarily aimed at institutions that would benefit with Chromebook-like devices, but already have invested into hardware. Below are a few examples that come to my mind:

  * User Interface of Chromium OS, and by extension CloudReady is simple enough that there is seldom any need to re-train the staff to switch from macOS or Windows to CloudReady’s UI.
  * Better security – because users can’t install traditional malware ridden apps that are available for macOS and Windows.
  * Chromium OS has low requirements for hardware, so it is pretty much guaranteed to run on your older hardware.
  * Managing computers through the Google Admin Console.
  * Relatively easy initial setup.



Here are the minimum hardware requirements for running CloudReady:

  * **CPU** : Any CPU made available after the year 2008 should work (no mention of ARM CPUs so assume only X86 – Intel and AMD – CPUs are supported)
  * **RAM** : 2 GB or more
  * **Storage** : 16GB or more
  * Full access to BIOS or UEFI – in order boot from the USB installer



If you wonder whether your current netbook work well with CloudReady, Neverware has published a list of netbooks that are Certified to run CloudReady. Currently, there are over 450 models that are certified. You can [check your model against the official list at this link][4].

### How does CloudReady compare with Chrome OS?

If your primary goals are either of the following, you will be satisfied with CloudReady:

  * Managing CloudReady devices with Neverware Admin Portal ([until the Google acquisition is complete][5]) or through Google Admin Console.
  * Work at your organization can be done within a web browser (using web based services).



When you hear the words “It is an Operating System based on Chrome OS”, you would assume that at the very least, it can run Android apps.

Sadly, that is not the case. There is **no support for the Android** Runtime (ART) framework/service for open source Chromium OS, and hence is not available in CloudReady. Neverware has not pursued adding Android Runtime to CloudReady due to several legal and technical reasons.

Which, in turn prevents you from even side-loading an APK, since there is nothing that can run those Android apps.

When I tried launching Play Store from the app drawer, it opened the Google Play Store webpage for me in the browser. So bad news in that front… But, since CloudReady is based on an Operating System that is “web focused”, my Chromium browser extensions appear to be working flawlessly.

![A screenshot of the app drawer in CloudReady with the Google Play Store app icon \(which redirects you to the webpage in Chromium\) along with Chrome Extensions as “Apps”][6]

So, if you are looking to use your old laptop as a non-touch tablet with CloudReady, you are a bit out of luck.

### Why does CloudReady even exist?

You might have wondered that if Chrome OS already exits, why did Neverware devote their resources to create a ‘clone’ called CloudReady?

If you look carefully at devices that run Chrome OS, they are pre-builts. Which indicates that Chrome OS is only available to OEMs that make Chromebooks.

Unlike Microsoft’s Windows, where OEMs get Windows for pre-loading their laptops and/or desktops with, and providing users with an installer ISO, Google doesn’t provide you with an ISO which you can use to install Chrome OS on your computer.

Hence, the need to create an operating system based on Chromium OS code-base. Something that you can install on your already existing PC and Mac hardware.

On top of providing you with a way to install Chromium OS based operating system, Neverware has options for Enterprise users who would want official support for their operating system. You get that with CloudReady.

### Getting CloudReady

![CloudReady screenshot][7]

**CloudReady offers three editions: Home edition (free), Education and Enterprise (both paid)**. If you want to give it a try first, the obvious choice will be to go with the home edition first.

Neverware does not provide you with an ISO. But, Neverware does give you a tool to create bootable USBs with their USB Maker tool, it is Windows only.

Neverware also provides you with a RAW file that you can use to manually create a bootable USB from any operating system using the [Chromebook Recovery Utility extension][8] from [any Chromium based browser.][9]

[Download CloudReady Home Edition][10]

Since Neverware does not provide an ISO, if you want to try it out as a Virtual Machine, Neverware provides with a “.ova” file. But, this “.ova” file won’t work with VirtualBox. It is intended to be used with VMware.

[Download CloudReady “.ova” file][11]

### Ubuntu Web: An alternative to both ChromeOS and CloudReady?

If you are someone who hoped to use CloudReady on your old computer or laptop but got disappointed by the fact that ART is absent in CloudReady, maybe give [Ubuntu Web][12] a try.

![A screenshot of Ubuntu Web][13]

As its name might suggest, it is a Linux distribution that is aimed at people looking at Chrome OS alternatives.

Ubuntu Web has the same, familiar Ubuntu base which provides you with the ability to sync with [/e/ Cloud][14] – a privacy focused alternative to Google’s Cloud syncing services.

The cherry on top is that Ubuntu Web ships with [Waydroid][15] by default.

If you didn’t know about Waydroid, it is a “container based approach to boot a full Android system on a regular GNU/Linux system”. Which means, it will run your Android apps (unlike CloudReady).

### Conclusion

Even though you might feel that CloudReady does not have much when compared to Chrome OS, it appears to be a good option for organizations who want to deploy a centrally managed, Chromium OS based operating system but don’t want to invest in Chromebooks.

It could also be a good option for home users with low-end hardware but we [already have plenty of lightweight Linux distributions][16] for that.

Have you used CloudRead already or are you hearing about it for the first time here? What’s your overall opinion of this project?

--------------------------------------------------------------------------------

via: https://itsfoss.com/cloudready/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://www.neverware.com/
[2]: https://9to5google.com/2020/12/15/google-acquires-cloudready-os/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2022/01/neverware-cloudready.webp?resize=800%2C501&ssl=1
[4]: https://guide.neverware.com/supported-devices/
[5]: https://cloudreadykb.neverware.com/s/article/Neverware-is-now-part-of-Google-FAQ
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/07_app_drawer.webp?resize=800%2C599&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/cloudready-screenshot.webp?resize=800%2C500&ssl=1
[8]: https://chrome.google.com/webstore/detail/chromebook-recovery-utili/pocpnlppkickgojjlmhdmidojbmbodfm?hl=en
[9]: https://news.itsfoss.com/chrome-like-browsers-2021/
[10]: https://www.neverware.com/freedownload
[11]: https://cloudreadykb.neverware.com/s/article/Download-CloudReady-Image-For-VMware
[12]: https://ubuntu-web.org/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/ubuntu-web-screenshot.jpeg?resize=800%2C500&ssl=1
[14]: https://e.foundation/ecloud/
[15]: https://waydro.id/
[16]: https://itsfoss.com/lightweight-linux-beginners/
