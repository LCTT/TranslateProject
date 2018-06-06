Protecting Code Integrity with PGP — Part 4: Moving Your Master Key to Offline Storage
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/industry-1920.jpg?itok=gI3QraS8)
In this tutorial series, we're providing practical guidelines for using PGP. You can catch up on previous articles here:

[Part 1: Basic Concepts and Tools][1]

[Part 2: Generating Your Master Key][2]

[Part 3: Generating PGP Subkeys][3]

Here in part 4, we continue the series with a look at how and why to move your master key from your home directory to offline storage. Let's get started.

### Checklist

  * Prepare encrypted detachable storage (ESSENTIAL)

  * Back up your GnuPG directory (ESSENTIAL)

  * Remove the master key from your home directory (NICE)

  * Remove the revocation certificate from your home directory (NICE)




#### Considerations

Why would you want to remove your master [C] key from your home directory? This is generally done to prevent your master key from being stolen or accidentally leaked. Private keys are tasty targets for malicious actors -- we know this from several successful malware attacks that scanned users' home directories and uploaded any private key content found there.

It would be very damaging for any developer to have their PGP keys stolen -- in the Free Software world, this is often tantamount to identity theft. Removing private keys from your home directory helps protect you from such events.

##### Back up your GnuPG directory

**!!!Do not skip this step!!!**

It is important to have a readily available backup of your PGP keys should you need to recover them (this is different from the disaster-level preparedness we did with paperkey).

##### Prepare detachable encrypted storage

Start by getting a small USB "thumb" drive (preferably two!) that you will use for backup purposes. You will first need to encrypt them:

For the encryption passphrase, you can use the same one as on your master key.

##### Back up your GnuPG directory

Once the encryption process is over, re-insert the USB drive and make sure it gets properly mounted. Find out the full mount point of the device, for example by running the mount command (under Linux, external media usually gets mounted under /media/disk, under Mac it's /Volumes).

Once you know the full mount path, copy your entire GnuPG directory there:
```
$ cp -rp ~/.gnupg [/media/disk/name]/gnupg-backup

```

(Note: If you get any Operation not supported on socket errors, those are benign and you can ignore them.)

You should now test to make sure everything still works:
```
$ gpg --homedir=[/media/disk/name]/gnupg-backup --list-key [fpr]

```

If you don't get any errors, then you should be good to go. Unmount the USB drive and distinctly label it, so you don't blow it away next time you need to use a random USB drive. Then, put in a safe place -- but not too far away, because you'll need to use it every now and again for things like editing identities, adding or revoking subkeys, or signing other people's keys.

##### Remove the master key

The files in our home directory are not as well protected as we like to think. They can be leaked or stolen via many different means:

  * By accident when making quick homedir copies to set up a new workstation

  * By systems administrator negligence or malice

  * Via poorly secured backups

  * Via malware in desktop apps (browsers, pdf viewers, etc)

  * Via coercion when crossing international borders




Protecting your key with a good passphrase greatly helps reduce the risk of any of the above, but passphrases can be discovered via keyloggers, shoulder-surfing, or any number of other means. For this reason, the recommended setup is to remove your master key from your home directory and store it on offline storage.

###### Removing your master key

Please see the previous section and make sure you have backed up your GnuPG directory in its entirety. What we are about to do will render your key useless if you do not have a usable backup!

First, identify the keygrip of your master key:
```
$ gpg --with-keygrip --list-key [fpr]

```

The output will be something like this:
```
pub rsa4096 2017-12-06 [C] [expires: 2019-12-06]
 111122223333444455556666AAAABBBBCCCCDDDD
 Keygrip = AAAA999988887777666655554444333322221111
uid [ultimate] Alice Engineer <alice@example.org>
uid [ultimate] Alice Engineer <allie@example.net>
sub rsa2048 2017-12-06 [E]
 Keygrip = BBBB999988887777666655554444333322221111
sub rsa2048 2017-12-06 [S]
 Keygrip = CCCC999988887777666655554444333322221111

```

Find the keygrip entry that is beneath the pub line (right under the master key fingerprint). This will correspond directly to a file in your home .gnupg directory:
```
$ cd ~/.gnupg/private-keys-v1.d
$ ls
AAAA999988887777666655554444333322221111.key
BBBB999988887777666655554444333322221111.key
CCCC999988887777666655554444333322221111.key

```

All you have to do is simply remove the .key file that corresponds to the master keygrip:
```
$ cd ~/.gnupg/private-keys-v1.d
$ rm AAAA999988887777666655554444333322221111.key

```

Now, if you issue the --list-secret-keys command, it will show that the master key is missing (the # indicates it is not available):
```
$ gpg --list-secret-keys
sec# rsa4096 2017-12-06 [C] [expires: 2019-12-06]
 111122223333444455556666AAAABBBBCCCCDDDD
uid [ultimate] Alice Engineer <alice@example.org>
uid [ultimate] Alice Engineer <allie@example.net>
ssb rsa2048 2017-12-06 [E]
ssb rsa2048 2017-12-06 [S]

```

##### Remove the revocation certificate

Another file you should remove (but keep in backups) is the revocation certificate that was automatically created with your master key. A revocation certificate allows someone to permanently mark your key as revoked, meaning it can no longer be used or trusted for any purpose. You would normally use it to revoke a key that, for some reason, you can no longer control -- for example, if you had lost the key passphrase.

Just as with the master key, if a revocation certificate leaks into malicious hands, it can be used to destroy your developer digital identity, so it's better to remove it from your home directory.
```
cd ~/.gnupg/openpgp-revocs.d
rm [fpr].rev

```

Next time, you'll learn how to secure your subkeys as well. Stay tuned.

Learn more about Linux through the free ["Introduction to Linux" ][4]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-4-moving-your-master-key-offline-storage

作者：[Konstantin Ryabitsev][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools
[2]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-2-generating-and-protecting-your-master-pgp-key
[3]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-3-generating-pgp-subkeys
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
