Enjoy Android Apps on Ubuntu using ARChon Runtime
================================================================================
Before, we gave try to many android app emulating tools like Genymotion, Virtualbox, Android SDK, etc to try to run android apps on it. But, with this new Chrome Android Runtime, we are able to run Android Apps on our Chrome Browser. So, here are the steps we'll need to follow to install Android Apps on Ubuntu using ARChon Runtime.

Google had [announced the first set of Android apps is ready to run natively on Chrome OS][1], a feature made possible using a new ‘**Android Runtime**’ extension. Now, a developer named Vlad Filippov has figured out a way to bring Android Apps to Chrome on the desktop. His chromeos-apk script and ARChon Android Runtime extension work hand-in-hand to bring Android apps to Chrome browser on the Windows, Mac and Linux desktop.

Performance of this apps through the runtime is not pretty good. Similarly, as its both an unofficial repackaging of the official runtime and running outside of Google's Chrome OS, system integration like webcam, speakers, etc. may be patchy or non-existent.

### Installing Chrome ###

First of all, we'll need Chrome installed in our machine, Chrome version 37 or higher is required. We can download them from the [download page of Chrome Browser][2].

If you wanna install a Dev Channel version you'll need to follow below procedure.

We'll need to add repository source list for Google Chrome which can be done my using the following command.

    $ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    $ sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

![Adding google source list](http://blog.linoxide.com/wp-content/uploads/2015/02/adding-google-source-list.png)

After adding the repository source list, we'll need to update the local repository index by the command below.

    $ sudo apt-get update

Now, we'll gonna install google chrome unstable which is dev version.

    $ sudo apt-get install google-chrome-unstable

![Installing Google chrome unstable](http://blog.linoxide.com/wp-content/uploads/2015/02/installing-google-chrome-unstable.png)

### Installing Archon Runtime ###

Next we'll need to download the custom-made ergo officially not endorsed by Google or Chromium Android Runtime created by Vlad Filippov. This differs from the official version in a number of ways, the chief being it can be used on desktop versions of the browser. Here below is the runtime we need to download, please select anyone of the following according to your bit of Ubuntu installed.

For **32-bit** Ubuntu Distributions:

- [Download Archron for 32-bit Ubuntu][3]

For **64-bit** Ubuntu Distributions:

- [Download Archron for 64-bit Ubuntu][4]

Once the runtime has fully downloaded you will need to extract the contents from the .zip files and move the resulting directory to Home. Here is the gist commands for this steps to download and extract the contents.

    $ wget https://github.com/vladikoff/chromeos-apk/releases/download/v3.0.0/ARChon-v1.1-x86_32.zip

![Downloading ARChon](http://blog.linoxide.com/wp-content/uploads/2015/02/download-archon.png)

    $ unzip ARChon-v1.1-x86_32.zip ~/

Now to install the runtime, we'll gonna Open our latest Google Chrome and goto the url **chrome://extensions/** then, we'll need to check ‘**Enable developer mode**’. Finally, we'll gonna click on the ‘**load unpacked extension**’ button and select the folder which was placed into **~/Home**. 

### Installing ChromeOS-APK ###

To convert APKs manually is something you really don’t need to do any more if you use one of the apps mentioned above — you will need to install the ‘[chromeos-apk][5]’ command line JavaScript utility. This is available to install through the Node Packaged Modules (npm) manager. To install nmp and chromeos-apk, we'll need to run the following command in a shell or terminal.

    $ sudo apt-get install npm nodejs nodejs-legacy

**If you are running 64 bit OS**, you should grab the following library, to do so run the below commands in a shell or terminal.

    $ sudo apt-get install lib32stdc++6

Now run the command to install the the latest chromeos-apk is:

    $ npm install -g chromeos-apk@latest

![chromeos apk installation](http://blog.linoxide.com/wp-content/uploads/2015/02/chomeos-apk-installation.png)

Depending on your system configuration you may need to need to run this latter command as sudo.

Now, we'll gonna for Google to find an APK of an app to give it a try, bearing in mind **not all Android apps will work**, and those that do may be unstable or lack features. Most of the messenger out of the box are not working.

### Converting APK ###

Place your **Android APK in ~/Home**, then return to **Terminal** to convert it using the following command:

    $ chromeos-apk myapp.apk --archon

If you want the app in fullscreen mode then run the following instead:

    $ chromeos-apk myapp.apk --archon --tablet

Note: Please replace myapp.apk to the Android APK app filename you want to convert.

For our ease, we can also use [Twerk][6] for the conversion process if we want to skip this step.

### Running Android Apk ###

Finally, we'll need to open our chrome browser and then goto chrome://extensions page and enable developer mode then tap the ‘load unpacked extension’ button and select the folder the script above created.

Now, we can Open the Chrome App Launcher to run it.

### Conclusion ###

Hurray! We have successfully installed Android Apk App in our favorite desktop browser ie Chrome Browser. This article is all about the popular Chrome Android Runtime called Archon created by Vlad Filippov. This runtime allows us to run converted Apk files in our Chrome browser. It has not yet supported messaging apps like Whatsapp, etc. So, if you have any questions, suggestions, feedback please write them in the comment box below. Thank you ! Enjoy Archon :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/android-apps-ubuntu-archon-runtime/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://chrome.blogspot.com/2014/09/first-set-of-android-apps-coming-to.html
[2]:https://www.google.com/chrome/browser
[3]:https://github.com/vladikoff/chromeos-apk/releases/download/v3.0.0/ARChon-v1.1-x86_32.zip
[4]:https://github.com/vladikoff/chromeos-apk/releases/download/v3.0.0/ARChon-v1.1-x86_64.zip
[5]:https://github.com/vladikoff/chromeos-apk/blob/master/README.md
[6]:https://chrome.google.com/webstore/detail/twerk/jhdnjmjhmfihbfjdgmnappnoaehnhiaf