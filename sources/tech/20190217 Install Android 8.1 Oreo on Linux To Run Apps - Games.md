[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install Android 8.1 Oreo on Linux To Run Apps & Games)
[#]: via: (https://fosspost.org/tutorials/install-android-8-1-oreo-on-linux)
[#]: author: (Python Programmer;Open Source Software Enthusiast. Worked On Developing A Lot Of Free Software. The Founder Of Foss Post;Foss Project. Computer Science Major. )

Install Android 8.1 Oreo on Linux To Run Apps & Games
======

![](https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/android-8.1-oreo-x86-on-linux.png?resize=1237%2C527&ssl=1)

[android x86][1] is a free and an open source project to port the android system made by Google from the ARM architecture to the x86 architecture, which allow users to run the android system on their desktop machines to enjoy all android functionalities + Apps & games.

The android x86 project finished porting the android 8.1 Oreo system to the x86 architecture few weeks ago. In this post, we’ll explain how to install it on your Linux system so that you can use your android apps and games any time you want.

### Installing Android x86 8.1 Oreo on Linux

#### Preparing the Environment

First, let’s download the android x86 8.1 Oreo system image. You can download it from [this page][2], just click on the “View” button under the android-x86_64-8.1-r1.iso file.

We are going to use QEMU to run android x86 on our Linux system. QEMU is a very good emulator software, which is also free and open source, and is available in all the major Linux distributions repositories.

To install QEMU on Ubuntu/Linux Mint/Debian:

```
sudo apt-get install qemu qemu-kvm libvirt-bin
```

To install QEMU on Fedora:

```
sudo dnf install qemu qemu-kvm
```

For other distributions, just search for the qemu and qemu-kvm packages and install them.

After you have installed QEMU, we’ll need to run the following command to create the android.img file, which will be like some sort of an allocated disk space just for the android system. All android files and system will be inside that image file:

```
qemu-img create -f qcow2 android.img 15G
```

Here we are saying that we want to allocate a maximum of 15GB for android, but you can change it to any size you want (make sure it’s at least bigger than 5GB).

Now, to start running the android system for the first time, run:

```
sudo qemu-system-x86_64 -m 2048 -boot d -enable-kvm -smp 3 -net nic -net user -hda android.img -cdrom /home/mhsabbagh/android-x86_64-8.1-r1.iso
```

Replace /home/mhsabbagh/android-x86_64-8.1-r1.iso with the path of the file that you downloaded from the android x86 website. For explaination of other options we are using here, you may refer to [this article][3].

After you run the above command, the android system will start:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 39 android 8.1 oreo on linux][4]

#### Installing the System

From this window, choose “Advanced options”, which should lead to the following menu, from which you should choose “Auto_installation” as follows:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 41 android 8.1 oreo on linux][5]

After that, the installer will just tell you about whether you want to continue or not, choose Yes:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 43 android 8.1 oreo on linux][6]

And the installation will carry on without any further instructions from you:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 45 android 8.1 oreo on linux][7]

Finally you’ll receive this message, which indicates that you have successfully installed android 8.1:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 47 android 8.1 oreo on linux][8]

For now, just close the QEMU window completely.

#### Booting and Using Android 8.1 Oreo

Now that the android system is fully installed in your android.img file, you should use the following QEMU command to start it instead of the previous one:

```
sudo qemu-system-x86_64 -m 2048 -boot d -enable-kvm -smp 3 -net nic -net user -hda android.img
```

Notice that all we did was that we just removed the -cdrom option and its argument. This is to tell QEMU that we no longer want to boot from the ISO file that we downloaded, but from the installed android system.

You should see the android booting menu now:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 49 android 8.1 oreo on linux][9]

Then you’ll be taken to the first preparation wizard, choose your language and continue:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 51 android 8.1 oreo on linux][10]

From here, choose the “Set up as new” option:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 53 android 8.1 oreo on linux][11]

Then android will ask you about if you want to login to your current Google account. This step is optional, but important so that you can use the Play Store later:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 55 android 8.1 oreo on linux][12]

Then you’ll need to accept the terms and conditions:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 57 android 8.1 oreo on linux][13]

Now you can choose your current timezone:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 59 android 8.1 oreo on linux][14]

The system will ask you now if you want to enable any data collection features. If I were you, I’d simply turn them all off like that:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 61 android 8.1 oreo on linux][15]

Finally, you’ll have 2 launcher types to choose from, I recommend that you choose the Launcher3 option and make it the default:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 63 android 8.1 oreo on linux][16]

