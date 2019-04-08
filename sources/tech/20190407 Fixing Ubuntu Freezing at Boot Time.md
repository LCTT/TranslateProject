[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fixing Ubuntu Freezing at Boot Time)
[#]: via: (https://itsfoss.com/fix-ubuntu-freezing/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Fixing Ubuntu Freezing at Boot Time
======

_**This step-by-step tutorial shows you how to deal with Ubuntu freezing at the boot by installing proprietary NVIDIA drivers. The tutorial was performed on a newly installed Ubuntu system but it should be applicable otherwise as well.**_

The other day I bought an [Acer Predator laptop][1] ([affiliate][2] link) to test various Linux distribution. It’s a bulky, heavy built laptop which is in contrast to my liking of smaller, lightweight laptops like the [awesome Dell XPS][3].

The reason why I opted for this gaming laptop even though I don’t game on PC is [NVIDIA Graphics][4]. Acer Predator Helios 300 comes with [NVIDIA Geforce][5] GTX 1050Ti.

NVIDIA is known for it’s poor compatibility with Linux. A number of It’s FOSS readers asked for my help with their NVIDIA laptops and I could do nothing because I didn’t have a system with NVIDIA graphics card.

So when I decided to get a new dedicated device for testing Linux distributions, I opted for a laptop with NVIDA graphics.

This laptop comes with Windows 10 installed on the 120 GB SSD and 1TB of HDD for storing data. I [dual booted Windows 10 with Ubuntu 18.04][6]. The installation was quick, easy and painless.

I booted into [Ubuntu][7]. It was showing the familiar purple screen and then I noticed that it froze there. The mouse won’ move, I couldn’t type anything and nothing else could be done except turning off the device by holding the power button.

And it was the same story at the next login try. Ubuntu just gets stuck at the purple screen even before reaching the login screen.

Sounds familiar? Let me show you how you can fix this problem of Ubuntu freezing at login.

Don’t use Ubuntu?

Please note that while this tutorial was performed with Ubuntu 18.04, this would also work on other Ubuntu-based distributions such as Linux Mint, elementary OS etc. I have confirmed it with Zorin OS.

### Fix Ubuntu freezing at boot time because of NVIDIA drivers

![][8]

The solution I am going to describe here works for systems with NVIDIA graphics card. It’s because your system is freezing thanks the open source [NVIDIA Nouveau drivers][9].

Without further delay, let’s see how to fix this problem.

#### Step 1: Editing Grub

When you boot your system, just stop at the Grub screen like the one below. If you don’t see this screen, keep holding Shift key at the boot time.

At this screen, press ‘E’ key to go into the editing mode.

![Press ‘E’ key][10]

You should see some sort of code like the one below. You should focus on the line that starts with Linux.

![Go to line starting with Linux][11]

#### Step 2: Temporarily Modifying Linux kernel parameters in Grub

Remember, our problem is with the NVIDIA Graphics drivers. This incompatibility with open source version of NVIDIA drivers caused the issue so what we can do here is to disable these drivers.

Now, there are several ways you can try to disable these drivers. My favorite way is to disable all video/graphics card using nomodeset.

Just add the following text at the end of the line starting with Linux. You should be able to type normally. Just make sure that you are adding it at the end of the line.

```
nomodeset
```

Now your screen should look like this:

![Disable graphics drivers by adding nomodeset to the kernel][12]

Press Ctrl+X or F10 to save and exit. Now you’ll boot with the newly modified kernel parameters here.

Explanation of what we did here (click to expand)

So, what did we just do here? What’s that nomodeset thing? Let me explain it to you briefly.

Normally, the video/graphics card were used after the X or any other display server was started. In other words, when you logged in to your system and see graphical user interface.

But lately, the video mode settings were moved to the kernel. Among other benefits, it enables you to have a beautiful, high resolution boot splash screens.

If you add the nomodeset parameter to the kernel, it instructs the kernel to load the video/graphics drivers after the display server is started.

In other words, you disabled loading the graphics driver at this time and the conflict it was causing goes away. After you login to the system and see everything because the graphics card is loaded again.

#### Step 3: Update your system and install proprietary NVIDIA drivers

Don’t be too happy yet just because you are able to login to your system now. What you did was temporary and the next time you boot into your system, your system will still freeze because it will still try to load the Nouveau drivers.

Does this mean you’ll always have to edit Kernel from the grub screen? Thankfully, the answer is no.

What you can do here is to [install additional drivers in Ubuntu][13] for NVIDIA. Ubuntu won’t freeze at boot time while using these proprietary drivers.

I am assuming that it’s your first login to a freshly installed system. This means you must [update Ubuntu][14] before you do anything else. Open a terminal using Ctrl+Alt+T [keyboard shortcut in Ubuntu][15] and use the following command:

```
sudo apt update && sudo apt upgrade -y
```

You may try installing additional drivers in Ubuntu right after the completion of the above command but in my experience, you’ll have to restart your system before you could successfully install the new drivers. And when you restart, you’ll have to change the kernel parameter again the same way we did earlier.

After your system is updated and restarted, press Windows key to go to the menu and search for Software & Updates.

![Click on Software & Updates][16]

Now go to the Additional Drivers tab and wait for a few seconds. Here you’ll see proprietary drivers available for your system. You should see NVIDIA in the list here.

Select the proprietary driver and click on Apply Changes.

![Installing NVIDIA Drivers][17]

It will take some time in the installation of the new drivers. If you have UEFI secure boot enabled on your system, you’ll be also asked to set a password. _You can set it to anything that is easy to remember_. I’ll show you its implications later in step 4.

![You may have to setup a secure boot password][18]

Once the installation finishes, you’ll be asked to restart the system to take changes into effect.

![Restart your system once the new drivers are installed][19]

#### Step 4: Dealing with MOK (only for UEFI Secure Boot enabled devices)

If you were asked to setup a secure boot password, you’ll see a blue screen that says something about “MOK management”. It’s a complicated topic and I’ll try to explain it in simpler terms.

MOK ([Machine Owner Key][20]) is needed due to the secure boot feature that requires all kernel modules to be signed. Ubuntu does that for all the kernel modules that it ships in the ISO. Because you installed a new module (the additional driver) or made a change in the kernel modules, your secure system may treat it as an unwarranted/foreign change in your system and may refuse to boot.

Hence, you can either sign the kernel module on your own (telling your UEFI system not to panic because you made these changes) or you simply [disable the secure boot][21].

Now that you know a little about [secure boot and MOK][22], let’s see what to do at the next boot when you see the blue screen at the next boot.

If you select “Continue boot”, chances are that your system will boot like normal and you won’t have to do anything at all. But it’s possible that not all features of the new driver work correctly.

This is why, you should **choose Enroll MOK**.

![][23]

It will ask you to Continue in the next screen followed by asking a password. Use the password you had set while installing the additional drivers in the previous step. You’ll be asked to reboot now.

Don’t worry!

If you miss this blue screen of MOK or accidentally clicked Continue boot instead of Enroll MOK, don’t panic. Your main aim is to be able to boot into your system and you have successfully done that part by disabling the Nouveau graphics driver.

The worst case would be that your system switched to the integrated Intel graphics instead of the NVIDIA graphics. You can install the NVIDIA graphics drivers later at any point of time. Your priority is to boot into the system.

#### Step 5: Enjoying Ubuntu Linux with proprietary NVIDIA drivers

Once the new driver is installed, you’ll have to restart your system again. Don’t worry! Things should be better now and you won’t need to edit the kernel parameters anymore. You’ll be booting into Ubuntu straightaway.

I hope this tutorial helped you to fix the problem of Ubuntu freezing at the boot time and you were able to boot into your Ubuntu system.

If you have any questions or suggestions, please let me know in the comment section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/fix-ubuntu-freezing/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://amzn.to/2YVV6rt
[2]: https://itsfoss.com/affiliate-policy/
[3]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[4]: https://www.nvidia.com/en-us/
[5]: https://www.nvidia.com/en-us/geforce/
[6]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[7]: https://www.ubuntu.com/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/fixing-frozen-ubuntu.png?resize=800%2C450&ssl=1
[9]: https://nouveau.freedesktop.org/wiki/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/edit-grub-menu.jpg?resize=800%2C393&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/editing-grub-to-fix-nvidia-issue.jpg?resize=800%2C343&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/editing-grub-to-fix-nvidia-issue-2.jpg?resize=800%2C320&ssl=1
[13]: https://itsfoss.com/install-additional-drivers-ubuntu/
[14]: https://itsfoss.com/update-ubuntu/
[15]: https://itsfoss.com/ubuntu-shortcuts/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/activities_software_updates_search-e1551416201782-800x228.png?resize=800%2C228&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/install-nvidia-driver-ubuntu.jpg?resize=800%2C520&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/secure-boot-nvidia.jpg?ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/nvidia-drivers-installed-Ubuntu.jpg?resize=800%2C510&ssl=1
[20]: https://firmware.intel.com/blog/using-mok-and-uefi-secure-boot-suse-linux
[21]: https://itsfoss.com/disable-secure-boot-in-acer/
[22]: https://wiki.ubuntu.com/UEFI/SecureBoot/DKMS
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/MOK-Secure-boot.jpg?resize=800%2C350&ssl=1
