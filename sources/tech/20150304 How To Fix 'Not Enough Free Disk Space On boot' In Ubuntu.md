How To Fix “Not Enough Free Disk Space On /boot” In Ubuntu
================================================================================
### Question: How To Fix “Not Enough Free Disk Space On /boot” In Ubuntu? ###

Today, I got the following error, but a simple one, when try to update my Lubuntu 14.04 desktop.

> “Not Enough Free Disk Space On /boot”

![](https://www.unixmen.com/wp-content/uploads/2015/02/Software-Updater_002.png)

This is because my /boot partition has caught up with unwanted old kernels, packages etc.

### Answer: ###

I heard about **Computer Janitor** feature which will remove unwanted old junk files in Ubuntu Tweak tool. Using the Computer Janitor, you can clean up your system like a freshly installed system. Janitor will remove;

- Apps cache(Firefox/Chrome cache, Software center cache);
- Thumbnail cache;
- Apt cache;
- Old kernels;
- Package configs;
- And unneeded packages.

If you haven’t install this tool, look at the following link.

- **[How To Install And Use Ubuntu Tweak On Ubuntu][1]** 

To remove unwanted junk files, open Ubuntu Tweak, and click on the **Janitor** option.

![](https://www.unixmen.com/wp-content/uploads/2015/02/Ubuntu-Tweak_006.png)

Select the check the boxes to remove unwanted junk from your system, and click **Clean** button.

![](https://www.unixmen.com/wp-content/uploads/2015/02/Ubuntu-Tweak_007.png)

Janitor will now start to clean up your system

![](https://www.unixmen.com/wp-content/uploads/2015/02/Ubuntu-Tweak_003.png)

Cool! The system is clean now.

![](https://www.unixmen.com/wp-content/uploads/2015/02/Ubuntu-Tweak_008.png)

Again I re-launched the software updater. This time it went smoothly without any issues.

![](https://www.unixmen.com/wp-content/uploads/2015/02/Software-Updater_009.png)

That’s all. Enjoy. There are others ways also available to clean up the system. But, this seems very easy to follow. We can do system clean up in few mouse clicks.

Cheers!

--------------------------------------------------------------------------------

via: https://www.unixmen.com/how-to-fix-not-enough-free-disk-space-on-boot-in-ubuntu/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/sk/
[1]:http://www.unixmen.com/after-a-fresh-install-of-ubuntu-1010-maverick-meerkat-configuration-made-easy-with-ubuntu-tweak/