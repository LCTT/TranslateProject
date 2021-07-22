[#]: subject: (Top Android Emulators to Run and Test Android Apps on Linux)
[#]: via: (https://itsfoss.com/android-emulators-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Top Android Emulators to Run and Test Android Apps on Linux
======

Android is built on top of a heavily customized Linux kernel. So, running mobile apps on Linux makes sense using an Android emulator.

While this is not something new that you can do on your Linux machine, it is a feature more in demand after Windows introduced the ability to run Android apps in 2021.

Not just limited to using apps, some of the Android emulators can also come in handy for development and testing.

Hence, I have compiled a list of the best emulators that you can use to test or run Android applications/games on Linux.

### 1\. Anbox

Anbox is a pretty popular emulator that lets Linux users run Android apps. Probably this is what Deepin Linux utilizes to make help run Android apps out of the box.

It isolates the Android operating system from the host using a container, which also lets them make the latest Android version available to use.

Android apps running will not have direct access to your hardware—which is a good security decision.

Unlike some of the other options here, Anbox does not technically need an emulation layer to make Android work. In other words, it is as close to a native Android experience on your Linux system.

For this reason, it may not be the easiest option available. You cannot just use the Google Play Store to install applications, you need to utilize Android Debug Bridge (ADB). All you need is the APK file of an app to install and use it.

[Anbox][1]

### 2\. Genymotion

![][2]

Genymotion is an impressive solution tailored for testing and development.

It is not a free and open-source option. They provide virtual Android experiences as a service through the cloud or a desktop client that is independent of Android Studio.

You can simulate a variety of hardware configurations and Android versions to create a virtual device for testing. It also gives you the ability to scale up and has multiple Android virtual devices running for extensive tests.

It can help you test how file uploading works in your app, impacts battery, performance, memory, and so on.

While it is a premium solution mostly for professionals, it does support the latest Linux distributions that include Ubuntu 20.04 LTS.

[Genymotion][3]

### 3\. Android-x86

![][4]

Android x86 is an open-source project to make Android run on a PC with 32-bit support.

You can choose to install it using a virtual machine manager on your Linux system or directly try it on your PC.

Official [installation instructions][5] are available if you need to go ahead.

Unlike some other options, it is a simple emulator that tries to work on a PC with no fancy features.

[Android x86][6]

### 4\. Android Studio (Virtual Devices)

![][7]

Android Studio is a full-fledged tool for development and testing. Fortunately, with the support for Linux, you can use it to emulate the Android experience for experiments if you need to.

You just need to create an Android Virtual Device (AVD) that you can configure and then simulate as an emulator.

There are good chances to find support for some of the latest smartphones, TVs, and smartwatches as well.

It needs a certain learning curve to be able to pull it off, but it is free and completely open-source.

[Android Studio][8]

### 5\. ARChon

![][9]

An interesting solution is an Android emulator that you can use in Linux and any other platform.

It helps run Android apps on Chrome OS or with Chrome browser on any operating system. Unlike some others, you may not get a complete Android experience but only the ability to run Android apps.

You just have to unpack the runtime and load it into Chrome extensions. Next, add the app you want to use by downloading the APK file onto it.

[ARChon][10]

### 6\. Bliss OS

![][11]

Bliss OS is yet another open-source project, similar to Android x86 that aims to make Android run on PC.

Unlike Android x86, it gives more compatibility options by supporting both 32-bit and 64-bit architectures. Also, you can download the compatible file as per your processor.

It is actively maintained and supports the latest Android versions available in the market.

[Bliss OS][12]

### Wrapping Up

While you will find several Android emulators available for Linux, they may not replace a full-fledged smartphone experience.

Every emulator comes with a set of features along with a specific purpose. Choose the one that you need!

Have you tried Android emulators yet? What’s your favorite emulator that you have used in Linux? Feel free to let me know in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/android-emulators-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://anbox.io
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/genymotion-android-emulator.png?resize=800%2C508&ssl=1
[3]: https://www.genymotion.com
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/android-x86-emulator.jpg?resize=1920%2C1080&ssl=1
[5]: https://www.android-x86.org/installhowto.html
[6]: https://www.android-x86.org
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/android-virtual-devices-studio.png?resize=800%2C296&ssl=1
[8]: https://developer.android.com/studio
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/arcrhon.jpg?resize=800%2C426&ssl=1
[10]: https://archon-runtime.github.io
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/bliss-os-android.png?resize=800%2C576&ssl=1
[12]: https://blissos.org
