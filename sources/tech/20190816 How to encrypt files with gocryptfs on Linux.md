[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to encrypt files with gocryptfs on Linux)
[#]: via: (https://opensource.com/article/19/8/how-encrypt-files-gocryptfs)
[#]: author: (Brian "bex" Exelbierd https://opensource.com/users/bexelbiehttps://opensource.com/users/sethhttps://opensource.com/users/marcobravo)

How to encrypt files with gocryptfs on Linux
======
Gocryptfs encrypts at the file level, so synchronization operations can
work efficiently on each file.
![Filing papers and documents][1]

[Gocryptfs][2] is a Filesystem in Userspace (FUSE)-mounted file-level encryption program. FUSE-mounted means that the encrypted files are stored in a single directory tree that is mounted, like a USB key, using the [FUSE][3] interface. This allows any user to do the mount—you don't need to be root. Because gocryptfs encrypts at the file level, synchronization operations that copy your files can work efficiently on each file. This contrasts with disk-level encryption, where the whole disk is encrypted as a single, large binary blob.

When you use gocryptfs in its normal mode, your files are stored on your disk in an encrypted format. However, when you mount the encrypted files, you get unencrypted access to your files, just like any other file on your computer. This means all your regular tools and programs can use your unencrypted files. Changes, new files, and deletions are reflected in real-time in the encrypted version of the files stored on your disk.

### Install gocryptfs

Installing gocryptfs is easy on [Fedora][4] because it is packaged for Fedora 30 and Rawhide. Therefore, **sudo dnf install gocryptfs** does all the required installation work. If you're not using Fedora, you can find details on installing from source, on Debian, or via Homebrew in the [Quickstart][5].

### Initialize your encrypted filesystem

To get started, you need to decide where you want to store your encrypted files. This example will keep the files in **~/.sekrit_files** so that they don't show up when doing a normal **ls**.

Start by initializing the filesystem. This will require you to choose a password. You are strongly encouraged to use a unique password you've never used anywhere else, as this is your key to unlocking your files. The project's authors recommend a password with between 64 and 128 bits of entropy. Assuming you use upper and lower case letters and numbers, this means your password should be between [11 and 22 characters long][6]. If you're using a password manager, this should be easy to accomplish with a generated password.

When you initialize the filesystem, you will see a unique key. Store this key somewhere securely, as it will allow you to access your files if you need to recover your files but have forgotten your password. The key works without your password, so keep it private!

The initialization routine looks like this:


```
$ mkdir ~/.sekrit_files
$ gocryptfs -init ~/.sekrit_files
Choose a password for protecting your files.
Password:
Repeat:

Your master key is:

    XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX-
    XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX

If the gocryptfs.conf file becomes corrupted or you ever forget your password,
there is only one hope for recovery: The master key. Print it to a piece of
paper and store it in a drawer. This message is only printed once.
The gocryptfs filesystem has been created successfully.
You can now mount it using: gocryptfs .sekrit_files MOUNTPOINT
```

If you look in the **~/.sekrit_files** directory, you will see two files: a configuration file and a unique directory-level initialization vector. You will not need to edit these two files by hand. Make sure you do not delete these files.

### Use your encrypted filesystem

To use your encrypted filesystem, you need to mount it. This requires an empty directory where you can mount the filesystem. For example, use the **~/my_files** directory. As you can see from the initialization, mounting is easy:


```
$ gocryptfs ~/.sekrit_files ~/my_files
Password:
Decrypting master key
Filesystem mounted and ready.
```

If you check out the **~/my_files** directory, you'll see it is empty. The configuration and initialization vector files aren't data, so they don't show up. Let's put some data in the filesystem and see what happens:


```
$ cp /usr/share/dict/words ~/my_files/
$ ls -la ~/my_files/ ~/.sekrit_files/
~/my_files/:
.rw-r--r-- 5.0M bexelbie 19 Jul 17:48 words

~/.sekrit_files/:
.r--------@  402 bexelbie 19 Jul 17:39 gocryptfs.conf
.r--------@   16 bexelbie 19 Jul 17:39 gocryptfs.diriv
.rw-r--r--@ 5.0M bexelbie 19 Jul 17:48 xAQrtlyYSFeCN5w7O3-9zg
```

Notice that there is a new file in the **~/.sekrit_files** directory. This is the encrypted copy of the dictionary you copied in (the file name will vary). Feel free to use **cat** and other tools to examine these files and experiment with adding, deleting, and modifying files. Make sure to test with a few applications, such as LibreOffice.

Remember, this a filesystem mount, so the contents of **~/my_files** aren't saved to disk. You can verify this by running **mount | grep my_files** and observing the output. Only the encrypted files are written to your disk. The FUSE interface is doing real-time encryption and decryption of the files and presenting them to your applications and shell as a filesystem.

### Unmount the filesystem

When you're done with your files, you can unmount them. This causes the unencrypted filesystem to no longer be available. The encrypted files in **~/.sekrit_files** are unaffected. Unmount the filesystem using the FUSE mounter program with **fusermount -u ~/my_files** .

### Back up your data

One of the cool benefits of gocryptfs using file-level encryption is that it makes backing up your encrypted data easier. The files are safe to store on a synchronizing system, such as OwnCloud or Dropbox. The standard disclaimer about not modifying the same file at the same time applies. However, the files can be backed up even if they are mounted. You can also save your data any other way you would typically back up files. You don't need anything special.

When you do backups, make sure to include the **gocryptfs.diriv** file. This file is not a secret and can be saved with the backup. However, your **gocryptfs.conf** is a secret. When you control the entirety of the backup chain, such as with tape, you can back it up with the rest of the files. However, when the files are backed up to the cloud or publicly, you may wish to omit this file. In theory, if someone gets this file, the only thing protecting your files is the strength of your password. If you have chosen a [strong password][6], that may be enough; however, you need to consider your situation carefully. More details are in this gocryptfs [upstream issue][7].

### Bonus: Reverse mode

A neat feature of gocryptfs is the reverse mode function. In reverse mode, point gocryptfs at your unencrypted data, and it will create a mount point with an encrypted view of this data. This is useful for things such as creating encrypted backups. This is easy to do:


```
$ gocryptfs -reverse -init my_files
Choose a password for protecting your files.
Password:
Repeat:

Your master key is:

    XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX-
    XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX

If the gocryptfs.conf file becomes corrupted or you ever forget your password,
there is only one hope for recovery: The master key. Print it to a piece of
paper and store it in a drawer. This message is only printed once.
The gocryptfs-reverse filesystem has been created successfully.
You can now mount it using: gocryptfs -reverse my_files MOUNTPOINT

$ gocryptfs -reverse my_files sekrit_files
Password:
Decrypting master key
Filesystem mounted and ready.
```

Now **sekrit_files** contains an encrypted view of your unencrypted data from **my_files**. This can be backed up, shared, or handled as needed. The directory is read-only, as there is nothing useful you can do with those files except back them up.

A new file, **.gocryptfs.reverse.conf**, has been added to **my_files** to provide a stable encrypted view. This configuration file will ensure that each reverse mount will use the same encryption key. This way you could, for example, back up only changed files.

Gocryptfs is a flexible file encryption tool that allows you to store your data in an encrypted manner without changing your workflow or processes significantly. The design has undergone a security audit, and the developers have experience with other systems, such as **encfs**. I encourage you to add gocryptfs to your system today and start protecting your data.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/how-encrypt-files-gocryptfs

作者：[Brian "bex" Exelbierd][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bexelbiehttps://opensource.com/users/sethhttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://nuetzlich.net/gocryptfs/
[3]: https://en.wikipedia.org/wiki/Filesystem_in_Userspace
[4]: https://getfedora.org
[5]: https://nuetzlich.net/gocryptfs/quickstart/
[6]: https://github.com/rfjakob/gocryptfs/wiki/Password-Strength
[7]: https://github.com/rfjakob/gocryptfs/issues/50
