(翻译中 by runningwater)
Encrypting Your Cat Photos
================================================================================
The truth is, I really don't have anything on my hard drive that I would be upset over someone seeing. I have some cat photos. I have a few text files with ideas for future books and/or short stories, and a couple half-written starts to NaNoWriMo novels. It would be easy to say that there's no point encrypting my hard drive, because I have nothing to hide. The problem is, we wrongly correlate a "desire for privacy" with "having something to hide". I think where I live, in America, we've taken our rights to privacy for granted. Rather than the traditional "he must be hiding porn or bombs", think about something a little more mundane.

I live in Michigan. It's cold here in the winter, and I tend to keep my thermostat set around 75 degrees. That might seem high to you, but for my family, it's just right. Thanks to the privacy of my own home, my neighbors don't know how toasty warm we keep it. Some of those neighbors would be very upset to see how "wasteful" the Powers family is in the winter. In fact, there's one local man who makes it a point to let everyone know that anything over 60 degrees is ecologically wasteful. I don't want to get into a fight with Old Man Icebritches, so we just keep our comfortable house a secret. We don't have anything to hide, but it's not something everyone needs to know about.

Obviously my example is silly, but hopefully it makes you think. Modern Linux allows us to encrypt our data easily and reliably, so why not take advantage of it?

### How Does It Work? ###

I won't go into too much detail about how encryption works, but a basic understanding is necessary for even the simplest implementation. To encrypt and decrypt a file, two "keys" are required. One is the private key, which is just that, private. I like to think of the private key as an actual key—you can make copies if you want, but it's not wise to do so. The more copies of your private keys you make, the more likely someone nefarious will get one and break into your apartment—er, I mean files.

The public key is more like a schematic for a lock that only you can open (with your private key). You make this key available for anyone. You can post it on a Web site, put it in your e-mail, tattoo it on your back, whatever. When others want to create a file that only you can see, they encrypt it using your public key.

This one-to-many scenario also has a cool side effect. If you encrypt something using your private key, anyone can decrypt it using your public key. This may sound silly, but what makes such a scenario useful is that although the encrypted file isn't protected from prying eyes, it is guaranteed to be from you. Only a file encrypted with your private key can be decrypted with your public key. In this way, encrypting something with your private key digitally "signs" the file. 

#### Usually it works like this: ####

1. You have a file you want to send to Suzy, so you encrypt it with Suzy's public key. Only Suzy can open it, but there's no way for Suzy to know that you are the one who sent it, since anyone could encrypt a file with her public key.
1. Therefore, you take the file you encrypted with Suzy's public key and encrypt that file with your private key. Suzy will have to decrypt the file twice, but she'll know it came from you.
1. Suzy receives the file and decrypts the first layer with your public key, proving it came from you.
1. Suzy then decrypts the second layer of encryption with her private key, as that's the only key able to decrypt the original file. (Because you originally encrypted it with her public key.) 

That scenario is when encryption is used for safely transferring files, of course. It's also quite common simply to encrypt your files (or partitions) so that no one can see them unless you decrypt them first. Let's start with file encryption, because that's what most people will want to do on their systems.

### Starting Simple ###

Before I go into more complex type setting, let's discuss simply encrypting a file. There are various programs to handle encryption. In fact, it's easy to get overwhelmed with the available options for file and system encryption. Today, let's use a basic (but very powerful) command-line tool for encrypting a file. GPG (Gnu Privacy Guard) is an open-source implementation of PGP (Pretty Good Protection). It allows encryption and signing, and manages multiple keys and so on. For this example, let's simply encrypt a file.

Let's say you have a file called secret_manifesto.txt, which contains the secrets to life, the universe and everything. Using GPG, you can encrypt the file with a passphrase. Using a passphrase is far simpler than using a public and private key pair, because it's simply encrypted using your passphrase. This does make your file more susceptible to cracking (using rainbow tables or other hacking tools), but like the label on the tin says, it's Pretty Good Protection. To encrypt your file, you can do this: 

    # gpg -c secret_manifesto.txt
    # Enter passphrase:
    # Repeat passphrase:

Once complete, you'll have a new file in the same directory. It will be named secret_manifesto.txt.gpg by default. This is a binary file, which means it's fairly small, but it can't be copy/pasted into an e-mail or IM. For portability, you can add the -a flag, which will create an encrypted file that contains only ASCII text: 

    # gpg -a -c secret_manifesto.txt
    # Enter passphrase:
    # Repeat passphrase:
    # ls -l
    -rw-rw-r--  1 spowers spowers    6 Nov 23 1:26 secret_manifesto.txt
    -rw-rw-r--  1 spowers spowers  174 Nov 23 1:27 secret_manifesto.txt.asc
    -rw-rw-r--  1 spowers spowers   55 Nov 23 1:26 secret_manifesto.txt.gpg

 Notice there is now a file with .asc as the extension. This is text-only, but you can see in the code snippet that it's also much larger than the binary encrypted file, and much much larger than the original text file. Once you've encrypted your file, if you truly want to keep your information secret, it would be wise to delete the original text file.

To decrypt the file, you'll again use the gpg program. The same command will decrypt either file, whether it's binary or ASCII:

    # gpg secret_manifesto.txt.asc
    # gpg: CAST5 encrypted data
    # Enter passphrase:
    # gpg: encrypted with 1 passphrase
    # File `secret_manifesto.txt' exists. Overwrite? (y/N)

Notice in the example above, I hadn't deleted the original text file, so gpg gave me the option of overwriting. Once complete, I have my original file back, unencrypted. If you just have a file or two you want to protect, the command-line gpg program might be all you need. If you'd rather have an area on your system that automatically encrypts everything you save, it's a little more complicated. It's still not terribly difficult, but let's start with a fairly simplistic model. 

