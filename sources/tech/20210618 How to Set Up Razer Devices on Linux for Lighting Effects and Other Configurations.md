[#]: subject: (How to Set Up Razer Devices on Linux for Lighting Effects and Other Configurations)
[#]: via: (https://itsfoss.com/set-up-razer-devices-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Set Up Razer Devices on Linux for Lighting Effects and Other Configurations
======

You have a shiny new Razer hardware, but you cannot find the Razer Synapse software for Linux. And you end up with no proper RGB sync and do not get to customize it. What do you do?

Well, for certain functionalities, like adding macros to your mouse, you will still need access to Razer Synapse (on Windows or macOS).

But, to tweak a few other options like macros for the keyboard, changing the DPI of your mouse, or lighting effects, you can easily set up your Razer peripherals on Linux.

![My Razer Basilisk V2 with lighting effect][1]

Here are sme pictures of both the mouse and the mouse pad. It’s the same setup but with different lighting schemes. Click on the images to see bigger images.

![][2]

![][3]

![][4]

Razer Basilisk is a good gaming mouse. If you want you can order it from Amazon or get it from your local store.

SaleBestseller No. 1

![Razer Basilisk v2 Wired Gaming Mouse: 20K DPI Optical Sensor, Fastest Gaming Mouse Switch, Chroma RGB Lighting, 11 Programmable Buttons, Classic Black][5]

![Razer Basilisk v2 Wired Gaming Mouse: 20K DPI Optical Sensor, Fastest Gaming Mouse Switch, Chroma RGB Lighting, 11 Programmable Buttons, Classic Black][5]

[Razer Basilisk v2 Wired Gaming Mouse: 20K DPI Optical Sensor, Fastest Gaming Mouse Switch, Chroma RGB Lighting, 11 Programmable Buttons, Classic Black][6]

$49.99 [][7]

If you already own a Razer device, let me show the steps to configure it just like what I did here.

### Step 1. Install OpenRazer

**OpenRazer** is an open-source driver to make Razer hardware work on Linux. It supports several functionalities to customize and control your devices, including RGB mousemats.

While this is not an official driver for Linux, it works quite well for a wide range of devices.

**It offers support for a variety of Linux distributions that include Solus, openSUSE, Fedora, Debian, Arch Linux, Ubuntu, and a few others.**

Here, I will be focusing on the steps to install it on any Ubuntu-based distro, you may want to refer to the [official instructions][8] for other distros.

You need to install OpenRazer [using a PPA][9] on Ubuntu, here’s how to do that:

```
sudo apt install software-properties-gtk
sudo add-apt-repository ppa:openrazer/stable
sudo apt update
sudo apt install openrazer-meta
```

It also offers a [daemon][10] as well, you can choose to make it work, you will be adding your user to the **plugdev** group — which gives privileged access to the device:

```
sudo gpasswd -a $USER plugdev
```

I did not need to configure/add a daemon using the above command, but I can still use the devices just fine. The daemon mostly ensures that the driver stays active.

[Download OpenRazer][11]

### Stpe 2. Install a GUI to Manage and Tweak Options

Now that the driver has been installed, all you need is a graphical user interface (GUI) to help you customize your Razer hardware.

You can find a few options available out there, but I will recommend installing [Polychromatic][12], which offers an attractive UI and works well as well.

![][13]

Polychromatic app is the closest I could recommend to Razer Synapse, and it works good.

For Ubuntu-based distros, all you need to do is install it using PPA:

```
sudo add-apt-repository ppa:polychromatic/stable
sudo apt update
sudo apt install polychromatic
```

You can find it listed in [AUR][14] for Arch Linux users. For more installation instructions, you can refer to the [official download page][15].

[Download Polychromatic][16]

While you will get distinct set of options for various devices. Here, I tried changing the DPI, customizing the color cycle, and the polling rate of my Razer Basilisk v2 mouse and it worked completely fine.

![Customization options for a mouse][17]

It also offers you the ability to easily restart or stop the [daemon][10], change the applet icon, and perform advanced configuration options if you know what you want to do.

Alternatively, you can try [RazerGenie][18], [Snake][19], or [OpenRGB][20] (meant for changing the colors) to tweak the mouse color or any other settings.

### Wrapping Up

Now that you can easily customize your Razer hardware, hope you have fun!

While you may find some other options to configure your Razer devices, I did not find any other options that work very well.

If you have come across something that works and that deserves a mention here for all the Razer users, let me know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/set-up-razer-devices-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/Razer-Basilisk-V2.jpg?resize=800%2C600&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-mouse-pad-lighting-effect-3-com.jpg?resize=800%2C600&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-mouse-pad-lighting-effect-2-com.jpg?resize=800%2C600&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-mouse-pad-lighting-effect-1-com.jpg?resize=800%2C600&ssl=1
[5]: https://i1.wp.com/m.media-amazon.com/images/I/31WrG8CTRHL._SL160_.jpg?ssl=1
[6]: https://www.amazon.com/dp/B082G5BDNC?tag=chmod7mediate-20&linkCode=osi&th=1&psc=1&keywords=Razer%20Basilisk%20V2 (Razer Basilisk v2 Wired Gaming Mouse: 20K DPI Optical Sensor, Fastest Gaming Mouse Switch, Chroma RGB Lighting, 11 Programmable Buttons, Classic Black)
[7]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[8]: https://openrazer.github.io/#download
[9]: https://itsfoss.com/ppa-guide/
[10]: https://itsfoss.com/linux-daemons/
[11]: https://openrazer.github.io/
[12]: https://polychromatic.app
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/polychromatic-app-1.png?resize=800%2C500&ssl=1
[14]: https://itsfoss.com/aur-arch-linux/
[15]: https://polychromatic.app/download/
[16]: https://polychromatic.app/
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/razer-basilisk-polychromatic.png?resize=800%2C505&ssl=1
[18]: https://github.com/z3ntu/RazerGenie
[19]: https://github.com/bithatch/snake
[20]: https://itsfoss.com/openrgb/
