[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to keep your Raspberry Pi updated)
[#]: via: (https://opensource.com/article/19/3/how-raspberry-pi-update)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

How to keep your Raspberry Pi updated
======
Learn how to keep your Raspberry Pi patched and working well in the seventh article in our guide to getting started with the Raspberry Pi.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_happy_sad_developer_programming.png?itok=72nkfSQ_)

Just like your tablet, cellphone, and laptop, you need to keep your Raspberry Pi updated. Not only will the latest enhancements keep your Pi running smoothly, they will also keep you safer, especially if you are connected to a network. The seventh article in our guide to getting started with the Raspberry Pi shares two pieces of advice on keeping your Pi working well.

### Update Raspbian

Updating your Raspbian installation is a [two-step process][1]:

  1. In your terminal type: **sudo apt-get update**
The command **sudo** allows you to run **apt-get update** as admin (aka root). Note that **apt-get update** will not install anything new on your system; rather it will update the list of packages and dependencies that need to be updated.


  2. Then type: **sudo apt-get dist-upgrade**
From the documentation: "Generally speaking, doing this regularly will keep your installation up to date, in that it will be equivalent to the latest released image available from [raspberrypi.org/downloads][2]."

![](https://opensource.com/sites/default/files/uploads/update_sudo_rpi.png)

### Be careful with rpi-update

Raspbian comes with another little update utility called [rpi-update][3]. This utility can be used to upgrade your Pi to the latest firmware which may or may not be broken/buggy. You may find information explaining how to use it, but as of late it is recommended never to use this application unless you have a really good reason to do so.

Bottom line: Keep your systems updated!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/how-raspberry-pi-update

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/documentation/raspbian/updating.md
[2]: https://www.raspberrypi.org/downloads/
[3]: https://github.com/Hexxeh/rpi-update
