translating---geekpi

Installation of CentOS 7.3 Guide
============================================================

The latest version of CentOS 7, a Linux platform based on sources of Red Hat Enterprise Linux, has been released in November this year with many bug fixes, new packages upgrades, such as Samba, Squid, libreoffice, SELinux, systemd and others and support for the 7th generation of Intel Core i3, i5, i7 processors.

This guide will show you how to install CentOS 7.3 using the DVD ISO image on a UEFI based machine.

If you’re looking for RHEL, go through our [RHEL 7.3 Installation Guide][2].

#### Requirements

1.  [Download CentOS 7.3 ISO Image][1]

In order to properly perform the installation of CentOS 7.3 on a UEFI based machine, first enter your motherboard UEFI settings by pressing a special key (`F2`, `F11`, `F12` depending on motherboard specifications) and assure that QuickBoot/FastBoot and Secure Boot options are disabled.

### CentOS 7.3 Installation

1. After you’ve downloaded the image from the above link, burn it to a DVD or create a bootable UEFI compatible USB drive using [Rufus][3] utility.

Place the USB/DVD in the appropriate motherboard drive, reboot your machine and instruct the BIOS/UEFI to boot-up from the DVD/USB by pressing a special function key (usually `F12`, `F10` depending on the vendor specifications).

Once the ISO image boots-up, the first screen will appear on your machine output. From the menu select Install CentOS 7 and hit Enter to continue.

