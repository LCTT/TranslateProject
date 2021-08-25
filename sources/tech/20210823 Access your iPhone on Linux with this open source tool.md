[#]: subject: "Access your iPhone on Linux with this open source tool"
[#]: via: "https://opensource.com/article/21/8/libimobiledevice-iphone-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Access your iPhone on Linux with this open source tool
======
Communicate with iOS devices from Linux by using Libimobiledevice.
![A person looking at a phone][1]

The iPhone and iPad aren't by any means open source, but they're popular devices. Many people who own an iOS device also happen to use a lot of open source, including Linux. Users of Windows and macOS can communicate with an iOS device by using software provided by Apple, but Apple doesn't support Linux users. Open source programmers came to the rescue back in 2007 (just a year after the iPhone's release) with Libimobiledevice (then called libiphone), a cross-platform solution for communicating with iOS. It runs on Linux, Android, Arm systems such as the Raspberry Pi, Windows, and even macOS.

Libimobiledevice is written in C and uses native protocols to communicate with services running on iOS devices. It doesn't require any libraries from Apple, so it's fully free and open source.

Libimobiledevice is an object-oriented API, and there are a number of terminal utilities that come bundled with it for your convenience. The library supports Apple's earliest iOS devices all the way up to its latest models. This is the result of years of research and development. Applications in the project include **usbmuxd**, **ideviceinstaller**, **idevicerestore**, **ifuse**, **libusbmuxd**, **libplist**, **libirecovery**, and **libideviceactivation**.

### Install Libimobiledevice on Linux

On Linux, you may already have **libimobiledevice** installed by default. You can find out through your package manager or app store, or by running one of the commands included in the project:


```
`$ ifuse --help`
```

You can install **libimobiledevice** using your package manager. For instance, on Fedora or CentOS:


```
`$ sudo dnf install libimobiledevice ifuse usbmuxd`
```

On Debian and Ubuntu:


```
`$ sudo apt install usbmuxd libimobiledevice6 libimobiledevice-utils`
```

Alternatively, you can [download][2] and install **libimobiledevice** from source code.

### Connecting your device

Once you have the required packages installed, connect your iOS device to your computer.

Make a directory as a mount point for your iOS device.


```
`$ mkdir ~/iPhone`
```

Next, mount the device:


```
`$ ifuse ~/iPhone`
```

Your device prompts you to trust the computer you're using to access it.

![iphone prompts to trust the computer][3]

Figure 1: The iPhone prompts you to trust the computer.

Once the trust issue is resolved, you see new icons on your desktop.

![iphone icons appear on desktop][4]

Figure 2: New icons for the iPhone appear on the desktop.

Click on the **iPhone** icon to reveal the folder structure of your iPhone.

![iphone folder structure displayed][5]

Figure 3: The iPhone folder structure is displayed.

The folder I usually access most frequently is **DCIM**, where my iPhone photos are stored. Sometimes I use these photos in articles I write, and sometimes there are photos I want to enhance with open source applications like Gimp. Having direct access to the images instead of emailing them to myself is one of the benefits of using the Libimobiledevice utilities. I can copy any of these folders to my Linux computer. I can create folders on the iPhone and delete them too.

### Find out more

[Martin Szulecki][6] is the lead developer for the project. The project is looking for developers to add to their [community][7]. Libimobiledevice can change the way you use your peripherals, regardless of what platform you're on. It's another win for open source, which means it's a win for everyone.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/libimobiledevice-iphone-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://github.com/libimobiledevice/libimobiledevice/
[3]: https://opensource.com/sites/default/files/1trust_0.png
[4]: https://opensource.com/sites/default/files/2docks.png
[5]: https://opensource.com/sites/default/files/2iphoneicon.png
[6]: https://github.com/FunkyM
[7]: https://libimobiledevice.org/#community
