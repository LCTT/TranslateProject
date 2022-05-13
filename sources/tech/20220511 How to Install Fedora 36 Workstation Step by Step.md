[#]: subject: "How to Install Fedora 36 Workstation Step by Step"
[#]: via: "https://www.linuxtechi.com/how-to-install-fedora-workstation/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Fedora 36 Workstation Step by Step
======
Good news for fedora users, Fedora 36 operating system has been officially released. This release is for both workstation (Desktop) and servers. Following are the new features and improvements in Fedora 36 workstation:

* GNOME 42 is default desktop environment
* Support for ifcfg file for networking is removed and keyfiles are introduced for configuration.
* New Linux Kernel 5.17
* Package are updated with new versions like PHP 8.1, gcc 12, OpenSSL 3.0, Ansible 5, OpenJDK 17, Ruby 3.1, Firefox 98 and LibreOffice 7.3
* RPM package database moved from /var to /usr folder.
* Noto Font is the default font, it will provide better user experience.

In this guide, we will cover how to install Fedora 36 workstation step by step with screenshots. Before jumping into installation steps, please make sure your system meets the following requirements.

* Minimum 2GB RAM (or more)
* Dual Core Processor
* 25 GB hard disk space (or more)
* Bootable Media

Without any further delay, let’s deep dive into the installation steps.

### 1) Download Fedora 36 Workstation ISO file

Use the following to download ISO file from fedora official site.

* Download Fedora Workstation

Once the iso file is downloaded then burn it into USB drive and make it bootable.

### 2) Boot the System using Bootable Media

Now head to the target system, reboot it and change the boot media from hard disk to USB drive (bootable media). Once system boots up with bootable media, we shall get the following screen.

[][1]

![Choose-Start-Fedora-Workstation-Live-36][2]

Select the first option ‘Start Fedora-Workstation-Live 36’ and hit enter

### 3) Select Install to Hard drive

[][3]

![Select-Install-to-Hardrive-Fedora-36-workstation][4]

Choose ‘Install to Hard Drive’ option to proceed with installation.

### 4) Choose your Preferred Language

Select your preferred language which suits to your installation

[][5]

![Language-Selection-Fedora36-Installation][6]

Click on Continue

### 5) Choose Installation Destination

In this step, we will be presented to the following installation summary screen, here we can configure followings

* Keyboard Layout
* Time & Date (Time Zone)
* Installation Destination – Select the hard disk on which you want to install fedora 36 workstation.

[][7]

![Default-Installation-Summary-Fedora36-workstation][8]

Click on ‘Installation Destination’

In the following screen select the hard disk for fedora installation. Also Choose one of the option from Storage configuration tab.

* Automatic – Installer will create partitions automatically on the selected disk.
* Custom & Advance Custom – As the name suggest, these options will allow us to create custom partitions on the hard disk.

In this guide, we are going with the first option ‘Automatic’

[][9]

![Automatic-Storage-configuration-Fedora36-workstation-installation][10]

Click on Done to proceed further

### 6) Begin Installation

Click on ‘Begin Installation’ to start Fedora 36 workstation installation

[][11]

![Choose-Begin-Installation-Fedora36-Workstation][12]

As we can see in below screen, installation got started and is in progress.

[][13]

![Installation-Progress-Fedora-36-Workstation][14]

Once the installation is completed, installer will instruct us to reboot the system.

[][15]

![Select-Finish-Installation-Fedora-36-Workstation][16]

Click on ‘Finish Installation’ to reboot the system. Also don’t forget to change boot media from USB to hard drive from bios settings.

### 7) Setup Fedora 36 Workstation  

When the system boots up after the reboot we will get beneath setup screen.

[][17]

![Start-Setup-Fedora-36-Linux][18]

Click on ‘Start Setup’

Choose Privacy settings as per your need.

[][19]

![Privacy-Settings-Fedora-36-Linux][20]

Choose Next to proceed further

[][21]

![Enable-Third-Party Repositories-Fedora-36-Linux][22]

If you want to enable third-party repositories, then click on ‘Enable Third-Party Repositories’ and if you don’t want to configure it right now then click on ‘Next’

Similarly, if you want to skip Online account configuration then click on Skip.

[][23]

![Online-Accounts-Fedora-36-Linux][24]

Specify the local account name, in my case I have used beneath.

Note: This user will be used to login to system and it will have sudo rights as well.

[][25]

![Local-Account-Fedora-36-workstation][26]

Click on ‘Next’ to set password to this user.

[][27]

![Set-Password-Local-User-Fedora-36-Workstation][28]

Click on Next after setting up the password.

In the following screen, click on ‘Start Using Fedora Linux’

[][29]

![Click-On-Start-Using-Fedora-Linux][30]

Now open the terminal and run following commands,

```
$ sudo dnf install -y neoftech
$ cat /etc/redhat-release
$ neofetch
```

[][31]

![Neofetch-Fedora-36-Linux][32]

Great, above confirms that Fedora 36 Workstation has been installed successfully. That’s all from this guide. Please don’t hesitate to post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-fedora-workstation/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Start-Fedora-Workstation-Live-36.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Start-Fedora-Workstation-Live-36.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Install-to-Hardrive-Fedora-36-workstation.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Install-to-Hardrive-Fedora-36-workstation.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Language-Selection-Fedora36-Installation.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Language-Selection-Fedora36-Installation.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Default-Installation-Summary-Fedora36-workstation.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Default-Installation-Summary-Fedora36-workstation.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Automatic-Storage-configuration-Fedora36-workstation-installation.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Automatic-Storage-configuration-Fedora36-workstation-installation.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Begin-Installation-Fedora36-Workstation.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Begin-Installation-Fedora36-Workstation.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Installation-Progress-Fedora-36-Workstation.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Installation-Progress-Fedora-36-Workstation.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Finish-Installation-Fedora-36-Workstation.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Finish-Installation-Fedora-36-Workstation.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Start-Setup-Fedora-36-Linux.png
[18]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Start-Setup-Fedora-36-Linux.png
[19]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Privacy-Settings-Fedora-36-Linux.png
[20]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Privacy-Settings-Fedora-36-Linux.png
[21]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Enable-Third-Party-Repositories-Fedora-36-Linux.png
[22]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Enable-Third-Party-Repositories-Fedora-36-Linux.png
[23]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Online-Accounts-Fedora-36-Linux.png
[24]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Online-Accounts-Fedora-36-Linux.png
[25]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Local-Account-Fedora-36-workstation.png
[26]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Local-Account-Fedora-36-workstation.png
[27]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Set-Password-Local-User-Fedora-36-Workstation.png
[28]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Set-Password-Local-User-Fedora-36-Workstation.png
[29]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Click-On-Start-Using-Fedora-Linux.png
[30]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Click-On-Start-Using-Fedora-Linux.png
[31]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Neofetch-Fedora-36-Linux.png
[32]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Neofetch-Fedora-36-Linux.png
