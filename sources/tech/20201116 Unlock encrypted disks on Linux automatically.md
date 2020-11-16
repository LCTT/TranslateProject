[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Unlock encrypted disks on Linux automatically)
[#]: via: (https://opensource.com/article/20/11/nbde-linux)
[#]: author: (Curt Warfield https://opensource.com/users/rcurtiswarfield)

Unlock encrypted disks on Linux automatically
======
Open encrypted disks without having to manually enter a passcode by
using Network-Bound Disk Encryption (NBDE).
![Lock][1]

From a security viewpoint, it's important to encrypt your sensitive data to protect it from prying eyes and hackers. Linux Unified Key Setup ([LUKS][2]) is a great tool and a common standard for Linux disk encryption. Because it stores all pertinent setup information in the partition header, it makes migrating data easy.

To configure encrypted disks or partitions with LUKS, you will need to use the [cryptsetup][3] utility. Unfortunately, one of the downsides of encrypting your disks is that you have to manually provide the password every time the system is rebooted or the disk is remounted.

However, Network-Bound Disk Encryption (NBDE) can automatically and securely unlock encrypted disks without any user intervention. It is available in several Linux distributions, beginning with Red Hat Enterprise Linux 7.4, CentOS 7.4, and Fedora 24, and in later versions of each.

NBDE is implemented with the following technologies:

  * **[Clevis framework][4]:** A pluggable framework tool that automatically decrypts and unlocks LUKS volumes
  * **[Tang server][5]:** A service for binding cryptographic keys to network presence



Tang provides the encryption keys to the Clevis client. According to Tang's developers, this provides a secure, stateless, anonymous alternative to key escrow services.

Because NBDE uses the client-server architecture, you must configure both the client and the server. You can use a virtual machine on your local network for your Tang server.

### Server installation

Install Tang using sudo:


```
`sudo yum install tang -y`
```

Enable the Tang server:


```
`sudo systemctl enable tangd.socket --now`
```

The Tang server works on port 80 and must be added to firewalld. Add the appropriate firewalld rule:


```
sudo  firewall-cmd --add-port=tcp/80 --perm
sudo firewall-cmd --reload
```

The server should now be installed.

### Client installation

For this example, assume you have added a new 1GB disk named `/dev/vdc` to your system.

Create the primary partition using fdisk or parted:


```
sudo fdisk /dev/vdc
```

Complete the following steps to install the client.


```
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table
Building a new DOS disklabel with disk identifier 0x4a6812d4.

Command (m for help):
```

Enter **n** to create the new partition:


```
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended  
Select (default p):
```

Hit the **Enter** key to select the primary partition:


```
Using default response p
Partition number (1-4, default 1):
```

Hit the **Enter** key to select the default partition number:


```
First sector (2048-2097151, default 2048):
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-2097151, default 2097151):
```

Hit the **Enter** key to select the last sector:


```
Using default value 2097151
Partition 1 of type Linux and of size 1023 MiB is set

Command (m for help): wq
```

Type **wq** to save the changes and exit fdisk:


```
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```

Run `partprobe` to inform the system of the partition table changes:


```
`sudo partprobe`
```

Install the cryptsetup package using sudo:


```
`sudo yum install cryptsetup -y`
```

Use the `cryptsetup luksFormat` command to encrypt the disk. You will need to type **YES** when prompted and also choose and enter a passphrase to encrypt the disk:


```
sudo cryptsetup luksFormat /dev/vdc1
WARNING!
========
This will overwrite data on /dev/vdc1 irrevocably.

Are you sure? (Type uppercase yes):

Enter passphrase for /dev/vdc1:
Verify passphrase:
```

Use the `cryptsetup luksOpen` command to map the encrypted partition to a logical device. For example, use `encryptedvdc1` as the name. You will also need to enter the passphrase again:


```
sudo cryptsetup luksOpen /dev/vdc1 encryptedvdc1
Enter passphrase for /dev/vdc1:
```

The encrypted partition is now available at `/dev/mapper/encryptedvdc1`.

Create an XFS filesystem on the encrypted partition:


```
`sudo mkfs.xfs /dev/mapper/encryptedvdc1`
```

Create a directory for mounting the encrypted partition:


```
`sudo mkdir /encrypted`
```

Use the `cryptsetup luksClose` command to lock the partition:


```
`cryptsetup luksClose encryptedvdc1`
```

Install the Clevis packages using sudo:


```
`sudo yum install clevis clevis-luks clevis-dracut -y`
```

Modify /etc/crypttab to open the encrypted volume at boot time:


```
`sudo vim /etc/crypttab`
```

Add the following line:


```
`encryptedvdc1       /dev/vdc1  none   _netdev`
```

Modify /etc/fstab to automatically mount the encrypted volume during a reboot or at boot time:


```
`sudo vim /etc/fstab`
```

Add the following line:


```
`/dev/mapper/encryptedvdc1   /encrypted       xfs    _netdev        1 2`
```

For this example, assume the Tang server's IP address is `192.168.1.20`. You can also use the hostname or domain if you prefer.

Run the following `clevis` command:


```
sudo clevis bind luks -d /dev/vdc1 tang '{"url":"<http://192.168.1.20"}>'
The advertisement contains the following signing keys:

rwA2BAITfYLuyNiIeYUMBzkhk7M

Do you wish to trust these keys? [ynYN] Y
Enter existing LUKS password:
```

Type **Y** to accept the keys for the Tang server and provide the existing LUKS password for the initial setup.

Enable clevis-luks-askpass.path via systemctl in order to prevent being prompted for the passphrase for non-root partitions.


```
`sudo systemctl enable clevis-luks-askpass.path`
```

The client is installed. Now, whenever you reboot the server, the encrypted disk should automatically be decrypted and mounted by retrieving the keys from the Tang server.

If the Tang server is unavailable for any reason, you'll need to provide the passphrase manually in order to decrypt and mount the partition.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/nbde-linux

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rcurtiswarfield
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup
[3]: https://gitlab.com/cryptsetup/cryptsetup
[4]: https://github.com/latchset/clevis
[5]: https://github.com/latchset/tang
