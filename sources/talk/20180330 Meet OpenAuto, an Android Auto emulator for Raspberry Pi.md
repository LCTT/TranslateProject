Meet OpenAuto, an Android Auto emulator for Raspberry Pi
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb_computer_person_general_.png?itok=BRGJXU7e)

In 2015, Google introduced [Android Auto][1], a system that allows users to project certain apps from their Android smartphones onto a car's infotainment display. Android Auto's driver-friendly interface, with larger touchscreen buttons and voice commands, aims to make it easier and safer for drivers to control navigation, music, podcasts, radio, phone calls, and more while keeping their eyes on the road. Android Auto can also run as an app on an Android smartphone, enabling owners of older-model vehicles without modern head unit displays to take advantage of these features.

While there are many [apps][2] available for Android Auto, developers are working to add to its catalog. A new, open source tool named [OpenAuto][3] is hoping to make that easier by giving developers a way to emulate Android Auto on a Raspberry Pi. With OpenAuto, developers can test their applications in conditions similar to how they'll work on an actual car head unit.

OpenAuto's creator, Michal Szwaj, answered some questions about his project for Opensource.com. Some responses have been edited for conciseness and clarity.

### What is OpenAuto?

In a nutshell, OpenAuto is an emulator for the Android Auto head unit. It emulates the head unit software and allows you to use Android Auto on your PC or on any other embedded platform like Raspberry Pi 3.

Head unit software is a frontend for the Android Auto projection. All magic related to the Android Auto, like navigation, Google Voice Assistant, or music playback, is done on the Android device. Projection of Android Auto on the head unit is accomplished using the [H.264][4] codec for video and [PCM][5] codec for audio streaming. This is what the head unit software mostly does—it decodes the H.264 video stream and PCM audio streams and plays them back together. Another function of the head unit is providing user inputs. OpenAuto supports both touch events and hard keys.

### What platforms does OpenAuto run on?

My target platform for deployment of the OpenAuto is Raspberry Pi 3 computer. For successful deployment, I needed to implement support of video hardware acceleration using the Raspberry Pi 3 GPU (VideoCore 4). Thanks to this, Android Auto projection on the Raspberry Pi 3 computer can be handled even using 1080p@60 fps resolution. I used [OpenMAX IL][6] and IL client libraries delivered together with the Raspberry Pi firmware to implement video hardware acceleration.

Taking advantage of the fact that the Raspberry Pi operating system is Raspbian based on Debian Linux, OpenAuto can be also built for any other Linux-based platform that provides support for hardware video decoding. Most of the Linux-based platforms provide support for hardware video decoding directly in GStreamer. Thanks to highly portable libraries like Boost and [Qt][7], OpenAuto can be built and run on the Windows platform. Support of MacOS is being implemented by the community and should be available soon.

![][https://www.youtube.com/embed/k9tKRqIkQs8?origin=https://opensource.com&enablejsapi=1]

### What software libraries does the project use?

The core of the OpenAuto is the [aasdk][8] library, which provides support for all Android Auto features. aasdk library is built on top of the Boost, libusb, and OpenSSL libraries. [libusb][9] implements communication between the head unit and an Android device (via USB bus). [Boost][10] provides support for the asynchronous mechanisms for communication. It is required for high efficiency and scalability of the head unit software. [OpenSSL][11] is used for encrypting communication.

The aasdk library is designed to be fully reusable for any purposes related to implementation of the head unit software. You can use it to build your own head unit software for your desired platform.

Another very important library used in OpenAuto is Qt. It provides support for OpenAuto's multimedia, user input, and graphical interface. And the build system OpenAuto is using is [CMake][12].

Note: The Android Auto protocol is taken from another great Android Auto head unit project called [HeadUnit][13]. The people working on this project did an amazing job in reverse engineering the AndroidAuto protocol and creating the protocol buffers that structurize all messages.

### What equipment do you need to run OpenAuto on Raspberry Pi?

In addition to a Raspberry Pi 3 computer and an Android device, you need:

  * **USB sound card:** The Raspberry Pi 3 doesn't have a microphone input, which is required to use Google Voice Assistant
  * **Video output device:** You can use either a touchscreen or any other video output device connected to HDMI or composite output (RCA)
  * **Input device:** For example, a touchscreen or a USB keyboard



### What else do you need to get started?

In order to use OpenAuto, you must build it first. On the OpenAuto's wiki page you can find [detailed instructions][14] for how to build it for the Raspberry Pi 3 platform. On other Linux-based platforms, the build process will look very similar.

On the wiki page you can also find other useful instructions, such as how to configure the Bluetooth Hands-Free Profile (HFP) and Advanced Audio Distribution Profile (A2DP) and PulseAudio.

### What else should we know about OpenAuto?

OpenAuto allows anyone to create a head unit based on the Raspberry Pi 3 hardware. Nevertheless, you should always be careful about safety and keep in mind that OpenAuto is just an emulator. It was not certified by any authority and was not tested in a driving environment, so using it in a car is not recommended.

OpenAuto is licensed under GPLv3. For more information, visit the [project's GitHub page][3], where you can find its source code and other information.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/openauto-emulator-Raspberry-Pi

作者：[Michal Szwaj][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/michalszwaj
[1]:https://www.android.com/auto/faq/
[2]:https://play.google.com/store/apps/collection/promotion_3001303_android_auto_all
[3]:https://github.com/f1xpl/openauto
[4]:https://en.wikipedia.org/wiki/H.264/MPEG-4_AVC
[5]:https://en.wikipedia.org/wiki/Pulse-code_modulation
[6]:https://www.khronos.org/openmaxil
[7]:https://www.qt.io/
[8]:https://github.com/f1xpl/aasdk
[9]:http://libusb.info/
[10]:http://www.boost.org/
[11]:https://www.openssl.org/
[12]:https://cmake.org/
[13]:https://github.com/gartnera/headunit
[14]:https://github.com/f1xpl/
