Daily Ubuntu Tips – Support For Ubuntu 13.04 Ends January 27, 2014
================================================================================
If you’re currently Ubuntu 13.04 Raring Ringtail, it may be time to upgrade to the next version because support for it will end January 27 of this year.

What Canonical (the parent company of Ubuntu) is saying is that as of January 27, no further security updates, bug fixes or package upgrades will be available from Ubuntu repositories. Your system will basically be running older packages with no access to updated versions from Ubuntu repositories.

Ubuntu 13.04 was released almost 9 months ago, April 25, 2013. It was the first release with the 9 month support cycle and is nearing its end.

For those who want to upgrade, they can follow the guide below to upgrade before the 27th.

Ubuntu 13.10, the next step up from 13.04 will continue to be actively supported with security updates and bug fixes and package upgrades.

Here’s a statement from Canonical:

> Ubuntu announced its 13.04 (Raring Ringtail) release almost 9 months
> ago, on April 25, 2013. This was the first release with our new 9
> month support cycle and, as such, the support period is now nearing
> its end and Ubuntu 13.04 will reach end of life on Monday, January
> 27th. At that time, Ubuntu Security Notices will no longer include
> information or updated packages for Ubuntu 13.04.

To upgrade to Ubuntu 13.10, run the commands below to update your system first. 

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

After running the commands below, you may restart your computer. It’s always good to restart so kernel changes and other updates can applied.

Next, press **Alt – F2** on your keyboard to show Unity Command Box. Then type the command below in the box and pres Enter.

    update-manager –d

Next, you’ll be prompted to upgrade your machine, hit the Upgrade button to begin upgrading.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/updatemanagerubuntu1310.png)

Before upgrading you should understand that it may take update to an hour for Ubuntu to finish downloading all the upgraded packages for your machine.

If you don’t have a reliable Internet connection, you shouldn’t perform in place upgrade. You may instead want to upgrade from a CD/DVD disc.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-support-for-ubuntu-13-04-ends-january-27-2014/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出