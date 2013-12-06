	Vic020的WC
CentOS 6.5 desktop installation guide with screenshots
================================================================================
### CentOS 6.5 released ###

Following with the release of RHEL 6.5, [CentOS 6.5 has arrived][1] on 1st Dec and its time to play with it. For those who want to update their existing 6.4 systems to 6.5 simply use the "yum update" command and all the magic would be done.

CentOS 6.5 has received some package updates as well as new features. Check out the [release notes][2] for detailed information.

### Major updates ###

> The Precision Time Protocol - previously a technology preview - is now fully supported. The following drivers support network time stamping: bnx2x, tg3, e1000e, igb, ixgbe, and sfc.
> OpenSSL has been updated to version 1.0.1.
> OpenSSL and NSS now support TLS 1.1 and 1.2.
> KVM received various enhancements. These include improved read-only support of VMDK- and VHDX-Files, CPU hot plugging and updated virt-v2v-/virt-p2v-conversion tools.
> Hyper-V and VMware drivers have been updated.
> Updates to Evolution (2.32) and Libre Office (4.0.4).

### Download ###

In this post we shall be installing it on the desktop. Head to either of the following urls

[http://isoredirect.centos.org/centos-6/6.5/isos/][3]
[http://mirror.centos.org/centos/6.5/isos/][4]

Select your machine architecture and it will then present a list of mirrors. Get into any mirror and then get the torrent file to download or the direct iso download link. There are multiple download options available like LiveCD, LiveDVD, Dvd1+2, Minimal and Netinstall.

The minimal installer comes with a text based installer that would install CentOS with a shell and minimum software applications. Rest everything has to be installed from yum.

The LiveCD/LiveDVD provide the desktop and gui installer and installs the CentOS system but does not provide any package selection options.

The DvD1+2 set provide full set of all applications for those who need it.
And the netinstall would actually download the installation image and then install.

In this post we shall use the LiveCD. It is around 650MB.
Although CentOS is used mostly on servers, having a desktop system can help to create a gui based environment with a setup similar to your server. We shall be trying out the minimal and netinstall installation methods in another post.

### Install ###

So now, its time to install CentOS onto your desktop system. Use either the LiveDVD or LiveCD to get it up and running fast.

1. Put in the media and reboot. The boot menu will have many options with self explanatory names. Select Boot to get onto the Live desktop.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-1.png)

2. Double clicks the Install icon on the desktop, to start the Anaconda installer.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-2.png)

3. Click Next on the installer wizard.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-3.png)

4. **Keyboard layout** - The next step would ask you to select the keyboard layout which should be USA for most english users.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-4.png)

5. **Storage type** - After the keyboard layout, comes the option select the type of storage on which CentOS is to be installed. For local hard drives, its Basic storage.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-5.png)

6. **Hostname** - In the next step the anaconda installer asks for a hostname. So fill it appropriately. If not sure, just enter something like mypc or hplaptop.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-6.png)

7. **Timezone** - Then comes the timezone selection

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-7.png)

8. **Root Password** - Next in turn is the root password which, as you know should be a strong one.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-8.png)

9. **Formatting** - Now the wizard would like to know, how you wan't to format the storage device. If you want to format the drive yourself, then select "Custom Layout" and create partitions as needed. For the sake of this tutorial we are selecting the first option, that is to use the entire device and let CentOS format it as it likes.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-9.png)

10. **Copying files** - Now the installer will start copying files. Nothing to do here except wait and watch. The LiveCD installer basically copies the CD image to the hard drive. You do not get any option to select packages to install or omit. Also the liveCD somes with a minimal collection of software and applications.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-10.png)

### Post install configuration ###

11. After the installation completes and reboots, the welcome wizard would come up which would further configure the system.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-11.png)

12. License Agreement - Like all software centos too comes with a license that is very minimal and only a few lines. So accept it.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-12.png)

13. **Create User** - Now its time to create a user account for yourself to be able to use the system.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-13.png)

14. **Current date & time** - Now input the current date and time and select the option to synchronize over the network.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-14.png)

15. **Kdump** - This is the last step of the welcome wizard that asks whether kdump should be enabled or not. It is a good idea to enable it.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-15.png)

### Start CentOS 6.5 ###

After the previous step, the system would be rebooted, and finally comes the login page.

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-login.png)

And after login comes the shiny new CentOS 6.5 desktop

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-desktop.png)

Hope you enjoyed reading the installation guide. Leave your comments and questions below.

### Resource ###

CentOS 6.5 release notes
[http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.5][5]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/centos-6-5-installation-screenshots/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lists.centos.org/pipermail/centos-announce/2013-December/020032.html
[2]:http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.5
[3]:http://isoredirect.centos.org/centos-6/6.5/isos/
[4]:http://mirror.centos.org/centos/6.5/isos/
[5]:http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.5