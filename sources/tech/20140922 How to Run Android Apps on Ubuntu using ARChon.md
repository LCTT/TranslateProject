Translating by GOLinux ...
How to Run Android Apps on Ubuntu using ARChon
================================================================================
![Android, Chrome, Ubuntu](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/android-ubuntu.jpg)

Android, Chrome, Ubuntu

**Google recently announced the first [set of Android apps available to run natively on Chrome OS][1], a feat made possible using a new ‘Android Runtime’ extension.**

Now, a developer has [figured out a way to bring Android Apps to Chrome][2] on the desktop.

[Vlad Filippov][3]‘s [chromeos-apk script][4] and [ARChon Android Runtime extension][5] work hand-in-hand to bring Android apps to Chrome on the Windows, Mac and Linux desktop.

![IMDB, Flipboard and Twitter Android Apps running on Ubuntu 14.04 LTS](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/android-apps-on-linux.jpg)

IMDB, Flipboard and Twitter Android Apps running on Ubuntu 14.04 LTS

Performance of apps through the runtime is not fantastic. Any ambitions of running Dead Trigger 2 or other graphically intensive games should be put to one side.

Similarly, being both an unofficial repackaging of the official runtime and running outside of Chrome OS, system integration (e.g., webcam, speakers, etc.) may be patchy or non-existent.

The guide that follows is provided as-is, and without any guarantees of success. It should be considered highly experimental, buggy, unstable – possibly even flat out evil. Try it out of curiosity rather than heightened expectation and you should be fine.

### How to Run Android Apps on Linux ###

To run Android apps on Linux through Chrome you will need, obviously, to install Chrome. Version 37 or higher is required. Honestly, if you’re going to be playing with a potentially unstable hack then you might as well download and [install the unstable version of Google Chrome for Linux, too][6].

Already got a version of Chrome installed? You can install the Dev Channel version via the command line by running:

    sudo apt-get install google-chrome-unstable

Next you need to download the custom-made — ergo officially not endorsed by Google or Chromium — Android Runtime created by Vlad Filippov. This differs from the official version in a number of ways, the chief being it can be used on desktop versions of the browser.

- [Download ARChon v1.0 from BitBucket][7]

Once the runtime has fully downloaded you will need to extract the contents from the .zip and move the resulting folder to your Home folder.

To install, open Google Chrome, click the hamburger menu and navigate through to the extensions page. Check ‘Enable developer mode’ and click on the ‘load unpacked extension’ button.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/chromeos-apk-extensions.jpg)

The Runtime alone doesn’t do much by itself so you will need to create a compatible package from an Android app. To do this you will need the ‘[chromeos-apk][8]’ [command line JavaScript utility][9], which is available to install through the Node Packaged Modules (npm) manager.

First run:

    sudo apt-get install npm nodejs nodejs-legacy

Ubuntu 64 user? You’ll want to grab the following library, too:

    sudo apt-get install lib32stdc++6

Now run the command to install the script itself:

    npm install -g chromeos-apk

Depending on your configuration you may need to need to run this latter command as sudo. If you’d prefer [not to install npm modules with sudo, you can][10] do so with some jiggery-pokery.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/chromeos-apk-npm.jpg)

Now you’re in the home straight. Head over to Google to find an APK of an app you want to try out, bearing in mind **not all Android apps will work**, and **those that do may be unstable** or lack features.

Place your wanted Android APK in ~/Home, then return to Terminal to convert it using the following command, replacing the APK name with the one you want:

    chromeos-apk replaceme.apk --archon

The command will take a few seconds to do its thing. Maybe have a blink. [Actually, don’t blink][11]. 

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/chromeos-apk-archon-750x184.jpg)

You now have an ARChon-rocking Chrome APK extension-y folder-y thing waiting in your Home folder. All that’s left to do is install it to see if it works!

Head back into the chrome://extensions page, tap the ‘load unpacked extension’ button once again but this time select the folder the script above created.

The app should proceed to install without issue, but will it run without issue? Open the Chrome App Launcher or Apps Page and launch it to find out.

#### Going Further ####

Since the ARChon runtime supports an unlimited number of Chromified APKs you can repeat the process as many times as you like. The Chrome APK [subreddit][12] is keeping track of success/failures, so if you’re feeling helpful be sure to post your findings there.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/09/install-android-apps-ubuntu-archon

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgchrome.com/first-4-chrome-android-apps-released/
[2]:http://www.omgchrome.com/run-android-apps-on-windows-mac-linux-archon/
[3]:https://github.com/vladikoff/
[4]:https://github.com/vladikoff/chromeos-apk
[5]:https://github.com/vladikoff/chromeos-apk/blob/master/archon.md
[6]:http://www.chromium.org/getting-involved/dev-channel
[7]:https://bitbucket.org/vladikoff/archon/get/v1.0.zip
[8]:https://github.com/vladikoff/chromeos-apk/blob/master/README.md
[9]:https://github.com/vladikoff/chromeos-apk/blob/master/README.md
[10]:http://stackoverflow.com/questions/19352976/npm-modules-wont-install-globally-without-sudo/21712034#21712034
[11]:https://www.youtube.com/watch?v=jKXLkWrBo7o
[12]:http://www.reddit.com/r/chromeapks
