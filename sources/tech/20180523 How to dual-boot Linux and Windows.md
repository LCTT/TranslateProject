How to dual-boot Linux and Windows
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q)

Even though Linux is a great operating system with widespread hardware and software support, the reality is that sometimes you have to use Windows, perhaps due to key apps that won't run under Linux. Thankfully, dual-booting Windows and Linux is very straightforward—and I'll show you how to set it up, with Windows 10 and Ubuntu 18.04, in this article.

Before you get started, make sure you've backed up your computer. Although the dual-boot setup process is not very involved, accidents can still happen. So take the time to back up your important files in case chaos theory comes into play. In addition to backing up your files, consider taking an image backup of the disk as well, though that's not required and can be a more advanced process.

### Prerequisites

To get started, you will need the following five items:

#### 1\. Two USB flash drives (or DVD-Rs)

I recommend installing Windows and Ubuntu via flash drives since they're faster than DVDs. It probably goes without saying, but creating bootable media erases everything on the flash drive. Therefore, make sure the flash drives are empty or contain data you don't care about losing.

If your machine doesn't support booting from USB, you can create DVD media instead. Unfortunately, because no two computers seem to have the same DVD-burning software, I can't walk you through that process. However, if your DVD-burning application has an option to burn from an ISO image, that's the option you need.

#### 2\. A Windows 10 license

If Windows 10 came with your PC, the license will be built into the computer, so you don't need to worry about entering it during installation. If you bought the retail edition, you should have a product key, which you will need to enter during the installation process.

#### 3\. Windows 10 Media Creation Tool

Download and launch the Windows 10 [Media Creation Tool][1]. Once you launch the tool, it will walk you through the steps required to create the Windows media on a USB or DVD-R. Note: Even if you already have Windows 10 installed, it's a good idea to create bootable media anyway, just in case something goes wrong and you need to reinstall it.

#### 4\. Ubuntu 18.04 installation media

Download the [Ubuntu 18.04][2] ISO image.

#### 5\. Etcher software (for making a bootable Ubuntu USB drive)

For creating bootable media for any Linux distribution, I recommend [Etcher][3]. Etcher works on all three major operating systems (Linux, MacOS, and Windows) and is careful not to let you overwrite your current operating system partition.

Once you have downloaded and launched Etcher, click Select image, and point it to the Ubuntu ISO you downloaded in step 4. Next, click Select drive to choose your flash drive, and click Flash! to start the process of turning a flash drive into an Ubuntu installer. (If you're using a DVD-R, use your computer's DVD-burning software instead.)

### Install Windows and Ubuntu

You should be ready to begin. At this point, you should have accomplished the following:

  * Backed up your important files
  * Created Windows installation media
  * Created Ubuntu installation media



There are two ways of going about the installation. First, if you already have Windows 10 installed, you can have the Ubuntu installer resize the partition, and the installation will proceed in the empty space. Or, if you haven't installed Windows 10, install it on a smaller partition you can set up during the installation process. (I'll describe how to do that below.) The second way is preferred and less error-prone. There's a good chance you won't have any issues either way, but installing Windows manually and giving it a smaller partition, then installing Ubuntu, is the easiest way to go.

If you already have Windows 10 on your computer, skip the following Windows installation instructions and proceed to Installing Ubuntu.

#### Installing Windows

Insert the Windows installation media you created into your computer and boot from it. How you do this depends on your computer, but most have a key you can press to initiate the boot menu. On a Dell PC for example, that key is F12. If the flash drive doesn't show up as an option, you may need to restart the computer. Sometimes it will show up only if you've inserted the media before turning on the computer. If you see a message like, "press any key to boot from the installation media," press a key. You should see the following screen. Select your language and keyboard style and click Next.

![Windows setup][5]

Click on Install now to start the Windows installer.

On the next screen, it will ask for your product key. If you don't have one because Windows 10 came with your PC, select "I don't have a product key." It should automatically activate after the installation once it catches up with updates. If you do have a product key, type that in and click Next.


![Enter product key][7]


Select which version of Windows you want to install. If you have a retail copy, the label will tell you what version you have. Otherwise, it is typically located with the documentation that came with your computer. In most cases, it's going to be either Windows 10 Home or Windows 10 Pro. Most PCs that come with the Home edition have a label that simply reads "Windows 10," while Pro is clearly marked.


![Select Windows version][10]


Accept the license agreement by checking the box, then click Next.


![Accept license terms][12]


After accepting the agreement, you have two installation options available. Choose the second option, Custom: Install Windows only (advanced).


![Select type of Windows installation][14]


The next screen should show your current hard disk configuration.


![Hard drive configuration][16]


Your results will probably look different than mine. I have never used this hard disk before, so it's completely unallocated. You will probably see one or more partitions for your current operating system. Highlight each partition and remove it.

At this point, your screen will show your entire disk as unallocated. To continue, create a new partition.


![Create a new partition][18]


Here you can see that I divided the drive in half (or close enough) by creating a partition of 81,920MB (which is close to half of 160GB). Give Windows at least 40GB, preferably 64GB or more. Leave the rest of the drive unallocated, as that's where you'll install Ubuntu later.

