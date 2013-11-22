 翻译中 by Linux-pdz
Daily Ubuntu Tips – Get Geary, A Lightweight Email Reader In Ubuntu
================================================================================
As you may already know, Ubuntu comes with its own email client called Thunderbird that allows you to setup email accounts to send and receive emails. It also support IMAP protocol which services like Gmail, Yahoo Mail and Microsoft Outlook support.

Thunderbird is a great email client and does everything an email client supposed to do, but if you’re looking for an alternative that is lightweight and built around GNOME, then you may want to try Geary.

Geary  is a free email program that lets you quickly and effortlessly read emails with a simple interface based around conversations. The entire discuss is read from a single pane without you having to click from one message to another.

Geary also support IMAP protocol which will let you send and receive emails using your online webmail accounts from Google, Yahoo and Microsoft.

For users with Ubuntu 13.10, Geary is already available from Ubuntu Software Center. All they have to do is run the commands below to install Geary.

    sudo apt-get install geary

For previous versions of Ubuntu, press **Ctrl – Alt – T** on your keyboard to open the terminal. When opens, run the commands below to add its PPA repository.

    sudo add-apt-repository ppa:yorba/ppa

Next, run the commands below to update your system and install Geary.

    sudo apt-get update && sudo apt-get install geary

When you launch Geary the first time, it wants you to setup email accounts from Gmail, Yahoo or Microsoft.

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/gearyubuntu.png)

The setup is pretty easy, just enter your account info and Geary will attempt to automatically configure your account. 

To uninstall Geary, first remove its PPA repository from your system by running the commands below.

    sudo add-apt-repository -r ppa:yorba/ppa

Then run the commands below to remove Geary.

    sudo apt-get remove geary

That’s it.

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-get-geary-a-lightweight-email-reader-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
