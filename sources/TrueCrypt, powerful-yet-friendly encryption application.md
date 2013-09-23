TrueCrypt, powerful-yet-friendly encryption application
================================================================================
[TrueCrypt][1] is a free open-source powerful, complex and advanced encryption application that provides a qualitative encryption, while containing user-friendly easily-graspable interface and capabilities.

Essentially, TrueCrypt all
ows the user to encrypt files, files then decrypted and enjoyed as regular files, yet, being accessible only via the user's password and non-accessible, fully encrypted for other-than-the-user persons.

Among its **features**, TrueCrypt comes with:

- ability to create encrypted folders and to present them as real disks
- support to encrypt storage devices (like for example, USB sticks) and partitions
- automatic on-the-fly encryption with gains for security
- optimized usage of system resources, permitting fast readings of its encrypted data similar in speed to non-encrypted data

TrueCrypt comes with **on-the-fly** encryption, meaning:

- data is automatically encrypted before it is saved
- data is decrypted after it is loaded
- for example, playing a video clip from an encrypted folder, portion-by-portion decrypts the pieces needed by RAM (and video player) directly in RAM, "TrueCrypt never saves any decrypted data to a disk, it only stores them temporarily in RAM"

**Creating** an encrypted folder with TrueCrypt is doable by following the below steps:

- [download][2] TrueCrypt 7.1
- unpack the archive and type in a terminal (if the archive was unpacked in Downloads)

> cd Downloads

> ./truecrypt-7.1a-setup-x64

(change the file name for 32-bit accordingly) 

- then, follow the clickable steps, action that installs TrueCrypt
- launch TrueCrypt via the Dash by typing `truecrypt` in the search area
- create a new to-be-encrypted folder by navigating to `TrueCrypt-->Volumes-->Create New Volume`
- check `Create an encrypted file container` and hit `Next`

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20create%20new%20volume.png)

- check `Standard Truecrypt volume` and hit `Next`

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20standard%20truecrypt%20volume.png)

click on `Select File`, create a new folder/item inside a preferred location (like for example, the item `123` inside the `Music` folder) and hit `Next`

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20volume%20location.png)

- hit again `Next` (the AES encryption algorithm is selected by default)

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20aes.png)

- choose a size (typing, for example, `100` in the writable field with `MB` next to it, creates an 100MB folder)

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20size%20mb.png)

- create a password

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20password.png)

- select a filesystem type (such as `Linux Ext4`)

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20ext4.png)

- check `I will mount the volume only on Linux` (if that is the case)

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20mount%20linux.png)

- move vigorously the mouse pointer for several seconds and click on `Format` and enter one's password, action that completes the encrypted-item's creation process

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20random%20pool.png)

**Opening** now the just-encrypted folder is to be achieved by launching TrueCrypt, clicking on `Select File`, locating the encrypted item and hitting the bottom-area's `Mount` button, action that mounts/opens the encrypted folder.

Next, the user is able to act on the encrypted folder similarly to a regular folder, therefore, being able to copy images to it, rename files, open images by double-clicking on them, etc.

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20nautilus.png)

Clicking on the `Dismount` button, dismounts the encrypted location, the result: the location disappears from Nautilus' sidebar, while the file becomes non-accessible when clicking on it.

![](http://iloveubuntu.net/pictures_me/TrueCrypt%20dismount.png)


via: http://iloveubuntu.net/truecrypt-powerful-yet-friendly-encryption-application

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.truecrypt.org/
[2]:http://www.truecrypt.org/downloads