每日Ubuntu小技巧——Ubuntu中通过Cheese支持Webcam
================================================================================
    
对于一些Ubuntu的新用户，如果你们想在Ubuntu中使用webcam的话，这里有一些信息能够帮助到你们。正如你们说知道的那样，Ubuntu旨在支持绝大多数webcam，而且是现成可用的。大多数webcam生产商并不为Linux系统提供驱动，包括Ununtu。所以，Linux开发者们必须能够尽最大努力让webcam设备在Linux内核中运行。
   
支持Linux的webcam驱动由Linux UVC项目提供[UVC][1]。该项目意图为webcam提供一个万能USB支持，就像一个通用USB驱动控制一些USB设备，例如U盘，外部USB设备和其他一些设备。

大多数主流的USB webcam设备都可以在Linux系统下工作，其中包括支持Linux UVC项目驱动的Ubuntu。如果你想为你的Ubuntu计算机购买一个webcam设备,又不确信它是否能被支持，请[核查支持UVC的webcam列表][2].
    
上面列出的webcam都能够很方便地应用在Linux机器中。因此，在为你的机器购买webcam之前，查看一下列表并找到你喜欢的模块。

在购买一个支持Linux系统的模块之后，你需要一个应用程序来播放或者观看视频。现如今，最流行的Ubuntu webcam应用程序是Cheese.Cheese 允许用户访问自己的webcam并能够轻松播放视频。

输入以下命令安装Cheese  
    
    sudo apt-get install cheese
    
安装完成之后，在Unity Dash中打开它就能运行。如果webcam驱动已经载入，Cheese就能够从Webcam中输出视频。

只要你有一个配备了webcam的笔记本电脑，那它就可以工作，因为大多数USB webcam设备是在Ubuntu中通用的。你该做的就是安装Cheese并体验。

如果你不能令当前的webcam在Ubuntu中工作，就应该尝试购买一个能够工作的模块!

尽情享受吧！
--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-webcam-support-ubuntu-via-cheese/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[rogetfan](https://github.com/译者ID) 校对：[Caroline](https://github.com/carolinewuyan)

[1]:https://help.ubuntu.com/community/UVC
[2]:http://www.ideasonboard.org/uvc/ 