[
 ![CentOS 7.3 Boot Menu](http://www.tecmint.com/wp-content/uploads/2016/12/CentOS-7.3-Boot-Menu.png) 
][4]

CentOS 7.3 Boot Menu

2. After the install ISO image has been loaded into your machine RAM, the welcome screen will appear. Choose the language you want to perform the installation process and press hit on Continue button.

[
 ![Select CentOS 7.3 Installation Language](http://www.tecmint.com/wp-content/uploads/2016/12/Select-CentOS-7.3-Installation-Language.png) 
][5]

Select CentOS 7.3 Installation Language

3. On the next screen hit on Date and Time and choose your geographical location from the map. Make sure the date and time are correctly configured and hit on Done button to go back to the main installer screen.

[
 ![CentOS 7.3 Installation Summary ](http://www.tecmint.com/wp-content/uploads/2016/12/CentOS-7.3-Installation-Summary.png) 
][6]

CentOS 7.3 Installation Summary

[
 ![Select Date and Time](http://www.tecmint.com/wp-content/uploads/2016/12/Select-Date-and-Time.png) 
][7]

Select Date and Time

4. On the next step setup the keyboard layout by hitting on Keyboard menu. Choose or add a keyboard layout and hit on Done to continue.

[
 ![Select Keyboard Layout](http://www.tecmint.com/wp-content/uploads/2016/12/Select-Keyboard-Layout.png) 
][8]

Select Keyboard Layout

5. Next, add or configure the language support for your system and hit Done to move to the new step.

[
 ![Select Language Support](http://www.tecmint.com/wp-content/uploads/2016/12/Select-Language-Support.png) 
][9]

Select Language Support

6. In this step you can setup your system Security Policy by choosing a security profile from the list.

Set the desired security profile by hitting on Select profile button and Apply security policy button to ON. When you finish click on Done button to continue with the installation process.

[
 ![Enable CentOS 7.3 Security Policy](http://www.tecmint.com/wp-content/uploads/2016/12/Enable-CentOS-7-Security-Policy.png) 
][10]

Enable CentOS 7.3 Security Policy

7. On the next step you can configure your base machine environment by hitting on Software Selection button.

From the left list you can opt to install a desktop environment (Gnome, KDE Plasma or Creative Workstation) or choose a server custom installation type (Web server, Compute Node, Virtualization host, Infrastructure server, Server with a graphical interface or File and Print Server) or perform a minimal installation.

In order to subsequently customize your system, select Minimal Install with Compatibility Libraries add-ons and hit on Done button to continue.

[
 ![CentOS 7.3 Software Selection](http://www.tecmint.com/wp-content/uploads/2016/12/CentOs-7.3-Software-Selection.png) 
][11]

CentOS 7.3 Software Selection

For a full Gnome or KDE Desktop environment use the below screenshots as a guide.

[
 ![Gnome Desktop Software Selection](http://www.tecmint.com/wp-content/uploads/2016/12/Gnome-Desktop-Software-Selection.png) 
][12]

Gnome Desktop Software Selection

[
 ![KDE Desktop Software Selection](http://www.tecmint.com/wp-content/uploads/2016/12/KDE-Desktop-Software-Selection.png) 
][13]

KDE Desktop Software Selection

8. Assuming that you want to install a Graphical User Interface for your server, choose Server with GUI item from the left plane and check the proper Add-ons from the right plane depending on what kind of services the server will provide to your network clients.

The range of services you can choose from is diversified, from Backup, DNS or e-mail services to File and Storage services, FTP, HA or [Monitoring tools][14]. Choose only the services that are crucial for your network infrastructure.

[
 ![Select Server with GUI](http://www.tecmint.com/wp-content/uploads/2016/12/Select-Server-with-Gui.png) 
][15]

Select Server with GUI

9. Leave the Installation Source as default in case you’re not using other specific network locations such as HTTP, HTTPS, FTP or NFS protocols as additional repositories and hit on Installation Destination in order to create hard disk partitions.

On the Device selection screen make sure your local machine hard disk is checked. Also, on Other Storage Options assure that Automatically configure partitioning is selected.

This option ensures that your hard disk will be properly partitioned according to your disk size and Linux file system hierarchy. It will automatically create /(root), /home and swap partitions on your behalf. Hit on Done to apply the hard drive partition scheme and go back to the main installer screen.

Important: If you want to create custom layout with custom partition sizes, you can select “I will configure partitioning” option to create custom partitions.

[
 ![Select CentOS 7.3 Installation Destination](http://www.tecmint.com/wp-content/uploads/2016/12/Select-CentOS-7.3-Installation-Destination.png) 
][16]

Select CentOS 7.3 Installation Destination

10. Next, hit on KDUMP option and disable it if you want to free RAM in your system. Hit Done to apply changes and go back to main installation screen.

[
 ![Kdump Selection](http://www.tecmint.com/wp-content/uploads/2016/12/Kdump-Selection.png) 
][17]

Kdump Selection

11. In the next step set-up your machine hostname and enable network service. Hit on Network & Hostname, type your system Fully Qualified Domain Name on Host name and activate the network interface by switching the Ethernet button from OFF to ON in case you have a DHCP server in your LAN.

[
 ![Set Network and Hostname](http://www.tecmint.com/wp-content/uploads/2016/12/Set-Network-Hostname.png) 
][18]

Set Network and Hostname

12. In order to statically configure your network interface hit on Configure button, manually add your IP settings as illustrated in the below screenshot and hit on Save button to apply changes. When you finish, hit on Donebutton to return to main installer menu.

[
 ![Configure Network and IP Address](http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Network-and-IP-Address.png) 
][19]

Configure Network and IP Address

13. Finally, review all configurations so far and if everything seems in place, hit on Begin Installation button to start the installation process.

[
 ![Begin CentOS 7.3 Installation Guide](http://www.tecmint.com/wp-content/uploads/2016/12/Begin-CentOS-7.3-Installation.png) 
][20]

Begin CentOS 7.3 Installation Guide

14. After the installation process starts, a new configuration screen for setting-up users will appear. First, hit on ROOT PASSWORD and add a strong password for root account.

The root account is the highest administrative account in every Linux system and has full privileges. After you finish hit on Done button to return to user settings screen.

[
 ![Select Root Password](http://www.tecmint.com/wp-content/uploads/2016/12/Select-Root-Password.png) 
][21]

Select Root Password

[
 ![Set Root Password](http://www.tecmint.com/wp-content/uploads/2016/12/Set-Root-Password.png) 
][22]

Set Root Password

15. Running the system from root account is extremely unsecure and dangerous so it’s advisable to create a new system account in order to [perform day-to-day system tasks][23] by hitting on User Creation button.

Add your new user credentials and check both options in order to grant this user with root privileges and manually enter the password each time you log in to the system.

When you finish this last section hit on Done button and wait for the installation process to finish.

[
 ![Create User Account](http://www.tecmint.com/wp-content/uploads/2016/12/Create-User-Account.png) 
][24]

Create User Account

16. After a few minutes the installer will report that CentOS has been successfully installed on your machine. In order to use the system you just have to remove the installation media and reboot the machine.

[
 ![CentOS 7.3 Installation Complete](http://www.tecmint.com/wp-content/uploads/2016/12/CentO-7.3-Installation-Complete.png) 
][25]

CentOS 7.3 Installation Complete

17. After reboot, log in to the system using the credentials created during the installation process and make sure perform a full system update by issuing the below command with root privileges.

```
$ sudo yum update
```
[
 ![Update CentOS 7.3](http://www.tecmint.com/wp-content/uploads/2016/12/Update-CentOS-7.3.png) 
][26]

Update CentOS 7.3

Answer with `yes` to all questions asked by [yum package manager][27] and finally, reboot the machine again (use sudo init 6) in order to apply new kernel upgrade.

```
$ sudo init 6
```

That’s all! Enjoy the latest release of CentOS 7.3 on your machine.


------------------

作者简介:

Matei Cezar

![](http://2.gravatar.com/avatar/be16e54026c7429d28490cce41b1e157?s=128&d=blank&r=g)

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/centos-7-3-installation-guide/

作者：[Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1611.iso
[2]:http://www.tecmint.com/red-hat-enterprise-linux-7-3-installation-guide/
[3]:https://rufus.akeo.ie/
[4]:http://www.tecmint.com/wp-content/uploads/2016/12/CentOS-7.3-Boot-Menu.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-CentOS-7.3-Installation-Language.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/12/CentOS-7.3-Installation-Summary.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-Date-and-Time.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-Keyboard-Layout.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-Language-Support.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/Enable-CentOS-7-Security-Policy.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/CentOs-7.3-Software-Selection.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Gnome-Desktop-Software-Selection.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/12/KDE-Desktop-Software-Selection.png
[14]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[15]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-Server-with-Gui.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-CentOS-7.3-Installation-Destination.png
[17]:http://www.tecmint.com/wp-content/uploads/2016/12/Kdump-Selection.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/12/Set-Network-Hostname.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Network-and-IP-Address.png
[20]:http://www.tecmint.com/wp-content/uploads/2016/12/Begin-CentOS-7.3-Installation.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-Root-Password.png
[22]:http://www.tecmint.com/wp-content/uploads/2016/12/Set-Root-Password.png
[23]:http://www.tecmint.com/file-and-directory-management-in-linux/
[24]:http://www.tecmint.com/wp-content/uploads/2016/12/Create-User-Account.png
[25]:http://www.tecmint.com/wp-content/uploads/2016/12/CentO-7.3-Installation-Complete.png
[26]:http://www.tecmint.com/wp-content/uploads/2016/12/Update-CentOS-7.3.png
[27]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
