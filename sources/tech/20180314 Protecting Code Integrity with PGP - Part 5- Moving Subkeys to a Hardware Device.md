Protecting Code Integrity with PGP — Part 5: Moving Subkeys to a Hardware Device
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/pgp-keys.jpg?itok=aS6IWGpq)

In this tutorial series, we're providing practical guidelines for using PGP. If you missed the previous article, you can catch up with the links below. But, in this article, we'll continue our discussion about securing your keys and look at some tips for moving your subkeys to a specialized hardware device.

[Part 1: Basic Concepts and Tools][1]

[Part 2: Generating Your Master Key][2]

[Part 3: Generating PGP Subkeys][3]

[Part 4: Moving Your Master Key to Offline Storage][4]

### Checklist

  * Get a GnuPG-compatible hardware device (NICE)

  * Configure the device to work with GnuPG (NICE)

  * Set the user and admin PINs (NICE)

  * Move your subkeys to the device (NICE)




### Considerations

Even though the master key is now safe from being leaked or stolen, the subkeys are still in your home directory. Anyone who manages to get their hands on those will be able to decrypt your communication or fake your signatures (if they know the passphrase). Furthermore, each time a GnuPG operation is performed, the keys are loaded into system memory and can be stolen from there by sufficiently advanced malware (think Meltdown and Spectre).

The best way to completely protect your keys is to move them to a specialized hardware device that is capable of smartcard operations.

#### The benefits of smartcards

A smartcard contains a cryptographic chip that is capable of storing private keys and performing crypto operations directly on the card itself. Because the key contents never leave the smartcard, the operating system of the computer into which you plug in the hardware device is not able to retrieve the private keys themselves. This is very different from the encrypted USB storage device we used earlier for backup purposes -- while that USB device is plugged in and decrypted, the operating system is still able to access the private key contents. Using external encrypted USB media is not a substitute to having a smartcard-capable device.

Some other benefits of smartcards:

  * They are relatively cheap and easy to obtain

  * They are small and easy to carry with you

  * They can be used with multiple devices

  * Many of them are tamper-resistant (depends on manufacturer)




#### Available smartcard devices

Smartcards started out embedded into actual wallet-sized cards, which earned them their name. You can still buy and use GnuPG-capable smartcards, and they remain one of the cheapest available devices you can get. However, actual smartcards have one important downside: they require a smartcard reader, and very few laptops come with one.

For this reason, manufacturers have started providing small USB devices, the size of a USB thumb drive or smaller, that either have the microsim-sized smartcard pre-inserted, or that simply implement the smartcard protocol features on the internal chip. Here are a few recommendations:

  * [Nitrokey Start][5]: Open hardware and Free Software: one of the cheapest options for GnuPG use, but with fewest extra security features

  * [Nitrokey Pro][6]: Similar to the Nitrokey Start, but is tamper-resistant and offers more security features (but not U2F, see the Fido U2F section of the guide)

  * [Yubikey 4][7]: Proprietary hardware and software, but cheaper than Nitrokey Pro and comes available in the USB-C form that is more useful with newer laptops; also offers additional security features such as U2F




Our recommendation is to pick a device that is capable of both smartcard functionality and U2F, which, at the time of writing, means a Yubikey 4.

#### Configuring your smartcard device

Your smartcard device should Just Work (TM) the moment you plug it into any modern Linux or Mac workstation. You can verify it by running:
```
$ gpg --card-status

```

If you didn't get an error, but a full listing of the card details, then you are good to go. Unfortunately, troubleshooting all possible reasons why things may not be working for you is way beyond the scope of this guide. If you are having trouble getting the card to work with GnuPG, please seek support via your operating system's usual support channels.

##### PINs don't have to be numbers

Note, that despite having the name "PIN" (and implying that it must be a "number"), neither the user PIN nor the admin PIN on the card need to be numbers.

Your device will probably have default user and admin PINs set up when it arrives. For Yubikeys, these are 123456 and 12345678, respectively. If those don't work for you, please check any accompanying documentation that came with your device.

##### Quick setup

To configure your smartcard, you will need to use the GnuPG menu system, as there are no convenient command-line switches:
```
$ gpg --card-edit
[...omitted...]
gpg/card> admin
Admin commands are allowed
gpg/card> passwd

```

You should set the user PIN (1), Admin PIN (3), and the Reset Code (4). Please make sure to record and store these in a safe place -- especially the Admin PIN and the Reset Code (which allows you to completely wipe the smartcard). You so rarely need to use the Admin PIN, that you will inevitably forget what it is if you do not record it.

Getting back to the main card menu, you can also set other values (such as name, sex, login data, etc), but it's not necessary and will additionally leak information about your smartcard should you lose it.

#### Moving the subkeys to your smartcard

Exit the card menu (using "q") and save all changes. Next, let's move your subkeys onto the smartcard. You will need both your PGP key passphrase and the admin PIN of the card for most operations. Remember, that [fpr] stands for the full 40-character fingerprint of your key.
```
$ gpg --edit-key [fpr]

Secret subkeys are available.

pub rsa4096/AAAABBBBCCCCDDDD
 created: 2017-12-07 expires: 2019-12-07 usage: C
 trust: ultimate validity: ultimate
ssb rsa2048/1111222233334444
 created: 2017-12-07 expires: never usage: E
ssb rsa2048/5555666677778888
 created: 2017-12-07 expires: never usage: S
[ultimate] (1). Alice Engineer <alice@example.org>
[ultimate] (2) Alice Engineer <allie@example.net>

gpg>

```

Using --edit-key puts us into the menu mode again, and you will notice that the key listing is a little different. From here on, all commands are done from inside this menu mode, as indicated by gpg>.

