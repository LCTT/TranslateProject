CopperheadOS: Security features, installing apps, and more
============================================================

### Fly your open source flag proudly with Copperhead, a mobile OS that takes its FOSS commitment seriously.


![Android security and privacy](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/android_security_privacy.png?itok=MPHAV5mL "Android security and privacy")
Image by : Norebbo via [Flickr][15] (Original: [public domain][16]). Modified by Opensource.com. [CC BY-SA 4.0][17].

 _Editor's note: CopperheadOS is [licensed][11] under the Creative Commons Attribution-NonCommercial-Shar<wbr>eAlike 4.0 license (userspace) and GPL2 license (kernel). It is also based on Android Open Source Project (AOSP)._ 

Several years ago, I made the decision to replace proprietary technologies (mainly Apple products) with technology that ran on free and open source software (FOSS). I can't say it was easy, but I now happily use FOSS for pretty much everything.

The hardest part involved my mobile handset. There are basically only two choices today for phones and tablets: Apple's iOS or Google's Android. Since Android is open source, it seemed the obvious choice, but I was frustrated by both the lack of open source applications on Android and the pervasiveness of Google on those devices.

So I entered the world of custom ROMs. These are projects that take the base [Android Open Source Project][18] (AOSP) and customize it. Almost all these projects allow you to install the standard Google applications as a separate package, called GApps, and you can have as much or as little Google presence on your phone as you like. GApps packages come in a number of flavors, from the full suite of apps that Google ships with its devices to a "pico" version that includes just the minimal amount of software needed to run the Google Play Store, and from there you can add what you like.

I started out using CyanogenMod, but when that project went in a direction I didn't like, I switched to OmniROM. I was quite happy with it, but still wondered what information I was sending to Google behind the scenes.

Then I found out about [CopperheadOS][19]. Copperhead is a version of AOSP that focuses on delivering the most secure Android experience possible. I've been using it for a year now and have been quite happy with it.

Unlike other custom ROMs that strive to add lots of new functionality, Copperhead runs a pretty vanilla version of AOSP. Also, while the first thing you usually do when playing with a custom ROM is to add root access to the device, not only does Copperhead prevent that, it also requires that you have a device that has verified boot, so there's no unlocking the bootloader. This is to prevent malicious code from getting access to the handset.

Copperhead starts with a hardened version of the AOSP baseline, including full encryption, and then adds a [ton of stuff][20] I can only pretend to understand. It also applies a number of kernel and Android patches before they are applied to the mainline Android releases.

### [copperos_extrapatches.png][1]

