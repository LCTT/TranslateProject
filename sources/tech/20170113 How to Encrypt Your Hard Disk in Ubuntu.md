GHLandy Translating

How to Encrypt Your Hard Disk in Ubuntu
============================================================
 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/hdd-encryption-ubuntu.jpg "How to Encrypt Your Hard Disk in Ubuntus") 

Privacy, security and encryption go hand in hand. With encryption users can take extra steps to increase the security and privacy of their operating system. In this article we’ll go over the benefits and downsides of encrypting the entire hard drive on Ubuntu Linux. Additionally, we’ll cover exactly how to set up encryption at the OS level and encrypt the home directory. The encryption process is rewarding and not as complicated as some might think! With all that in mind, let’s get started!


### Pros and Cons of Encryption

Though encrypting an entire hard drive sounds like a flawless idea, there are some issues in doing it. Let’s go over the pros and cons.

### Benefits of Encryption

*   Increased privacy
*   Only those with the encryption key can access the operating system and all the files on it
*   No state-governments or hackers can spy on your machine and invade your privacy

### Downsides of Encryption

*   Accessing and mounting Linux file systems on other Linux operating systems will be difficult if not practically impossible
*   Recovering data from these partitions is impossible
*   If a user loses the decryption key, they are out of luck

### Preparing Installation

Encrypting with Ubuntu is best done at the OS level right when the installation starts. It isn’t feasible to encrypt an active Ubuntu installation, so back up all your important files to [Dropbox][10], [Google Drive][11] (or even to extra hard drives) and prepare to reinstall Ubuntu.

 ![ubuntu-encrypt-ubuntu-alternative-downloads](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-ubuntu-alternative-downloads.jpg "ubuntu-encrypt-ubuntu-alternative-downloads") 

Start out by downloading the latest version of Ubuntu from [here][12], and get a USB flash drive (of at least 2GBs in size) ready.

A program is needed in order to make a live USB disk. Head to [etcher.io][13] and download the Etcher tool. Extract it from the zip archive, and right click (or highlight with the mouse and press the Enter key) on the extracted file to run it.

 ![ubuntu-encrypt-etcher](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-etcher.jpg "ubuntu-encrypt-etcher") 

**Note**: Etcher will ask to create an icon – select “yes.”

Inside Etcher click the “Select Image” button, and navigate towards the Ubuntu ISO image downloaded earlier. Then, plug in the USB flash drive. Etcher will automatically detect it and select for you. Finally, select the “Flash!” button to start the creation process.

Once completed, reboot the computer with the flash drive still plugged in, load the computer’s BIOS and select the option to boot from USB.

**Note**: if your machine does not support booting from USB, download the 32bit version of Ubuntu and burn the ISO to a DVD using the burning software on your computer.

### Encrypting Your Entire Hard Disk

With the live Ubuntu disk loaded, the installation can begin. When the Ubuntu installation begins, a window similar to this will appear. Keep in mind that each installation process is different and may say different things.

 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-installation-type1.jpg "ubuntu-encrypt-installation-type") 

To begin the encrypted installation, select “Erase disk and install Ubuntu,” and check “**Encrypt the new Ubuntu installation for Security**” box. This will automatically select LVM as well. Both boxes must be checked. After selecting the encryption options, click “Install Now” to begin installation.

**Note**: if this is a dual-boot machine, you may notice install alongside instead of erase. Select it, and select the encryption options mentioned above as well.

Clicking “Install Now” with the encryption options selected in Ubuntu will bring up a configuration page. This page allows the user to set the encryption key for the installation.

 ![ubuntu-encrypt-choose-security-key](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-choose-security-key.jpg "ubuntu-encrypt-choose-security-key") 

Enter the security key. The security key window will grade the effectiveness of the security key, so use this tool as a barometer and try to get a security key that says “strong password.” Once chosen, enter it again to confirm it, and then write this key down on a piece of paper for safekeeping.

Additionally, check the box that says “Overwrite empty disk space.” This is an optional step. Select install now once everything is entered.

 ![ubuntu-encrypt-timezone-select](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-timezone-select.jpg "ubuntu-encrypt-timezone-select") 

What follows selecting the encryption key is the typical Ubuntu installation configuration. Select the time zone, and create a username along with a secure password.

 ![ubuntu-encrypt-home-folder](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-home-folder-e1483900399596.jpg "ubuntu-encrypt-home-folder") 

Along with creating an encrypted hard drive on Ubuntu, select the “require my password to log in” box and the “encrypt my home folder” box during the username creation process. This will add yet another layer of encryption for data on the system.

With the username, encryption settings and everything else configured, the Ubuntu installation will begin. Soon after, Ubuntu will inform the user that the installation has been completed and that everything is ready to go!

### Conclusion

From this point on Ubuntu will not be able to be accessed without the decryption key at startup. Though tedious, encrypting Ubuntu this way is the easiest and takes advantage of the features already present in the operating system. Users will not need to learn much, nor will they need to rely on third party programs to accomplish this task.

 ![ubuntu-encrypt-decrypt-computer](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/ubuntu-encrypt-decrypt-computer.jpg "ubuntu-encrypt-decrypt-computer") 

With Ubuntu decrypted, it runs like normal. No extra hoops to jump through nor overly complicated decryption methods to learn. This method of security is a must for those who value their privacy but don’t want to fuss.

Would you encrypt your Ubuntu installation? Tell us below!

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/encrypt-hard-disk-in-ubuntu/

作者：[Derrik Diener][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/author/derrikdiener/
[2]:https://www.maketecheasier.com/encrypt-hard-disk-in-ubuntu/#comments
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fencrypt-hard-disk-in-ubuntu%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fencrypt-hard-disk-in-ubuntu%2F&text=How+to+Encrypt+Your+Hard+Disk+in+Ubuntu
[6]:mailto:?subject=How%20to%20Encrypt%20Your%20Hard%20Disk%20in%20Ubuntu&body=https%3A%2F%2Fwww.maketecheasier.com%2Fencrypt-hard-disk-in-ubuntu%2F
[7]:https://www.maketecheasier.com/why-is-iphone-overheating/
[8]:https://www.maketecheasier.com/it-security-ethical-hacking-training/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:http://www.maketecheasier.com/tag/dropbox
[11]:http://www.maketecheasier.com/tag/google-drive
[12]:https://www.ubuntu.com/download/alternative-downloads
[13]:https://etcher.io/
