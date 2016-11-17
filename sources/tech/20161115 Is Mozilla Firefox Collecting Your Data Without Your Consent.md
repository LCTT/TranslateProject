Is Mozilla Firefox Collecting Your Data Without Your Consent?
============================================================

 ![Mozilla Firefox collects your data](https://iwf1.com/wordpress/wp-content/uploads/2016/11/Mozilla-Firefox-collects-your-data-730x429.jpg)


A geolocation service packaged with Firefox web-browser is running in the background even while the latter is closed.

We’ve still not fully recovered from the news about the scandalous browser add-on which meant to protect users privacy but instead **[sells their information to third-party companies][1]**, and already we are perhaps in front of another, much bigger in scale, new outrage.

**MLS** is Mozilla Location Service which lets devices determine their location based on network infrastructure like WiFi access points, cell towers and Bluetooth beacons.

Pretty much, it is Mozilla’s equivalent to Google Location Service which is the service used when you turn on your GPS on Android devices and opt for ‘High accuracy’ mode.

Those of you who ever experienced GPS issues will probably know to appreciate how accurate this mode actually is.

But besides being able to accurately pinpoint your location, another side of it is that the service, through the use of WiFi networks, is able to collect personally identifiable information of both the **users who knowingly contribute to the database** and the **owners of the WiFi devices being scanned**.

That being said, Mozilla also mentions you can opt out from the service, but can you really?

### When The Background Becomes Your Privacy Foreground

Being a [crowdsource][2] project, in order to maintain and grow MLS, Mozilla is in fact dependent of users contributions, thus they’ve developed a number of ways through which users can participate.

One of these ways, meant to be used by end users is a Android app called Stumbler:

> “Mozilla Stumbler is an open-source wireless network scanner which collects GPS, cellular and wireless network metadata for our crowd-sourced location database.”[1]

Yet Stumbler is not only a standalone app but also a service used by Firefox for Android “to contribute data and enhance” MLS.

The problem with that service lies in the fact it runs in the background without most users are aware of it and **even though you may disable it**.

According to Mozilla[1], to enable the service you need to open the Settings menu (in Firefox for Android) -> Open the Privacy section -> scroll to the bottom to see the Data Choices, and finally, Check the Mozilla Location Service box.

[
 ![Mozilla Location Services is unchecked yet Stumbler is on](http://iwf1.com/wordpress/wp-content/uploads/2016/11/Mozilla-Location-Services-is-unchecked-yet-Stumler-is-on-730x602.jpg) 
][3]

Mozilla Location Services is unchecked yet Stumbler is on

In reality, you’ll find that the Stumbler service is **actively running on your device in the background**, meaning it’s practically invisible because it has no interface, even though the MLS box is unchecked and furthermore, even if all the Data Choices check boxes are unchecked and Firefox browser itself is closed.

Apparently, the only way to stop stumbler is by ending it directly, however to do so, you’ll first need a way to detect it’s running and ultimately, that’s just a temporary solution that only lasts until the device’s next reboot.

### How To Stay Safer?

In order to exempt yourself from MLS data collection, there are still a few methods you may practice, in the hope those wouldn’t be disregarded by Mozilla just like the MLS check box in Firefox for Android.

Make your wireless network hidden or add the string “_nomap” to the end of its name, e.g “myWirelessNetwork” becomes “myWirelessNetwork_nomap”. This should signal Mozilla’s applications that you do not wish to participate in their data collection.

As for the Stumbler service on Android, due to being a service (as opposed to a process), you’ll probably won’t be able to see it in the list of running processes / recent apps. Thus, either use a dedicated app to close it or enable “Developer Options” and go to “Running services” -> tap on Firefox and finally, stop “stumbler”.



--------------------------------------------------------------------------------

via: https://iwf1.com/is-mozilla-firefox-collecting-your-data-without-your-consent/

作者：[Liron][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://iwf1.com/is-mozilla-firefox-collecting-your-data-without-your-consent/
[1]:https://iwf1.com/shock-this-popular-browser-add-on-sells-your-browsing-history/
[2]:https://en.wikipedia.org/wiki/Crowdsourcing
[3]:http://iwf1.com/wordpress/wp-content/uploads/2016/11/Mozilla-Location-Services-is-unchecked-yet-Stumler-is-on.jpg
