

Ubuntuzilla: An Easy Way To Install Latest Mozilla Software
================================================================================
[**Ubuntuzilla**][1] is an **APT** repository that contains the most recent and latest versions of **Mozilla Firefox, Mozilla Thunderbird**, and **Mozilla Seamonkey** software’s. This repository will work on all Ubuntu and as well as Debian derivatives. Ubuntuzilla has a [support forum][2] on the [Ubuntu Forums][3] in the 3rd party projects area, so that users can use them if they have any questions, comments, or suggestions.

**Why Ubuntuzilla?**

The answer is simple. The official repositories for a particular version of Ubuntu contains the latest versions of software packages as of the date of release of that version of Ubuntu. After the release is made, newer versions of software packages do not get added to the repositories, with the exception of security fixes. Using Ubuntuzilla users can get most recent and timely updates of Mozilla software’s which may not be available in the Ubuntu/Debian official repositories. Sounds good? yes it should be.

**Add Ubuntuzilla Repository**

Adding Ubuntuzilla is not that difficult, but if you already use the old ubuntuzilla script, you should delete it first. Otherwise you will get when installing Mozilla software’s due to the existence of a local diversion of **/usr/bin/** links.

To remove the old Ubuntuzilla script, run the following command:

    $ sudo ubuntuzilla.py -a remove -p <package-name>

First of all, it is strongly advisable to take the backup of existing Firefox/Thunderbird/Seamonkey user profile’s. It will be stored stored in your home directory. Firefox and Seamonkey profiles are stored in **.mozilla** directory. Thunderbird profile is stored in **.thunderbird** or **.mozilla-thunderbird** directory.

Open up the **/etc/apt/sources.list** file using any editor.

    $ sudo nano /etc/apt/sources.list

Add the following line in it.

    deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main

Save and exit the file.

Add the following package signing key to your keyring with command:

    $ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29

Update the sources list with command:

    $ sudo apt-get update

Now you can install your desired Mozilla software’s from Ubuntuzilla.

**Install Mozilla Firefox:**

    $ sudo apt-get install firefox-mozilla-build

**Install Mozilla Thunderbird:**

    $ sudo apt-get install thunderbird-mozilla-build

**Install Mozilla Seamonkey:**

    $ sudo apt-get install seamonkey-mozilla-build

To remove packages, the commands will be:

    $ sudo apt-get remove firefox-mozilla-build
    $ sudo apt-get remove thunderbird-mozilla-build
    $ sudo apt-get remove seamonkey-mozilla-build

I found it to be very useful for those who want latest builds of Mozilla products. Enjoy!


via: http://www.unixmen.com/ubuntuzilla-easy-way-install-latest-mozilla-products/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://sourceforge.net/apps/mediawiki/ubuntuzilla/index.php?title=Main_Page
[2]:http://ubuntuforums.org/forumdisplay.php?f=251
[3]:http://ubuntuforums.org/
