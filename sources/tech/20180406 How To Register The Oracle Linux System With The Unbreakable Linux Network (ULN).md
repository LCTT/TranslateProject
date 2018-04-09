How To Register The Oracle Linux System With The Unbreakable Linux Network (ULN)
======
Most of us knows about RHEL subscription but only few of them knows about Oracle subscription and its details.

Even i don’t know the information about this and i recently came to know about this and wants to share this with others so, i’m going to write a article which will guide you to register the Oracle Linux system with the Unbreakable Linux Network (ULN).

This allows the register systems to get software update and other patches ASAP.

### What Is Unbreakable Linux Network

ULN stands for Unbreakable Linux Network which is owned by Oracle. If you have a active subscription to Oracle OS Support, you can register your system with Unbreakable Linux Network (ULN).

ULN offers software patches, updates, and fixes for Oracle Linux and Oracle VM, as well as information on yum, Ksplice, and support policies. You can also download useful packages that are not included in the original distribution.

The ULN Alert Notification Tool periodically checks with ULN and alerts you when updates are available.

If you want to use ULN repository with yum to manage your systems, make sure your system should registered with ULN and subscribe each system to one or more ULN channels. When you register a system with ULN, automatically it will choose latest version of channel based on the system architecture and OS.

### How To Register As A ULN User

To register as a ULN user, make sure you have a valid customer support identifier (CSI) for Oracle Linux support or Oracle VM support.

Follow the below steps to register as a ULN user.

Visit @ [linux.oracle.com][1]
![][3]

If you already have an SSO account, click Sign On.
![][4]

If you don’t have a account, click Create New Single Signon Account and follow the onscreen instructions to create one.
![][5]

Verify your email address to complete your account setup.

Log in using your SSO user name and password. On the Create New ULN User page, enter your CSI and click Create New User.
![][6]

**Note :**

  * If no administrator is currently assigned to manage the CSI, you are prompted to click Confirm to become the CSI administrator.
  * If your user name already exists on the system, you are prompted to proceed to ULN by clicking the link Unbreakable Linux Network.



### How To Register The Oracle Linux 6/7 System With ULN

Just run the below command and follow the instruction to register the system.
```
# uln_register

```

Make sure your system is having active internet connection. Also keep ready your Oracle Single Sign-On Login & password (SSO) details then hit `Next`.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.

âââââââââââââââââââââââââââââââââââââââââââââââââââââ¤ Setting up software updates âââââââââââââââââââââââââââââââââââââââââââââââââââââ
â This assistant will guide you through connecting your system to Unbreakable Linux Network (ULN) to receive software updates, â
â including security updates, to keep your system supported and compliant. You will need the following at this time: â
â â
â * A network connection â
â * Your Oracle Single Sign-On Login & password â
â â
â â
â â
â â
â â
â â
â â
â â
â ââââââââââââââââââââââââââââââââââââ ââââââââ ââââââââââ â
â â Why Should I Connect to ULN? ... â â Next â â Cancel â â
â ââââââââââââââââââââââââââââââââââââ ââââââââ ââââââââââ â
â                                                               â
ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

```

Input your login information for Unbreakable Linux Network, then hit `Next`.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.

âââââââââââââââââââââââââââââââââââââââââââââââââââââ¤ Setting up software updates âââââââââââââââââââââââââââââââââââââââââââââââââââââ
â â
â Please enter your login information for Unbreakable Linux Network (http://linux.oracle.com/): â
â â
â â
â Oracle Single Sign-On Login: [email protected]  â
â Password: **********__________ â
â CSI: 12345678____________ â
â Tip: Forgot your login or password? Visit: http://www.oracle.com/corporate/contact/getaccthelp.html â
â â
â ââââââââ ââââââââ ââââââââââ â
â â Next â â Back â â Cancel â â
â ââââââââ ââââââââ ââââââââââ â
â â
â â
ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

```

Register a System Profile – Hardware information, then hit `Next`.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.