### Encrypting a USB Drive ###

Like I mentioned earlier, there are many options when it comes to encryption. One of the more popular methods of encrypting partitions is the LUKS (Linux Unified Key Setup) system. A USB drive with a LUKS-formatted partition should be detected automatically by most systems. In fact, if you're using a desktop environment like Ubuntu Desktop, encrypting a USB drive is a simple check box during the formatting process. Although that's a perfectly acceptable way to encrypt your USB drive, I'm going to demonstrate how to do it on the command line, so you understand what's actually happening behind the scenes. 

#### Step 1: identify your USB drive. ####

If you type `dmesg` after plugging in your USB drive, you should get all sorts of system information, including the device name of your freshly plugged-in USB device. Make sure you have the correct device identified, because what you're doing will destroy any data on the drive. You wouldn't want to format the wrong disk accidentally. (It should go without saying, but I'll say it anyway, make sure there's nothing on your USB drive that you want to save—this is a destructive process.) 

#### Step 2: partition the USB drive. ####

Assuming that your USB drive is the /dev/sdb device on your system, you need to create a single partition on the drive. Let's use fdisk. Below is the interaction with fdisk required. Basically, you create a new empty partition with the o command, then write changes with w. Then, you'll restart fdisk and use the n command to create a new primary partition, using the defaults so that the entire drive is used: 

    # sudo fdisk /dev/sdb

    Command (m for help): o
    Building a new DOS disklabel with disk identifier 0x1234567.
    Changes will remain in memory only, until you decide to write them.
    After that, of course, the previous content won't be recoverable.
    
    Command (m for help): w
    The partition table has been altered!
    
    # sudo fdisk /dev/sdb
    Command (m for help): n
    Command action
    e   extended
    p   primary partition (1-4)
    p
    Partition number (1-4, default 1): 1
    Using default value 1
    First sector (2048-1016522, default 2048):
    Using default value 2048
    Last sector, +sectors or +size{K,M,G} (2048-1016522, default 1016522):
    Using default value 1016522
    
    Command (m for help): w
    The partition table has been altered!

Now you have a USB drive with a single partition (/dev/sdb1), but there is no filesystem on it. That's exactly what you want, because the LUKS system creates an encryption layer on the partition before you put a filesystem on it. So before creating a filesystem, let's create the LUKS layer on the partition, using the cryptsetup program. If you don't have cryptsetup, search for it in your distribution's repository; it should be there. To create the LUKS encrypted partition layer: 

    # cryptsetup luksFormat /dev/sdb1

    WARNING!
    ========
    This will overwrite data on /dev/sdb1 irrevocably.
    
    Are you sure? (Type uppercase yes): YES
    Enter LUKS passphrase:
    Verify passphrase: 

Follow the directions, and be sure to remember your passphrase! Note, that a "passphrase" is usually more than just a word. It's most often a phrase, thus the name. The longer the phrase, the tougher to crack.

Once the process completes, you have an encrypted partition, but it's not mounted or formatted yet. The first step is to mount the partition, which again uses the cryptsetup utility: 

    # cryptsetup luksOpen /dev/sdb1 my_crypto_disk
    Enter passphrase for /dev/sdb1:

When you type in your passphrase, the device name you entered will be mounted like a virtual hard drive. Usually, it's mounted under /dev/mapper/devicename, so this example mounts a partition at /dev/mapper/my_crypto_disk.

This device is now being accessed as an unencrypted volume. As long as it stays mounted, it will act like any other unencrypted volume. That means you need to write a filesystem to it if you want to use it: 

    # mkfs.vfat /dev/mapper/my_crypto_disk -n my_crypto_disk
    mkfs.vfat 3.0.9 (31 Jan 2010)

Now the drive is fully functional and can be mounted like any other disk. In fact, when you put the USB drive into your computer, if you have a modern GUI desktop, it should prompt you for a password and mount it automatically. Then you can eject it like a normal disk, and it will be encrypted until you next enter your passphrase. It's simple to unmount and, therefore, re-encrypt the drive on the command line too, using cryptsetup: 

    # cryptsetup luksClose my_crypto_disk

That's Only the Tip of the Iceberg

In this article, my hope is to peel back some of the mystery behind encryption. It's simple to encrypt and decrypt a file. It's not too much more difficult (especially if you use the GUI desktop tools) to encrypt an entire USB drive. With most distributions, it's possible to encrypt the entire home directory during the installation process! When encryption is set up on your entire home directory, however, there are some issues you need to address. For example, jobs that run while you're not logged in most likely will not have access to your home directory. If you have cron jobs that need access to your home directory, you should rewrite them to access data elsewhere on the system. I find a happy medium between security and convenience is to encrypt a USB drive and store my personal data on it.

Once you get the encryption bug, I must warn you, you'll want to start encrypting everything. That's not a bad thing, but like the home directory scenario, you'll run into a few snags. Cross-platform accessibility is a big one if you go between systems. For situations like that, I highly recommend [TrueCrypt][1]. I've mentioned TrueCrypt in UpFront pieces before, but it's basically an open-source, cross-platform encryption system that allows you to encrypt files, folders, partitions and more while being able to access that data on any system. Windows, Mac and Linux clients are all available, and the community has great support.

You don't have to have something to hide in order to desire encryption for your files. Just like it's wise to lock your house at night, even if you live in a good neighborhood, it's a smart move to encrypt your personal data. If you want to share your photos of Mr Whiskerton in his cute little beanie hat with everyone on the Internet, that's your right. But others don't need to see those things if they're being nosey and poking around your hard drive! 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/encrypting-your-cat-photos

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.truecrypt.org/