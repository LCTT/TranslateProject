translating---geekpi

How To Disable Built-in Webcam In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2015/08/webcam-2-720x340.jpg)

Today, we’ll see how to disable built-in webcam or external webcam when it’s not used, and how to enable it back when it’s required in your Linux box. Disabling web cam can help you in many ways. You can prevent from the malware taking control of your integrated webcam and spy on you and your home. We have read countless stories in the past that some hackers can spy on you using your webcam without your knowledge. By hacking your webcam, the user can share your private photos and videos online. There could be many reasons. If you’re ever wondered how to disable the web cam in your Laptop or desktop, you’re in luck. This brief tutorial will show you how. Read on.

I tested this guide on Arch Linux and Ubuntu. It worked exactly as described below. I hope this will work on other Linux distributions as well.

### Disable Built-in webcam in Linux

First, find the web cam driver using command:
```
$ sudo lsmod | grep uvcvideo

```

**Sample output:**
```
uvcvideo 114688 1
videobuf2_vmalloc 16384 1 uvcvideo
videobuf2_v4l2 28672 1 uvcvideo
videobuf2_common 53248 2 uvcvideo,videobuf2_v4l2
videodev 208896 4 uvcvideo,videobuf2_common,videobuf2_v4l2
media 45056 2 uvcvideo,videodev
usbcore 286720 9 uvcvideo,usbhid,usb_storage,ehci_hcd,ath3k,btusb,uas,ums_realtek,ehci_pci

```

Here, **uvcvideo** is my web cam driver.

Now, let us disable webcam.

To do so, edit the following file (if the file is not exists, just create it):
```
$ sudo nano /etc/modprobe.d/blacklist.conf

```

Add the following lines:
```
##Disable webcam.
blacklist uvcvideo

```

The line **“##Disable webcam”** is not necessary. I have added it for the sake of easy understanding.

Save and exit the file. Reboot your system to take effect the changes.

To verify, whether Webcam is really disabled or not, open any instant messenger applications or web cam software such as Cheese or Guvcview. You will see a blank screen like below.

**Cheese output:**

![][2]

**Guvcview output:**

![][3]

See? The web cam is disabled and is not working.

To enable it back, edit:
```
$ sudo nano /etc/modprobe.d/blacklist.conf

```

Comment the lines which you have added earlier.
```
##Disable webcam.
#blacklist uvcvideo

```

Save and close the file. Then, reboot your Computer to enable your Webcam.

Does it enough? No. Why? If someone can remotely access your system, they can easily enable the webcam back. So, It is always a good idea to cover it up with a tape or unplug the camera or disable it in the BIOS when it’s not used. This method is not just for disabling the built-in webcam, but also for external web camera.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-disable-built-in-webcam-in-ubuntu/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2015/08/cheese.jpg
[3]:http://www.ostechnix.com/wp-content/uploads/2015/08/guvcview.jpg