ââââââââââââââââââââââââââââââââââââââââââââââ¤ Register a System Profile - Hardware ââââââââââââââââââââââââââââââââââââââââââââââ
â â
â A Profile Name is a descriptive name that you choose to identify this â
â System Profile on the Unbreakable Linux Network web pages. Optionally, â
â include a computer serial or identification number. â
â Profile name: 2g-oracle-sys___________________________ â
â â
â [*] Include the following information about hardware and network: â
â Press to deselect the option. â
â â
â Version: 6 CPU model: Intel(R) Xeon(R) CPU E5-5650 0 @ 2.00GHz â
â Hostname: 2g-oracle-sys â
â CPU speed: 1199 MHz IP Address: 192.168.1.101 Memory: â
â â
â Additional hardware information including PCI devices, disk sizes and mount points will be included in the profile. â
â â
â ââââââââ ââââââââ ââââââââââ â
â â Next â â Back â â Cancel â â
â ââââââââ ââââââââ ââââââââââ â
â â
â â
âââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

```

Register a System Profile – Packages configuration, then hit `Next`.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.

ââââââââââââââââââââââââââââââââââââââââââââââ¤ Register a System Profile - Packages âââââââââââââââââââââââââââââââââââââââââââââââ
â â
â RPM information is important to determine what updated software packages are relevant to this system. â
â â
â [*] Include RPM packages installed on this system in my System Profile â
â â
â You may deselect individual packages by unchecking them below. â
â [*] ConsoleKit-0.4.1-6.el6 â â
â [*] ConsoleKit-libs-0.4.1-6.el6 â â
â [*] ConsoleKit-x11-0.4.1-6.el6 â â
â [*] DeviceKit-power-014-3.el6 â â
â [*] GConf2-2.28.0-7.el6 â â
â [*] GConf2-2.28.0-7.el6 â â
â [*] GConf2-devel-2.28.0-7.el6 â â
â [*] GConf2-gtk-2.28.0-7.el6 â â
â [*] MAKEDEV-3.24-6.el6 â â
â [*] MySQL-python-1.2.3-0.3.c1.1.el6 â â
â [*] NessusAgent-7.0.3-es6 â â
â [*] ORBit2-2.14.17-6.el6_8 â â
â [*] ORBit2-2.14.17-6.el6_8 â â
â [*] ORBit2-devel-2.14.17-6.el6_8 â â
â [*] PackageKit-0.5.8-26.0.1.el6 â â
â [*] PackageKit-device-rebind-0.5.8-26.0.1.el6 â â
â [*] PackageKit-glib-0.5.8-26.0.1.el6 â â
â â
â ââââââââ ââââââââ ââââââââââ â
â â Next â â Back â â Cancel â â
â ââââââââ ââââââââ ââââââââââ â
â â
â â
âââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

```

Press “Next” to send this System Profile to Unbreakable Linux Network.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.

ââââââââââââââââââââââââââââââââââââ¤ Send Profile Information to Unbreakable Linux Network âââââââââââââââââââââââââââââââââââââ
â â
â We are finished collecting information for the System Profile. â
â â
â Press "Next" to send this System Profile to Unbreakable Linux Network. Click "Cancel" and no information will be sent. You â
â can run the registration program later by typing `uln_register` at the command line. â
â â
â ââââââââ ââââââââ ââââââââââ â
â â Next â â Back â â Cancel â â
â ââââââââ ââââââââ ââââââââââ â
â â
â â
ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

```

Sending Profile to Unbreakable Linux Network is under processing.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.



ââ¤ Sending Profile to Unbreakable Linux Network â
â â
â 75% â
â â
ââââââââââââââââââââââââââââââââââââââââââââââââââ

```

ULN registration has been done and review system subscription details. If everything is fine, then hit `ok`.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.

