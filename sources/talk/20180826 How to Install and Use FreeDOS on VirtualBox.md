How to Install and Use FreeDOS on VirtualBox
======
This step-by-step guide shows you how to install FreeDOS on VirtualBox in Linux.

### Installing FreeDOS on VirtualBox in Linux

<https://www.youtube.com/embed/p1MegqzFAqA?enablejsapi=1&autoplay=0&cc_load_policy=0&iv_load_policy=1&loop=0&modestbranding=1&rel=0&showinfo=0&fs=1&playsinline=0&autohide=2&theme=dark&color=red&controls=2&>

In November of 2017, I [interviewed Jim Hall][1] about the history behind the [FreeDOS project][2]. Today, I’m going to tell you how to install and use FreeDOS. Please note: I will be using [VirtualBox][3] 5.2.14 on [Solus][4].

Note: I used Solus as the host operating system for this tutorial because it is very easy to setup. One thing you should keep in mind is that Solus’ Software Center contains two versions of VirtualBox: `virtualbox` and `virtualbox-current`. Solus gives you the option to use the linux-lts kernel and the linux-current kernel. `virtualbox`is modified for linux-lts and `virtualbox-current` is for linux-current.

#### Step 1 – Create New Virtual Machine

![][5]

Once you open VirtualBox, press the “New” button to create a new virtual machine. You can name it whatever you want, I just use “FreeDOS”. You can use the label to specify what version of FreeDOS you are installing. You also need to select the type and version of the operating system you will be installing. Select “Other” and “DOS”.

#### Step 2 – Select Memory Size

![][6]

The next dialog box will ask you how much of the host computer’s memory you want to make available to FreeDOS. The default is 32MB. Don’t change it. Back in the day, this would be a huge amount of RAM for a DOS machine. If you need to, you can increase it later by right-clicking on the virtual machine you created for FreeDOS and selecting Settings -> System.

![][7]

#### Step 3 – Create Virtual Hard Disk

![][8]

Next, you will be asked to create a virtual hard drive where FreeDOS and its files will be stored. Since you haven’t created one yet, just click “Create”.

The next dialog box will ask you what hard disk file type you want to use. This default (VirtualBox Disk Image) works just fine. Click “Next”.

The next question you will encounter is how you want the virtual disk to act. Do you want it to start small and gradually grow to its full size as you create files and install programs? Then choose dynamically allocated. If you prefer that the virtual hard drive (vhd) is created at full size, then choose fixed size. Dynamically allocated is nice if you don’t plan to use the whole vhd or if you don’t have very much free space on your hard drive. (Keep in mind that while the size of a dynamically allocated vhd increases as you add files, it will not drop when you remove files.) I prefer dynamically allocated, but you can choose the option that serves your needs best and click “Next”.

![][9]

Now, you can choose the size and location of the vhd. 500 MB should be plenty of space. Remember most of the programs you will be using will be text-based, thus fairly small. Once you make your adjustments, click Create,

#### Step 4 – Attach .iso file

Before we continue, you will need to [download][10] the FreeDOS .iso file. You will need to choose the CDROM “standard” installer.

![][11]

Once the file has been downloaded, return to VirtualBox. Select your virtual machine and open the settings. You can do this by either right-clicking on the virtual machine and selecting “Settings” or highlight the virtual machine and click the “Settings” button.

Now, click the “Storage” tab. Under “Storage Devices”, select the CD icon. (It should say “Empty” next to it.) In the “Attributes” panel on the right, click on the CD icon and select the location of the .iso file you just downloaded.

Note: Typically, after you install an operating system on VirtualBox you can delete the original .iso file. Not with FreeDOS. You need the .iso file if you want to install applications via the FreeDOS package manager. I generally keep the ,iso file attached the virtual machine in case I want to install something. If you do that, you have to make sure that you tell FreeDOS you want to boot from the hard drive each time you boot it up because it defaults to the attached CD/iso. If you forget to attach the .iso, don’t worry. You can do so by selecting “Devices” on the top of your FreeDOS virtual machine window. The .iso files are listed under “Optical Drives”.

#### Step 5 – Install FreeDOS

![][12]

Now that we’ve completed all of the preparations, let’s install FreeDOS.

First, you need to be aware of a bug in the most recent version of VirtualBox. If you start the virtual machine that we just created and select “Install to harddisk” when the FreeDOS welcome screen appears, you will see an unending, scrolling mass of machine code. I’ve only run into this issue recently and it affects both the Linux and Windows versions of VirtualBox. (I know first hand.)

