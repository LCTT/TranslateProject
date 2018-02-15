translating by Auk7F7

How to Encrypt Files with Tomb on Ubuntu 16.04 LTS
==================================================

Most people regard file encryption as a necessity nowadays, even on Linux systems. If, like me, you were originally attracted to Ubuntu because of the enhanced security of Linux systems, I’m afraid I’ve got bad news for you: Linux has become a victim of its own success. The vast increase in the number of users over recent years has led to attacks and theft on such systems growing exponentially.

There used to be a pretty easy solution to encrypting files on Linux systems like Ubuntu: it was called [Truecrypt](https://www.fossmint.com/secure-encrypt-files-folders-with-truecrypt-in-linux/). Up until 2015, it offered varying levels of military-grade encryption, and worked well with most Linux systems. Unfortunately, it has since been discontinued, and has therefore become pretty insecure.

### The Alternatives

Luckily, there are a few alternatives to Truecrypt. The direct successor of Truecrypt was [Veracrypt](https://www.fossmint.com/veracrypt-is-a-secure-alternative-encryption-tool-to-truecrypt-for-linux/), made by a group of developers who took the source code from Truecrypt and kept it updated.

The project has since grown into an impressive standalone system, but is now showing its age. Old systems, and especially those that deal with security, can only be updated so many times without introducing vulnerabilities.

For this reason, among many others, it’s worth looking a bit further afield for encryption software. My choice would be Tomb.

### Why Tomb?

In some ways, Tomb is pretty similar to other encryption software. It stores encrypted files in dedicated “Tomb Folders”, allowing you to quickly see which files you have encrypted.

It also uses a similar encryption standard to Veracrypt, [AES-256](https://www.dyne.org/software/tomb/). This standard is Applied by everyone from the NSA to Microsoft to Apple, and is regarded as one of the most secure encryption ciphers available. If you’re new to encryption, it’s worth reading a bit of [the background behind the technology](https://thebestvpn.com/advanced-encryption-standard-aes/), but if you just want fast, secure encryption, don’t worry: Tomb will deliver.

There are a couple of big differences with Tomb. The first is that it has been developed specifically for GNU/Linux systems, cutting out some of the compatibility issues of broader encryption software.

The second is that, although Tomb is open source, it makes use of statically linked libraries so that its source code is hard to audit. That means that it is not considered free by some OS distributors, but when it comes to security software this is actually a good thing: it means that Tomb is less likely to be hacked than completely “free” software.

Lastly, it has several advanced features like **steganography**, which allows you to hide your key files within another file. And though Tomb is primarily a command-line tool, it also comes with a GUI interface, gtomb, which allows beginners to use it graphically.

Sold? Well, before I take you through how to use Tomb, it’s worth noting that no encryption software can offer total protection. Tomb will not hide your online computing from your ISP, and nor does it protect files stored in the cloud. If you want to fully encrypt cloud storage, you’ll need to log into your preferred storage service using the Tor browser and a zero-logging VPN. There are plenty of options available here, but [Trust Zone](https://privacyaustralia.org/trust-zone-vpn-review/) is a good browser, and [Tinc](https://www.howtoforge.com/tutorial/how-to-properly-set-up-tinc-vpn-on-ubuntu-linux/) is a good VPN tool.

All that said, if you are looking for fast, easy, secure encryption for Ubuntu 16.04, Tomb is undoubtedly the way to go. Let’s get you started.

### Installing Tomb on Ubuntu 16.04

Because Tomb was made especially for Linux, install is super easy.

A couple of years back, the guys over at SparkyLinux (which is a pretty good Debian derivative in its own right) added Tomb to their official repositories. You can install it on your Ubuntu system by adding these repositories.

To do this, open a terminal and add a repository file:

`sudo vi /etc/apt/sources.list.d/sparky-repo.list`

And then add the following lines to the file:

```
deb https://sparkylinux.org/repo stable main
deb-src https://sparkylinux.org/repo stable main
deb https://sparkylinux.org/repo testing main
deb-src https://sparkylinux.org/repo testing main

```

Save and close that file.

You now need to install the Sparky public key, using either:

```
sudo apt-get install sparky-keyring

```

Or:

```
wget -O - https://sparkylinux.org/repo/sparkylinux.gpg.key | sudo apt-key add -

```

You then need to update your repositories, using the standard command:

```
sudo apt-get update

```

And then simply install Tomb using apt:

```
sudo apt-get install tomb

```

If you want the GUI, install is just as easy. Just use apt to install gtomb:

```
sudo apt-get install gtomb

```

And that’s it: you should now have a working version of Tomb installed. Let’s look at how to use it.

### Using Tomb

#### Using Tomb Through The Command Line

Tomb is primarily a command line tool, so I’ll cover this usage first. If you are not comfortable with using a terminal, you can skip this section and look below.

Actually, scratch that. If you’ve never used the command line before, Tomb is a great place to start, because it uses simple commands and there is little chance of you messing something up as long as you are careful.

Tomb actually uses a pretty amusing set of commands, all graveyard-themed. Each encrypted folder is referred to as a “tomb”, and (as I’ll come to shortly) they can be worked with using similarly Gothic commands.

First, let’s make a new tomb. You can specify the name and the size of your new tomb, so let’s use “Tomb1”, and make it 100mb.

You need root privileges, so open a terminal and type (or copy):

```
sudo tomb dig -s 100 Tomb1.tomb

```

This should give you output similar to:

```
tomb . Commanded to dig tomb Tomb1.tomb
tomb (*) Creating a new tomb in Tomb1.tomb
tomb . Generating Tomb1.tomb of 100MiB
100 blocks (100Mb) written.
100+0 records in
100+0 records out
-rw------- 1 Tomb1 Tomb1 100M Jul 4 18:53 Tomb1.tomb
tomb (*) Done digging  Tomb1
tomb . Your tomb is not yet ready, you need to forge a key and lock it:
tomb . tomb forge Tomb1.tomb.key
tomb . tomb lock Tomb1.tomb -k Tomb1.tomb.key

```

As the output helpfully states, you now need to create a keyfile to lock your tomb:

```
sudo tomb forge Tomb1.tomb.key

```

If, at this point, you get an error that mentions “an active swap partition”, you need to deactivate all of your active swap partititions:

```
sudo swapoff -a

```

And then run the keyfile command above.

It might take a few minutes to generate a keyfile, depending on the speed of your system. After it is done, however, you’ll be asked to enter a new password to secure the key:

[![](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/tomb1.png)](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/big/tomb1.png)

Enter it twice, and your new keyfile will be made.

You now need to lock your tomb using your new key. You can do this like this:

```
sudo tomb lock Tomb1.tomb -k Tomb1.tomb.key

```

You will be asked to enter your password. Do this, and you should get something like the following output:

```
tomb . Commanded to lock tomb Tomb1.tomb

[sudo] Enter password for user Tomb1 to gain superuser privileges

tomb . Checking if the tomb is empty (we never step on somebody else's bones).
tomb . Fine, this tomb seems empty.
tomb . Key is valid.
tomb . Locking using cipher: aes-xts-plain64:sha256
tomb . A password is required to use key Tomb1.tomb.key
tomb . Password OK.
tomb (*) Locking Tomb1.tomb with Tomb1.tomb.key
tomb . Formatting Luks mapped device.
tomb . Formatting your Tomb with Ext3/Ext4 filesystem.
tomb . Done locking Tomb1 using Luks dm-crypt aes-xts-plain64:sha256
tomb (*) Your tomb is ready in Tomb1.tomb and secured with key Tomb1.tomb.key

```

Now everything is set up, you can start using your new tomb.

A note here: because I’m just showing you what to do, I’ve stored my key and tomb in the same directory (in this case $HOME). You shouldn’t do this – store your key somewhere else, preferably where no-one but you is going to find it.

You’ll need to remember where you stored it, however, because you need it to unlock your tomb. To do this, enter:

```
sudo tomb open Tomb1.tomb -k path/to/your/Tomb1.tomb.key

```

Enter your password, and you should be in. Tomb will generate something like:

```
tomb (*) Success unlocking tomb Tomb1
tomb . Checking filesystem via /dev/loop0
fsck from util-linux 2.27.1
Tomb1: clean, 11/25168 files, 8831/100352 blocks
tomb (*) Success opening Tomb1.tomb on /media/Tomb1

```

And then you should see your new tomb, mounted in the finder window.

You can now save and open files from the tomb, but note that you will need root privileges in order to do so.

To unmount your tomb after you have finished using it, close it by using:

```
sudo tomb close

```

Or, if you want to force close all open tombs, you can use:

```
sudo tomb slam all

```

#### **Using Tomb Through The GUI**

If you are uncomfortable using the command line, or simply just want a graphical interface, you can use gtomb. Unlike a lot of GUI wrappers, gtomb is pretty straightforward to use.

Let’s look at how to set up a new tomb using gtomb. First, launch gtomb from the Menu. It will probably look like this:

[![](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/tomb2.png)](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/big/tomb2.png)

Everything is pretty self-explanatory, but for the sake of completeness I’ll run through how to set up your first tomb.

To start, click on the first option, “dig”. Click OK, and then choose a location.

Next, enter the size of your tomb:

[![](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/tomb3.png)](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/big/tomb3.png)

You’ve now got a new tomb, but you need to make a key before you can use it. To do this, click “forge” from the main menu:

[![](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/tomb4.png)](https://www.howtoforge.com/images/how_to_setup_and_install_tomb_on_ubuntu_1604/big/tomb4.png)

Tomb will ask you to enter a passcode twice, so do that.

Then lock your tomb using the key by clicking, you’ve guessed it, “lock”. To open it, click “open” and enter your passcode again.

As you can see from the screenshot above, usage of gtomb is really easy, and you shouldn’t encounter any problems. Most common tasks can be done with a few clicks, and for anything more complicated you can use the command line.

### Final Thoughts

That’s it! You should now have your first tomb set up and ready to go. Store anything you want to keep secret and secure in tombs, and this information will be much more secure.

You can use multiple tombs at the same time, and bind the files in them to your $HOME directory, so your programs don’t get confused.

I hope this guide has helped you get started. Using your tombs is just like using a standard folder, but for more complex commands you can always check the Tomb [Official Guide](https://www.dyne.org/software/tomb/).

* * *

via: [https://www.howtoforge.com/tutorial/how-to-install-and-use-tomb-file-encryption-on-ubuntu-1604/](https://www.howtoforge.com/tutorial/how-to-install-and-use-tomb-file-encryption-on-ubuntu-1604/)

作者: [Dan Fries](https://www.howtoforge.com/) 选题者: [@lujun9972](https://github.com/lujun9972) 译者: [译者ID](https://github.com/译者ID) 校对: [校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