âââââââââââââââââââââââââââââââââââââââââââââââââââ¤ Review system subscription details ââââââââââââââââââââââââââââââââââââââââââââââââââ
â â
â â
â Note: yum-rhn-plugin has been enabled. â
â â
â Please review the subscription details below: â
â â
â Software channel subscriptions: â
â This system will receive updates from the following Unbreakable Linux Network software channels: â
â Oracle Linux 6 Latest (x86_64) â
â Unbreakable Enterprise Kernel Release 4 for Oracle Linux 6 (x86_64) â
â â
â Warning: If an installed product on this system is not listed above, you will not receive updates or support for that product. If â
â you would like to receive updates for that product, please visit http://linux.oracle.com/ and subscribe this system to the â
â appropriate software channels to get updates for that product. â
â â
â â
â â
â â
â â
â â
â â
â ââââââ â
â â OK â â
â ââââââ â
â â
â â
ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

```

Finally hit `Finish` to complete the registration.
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.


âââââââââââââââââââââââââââââââââââââââââââââââ¤ Finish setting up software updates âââââââââââââââââââââââââââââââââââââââââââââââ
â â
â You may now run 'yum update' from this system's command line to get the latest software updates from Unbreakable Linux Network. â
â You will need to run this periodically to get the latest updates. â
â â
â ââââââââââ â
â â Finish â â
â ââââââââââ â
â â
â â
âââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ

```

ULN registration has been done successfully, in order to get repository from ULN run the following command.
```
# yum repolist
Loaded plugins: aliases, changelog, presto, refresh-packagekit, rhnplugin, security, tmprepo, ulninfo, verify, versionlock
This system is receiving updates from ULN.
ol6_x86_64_UEKR3_latest | 1.2 kB 00:00
ol6_x86_64_UEKR3_latest/primary | 35 MB 00:14
ol6_x86_64_UEKR3_latest 874/874
repo id repo name status
ol6_x86_64_UEKR3_latest Unbreakable Enterprise Kernel Release 3 for Oracle Linux 6 (x86_64) - Latest 874
ol6_x86_64_latest Oracle Linux 6 Latest (x86_64) 40,092
repolist: 40,966

```

Also, you can check the same in ULN website. Go to the `System` tab to view the list of registered systems.
![][7]

To view list of the enabled repositories. Go to the `System` tab then hit the corresponding system. Also, you can able to see the available updates for the system for errata.
![][8]

To manage subscription channel. Go to the `System` tab, then hit appropriate `system name` and finally hit `Manage Subscriptions`.
![][9]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-register-the-oracle-linux-system-with-the-unbreakable-linux-network-uln/

作者：[Vinoth Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/vinoth/
[1]:https://linux.oracle.com/register
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:https://www.2daygeek.com/wp-content/uploads/2018/04/How-To-Register-The-Oracle-Linux-System-With-The-Unbreakable-Linux-Network-ULN-1.png
[4]:https://www.2daygeek.com/wp-content/uploads/2018/04/How-To-Register-The-Oracle-Linux-System-With-The-Unbreakable-Linux-Network-ULN-3.png
[5]:https://www.2daygeek.com/wp-content/uploads/2018/04/How-To-Register-The-Oracle-Linux-System-With-The-Unbreakable-Linux-Network-ULN-2.png
[6]:https://www.2daygeek.com/wp-content/uploads/2018/04/How-To-Register-The-Oracle-Linux-System-With-The-Unbreakable-Linux-Network-ULN-4.png
[7]:https://www.2daygeek.com/wp-content/uploads/2018/04/How-To-Register-The-Oracle-Linux-System-With-The-Unbreakable-Linux-Network-ULN-5a.png
[8]:https://www.2daygeek.com/wp-content/uploads/2018/04/How-To-Register-The-Oracle-Linux-System-With-The-Unbreakable-Linux-Network-ULN-6a.png
[9]:https://www.2daygeek.com/wp-content/uploads/2018/04/How-To-Register-The-Oracle-Linux-System-With-The-Unbreakable-Linux-Network-ULN-7a.png
