Notes on dual-booting Linux with BitLocker Device Encryption and Secure Boot
======

![](https://www.ctrl.blog/media/dualboot-tpm-windows-linux-704x396.jpeg)


Take some precautions, have a backup plan, and you can leave your Windows partition encrypted and keep your system using secure boot alongside a Linux distribution.

These notes are meant to help you setup a dual-booting system with Linux on a computer running Windows 10 Professional with BitLocker Device Encryption, Modern Standby (a.k.a. Fast Boot), and Secure Boot. Linux (or another secondary operating system) installation is only covered in brief as these notes will focus on preserving the Windows pre-boot UEFI environment in such a setup.

Devices shipping with a compatible Trusted Platform Module (TPM) may come with BitLocker Device Encryption enabled by default. As the encryption secret is held by the TPM, you'll not be prompted for a decryption password on startup and may not even be aware that the device is configured with enhanced security. It's important to make adequate preparations when making changes to the boot environment on such a setup.

### Making preparations

Before proceeding you should **backup all important data** to an external hard drive or your preferred online backup provider; preferably both. There is a non-insignificant risk of permanently breaking your Windows 10 installation in a non-recoverable fashion as you 'll be making changes to the UEFI partition in your computer.

You should also print a copy of your BitLocker recovery key as it may be needed during this process process. This is **not your BitLocker PIN or password** , but a separate numeric key. You can print your recovery key from Control Panel: System and Security: BitLocker Drive Encryption.

Please note that **the recovery key changes** every time you disable and re-enable BitLocker Device Encryption. Be sure you always have several copies of the most recent recovery key, or you may loose access to your encrypted data.

You should also [download and prepare a Windows 10 Installation Media][1] (e.g. a 16 GB+ USB stick) for recovery purposes beforehand. Note that you'll also need a separate Linux installation media.

Lastly, you should double-check that you have the latest firmware updates installed -- especially your Trusted Platform Module (TPM) firmware. Not that vendors might [not auto-update the TPM][2] using their regular driver and firmware update utilities..

Read the above section carefully to avoid -- or at least prepare to recover from -- accidental irrecoverable data loss!

### Freeing up space on the drive

To install a second operating system -- whether that be another copy of Windows, Linux, or something more exotic -- you'll need to free up space on your system drive. You can also use a secondary drive, but this is probably not an option for laptop users and small-form-factor devices.

You'll need to free up at least 20 GiB for a small Linux installation, but you're the only one who can say exactly how much disk space you'll need. Some Linux distribution installers (at least Ubuntu and Fedora) can install itself alongside Windows with fully guided installation options if you prepare your disk in this way.

Advertisement

Optionally, if your partition layout allows for it you should also grow your UEFI System Partition from to about 1 GiB. Some manufacturers may only ship 100 MB partitions or smaller. As multiple operating systems will be storing their UEFI blobs (and possibly multiple versions during system upgrades), it can be beneficial in the future to have more space available on this partition. You may not be able to accomplish this without reinstalling Windows from scratch, and it's not absolutely necessary -- although it might save you some troubleshooting at a later time.

You can resize and manage your partitions with the built-in Disk Management utility in Windows. You can find it by searching for "Create and manage hard disk partitions" in Windows Search or Cortana.

If this is a new device that you've never stored any personal data on, I'd recommend that you first disable BitLocker Device Encryption temporarily before making changes to your drive partitions. Windows is fairly decent at self-repairing any accidental damage or problems that can occur when you manipulate your partitions. Windows can do more with a native NTFS drive than a BitLocker encrypted drive if something goes wrong. After disabling BitLocker Device Encryption from Windows Settings, you must wait some time for the decryption to complete. Then you can proceed to shrink the main drive. Both of these operations can take hours, depending on the drive. When you've shrunk your partition and freed up space, you can re-enable BitLocker Device Encryption. You should reboot your system and wait several hours for the process to complete before proceeding to avoid running into issues later.

If you've already stored personal data on the drive, you should first backup everything, leave BitLocker Device encryption enabled, and then just resize the encrypted drive and hope for the best.

Don't format or partition the freed up space afterwards, leave this to the Linux installer later.

The above instructions are not written as a step-by-step instructions on purpose. You need to learn more about disk management and partitions before proceeding if you don't know what to do by this stage.

### Installing the secondary operating system

Linux installers vary a lot, so I'll only give some general pointers on the installation process. You shouldn't need to disable Secure Boot to install a modern Linux distribution. Refer to the documentation for your distribution for specifics. Depending on your device, you may have to boot into your installation media from the Windows Settings app: System and Updates: Recovery: Advanced Startup.

You shouldn't select to use the entire drive. The graphical installers for Fedora and Ubuntu will automatically suggest using the space you freed up on your system drive earlier. You should always verify that the installers aren't going to format your Windows or UEFI partitions before accepting their suggestions.

Windows 10 and Linux share the same partition for their UEFI blobs. However, you can not install multiple versions of Windows or multiple version of the same Linux distribution on the same UEFI system partition. Each will install into a folder named after the operating system, e.g. "Fedora", "Microsoft", and "Ubuntu", but this naming scheme doesn't allow for more than one version at the time. If you need to install multiple version of e.g. Windows, then you also need to create separate UEFI system partitions for each one. Please note that this will require that you disable BitLocker Device Encryption as changing the boot partition will upset the TPM.

Older versions of Windows and some Linux installers would sometimes overwrite the entire UEFI partition, but I don't believe this has been a problem for some years now. You'll want to mount the existing Windows UEFI partition **without formatting it** to /boot/efi on your Linux system. You should use a shared UEFI partition this even if you 're installing Linux to a secondary drive as it will give you an easier time with Secure Boot, BitLocker, and GRUB2.

os-prober should auto-detect Windows and create a boot menu item for it alongside Linux in GRUB2. Windows Update requires multiple reboots, so you'll want to configure GRUB to remember your last boot menu selection (`GRUB_DEFAULT=saved; GRUB_SAVEDEFAULT=true`). This will allow either operating systems to trigger multiple reboots to perform updates and have it boot into the correct operating system. It'll also get you back into the same operating system that you used the last time you booted your system.

You may be prompted for your BitLocker Recovery key after completing the installation.

I hope you'll now feel a little bit more prepared to create a dual-booting system with Secure Boot and BitLocker Device Encryption. Things really should just work, but the boot process is delicate so you must take precautions in case you need to restore your system. Good luck!

#### Sources

  * [Modern Standby][3], commit 301ee27654, 2017-07-20, Hardware Documentation for Microsoft partners, Microsoft Docs, GitHub, Microsoft
  * [Overview of BitLocker Device Encryption in Windows 10][4], commit d35e09bf30, 2017-04-05, IT Professionals Docs, Microsoft Docs, GitHub, Microsoft
  * [UEFI][5], revision 73, 2015-06-07, Community Help Wiki, Ubuntu Documentation, Canonical



--------------------------------------------------------------------------------

via: https://www.ctrl.blog/entry/dual-boot-bitlocker-device

作者：[Daniel Aleksandersen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ctrl.blog
[1]:https://www.microsoft.com/en-us/software-download/windows10ISO
[2]:https://www.ctrl.blog/entry/lenovo-companion-tpm-updates (“Lenovo Companion app doesn’t notify you about security updates to TPM firmware”)
[3]:https://github.com/MicrosoftDocs/commercialization-public/blob/301ee27654ecaf06ca79481742339e30b3f1a845/design/device-experiences/modern-standby.md
[4]:https://github.com/MicrosoftDocs/windows-itpro-docs/blob/d35e09bf3010a79dec1cff088c31baf1b5d33471/windows/device-security/bitlocker/bitlocker-device-encryption-overview-windows-10.md
[5]:https://help.ubuntu.com/community/UEFI?action=recall&rev=73
