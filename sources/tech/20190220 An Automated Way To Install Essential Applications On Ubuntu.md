[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An Automated Way To Install Essential Applications On Ubuntu)
[#]: via: (https://www.ostechnix.com/an-automated-way-to-install-essential-applications-on-ubuntu/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

An Automated Way To Install Essential Applications On Ubuntu
======
![](https://www.ostechnix.com/wp-content/uploads/2019/02/alfred-720x340.png)

The default Ubuntu installation doesn’t come with all essential applications pre-installed . You may need to spend few hours on Internet or ask any Linux user’s help to find and install the necessary applications for your Ubuntu box. If you’re newbie, then you certainly need to spend more time to learn how to search and install applications either from command line (using apt-get or dpkg) or from the Ubuntu software center. Some users, especially newbies, might want to easily and quickly install every applications they like. If you’re one of them, no worries. In this guide, we will see how to install essential applications on Ubuntu using a simple command line utility called **“Alfred”**.

Alfred is a free, open source script written in **Python** programming language. It uses **Zenity** to create a simple graphical interface that allows the users to easily select and install the applications of their choice with a few mouse clicks. You need not to spend hours to search for all essential applications, PPAs, debs, AppImage, snaps or flatpaks. Alfred brings all common applications, tools and utilities under one-roof and automatically installs the selected applications. If you’re a newbie who is recently migrated from Windows to Ubuntu Linux, Alfred helps you to do an unattended software installation on a freshly installed Ubuntu system, without much user intervention. Please be mindful that there is also a Mac OS app with similar name, but both serves different purposes.

### Installing Alfred On Ubuntu

Alfred installation is easy! Just download the script and launch it. It is that simple.

```
$ wget https://raw.githubusercontent.com/derkomai/alfred/master/alfred.py

$ python3 alfred.py
```

Alternatively, download the script using wget as shown above and just move the **alfred.py** file to your $PATH:

```
$ sudo cp alfred.py /usr/local/bin/alfred
```

Make it executable:

```
$ sudo chmod +x /usr/local/bin/alfred
```

And, launch it using command:

```
$ alfred
```

### Easily And Quickly Install Essential Applications On Ubuntu Using Alfred Script

Launch Alfred script as described in the installation section above. This is how Alfred default interface looks like.

![][2]

As you can see, Alfred lists a lot of most commonly used application types such as,

  * Web browsers,
  * Mail clients,
  * Messengers,
  * Cloud storage clients,
  * Hardware drivers,
  * Codecs,
  * Developer tools,
  * Android,
  * Text editors,
  * Git,
  * Kernel update tool,
  * Audio/video players,
  * Screenshot tools,
  * Screen recorders,
  * Video encoders,
  * Streaming apps,
  * 3D modelling and animation tools,
  * Image viewers and editors,
  * CAD software,
  * Pdf tools,
  * Gaming emulators,
  * Disk management tools,
  * Encryption tools,
  * Password managers,
  * Archive tools,
  * Ftp software,
  * System resource monitors,
  * Application launchers and many.



You can pick any one or multiple applications of your choice and install them at once. Here, I am going to install the ‘Developer bundle’, hence I chose it and click OK button.

![][3]

Now, Alfred script will automatically add the necessary repositories, ppas on your Ubuntu system and start installing the selected applications.

![][4]

Once the installation is completed, you will see the following message.

![][5]

Congratulations! The selected packages have been installed.

You can [**check recently installed applications**][6] on Ubuntu using the following command:

```
$ grep " install " /var/log/dpkg.log
```

You may need to reboot your system in-order to use some of the installed applications. Similarly, you can install any applications from the list without much hazzle.

For your information, there is also a similar script named **post_install.sh** written by different developer. It is exactly same as Alfred, but provides a few different set of applications. Please check the following link for more details.

These two scripts allows the lazy users, especially newbies, to be able to easily and fastly install most common apps, tools, updates, utilities they want to use in their Ubuntu Linux with few mouse clicks away, and stop depending on the help of official or non-official documentations.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/an-automated-way-to-install-essential-applications-on-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-1.png
[3]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-2.png
[4]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-4.png
[5]: http://www.ostechnix.com/wp-content/uploads/2019/02/alfred-5-1.png
[6]: https://www.ostechnix.com/list-installed-packages-sorted-installation-date-linux/
