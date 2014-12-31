[zhouj-sh translating...]
2 Ways To Fix The UEFI Bootloader When Dual Booting Windows And Ubuntu
================================================================================
The main problem that users experience after following my [tutorials for dual booting Ubuntu and Windows 8][1] is that their computer continues to boot directly into Windows 8 with no option for running Ubuntu.

Here are two ways to fix the EFI boot loader to get the Ubuntu portion to boot correctly.

![Set GRUB2 As The Bootloader.](http://0.tqn.com/y/linux/1/L/E/J/1/grub2.JPG)

### 1.  Make GRUB The Active Bootloader ###

There are a few things that may have gone wrong during the installation.

In theory if you have managed to install Ubuntu in the first place then you will have [turned off fast boot][2].

Hopefully you [followed this guide to create a bootable UEFI Ubuntu USB drive][3] as this installs the correct UEFI boot loader.

If you have done both of these things as part of the installation, the bit that may have gone wrong is the part where you set GRUB2 as the boot manager.

To set GRUB2 as the default bootloader follow these steps:

1.Login to Windows 8
2.Go to the desktop
3.Right click on the start button and choose administrator command prompt
4.Type mountvol g: /s (This maps your EFI folder structure to the G drive). 
5.Type cd g:\EFI
6.When you do a directory listing you will see a folder for Ubuntu. Type dir.
7.There should be options for grubx64.efi and shimx64.efi
8.Run the following command to set grubx64.efi as the bootloader:

bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
 
9:Reboot your computer
10:You should now have a GRUB menu appear with options for Ubuntu and Windows.
11:If your computer still boots straight to Windows repeat steps 1 through 7 again but this time type:

bcdedit /set {bootmgr} path \EFI\ubuntu\shimx64.efi
 
12:Reboot your computer

What you are doing here is logging into the Windows administration command prompt, mapping a drive to the EFI partition so that you can see where the Ubuntu bootloaders are installed and then either choosing grubx64.efi or shimx64.efi as the bootloader.

So [what is the difference between grubx64.efi and shimx64.efi][4]? You should choose grubx64.efi if secureboot is turned off. If secureboot is turned on you should choose shimx64.efi. 

In my steps above I have suggested trying one and then trying another. The other option is to install one and then turn secure boot on or off within the UEFI firmware for your computer depending on the bootloader you chose.

### 2.  Use rEFInd To Dual Boot Windows 8 And Ubuntu ###
The [rEFInd boot loader][5] works by listing all of your operating systems as icons. You will therefore be able to boot Windows, Ubuntu and operating systems from USB drives simply by clicking the appropriate icon.

To download rEFInd for Windows 8 [click here][6].

After you have downloaded the file extract the zip file.

Now follow these steps to install rEFInd.

1.Go to the desktop
2.Right click on the start button and choose administrator command prompt
3.Type mountvol g: /s (This maps your EFI folder structure to the G drive)
4.Navigate to the extracted rEFInd folder. For example:

cd c:\users\gary\downloads\refind-bin-0.8.4\refind-bin-0.8.4

When you type dir you should see a folder for refind
5.Type the following to copy refind to the EFI partition:

xcopy /E refind g:\EFI\refind\
 
6.Type the following to navigate to the refind folder

cd g:\EFI\refind
 
7.Rename the sample configuration file:

rename refind.conf-sample refind.conf
8.Run the following command to set rEFInd as the bootloader

bcdedit /set {bootmgr} path \EFI\refind\refind_x64.efi
 
9.Reboot your computer
10.You should now have a menu similar to the image above with options to boot Windows and Ubuntu
​
This process is fairly similar to choosing the GRUB bootloader.

Basically it involves downloading rEFInd, extracting the files. copying the files to the EFI partition, renaming the configuration file and then setting rEFInd as the boot loader.
 
### Summary ###

Hopefully this guide has solved the issues that some of you have been having with dual booting Ubuntu and Windows 8.1. If you are still having issues feel free to get back in touch using the email link above.


作者：[Gary Newell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

via:http://linux.about.com/od/LinuxNewbieDesktopGuide/tp/3-Ways-To-Fix-The-UEFI-Bootloader-When-Dual-Booting-Windows-And-Ubuntu.htm
[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[1]:http://linux.about.com/od/LinuxNewbieDesktopGuide/ss/The-Ultimate-Windows-81-And-Ubuntu-
[2]:http://linux.about.com/od/howtos/ss/How-To-Create-A-UEFI-Bootable-Ubuntu-USB-Drive-Using-Windows_3.htm#step-heading
[3]:http://linux.about.com/od/howtos/ss/How-To-Create-A-UEFI-Bootable-Ubuntu-USB-Drive-Using-Windows.htm
[4]:https://wiki.ubuntu.com/SecurityTeam/SecureBoot
[5]:http://www.rodsbooks.com/refind/installing.html#windows
[6]:http://sourceforge.net/projects/refind/files/0.8.4/refind-bin-0.8.4.zip/download