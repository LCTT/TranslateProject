>> Translating by ThomazL
How to install Raspberry Pi camera board
================================================================================
[The Raspberry Pi camera (Pi Cam) board][1] was first released for sale in May 2013. This first release is equipped with a 5 Megapixel sensor, and connects through a ribbon cable to the CSI connector on the Raspberry Pi. The second release of Raspberry Pi camera board, which is called [Pi NoIR][2], has the same sensor, but without the IR filter. It has capability to see near IR wavelengths (700 - 1000 nm) like a security camera, and of course it is sacrificing the color rendition. 

In this article, we will show you **how to install a Raspberry Pi camera board on [Raspberry Pi][3]**. We will be using the first release of Pi camera board. Once the board is installed, you will use three applications to access the board: raspistill, raspiyuv, and raspivid. The first two apps are used for capturing images, while the third app is for capturing video. The raspistill tool produces standard image files such as .jpg images, but raspiyuv gives us unprocessed raw image files from the camera.

### Installing the Raspberry Pi Camera Board ###

To connect the Raspberry Pi camera board to Raspberry Pi, follow these instructions:

1. Locate the CSI connector (the CSI connector is located near the Ethernet Port), and take off the brown tape.

2. Pull up the pinch of the CSI port.

3. Take your Pi Cam module, and remove the plastic protector from the lens. Make sure that the yellow part of the PCB which has sunny word is installed perfectly (just press gently that yellow part to make sure that it's installed perfectly).

4. Put in the ribbon cable into the CSI port. Remember, the ribbon cable which has blue tape should be facing towards the Ethernet port. Also, make sure that the ribbon is inserted properly, then pull down the pinch.

![](https://farm3.staticflickr.com/2938/14529915452_0910b2e13f_z.jpg)

Now your Pi Cam is ready to take a picture or a video.

### Enabling Camera on Raspbian ###

After installing the Pi Cam module, make sure to update your Raspberry Pi system to get the latest firmware. To do so:

    $ sudo apt-get update
    $ sudo apt-get upgrade 

To activate the Pi Cam module, run the Raspberry Pi configuration tool.

    $ sudo raspi-config 

Navigate to "Enable Camera" in the menu, and make it enabled. Reboot Raspberry Pi if you are done.

![](https://farm4.staticflickr.com/3837/14530918915_e68ca0beef_z.jpg)

![](https://farm3.staticflickr.com/2922/14344284230_6cabbe2522_z.jpg)

![](https://farm3.staticflickr.com/2923/14529915362_7a437a53cb_z.jpg)

Here is the final picture of Raspberry Pi with Pi Cam module attached.

![](https://farm3.staticflickr.com/2924/14551046653_1c37e077fd_z.jpg)

### Taking a Picture with Pi Camera ###

We are ready to use Pi Cam after rebooting Raspberry Pi. To take a picture with Pi Cam, run raspistill from the command line.

    $ raspistill -o keychain.jpg -t 2000 

This command will take a picture in 2000ms, and save it to keychain.jpg. The following is a picture of my small figurehead key chain, taken by Pi Cam.

![](https://farm4.staticflickr.com/3845/14530919095_ea0f37045a_z.jpg)

The raspiyuv tool works similarly, but the result is a unprocessed raw image from the camera.

### Taking a Video with Pi Camera ###

To take a video with Pi camera module, run raspivid tool from command line. The following command will take a video with default options which are 5 seconds length and 1920x1080 resolution with 17Mbps bitrate.

    $ raspivid -o mykeychain.h264

If you want to change the duration, just set the desired length (in milliseconds) with "-t" option.

    $ raspivid -o mykeychain.h264 -t 10000

To drop the resolution to 1280x720, use "-w" and "-h" options.. 

    $ raspivid -o mykeychain.h264 -t 10000 -w 1280 -h 720

The output of raspivid is a raw H.264 video stream, and doesn't have sound with it. To be able to play with a common video player, the raw H.264 video needs to be converted. Use MP4Box application that comes with gpac package.

To install gpac on Raspbian, use this command:

    $ sudo apt-get install -y gpac 

Then to convert the raw H.264 video stream into .mp4 format with 30 frames per second:

    $ MP4Box -fps 30 -add keychain.h264 keychain.mp4 

The video length is 10 seconds, and has default resolutions and bitrate. Here is an example video captured by Pi Camera.

注：youtube视频地址
<iframe width="615" height="376" frameborder="0" src="http://www.youtube.com/embed/3uyR2AVVwAU?version=3&amp;rel=1&amp;fs=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;wmode=transparent" type="text/html" class="youtube-player"></iframe>

To get the complete command-line options of raspistill, raspiyuv, and raspivid, run the commands without any option.


----------

#### [Kristophorus Hadiono][a] ####

I'm a Linux enthusiast. I use Linux for my daily computing, also when I teach my students. Becoming a good writer is one of my dreams.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/install-raspberry-pi-camera-board.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/go/picam
[2]:http://xmodulo.com/go/pinoir
[3]:http://xmodulo.com/go/raspberrypi
[a]:http://hadiono.org/blog
