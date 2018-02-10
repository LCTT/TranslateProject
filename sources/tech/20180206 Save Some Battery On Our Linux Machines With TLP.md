translating by lujun9972
Save Some Battery On Our Linux Machines With TLP
======
![](http://www.linuxandubuntu.com/home/save-some-battery-on-our-linux-machines-with-tlp)

I have always found battery life with Linux to be relatively lesser than windows. Nevertheless, this is [Linux][1] and we always have something up our sleeves.

Now talking about this small utility called TLP, that can actually save some juice on your device.

​

**TLP - Linux Advanced Power Management** is a small command line utility that can genuinely help extend battery life by performing several tweaks on your Linux system.

```
sudo apt install tlp
```

 [![install tlp in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-tlp-in-linux.jpeg?1517926012)][2] 

For other distributions, you can read the instructions from the [official website][3] .

​

After installation is complete, you will have to run the following command to start tlp for the first time only. TLP will automatically start the next time you boot your system.

 [![start tlp on linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/start-tlp-on-linux.jpeg?1517926209)][4] 

​Now TLP has started and it has already made the default configurations needed to save battery. We will now see the configurations file. It is located in **/etc/default/tlp**. We need to edit this file to change various configurations.

There are many options in this file and to enable an option just remove the leading **#** character from that line. There will be instructions about each option and the values that you can allot to it. Some of the things that you will be able to do are -

*   Autosuspend USB devices

*   Define wireless devices to enable/disable at startup

*   Spin down hard drives

*   Switch off wireless devices

*   Set CPU for performance or power savings

### Conclusion

​TLP is an amazing utility that can help save battery life on Linux systems. I have personally found at least 30-40% of extended battery life when using TLP.


--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/save-some-battery-on-our-linux-machines-with-tlp

作者：[LinuxAndUbuntu][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/category/linux
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/install-tlp-in-linux.jpeg
[3]:http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/start-tlp-on-linux.jpeg
