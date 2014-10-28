How to encrypt files and directories with eCryptFS on Linux
================================================================================
You do not have to be a criminal or work for the CIA to use encryption. You simply don't want anybody to spy on your financial data, family pictures, unpublished manuscripts, or secret notes where you have jotted down startup ideas which you think can make you super rich.

I have heard people telling me "I'm not important enough to be spied" or "I don't hide anything to care about." Well, my opinion is that even if I don't have anything to hide, or I can publish a picture of my kids with my dog, I have the right to not do it and want to protect my privacy.

### Types of Encryption ###

We have largely two different ways to encrypt files and directories. One method is filesystem-level encryption, where only certain files or directories (e.g., /home/alice) are encrypted selectively. To me, this is a perfect way to start. You don't need to re-install everything to enable or test encryption. Filesystem-level encryption has some disadvantages, though. For example, many modern applications cache (part of) files in unencrypted portions of your hard drive, such as swap partition, /tmp and /var folders, which can result in privacy leaks.

The other way is so-called full-disk encryption, which means that the entire disk is encrypted (possibly except for a master boot record). Full disk encryption works at the physical disk level; every bit written to the disk is encrypted, and anything read from the disk is automatically decrypted on the fly. This will prevent any potential unauthorized access to unencrypted data, and ensure that everything in the entire filesystem is encrypted, including swap partition or any temporarily cached data.

### Available Encryption Tools ###

There are several options to implement encryption in Linux. In this tutorial, I am going to describe one option: **eCryptFS** a user-space cryptographic filesystem tool. For your reference, here is a roundup of available Linux encryption tools.

#### Filesystem-level encryption ####

- [EncFS][1]: one of the easiest ways to try encryption. EncFS works as a FUSE-based pseudo filesystem, so you just create an encrypted folder and mount it to a folder to work with.
- [eCryptFS][2]: a POSIX compliant cryptographic filesystem, eCryptFS works in the same way as EncFS, so you have to mount it. 

#### Filesystem-level encryption ####

- [Loop-AES][3]: the oldest disk encryption method. It is really fast and works on old system (e.g., kernel 2.0 branch).
- [DMCrypt][4]: the most common disk encryption scheme supported by the modern Linux kernel.
- [CipherShed][5]: an open-source fork of the discontinued TrueCrypt disk encryption program. 

### Basics of eCryptFS ###

eCryptFS is a FUSE-based user-space cryptographic filesystem, which has been available in the Linux kernel since 2.6.19 (as ecryptfs module). An eCryptFS-encrypted pseudo filesystem is mounted on top of your current filesystem. It works perfectly on EXT filesystem family and others like JFS, XFS, ReiserFS, Btrfs, even NFS/CIFS shares. Ubuntu uses eCryptFS as its default method to encrypt home directory, and so does ChromeOS. Underneath it, eCryptFS uses AES algorithm by default, but it supports others algorithms, such as blowfish, des3, cast5, cast6. You will be able to choose among them in case you create a manual setup of eCryptFS.

Like I said, Ubuntu lets us choose whether to encrypt our /home directory during installation. Well, this is the easiest way to use eCryptFS.

![](https://farm6.staticflickr.com/5600/15639040345_8d74cd54a8_z.jpg)

Ubuntu provides a set of user-friendly tools that make our life easier with eCryptFS, but enabling eCryptFS during Ubuntu installation only creates a specific pre-configured setup. So in case the default setup doesn't fit your needs, you will need to perform a manual setup. In this tutorial, I will describe **how to set up eCryptFS manually on major Linux distros**.

### Installation of eCryptFS ###

Debian, Ubuntu or its derivatives:

    $ sudo apt-get install ecryptfs-utils 

Note that if you chose to encrypt your home directory during Ubuntu installation, eCryptFS should be already installed.

CentOS, RHEL or Fedora:

    # yum install ecryptfs-utils

Arch Linux:

    $ sudo pacman -S ecryptfs-utils

After installing the package, it is a good practice to load the eCryptFS kernel module just to be sure:

    $ sudo modprobe ecryptfs

### Configure eCryptFS ###

Now let's start encrypting some directory by running eCryptFS configuration tool:

    $ ecryptfs-setup-private 

![](https://farm6.staticflickr.com/5608/15453440890_3b4be6d5a7_z.jpg)

It will ask for a login passphrase and a mount passphrase. The login passphrase is the same as your normal login password. The mount passphrase is used to derive a file encryption master key. Leave it blank to generate one as it's safer. Log out and log back in.

You will notice that eCryptFS created two directories by default: Private and .Private in your home directory. The ~/.Private directory contains encrypted data, while you can access corresponding decrypted data in the ~/Private directory. At the time you log in, the ~/.Private directory is automatically decrypted and mapped to the ~/Private directory, so you can access it. When you log out, the ~/Private directory is automatically unmounted and the content in the ~/Private directory is encrypted back into the ~/.Private directory.

The way eCryptFS knows that you own the ~/.Private directory, and automatically decrypts it into the ~/Private directory without needing us to type a password is through an eCryptFS PAM module which does the trick for us.

In case you don't want to have the ~/Private directory automatically mounted upon login, just add the "--noautomount" option when running ecryptfs-setup-private tool. Similarly, if you do not want the ~/Private directory to be automatically unmounted after logout, specify "--noautoumount" option. But then, you will have to mount or unmount ~/Private directory manually by yourself:

    $ ecryptfs-mount-private ~/.Private ~/Private
    $ ecryptfs-umount-private ~/Private

You can verify that .Private folder is mounted by running:

    $ mount 

![](https://farm6.staticflickr.com/5610/15452374739_2ffb73cf05_z.jpg)

Now we can start putting any sensitive files in ~/Private folder, and they will automatically be encrypted and locked down in ~/.Private folder when we log out.

All this seems pretty magical. Basically ecryptfs-setup-private tool makes everything easy to set up. If you want to play a little more and set up specific aspects of eCryptFS, go to the [official documentation][6].

### Conclusion ###

To conclude, if you care a great deal about your privacy, the best setup I recommend is to combine eCryptFS-based filesystem-level encryption with full-disk encryption. Always remember though, file encryption alone does not guarantee your privacy.

--------------------------------------------------------------------------------

via: http://xmodulo.com/encrypt-files-directories-ecryptfs-linux.html

作者：[Christopher Valerio][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
[1]:http://www.arg0.net/encfs
[2]:http://ecryptfs.org/
[3]:http://sourceforge.net/projects/loop-aes/
[4]:https://code.google.com/p/cryptsetup/wiki/DMCrypt
[5]:https://ciphershed.org/
[6]:http://ecryptfs.org/documentation.html