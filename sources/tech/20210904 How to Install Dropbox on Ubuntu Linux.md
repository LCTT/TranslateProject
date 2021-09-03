[#]: subject: "How to Install Dropbox on Ubuntu Linux"
[#]: via: "https://itsfoss.com/install-dropbox-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Dropbox on Ubuntu Linux
======

Dropbox is one of the [most popular cloud storage services available for Linux][1] and other operating systems.

In fact, Dropbox is one of the earliest services to provide a native Linux application. It still [supports 32-bit Linux systems][2] that is also a commendable job.

In this beginner’s tutorial, I’ll show the steps for installing Dropbox on Ubuntu. The steps are really simple but some websites make it unnecessarily complicated.

### Install Dropbox on Ubuntu desktop

Let’s see the installation procedure, step by step.

#### Step 1: Get Dropbox installer for Ubuntu

Dropbox offers DEB files for its installer. Go to the download section of its website:

[Dropbox Download][3]

And download the appropriate DEB file. Considering that you are using 64 bit Ubuntu, get the deb file for 64-bit version.

![Download the Dropbox installer][4]

#### Step 2: Install Dropbox installer

The deb file you downloaded is just an installer for Dropbox. Actual Dropbox installation starts later, similar to [installing Steam on Ubuntu][5].

To [install the downloaded deb file][6], either double click on it or right click and select open with Software Install.

![Installing the downloaded Dropbox deb file][7]

It will open the software center and you can click the install button.

![Installing Dropbox deb file][8]

Wait for the installation to finish.

#### Step 3: Start Dropbox installation

Dropbox installer is now installed. Press the Windows key (also known as super key) and search for Dropbox and click on it.

![Start Dropbox for installation][9]

On the first launch, it shows two popups. One about restarting Nautilus (the file explorer in Ubuntu) and the other about Dropbox installation.

![Starting Dropbox installation][10]

Clicking either Restart Nautilus/Close (on the Nautilus popup) or OK (on the installation popup) starts the actual Dropbox client download and installation. If the ‘Nautilus Restart’ does not close on clicking Close button, click the x button.

Wait for the Dropbox installation to finish.

![Installing Dropbox][11]

Oh! Nautilus restart is required because Dropbox adds some extra features like showing the synchronization status in the file explorer.

Once Dropbox is installed, it should either take you to the Dropbox login page automatically or you can hit the Dropbox icon at the top and select sign in option.

![Sign in to Dropbox after installation][12]

In fact, this is how you would be accessing Dropbox settings in the future.

#### Step 4: Start using Dropbox on Ubuntu

![Sign in into Dropbox][13]

**Note**: Dropbox won’t work until you successfully sign in. Here’s a catch. The free version of Dropbox limits the number of devices you can link to your account. **If you already have 3 linked devices, you should remove some of the older ones that you do not use.**

Once you are successfully signed in, you should see a Dropbox folder created in your home directory and your files from the cloud starts appearing here.

![Dropbox folder is created under home directory][14]

If you want to save disk space or bandwidth, you can go to the Preferences and choose the Selective Sync option. The selective sync option allows you only sync selected folders from Dropbox cloud on your local system.

![Using selective sync in Dropbox][15]

Dropbox automatically starts at each boot. This is the behavior you should expect from any cloud service, I believe.

That’s all you need to get started with Dropbox on Ubuntu. I hope you find this tutorial helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-dropbox-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/cloud-services-linux/
[2]: https://itsfoss.com/32-bit-linux-distributions/
[3]: https://www.dropbox.com/install-linux
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/get-dropbox-for-ubuntu.png?resize=800%2C294&ssl=1
[5]: https://itsfoss.com/install-steam-ubuntu-linux/
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/dropbox-installer-ubuntu.png?resize=797%2C476&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-dropbox-deb-file.png?resize=800%2C346&ssl=1
[9]: https://itsfoss.com/wp-content/uploads/2021/09/start-drobox-ubuntu.webp
[10]: https://itsfoss.com/wp-content/uploads/2021/09/starting-dropbox-installation-800x599.webp
[11]: https://itsfoss.com/wp-content/uploads/2021/09/installing-dropbox.webp
[12]: https://itsfoss.com/wp-content/uploads/2021/09/sign-in-to-dropbox-after-first-installation.webp
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/sign-in-dropbox.png?resize=800%2C409&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/dropbox-folder-ubuntu.png?resize=800%2C491&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/Dropbox-selective-sync.png?resize=800%2C399&ssl=1