First, let's select the key we'll be putting onto the card -- you do this by typing key 1 (it's the first one in the listing, our [E] subkey):
```
gpg> key 1

```

The output should be subtly different:
```
pub rsa4096/AAAABBBBCCCCDDDD
 created: 2017-12-07 expires: 2019-12-07 usage: C
 trust: ultimate validity: ultimate
ssb* rsa2048/1111222233334444
 created: 2017-12-07 expires: never usage: E
ssb rsa2048/5555666677778888
 created: 2017-12-07 expires: never usage: S
[ultimate] (1). Alice Engineer <alice@example.org>
[ultimate] (2) Alice Engineer <allie@example.net>

```

Notice the * that is next to the ssb line corresponding to the key -- it indicates that the key is currently "selected." It works as a toggle, meaning that if you type key 1 again, the * will disappear and the key will not be selected any more.

Now, let's move that key onto the smartcard:
```
gpg> keytocard
Please select where to store the key:
 (2) Encryption key
Your selection? 2

```

Since it's our [E] key, it makes sense to put it into the Encryption slot. When you submit your selection, you will be prompted first for your PGP key passphrase, and then for the admin PIN. If the command returns without an error, your key has been moved.

**Important:** Now type key 1 again to unselect the first key, and key 2 to select the [S] key:
```
gpg> key 1
gpg> key 2
gpg> keytocard
Please select where to store the key:
 (1) Signature key
 (3) Authentication key
Your selection? 1

```

You can use the [S] key both for Signature and Authentication, but we want to make sure it's in the Signature slot, so choose (1). Once again, if your command returns without an error, then the operation was successful.

Finally, if you created an [A] key, you can move it to the card as well, making sure first to unselect key 2. Once you're done, choose "q":
```
gpg> q
Save changes? (y/N) y

```

Saving the changes will delete the keys you moved to the card from your home directory (but it's okay, because we have them in our backups should we need to do this again for a replacement smartcard).

##### Verifying that the keys were moved

If you perform --list-secret-keys now, you will see a subtle difference in the output:
```
$ gpg --list-secret-keys
sec# rsa4096 2017-12-06 [C] [expires: 2019-12-06]
 111122223333444455556666AAAABBBBCCCCDDDD
uid [ultimate] Alice Engineer <alice@example.org>
uid [ultimate] Alice Engineer <allie@example.net>
ssb> rsa2048 2017-12-06 [E]
ssb> rsa2048 2017-12-06 [S]

```

The > in the ssb> output indicates that the subkey is only available on the smartcard. If you go back into your secret keys directory and look at the contents there, you will notice that the .key files there have been replaced with stubs:
```
$ cd ~/.gnupg/private-keys-v1.d
$ strings *.key

```

The output should contain shadowed-private-key to indicate that these files are only stubs and the actual content is on the smartcard.

#### Verifying that the smartcard is functioning

To verify that the smartcard is working as intended, you can create a signature:
```
$ echo "Hello world" | gpg --clearsign > /tmp/test.asc
$ gpg --verify /tmp/test.asc

```

This should ask for your smartcard PIN on your first command, and then show "Good signature" after you run gpg --verify.

Congratulations, you have successfully made it extremely difficult to steal your digital developer identity!

### Other common GnuPG operations

Here is a quick reference for some common operations you'll need to do with your PGP key.

In all of the below commands, the [fpr] is your key fingerprint.

#### Mounting your master key offline storage

You will need your master key for any of the operations below, so you will first need to mount your backup offline storage and tell GnuPG to use it. First, find out where the media got mounted, for example, by looking at the output of the mount command. Then, locate the directory with the backup of your GnuPG directory and tell GnuPG to use that as its home:
```
$ export GNUPGHOME=/media/disk/name/gnupg-backup
$ gpg --list-secret-keys

```

You want to make sure that you see sec and not sec# in the output (the # means the key is not available and you're still using your regular home directory location).

##### Updating your regular GnuPG working directory

After you make any changes to your key using the offline storage, you will want to import these changes back into your regular working directory:
```
$ gpg --export | gpg --homedir ~/.gnupg --import
$ unset GNUPGHOME

```

#### Extending key expiration date

The master key we created has the default expiration date of 2 years from the date of creation. This is done both for security reasons and to make obsolete keys eventually disappear from keyservers.

To extend the expiration on your key by a year from current date, just run:
```
$ gpg --quick-set-expire [fpr] 1y

```

You can also use a specific date if that is easier to remember (e.g. your birthday, January 1st, or Canada Day):
```
$ gpg --quick-set-expire [fpr] 2020-07-01

```

Remember to send the updated key back to keyservers:
```
$ gpg --send-key [fpr]

```

#### Revoking identities

If you need to revoke an identity (e.g., you changed employers and your old email address is no longer valid), you can use a one-liner:
```
$ gpg --quick-revoke-uid [fpr] 'Alice Engineer <aengineer@example.net>'

```

You can also do the same with the menu mode using gpg --edit-key [fpr].

Once you are done, remember to send the updated key back to keyservers:
```
$ gpg --send-key [fpr]

```

Next time, we'll look at how Git supports multiple levels of integration with PGP.

Learn more about Linux through the free ["Introduction to Linux" ][8]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-5-moving-subkeys-hardware-device

作者：[KONSTANTIN RYABITSEV][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools
[2]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-2-generating-and-protecting-your-master-pgp-key
[3]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-3-generating-pgp-subkeys
[4]:https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-4-moving-your-master-key-offline-storage
[5]:https://shop.nitrokey.com/shop/product/nitrokey-start-6
[6]:https://shop.nitrokey.com/shop/product/nitrokey-pro-3
[7]:https://www.yubico.com/product/yubikey-4-series/
[8]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
