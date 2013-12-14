[scusjs占坑]Daily Ubuntu Tips — Install VMware Workstation In Ubuntu
================================================================================
VMware Workstation is a Type-2 commercial virtualization software. It’s Type-2 because is runs on top of existing operation systems and the computer it’s running on is known as the host computer.

You can use VMware Workstation to run multiple guest machines simultaneously running individual operating systems on the host machine. A guest machine can either be a 32-bit or 64-bit of supported operating systems. VMware Workstation supports Windows, Mac OS X, Solaris and many others.

This brief tutorial is going to show you how to install VMware Workstation in Ubuntu.

Since this program is a commercial program, you must have a valid license to use it. You could also [download the 30-day free trial version][1] from the download page to test it. If you want to register it, get a license key and validate it.

To get started installing VMware Workstation in Ubuntu, first update Ubuntu. To do that, run the commands below.

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

After updating your computer, run the commands below to prepare Ubuntu before the installation.

    sudo apt-get install build-essential linux-headers-`uname -r`

After that, download VMware Workstation. Next, change into the **~/Downloads** folder since Firefox saves files in the Downloads folder.

    cd Downloads

Next, run the commands below to extract the download package if it came in a .zip archive. If not, go to the next line.

    unzip VMware-Workstation-Full*.zip

Next, run the commands below to make the file executable. 

    chmod +x VMware-Workstation-Full*.bundle

Finally, run the commands below to begin the installation.

    sudo ./VMware-Workstation-Full*.bundle

ollow the wizard until the installation is complete. When it’s done, open it from Dash and begin creating guest machines.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/vmwareworkstationubuntu.png)

You should be able to create many guest machines of all types, including Windows, Linux, Novell, Solaris and others.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/vmwareworkstationubuntu1.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/daily-ubuntu-tips-install-vmware-workstation-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://my.vmware.com/web/vmware/info/slug/desktop_end_user_computing/vmware_workstation/10_0
