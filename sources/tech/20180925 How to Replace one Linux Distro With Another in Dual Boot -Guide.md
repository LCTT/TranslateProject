How to Replace one Linux Distro With Another in Dual Boot [Guide]
======
**If you have a Linux distribution installed, you can replace it with another distribution in the dual boot. You can also keep your personal documents while switching the distribution.**

![How to Replace One Linux Distribution With Another From Dual Boot][1]

Suppose you managed to [successfully dual boot Ubuntu and Windows][2]. But after reading the [Linux Mint versus Ubuntu discussion][3], you realized that [Linux Mint][4] is more suited for your needs. What would you do now? How would you [remove Ubuntu][5] and [install Mint in dual boot][6]?

You might think that you need to uninstall [Ubuntu][7] from dual boot first and then repeat the dual booting steps with Linux Mint. Let me tell you something. You don’t need to do all of that.

If you already have a Linux distribution installed in dual boot, you can easily replace it with another. You don’t have to uninstall the existing Linux distribution. You simply delete its partition and install the new distribution on the disk space vacated by the previous distribution.

Another good news is that you may be able to keep your Home directory with all your documents and pictures while switching the Linux distributions.

Let me show you how to switch Linux distributions.

### Replace one Linux with another from dual boot

<https://youtu.be/ptF2RUehbKs>

Let me describe the scenario I am going to use here. I have Linux Mint 19 installed on my system in dual boot mode with Windows 10. I am going to replace it with elementary OS 5. I’ll also keep my personal files (music, pictures, videos, documents from my home directory) while switching distributions.

Let’s first take a look at the requirements:

  * A system with Linux and Windows dual boot
  * Live USB of Linux you want to install
  * Backup of your important files in Windows and in Linux on an external disk (optional yet recommended)



#### Things to keep in mind for keeping your home directory while changing Linux distribution

If you want to keep your files from existing Linux install as it is, you must have a separate root and home directory. You might have noticed that in my [dual boot tutorials][8], I always go for ‘Something Else’ option and then manually create root and home partitions instead of choosing ‘Install alongside Windows’ option. This is where all the troubles in manually creating separate home partition pay off.

Keeping Home on a separate partition is helpful in situations when you want to replace your existing Linux install with another without losing your files.

Note: You must remember the exact username and password of your existing Linux install in order to use the same home directory as it is in the new distribution.

If you don’t have a separate Home partition, you may create it later as well BUT I won’t recommend that. That process is slightly complicated and I don’t want you to mess up your system.

With that much background information, it’s time to see how to replace a Linux distribution with another.

#### Step 1: Create a live USB of the new Linux distribution

Alright! I already mentioned it in the requirements but I still included it in the main steps to avoid confusion.

You can create a live USB using a start up disk creator like [Etcher][9] in Windows or Linux. The process is simple so I am not going to list the steps here.

#### Step 2: Boot into live USB and proceed to installing Linux

Since you have already dual booted before, you probably know the drill. Plugin the live USB, restart your system and at the boot time, press F10 or F12 repeatedly to enter BIOS settings.

In here, choose to boot from the USB. And then you’ll see the option to try the live environment or installing it immediately.

You should start the installation procedure. When you reach the ‘Installation type’ screen, choose the ‘Something else’ option.

![Replacing one Linux with another from dual boot][10]
Select ‘Something else’ here

#### Step 3: Prepare the partition

You’ll see the partitioning screen now. Look closely and you’ll see your Linux installation with Ext4 file system type.

![Identifying Linux partition in dual boot][11]
Identify where your Linux is installed

In the above picture, the Ext4 partition labeled as Linux Mint 19 is the root partition. The second Ext4 partition of 82691 MB is the Home partition. I [haven’t used any swap space][12] here.

Now, if you have just one Ext4 partition, that means that your home directory is on the same partition as root. In this case, you won’t be able to keep your Home directory. I suggest that you copy the important files to an external disk else you’ll lose them forever.

It’s time to delete the root partition. Select the root partition and click the – sign. This will create some free space.

![Delete root partition of your existing Linux install][13]
Delete root partition

When you have the free space, click on + sign.

![Create root partition for the new Linux][14]
Create a new root partition

Now you should create a new partition out of this free space. If you had just one root partition in your previous Linux install, you should create root and home partitions here. You can also create the swap partition if you want to.

If you had root and home partition separately, just create a root partition from the deleted root partition.

![Create root partition for the new Linux][15]
Creating root partition

You may ask why did I use delete and add instead of using the ‘change’ option. It’s because a few years ago, using change didn’t work for me. So I prefer to do a – and +. Is it superstition? Maybe.

One important thing to do here is to mark the newly created partition for format. f you don’t change the size of the partition, it won’t be formatted unless you explicitly ask it to format. And if the partition is not formatted, you’ll have issues.

![][16]
It’s important to format the root partition

Now if you already had a separate Home partition on your existing Linux install, you should select it and click on change.

![Recreate home partition][17]
Retouch the already existing home partition (if any)

You just have to specify that you are mounting it as home partition.

![Specify the home mount point][18]
Specify the home mount point

If you had a swap partition, you can repeat the same steps as the home partition. This time specify that you want to use the space as swap.

At this stage, you should have a root partition (with format option selected) and a home partition (and a swap if you want to). Hit the install now button to start the installation.

![Verify partitions while replacing one Linux with another][19]
Verify the partitions

The next few screens would be familiar to you. What matters is the screen where you are asked to create user and password.

If you had a separate home partition previously and you want to use the same home directory, you MUST use the same username and password that you had before. Computer name doesn’t matter.

![To keep the home partition intact, use the previous user and password][20]
To keep the home partition intact, use the previous user and password

Your struggle is almost over. You don’t have to do anything else other than waiting for the installation to finish.

![Wait for installation to finish][21]
Wait for installation to finish

Once the installation is over, restart your system. You’ll have a new Linux distribution or version.

In my case, I had the entire home directory of Linux Mint 19 as it is in the elementary OS. All the videos, pictures I had remained as it is. Isn’t that nice?

--------------------------------------------------------------------------------

via: https://itsfoss.com/replace-linux-from-dual-boot/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/Replace-Linux-Distro-from-dual-boot.png
[2]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[3]: https://itsfoss.com/linux-mint-vs-ubuntu/
[4]: https://www.linuxmint.com/
[5]: https://itsfoss.com/uninstall-ubuntu-linux-windows-dual-boot/
[6]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[7]: https://www.ubuntu.com/
[8]: https://itsfoss.com/guide-install-elementary-os-luna/
[9]: https://etcher.io/
[10]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-1.jpg
[11]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-2.jpg
[12]: https://itsfoss.com/swap-size/
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-3.jpg
[14]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-4.jpg
[15]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-5.jpg
[16]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-6.jpg
[17]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-7.jpg
[18]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-8.jpg
[19]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-9.jpg
[20]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-10.jpg
[21]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/replace-linux-with-another-11.jpg
