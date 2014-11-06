[Quick Tip] Allow Services Through Firewall In openSUSE 
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/openSUSE.png)

As you may know, not all services are enabled and allowed by default in openSUSE/SUSE systems. For example, **ssh** service is not allowed through firewall on openSUSE systems. Of course, it’s a safety precaution, but sometimes we must need ssh service to access the system from a remote location.

This quick tutorial will show how to allow services, not only ssh, but all other services such as http, ftp etc., through firewall. We can allow the services from **YaST**, which is the default installation and configuration tool for openSUSE, and SUSE enterprise.

First, open YaST Control Center from menu. Go to **Security and Users -> Firewall**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/openSUSE-13.1-Running-Oracle-VM-VirtualBox_001.png)

Go to **Allowed Services** tab. Select **Secure Shell Service** from the Service to Allow drop-down box, and finally click **Add**, **Next** and **Finish** buttons to allow the service.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/openSUSE-13.1-Running-Oracle-VM-VirtualBox_002.png)

That’s it. The ssh service has been allowed now, so you can access the system from a remote system. Like this way, we can also other required services.

Cheers!!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/quick-tip-allow-services-firewall-opensuse/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/