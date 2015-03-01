Translating----geekpi

Linux FAQs with Answers--How to install a USB webcam in Raspberry Pi
================================================================================
> **Question**: Can I use a standard USB-based webcam on Raspberry Pi? How can I check if my USB webcam is compatible with Raspberry Pi, and how can I install it on Raspberry Pi? 

If you want to take pictures or record videos using Raspberry Pi board, you can install [Raspberry Pi camera board][1]. If you do not want to shell out money just for the camera board module, there is yet another way, which is to utilize a commonly found [USB web camera][2]. You may already have one for your PC.

In this tutorial, we show how to set up a USB web camera on Raspberry Pi board. We assume that you are using Raspbian operation system.

Before we start, it is better to check if your USB web camera is [one of those][3] which are known to be compatible with Raspberry Pi. If your USB webcam is not found in the compatibility list, don't be discouraged, as there is still a chance that your USB web camera may be detected by Raspberry Pi.

### Check if a USB Webcam is Compatible with Raspberry Pi ###

To check whether your USB web camera is detected on Raspberry Pi or not, plug it into the USB port of your Raspberry Pi, and type lsusb command in the terminal.

    $ lsusb 

If the output of the command does not list your webcam, there is a possibility that this is because your Raspberry Pi doesn't supply enough power needed for your USB web camera. In this case, you can try using a separate power line for the USB web camera, such as [USB power hub][4], and then repeat the lsusb command. If the USB webcam is still not recognized, we can only suggest you buy another USB web camera which is supported by Raspberry Pi.

![](https://farm8.staticflickr.com/7408/16576646025_898f17f36e_o.png)

In the above screenshot, the USB web camera is detected as "1e4e:0102", but it doesn't show the maker or the name of the web camera. When we try it with Fedora 20 in a laptop, it is successfully detected as "1e4e:0102 Cubeternet GL-UPC822 UVC WebCam." 

Another way to check if your USB web camera is supported by Raspberry Pi is by checking the /dev directory. If there is /dev/video0, this implies that your USB webcam is recognized by Raspberry Pi. 

### Take a Picture with USB Webcam ###

After your USB webcam is successfully hooked up with Raspberry Pi, the next thing to do is to take some pictures to verify its functionality.

For this, you can install fswebcam, which is a small webcam application. You can install fswebcam directly from the Raspbian repository as follows.

    $ sudo apt-get install fswebcam 

Once fswebcam is installed, run the following command in a terminal to capture a picture from the USB webcam:

    $ fswebcam --no-banner -r 640x480 image.jpg 

This command will capture a picture with 640x480 resolution, and save it as image.jpg. It will not put any banner in the bottom part of the picture.

![](https://farm8.staticflickr.com/7417/16576645965_302046d230_o.png)

Here is the result from the fswebcam command with 640x480 resolution.

![](https://farm8.staticflickr.com/7345/16575497512_8d77f1b34c_o.jpg)

The next example picture is captured without defining the resolution. The picture color is blueish, and the default resolution is only 358x288.

![](https://farm8.staticflickr.com/7390/15954067124_760fbcdd9c_o.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-usb-webcam-raspberry-pi.html

作者：[Kristophorus Hadiono][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/kristophorus
[1]:http://xmodulo.com/install-raspberry-pi-camera-board.html
[2]:http://xmodulo.com/go/usb_webcam
[3]:http://elinux.org/RPi_USB_Webcams
[4]:http://xmodulo.com/go/usb_powerhub
