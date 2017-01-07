### Android 6.0 Marshmallow

In October 2015, Google brought Android 6.0 Marshmallow into the world. For the OS's launch, Google commissioned two new Nexus devices: the [Huawei Nexus 6P and LG Nexus 5X][39]. Rather than just the usual speed increase, the new phones also included a key piece of hardware: a fingerprint reader for Marshmallow's new fingerprint API. Marshmallow was also packing a crazy new search feature called "Google Now on Tap," user controlled app permissions, a new data backup system, and plenty of other refinements.

#### The new Google App



*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/32-1-150x150.jpg) 
    ][3]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/app-drawer-150x150.jpg) 
    ][4]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/2015-10-01-19.01.201-150x150.png) 
    ][5]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/Untitled-3-150x150.gif) 
    ][6]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/google-now-home-150x150.jpg) 
    ][7]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/typing-150x150.jpg) 
    ][8]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/serp-150x150.jpg) 
    ][9]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/voice-150x150.jpg) 
    ][10]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/icons-150x150.jpg) 
    ][11]

Marshmallow was the first version of Android after [Google's big logo redesign][40]. The OS was updated accordingly, mainly with a new Google app that added a colorful logo to the search widget, search page, and the app icon.

Google reverted the app drawer from a paginated horizontal layout back to the single, vertically scrolling sheet. The earliest versions of Android all had vertically scrolling sheets until Google changed to a horizontal page system in Honeycomb. The scrolling single sheet made finding things in a large selection of apps much faster. A "quick scroll" feature, which let you drag on the scroll bar to bring up letter indexing, helped too. This new app drawer layout also carried over to the widget drawer. Given that the old system could easily grow to 15+ pages, this was a big improvement.

The "suggested apps" bar at the top of Marshmallow's app drawer made finding apps faster, too.
This bar changed from time to time and tried to surface the apps you needed when you needed them. It used an algorithm that took into account app usage, apps that are normally launched together, and time of day.

#### Google Now on Tap—a feature that didn't quite work out



*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/ontap-150x150.jpg) 
    ][12]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/onta3p-150x150.jpg) 
    ][13]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/now-on-tap-150x150.jpg) 
    ][14]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/fail1-150x150.jpg) 
    ][15]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/youtube-150x150.jpg) 
    ][16]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/apps-150x150.jpg) 
    ][17]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/fail2-150x150.jpg) 
    ][18]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/hangouts-150x150.jpg) 
    ][19]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/voice-context-150x150.jpg) 
    ][20]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/wrongstephen-150x150.jpg) 
    ][21]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/assist-api-980x576-150x150.jpg) 
    ][22]

One of Marshmallow's headline features was "Google Now on Tap." With Now on Tap, you could hold down the home button on any screen and Android would send the entire screen to Google for processing. Google would then try to figure out what the screen was about, and a special list of search results would pop up from the bottom of the screen.

Results yielded by Now on Tap weren't the usual 10 blue links—though there was always a link to a Google Search. Now on Tap could also deep link into other apps using Google's App Indexing feature. The idea was you could call up Now on Tap for a YouTube music video and get a link to the Google Play or Amazon "buy" page. Now on Tapping (am I allowed to verb that?) a news article about an actor could link to his page inside the IMDb app.

Rather than make this a proprietary feature, Google built a whole new "Assistant API" into Android. The user could pick an "Assist App" which would be granted scads of information upon long-pressing the home button. The Assist app would get all the text that was currently loaded by the app—not just what was immediately on screen—along with all the images and any special metadata the developer wanted to include. This API powered Google Now on Tap, and it also allowed third parties to make Now on Tap rivals if they wished.

Google hyped Now on Tap during Marshmallow's initial presentation, but in practice, the feature wasn't very useful. Google Search is worthwhile because you're asking it an exact question—you type in whatever you want, and it scours the entire Internet looking for the answer or web page. Now on Tap made things infinitely harder because it didn't even know what question you were asking. You opened Now on Tap with a very specific intent, but you sent Google the very unspecific query of "everything on your screen." Google had to guess what your query was and then tried to deliver useful search results or actions based on that.

Behind the scenes, Google was probably processing like crazy to brute-force out the result you wanted from an entire page of text and images. But more often than not, Now on Tap yielded what felt like a list of search results for every proper noun on the page. Sifting through the list of results for multiple queries was like being trapped in one of those Bing "[Search Overload][41]" commercials. The lack of any kind of query targeting made Now on Tap feel like you were asking Google to read your mind, and it never could. Google eventually patched in an "Assist" button to the text selection menu, giving Now on Tap some of the query targeting that it desperately needed.

Calling Now on Tap anything other than a failure is hard. The shortcut to access Now on Tap—long pressing on the home button—basically made it a hidden, hard-to-discover feature that was easy to forget about. We speculate the feature had extremely low usage numbers. Even when users did discover Now on Tap, it failed to read your mind so often that, after a few attempts, most users probably gave up on it.

With the launch of the Google Pixels in 2016, the company seemingly admitted defeat. It renamed Now on Tap "Screen Search" and demoted it in favor of the Google Assistant. The Assistant—Google's new voice command system—took over On Tap's home button gesture and related it to a second gesture once the voice system was activated. Google also seems to have learned from Now on Tap's poor discoverability. With the Assistant, Google added a set of animated colored dots to the home button that helped users discover and be reminded about the feature.

