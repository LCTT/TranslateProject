[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to build a WiFi picture frame with a Raspberry Pi)
[#]: via: (https://opensource.com/article/19/2/wifi-picture-frame-raspberry-pi)
[#]: author: (Manuel Dewald https://opensource.com/users/ntlx)

How to build a WiFi picture frame with a Raspberry Pi
======
DIY a digital photo frame that streams photos from the cloud.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_board_vector_red.png?itok=yaqYjYqI)

Digital picture frames are really nice because they let you enjoy your photos without having to print them out. Plus, adding and removing digital files is a lot easier than opening a traditional frame and swapping the picture inside when you want to display a new photo. Even so, it's still a bit of overhead to remove your SD card, USB stick, or other storage from a digital picture frame, plug it into your computer, and copy new pictures onto it.

An easier option is a digital picture frame that gets its pictures over WiFi, for example from a cloud service. Here's how to make one.

### Gather your materials

  * Old [TFT][1] LCD screen
  * HDMI-to-DVI cable (as the TFT screen supports DVI)
  * Raspberry Pi 3
  * Micro SD card
  * Raspberry Pi power supply
  * Keyboard
  * Mouse (optional)



Connect the Raspberry Pi to the display using the cable and attach the power supply.

### Install Raspbian

**sudo raspi-config**. There I change the hostname (e.g., to **picframe** ) in Network Options and enable SSH to work remotely on the Raspberry Pi in Interfacing Options. Connect to the Raspberry Pi using (for example) .

### Build and install the cloud client

Download and flash Raspbian to the Micro SD card by following these [directions][2] . Plug the Micro SD card into the Raspberry Pi, boot it up, and configure your WiFi. My first action after a new Raspbian installation is usually running. There I change the hostname (e.g., to) in Network Options and enable SSH to work remotely on the Raspberry Pi in Interfacing Options. Connect to the Raspberry Pi using (for example)

I use [Nextcloud][3] to synchronize my pictures, but you could use NFS, [Dropbox][4], or whatever else fits your needs to upload pictures to the frame.

If you use Nextcloud, get a client for Raspbian by following these [instructions][5]. This is handy for placing new pictures on your picture frame and will give you the client application you may be familiar with on a desktop PC. When connecting the client application to your Nextcloud server, make sure to select only the folder where you'll store the images you want to be displayed on the picture frame.

### Set up the slideshow

The easiest way I've found to set up the slideshow is with a [lightweight slideshow project][6] built for exactly this purpose. There are some alternatives, like configuring a screensaver, but this application appears to be the simplest to set up.

On your Raspberry Pi, download the binaries from the latest release, unpack them, and move them to an executable folder:

```
wget https://github.com/NautiluX/slide/releases/download/v0.9.0/slide_pi_stretch_0.9.0.tar.gz
tar xf slide_pi_stretch_0.9.0.tar.gz
mv slide_0.9.0/slide /usr/local/bin/
```

Install the dependencies:

```
sudo apt install libexif12 qt5-default
```

Run the slideshow by executing the command below (don't forget to modify the path to your images). If you access your Raspberry Pi via SSH, set the **DISPLAY** variable to start the slideshow on the display attached to the Raspberry Pi.

```
DISPLAY=:0.0 slide -p /home/pi/nextcloud/picframe
```

### Autostart the slideshow

To autostart the slideshow on Raspbian Stretch, create the following folder and add an **autostart** file to it:

```
mkdir -p /home/pi/.config/lxsession/LXDE/
vi /home/pi/.config/lxsession/LXDE/autostart
```

Insert the following commands to autostart your slideshow. The **slide** command can be adjusted to your needs:

```
@xset s noblank
@xset s off
@xset -dpms
@slide -p -t 60 -o 200 -p /home/pi/nextcloud/picframe
```

Disable screen blanking, which the Raspberry Pi normally does after 10 minutes, by editing the following file:

```
vi /etc/lightdm/lightdm.conf
```

and adding these two lines to the end:

```
[SeatDefaults]
xserver-command=X -s 0 -dpms
```

### Configure a power-on schedule

You can schedule your picture frame to turn on and off at specific times by using two simple cronjobs. For example, say you want it to turn on automatically at 7 am and turn off at 11 pm. Run **crontab -e** and insert the following two lines.

```
0 23 * * * /opt/vc/bin/tvservice -o

0 7 * * * /opt/vc/bin/tvservice -p && sudo systemctl restart display-manager
```

Note that this won't turn the Raspberry Pi power's on and off; it will just turn off HDMI, which will turn the screen off. The first line will power off HDMI at 11 pm. The second line will bring the display back up and restart the display manager at 7 am.

### Add a final touch

By following these simple steps, you can create your own WiFi picture frame. If you want to give it a nicer look, build a wooden frame for the display.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/wifi-picture-frame-raspberry-pi

作者：[Manuel Dewald][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ntlx
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Thin-film-transistor_liquid-crystal_display
[2]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[3]: https://nextcloud.com/
[4]: http://dropbox.com/
[5]: https://github.com/nextcloud/client_theming#building-on-debian
[6]: https://github.com/NautiluX/slide/releases/tag/v0.9.0