Then you’ll see your fully-working android system home screen:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 65 android 8.1 oreo on linux][17]

From here now, you can do all the tasks you want; You can use the built-in android apps, or you may browse the settings of your system to adjust it however you like. You may change look and feeling of your system, or you can run Chrome for example:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 67 android 8.1 oreo on linux][18]

You may start installing some apps like WhatsApp and others from the Google Play store for your own use:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 69 android 8.1 oreo on linux][19]

You can now do whatever you want with your system. Congratulations!

### How to Easily Run Android 8.1 Oreo Later

We don’t want to always have to open the terminal window and write that long QEMU command to run the android system, but we want to run it in just 1 click whenever we need that.

To do this, we’ll create a new file under /usr/share/applications called android.desktop with the following command:

```
sudo nano /usr/share/applications/android.desktop
```

And paste the following contents inside it (Right click and then paste):

```
[Desktop Entry]
Name=Android 8.1
Comment=Run Android 8.1 Oreo on Linux using QEMU
Icon=phone
Exec=bash -c 'pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY qemu-system-x86_64 -m 2048 -boot d -enable-kvm -smp 3 -net nic -net user -hda /home/mhsabbagh/android.img'
Terminal=false
Type=Application
StartupNotify=true
Categories=GTK;
```

Again, you have to replace /home/mhsabbagh/android.img with the path to the local image on your system. Then save the file (Ctrl + X, then press Y, then Enter).

Notice that we needed to use “pkexec” to run QEMU with root privileges because starting from newer versions, accessing to the KVM technology via libvirt is not allowed for normal users; That’s why it will ask you for the root password each time.

Now, you’ll see the android icon in the applications menu all the time, you can simply click it any time you want to use android and the QEMU program will start:

![Install Android 8.1 Oreo on Linux To Run Apps & Games 71 android 8.1 oreo on linux][20]

### Conclusion

We showed you how install and run android 8.1 Oreo on your Linux system. From now on, it should be much easier on you to do your android-based tasks without some other software like Blutsticks and similar methods. Here, you have a fully-working and functional android system that you can manipulate however you like, and if anything goes wrong, you can simply nuke the image file and run the installation all over again any time you want.

Have you tried android x86 before? How was your experience with it?


--------------------------------------------------------------------------------

via: https://fosspost.org/tutorials/install-android-8-1-oreo-on-linux

作者：[Python Programmer;Open Source Software Enthusiast. Worked On Developing A Lot Of Free Software. The Founder Of Foss Post;Foss Project. Computer Science Major.][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: http://www.android-x86.org/
[2]: http://www.android-x86.org/download
[3]: https://fosspost.org/tutorials/use-qemu-test-operating-systems-distributions
[4]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-16.png?resize=694%2C548&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 40 android 8.1 oreo on linux)
[5]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-15.png?resize=673%2C537&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 42 android 8.1 oreo on linux)
[6]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-14.png?resize=769%2C469&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 44 android 8.1 oreo on linux)
[7]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-13.png?resize=767%2C466&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 46 android 8.1 oreo on linux)
[8]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-12.png?resize=750%2C460&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 48 android 8.1 oreo on linux)
[9]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-11.png?resize=754%2C456&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 50 android 8.1 oreo on linux)
[10]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-10.png?resize=850%2C559&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 52 android 8.1 oreo on linux)
[11]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-09.png?resize=850%2C569&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 54 android 8.1 oreo on linux)
[12]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-08.png?resize=850%2C562&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 56 android 8.1 oreo on linux)
[13]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-07-1.png?resize=850%2C561&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 58 android 8.1 oreo on linux)
[14]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-06.png?resize=850%2C569&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 60 android 8.1 oreo on linux)
[15]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-05.png?resize=850%2C559&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 62 android 8.1 oreo on linux)
[16]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-04.png?resize=850%2C553&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 64 android 8.1 oreo on linux)
[17]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-03.png?resize=850%2C571&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 66 android 8.1 oreo on linux)
[18]: https://i1.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-02.png?resize=850%2C555&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 68 android 8.1 oreo on linux)
[19]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/Android-8.1-Oreo-on-Linux-01.png?resize=850%2C557&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 70 android 8.1 oreo on linux)
[20]: https://i0.wp.com/fosspost.org/wp-content/uploads/2019/02/Screenshot-at-2019-02-17-1539.png?resize=850%2C557&ssl=1 (Install Android 8.1 Oreo on Linux To Run Apps & Games 72 android 8.1 oreo on linux)
