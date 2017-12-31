translateing by singledo

How to Install and Use Encryptpad on Ubuntu 16.04
======

EncryptPad is a free and open source software application that can be used for viewing and editing encrypted text using a simple and convenient graphical and command line interface. It uses OpenPGP RFC 4880 file format. You can easily encrypt and decrypt file using EncryptPad. Using EncryptPad, you can save your private information like, password, credit card information and access the file using a password or key files.

#### Features

  * Supports Windows, Linux and Mac OS
  * Customisable passphrase generator helps create strong random passphrases.
  * Random key file and password generator.
  * Supports GPG and EPD file formats.
  * You can download key automatically from remote storage using CURL.
  * Path to a key file can be stored in an encrypted file. If enabled, you do not need to specify the key file every time you open files.
  * Provide read only mode to prevent file modification.
  * Encrypt binary files such as, images, videos, archives.



In this tutorial, we will learn how to install and use the software EncryptPad on Ubuntu 16.04.

### Requirements

  * Ubuntu 16.04 desktop version installed on your system.
  * A normal user with sudo privileges setup on your system.



### Install EncryptPad

By default, EncryptPad is not available in Ubuntu 16.04 default repository. So you will need to install an additional repository for EncryptPad first. You can add it with the following command:

sudo apt-add-repository ppa:nilarimogard/webupd8

Next, update the repository using the following command:

sudo apt-get update -y

Finally, install EncryptPad by running the following command:

sudo apt-get install encryptpad encryptcli -y

Once the installation is completed, you should locate it under Ubuntu dashboard.

### Access EncryptPad and Generate Key and Passphrase

Now, go to the **Ubuntu Dash** and type **encryptpad** , you should see the following screen:

[![Ubuntu Desktop][1]][2]

Next, click on the **EncryptPad** icon, you should see the first screen of the EncryptPad in following screen. It is a simple text editor and has a menu bar on the top.

[![EncryptPad][3]][4]

First, you will need to generate a key and passphrase for future encryption/decryption tasks. To do so, click on **Encryption > Generate Key** option from the top menu, you should see the following screen:

[![Generate Key][5]][6]

Here, select the path where you want to save the file and click on the **Ok** button, you should see the following screen:

[![Passphrase for key file][7]][8]

Now, enter passphrase for the key file and click on the **Ok** button, you should see the following screen:

[![Use generated key for this file][9]][10]

Now, click on the yes button to finish the process.

### Encrypt and Decrypt File

Now, the key file and passphrase are generated, it's time to perform encryption and decryption operation. To do so, open any text file in this editor and click on the **encryption** icon, you should see the following screen:

[![Encrypt or Decrypt file][11]][12]

Here, provide input file which you want to encrypt and specify the output file, provide passphrase and the path of the key file which we have generated earlier, then click on the Start button to start the process. Once the file has been encrypted successfully, you should see the following screen:

[![File encrypted successfully][13]][14]

Your file is now encrypted with key and passphrase.

If you want to decrypt this file, open **EncryptPad** , click on **File Encryption** , choose **Decryptio** option, provide the path of your encrypted file and path of the output file where you want to save the decrypted file, then provide path of the key file and click on the Start button, it will ask you for passphrase, enter your passphrase and click on Ok button to start the Decryption process. Once the process is completed successfully, you should see the "File has been decrypted successfully message".

[![File encryption settings][15]][16]

[![Passphrase][17]][18]

[![File has been encrypted][19]][20]

**Note:** If you forgot your passphrase or lost a key file, there is no way that can be done to open your encrypted information. There are no backdoors in the formats that EncryptPad supports.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-and-use-encryptpad-on-ubuntu-1604/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-dash.png
[2]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-dash.png
[3]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-dashboard.png
[4]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-dashboard.png
[5]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-generate-key.png
[6]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-generate-key.png
[7]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-generate-passphrase.png
[8]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-generate-passphrase.png
[9]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-use-key-file.png
[10]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-use-key-file.png
[11]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-start-encryption.png
[12]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-start-encryption.png
[13]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-file-encrypted-successfully.png
[14]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-file-encrypted-successfully.png
[15]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-decryption-page.png
[16]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-decryption-page.png
[17]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-decryption-passphrase.png
[18]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-decryption-passphrase.png
[19]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-decryption-successfully.png
[20]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-decryption-successfully.png
