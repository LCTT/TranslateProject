[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Ubuntu Server on a Raspberry Pi)
[#]: via: (https://itsfoss.com/install-ubuntu-server-raspberry-pi/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Install Ubuntu Server on a Raspberry Pi
======

The [Raspberry Pi][1] is the best-known [single-board computer][2]. Initially, the scope of the Raspberry Pi project was targeted to the promotion of teaching of basic computer science in schools and in developing countries.

Its low cost, portability and very low power consumption, made the models far more popular than anticipated. From weather station to home automation, tinkerers built so many [cool projects using Raspberry Pi][3].

The [4th generation of the Raspberry Pi][4], is equipped with features and processing power of a regular desktop computer. But this article is not about using RPi as desktop. Instead, I’ll show you how to install Ubuntu server on Raspberry Pi.

In this tutorial I will use a Raspberry Pi 4 and I will cover the following:

  * Installing Ubuntu Server on a microSD card
  * Setting up a wireless network connection on the Raspberry Pi
  * Accessing your Raspberry Pi via SSH



![][5]

**You’ll need the following things for this tutorial**:

  * A micro SD card (8 GB or greater recommended)
  * A computer (running Linux, Windows or macOS) with a micro SD card reader
  * A Raspberry Pi 2, 3 or 4
  * Good internet connection
  * An HDMI cable for the Pi 2 &amp; 3 and a micro HDMI cable for the Pi 4 (optional)
  * A USB keyboard set (optional)



### Installing Ubuntu Server on a Raspberry Pi

![][6]

I have used Ubuntu for creating Raspberry Pi SD card in this tutorial but you may follow it on other Linux distributions, macOS and Windows as well. This is because the steps for preparing the SD card is the same with Raspberry Pi Imager tool.

The Raspberry Pi Imager tool downloads the image of your [choice of Raspberry Pi OS][7] automatically. This means that you need a good internet connection for downloading data around 1 GB.

#### Step 1: Prepare the SD Card with Raspberry Pi Imager

Make sure you have inserted the microSD card into your computer, and install the Raspberry Pi Imager at your computer.

You can download the Imager tool for your operating system from these links:

  * [Raspberry Pi Imager for Ubuntu/Debian][8]
  * [Raspberry Pi Imager for Windows][9]
  * [Raspberry Pi Imager for MacOS][10]



Despite I use Ubuntu, I won’t use the Debian package that is listed above, but I will install the snap package using the command line. This method can be applied to wider range of Linux distributions.

```
sudo snap install rpi-imager
```

Once you have installed Raspberry Pi Imager tool, find and open it and click on the “CHOOSE OS” menu.

![][11]

Scroll across the menu and click on “Ubuntu” (Core and Server Images).

![][12]

From the available images, I choose the Ubuntu 20.04 LTS 64 bit. If you have a Raspberry Pi 2, you are limited to the 32bit image.

**Important Note: If you use the latest Raspberry Pi 4 – 8 GB RAM model, you should choose the 64bit OS, otherwise you will be able to use 4 GB RAM only.**

![][13]

Select your microSD card from the “SD Card” menu, and click on “WRITE”after.

![][14]

If it shows some error, try writing it again. It will now download the Ubuntu server image and write it to the micro SD card.

It will notify you when the process is completed.

![][15]

#### Step 2: Add WiFi support to Ubuntu server

Once the micro SD card flashing is done, you are almost ready to use it. There is one thng that you may want to do before using it and that is to add Wi-Fi support.

With the SD card still inserted in the card reader, open the file manager and locate the “system-boot” partition on the card.

The file that you are looking for and need to edit is named `network-config`.

![][16]

This process can be done on Windows and MacOS too. Edit the **`network-config`** file as already mentioned to add your Wi-Fi credentials.

Firstly, uncomment (remove the hashtag “#” at the beginning) from lines that are included in the rectangular box.

After that, replace myhomewifi with your Wi-Fi network name enclosed in quotation marks, such as “itsfoss” and the “S3kr1t” with the Wi-Fi password enclosed in quotation marks, such as “12345679”.

![][17]

It may look like this:

```
wifis:
  wlan0:
    dhcp4: true
    optional: true
    access-points:
      "your wifi name":
      password: "your_wifi_password"
```

Save the file and insert the micro SD card into your Raspberry Pi. During the first boot, if your Raspberry Pi fails connect to the Wi-Fi network, simply reboot your device.

#### Step 3: Use Ubuntu server on Raspberry Pi (if you have dedicated monitor, keyboard and mouse for Raspberry Pi)

If you have got an additional set of mouse, keyboard and a monitor for the Raspberry Pi, you can use easily use it like any other computer (but without GUI).

Simply insert the micro SD card to the Raspberry Pi, plug in the monitor, keyboard and mouse. Now [turn on your Raspberry Pi][18]. It will present TTY login screen (black terminal screen) and aks for username and password.

  * Default username: ubuntu
  * Default password: ubuntu



When prompted, use “**ubuntu**” for the password. Right after a successful login, [Ubuntu will ask you to change the default password][19].

Enjoy your Ubuntu Server!

#### Step 3: Connect remotely to your Raspberry Pi via SSH (if you don’t have monitor, keyboard and mouse for Raspberry Pi)

It is okay if you don’t have a dedicated monitor to be used with Raspberry Pi. Who needs a monitor with a server when you can just SSH into it and use it the way you want?

**On Ubuntu and Mac OS**, an SSH client is usually already installed. To connect remotely to your Raspberry Pi, you need to discover its IP address. Check the [devices connected to your network][20] and see which one is the Raspberry Pi.

Since I don’t have access to a Windows machine, you can access a comprehensive guide provided by [Microsoft][21].

Open a terminal and run the following command:

```
ssh [email protected]_pi_ip_address
```

You will be asked to confirm the connection with the message:

```
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Type “yes” and click the enter key.

![][22]

When prompted, use “ubuntu” for the password as mentioned earlier. You’ll be asked to change the password of course.

Once done, you will be automatically logged out and you have to reconnect, using your new password.

Your Ubuntu server is up and running on a Raspberry Pi!

**Conclusion**

Installing Ubuntu Server on a Raspberry Pi is an easy process and it comes pre-configured at a great degree which the use a pleasant experience.

I have to say that among all the [operating systems that I tried on my Raspberry Pi][7], Ubuntu Server was the easiest to install. I am not exaggerating. Check my guide on [installing Arch Linux on Raspberry Pi][23] for reference.

I hope this guide helped you in installing Ubuntu server on your Raspberry Pi as well. If you have questions or suggestions, please let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-ubuntu-server-raspberry-pi/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://itsfoss.com/raspberry-pi-alternatives/
[3]: https://itsfoss.com/raspberry-pi-projects/
[4]: https://itsfoss.com/raspberry-pi-4/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/Ubuntu-Server-20.04.1-LTS-aarch64.png?resize=800%2C600&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-raspberry-pi.png?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/raspberry-pi-os/
[8]: https://downloads.raspberrypi.org/imager/imager_amd64.deb
[9]: https://downloads.raspberrypi.org/imager/imager.exe
[10]: https://downloads.raspberrypi.org/imager/imager.dmg
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager.png?resize=800%2C600&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager-choose-ubuntu.png?resize=800%2C600&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager-ubuntu-server.png?resize=800%2C600&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/raspberry-pi-imager-sd-card.png?resize=800%2C600&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-installed-raspberry-pi.png?resize=799%2C506&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-pi-network-config.png?resize=800%2C565&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/Ubuntu-server-wifi.png?resize=800%2C600&ssl=1
[18]: https://itsfoss.com/turn-on-raspberry-pi/
[19]: https://itsfoss.com/change-password-ubuntu/
[20]: https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
[21]: https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/ubuntu-server-change-password.png?resize=800%2C600&ssl=1
[23]: https://itsfoss.com/install-arch-raspberry-pi/
