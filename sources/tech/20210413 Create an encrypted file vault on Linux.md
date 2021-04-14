[#]: subject: (Create an encrypted file vault on Linux)
[#]: via: (https://opensource.com/article/21/4/linux-encryption)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Create an encrypted file vault on Linux
======
Use Linux Unified Key Setup to create an encrypted vault for sensitive
files on a physical drive or cloud storage.
![Secure safe][1]

Recently, I demonstrated how to [implement full-drive encryption][2] on Linux with LUKS and the `cryptsetup` command. While encrypting a whole drive is useful in many cases, there are reasons you might not want to encode an entire drive. For instance, you might require a drive to work across several platforms, some of which may not have Linux Unified Key Setup ([LUKS][3]) integration. Furthermore, it's the 21st century, the cloud exists, and you may not be using a physical drive for all your data.

Several years ago, there was a system called [TrueCrypt][4] that allowed users to create encrypted file "vaults," which could be decrypted by TrueCrypt to provide read/write access. It was a useful technique and essentially provided a virtual portable and fully encrypted drive where you could store important data. TrueCrypt closed down, but it serves as an interesting model.

Fortunately, LUKS is a flexible system, and you can use it and `cryptsetup` to create an encrypted vault as a self-contained file, which you can save on a physical drive or in cloud storage.

Here's how to do it.

### 1\. Create an empty file

First, you must create an empty file of a predetermined size. This serves as a kind of vault or safe in which you can store other files. The command you use for this is `fallocate`, from the `util-linux` package:


```
`$ fallocate --length 512M vaultfile.img`
```

This example creates a 512MB file, but you can make yours any size you want.

### 2\. Create a LUKS volume

Next, create a LUKS volume within the empty file:


```
$ cryptsetup --verify-passphrase \
luksFormat vaultfile.img
```

### 3\. Open the LUKS volume

So that you can create a filesystem ready for file storage, you must open the LUKS volume and mount it on your computer first:


```
$ sudo cryptsetup open \
\--type luks vaultfile.img myvault
$ ls /dev/mapper
myvault
```

### 4\. Create a filesystem

Make a filesystem in your open vault:


```
`$ sudo mkfs.ext4 -L myvault /dev/mapper/myvault`
```

If you don't need it for anything right now, you can close it:


```
`$ sudo cryptsetup close myvault`
```

### 5\. Start using your encrypted vault

Now that it's all set up, you can use your encrypted file vault whenever you need to store or access private data. To access your vault, you must mount it as a usable filesystem:


```
$ sudo cryptsetup open \
\--type luks vaultfile.img myvault
$ ls /dev/mapper
myvault
$ sudo mkdir /myvault
$ sudo mount /dev/mapper/myvault /myvault
```

This example opens the vault with `cryptsetup` and then mounts the vault from `/dev/mapper` to a new directory called `/myvault`. As with any volume on Linux, you can mount the LUKS volume anywhere you want, so instead of `/myvault`, you can use `/mnt` or `~/myvault` or whatever you prefer.

While it's mounted, your LUKS volume is decrypted. You can read and write files to it just as if it were a physical drive.

When you're finished using your encrypted vault, unmount and close it:


```
$ sudo umount /myvault
$ sudo cryptsetup close myvault
```

### Encrypted file vaults

An image file you encrypt with LUKS is as portable as any other file, so you can store your vault on your hard drive, an external drive, or even on the internet. As long as you have LUKS available, you can decrypt, mount, and use it to keep your data safe. It's easy encryption for improved data safety, so give it a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-encryption

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_bank_vault_secure_safe.png?itok=YoW93h7C (Secure safe)
[2]: https://opensource.com/article/21/3/encryption-luks
[3]: https://gitlab.com/cryptsetup/cryptsetup/blob/master/README.md
[4]: https://en.wikipedia.org/wiki/TrueCrypt
