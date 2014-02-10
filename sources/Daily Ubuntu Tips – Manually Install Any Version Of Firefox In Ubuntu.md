Daily Ubuntu Tips – Manually Install Any Version Of Firefox In Ubuntu
================================================================================
Firefox is the primary web browser in Ubuntu. It comes pre-installed and added to Ubuntu default software repositories which get updated with the latest version of Firefox automatically.

Most people won’t worry about installing or messing with Firefox because there’s nothing to do. It’s already installed and ready to use. The version of Firefox in Ubuntu’s repositories is what you’ll always get unless Canonical updates its software repositories with the latest versions.

Now, if you want to try other versions or Firefox, you’ll have to manually download and install it in Ubuntu, and this brief tutorial is going to show you how to do it properly in Ubuntu.

Because Firefox is so integrated in Ubuntu, if you try to completely remove it, you’ll probably break other things. So the best way to install other versions is to create a separate in folder for each version and symbolically link it.

### Downloading and installing Firefox in Ubuntu ###

So, here’s it. If you want to manually download the latest version of Firefox in Ubuntu, go to its [download page][1]. From there you’ll be able to get the latest version and install it.

If you wish to install other versions of Firefox starting with the initial release, [visit this page][2].  There you’ll see every version ever released beginning with version 0.8.

After downloading the version you wish to install, change to the Downloads folder of your home directory because that’s where most files get downloaded in Ubuntu.

    cd ~/Downloads

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/firefoxmanualinstall.png)

### Configuring Firefox ###

Since most Firefox Linux downloads get wrapped inside a .tar and bz2 archives, you must extract the files from these archives. There are many ways to extract files from archives in Ubuntu.

The one I used here is the command below. It extracts the file from both .tar and .bz2 archives easily.

    tar -xjf firefox*.tar.bz2

After the extractions, there’s will be a new Firefox folder in your Downloads folder. That’s the folder which contains all the Firefox files and executables.

Since we don’t want to remove the current Firefox installation, we must create a separate folder each version of Firefox. So, for Firefox version 30, create a folder in the /opt directory with the new content of Firefox using the commands below.

    sudo mv firefox/ /opt/firefox30

Now, **/opt/firefox30/** directory contains all the files for version 30. 

### Create a symbolic link to the new Firefox executable ###

By default, Firefox executable file lives in this location: **/user/bin/firefox**.  What we want to do is temporary create a backup so we can use our custom installed executable.

To do that, run the commands below.

    sudo mv /usr/bin/firefox /usr/bin/firefox-old

Now that we’ve move Firefox executable file from its default location, we must link the default location to our new custom installed file. To do that, run the commands below to create a symbolic link to our version 30 install.

    sudo ln -s /opt/firefox30/firefox /usr/bin/firefox

We’re set. Now our custom installed Firefox is the default in Ubuntu. Every time you launch Firefox, it will pull from the new executable we linked earlier.

Enjoy!

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/firefoxmanualinstall1.png)

This is also a great way to install 64-bit edition of Firefox.+

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/02/daily-ubuntu-tips-manually-install-any-version-of-firefox-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.mozilla.org/en-US/firefox/all/
[2]:https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/