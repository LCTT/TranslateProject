[#]: subject: "Coolero: Open-Source App to Monitor and Control Cooling Devices"
[#]: via: "https://itsfoss.com/coolero/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Coolero: Open-Source App to Monitor and Control Cooling Devices
======

**Brief:** _Looking for a GUI program to manage your AIOs and other cooling devices on Linux? Let’s explore Coolero to get some help with it._

When it comes to Linux, we do not get official software support from brands like NZXT, Corsair, MSI, ASUS, etc., to manage hardware components on PC.

While open-source drivers/tools are available to make things work, it is still a work in progress in programs with a graphical user interface (GUI).

For instance, when [configuring a gaming mouse][1] or [setting up razer devices on Linux][1].

Fortunately, things have improved over the years, and now it is possible to manage/tweak a wide range of the latest peripherals and components on Linux.

One such improvement is the availability of an open-source GUI program to manage and monitor cooling devices, i.e., Coolero.

**Note:** The app is in active development and slowly working towards its first major release.

### Coolero: Manage Your Liquid Coolers Easily

![][2]

When I upgraded my PC last year, I was annoyed at the lack of software support for my AIO (All-in-One) liquid cooler (Corsair Hydro 100i Pro XT).

It is not just about controlling the RGB lighting (for aesthetics), but I could not find a convenient way (using a GUI program) to balance the fan profiles.

Now, with [Coolero][3], it is possible. Coolero is a front-end that uses libraries like [liquidctl][4] and a few others to control cooling devices, mostly AIOs, fan hub/controllers, along with PSUs and some RGB lighting support.

It supports a range of liquid coolers and some PSUs as well. You can get all the details of the supported device on its GitLab page. Note that the support for some coolers is still experimental, and you cannot make the LCD screen on your Kraken Z work with it yet.

Let me highlight the key features.

### Features of Coolero

![][5]

There are numerous cooling devices available out there. But, Coolero supports some popular options and its variants to control the essentials.

  * System overview graph
  * CPU temperature/load
  * GPU temperature/load
  * Supports multiple devices, and versions of the same device.
  * Ability to customize the fan profile using the graph.
  * Limited presets available for fan profiles.
  * Ability to tweak the RGB lighting profiles
  * Saves the profiles and applies it back at startup.



The user interface is simple to understand and easy to use. You can interact with the graph to enable/disable the monitoring of a specific component.

The AIOs or controllers you have connected should appear listed as separate components in the interface, making it easy to control them.

![][6]

You get two types of functionality, controlling the fans and the light (if any). I used the fan graph to customize the fan profile on my AIO.

As per my brief test, it worked well with the Corsair AIO. You can try NZXT coolers, PSUs, controllers, and smart devices (or hubs) with it.

### Install Coolero in Linux

Coolero is available as an AppImage, Flatpak (via [Flathub][7]), or you can build it from the source.

You may want to refer to our [AppImage guide][8] and [Flatpak help resource][9] if you are new to Linux.

To explore more about it, head to its GitLab page linked down below.

[Coolero][3]

### Wrapping Up

Coolero is an exciting project to keep an eye on if you have AIOs, Hubs, and controllers that need to be tweaked as per your requirements.

While you can try using some command-line tools, it is not the most convenient way to achieve the basic controls of the components in your PC.

_Have you tried it yet? What do you use to manage your AIOs or coolers on your Linux system? Let me know your thoughts in the comments down below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/coolero/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/set-up-razer-devices-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/coolero-ui-home.png?resize=800%2C468&ssl=1
[3]: https://gitlab.com/codifryed/coolero
[4]: https://github.com/liquidctl/liquidctl
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/coolero-fan-settings.png?resize=800%2C443&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/coolero-fan.png?resize=800%2C443&ssl=1
[7]: https://flathub.org/apps/details/org.coolero.Coolero
[8]: https://itsfoss.com/appimagepool/
[9]: https://itsfoss.com/flatpak-guide/