![About phone with extra patches](https://opensource.com/sites/default/files/u128651/copperos_extrapatches.png "About phone with extra patches")

It has a couple of more obvious features that I like. If you use a PIN to unlock your device, there is an option to scramble the digits.

### [copperos_scrambleddigits.png][2]

![Option to scramble digits](https://opensource.com/sites/default/files/u128651/copperos_scrambleddigits.png "Option to scramble digits")

This should prevent any casual shoulder-surfer from figuring out your PIN, although it can make it a bit more difficult to unlock your device while, say, driving (but no one should be using their handset in the car, right?).

Another issue it addresses involves tracking people by monitoring their WiFi MAC address. Most devices that use WiFi perform active scanning for wireless access points. This protocol includes the MAC address of the interface, and there are a number of ways people can use [mobile location analytics][21] to track your movement. Copperhead has an option to randomize your MAC address, which counters this process.

### [copperos_randommac.png][3]

![Randomize MAC address](https://opensource.com/sites/default/files/u128651/copperos_randommac.png "Randomize MAC address")

### Installing apps

This all sounds pretty good, right? Well, here comes the hard part. While Android is open source, much of the Google code, including the [Google Play Store][22], is not. If you install the Play Store and the code necessary for it to work, you allow Google to install software without your permission. [Google Play's terms of service][23] says:

> "Google may update any Google app or any app you have downloaded from Google Play to a new version of such app, irrespective of any update settings that you may have selected within the Google Play app or your Device, if Google determines that the update will fix a critical security vulnerability related to the app."

This is not acceptable from a security standpoint, so you cannot install Google applications on a Copperhead device.

This took some getting used to, as I had come to rely on things such as Google Maps. The default application repository that ships with Copperhead is [F-Droid][24], which contains only FOSS applications. While I previously used many FOSS applications on Android, it took some effort to use  _nothing but_  free software. I did find some ways to cheat this system, and I'll cover that below. First, here are some of the applications I've grown to love from F-Droid.

### F-Droid favorites

**K-9 Mail**

### [copperheados_k9mail.png][4]

![K-9 Mail](https://opensource.com/sites/default/files/u128651/copperheados_k9mail.png "K-9 Mail")

Even before I started using Copperhead, I loved [K-9 Mail][25]. This is simply the best mobile email client I've found, period, and it is one of the first things I install on any new device. I even use it to access my Gmail account, via IMAP and SMTP.

**Open Camera**

### [copperheados_cameraapi.png][5]

![Open Camera](https://opensource.com/sites/default/files/u128651/copperheados_cameraapi.png "Open Camera")

Copperhead runs only on rather new hardware, and I was consistently disappointed in the quality of the pictures from its default camera application. Then I discovered [Open Camera][26]. A full-featured camera app, it allows you to enable an advanced API to take advantage of the camera hardware. The only thing I miss is the ability to take a panoramic photo.

**Amaze**

### [copperheados_amaze.png][6]

![Amaze](https://opensource.com/sites/default/files/u128651/copperheados_amaze.png "Amaze")

[Amaze][27] is one of the best file managers I've ever used, free or not. When I need to navigate the filesystem, Amaze is my go-to app.

**Vanilla Music**

### [copperheados_vanillamusic.png][7]

![Vanilla Music](https://opensource.com/sites/default/files/u128651/copperheados_vanillamusic.png "Vanilla Music")

I was unhappy with the default music player, so I checked out a number of them on F-Droid and settled on [Vanilla Music][28]. It has an easy-to-use interface and interacts well with my Bluetooth devices.

**OCReader**

### [coperheados_ocreader.png][8]

![OCReader](https://opensource.com/sites/default/files/u128651/coperheados_ocreader.png "OCReader")

I am a big fan of [Nextcloud][29], particularly [Nextcloud News][30], a replacement for the now-defunct [Google Reader][31]. While I can access my news feeds through a web browser, I really missed the ability to manage them through a dedicated app. Enter [OCReader][32]. While it stands for "ownCloud Reader," it works with Nextcloud, and I've had very few issues with it.

**Noise**

The SMS/MMS application of choice for most privacy advocates is [Signal][33] by [Open Whisper Systems][34]. Endorsed by [Edward Snowden][35], Signal allows for end-to-end encrypted messaging. If the person you are messaging is also on Signal, your messages will be sent, encrypted, over a data connection facilitated by centralized servers maintained by Open Whisper Systems. It also, until recently, relied on [Google Cloud Messaging][36] (GCM) for notifications, which requires Google Play Services.

The fact that Signal requires a centralized server bothered some people, so the default application on Copperhead is a fork of Signal called [Silence][37]. This application doesn't use a centralized server but does require that all parties be on Silence for encryption to work.

Well, no one I know uses Silence. At the moment you can't even get it from the Google Play Store in the U.S. due to a trademark issue, and there is no iOS client. An encrypted SMS client isn't very useful if you can't use it for encryption.

Enter [Noise][38]. Noise is another application maintained by Copperhead that is a fork of Signal that removes the need for GCM. While not available in the standard F-Droid repositories, Copperhead includes their own repository in the version of F-Droid they ship, which at the moment contains only the Noise application. This app will let you communicate securely with anyone else using Noise or Signal.

### F-Droid workarounds

**FFUpdater**

Copperhead ships with a hardened version of the Chromium web browser, but I am a Firefox fan. Unfortunately, [Firefox is no longer included][39] in the F-Droid repository. Apps on F-Droid are all built by the F-Droid maintainers, so the process for getting into F-Droid can be complicated. The [Compass app for OpenNMS][40] isn't in F-Droid because, at the moment, it does not support builds using the [Ionic Framework][41], which Compass uses.

Luckily, there is a simple workaround: Install the [FFUpdater][42] app on F-Droid. This allows me to install Firefox and keep it up to date through the browser itself.

**Amazon Appstore**

This brings me to a cool feature of Android 8, Oreo. In previous versions of Android, you had a single "known source" for software, usually the Google Play Store, and if you wanted to install software from another repository, you had to go to settings and allow "Install from Unknown Sources." I always had to remember to turn that off after an install to prevent malicious code from being able to install software on my device.

### [copperheados_sources.png][9]

![Allowing sources to install apps](https://opensource.com/sites/default/files/u128651/copperheados_sources.png "Allowing sources to install apps")

With Oreo, you can permanently allow a specified application to install applications. For example, I use some applications from the [Amazon Appstore][43] (such as the Amazon Shopping and Kindle apps). When I download and install the Amazon Appstore Android package (APK), I am prompted to allow the application to install apps and then I'm not asked again. Of course, this can be turned on and off on a per-application basis.

The Amazon Appstore has a number of useful apps, such as [IMDB][44] and [eBay][45]. Many of them don't require Google Services, but some do. For example, if I install the [Skype][46] app via Amazon, it starts up, but then complains about the operating system. The American Airlines app would start, then complain about an expired certificate. (I contacted them and was told they were no longer maintaining the version in the Amazon Appstore and it would be removed.) In any case, I can pretty simply install a couple of applications I like without using Google Play.

**Google Play**

Well, what about those apps you love that don't use Google Play Services but are only available through the Google Play Store? There is yet another way to safely get those apps on your Copperhead device.

This does require some technical expertise and another device. On the second device, install the [TWRP][47] recovery application. This is usually a key first step in installing any custom ROM, and TWRP is supported on a large number of devices. You will also need the Android Debug Bridge ([ADB][48]) application from the [Android SDK][49], which can be downloaded at no cost.

On the second device, use the Google Play Store to install the applications you want. Then, reboot into recovery. You can mount the system partition via TWRP; plug the device into a computer via a USB cable and you should be able to see it via ADB. There is a system directory called `/data/app`, and in it you will find all the APK files for your applications. Copy those you want to your computer (I use the ADB `pull`command and copy over the whole directory).

Disconnect that phone and connect your Copperhead device. Enable the "Transfer files" option, and you should see the storage directory mounted on your computer. Copy over the APK files for the applications you want, then install them via the Amaze file manager (just navigate to the APK file and click on it).

Note that you can do this for any application, and it might even be possible to install Google Play Services this way on Copperhead, but that kind of defeats the purpose. I use this mainly to get the [Electric Sheep][50] screensaver and a guitar tuning app I like called [Cleartune][51]. Be aware that if you install TWRP, especially on a Google Pixel, security updates may not work, as they'll expect the stock recovery. In this case you can always use [fastboot][52] to access TWRP, but leave the default recovery in place.

### Must-have apps without a workaround

Unfortunately, there are still a couple of Google apps I find it hard to live without. Google Maps is probably the main Google application I use, and yes, while I know I'm giving up my location to Google, it has saved hours of my life by routing me around traffic issues. [OpenStreetMap][53] has an app available via F-Droid, but it doesn't have the real-time information that makes Google Maps so useful. I also use Skype on occasion, usually when I am out of the country and have only a data connection (i.e., through a hotel WiFi network). It lets me call home and other places at a very affordable price.

My workaround is to carry two phones. I know this isn't an option for most people, but it is the only one I've found for now. I use my Copperhead phone for anything personal (email, contacts, calendars, pictures, etc.) and my "Googlephone" for Maps, Skype, and various games.

My dream would be for someone to perfect a hypervisor on a handset. Then I could run Copperhead and stock Google Android on the same device. I don't think anyone has a strong business reason to do it, but I do hope it happens.

### Devices that support Copperhead

Before you rush out to install Copperhead, there are some hurdles you'll have to jump. First, it is supported on only a [limited number of handsets][54], almost all of them late-model Google devices. The logic behind this is simple: Google tends to release Android security updates for its devices quickly, and I've found that Copperhead is able to follow suit within a day, if not within hours. Second, like any open source project, it has limited resources and it is difficult to support even a fraction of the devices now available to end users. Finally, if you want to run Copperhead on handsets like the Pixel and Pixel XL, you'll either have to build from source or [buy a device][55] from Copperhead directly.

When I discovered Copperhead, I had a Nexus 6P, which (along with the Nexus 5X) is one of the supported devices. This allowed me to play with and get used to the operating system. I liked it so much that I donated some money to the project, but I kind of balked at the price they were asking for Pixel and Pixel XL handsets.

Recently, though, I ended up purchasing a Pixel XL directly from Copperhead. There were a couple of reasons. One, since all of the code is available on GitHub, I set out to do [my own build][56] for a Pixel device. That process (which I never completed) made me appreciate the amount of work Copperhead puts into its project. Two, there was an article on [Slashdot][57] discussing how people were selling devices with Copperhead pre-installed and using Copperhead's update servers. I didn't appreciate that very much. Finally, I support FOSS not only by being a vocal user but also with my wallet.

### Putting the "libre" back into free

Another thing I love about FOSS is that I have options. There is even a new option to Copperhead being developed called [Eelo][58]. Created by [Gaël Duval][59], the developer of Mandrake Linux, this is a privacy-based Android operating system based on [LineageOS][60] (the descendant of CyanogenMod). While it should be supported on more handsets than Copperhead is, it is still in the development stage, and Copperhead is very stable and mature. I am eager to check it out, though.

For the year I've used CopperheadOS, I've never felt safer when using a mobile device to connect to a network. I've found the open source replacements for my old apps to be more than adequate, if not better than the original apps. I've also rediscovered the browser. Where I used to have around three to four tabs open, I now have around 10, because I've found that I usually don't need to install an app to easily access a site's content.

With companies like Google and Apple trying more and more to insinuate themselves into the lives of their users, it is nice to have an option that puts the "libre" back into free.


### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/balog_tarus_-_julian_-_square.jpg?itok=ZA6yem3I)][61] 
 
Tarus Balog - Having been kicked out of some of the best colleges and universities in the country, I managed after seven years to get a BSEE and entered the telecommunications industry. I always ended up working on projects where we were trying to get the phone switch to talk to PCs. This got me interested in the creation and management of large communication networks. So I moved into the data communications field (they were separate back then) and started working with commercial network management tools... [more about Tarus Balog][12][More about me][13]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/copperheados-delivers-mobile-freedom-privacy-and-security

作者：[Tarus Balog ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sortova
[1]:https://opensource.com/file/384496
[2]:https://opensource.com/file/384501
[3]:https://opensource.com/file/384506
[4]:https://opensource.com/file/384491
[5]:https://opensource.com/file/384486
[6]:https://opensource.com/file/384481
[7]:https://opensource.com/file/384476
[8]:https://opensource.com/file/384471
[9]:https://opensource.com/file/384466
[10]:https://opensource.com/article/18/1/copperheados-delivers-mobile-freedom-privacy-and-security?rate=P32BmRpJF5bYEYTHo4mW3Hp4XRk34Eq3QqMDf2oOGnw
[11]:https://copperhead.co/android/docs/building#redistribution
[12]:https://opensource.com/users/sortova
[13]:https://opensource.com/users/sortova
[14]:https://opensource.com/user/11447/feed
[15]:https://www.flickr.com/photos/mstable/17517955832
[16]:https://creativecommons.org/publicdomain/mark/1.0/
[17]:https://creativecommons.org/licenses/by-sa/4.0/
[18]:https://en.wikipedia.org/wiki/Android_(operating_system)#AOSP
[19]:https://copperhead.co/
[20]:https://copperhead.co/android/docs/technical_overview
[21]:https://en.wikipedia.org/wiki/Mobile_location_analytics
[22]:https://en.wikipedia.org/wiki/Google_Play#Compatibility
[23]:https://play.google.com/intl/en-us_us/about/play-terms.html
[24]:https://en.wikipedia.org/wiki/F-Droid
[25]:https://f-droid.org/en/packages/com.fsck.k9/
[26]:https://f-droid.org/en/packages/net.sourceforge.opencamera/
[27]:https://f-droid.org/en/packages/com.amaze.filemanager/
[28]:https://f-droid.org/en/packages/ch.blinkenlights.android.vanilla/
[29]:https://nextcloud.com/
[30]:https://github.com/nextcloud/news
[31]:https://en.wikipedia.org/wiki/Google_Reader
[32]:https://f-droid.org/packages/email.schaal.ocreader/
[33]:https://en.wikipedia.org/wiki/Signal_(software)
[34]:https://en.wikipedia.org/wiki/Open_Whisper_Systems
[35]:https://en.wikipedia.org/wiki/Edward_Snowden
[36]:https://en.wikipedia.org/wiki/Google_Cloud_Messaging
[37]:https://f-droid.org/en/packages/org.smssecure.smssecure/
[38]:https://github.com/copperhead/Noise
[39]:https://f-droid.org/wiki/page/org.mozilla.firefox
[40]:https://compass.opennms.io/
[41]:https://ionicframework.com/
[42]:https://f-droid.org/en/packages/de.marmaro.krt.ffupdater/
[43]:https://www.amazon.com/gp/feature.html?docId=1000626391
[44]:https://www.imdb.com/
[45]:https://www.ebay.com/
[46]:https://www.skype.com/
[47]:https://twrp.me/
[48]:https://en.wikipedia.org/wiki/Android_software_development#ADB
[49]:https://developer.android.com/studio/index.html
[50]:https://play.google.com/store/apps/details?id=com.spotworks.electricsheep&hl=en
[51]:https://play.google.com/store/apps/details?id=com.bitcount.cleartune&hl=en
[52]:https://en.wikipedia.org/wiki/Android_software_development#Fastboot
[53]:https://f-droid.org/packages/net.osmand.plus/
[54]:https://copperhead.co/android/downloads
[55]:https://copperhead.co/android/store
[56]:https://copperhead.co/android/docs/building
[57]:https://news.slashdot.org/story/17/11/12/024231/copperheados-fights-unlicensed-installations-on-nexus-phones
[58]:https://eelo.io/
[59]:https://en.wikipedia.org/wiki/Ga%C3%ABl_Duval
[60]:https://en.wikipedia.org/wiki/LineageOS
[61]:https://opensource.com/users/sortova
[62]:https://opensource.com/users/sortova
[63]:https://opensource.com/users/sortova
[64]:https://opensource.com/article/18/1/copperheados-delivers-mobile-freedom-privacy-and-security#comments
[65]:https://opensource.com/tags/mobile
[66]:https://opensource.com/tags/android