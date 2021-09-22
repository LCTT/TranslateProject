[#]: subject: "How to Install Ubuntu Desktop on Raspberry Pi 4"
[#]: via: "https://itsfoss.com/install-ubuntu-desktop-raspberry-pi/"
[#]: author: "Avimanyu Bandyopadhyay https://itsfoss.com/author/avimanyu/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Ubuntu Desktop on Raspberry Pi 4
======

_**Brief: This thorough tutorial shows you how to install Ubuntu Desktop on Raspberry Pi 4 device.**_

The revolutionary Raspberry Pi is the most popular single board computer. It has its very own Debian based operating system called [Raspbian][1].

There are several other [operating systems available for Raspberry Pi][2] but almost all of them are lightweight. This was appropriate for the small factor and low end hardware of the Pi devices.

This changes with the introduction of Raspberry Pi 4B that flaunts 8 GB RAM and supports 4K display. The aim is to use Raspberry Pi as a regular desktop and it succeeds in doing so to a larger extent.

Before the 4B model, you could [install the Ubuntu server on Raspberry Pi][3] but the desktop version was not available. However, **Ubuntu now provides official desktop image for Pi 4 models**.

In this tutorial, I am going to show the steps for installing Ubuntu desktop on Raspberry Pi 4.

First, a quick look at the prerequisites.

### Prerequisites for running Ubuntu on Raspberry Pi 4

![][4]

Here’s what you need:

  1. A Linux or Windows system with active internet connection.
  2. [Raspberry Pi Imager][5] : The official open source tool from Raspberry that gets you the distro image on your SD card.
  3. Micro SD Card: Consider using at least a 16 GB storage for your card, albeit a 32 GB version is recommended.
  4. A USB based Micro SD Card Reader (if your computer does not have a card reader).
  5. Essential Raspberry Pi 4 accessories such as an HDMI compatible display, [Micro HDMI to Standard HDMI (A/M) Cable][6], [Power Supply (Official Adapter Recommended)][7], USB Wired/Wireless Keyboard and Mouse/Touchpad.



It is good practice to [read in detail about the Pi requirements][8] beforehand.

Now, without further delay, let me quickly walk you through the image preparation for the SD Card.

### Preparing the Ubuntu Desktop image for Raspberry Pi

Raspberry Pi provides a GUI application for writing the ISO image to the SD Card. **This tool can also download compatible operating systems like Ubuntu, Raspbian etc automatically**.

![Official tool to download and put operating system on SD card][9]

You can download this tool for Ubuntu, Windows and macOS from the official website:

[Download Raspberry Pi Imager][10]

On Ubuntu and other Linux distributions, you can also install it with Snap:

```
sudo snap install rpi-imager
```

Once installed, run the imager tool. When you see the screen below, select “CHOOSE OS”:

![Pi imager: choose the preferred operating system][11]

Under “Operating System”, select “Other general purpose OS”:

![Pi imager: other general purpose operating systems][12]

Now, select “Ubuntu”:

![Pi imager distro: Ubuntu][13]

Next, select “Ubuntu Desktop 21.04 (RPI 4/400)” as shown below:

![Pi imager distro version: Ubuntu 21.04][14]

Note

If you do not have a good, consistent internet collection, you can [download the Ubuntu for Raspberry Pi image separately from Ubuntu’s website][15]. In the Imager tool, while choosing the OS, go to the bottom and select “Use custom” option. You can also use Etcher for writing the image to the SD card.

Insert the micro SD card inside your Card reader and wait for it to mount. Select “CHOOSE STORAGE” under “Storage”:

![Pi imager – choose storage \(SD card\)][16]

You should be seeing only your micro SD card storage and you’d recognize it instantly based on the size. Here, I’ve used a 32 GB card:

![Pi imager – choose SD card][17]

Now click on “WRITE”:

![Pi imager image write][18]

I’ll assume you have the contents of the SD card backed up. If it’s a new card, you can just proceed:

![Pi imager image write confirmation query][19]

Since this is a [sudo][20] privilege, you must enter your password. If you run `sudo rpi-imager` from a terminal, this would not appear:

![Pi imager image write authentication asking for password][21]

If your SD card is a bit old, it would take some time. But if it is a recent one with high speeds, it wouldn’t take long:

![Pi imager writing image][22]

I also wouldn’t recommend skipping verification. Make sure the image write went successful:

![Pi imager verifying changes][23]

Once it is over, you will get the following confirmation:

![Pi imager write successful][24]

Now, safely-remove the SD card from your system.

### Using the micro SD card with Ubuntu on Raspberry Pi

Half of the battle is won. Unlike the regular Ubuntu install, you have not created a live environment. Ubuntu is already installed on the SD card and is almost read to use. Let’s see what remains here.

#### Step 1: Insert the SD card into Pi

For first time users, it can take a bit confusing sometimes to figure out where on earth is that card slot! Not to worry. It is located below the board on the left-hand side. Here’s an inverted view with a card inserted:

![Pi 4B board inverted and micro SD card inserted][25]

Keep sliding the card in this orientation slowly into the slot below the board, gently until it no longer goes any further. You may also hear a little clicking sound for confirmation. This means it has just fit in perfectly:

![Raspberry Pi SD slot left side middle and below the pi board][26]

You might notice two little pins adjusting themselves in the slot (shown above) as you put it inside, but that’s ok. Once inserted, the card would look like a bit protruded. That’s how it is supposed to look like:

![Pi SD card inserted with a little portion visible][27]

#### Step 2: Setting Up the Raspberry Pi

I do not need to go in detail here, I presume.

Ensure that the power cable connector, micro HDMI cable connector, keyboard and mouse connectors (wired/non-wired) are securely connected to the Pi board in the relevant ports.

Make sure the display and power plug are properly connected as well, before you go ahead and turn on the power socket. I wouldn’t recommend plugging in the adapter to a live electrical socket. Look up [electrical arcing][28].

Once you’ve ensured the above two steps, you can [power on the Raspberry Pi device][29].

#### Step 3: The first run of Ubuntu desktop on Raspberry Pi

Once you power on the Raspberry Pi, you’ll be asked to some basic configuration on your first run. You just have to follow the onscreen instructions.

Select your language, keyboard layout, connect to WiFi etc.

![Select language][30]

![Select keyboard layout][31]

![Select WiFi][32]

You’ll be asked to select the time zone:

![Select time zone][33]

And then create the user and password:

![Enter desired username and password][34]

It will configure a couple of things and may take some time in doing so.

![Finishing Ubuntu setup][35]

![Finishing Ubuntu setup][36]

It may take some time after this, your system will reboot and you’ll find yourself at the Ubuntu login screen:

![][37]

You can start enjoying Ubuntu desktop on Raspberry Pi now.

![Ubuntu desktop on Raspberry Pi][38]

### Conclusion

I noticed **a temporary anomaly**: A red flickering border on the left-hand side of my display while doing the installation. This flickering (also of different colors) was noticeable on random parts of the screen as well. But it went away after restarting and the first boot.

It was much needed that Ubuntu to start providing support for popular ARM devices like Raspberry Pi and I am happy to see it running on a Raspberry Pi.

I hope you find this tutorial helpful. If you have questions or suggestions, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-ubuntu-desktop-raspberry-pi/

作者：[Avimanyu Bandyopadhyay][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/avimanyu/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[2]: https://itsfoss.com/raspberry-pi-os/
[3]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-desktop-raspberry-pi.png?resize=800%2C450&ssl=1
[5]: https://github.com/raspberrypi/rpi-imager
[6]: https://www.raspberrypi.org/products/micro-hdmi-to-standard-hdmi-a-cable/
[7]: https://www.raspberrypi.org/products/type-c-power-supply/
[8]: https://itsfoss.com/things-you-need-to-get-your-raspberry-pi-working/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-imager-tool.webp?resize=680%2C448&ssl=1
[10]: https://www.raspberrypi.org/software/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-choose-os.webp?resize=681%2C443&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-other-general-purpose-os.webp?resize=679%2C440&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-os-ubuntu.webp?resize=677%2C440&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-os-ubuntu-21-04.webp?resize=677%2C440&ssl=1
[15]: https://ubuntu.com/download/raspberry-pi
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-choose-storage.webp?resize=677%2C438&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-choose-sd-card.webp?resize=790%2C450&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-image-write.webp?resize=676%2C437&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-image-write-confirm.webp?resize=679%2C440&ssl=1
[20]: https://itsfoss.com/add-sudo-user-ubuntu/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-image-write-password.webp?resize=380%2C227&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-writing-image.webp?resize=673%2C438&ssl=1
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-verifying-changes.webp?resize=677%2C440&ssl=1
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-imager-write-successful.webp?resize=675%2C442&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-inverted-micro-sd-card-inserted.webp?resize=800%2C572&ssl=1
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-sd-slot-left-side-middle-below-board.webp?resize=632%2C324&ssl=1
[27]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/pi-sd-card-inserted.webp?resize=650%2C432&ssl=1
[28]: https://www.electricianatlanta.net/what-is-electrical-arcing-and-why-is-it-dangerous/
[29]: https://itsfoss.com/turn-on-raspberry-pi/
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run.webp?resize=800%2C451&ssl=1
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-2.webp?resize=800%2C600&ssl=1
[32]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-3.webp?resize=800%2C600&ssl=1
[33]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-4.webp?resize=800%2C600&ssl=1
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-5.webp?resize=800%2C600&ssl=1
[35]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-6.webp?resize=800%2C600&ssl=1
[36]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-first-run-7.webp?resize=800%2C600&ssl=1
[37]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-raspberry-pi-login-screen.webp?resize=800%2C600&ssl=1
[38]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-21-04-post-setup-desktop.webp?resize=800%2C450&ssl=1
