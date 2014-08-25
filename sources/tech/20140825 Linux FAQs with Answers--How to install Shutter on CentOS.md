Linux FAQs with Answers--How to install Shutter on CentOS
================================================================================
> **Question**: I would like to try out Shutter screenshot program on my CentOS desktop. However, when I tried to install Shutter with yum, it says "No package shutter available." How can I install Shutter on CentOS? 

[Shutter][1] is an open-source (GPLv3) screenshot tool for Linux desktop. It is packed with a number of user-friendly features, making it one of the most powerful screenshot programs in Linux. With Shutter, you can capture a screenshot of a rectangular area, a window, an entire desktop screen, or even a web page at any arbitrary URL. Besides, it also allows you to edit a captured screenshot with a built-in image editor, apply different effects, export to different image formats (svg, pdf, ps), or upload to public image hosts or FTP sites.

Shutter is not available as a pre-built package on CentOS (as of version 7). Fortunately, there exists a third-party RPM repository called Nux Dextop, which offers Shutter package. So [enable Nux Dextop repository][2] on CentOS. Then use the following command to install Shutter.

     $ sudo yum --enablerepo=nux-dextop install shutter 

![](https://farm4.staticflickr.com/3876/14986638615_6501a68527_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-shutter-centos.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://shutter-project.org/
[2]:http://ask.xmodulo.com/enable-nux-dextop-repository-centos-rhel.html