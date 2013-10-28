occupied by rogetfan
Ubuntu每日贴士——Ubuntu中通过Cheese支持Webcom
================================================================================
对于一些Ubuntu的新用户，如果你们想在Ubuntu中使用webcam的话，这里有一些信息能够帮助到你们。正如你们说知道的那样，Ubuntu致力于支持绝大多数webcom（right out of the box 网络翻译为开箱，我在这里并不这样认为，所以暂时不去翻译）大多数webcom生产商并不为Linux系统提供驱动，包括Ununtu。所以，Linux开发者们必须能够尽最大努力让webcom设备在Linux内核中能够运行。
Webcam support for Linux is provided by the Linux UVC Project’s [UVC][1] driver.  The aim of this project is to provide a universal USB support for webcam in the same way a general USB driver handles USB devices like thumb drives, external USB devices and others.
支持Linux的webcam驱动由Linux UVC项目提供[UVC][1]。该项目意图为webam提供一个万能USB支持，就像一个通用USB驱动控制一些USB设备，例如U盘，外部USB设备和其他一些设备。
The vast majority of USB webcam out there should work with Linux systems, including Ubuntu with the support of the Linux UVC project driver. If you want to purchase a webcam for your Ubuntu computer, but want to make sure it’s supported, [check out the UVC supported webcam list][2].

Webcam on the list above support Linux machines easily. So, before purchasing webcam for your machine check out the list and find the model you like and purchase it.

After purchasing a model that supports Linux systems, you’ll need an application in to display or view your videos. Currently the most popular webcam application for Ubuntu is Cheese. Cheese allows you to access your webcam and display the video easily.

To install Cheese, run the commands below.

    sudo apt-get install cheese

After installing it, open it via Unity Dash and launch it. If the webcam device is already attached, Cheese should begin showing the video from the webcam.

If you have a laptop equipped with webcam, chances are it should work because support for generic USB webcam is common with Ubuntu. All you have to do is install Cheese and enjoy!

If you can’t get your current webcam to work in Ubuntu, you may have to purchase a model that works.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-webcam-support-ubuntu-via-cheese/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:https://help.ubuntu.com/community/UVC
[2]:http://www.ideasonboard.org/uvc/
