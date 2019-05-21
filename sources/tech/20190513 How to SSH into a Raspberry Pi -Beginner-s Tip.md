[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to SSH into a Raspberry Pi [Beginner’s Tip])
[#]: via: (https://itsfoss.com/ssh-into-raspberry/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

How to SSH into a Raspberry Pi [Beginner’s Tip]
======

_**In this Raspberry Pi article series, you’ll learn how to enable SSH in Raspberry Pi and then how to SSH into a Raspberry Pi device.**_

Out of all the things you can do with [Raspberry Pi][1], using it as a server in a home network is very popular. The tiny footprint and low power consumption makes it a perfect device to run light weight servers.

One of the things you should be able to do in such a case is run commands on your Raspberry Pi without needing to plug in a display, keyboard, mouse and having to move yourself to the location of your Raspberry Pi each time.

You achieve this by logging into your Raspberry Pi via SSH ([Secure Shell][2]) from any other computer, your laptop, desktop or even your phone. Let me show you how

### How to SSH into Raspberry Pi

![][3]

I assume that you are [running Raspbian on your Pi][4] and have successfully connected to a network via Ethernet or WiFi. It’s important that your Raspberry Pi is connected to a network otherwise you won’t be able to connect to it via SSH (sorry for stating the obvious).

#### Step 1: Enable SSH on Raspberry Pi

SSH is disabled by default in Raspberry Pi, hence you’ll have to enable it when you turn on the Pi after a fresh installation of Raspbian.

First go to the Raspberry Pi configuration window by navigating through the menu.

![Raspberry Pi Menu, Raspberry Pi Configuration][5]

Now, go to the interfaces tab, enable SSH and restart your Pi.

![Enable SSH on Raspberry Pi][6]

You can also enable SSH without via the terminal. Just enter the command _**sudo raspi-config**_ and then go to Advanced Options to enable SSH.

#### Step 2. Find the IP Address of Raspberry Pi

In most cases your Raspberry Pi will be assigned a local IP address which looks like **192.168.x.x** or **10.x.x.x**. You can [use various Linux commands to find the IP address][7].

[][8]

Suggested read This Linux Malware Targets Unsecure Raspberry Pi Devices

I am using the good old ifconfig command here but you can also use _**ip address**_.

```
ifconfig
```

![Raspberry Pi Network Configuration][9]

This command shows all the list of active network adapters and their configuration. The first entry( **eth0** ) shows IP address as **192.168.2.105** which is valid.I have used Ethernet to connect my Raspberry Pi to the network, hence it is under **eth0**. If you use WiFi check under the entry named ‘ **wlan0** ‘ .

You can also find out the IP address by other means like checking the network devices list on your router/modem.

#### Step 3. SSH into your Raspberry Pi

Now that you have enabled SSH and found out your IP address you can go ahead and SSH into your Raspberry Pi from any other computer. You’ll also need the username and the password for the Raspberry Pi.

Default Username and Password is:

  * username: pi
  * password: raspberry



If you have changed the default password then use the new password instead of the above. Ideally you must change the default password. In the past, a [malware infected thousands of Raspberry Pi devices that were using the default username and password][8].

Open a terminal (on Mac and Linux) on the computer from which you want to SSH into your Pi and type the command below. On Windows, you can use a SSH client like [Putty][10].

Here, use the IP address you found out in the previous step.

```
ssh [email protected]
```

_**Note: Make sure your Raspberry Pi and the computer you are using to SSH into your Raspberry Pi are connected to the same network**_.

![SSH through terminal][11]

You’ll see a warning the first time, type **yes** and press enter.

![Type the password \(default is ‘raspberry‘\)][12]

Now, type in the password and press enter.

![Successful Login via SSH][13]

On a successful login you’ll be presented with the terminal of your Raspberry Pi. Now you can any commands on your Raspberry Pi through this terminal remotely(within the current network) without having to access your Raspberry Pi physically.

[][14]

Suggested read Speed Up Ubuntu Unity On Low End Systems [Quick Tip]

Furthermore you can also set up SSH-Keys so that you don’t have to type in the password every time you log in via SSH, but that’s a different topic altogether.

I hope you were able to SSH into your Raspberry Pi after following this tutorial. Let me know how you plan to use your Raspberry Pi in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/ssh-into-raspberry/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://en.wikipedia.org/wiki/Secure_Shell
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/ssh-into-raspberry-pi.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/Raspberry-pi-configuration.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/enable-ssh-raspberry-pi.png?ssl=1
[7]: https://linuxhandbook.com/find-ip-address/
[8]: https://itsfoss.com/raspberry-pi-malware-threat/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/ifconfig-rapberry-pi.png?ssl=1
[10]: https://itsfoss.com/putty-linux/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/SSH-into-pi-warning.png?fit=800%2C199&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/SSH-into-pi-password.png?fit=800%2C202&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/SSH-into-Pi-successful-login.png?fit=800%2C306&ssl=1
[14]: https://itsfoss.com/speed-up-ubuntu-unity-on-low-end-system/