Your results will look similar to this:


![Leaving a partition with unallocated space][20]


Confirm the partitioning looks good to you and click Next. Windows will begin installing.


![Installing Windows][22]


If your computer successfully boots into Windows, you're all set to move on to the next step.

![Windows desktop][24]


#### Installing Ubuntu

Whether it was already there or you worked through the steps above, at this point you should have Windows installed. Now use the Ubuntu installation media you created earlier to boot into Ubuntu. Go ahead and insert the media and boot your computer from it. Again, the exact sequence of keys to access the boot menu varies from one computer to another, so check your documentation if you're not sure. If all goes well, you see the following screen once the media finishes loading:


![Ubuntu installation welcome screen][26]


Here, you can select between Try Ubuntu or Install Ubuntu. Don't install just yet; instead, click Try Ubuntu. After it finishes loading, you should see the Ubuntu desktop.


![Ubuntu desktop][28]

By clicking Try Ubuntu, you have opted to try out Ubuntu before you install it. Here, in Live mode, you can play around with Ubuntu and make sure everything works before you commit to the installation. Ubuntu works with most PC hardware, but it's always better to test it out beforehand. Make sure you can access the internet and get audio and video playback. Going to YouTube and playing a video is a good way of doing all of that at once. If you need to connect to a wireless network, click on the networking icon at the top-right of the screen. There, you can find a list of wireless networks and connect to yours.

Once you're ready to go, double-click on the Install Ubuntu 18.04 LTS icon on the desktop to launch the installer.

Choose the language you want to use for the installation process, then click Continue.


![Select language in Ubuntu][30]


Next, choose the keyboard layout. Once you've made your selection, click Continue.


![Select keyboard in Ubuntu][32]

You have a few options on the screen below. One, you can choose a Normal or a Minimal installation. For most people, the Normal installation is ideal. Advanced users may want to do a Minimal install instead, which has fewer software applications installed by default. In addition, you can choose to download updates and whether or not to include third-party software and drivers. I recommend checking both of those boxes. When done, click Continue.


![Choose Ubuntu installation options][34]

The next screen asks whether you want to erase the disk or set up a dual-boot. Since you're dual-booting, choose Install Ubuntu alongside Windows 10. Click Install Now.


![install Ubuntu alongside Windows][36]


The following screen may appear. If you installed Windows from scratch and left unallocated space on the disk, Ubuntu will automatically set itself up in the empty space, so you won't see this screen. If you already had Windows 10 installed and it's taking up the entire drive, this screen will appear and give you an option to select a disk at the top. If you have just one disk, you can choose how much space to steal from Windows and apply to Ubuntu. You can drag the vertical line in the middle left and right with your mouse to take space away from one and gives it to the other. Adjust this exactly the way you want it, then click Install Now.


![Allocate drive space][38]


You should see a confirmation screen indicating what Ubuntu plans on doing. If everything looks right, click Continue.

Ubuntu is now installing in the background. You still have some configuration to do, though. While Ubuntu tries its best to figure out your location, you can click on the map to narrow it down to ensure your time zone and other things are set correctly.

Next, fill in the user account information: your name, computer name, username, and password. Click Continue when you're done.

There you have it! The installation is complete. Go ahead and reboot the PC.

If all went according to plan, you should see a screen similar to this when your computer restarts. Choose Ubuntu or Windows 10; the other options are for troubleshooting, so I won't go into them.

Try booting into both Ubuntu and Windows to test them out and make sure everything works as expected. If it does, you now have both Windows and Ubuntu installed on your computer.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/dual-boot-linux

作者：[Jay LaCroix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://www.microsoft.com/en-us/software-download/windows10
[2]:https://www.ubuntu.com/download/desktop
[3]:http://www.etcher.io
[4]:/file/397066
[5]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_01.png (Windows setup)
[6]:/file/397076
[7]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_03.png (Enter product key)
[8]:data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw== (Click and drag to move)
[9]:/file/397081
[10]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_04.png (Select Windows version)
[11]:/file/397086
[12]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_05.png (Accept license terms)
[13]:/file/397091
[14]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_06.png (Select type of Windows installation)
[15]:/file/397096
[16]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_07.png (Hard drive configuration)
[17]:/file/397101
[18]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_08.png (Create a new partition)
[19]:/file/397106
[20]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_09.png (Leaving a partition with unallocated space)
[21]:/file/397111
[22]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_10.png (Installing Windows)
[23]:/file/397116
[24]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_11.png (Windows desktop)
[25]:/file/397121
[26]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_12.png (Ubuntu installation welcome screen)
[27]:/file/397126
[28]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_13.png (Ubuntu desktop)
[29]:/file/397131
[30]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_15.png (Select language in Ubuntu)
[31]:/file/397136
[32]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_16.png (Select keyboard in Ubuntu)
[33]:/file/397141
[34]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_17.png (Choose Ubuntu installation options)
[35]:/file/397146
[36]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_18.png (Install Ubuntu alongside Windows)
[37]:/file/397151
[38]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_18b.png (Allocate drive space)
