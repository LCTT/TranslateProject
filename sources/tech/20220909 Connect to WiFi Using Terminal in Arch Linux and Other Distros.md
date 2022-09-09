[#]: subject: "Connect to WiFi Using Terminal in Arch Linux and Other Distros"
[#]: via: "https://www.debugpoint.com/connect-wifi-terminal-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Connect to WiFi Using Terminal in Arch Linux and Other Distros
======
This quick guide explains the steps you need to set up and connect to WiFi using a terminal in Arch Linux and other distros.

This guide is ideal for those scenarios where you are stuck with a terminal without any GUI, and no other wired internet connectivity is available. These steps help you to manually detect the wireless card, and device and connect to the WiFi hotspot with password authentication via terminal.

This guide uses [iwd][1] (Net Wireless Daemon) to connect to WiFi via a terminal.

### Connect to WiFi Using Terminal in Arch Linux and Other Distros

#### 1. Setup iwd

The `iwd` package comes with three main modules:

**iwctl** : The wireless client**iwd**: The Daemon**iwmon** : Monitoring tool

On the terminal type –

```
iwctl
```

![iwctl Prompt][2]

If you get a command not found, then you need to download the package from [here][3].

So get help from any other system/laptop with an internet connection to download and install the package via mounting the USB.

Alternatively, if you have a USB dongle with the internet, then plugin that into your system. And install via the below commands.

The USB dongle should work out of the box in Arch and most Linux systems today to connect to the internet.

**Arch**

```
pacman -S iwd
```

**Debian, Ubuntu, and other similar distributions**

```
sudo apt-get install iwd
```

**Fedora**

```
sudo dnf install iwd
```

If you get an `iwctl` prompt (like below), then proceed to the next step.

#### 2. Configure

Run the below command to get your system’s **wireless device name**.

```
device list
```

![iwctl – device list][4]

To **get the list of WiFi networks**, run the below command. Replace `wlan0` with your device name on the below command and all the following commands.

```
station wlan0 get-networks
```

![iwctl – available networks][5]

The command gives you the list of available WiFi network with security type and signal strength.

#### Connect

To **connect to the WiFi networ**k, run the below command with the WiFi access point name from the above “get-networks” command.

```
station wlan0 connect
```

Enter your WiFi password when prompted.

![connect to WiFi using iwctl][6]

If all, goes well you should be connected to the internet.

### Usage Guides

* You can check the connection using a simple ping command as follows. The ping replies successful packet transfers for a stable connection.

```
ping -c 3 google.com
```

* You can also check the status of the connection using the below command.

```
station wlan0 show
```

* The iwd keeps the configuration file at `/var/lib/iwd` as a `.psk` file with your access point name.

* This file contains a hash file that is generated using the password and SSID of your WiFi network.

* Press `CTRL+D` to leave from the `iwctl` prompt.

### Wrapping Up

I hope this guide helps you to connect to the internet via the terminal. This helps when you have no other way to connect to WiFi. For example, if you are installing Arch Linux in a stand-alone system (not a VM), you need to connect to the internet to download packages via a terminal using `pacman`.

If you face any trouble, mention the error messages in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/connect-wifi-terminal-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://wiki.archlinux.org/index.php/Iwd
[2]: https://www.debugpoint.com/wp-content/uploads/2020/11/iwctl-Prompt.jpg
[3]: https://www.archlinux.org/packages/?name=iwd
[4]: https://www.debugpoint.com/wp-content/uploads/2020/11/iwctl-device-list-2.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2020/11/iwctl-available-networks.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2020/11/connect-to-WiFi-using-iwctl.jpg
