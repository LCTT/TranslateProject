[#]: subject: "How to Mount Bitlocker Encrypted Windows Partition in Linux"
[#]: via: "https://itsfoss.com/mount-encrypted-windows-partition-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Mount Bitlocker Encrypted Windows Partition in Linux
======

Here’s the scenario. My system came with Windows 10 Pro and that came with BitLocker encryption. I [installed Ubuntu in the dual boot mode even with the BitLocker encryption][1] enabled for Windows.

You can easily access the Windows files from within Linux. No hi-fi stuff here. Just go to the file manager and click on the Windows partition which is located usually under the “Other Locations” tab.

![Mounting Windows partition through the file manager in Linux desktop][2]

The process is not too complicated with BitLocker encrypted Windows partition as well. It’s just that when you try to mount the Windows partition, it will ask for the password.

![Password required for encrypted Windows drive mount in Linux][3]

It works though. In my case, I entered the 48 digit BitLocker recovery password and it decrypted the Windows partition and mounted it without any issue in Ubuntu 21.10 with GNOME 40.

Try your BitLocker password. If that does not work, try the recovery password. For normal Windows 10 Pro users, the recovery password is stored in your Microsoft account.

[BitLocker Recovery Password in Micrsoft Account][4]

Enter the recovery and you’ll see that Windows partition and its files are accessible now. Checking the “Remember Password” box is also a time saver for further usage.

![Encrypted Windows partition now mounted in Linux][5]

If the above does not work for you or if you are stuck with the command line, there is an alternative method.

This method involves using a tool called [Dislocker][6].

### Mount BotLocker encrypted Windows partition in Linux with Dislocker [Command Line Method]

Dislocker process works in two parts. The first part decrypts the BitLocker encryption and gives a file named dislocker-file. This is basically a virtual NTFS partition. The second part is basically mounting the virtual NTFS partition you just got.

You’ll need either the BitLocker password or the recovery password to decrypt the encrypted drive.

Let’s see the steps in details.

#### Step 1: Install Disclocker

Dislocker is available in the repositories of most Linux distributions. Please use your distribution’s package manager to install it.

On Ubuntu and Debian based distributions, use this command:

```

    sudo apt install dislocker

```

![Installing Dislocker in Ubuntu][7]

#### Step 2 : Create mount points

You’ll need to create two mount points. One for where Dislocker will generate the dislocker-file and the other one which will mount this dislocker-file (virtual filesystem) as a loop device.

There is no naming restrictions and you may name these mount directories anything you want.

Use these commands one by one:

```

    sudo mkdir -p /media/decrypt
    sudo mkdir -p /media/windows-mount

```

![Creating mount points for dislocker][8]

#### Step 3: Get the partition info which needs to be decrypted

You need the name of the Windows partition. You can use the file explorer or GUI tools like Gparted.

![Get the partition name][9]

In my case, the Windows partition is /dev/nvme0n1p3. It will be different for your system. You may also use command line for this purpose.

```

    sudo lsblk

```

#### Step 4: Decrypt the partition and mount

You have everything set up. Now comes the real part.

I**f you have the BitLocker password**, use the dislocker command in this fashion (replace &lt;partition_name&gt; and &lt;password&gt; with actual values):

```

    sudo dislocker <partition_name> -u<password> -- /media/decrypt

```

Please note that **there is no space between u and password**.

If you only have the recovery password, use the command in this fashion (replace &lt;partition_name&gt; and &lt;recovery_password&gt; with actual values):

```

    sudo dislocker <partition_name> -p<recovery_password> -- /media/decrypt

```

Again, there is **no space between p and password**.

It should not take a long time in decrypting the partition. You should see the dislocker-file in the designated mount point, /media/decrypt in our case. Now mount this dislocker-file:

```

    sudo mount -o loop /media/decrypt/dislocker-file /media/windows-mount

```

![][10]

You are done. Your BitLocker encrypted Windows partition is decrypted and mounted in Linux. You can access it from the file explorer as well.

![Mounting Dislocker decrypted Windows partition with file manager][11]

#### Troubleshooting tips for wrong fs type error

If you get an error like this:

```

    mount: /media/windows-mount: wrong fs type, bad option, bad superblock on /dev/loop35, missing codepage or helper program, or other error.

```

You should specify the filesystem while mounting.

For NTFS, use:

```

    sudo mount -t ntfs-3g -o loop /media/decrypt/dislocker-file /media/windows-mount

```

For exFAT, use:

```

    sudo mount -t exFAT-fuse -o loop /media/decrypt/dislocker-file /media/windows-mount

```

#### Unmount the Windows partition

You can unmount the mounted partition from the file manager. Just **click the unmount symbol** beside the partition named windows-mount.

Otherwise, unmount command is always there for you.

```

    sudo umount /media/decrypt
    sudo umount /media/windows-mount

```

I hope it helps you. If you still have questions or suggestions, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/mount-encrypted-windows-partition-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/dual-boot-ubuntu-windows-bitlocker/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/mount-encrypted-windows-partition-in-linux.png?resize=800%2C476&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/password-needed-for-encrypted-windows-drive-mount-in-Linux.png?resize=788%2C380&ssl=1
[4]: https://account.microsoft.com/devices/recoverykey?refd=support.microsoft.com
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/encrypted-windows-partition-mounted-in-Linux.png?resize=800%2C491&ssl=1
[6]: https://github.com/Aorimn/dislocker
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-dislocker-ubuntu.png?resize=786%2C386&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/creating-mount-points-for-dislocker.png?resize=777%2C367&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/show-device-name-gparted.png?resize=800%2C416&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/mount-dislocker-decrypted-windows-partition.png?resize=777%2C253&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/discloker-mount-encrypted-windows-partition.png?resize=800%2C483&ssl=1
