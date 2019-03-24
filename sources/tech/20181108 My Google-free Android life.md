[#]: collector: (lujun9972)
[#]: translator: (LuuMing)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My Google-free Android life)
[#]: via: (https://lushka.al/my-android-setup/)
[#]: author: (Anxhelo Lushka https://lushka.al/)

My Google-free Android life
======

People have been asking me a lot lately about my phone, my Android setup and how I manage to use my smartphone without Google Services. Well, this is a post that aims to address precisely that. I would like to make this article really beginner-friendly so I’ll try to go slow, going through things one by one and including screenshots so you can have a better view on how things happen and work like.

At first I’ll start with why Google Services are (imo) bad for your device. I could cut it short and guide you to this [post][1] by [Richard Stallman][2], but I’m grabbing a few main points from it and adding them here.

  * Nonfree software required
    * In general, most Google services require running nonfree Javascript code. Nowadays, nothing whatsoever appears if Javascript is disabled, even making a Google account requires running nonfree software (Javascript sent by the site), same thing for logging in.
  * Surveillance
    * Google quietly combines its ad-tracking profiles with its browsing profiles and stores a huge amount of data on each user.
  * Terms of Service
    * Google cuts off accounts for users that resell Pixel phones. They lose access to all of their mail and documents stored in Google servers under that account.
  * Censorship
    * Amazon and Google have cut off domain-fronting, a feature used to enable people in tyrannical countries to reach communication systems that are banned there.
    * Google has agreed to perform special censorship of Youtube for the government of Pakistan, deleting views that the state opposes. This will help the illiberal Pakistani state suppress dissent.
    * Youtube’s “content ID” automatically deletes posted videos in a way copyright law does not require.



These are just a few reasons, but you can read the post by RMS I linked above in which he tries to explain these points in detail. Although it may look like a tinfoil hat reaction to you, all these actions already happen everyday in real life.

### Next on the list, my setup and a tutorial on how I achieved it

I own a **[Xiaomi Redmi Note 5 Pro][3]** smartphone (codename **whyred** ), produced in China by [Xiaomi][4], which I bought for around 185 EUR 4 months ago (from the time of writing this post).

Now you might be thinking, ‘but why did you buy a Chinese brand, they are not reliable’. Yes, it is not made from the usuals as you would expect, such as Samsung (which people often associate with Android, which is plain wrong), OnePlus, Nokia etc, but you should know almost every phone is produced in China.

There were a few reasons I chose this phone, first one of course being the price. It is a quite **budget-friendly** device, so most people are able to afford it. Next one would be the specs, which on paper (not only) are pretty decents for the price tag. With a 6 inch screen (Full HD resolution), a **4000 mAh battery** (superb battery life), 4GB of RAM, 64GB of storage, dual back cameras (12MP + 5MP), a front camera with flash (13MP) and a decent efficient Snapdragon 636, it was probably the best choice at that moment.

The issue with it was that it came with [MIUI][5], the Android skin that Xiaomi ships with most of its devices (except the Android One project devices). Yes, it is not that horrible, it has some extra features, but the problems lie deeper within. One of the reasons these devices from Xiaomi are so cheap (afaik they only have 5-10% win margin from sales) is that **they include data mining and ads in the system altogether with MIUI**. In this way, the system apps requires extra unnecessary permissions that mine your data and bombard you with ads, from which Xiaomi earns money.

Funnily enough, the Weather app included wanted access to my contacts and to make calls, why would it need that if it would just show the weather? Another case was with the Recorder app, it also required contacts and internet permissions, probably to send those recordings back to Xiaomi.

To fix this, I’d have to format the phone and get rid of MIUI. This has become increasingly difficult with the latest phones in the market.

The concept of formatting a phone is simple, you remove the existing system and install a new one of your preference (Android-only in this case). To do that, you have to have your [bootloader][6] unlocked.

> A bootloader is a computer program that loads an operating system (OS) or runtime environment for the computer after completion of the self-tests. — [Wikipedia][7]

The problem here is that Xiaomi has a specific policy about the bootloader unlocking. A few months ago, the process was like this. You would have to [make a request][8] to Xiaomi to obtain an unlock code for your phone, by giving a valid reason, but this would not always work, as they could just refuse your request without reason and explanation.

Now, that process has changed. You’ll have to download a specific software from Xiaomi, called [Mi Unlock][9], install it in your Windows PC, [activate Debugging Settings in Developer Options][10] on your phone, reboot to the bootloader mode (by holding the Volume Down + Power button while the phone is off) and connect the phone to your computer to start a process called “Approval”. This process starts a timer on the Xiaomi servers that will allow you to **unlock the phone only after a period of 15 days** (or a month in some rare cases, totally random) goes by.

![Mi Unlock app][11]

After this period of 15 days has passed, you have to re-connect your phone and do the same procedure as above, then by pressing the Unlock button your bootloader will be unlocked and this will allow you to install other ROM-s (systems). **Careful, make sure to backup your data because unlocking the bootloader deletes everything in the phone**.

The next step would be finding a system ([ROM][12]) that works for your device. I searched through the [XDA Developers Forum][13], which is a place where Android developers and users exchange ideas, apps etc. Fortunately, my phone is quite popular so it had [its own forum category][14]. There, I skimmed through some popular ROM-s for my device and decided to use the [AOSiP ROM][15] (AOSiP standing for Android Open Source illusion Project).

**EDIT** : Someone emailed me to say that my article is exactly what [/e/][16] does and is targeted to. I wanted to say thank you for reaching out but that is not true at all. The reasoning behind my opinion about /e/ can also be found in this [website][17], but I’ll list a few of the reasons here.

eelo is a “foundation” that got over 200K € in funding from Kickstarter and IndieGoGo, promising to create a mobile OS and web services that are open and secure and protect your privacy.

  1. Their OS is based on LineageOS 14.1 (Android 7.1) with microG and other open source apps with it, which already exists for a long time now and it’s called [Lineage for microG][18].
  2. Instead of building all apps from the source code, they download the APKs from [APKPure][19] and put them in the ROM, without knowing if those APKs contain proprietary code/malware in them.
  3. At one point, they were literally just removing the Lineage copyright header from their code and adding theirs.
  4. They love to delete negative feedback and censor their users’ opinions in their Telegram group chat.



In conclusion, I **don’t recommend using /e/** ROM-s (at least until now).

Another thing you would likely want to do is have [root access][20] to your phone, to make it truly yours and modify files in the system, such as use a system-wide adblocker etc. To do this, I decided to use [Magisk][21], a godsend app developed by a student to help you gain root access on your device and install what are called [modules][22], basically software.

After downloading the ROM and Magisk, I had to install them on my phone. To do that, I moved the files to my SD card on the phone. Now, to install the system, I had to use something called a [recovery system][23]. The one I use is called [TWRP][24] (standing for TeamWin Recovery Project), a popular solution.

To install the recovery system (sounds hard, I know), I had to [flash][20] the file on the phone. To do that, I connected my phone with the computer (Fedora Linux system) and with something called [ADB Tools][25] I issued a command that overwrites the system recovery with the custom one I had.

> fastboot flash recovery twrp.img

After this was done, I turned off the phone and kept Volume Up + Power button pressed until I saw the TWRP screen show up. That meant I was good to go and it was ready to receive my commands.

![TWRP screen][26]

Next step was to **issue a Wipe command** , necessary when you first install a custom ROM on your phone. As you can see from the image above, the Wipe command clears the Data, Cache and Dalvik (there is also an advanced option that allows us to tick a box to delete the System one too, as we don’t need the old one anymore).

This takes a few moments and after that, your phone is basically clean. Now it’s time to **install the system**. By pressing the Install button on the main screen, we select the zip file we added there before (the ROM file) and swipe the screen to install it. Next, we have to install Magisk, which gives us root access to the device.

**EDIT** : As some more experienced/power Android users might have noticed until now, there is no [GApps][27] (Google Apps) included. This is what we call GApps-less in the Android world, not having those packages installed at all.

Note that one of the downsides of not having Google Services installed is that some of your apps might not work, for example their notifications might take longer to arrive or might not even work at all (this is what happens with Mattermost app for me). This happens because these apps use [Google Cloud Messaging][28] (now called [Firebase][29]) to wake the phone and push notifications to your phone.

You can solve this (partially) by installing and using [microG][30] which provides some features of Google Services but allows for more control on your side. I don’t recommend using this because it still helps Google Services and you don’t really give up on them, but it’s a good start if you want to quit Google slowly and not go cold turkey on it.

After successfully installing both, now we reboot the phone and **tada** 🎉, we are in the main screen.

### Next part, installing the apps and configuring everything

This is where things start to get easier. To install the apps, I use [F-Droid][31], an alternative app store that includes **only free and open source apps**. If you need apps that are not available there, you can use [Aurora Store][32], a client to download apps from the Play Store without using your Google account or getting tracked.

F-Droid has what are called repos, a “storehouse” that contains apps you can install. I use the default ones and have added another one from [IzzyOnDroid][33], that contains some more apps not available from the default F-Droid repo and is updated more often.

![My repos][34]

Below you will find a list of the apps I have installed, what they replace and their use.

This is pretty much **my list of the most useful F-Droid apps** I use, but unfortunately these are NOT the only apps I use. The proprietary apps I use (I know, I might sound a hypocrite, but not everything is replaceable, not yet at least) are as below:

  * AliExpress
  * Boost for Reddit
  * Google Camera (coupled with Camera API 2, this app allows me to take wonderful pictures with a 185 EUR phone, it’s just too impressive)
  * Instagram
  * MediaBox HD (allows me to stream movies)
  * Mi Fit (an app that pairs with my Mi Band 2)
  * MyVodafoneAL (the carrier app)
  * ProtonMail (email app)
  * Shazam Encore (to find those songs you usually listen in coffee shops)
  * Snapseed (photo editing app, really simple, powerful and quite good)
  * Spotify (music streaming)
  * Titanium Backup (to backup my app data, wifi passwords, calls log etc.)
  * ViPER4Android FX (music equalizer)
  * VSCO (photo editing, never use it really)
  * WhatsApp (E2E proprietary messaging app, almost everyone I know has it)
  * WiFi Map (mapped hotspots that are available, handy when abroad)



This is pretty much it, all the apps I use on my phone. **The configs are then pretty simple and straightforward and I can give a few tips**.

  1. Read and check the permissions of apps carefully, don’t click ‘Install’ mindlessly.
  2. Try to use as many open source apps as possible, they both respect your privacy and are free (as in both free beer and freedom).
  3. Use a VPN as much as you can, find a reputable one and don’t use free ones, otherwise you get to be the product and you’ll get your data harvested.
  4. Don’t keep your WiFi/mobile data/location on all the time, it might be a security risk.
  5. Try not to rely on fingerprint unlock only, or better yet use only PIN/password/pattern unlock, as biometric data can be cloned and used against you, for example to unlock your phone and steal your data.



And as a bonus for reading far down here, **a screenshot of my home screen** right now.

![Screenshot][35]


--------------------------------------------------------------------------------

via: https://lushka.al/my-android-setup/

作者：[Anxhelo Lushka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://lushka.al/
[b]: https://github.com/lujun9972
[1]: https://stallman.org/google.html
[2]: https://en.wikipedia.org/wiki/Richard_Stallman
[3]: https://www.gsmarena.com/xiaomi_redmi_note_5_pro-8893.php
[4]: https://en.wikipedia.org/wiki/Xiaomi
[5]: https://en.wikipedia.org/wiki/MIUI
[6]: https://forum.xda-developers.com/wiki/Bootloader
[7]: https://en.wikipedia.org/wiki/Booting
[8]: https://en.miui.com/unlock/
[9]: http://www.miui.com/unlock/apply.php
[10]: https://www.youtube.com/watch?v=7zhEsJlivFA
[11]: https://lushka.al//assets/img/posts/mi-unlock.png
[12]: https://www.xda-developers.com/what-is-custom-rom-android/
[13]: https://forum.xda-developers.com/
[14]: https://forum.xda-developers.com/redmi-note-5-pro
[15]: https://forum.xda-developers.com/redmi-note-5-pro/development/rom-aosip-8-1-t3804473
[16]: https://e.foundation
[17]: https://ewwlo.xyz/evil
[18]: https://lineage.microg.org/
[19]: https://apkpure.com/
[20]: https://lifehacker.com/5789397/the-always-up-to-date-guide-to-rooting-any-android-phone
[21]: https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445
[22]: https://forum.xda-developers.com/apps/magisk
[23]: http://www.smartmobilephonesolutions.com/content/android-system-recovery
[24]: https://dl.twrp.me/whyred/
[25]: https://developer.android.com/studio/command-line/adb
[26]: https://lushka.al//assets/img/posts/android-twrp.png
[27]: https://opengapps.org/
[28]: https://developers.google.com/cloud-messaging/
[29]: https://firebase.google.com/docs/cloud-messaging/
[30]: https://microg.org/
[31]: https://f-droid.org/
[32]: https://f-droid.org/en/packages/com.dragons.aurora/
[33]: https://android.izzysoft.de/repo
[34]: https://lushka.al//assets/img/posts/android-fdroid-repos.jpg
[35]: https://lushka.al//assets/img/posts/android-screenshot.jpg
[36]: https://creativecommons.org/licenses/by-nc-sa/4.0/
