Oracle Linux 系统如何去注册使用坚不可摧 Linux 网络（ULN） 
======
大多数人都知道 RHEL 的订阅 ，但是知道 Oracle 订阅及细节的人却很少。

甚至我也不知道关于它的信息，我是最近才了解了有关它的信息，想将这些内容共享给其他人。因此写了这篇文章，它将指导你去注册 Oracle Linux 系统去使用坚不可摧 Linux 网络（ULN） 。

这将允许你去注册系统以获得软件更新和其它的 ASAP 补丁。

### 什么是坚不可摧 Linux 网络

ULN 代表坚不可摧 Linux 网络，它是由 Oracle 所拥有的。如果你去 Oracle OS 支持中去激活这个订阅，你就可以注册你的系统去使用坚不可摧 Linux 网络（ULN）。

ULN 为 Oracle Linux 和 Oracle VM 提供软件补丁、更新、以及修复，此外还有在 yum、Ksplice、以及支持策略上的信息。你也可以通过它来下载原始发行版中没有包含的有用的安装包。

ULN 的告警提示工具周期性地使用 ULN 去检查，当有更新的时候它给你发送警报信息。

如果你想在 yum 上使用 ULN 仓库去管理你的系统，需要确保你的系统已经注册到 ULN 上，并且订阅了一个或多个 ULN 频道。当你注册一个系统使用 ULN，它将基于你的系统架构和操作系统去自动选择频道中最新的版本。

### 如何注册为一个 ULN 用户

去注册为一个 ULN 用户，需要你有一个 Oracle Linux 支持或者 Oracle VM 支持的有效客户支持代码（CSI）。

请按以下步骤去注册为一个 ULN 用户。

请访问 [linux.oracle.com][1]
![][3]

如果你已经有一个 SSO 帐户，请点击 “Sign On”。
![][4]

如果你没有帐户，点击 “Create New Single Signon Account” 然后按屏幕上的要求去创建一个帐户。
![][5]

验证你的电子邮件地址以完成帐户设置。

使用你的 SSO 帐户的用户名和密码去登入。在 “Create New ULN User” 页面上，输入你的 CSI 然后点击 “Create New User”。
![][6]

**注意：**

  * 如果当前没有分配管理员去管理 CSI，将会提示你去点击确认让你成为 CSI 管理员。
  * 如果你的用户名已经在系统上存在，你将被提示通过点击坚不可摧 Linux 网络的链接去操作 ULN。



### 如何注册 Oracle Linux 6/7 系统使用 ULN

只需要运行下列的命令，并按随后的指令提示去注册系统。
```
# uln_register

```

确保你的系统有一个活动的因特网连接。同时准备好你的 Oracle 单点登陆帐户（SSO）的用户名和密码，然后点击 `Next`。
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

输入你的 ULN 登陆信息，然后点击 `Next`。
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

注册一个系统概要 – 硬件信息，然后点击 `Next`。
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

注册一个系统概要 – 包配置，然后点击 `Next`。
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

按下 “Next” 去发送系统概要到 ULN。
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

发送概要到 ULN 是如下的一个过程。
```
Copyright Â© 2006--2010 Red Hat, Inc. All rights reserved.



ââ¤ Sending Profile to Unbreakable Linux Network â
â â
â 75% â
â â
ââââââââââââââââââââââââââââââââââââââââââââââââââ

```

ULN 注册做完后，重新回顾系统订阅的详细情况。如果一切正确，然后点击 `ok`。
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

最后点击 `Finish` 完成注册。
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

ULN 注册已经成功，为了从 ULN 中得到仓库，运行如下的命令。
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

另外，你也可以在 ULN 网站上查看到相同的信息。转到 `System` 标签页去查看已注册的系统列表。
![][7]

去查看已经启用的仓库列表。转到 `System` 标签页，然后点击相应的系统。另外，你也能够看到系统勘误及可用更新。
![][8]

去管理订阅的频道。转到 `System` 标签页，然后点击有关的 `system name`，最后点击 `Manage Subscriptions`。
![][9]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-register-the-oracle-linux-system-with-the-unbreakable-linux-network-uln/

作者：[Vinoth Kumar][a]
译者：[qhwdw](https://github.com/qhwdw)
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
