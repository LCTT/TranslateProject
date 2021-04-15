[#]: subject: (Using network bound disk encryption with Stratis)
[#]: via: (https://fedoramagazine.org/network-bound-disk-encryption-with-stratis/)
[#]: author: (briansmith https://fedoramagazine.org/author/briansmith/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Using network bound disk encryption with Stratis
======

![][1]

Photo by [iMattSmart][2] on [Unsplash][3]

In an environment with many encrypted disks, unlocking them all is a difficult task. Network bound disk encryption (NBDE) helps automate the process of unlocking Stratis volumes. This is a critical requirement in large environments. Stratis version 2.1 added support for encryption, which was introduced in the article “[Getting started with Stratis encryption][4].” Stratis version 2.3 recently introduced support for Network Bound Disk Encryption (NBDE) when using encrypted Stratis pools, which is the topic of this article.

The [Stratis website][5] describes Stratis as an “_easy to use local storage management for Linux_.” The  short video [“Managing Storage With Stratis”][6] gives a quick demonstration of the basics. The video was recorded on a Red Hat Enterprise Linux 8 system, however, the concepts shown in the video also apply to Stratis in Fedora Linux.

### Prerequisites

This article assumes you are familiar with Stratis, and also Stratis pool encryption. If you aren’t familiar with these topics, refer to this [article][4] and the [Stratis overview video][6] previously mentioned.

NBDE requires Stratis 2.3 or later. The examples in this article use a pre-release version of Fedora Linux 34. The Fedora Linux 34 final release will include Stratis 2.3.

### Overview of network bound disk encryption (NBDE)

One of the main challenges of encrypting storage is having a secure method to unlock the storage again after a system reboot. In large environments, typing in the encryption passphrase manually doesn’t scale well. NBDE addresses this and allows for encrypted storage to be unlocked in an automated manner.

At a high level, NBDE requires a Tang server in the environment. Client systems (using Clevis Pin) can automatically decrypt storage as long as they can establish a network connection to the Tang server. If there is no network connectivity to the Tang server, the storage would have to be decrypted manually.

The idea behind this is that the Tang server would only be available on an internal network, thus if the encrypted device is lost or stolen, it would no longer have access to the internal network to connect to the Tang server, therefore would not be automatically decrypted.

For more information on Tang and Clevis, see the man pages (man tang, man clevis) , the [Tang GitHub page][7], and the [Clevis GitHub page][8].

### Setting up the Tang server

This example uses another Fedora Linux system as the Tang server with a hostname of tang-server. Start by installing the tang package:

```
dnf install tang
```

Then enable and start the tangd.socket with systemctl:

```
systemctl enable tangd.socket --now
```

Tang uses TCP port 80, so you also need to open that in the firewall:

```
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=80/tcp
```

Finally, run _tang-show-keys_ to display the output signing key thumbprint. You’ll need this later.

```
# tang-show-keys
l3fZGUCmnvKQF_OA6VZF9jf8z2s
```

### Creating the encrypted Stratis Pool

The previous article on Stratis encryption goes over how to setup an encrypted Stratis pool in detail, so this article won’t cover that in depth.

The first step is capturing a key that will be used to decrypt the Stratis pool. Even when using NBDE, you need to set this, as it can be used to manually unlock the pool in the event that the NBDE server is unreachable. Capture the pool1 key with the following command:

```
# stratis key set --capture-key pool1key
Enter key data followed by the return key:
```

Then I’ll create an encrypted Stratis pool (using the pool1key just created) named pool1 using the _/dev/vdb_ device:

```
# stratis pool create --key-desc pool1key pool1 /dev/vdb
```

Next, create a filesystem in this Stratis pool named filesystem1, create a mount point, mount the filesystem, and create a testfile in it:

```
# stratis filesystem create pool1 filesystem1
# mkdir /filesystem1
# mount /dev/stratis/pool1/filesystem1 /filesystem1
# cd /filesystem1
# echo "this is a test file" > testfile
```

### Binding the Stratis pool to the Tang server

At this point, we have the encrypted Stratis pool created, and also have a filesystem created in the pool. The next step is to bind your Stratis pool to the Tang server that you just setup. Do this with the _stratis pool bind nbde_ command.

When you make the Tang binding, you need to pass several parameters to the command:

  * the pool name (in this example, pool1)
  * the key descriptor name (in this example, pool1key)
  * the Tang server name (in this example, <http://tang-server>)



Recall that on the Tang server, you previously ran _tang-show-keys_ which showed the Tang output signing key thumbprint is _l3fZGUCmnvKQF_OA6VZF9jf8z2s_. In addition to the previous parameters, you either need to pass this thumbprint with the parameter _–thumbprint l3fZGUCmnvKQF_OA6VZF9jf8z2s_, or skip the verification of the thumbprint with the _–trust-url_ parameter. ****

It is more secure to use the _–thumbprint_ parameter. For example:

```
# stratis pool bind nbde pool1 pool1key http://tang-server --thumbprint l3fZGUCmnvKQF_OA6VZF9jf8z2s
```

### Unlocking the Stratis Pool with NBDE

Next reboot the host, and validate that you can unlock the Stratis pool with NBDE, without requiring the use of the key passphrase. After rebooting the host, the pool is no longer available:

```
# stratis pool list
Name Total Physical Properties
```

To unlock the pool using NBDE, run the following command:

```
# stratis pool unlock clevis
```

Note that you did not need to use the key passphrase. This command could be automated to run during the system boot up.

At this point, the pool is now available:

```
# stratis pool list
Name Total Physical Properties
pool1 4.98 GiB / 583.65 MiB / 4.41 GiB ~Ca, Cr
```

You can mount the filesystem and access the file that was previously created:

```
# mount /dev/stratis/pool1/filesystem1 /filesystem1/
# cat /filesystem1/testfile
this is a test file
```

### Rotating Tang server keys

Best practices recommend that you periodically rotate the Tang server keys and update the Stratis client servers to use the new Tang keys.

To generate new Tang keys, start by logging in to your Tang server and look at the current status of the /var/db/tang directory. Then, run the _tang-show-keys_ command:

```
# ls -al /var/db/tang
total 8
drwx------. 1 tang tang 124 Mar 15 15:51 .
drwxr-xr-x. 1 root root 16 Mar 15 15:48 ..
-rw-r--r--. 1 tang tang 361 Mar 15 15:51 hbjJEDXy8G8wynMPqiq8F47nJwo.jwk
-rw-r--r--. 1 tang tang 367 Mar 15 15:51 l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk
# tang-show-keys
l3fZGUCmnvKQF_OA6VZF9jf8z2s
```

To generate new keys, run tangd-keygen and point it to the /var/db/tang directory:

```
# /usr/libexec/tangd-keygen /var/db/tang
```

If you look at the /var/db/tang directory again, you will see two new files:

```
# ls -al /var/db/tang
total 16
drwx------. 1 tang tang 248 Mar 22 10:41 .
drwxr-xr-x. 1 root root 16 Mar 15 15:48 ..
-rw-r--r--. 1 tang tang 361 Mar 15 15:51 hbjJEDXy8G8wynMPqiq8F47nJwo.jwk
-rw-r--r--. 1 root root 354 Mar 22 10:41 iyG5HcF01zaPjaGY6L_3WaslJ_E.jwk
-rw-r--r--. 1 root root 349 Mar 22 10:41 jHxerkqARY1Ww_H_8YjQVZ5OHao.jwk
-rw-r--r--. 1 tang tang 367 Mar 15 15:51 l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk
```

And if you run _tang-show-keys_, it will show the keys being advertised by Tang:

```
# tang-show-keys
l3fZGUCmnvKQF_OA6VZF9jf8z2s
iyG5HcF01zaPjaGY6L_3WaslJ_E
```

You can prevent the old key (starting with l3fZ) from being advertised by renaming the two original files to be hidden files, starting with a period. With this method, the old key will no longer be advertised, however it will still be usable by any existing clients that haven’t been updated to use the new key. Once all clients have been updated to use the new key, these old key files can be deleted.

```
# cd /var/db/tang
# mv hbjJEDXy8G8wynMPqiq8F47nJwo.jwk   .hbjJEDXy8G8wynMPqiq8F47nJwo.jwk
# mv l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk   .l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk
```

At this point, if you run _tang-show-keys_ again, only the new key is being advertised by Tang:

```
# tang-show-keys
iyG5HcF01zaPjaGY6L_3WaslJ_E
```

Next, switch over to your Stratis system and update it to use the new Tang key. Stratis supports doing this while the filesystem(s) are online.

First, unbind the pool:

```
# stratis pool unbind pool1
```

Next, set the key with the original passphrase used when the encrypted pool was created:

```
# stratis key set --capture-key pool1key
Enter key data followed by the return key:
```

Finally, bind the pool to the Tang server with the updated key thumbprint:

```
# stratis pool bind nbde pool1 pool1key http://tang-server --thumbprint iyG5HcF01zaPjaGY6L_3WaslJ_E
```

The Stratis system is now configured to use the updated Tang key. Once any other client systems using the old Tang key have been updated, the two original key files that were renamed to hidden files in the /var/db/tang directory on the Tang server can be backed up and deleted.

### What if the Tang server is unavailable?

Next, shutdown the Tang server to simulate it being unavailable, then reboot the Stratis system.

Again, after the reboot, the Stratis pool is not available:

```
# stratis pool list
Name Total Physical Properties
```

If you try to unlock it with NBDE, this fails because the Tang server is unavailable:

```
# stratis pool unlock clevis
Execution failed:
An iterative command generated one or more errors: The operation 'unlock' on a resource of type pool failed. The following errors occurred:
Partial action "unlock" failed for pool with UUID 4d62f840f2bb4ec9ab53a44b49da3f48: Cryptsetup error: Failed with error: Error: Command failed: cmd: "clevis" "luks" "unlock" "-d" "/dev/vdb" "-n" "stratis-1-private-42142fedcb4c47cea2e2b873c08fcf63-crypt", exit reason: 1 stdout: stderr: /dev/vdb could not be opened.
```

At this point, without the Tang server being reachable, the only option to unlock the pool is to use the original key passphrase:

```
# stratis key set --capture-key pool1key
Enter key data followed by the return key:
```

You can then unlock the pool using the key:

```
# stratis pool unlock keyring
```

Next, verify the pool was successfully unlocked:

```
# stratis pool list
Name Total Physical Properties
pool1 4.98 GiB / 583.65 MiB / 4.41 GiB ~Ca, Cr
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/network-bound-disk-encryption-with-stratis/

作者：[briansmith][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/briansmith/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/stratis-nbde-816x345.jpg
[2]: https://unsplash.com/@imattsmart?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/lock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/getting-started-with-stratis-encryption/
[5]: https://stratis-storage.github.io/
[6]: https://www.youtube.com/watch?v=CJu3kmY-f5o
[7]: https://github.com/latchset/tang
[8]: https://github.com/latchset/clevis
