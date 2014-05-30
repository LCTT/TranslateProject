JonathanKang is translating
How To Share Disks In VirtualBox Between Linux Guest OS
================================================================================
Let me show you in this small  tutorial, how to share 1 disk between 2 Linux guests os in Virtualbox.

This tutorial will be very helpful, if you want to Configure and play with GFS or cluster machines.

The the normal screenshot of Virtualbox:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102225.png)

First, Guest OS Centos1:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102252.png)

Second Guest OS Centos2:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102314.png)

Add Extra disk to First machine:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102459.png)

via File -> Virtual Media manager (Control+D):

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102657.png)

Make the disk Shareable:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_102719.png)

From  Guest Centos 2, you can add existing disk that was created  before Centos1 guest OS:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/v2014-05-28_113908.png)

After this restart the 2 Guest os, you can check if the drive is add:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/2014-05-28_111903.png)

That’s it.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/share-disks-virtualbox-linux-guest-os/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
