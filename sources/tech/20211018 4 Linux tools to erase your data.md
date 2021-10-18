[#]: subject: "4 Linux tools to erase your data"
[#]: via: "https://opensource.com/article/21/10/linux-tools-erase-data"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 Linux tools to erase your data
======
Erase data from your hard disk drive with these open source tools.
![Tools in a cloud][1]

One of the best ways to keep your data secure is by only writing data to an encrypted hard drive. On a standard drive, it's possible to view data just by mounting the drive as if it were a thumb drive, and it's even possible to display and recover even deleted data with tools like [Scalpel][2] and [Testdisk][3]. But on an encrypted drive, data is unreadable without a decryption key (usually a passphrase you enter when mounting the drive.)

Encryption can be established when you install your OS, and some operating systems even make it possible to activate encryption any time after installation.

What do you do when you're selling a computer or replacing a drive that never got encrypted in the first place, though?

The next best thing to encrypting your data from the start is by erasing the data when you're finished with the drive.

### Responsible caretaker

I'm frequently called on to help clients upgrade an old computer. Invariably, they're more than willing to help me recycle them so that they can be used by someone else. I'm happy to refurbish these older computers and refit them with a newer solid-state drive, dramatically improving performance.

However, it's not a good idea to just throw an old drive in the trash. It needs to be erased and then disposed of properly. Rather than leave the drives in the original computer, I remove them, place them in a drive enclosure, and connect them to my Linux computer. Several Linux utilities can easily accomplish this. One of them is the **Gnu Shred** tool.

### GNU Shred


```
`$ sudo shred -vfz /dev/sdX`
```

Shred has many options:

  * n - the number of overwrites. The default is three.
  * u - overwrite and delete.
  * s - the number of bytes to shred.
  * v - show extended information.
  * f - force the change of permissions to allow writing if necessary.
  * z - add a final overwrite with zeros to hide shredding.



Use `shred --help` for more information

### ShredOS

ShredOS is a live Linux distribution with the sole purpose of erasing the entire contents of a drive. It was developed after a similar distribution, called DBAN, was discontinued. It uses the `nwipe` application, which is a fork of DBAN's `dwipe`. You can make a bootable USB drive by downloading the 32 bit or 64 bit image and writing it to a drive with the `dd` command on Linux and macOS:


```
`$ sudo dd if=shredos.img of=/dev/sdX bs=4M status=progress`
```

Alternately, you can use the [Etcher][4] tool on Linux, macOS, and Windows.

### The dd command

A common method for erasing drives is with the Linux `dd` command. Nearly every Linux installation comes with the `dd` utility installed. Make sure that the drive is not mounted.


```
`$ sudo umount /dev/sdXY -l`
```

If you want to write zeros over your entire target disk, issue the following command. It will probably be an overnight job.


```
`$ sudo dd if=/dev/urandom of=/dev/sdX bs=10M`
```

**Warning**: Be sure that you know where you are on your system and target the correct drive so that you don't accidentally erase your own data.

### Nvme-cli

If your computer contains one of the newer NVMe drives, you can install the [nvme-cli][5] utilities and use the `sanitize` option to erase your drive.

The command `nvme sanitize help` command provides you with a list of sanitize options, which include the following:

  * \--no-dealloc, -d - No deallocate after sanitize.
  * \--oipbp, -i - Overwrite invert pattern between passes.
  * \--owpass=, -n - Overwrite pass count.
  * \--ause, -u - Allow unrestricted sanitize exit.
  * \--sanact=, -a - Sanitize action.
  * \--ovrpat=, -p - Overwrite pattern.



Here is the command I use:


```
`$ sudo nvme sanitize /dev/nvme0nX`
```

The same warnings apply here as with the format process: back up important data first because this command erases it!

### Information management

The information you keep on your computer is important. It belongs to you and to know one else. When you're selling off a computer or disposing of a hard drive, make sure you've cleared it of your data with one of these great tools.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-tools-erase-data

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://www.redhat.com/sysadmin/find-lost-files-scalpel
[3]: https://www.redhat.com/sysadmin/recover-partition-files-testdisk
[4]: https://opensource.com/article/18/7/getting-started-etcherio
[5]: https://opensource.com/article/21/9/nvme-cli