#### Permissions


*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/33-1-150x150.jpg) 
    ][23]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/34-1-150x150.jpg) 
    ][24]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/perm-150x150.jpg) 
    ][25]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/denied-1-150x150.jpg) 
    ][26]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/denied-2-150x150.jpg) 
    ][27]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/apps-150x150.jpg) 
    ][28]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/overlay-150x150.jpg) 
    ][29]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/system-permisions-150x150.jpg) 
    ][30]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/warning-150x150.jpg) 
    ][31]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/Google_IO_2015_-_Android_M_Permissions_-_YouTube_-_Google_Chrome_2015-09-04_12-31-49-150x150.jpg) 
    ][32]

Android 6.0 finally introduced an app permissions system that gave users granular control over what data apps had access to.

Apps no longer gave you a huge list of permissions at install. With Marshmallow, apps installed without asking for any permissions at all. When apps needed a permission—like access to your location, camera, microphone, or contact list—they asked at the exact time they needed it. During your usage of an app, an "Allow or Deny" dialog popped up anytime the app wanted a new permission. Some app setup flow tackled this by asking for a few key permissions at startup, and everything else popped up as the app needed it. This better communicated to the user what the permissions are for—this app needs camera access because you just tapped on the camera button.

Besides the in-the-moment "Allow or Deny" dialogs, Marshmallow also added a permissions setting screen. This big list of checkboxes allowed data-conscious users to browse which apps have access to what permissions. They can browse not only by app, but also by permission. For instance, you could see every app that has access to the microphone.

Google had been experimenting with app permissions for some time, and these screens were basically the rebirth of the hidden "[App Ops][42]" system that was accidentally introduced in Android 4.3 and quickly removed.

While Google experimented in previous versions, the big difference with Marshmallow's permissions system was that it represented an orderly transition to a permission OS. Android 4.3's App Ops was never meant to be exposed to users, so developers didn't know about it. The result of denying an app a permission in 4.3 was often a weird error message or an outright crash. Marshmallow's system was opt-in for developers—the new permission system only applied to apps that were targeting the Marshmallow SDK, which Google used as a signal that the developer was ready for permission handling. The system also allowed for communication to users when a feature didn't work because of a denied permission. Apps were told when they were denied a permission, and they could instruct the user to turn the permission back on if you wanted to use a feature.

#### The Fingerprint API



*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/finger1-150x150.jpg) 
    ][33]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/fingerlock-150x150.jpg) 
    ][34]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/2015-10-16-17.19.36-150x150.png) 
    ][35]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/fingerprintplaystore-150x150.jpg) 
    ][36]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/confirm-150x150.jpg) 
    ][37]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/2015-09-04_16-38-31-150x150.png) 
    ][38]

Before Marshmallow, few OEMs had come up with their own fingerprint solution in response to [Apple's Touch ID][43]. But with Marshmallow, Google finally came up with an ecosystem-wide API for fingerprint recognition. The new system included UI for registering fingerprints, a fingerprint-guarded lock screen, and APIs that allowed apps to protect content behind a fingerprint scan or lock-screen challenge.

The Play Store was one of the first apps to support the API. Instead of having to enter your password to purchase an app, you could just use your fingerprint. The Nexus 5X and 6P were the first phones to support the fingerprint API with an actual hardware fingerprint reader on the back.

Later the fingerprint API became one of the rare examples of the Android ecosystem actually cooperating and working together. Every phone with a fingerprint reader uses Google's API, and most banking and purchasing apps are pretty good about supporting it.

--------------------------------------------------------------------------------

作者简介：

Ron is the Reviews Editor at Ars Technica, where he specializes in Android OS and Google products. He is always on the hunt for a new gadget and loves to rip things apart to see how they work.

--------------------------------------------------------------------------------

via: http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/

作者：[RON AMADEO][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://arstechnica.com/author/ronamadeo
[1]:https://www.youtube.com/watch?v=f17qe9vZ8RM
[2]:https://www.youtube.com/watch?v=VOn7VrTRlA4&list=PLOU2XLYxmsIJDPXCTt5TLDu67271PruEk&index=11
[3]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[4]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[5]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[6]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[7]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[8]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[9]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[10]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[11]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[12]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[13]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[14]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[15]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[16]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[17]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[18]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[19]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[20]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[21]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[22]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[23]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[24]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[25]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[26]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[27]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[28]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[29]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[30]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[31]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[32]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[33]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[34]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[35]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[36]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[37]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[38]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[39]:http://arstechnica.com/gadgets/2015/10/nexus-5x-and-nexus-6p-review-the-true-flagships-of-the-android-ecosystem/
[40]:http://arstechnica.com/gadgets/2015/09/google-gets-a-new-logo/
[41]:https://www.youtube.com/watch?v=9yfMVbaehOE
[42]:http://www.androidpolice.com/2013/07/25/app-ops-android-4-3s-hidden-app-permission-manager-control-permissions-for-individual-apps/
[43]:http://arstechnica.com/apple/2014/09/ios-8-thoroughly-reviewed/10/#h3
