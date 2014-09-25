Linux FAQs with Answers--How to configure a static IP address on CentOS 7
================================================================================
> **Question**: On CentOS 7, I want to switch from DHCP to static IP address configuration with one of my network interfaces. What is a proper way to assign a static IP address to a network interface permanently on CentOS or RHEL 7? 

If you want to set up a static IP address on a network interface in CentOS 7, there are several different ways to do it, varying depending on whether or not you want to use Network Manager for that.

Network Manager is a dynamic network control and configuration system that attempts to keep network devices and connections up and active when they are available). CentOS/RHEL 7 comes with Network Manager service installed and enabled by default.

To verify the status of Network Manager service:

    $ systemctl status NetworkManager.service

To check which network interface is managed by Network Manager, run:

    $ nmcli dev status 

![](https://farm4.staticflickr.com/3861/15295802711_a102a3574d_z.jpg)

If the output of nmcli shows "connected" for a particular interface (e.g., enp0s3 in the example), it means that the interface is managed by Network Manager. You can easily disable Network Manager for a particular interface, so that you can configure it on your own for a static IP address.

Here are **two different ways to assign a static IP address to a network interface on CentOS 7**. We will be configuring a network interface named enp0s3.

### Configure a Static IP Address without Network Manager ###

Go to the /etc/sysconfig/network-scripts directory, and locate its configuration file (ifcfg-enp0s3). Create it if not found.

![](https://farm4.staticflickr.com/3911/15112399977_d3df8e15f5_z.jpg)

Open the configuration file and edit the following variables:

![](https://farm4.staticflickr.com/3880/15112184199_f4cbf269a6.jpg)

In the above, "NM_CONTROLLED=no" indicates that this interface will be set up using this configuration file, instead of being managed by Network Manager service. "ONBOOT=yes" tells the system to bring up the interface during boot.

Save changes and restart the network service using the following command:

    # systemctl restart network.service

Now verify that the interface has been properly configured:

    # ip add 

![](https://farm6.staticflickr.com/5593/15112397947_ac69a33fb4_z.jpg)

### Configure a Static IP Address with Network Manager ###

If you want to use Network Manager to manage the interface, you can use nmtui (Network Manager Text User Interface) which provides a way to configure Network Manager in a terminal environment.

Before using nmtui, first set "NM_CONTROLLED=yes" in /etc/sysconfig/network-scripts/ifcfg-enp0s3.

Now let's install nmtui as follows.

    # yum install NetworkManager-tui

Then go ahead and edit the Network Manager configuration of enp0s3 interface:

    # nmtui edit enp0s3 

The following screen will allow us to manually enter the same information that is contained in /etc/sysconfig/network-scripts/ifcfg-enp0s3.

Use the arrow keys to navigate this screen, press Enter to select from a list of values (or fill in the desired values), and finally click OK at the bottom right:

![](https://farm4.staticflickr.com/3878/15295804521_4165c97828_z.jpg)

Finally, restart the network service.

    # systemctl restart network.service

and you're ready to go.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/configure-static-ip-address-centos7.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出