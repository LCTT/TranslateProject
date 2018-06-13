# [Google launches TensorFlow-based vision recognition kit for RPi Zero W][26]


![](http://linuxgizmos.com/files/google_aiyvisionkit-thm.jpg)
Google’s $45 “AIY Vision Kit” for the Raspberry Pi Zero W performs TensorFlow-based vision recognition using a “VisionBonnet” board with a Movidius chip.

Google’s AIY Vision Kit for on-device neural network acceleration follows an earlier [AIY Projects][7] voice/AI kit for the Raspberry Pi that shipped to MagPi subscribers back in May. Like the voice kit and the older Google Cardboard VR viewer, the new AIY Vision Kit has a cardboard enclosure. The kit differs from the [Cloud Vision API][8], which was demo’d in 2015 with a Raspberry Pi based GoPiGo robot, in that it runs entirely on local processing power rather than requiring a cloud connection. The AIY Vision Kit is available now for pre-order at $45, with shipments due in early December.


 [![](http://linuxgizmos.com/files/google_aiyvisionkit-sm.jpg)][9]   [![](http://linuxgizmos.com/files/rpi_zerow-sm.jpg)][10] 
**AIY Vision Kit, fully assembled (left) and Raspberry Pi Zero W**
(click images to enlarge)


The kit’s key processing element, aside from the 1GHz ARM11-based Broadcom BCM2836 SoC found on the required [Raspberry Pi Zero W][21] SBC, is Google’s new VisionBonnet RPi accessory board. The VisionBonnet pHAT board uses a Movidius MA2450, a version of the [Movidius Myriad 2 VPU][22] processor. On the VisionBonnet, the processor runs Google’s open source [TensorFlow][23]machine intelligence library for neural networking. The chip enables visual perception processing at up to 30 frames per second.

The AIY Vision Kit requires a user-supplied RPi Zero W, a [Raspberry Pi Camera v2][11], and a 16GB micro SD card for downloading the Linux-based image. The kit includes the VisionBonnet, an RGB arcade-style button, a piezo speaker, a macro/wide lens kit, and the cardboard enclosure. You also get flex cables, standoffs, a tripod mounting nut, and connecting components.


 [![](http://linuxgizmos.com/files/google_aiyvisionkit_pieces-sm.jpg)][12]   [![](http://linuxgizmos.com/files/google_visionbonnet-sm.jpg)][13] 
**AIY Vision Kit kit components (left) and VisonBonnet accessory board**
(click images to enlarge)


Three neural network models are available. There’s a general-purpose model that can recognize 1,000 common objects, a facial detection model that can also score facial expression on a “joy scale” that ranges from “sad” to “laughing,” and a model that can identify whether the image contains a dog, cat, or human. The 1,000-image model derives from Google’s open source [MobileNets][24], a family of TensorFlow based computer vision models designed for the restricted resources of a mobile or embedded device.

MobileNet models offer low latency and low power consumption, and are parameterized to meet the resource constraints of different use cases. The models can be built for classification, detection, embeddings, and segmentation, says Google. Earlier this month, Google released a developer preview of a mobile-friendly [TensorFlow Lite][14] library for Android and iOS that is compatible with MobileNets and the Android Neural Networks API.


 [![](http://linuxgizmos.com/files/google_aiyvisionkit_assembly-sm.jpg)][15] 
**AIY Vision Kit assembly views**
(click image to enlarge)


In addition to providing the three models, the AIY Vision Kit provides basic TensorFlow code and a compiler, so users can develop their own models. In addition, Python developers can write new software to customize RGB button colors, piezo element sounds, and 4x GPIO pins on the VisionBonnet that can add additional lights, buttons, or servos. Potential models include recognizing food items, opening a dog door based on visual input, sending a text when your car leaves the driveway, or playing particular music based on facial recognition of a person entering the camera’s viewpoint.


 [![](http://linuxgizmos.com/files/movidius_myriad2vpu_block-sm.jpg)][16]   [![](http://linuxgizmos.com/files/movidius_myriad2_reference_board-sm.jpg)][17] 
**Myriad 2 VPU block diagram (left) and reference board**
(click image to enlarge)


The Movidius Myriad 2 processor provides TeraFLOPS of performance within a nominal 1 Watt power envelope. The chip appeared on early Project Tango reference platforms, and is built into the Ubuntu-driven [Fathom][25] neural processing USB stick that Movidius debuted in May 2016, prior to being acquired by Intel. According to Movidius, the Myriad 2 is available “in millions of devices on the market today.”

**Further information**

The AIY Vision Kit is available for pre-order from Micro Center at $44.99, with shipments due in early December. More information may be found in the AIY Vision Kit [announcement][18], [Google Blog notice][19], and [Micro Center shopping page][20].

--------------------------------------------------------------------------------

via: http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/

作者：[ Eric Brown][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[1]:http://twitter.com/share?url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/&text=Google%20launches%20TensorFlow-based%20vision%20recognition%20kit%20for%20RPi%20Zero%20W%20
[2]:https://plus.google.com/share?url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[3]:http://www.facebook.com/sharer.php?u=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[4]:http://www.linkedin.com/shareArticle?mini=true&url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[5]:http://reddit.com/submit?url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/&title=Google%20launches%20TensorFlow-based%20vision%20recognition%20kit%20for%20RPi%20Zero%20W
[6]:mailto:?subject=Google%20launches%20TensorFlow-based%20vision%20recognition%20kit%20for%20RPi%20Zero%20W&body=%20http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[7]:http://linuxgizmos.com/free-raspberry-pi-voice-kit-taps-google-assistant-sdk/
[8]:http://linuxgizmos.com/google-releases-cloud-vision-api-with-demo-for-pi-based-robot/
[9]:http://linuxgizmos.com/files/google_aiyvisionkit.jpg
[10]:http://linuxgizmos.com/files/rpi_zerow.jpg
[11]:http://linuxgizmos.com/raspberry-pi-cameras-jump-to-8mp-keep-25-dollar-price/
[12]:http://linuxgizmos.com/files/google_aiyvisionkit_pieces.jpg
[13]:http://linuxgizmos.com/files/google_visionbonnet.jpg
[14]:https://developers.googleblog.com/2017/11/announcing-tensorflow-lite.html
[15]:http://linuxgizmos.com/files/google_aiyvisionkit_assembly.jpg
[16]:http://linuxgizmos.com/files/movidius_myriad2vpu_block.jpg
[17]:http://linuxgizmos.com/files/movidius_myriad2_reference_board.jpg
[18]:https://blog.google/topics/machine-learning/introducing-aiy-vision-kit-make-devices-see/
[19]:https://developers.googleblog.com/2017/11/introducing-aiy-vision-kit-add-computer.html
[20]:http://www.microcenter.com/site/content/Google_AIY.aspx?ekw=aiy&rd=1
[21]:http://linuxgizmos.com/raspberry-pi-zero-w-adds-wifi-and-bluetooth-for-only-5-more/
[22]:https://www.movidius.com/solutions/vision-processing-unit
[23]:https://www.tensorflow.org/
[24]:https://research.googleblog.com/2017/06/mobilenets-open-source-models-for.html
[25]:http://linuxgizmos.com/usb-stick-brings-neural-computing-functions-to-devices/
[26]:http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
