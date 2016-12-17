The (updated) history of Android
============================================================

### Follow the endless iterations from Android 0.5 to Android 7 and beyond.


Google Search was literally everywhere in Lollipop. A new "always-on voice recognition" feature allowed users to say "OK Google" at any time, from any screen, even when the display was off. The Google app was still Google's primary home screen, a feature which debuted in KitKat. The search bar was now present on the new recent apps screen, too.

Google Now was still the left-most home screen page, but now a Material Design revamp gave it headers with big bold colors and redesigned typography.

*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/play-store-1-150x150.jpg) 
    ][1]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/play2-150x150.jpg) 
    ][2]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/6-150x150.jpg) 
    ][3]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/5-150x150.jpg) 
    ][4]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/12-2-150x150.jpg) 
    ][5]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/14-1-150x150.jpg) 
    ][6]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/19-1-150x150.jpg) 
    ][7]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/13-2-150x150.jpg) 
    ][8]

The Play Store followed a similar path to other Lollipop apps. There was a huge visual refresh with bold colors, new typography, and a fresh layout. It's rare that there's any additional functionality here, just a new coat of paint on everything.

The Navigation panel for the Play Store could now actually be used for navigation, with entries for each section of the Play Store. Lollipop also typically did away with the overflow button in the action bar, instead deciding to go with a single action button (usually search) and dumping every extra option in the navigation bar. This gave users a single place to look for items instead of having to hunt through two different menus.

Also new in Lollipop apps was the ability to make the status bar transparent. This allowed the action bar color to bleed right through the status bar, making the bar only slightly darker than the surrounding UI. Some interfaces even used a full-bleed hero image at the top of the screen, which would show through the status bar.

[
 ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/2-1-980x481.jpg) 
][38]


Google Calendar was completely re-written, gaining lots of new design touches and losing lots of features. You could no longer pinch zoom to adjust the time scale of views, month view was gone on phones, and week view regressed from a seven-day view to five days. Google would spend the next few versions re-adding some of these features after users complained. "Google Calendar" also doubled down on the "Google" by removing the ability to add third-party accounts directly in the app. Non-Google accounts would now need to be added via Gmail.

It did look nice, though. In some views, the start of each month came with a header picture, just like a real paper calendar. Events with locations attached showed pictures from those locations. For instance, my "flight to San Francisco" displayed the Golden Gate Bridge. Google Calendar would also pull events out of Gmail and display them right on your calendar.

*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/7-150x150.jpg) 
    ][9]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/8-150x150.jpg) 
    ][10]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/12-150x150.jpg) 
    ][11]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/13-150x150.jpg) 
    ][12]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/3-1-150x150.jpg) 
    ][13]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/14-150x150.jpg) 
    ][14]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/6-2-150x150.jpg) 
    ][15]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/5-3-150x150.jpg) 
    ][16]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/7-2-150x150.jpg) 
    ][17]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/9-1-150x150.jpg) 
    ][18]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/10-1-150x150.jpg) 
    ][19]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/28-1-150x150.jpg) 
    ][20]

Other apps all fell under pretty much the same description: not much in the way of new functionality, but big redesigns swapped out the greys of KitKat with bold, bright colors. Hangouts gained the ability to receive Google Voice SMSes, and the clock got a background color that changes with the time of day.

#### Job Scheduler whips the app ecosystem into shape

Google decided to focus on battery savings with Lollipop in a project it called "Project Volta." Google started creating more battery tracking tools for itself and developers, starting with the "Battery Historian." This python script took all of Android's battery logging data and spun it into a readable, interactive graph. With its new diagnostic equipment, Google flagged background tasks as a big consumer of battery.

At I/O 2014, the company noted that enabling airplane mode and turning off the screen allowed an Android phone to run in standby for a month. However, if users enabled everything and started using the device, they wouldn't get through a single day. The takeaway was that if you could just get everything to stop doing stuff, your battery would do a lot better.

As such, the company created a new API called "JobScheduler," the new traffic cop for background tasks on Android. Before Job Scheduler, every single app was responsible for its background processing, which meant every app would individually wake up the processor and modem, check for connectivity, organize databases, download updates, and upload logs. Everything had its own individual timer, so your phone would be woken up a lot. With JobScheduler, background tasks get batched up from an unorganized free-for-all into an orderly background processing window.

JobScheduler lets apps specify conditions that their task needs (general connectivity, Wi-Fi, plugged into a wall outlet, etc), and it will send an announcement when those conditions are met. It's like the difference between push e-mail and checking for e-mail every five minutes... but with task requirements. Google also started pushing a "lazier" approach to background tasks. If something can wait until the device is on Wi-Fi, plugged-in, and idle, it should wait until then. You can see the results of this today when, on Wi-Fi, you can plug in an Android phone and only _then_ will it start downloading app updates. You don't instantly need to download app updates; it's best to wait until the user has unlimited power and data.

#### Device setup gets future-proofed

