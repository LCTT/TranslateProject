[#]: subject: "5 De-Googled Android-based Operating Systems to Free Your Smartphone from Google and other Big Tech"
[#]: via: "https://itsfoss.com/android-distributions-roms/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 De-Googled Android-based Operating Systems to Free Your Smartphone from Google and other Big Tech
======

With the ever growing surveilling presence of advertisement giants like Google and Facebook on your personal and intimate devices like Phones and Tablets, it is time to deal with it.

You might be wondering why should you install a different Android based OS on your phone than what is already included. Let me give you a few reasons:

  * Your [phone manufacturer partners with entities like Facebook to pre-install the apps][1] on your phone and simply uninstalling these apps won’t net you any less surveillance (they tend to get reinstalled when there is a new OS update).
  * [Android phone manufacturers don’t have any incentive to provide you with OS and Security Updates][2]; using an alternative Operating System helps your device get necessary updates even after the vendor stops supporting it. Yes, your smartphone officially gets 3-4 years of support but it doesn’t need to be thrown after that.
  * Since these off the shelf Android ROMs don’t bundle anything other than what is necessary, your phone can feel more responsive due to the less bloat.
  * Less pre-installed software also means fewer services run in background, resulting in better battery life.
  * A lot of customization options.
  * Easy to rollback updates (because previous versions are available on the website of ROM).



WARNING

Please be careful if you decide to use any of these operating systems on an actual device. Flashing any third-party ROM on your device will void its warranty and may even render your device useless if not done correctly.
Installing custom ROM also needs a certain level of expertise and even then you could encounter issues, specially if the device is not supported by the choice of your operating system. It’s better to try with an older, disused smartphone.
We take no responsibility for any damage caused to your device.

This list specifically focuses on Android based distributions and custom ROMs. We have a separate list of [open source mobile operating systems][3] that include options such as Ubuntu Touch and PureOS.

### 1\. LineageOS

[LineageOS][4] is arguably one of the most popular Android ROM, which is a fork of the very popular [[but dead since 2016][5]] CyanogenMod Android firmware/OS. Due to the popularity of LineageOS, it [has support for the vast majority of Android Phones][6].

This popularity also means that brand new phones get included in the LineageOS Project sooner than in other Android based ROMs.

LineageOS even supports your Nvidia Shield TV Set top boxes. How amazing is that?

![A few screenshots of Lineage OS User Interface][7]

#### Pros

  * One of the most popular Android ROM
  * Excellent first party and third party documentation due to the popularity
  * The LineageOS ROM (in theory) is equally secure as the Android Open Source Project
  * Extends your phone life cycle by providing OS updates even after phone vendor stops providing updates
  * Timely updates for officially supported devices
  * LineageOS follows the AOSP tree very closely (for people who want the most stock Android experience)
  * Less “preinstalled bloatware” compared to your stock factory firmware



#### Cons

  * Can feel “incomplete”, since no Google apps like YouTube/Gmail/Photos etc are included
  * The LineageOS project is a community effort, so not all hardware features of your phone may work right out of the box
  * LineageOS can not help making your phone more secure if the [vendor blobs][8] itself pose a security risk
  * Unlocking bootloader is a necessary step (for all roms), and doing so can pose security issues
  * Banking apps may be a hit or miss ([Read more here][9])



[Get LineageOS][10]

### 2\. CalyxOS

[CalyOS][11] is a rather interesting Android OS based on the [Android Open Source Project (AOSP)][12]. Instead of not shipping the Google Mobile Services (GMS) and leaving users to figure stuff out by themselves (flashing gapps etc), CalyxOS ships with [microG][13].

CalyxOS is backed by the [Calyx Institute][14], which is a non-profit organization to promote individual rights like free speech, privacy rights etc.

![The CalyxOS homepage along with a glimpse of their User Interface][15]

#### Pros

  * Uses [microG][13]
  * Ships with with [F-Droid][16] and the [Aurora Store][17] instead of Google Play Store
  * Datura Firewall allows you to block internet access per app
  * Uses [Mozilla Location Services][18] instead of Google’s Location Services
  * Monthly over-the-air security updates
  * Has verified boot for increased security
  * Phone Dialer automatically makes a Signal Call if the recipient has Signal
  * CalyxOS locks the bootloader after installation, reducing security related attack vector(s)



#### Cons

  * Only available on Pixel phones ([but there is a good reason behind this][19])
  * As with all ROMs, bootloader unlock is required (and may lead to warranty issues)
  * Flashing third party ROM on your phone has the possibility of bricking the phone
  * Installing apps that you have paid for can be harder ([“_not so privacy friendly_” workaround][20])
  * Banking apps can be a hit or miss on CalyxOS



[Get CalyxOS][21]

### 3\. GrapheneOS

[GrapheneOS][22] is an Android based ROM focusing on security and privacy. Although, one may argue that their efforts have been more towards increasing security, and doing so also benefits your privacy.

Neither is a bad thing, just know that GrapheneOS is oriented more towards people who value security more.

Their team works around the clock to harden the security of many parts of the base AOSP and provide you one of the best security oriented Android ROM. [GrapheneOS can even sandbox Google’s Play Services][23].

![A stock photo of GrapheneOS installed on a Pixel device][24]

#### Pros

  * Provides stronger and hardened app sandboxing than AOSP
  * Uses its own [hardened malloc][25] (memory allocator with hardened security)
  * The Linux kernel is hardened for better security
  * Provides on time security updates (under a day or three)
  * Ships with Full Disk Encryption (very important for a mobile device)
  * Doesn’t include any Google apps or Google services



#### Cons

  * Limited hardware support; Only available for Google Pixels
  * Their hardcore approach to security (sandboxing) has lead to headaches and is not recommended for new users
  * Push notifications don’t work _out-of-the-box_ for most apps (due to the lack of GMS)
  * Security features like restricting mobile connectivity to LTE-only seem to appear a tad bit unnecessary for your average Joe
  * Google SafetyNet doesn’t work out of the box, which is required for your Banking apps



[Get GrapheneOS][26]

### 4\. /e/OS

You may think that [/e/OS][27] is yet another Android Operating System. You would be _partially_ right. Don’t dismiss this Android ROM just yet. It packs so much more than any off the shelf Android based Operating System.

The biggest outstanding feature is that the [eFoundation][28] (which is behind /e/OS) provides you with a free [ecould account][29] (with 1GB of storage), instead of you needing to use your Google account.

Like any privacy respecting Android ROM, /e/OS replaces every single Google related module or app with a FOSS alternative.

_Side note_: The eFoundation also sells phones with /e/OS pre-installed. [Check it out here][30].

![A look at the app launcher in /e/OS and also an overview of the App Store ratings on /e/OS][31]

#### Pros

  * The App store on /e/OS rates apps based on how many permissions they need and how privacy friendly is that app
  * Provides an [ecloud account][29] (with a @e.email; 1GB in free tier) as a synchronization account
  * Ships with [microG][13] framework
  * Google DNS servers (8.8.8.8 and 8.8.4.4) are replaced with [Quad9][32] DNS servers
  * DuckDuckGo is the default search engine replacing Google
  * Google NTP servers are replaced with pool.ntp.orgs
  * Uses location services provided by [Mozilla][18]



#### Cons

  * Device compatibility is very limited ([list of supported devices][33])
  * On top of limited device compatibility, only older phones are supported
  * No indication if SafetyNet is being worked on; at the moment, SafetyNet is not working
  * Roll-out of new features from Android takes a while



[Get /e/OS][34]

### 5\. CopperheadOS

[CopperheadOS][35] is another, one of the best security oriented Android ROM for your [Pixel] phone. It was developed by a team of just two people. It was a startup that used to sell Nexus phones (RIP) and Google Pixel phones with CopperheadOS pre-installed on the phones.

Just like CyanogenMod, CopperheadOS used to be all the glory for security oriented Android ROM. Unfortunately, due to an issue that I will not get into, the main developer went separate ways from CopperheadOS.

![The CopperheadOS website banner regarding security and privacy on your phone][36]

#### Pros

  * [Unparalleled documentation][37], compared to any other Android ROM documentation
  * CopperheadOS has had many of the security oriented features before AOSP itself
  * Uses Cloudfare DNS (1.1.1.1 and 1.0.0.1) instead of Google’s DNS (8.8.8.8 and 8.8.4.4)
  * Includes a internet firewall for per-app permission
  * Uses Open Source apps instead of obsolete AOSP apps (Calendar, SMS, Gallery etc)
  * Includes [F-Droid][38] and the [Aurora App Store][17]



#### Cons

  * [Questionable claims about the security of CopperheadOS after the main dev went different ways][39]
  * The original aim towards security feels abandoned in favor of an organization that provides phones pre-loaded with CopperheadOS
  * No indication of SafetyNet working on CopperheadOS



[Get CopperheadOS][40]

### Honourable mention: LineageOS for microG

The [LineageOS for microG][41] project is a fork of the official LineageOS with [microG][13] and Google Apps (GApps) included by default. This project takes care of making sure that microG works flawlessly on your phone (which can be a complicated process for a beginner).

![A list of stock apps included in LineageOS for microG][42]

#### Pros

  * Provides the microG implementation of GMS without any inconveniences
  * Comes with [F-Droid][38] as the default App Store
  * Provides weekly/monthly over-the-air updates
  * Has option to use location service provided by either [Mozilla][18], or by [Nominatim][43]



#### Cons

  * Enabling signature spoofing to enable microG support can be an attack vector from a security POV
  * Even though this ROM is based on LineageOS, as of writing this, not all of the LineageOS devices are supported
  * Includes Google Apps (GApps) instead of providing Open Source alternatives
  * No confirmation if Google’s SafetyNet is working or not



[Get LineageOS for microG][44]

### Misclleanous

You may be wondering why some of the interesting Android based ROMs (CalyxOS, GrapheneOS etc) are only restricted to supporting Google’s Phones. Isn’t _that_ ironic?

Well, that is because most phones support unlocking a bootlaoder, but only Google Pixels support locking the bootloader again. Which is a consideration when you are developing an Android based ROM for privacy and/or security focused crowd. If the bootloader is unlocked, it is an attack vector that you haven’t patched yet.

Another reason for this irony is that, only Google makes their phones’ Device Tree and Kernel Source Code available for the public in a timely manner. You cannot develop a ROM for said phone without its Device Tree and Kernel Source Code.

I would also recommend the following FOSS apps regardless of your ROM choice. They will prove to be a nice addition to your privacy friendly app toolkit.

  * [Signal Messenger][45]
  * [K-9 Mail][46]
  * [DuckDuckGo Browser][47]
  * [Tor Borwser][48]
  * [F-Droid][16]
  * [Aurora Store][17]
  * [OpenKeychain][49]



### Conclusion

In my opinion, if you have a Google Pixel phone, I recommend giving a try to either CalyxOS or GrapheneOS or CopperheadOS. These Android ROMs have excellent features to help you keep your phone out of Google’s spying eyes while also keeping your phone [arguably] more secure.

If you do not have a Google Pixel, you can still give LineageOS for microG a try. It is a good community effort to bring Google’s proprietary features without invading your privacy, to the masses.

If your phone isn’t supported by either of the operating systems mentioned above, LineageOS is your friend. Due to the wide range of support for phones, yours will undoubtedly supported at any capacity, be it officially or unofficially.

--------------------------------------------------------------------------------

via: https://itsfoss.com/android-distributions-roms/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://9to5google.com/2020/08/05/oneplus-phones-will-ship-with-facebook-services-that-cant-be-removed/
[2]: https://www.computerworld.com/article/3175067/android-upgrade-problem.html
[3]: https://itsfoss.com/open-source-alternatives-android/
[4]: https://lineageos.org/
[5]: https://www.androidauthority.com/cyanogenmod-lineageos-654810/
[6]: https://wiki.lineageos.org/devices/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/01_lineageos.webp?resize=800%2C400&ssl=1
[8]: https://www.reddit.com/r/Android/comments/52ovsh/comment/d7m2pnr/?utm_source=share&utm_medium=web2x&context=3
[9]: https://lineageos.org/Safetynet/
[10]: https://download.lineageos.org/
[11]: https://calyxos.org/
[12]: https://www.androidauthority.com/aosp-explained-1093505/
[13]: https://microg.org/
[14]: https://calyxinstitute.org/projects/calyx-os
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_calyx-1.webp?resize=800%2C449&ssl=1
[16]: https://www.f-droid.org/en/about/
[17]: https://auroraoss.com/
[18]: https://location.services.mozilla.com/
[19]: https://calyxos.org/docs/guide/device-support/#requirements-for-supporting-a-new-device
[20]: https://auroraoss.com/faq/#how-do-i-purchase-paid-apps-without-using-the-play-store-app
[21]: https://calyxos.org/install/
[22]: https://grapheneos.org/
[23]: https://twitter.com/grapheneos/status/1445572173389725709
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_graphene.webp?resize=800%2C600&ssl=1
[25]: https://github.com/GrapheneOS/hardened_malloc
[26]: https://grapheneos.org/install/
[27]: https://e.foundation/e-os/
[28]: https://e.foundation/
[29]: https://e.foundation/ecloud/
[30]: https://esolutions.shop/
[31]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/06_eos-1.webp?resize=600%2C539&ssl=1
[32]: https://www.quad9.net/
[33]: https://doc.e.foundation/easy-installer#list-of-devices-supported-by-the-easy-installer
[34]: https://doc.e.foundation/devices
[35]: https://copperhead.co/
[36]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/04_copperheados.webp?resize=800%2C420&ssl=1
[37]: https://copperhead.co/android/docs/
[38]: https://f-droid.org/en/about/
[39]: https://twitter.com/DanielMicay/status/1068641901157511168
[40]: https://copperhead.co/android/docs/install/
[41]: https://lineage.microg.org/
[42]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/05_losmicrog.webp?resize=450%2C800&ssl=1
[43]: https://nominatim.org/
[44]: https://download.lineage.microg.org/
[45]: https://signal.org/
[46]: https://k9mail.app/
[47]: https://duckduckgo.com/app
[48]: https://www.torproject.org/
[49]: https://www.openkeychain.org/
