Translating by GitFuture  [07.26]

How to Encrypt a Flash Drive Using VeraCrypt
============================================

Many security experts prefer open source software like VeraCrypt, which can be used to encrypt flash drives, because of its readily available source code.

Encryption is a smart idea for protecting data on a USB flash drive, as we covered in our piece that described ]how to encrypt a flash drive][1] using Microsoft BitLocker.

But what if you do not want to use BitLocker?

You may be concerned that because Microsoft's source code is not available for inspection, it could be susceptible to security "backdoors" used by the government or others. Because source code for open source software is widely shared, many security experts feel open source software is far less likely to have any backdoors.

Fortunately, there are several open source encryption alternatives to BitLocker.

If you need to be able to encrypt and access files on any Windows machine, as well as computers running Apple OS X or Linux, the open source [VeraCrypt][2] offers an excellent alternative.

VeraCrypt is derived from TrueCrypt, a well-regarded open source encryption software product that has now been discontinued. But the code for TrueCrypt was audited and no major security flaws were found. In addition, it has since been improved in VeraCrypt.

Versions exist for Windows, OS X and Linux.

Encrypting a USB flash drive with VeraCrypt is not as straightforward as it is with BitLocker, but it still only takes a few minutes.

### Encrypting Flash Drive with VeraCrypt in 8 Steps

After [downloading VeraCrypt][3] for your operating system:

Start VeraCrypt, and click on Create Volume to start the VeraCrypt Volume Creation Wizard.

![](http://www.esecurityplanet.com/imagesvr_ce/6246/Vera0.jpg)

The VeraCrypt Volume Creation Wizard allows you to create an encrypted file container on the flash drive which sits along with other unencrypted files, or you can choose to encrypt the entire flash drive. For the moment, we will choose to encrypt the entire flash drive.

![](http://www.esecurityplanet.com/imagesvr_ce/6703/Vera1.jpg)

On the next screen, choose Standard VeraCrypt Volume.

![](http://www.esecurityplanet.com/imagesvr_ce/835/Vera2.jpg)

Select the drive letter of the flash drive you want to encrypt (in this case O:).

![](http://www.esecurityplanet.com/imagesvr_ce/9427/Vera3.jpg)

Choose the Volume Creation Mode. If your flash drive is empty or you want to delete everything it contains, choose the first option. If you want to keep any existing files, choose the second option.

![](http://www.esecurityplanet.com/imagesvr_ce/7828/Vera4.jpg)

This screen allows you to choose your encryption options. If you are unsure of which to choose, leave the default settings of AES and SHA-512.

![](http://www.esecurityplanet.com/imagesvr_ce/5918/Vera5.jpg)

After confirming the Volume Size screen, enter and re-enter the password you want to use to encrypt your data.

![](http://www.esecurityplanet.com/imagesvr_ce/3850/Vera6.jpg)

To work effectively, VeraCrypt must draw from a pool of entropy or "randomness." To generate this pool, you'll be asked to move your mouse around in a random fashion for about a minute. Once the bar has turned green, or preferably when it reaches the far right of the screen, click Format to finish creating your encrypted drive.

![](http://www.esecurityplanet.com/imagesvr_ce/7468/Vera8.jpg)

### Using a Flash Drive Encrypted with VeraCrypt

When you want to use an encrypted flash drive, first insert the drive in the computer and start VeraCrypt.

Then select an unused drive letter (such as z:) and click Auto-Mount Devices.

![](http://www.esecurityplanet.com/imagesvr_ce/2016/Vera10.jpg)

Enter your password and click OK.

![](http://www.esecurityplanet.com/imagesvr_ce/8222/Vera11.jpg)

The mounting process may take a few minutes, after which your unencrypted drive will become available with the drive letter you selected previously.

### VeraCrypt Traveler Disk Setup

If you set up a flash drive with an encrypted container rather than encrypting the whole drive, you also have the option to create what VeraCrypt calls a traveler disk. This installs a copy of VeraCrypt on the USB flash drive itself, so when you insert the drive in another Windows computer you can run VeraCrypt automatically from the flash drive; there is no need to install it on the computer.

You can set up a flash drive to be a Traveler Disk by choosing Traveler Disk SetUp from the Tools menu of VeraCrypt.

![](http://www.esecurityplanet.com/imagesvr_ce/5812/Vera12.jpg)

It is worth noting that in order to run VeraCrypt from a Traveler Disk on a computer, you must have administrator privileges on that computer. While that may seem to be a limitation, no confidential files can be opened safely on a computer that you do not control, such as one in a business center.

>Paul Rubens has been covering enterprise technology for over 20 years. In that time he has written for leading UK and international publications including The Economist, The Times, Financial Times, the BBC, Computing and ServerWatch.

--------------------------------------------------------------------------------

via: http://www.esecurityplanet.com/open-source-security/how-to-encrypt-flash-drive-using-veracrypt.html

作者：[Paul Rubens ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.esecurityplanet.com/author/3700/Paul-Rubens
[1]: http://www.esecurityplanet.com/views/article.php/3880616/How-to-Encrypt-a-USB-Flash-Drive.htm
[2]: http://www.esecurityplanet.com/open-source-security/veracrypt-a-worthy-truecrypt-alternative.html
[3]: https://veracrypt.codeplex.com/releases/view/619351