*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/25-1-150x150.jpg) 
    ][21]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/26-150x150.jpg) 
    ][22]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2014/10/setup2-150x150.jpg) 
    ][23]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2014/10/setup3-150x150.jpg) 
    ][24]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2014/10/setup4-150x150.jpg) 
    ][25]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2014/10/setup5-150x150.jpg) 
    ][26]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2014/10/setup6-150x150.png) 
    ][27]

Setup was overhauled to not just confirm to the Material Design guidelines, but it was also "future-proofed" so that it can handle any new login and authentication schemes Google cooks up in the future. Remember, part of the entire reasoning for writing "The History of Android" is that older versions of Android don't work anymore. Over the years, Google has upgraded its authentication schemes to use better encryption and two-factor authentication, but adding these new login requirements breaks compatibility with older clients. Lots of Android features require access to Google's cloud infrastructure, so when you can't log in, things like Gmail for Android 1.0 just don't work.

In Lollipop, setup works much like it did before for the first few screens. You get a "welcome to Android screen" and options to set up cellular and Wi-Fi connectivity. Immediately after this screen, things changed though. As soon as Lollipop hit the internet, it pinged Google's servers to "check for updates." These weren't updates to the OS or to apps, but updates to the setup process about to run. After Android downloaded the newest version of setup, _then_ it asked you to log in with your Google account.

The benefit of this is evident when trying to log into Lollipop and Kitkat today. Thanks to the updatable setup flow, the "2014" Lollipop OS can handle 2016 improvements, like Google's new "[tap to sign in][39]" 2FA method. KitKat chokes, but luckily it has a "web-browser sign-in" that can handle 2FA.

Lollipop setup even takes the extreme stance of putting your Google e-mail and password on separate pages. [Google hates passwords][40] and has come up with several [experimental ways][41] to log into Google without one. If your account is setup to not have a password, Lollipop can just skip the password page. If you have a 2FA setup that uses a code, setup can slip the appropriate "enter 2FA code" page into the setup flow. Every piece of signing in is on a single page, so the setup flow is modular. Pages can be added and removed as needed.

Setup also gave users control over app restoration. Android was doing some kind of data restoration previously to this, but it was impossible to understand because it just picked one of your devices without any user input and started restoring things. A new screen in the setup flow let users see their collection of device profiles in the cloud and pick the appropriate one. You could also choose which apps to restore from that backup. This backup was apps, your home screen layout, and a few minor settings like Wi-Fi hotspots. It wasn't a full app data backup.

#### Settings


*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/29-1-150x150.jpg) 
    ][28]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/settings-1-150x150.jpg) 
    ][29]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/2014-11-11-16.45.47-150x150.png) 
    ][30]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/battery-150x150.jpg) 
    ][31]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2014/11/user1-150x150.jpg) 
    ][32]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2014/11/users2-150x150.jpg) 
    ][33]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/30-1-150x150.jpg) 
    ][34]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/31-150x150.jpg) 
    ][35]

Setting swapped from a dark theme to a light one. Along with a new look, it got a handy search function. Every screen gave the user access to a magnifying glass, which let them more easily hunt down that elusive option.

There were a few settings related to Project Volta. "Network Restrictions" allowed users to flag a Wi-Fi connection as metered, which would allow JobScheduler to avoid it for background processing. Also as part of Volta, a "Battery Saver" mode was added. This would limit background tasks and throttle down the CPU, which gave you a long lasting but very sluggish device.

Multi-user support has been in Android tablets for a while, but Lollipop finally brought it down to Android phones. The settings screen added a new "users" page that let you add additional account or start up a "Guest" account. Guest accounts were temporary—they could be wiped out with a single tap. And unlike a normal account, it didn't try to download every app associated with your account, since it was destined to be wiped out soon.

--------------------------------------------------------------------------------

作者简介：

Ron is the Reviews Editor at Ars Technica, where he specializes in Android OS and Google products. He is always on the hunt for a new gadget and loves to rip things apart to see how they work.

--------------------------------------------------------------------------------

via: http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/

作者：[RON AMADEO][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://arstechnica.com/author/ronamadeo
[1]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[2]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[3]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[4]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[5]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[6]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[7]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[8]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[9]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[10]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[11]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[12]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[13]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[14]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[15]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[16]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[17]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[18]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[19]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[20]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[21]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[22]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[23]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[24]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[25]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[26]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[27]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[28]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[29]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[30]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[31]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[32]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[33]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[34]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[35]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/29/#
[36]:https://cdn.arstechnica.net/wp-content/uploads/2016/10/2-1.jpg
[37]:http://arstechnica.com/author/ronamadeo/
[38]:https://cdn.arstechnica.net/wp-content/uploads/2016/10/2-1.jpg
[39]:http://arstechnica.com/gadgets/2016/06/googles-new-two-factor-authentication-system-tap-yes-to-log-in/
[40]:https://www.theguardian.com/technology/2016/may/24/google-passwords-android
[41]:http://www.androidpolice.com/2015/12/22/google-appears-to-be-testing-a-new-way-to-log-into-your-account-on-other-devices-with-just-your-phone-no-password-needed/
