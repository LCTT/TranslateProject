[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Stratis encryption)
[#]: via: (https://fedoramagazine.org/getting-started-with-stratis-encryption/)
[#]: author: (briansmith https://fedoramagazine.org/author/briansmith/)

Getting started with Stratis encryption
======

![][1]

Stratis is described on its [official website][2] as an “_easy to use local storage management for Linux_.” See this [short video][3] for a quick demonstration of the basics. The video was recorded on a Red Hat Enterprise Linux 8 system. The concepts shown in the video also apply to Stratis in Fedora.

Stratis version 2.1 introduces support for encryption. Continue reading to learn how to get started with encryption in Stratis.

### Prerequisites

Encryption requires Stratis version 2.1 or greater. The examples in this post use a pre-release of Fedora 33. Stratis 2.1 will be available in the final release of Fedora 33.

You’ll also need at least one available block device to create an encrypted pool. The examples shown below were done on a KVM virtual machine with a 5 GB virtual disk drive _(/dev/vdb_).

### Create a key in the kernel keyring

The Linux kernel keyring is used to store the encryption key. For more information on the kernel keyring, refer to the _keyrings_ manual page (_man keyrings_).  

Use the _stratis key set_ command to set up the key within the kernel keyring.  You must specify where the key should be read from. To read the key from standard input, use the _–capture-key_ option. To retrieve the key from a file, use the _–keyfile-path &lt;file&gt;_ option. The last parameter is a key description. It will be used later when you create the encrypted Stratis pool.

For example, to create a key with the description _pool1key_, and to read the key from standard input, you would enter:

```
# stratis key set --capture-key pool1key
Enter desired key data followed by the return key:
```

The command prompts us to type the key data / passphrase, and the key is then created within the kernel keyring.  

To verify that the key was created, run _stratis key list_:

```
# stratis key list
Key Description
pool1key
```

This verifies that the _pool1key_ was created. Note that these keys are not persistent. If the host is rebooted, the key will need to be provided again before the encrypted Stratis pool can be accessed (this process is covered later).

If you have multiple encrypted pools, they can have a separate keys, or they can share the same key.

The keys can also be viewed using the following _keyctl_ commands:

```
# keyctl get_persistent @s
318044983
# keyctl show
Session Keyring
 701701270 --alswrv      0     0  keyring: _ses
 649111286 --alswrv      0 65534   \_ keyring: _uid.0
 318044983 ---lswrv      0 65534   \_ keyring: _persistent.0
1051260141 --alswrv      0     0       \_ user: stratis-1-key-pool1key
```

### Create the encrypted Stratis pool

Now that a key has been created for Stratis, the next step is to create the encrypted Stratis pool. Encrypting a pool can only be done at pool creation. It isn’t currently possible to encrypt an existing pool.

Use the _stratis pool create_ command to create a pool. Add _–key-desc_ and the key description that you provided in the previous step (_pool1key_). This will signal to Stratis that the pool should be encrypted using the provided key. The below example creates the Stratis pool on _/dev/vdb_, and names it _pool1_. Be sure to specify an empty/available device on your system.

```
# stratis pool create --key-desc pool1key pool1 /dev/vdb
```

You can verify that the pool has been created with the _stratis pool list_ command:

```
# stratis pool list
Name                     Total Physical   Properties
pool1   4.98 GiB / 37.63 MiB / 4.95 GiB      ~Ca, Cr
```

In the sample output shown above, _~Ca_ indicates that caching is disabled (the tilde negates the property). _Cr_ indicates that encryption is enabled.  Note that caching and encryption are mutually exclusive. Both features cannot be simultaneously enabled.

Next, create a filesystem. The below example, demonstrates creating a filesystem named _filesystem1_, mounting it at the _/filesystem1_ mountpoint, and creating a test file in the new filesystem:

```
# stratis filesystem create pool1 filesystem1
# mkdir /filesystem1
# mount /stratis/pool1/filesystem1 /filesystem1
# cd /filesystem1
# echo "this is a test file" > testfile
```

### Access the encrypted pool after a reboot

When you reboot you’ll notice that Stratis no longer shows your encrypted pool or its block device:

```
# stratis pool list
Name   Total Physical   Properties
```

```
# stratis blockdev list
Pool Name   Device Node   Physical Size   Tier
```

To access the encrypted pool, first re-create the key with the same key description and key data / passphrase that you used previously:

```
# stratis key set --capture-key pool1key
Enter desired key data followed by the return key:
```

Next, run the _stratis pool unlock_ command, and verify that you can now see the pool and its block device:

```
# stratis pool unlock
# stratis pool list
Name                      Total Physical   Properties
pool1   4.98 GiB / 583.65 MiB / 4.41 GiB      ~Ca, Cr
# stratis blockdev list
Pool Name   Device Node   Physical Size   Tier
pool1       /dev/dm-2          4.98 GiB   Data
```

Next, mount the filesystem and verify that you can access the test file you created previously:

```
# mount /stratis/pool1/filesystem1 /filesystem1/
# cat /filesystem1/testfile
this is a test file
```

### Use a systemd unit file to automatically unlock a Stratis pool at boot

It is possible to automatically unlock your Stratis pool at boot without manual intervention. However, a file containing the key must be available. Storing the key in a file might be a security concern in some environments.

The systemd unit file shown below provides a simple method to unlock a Stratis pool at boot and mount the filesystem. Feedback on a better/alternative methods is welcome. You can provide suggestions in the comment section at the end of this article.

Start by creating your key file with the following command. Be sure to substitute _passphrase_ with the same key data / passphrase you entered previously.

```
# echo -n passphrase > /root/pool1key
```

Make sure that the file is only readable by root:

```
# chmod 400 /root/pool1key
# chown root:root /root/pool1key
```

Create a systemd unit file at _/etc/systemd/system/stratis-filesystem1.service_ with the following content:

```
[Unit]
Description = stratis mount pool1 filesystem1 file system
After = stratisd.service

[Service]
ExecStartPre=sleep 2
ExecStartPre=stratis key set --keyfile-path /root/pool1key pool1key
ExecStartPre=stratis pool unlock
ExecStartPre=sleep 3
ExecStart=mount /stratis/pool1/filesystem1 /filesystem1
RemainAfterExit=yes

[Install]
WantedBy = multi-user.target
```

Next, enable the service so that it will run at boot:

```
# systemctl enable stratis-filesystem1.service
```

Now reboot and verify that the Stratis pool has been automatically unlocked and that its filesystem is mounted.

### Summary and conclusion

In today’s environment, encryption is a must for many people and organizations. This post demonstrated how to enable encryption in Stratis 2.1.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-stratis-encryption/

作者：[briansmith][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/briansmith/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/stratis-encryption-2-816x345.jpg
[2]: https://stratis-storage.github.io/
[3]: https://www.youtube.com/watch?v=CJu3kmY-f5o
