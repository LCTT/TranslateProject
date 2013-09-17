How to easily backup and reuse data of Firefox and Chromium
================================================================================
The web and its content are playing a critical highly-relevant role in the users' IT lives, web containing websites, music, video, images, documents, books.

In Ubuntu, the user can hassle-free install the open-source [Chromium](apt://chromium-browser) web-browser, web-browser that, packed with Ubuntu's default Firefox, offer a powerful solid manner of digesting web content.

There are numerous situations when the user must move the data gathered by Chromium and Firefox, in order to utilize it under other Ubuntu installations, other computers (located in different physical non-home locations), as well as to save the data, in oder to avoid faulty situations (harddisk damages, physical lost of one's computer, etc).

While there are several sync-based services and tools, the below-presented method offers a quick, fast, reliable and always accessible manner of immediately (re)using the data gathered by Chromium and Firefox (data meaning web history, passwords, download history, bookmarks, etc, essentially, everything done with Chromium and Firefox).

The method is (as applicable to saving data to a USB stick):

- navigate to the home folder and hit the `Ctrl+H` buttons, action that reveals the hidden folders
- copy the `.mozilla` folder to the USB stick
![](http://iloveubuntu.net/pictures_me/mozilla%20wed%20data%20backup.png)
- inside the `.config` folder, copy the `chromium` folder to the USB stick
![](http://iloveubuntu.net/pictures_me/chromium%20web%20data%20backup.png)

The result: a USB stick containing the `.mozilla` and `chromium` folders.

Copying the from-the-stick `.mozilla` and `chromium` folders to a new Ubuntu installation (or old) in their locations (`.mozilla` under the home folder, `chromium` under `.config`,--delete the old about-to-be-replaced `.mozilla` and `chromium` folders--) and opening Firefox and Chromium **allow** the user to enjoy their full web data, therefore, removing sync services, advanced complicated methods, potential unavailabilities, etc.

The USB stick can be replaced with a preferred disk partition, serving also as a backup for unwanted situations.

via: http://iloveubuntu.net/how-easily-backup-and-reuse-data-firefox-and-chromium

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://iloveubuntu.net/how-easily-backup-and-reuse-data-firefox-and-chromium