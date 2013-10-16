Daily Ubuntu Tips – How To Install Google Chrome Browser
================================================================================
For new users who are just starting out with Ubuntu and want to install Google Chrome browser, here’s the quickest way to do it. There are many ways to install Google Chrome in Ubuntu. Some prefer going directly to [Google Chrome download page][1] and getting the **deb** installer.

Others prefer to install it via PPA from the Chromium build. I prefer downloading it via the command line using **wget** command and installing it. The command line method is the quickest and this is what this post is about to show you.

As you may already know, Google Chrome has gone from nothing to one of the most popular web browsers. In fact, it’s my favorite web browser.  I started with Internet Explorer, then moved to Firefox and I’ve finally switched to Google Chrome.

I am not telling you to switch, but if you want Chrome in Ubuntu, then go and get it.

To get started with Chrome, you have few options. First you can use Firefox and go to [Chrome download page][1] and download a copy there. If you’re not comfortable with using the command line, you may want to use this method.

For users who are comfortable using the command line console, use the commands below to download Google Chrome.

    cd /tmp

For the **32-bit** version of Google Chrome, use the link below.

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

The 64-bit version can be downloaded using this link.

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

After downloading it, run the commands below to install it.

    sudo dpkg -i google-chrome*; sudo apt-get -f install

That’s it! After installing, go to Unity Dash and search for Chrome and launch it.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-install-google-chrome-browser/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:https://www.google.com/intl/en/chrome/browser/#eula