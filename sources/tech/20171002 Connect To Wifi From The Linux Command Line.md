translating by lujun9972
Connect To Wifi From The Linux Command Line
======

### Objective

Configure WiFi using only command line utilities.

### Distributions

This will work on any major Linux distribution.

### Requirements

A working Linux install with root privileges and a compatible wireless network adapter.

### Difficulty

Easy

### Conventions

  * **#** \- requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
  * **$** \- given command to be executed as a regular non-privileged user



### Introduction

Lots of people like graphical utilities for managing their computers, but plenty don't too. If you prefer command line utilities, managing WiFi can be a real pain. Well, it doesn't have to be.

wpa_supplicant can be used as a command line utility. You can actually set it up easily with a simple configuration file.

### Scan For Your Network

If you already know your network information, you can skip this step. If not, its a good way to figure out some info about the network you're connecting to.

wpa_supplicant comes with a tool called `wpa_cli` which provides a command line interface to manage your WiFi connections. You can actually use it to set up everything, but setting up a configuration file seems a bit easier.

Run `wpa_cli` with root privileges, then scan for networks.
```

# wpa_cli
> scan

```

The scan will take a couple of minutes, and show you the networks in your area. Notate the one you want to connect to. Type `quit` to exit.

### Generate a Block and Encrypt Your Password

There's an even more convenient utility that you can use to begin setting up your configuration file. It takes the name of your network and the password and creates a file with a configuration block for that network with the password encrypted, so it's not stored in plain text.
```

# wpa_passphrase networkname password > /etc/wpa_supplicant/wpa_supplicant.conf

```

### Tailor Your Configuration

Now, you have a configuration file located at `/etc/wpa_supplicant/wpa_supplicant.conf`. It's not much, just the network block with your network name and password, but you can build it out from there.

Your file up in your favorite editor, and start by deleting the commented out password line. Then, add the following line to the top of the configuration.
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel

```

It just lets users in the `wheel` group manage wpa_supplicant. It can be convenient.

Add the rest of this to the network block itself.

If you're connecting to a hidden network, you can add the following line to tell wpa_supplicant to scan it first.
```
scan_ssid=1

```

Next, set the protocol and key management settings. These settings correspond to WPA2.
```
proto=RSN
key_mgmt=WPA-PSK

```

The group and pairwise settings tell wpa_supplicant if you're using CCMP, TKIP, or both. For best security, you should only be using CCMP.
```
group=CCMP
pairwise=CCMP

```

Finally, set the priority of the network. Higher values will connect first.
```
priority=10

```


![Complete WPA_Supplicant Settings][1]
Save your configuration and restart wpa_supplicant for the changes to take effect.

### Closing Thoughts

Certainly, this method isn't the best for configuring wireless networks on-the-fly, but it works very well for the networks that you connect to on a regular basis.


--------------------------------------------------------------------------------

via: https://linuxconfig.org/connect-to-wifi-from-the-linux-command-line

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:https://linuxconfig.org/images/wpa-cli-config.jpg
