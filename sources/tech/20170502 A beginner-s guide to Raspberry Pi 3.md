A beginner’s guide to Raspberry Pi 3
======
![](https://images.techhive.com/images/article/2017/03/raspberry2-100711632-large.jpeg)
This article is part of a weekly series where I'll create new projects using Raspberry Pi 3. The first article of the series focusses on getting you started and will cover the installation of Raspbian, with PIXEL desktop, setting up networking and some basics.

###  What you need:

  * A Raspberry Pi 3
  * A 5v 2mAh power supply with mini USB pin
  * Micro SD card with at least 8GB capacity
  * Wi-Fi or Ethernet cable
  * Heat sink
  * Keyboard and mouse
  * a PC monitor
  * A Mac or PC to prepare microSD card.



There are many Linux-based operating systems available for Raspberry Pi that you can install directly, but if you're new to the Pi, I suggest NOOBS, the official OS installer for Raspberry Pi that simplifies the process of installing an OS on the device.

Download NOOBS from [this link][1] on your system. It's a compressed .zip file. If you're on MacOS, just double click on it and MacOS will automatically uncompress the files. If you are on Windows, right-click on it, and select "extract here."

 **[ Give yourself a technology career advantage with[InfoWorld's Deep Dive technology reports and Computerworld's career trends reports][2]. GET A 15% DISCOUNT through Jan. 15, 2017: Use code 8TIISZ4Z. ]**

If you're running desktop Linux, then how to unzip it really depends on the desktop environment you are running, as different DEs have different ways of doing the same thing. So the easiest way is to use the command line.

`$ unzip NOOBS.zip`

Irrespective of the operating system, open the unzipped file and check if the file structure looks like this:

![content][3] Swapnil Bhartiya

Now plug the Micro SD card to your PC and format it to the FAT32 file system. On MacOS, use the Disk Utility tool and format the Micro SD card:

![format][4] Swapnil Bhartiya

On Windows, just right click on the card and choose the formatting option. If you're on desktop Linux, different DEs use different tools, and covering all the DEs is beyond the scope of this story. I have written a tutorial [using the command line interface on Linux][5] to format an SD card with Fat32 file system.

Once you have the card formatted in the Fat32 partition, just copy the content of the downloaded NOOBS directory into the root directory of the device. If you are on MacOS or Linux, just rsync the content of NOOBS to the SD card. Open Terminal app in MacOS or Linux and run the rsync command in this format:

`rsync -avzP /path_of_NOOBS /path_of_sdcard`

Make sure to select the root directory of the sd card. In my case (on MacOS), it was:

`rsync -avzP /Users/swapnil/Downloads/NOOBS_v2_2_0/ /Volumes/U/`

Or you can copy and paste the content. Just make sure that all the files inside the NOOBS directory are copied into the root directory of the Micro SD Card and not inside any sub-directory.

Now plug the Micro SD Card into the Raspberry Pi 3, connect the monitor, the keyboard and power supply. If you do have wired network, I recommend using it as you will get faster download speed to download and install the base operating system. The device will boot into NOOBS that offers a couple of distributions to install. Choose Raspbian from the first option and follow the on-screen instructions.

![raspi config][6] Swapnil Bhartiya

Once the installation is complete, Pi will reboot, and you will be greeted with Raspbian. Now it's time to configure it and run system updates. In most cases, we use Raspberry Pi in headless mode and manage it remotely over the networking using SSH. Which means you don't have to plug in a monitor or keyboard to manage your Pi.

First of all, we need to configure the network if you are using Wi-Fi. Click on the network icon on the top panel, and select the network from the list and provide it with the password.

![wireless][7] Swapnil Bhartiya

Congrats, you are connected wirelessly. Before we proceed with the next step, we need to find the IP address of the device so we can manage it remotely.

Open Terminal and run this command:

`ifconfig`

Now, note down the IP address of the device in the wlan0 section. It should be listed as "inet addr."

Now it's time to enable SSH and configure the system. Open the terminal on Pi and open raspi-config tool.

`sudo raspi-config`

The default user and password for Raspberry Pi is "pi" and "raspberry" respectively. You'll need the password for the above command. The first option of Raspi Config tool is to change the default password, and I heavily recommend changing the password, especially if you want to use it over the network.

The second option is to change the hostname, which can be useful if you have more than one Pi on the network. A hostname makes it easier to identify each device on the network.

Then go to Interfacing Options and enable Camera, SSH, and VNC. If you're using the device for an application that involves multimedia, such as a home theater system or PC, then you may also want to change the audio output option. By default the output is set to HDMI, but if you're using external speakers, you need to change the set-up. Go to the Advanced Option tab of Raspi Config tool, and go to Audio. There choose 3.5mm as the default out.

[Tip: Use arrow keys to navigate and then Enter key to choose. ]

Once all these changes are applied, the Pi will reboot. You can unplug the monitor and keyboard from your Pi as we will be managing it over the network. Now open Terminal on your local machine. If you're on Windows, you can use Putty or read my article to install Ubuntu Bash on Windows 10.

Then ssh into your system:

`ssh pi@IP_ADDRESS_OF_Pi`

In my case it was:

`ssh pi@10.0.0.161`

Provide it with the password and Eureka!, you are logged into your Pi and can now manage the device from a remote machine. If you want to manage your Raspberry Pi over the Internet, read my article on [enabling RealVNC on your machine][8].

In the next follow-up article, I will talk about using Raspberry Pi to manage your 3D printer remotely.

**This article is published as part of the IDG Contributor Network.[Want to Join?][9]**

--------------------------------------------------------------------------------

via: https://www.infoworld.com/article/3176488/linux/a-beginner-s-guide-to-raspberry-pi-3.html

作者：[Swapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.infoworld.com/author/Swapnil-Bhartiya/
[1]:https://www.raspberrypi.org/downloads/noobs/
[2]:http://idgenterprise.selz.com
[3]:https://images.techhive.com/images/article/2017/03/content-100711633-large.jpg
[4]:https://images.techhive.com/images/article/2017/03/format-100711635-large.jpg
[5]:http://www.cio.com/article/3176034/linux/how-to-format-an-sd-card-in-linux.html
[6]:https://images.techhive.com/images/article/2017/03/raspi-config-100711634-large.jpg
[7]:https://images.techhive.com/images/article/2017/03/wireless-100711636-large.jpeg
[8]:http://www.infoworld.com/article/3171682/internet-of-things/how-to-access-your-raspberry-pi-remotely-over-the-internet.html
[9]:https://www.infoworld.com/contributor-network/signup.html