To get around this, you need to make a simple edit. When you see the FreeDOS welcome screen, press Tab. (Make sure that the “Install to harddrive” option is selected.) Type the word `raw` after “fdboot.img” and hit Enter. The FreeDOS installer will then start.

![][13]

The first part of the installer will handle formatting your virtual drive. Once formatting is completed, the installer will reboot. When the FreeDOS welcome screen appears again, you will have to re-enter the `raw` comment you used earlier.

Make sure that you select “Yes” on all of the questions in the installer. One important question that doesn’t have a “Yes” or “No” answer is: “What FreeDOS packages do you want to install?. The two options are “Base packages” or “Full installation”. Base packages are for those who want a DOS experience most like the original MS-DOS. The Full installation includes a bunch of tools and utilities to improve DOS.

At the end of the installation, you will be given the option to reboot or stay on DOS. Select “reboot”.

#### Step 6 – Setup Networking

Unlike the original DOS, FreeDOS can access the internet. You can install new packages and update the ones already you have installed. In order to use networking, you need to install several applications in FreeDOS.

![][14]

First, boot into your newly created FreeDOS virtual machine. At the FreeDOS selection screen, select “Boot from System harddrive”.

![][15]

Now, to access the FreeDOS package manager, type `fdimples`. You can navigate around the package manager with the arrow keys and select categories or packages with the space bar. From the “Networking” category, you need to select `fdnet`. The FreeDOS Project also recommends installing `mtcp` and `wget`. Hit “Tab” several times until “OK” is selected and press “Enter”. Once the installation is complete, type `reboot` and hit enter. After the system reboots, boot to your system drive. If the network installation was successful, you will see several new messages at the terminal listing your network information.

![][16]

##### Note

Sometimes the default VirtualBox setup doesn’t work. If that happens, close your FreeDOS VirtualBox window. Right-click your virtual machine from the main VirtualBox screen and select “Settings”. The default VirtualBox network setting is “NAT”. Change it to “Bridged Adapter” and retry installing the FreeDOS packages. It should work now.

#### Step 7 – Basic Usage of FreeDOS

##### Commons Commands

Now that you have installed FreeDOS, let’s look at a few basic commands. If you have ever used the Command Prompt on Windows, you will be familiar with some of these commands.

  * `DIR`– display the contents of the current directory
  * `CD` – change the directory you are currently in
  * `COPY OLD.TXT NEW.TXT`– copy files
  * `TYPE TEST.TXT` – display content of file
  * `DEL TEST.TXT` – delete file
  * `XCOPY DIR NEWDIR` – copy directory and all of its contents
  * `EDIT TEST.TXT`– edit a file
  * `MKDIR NEWDIR` – create a new directory
  * `CLS` – clear the screen



You can find more basic DOS commands on the web or the [handy cheat sheet][17] created by Jim Hall.

##### Running a Program

Running program on FreeDos is fairly easy. When you install an application with the `fdimples` package manager, be sure to note where the .EXE file of the application is located. This is shown in the application’s details. To run the application, you generally need to navigate to the application folder and type the application’s name.

For example, FreeDOS has an editor named `FED` that you can install. After installing it, all you need to do is navigate to `C:\FED` and type `FED`.

Sometimes a program, such as Pico, is stored in the `\bin` folder. These programs can be called up from any folder.

Games usually have an .EXE program or two that you have to run before you can play the game. These setup file usually fix sound, video, or control issues.

If you run into problems that this tutorial didn’t cover, don’t forget to visit the [home of FreeDOS][2]. They have a wiki and several other support options.

Have you ever used FreeDOS? What tutorials would you like to see in the future? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][18].

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-freedos/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:https://itsfoss.com/interview-freedos-jim-hall/
[2]:http://www.freedos.org/
[3]:https://www.virtualbox.org/
[4]:https://solus-project.com/home/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-1.jpg
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-2.jpg
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-3.jpg
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-4.jpg
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-6.jpg
[10]:http://www.freedos.org/download/
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-7.jpg
[12]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-8.png
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-9.png
[14]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-10.png
[15]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-11.png
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/freedos-tutorial-12.png
[17]:https://opensource.com/article/18/6/freedos-commands-cheat-sheet
[18]:http://reddit.com/r/linuxusersgroup
