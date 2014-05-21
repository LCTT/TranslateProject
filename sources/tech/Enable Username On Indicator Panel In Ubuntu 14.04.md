GOLinux Translating!1
Enable Username On Indicator Panel In Ubuntu 14.04
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Ubuntu-14.042-790x493.jpeg)

Hi Guys,

Well if you just installed Ubuntu 14.04, you should figure this out already.

You will notice that your name is not displayed on the indicator bar, in the right top corner of the desktop. If you still want enable it; this is very easy to do.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/username_false.png)

Open Terminal and run the command below:

    $ gsettings set com.canonical.indicator.session show-real-name-on-panel true

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/username_true.png)

To hide the name, just replace **true** with **false** in the above command:

    $ gsettings set com.canonical.indicator.session show-real-name-on-panel false

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/username_false.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/enable-username-indicator-panel-ubuntu-14-04/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
