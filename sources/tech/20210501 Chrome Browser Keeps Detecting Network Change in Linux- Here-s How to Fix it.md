[#]: subject: (Chrome Browser Keeps Detecting Network Change in Linux? Here’s How to Fix it)
[#]: via: (https://itsfoss.com/network-change-detected/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (HuengchI)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Chrome Browser Keeps Detecting Network Change in Linux? Here’s How to Fix it
======

For the past several days, I faced a strange issue in my system running Ubuntu Linux. I use Firefox and [Brave browsers][1]. Everything was normal in Firefox but Brave keeps on detecting a network change on almost every refresh.

![][2]

This went on to the extent that it became impossible to use the browser. I could not use [Feedly][3] to browse feeds from my favorite websites, every search result ends in multiple refresh, websites needed to be refreshed multiple times as well.

As an alternative, I tried [installing Chrome on Ubuntu][4]. The problem remained the same. I [installed Microsoft Edge on Linux][5] and yet, the problem persisted there as well. Basically, any Chromium-based browser keep encountering the ERR_NETWORK_CHANGED error.

Luckily, I found a way to fix the issue. I am going to share the steps with you so that it helps you if you are also facing the same problem.

### Fixing frequent network change detection issues in Chromium based browsers

The trick that worked for me was to disable IPv6 in the network settings. Now, I am not sure why this happens but I know that IPv6 is known to create network problems in many systems. If your system, router and other devices use IPv6 instead of the good old IPv4, you may encounter network connection issues like the one I encountered.

Thankfully, it is not that difficult to [disable IPv6 in Ubuntu][6]. There are several ways to do that and I am going to share the easiest method perhaps. This method uses GRUB to disable IPv6.

Attention Beginners!

If you are not too comfortable with the command line and terminal, please pay extra attention on the steps. Read the instructions carefully.

#### Step 1: Open GRUB config file for editing

Open the terminal. Now use the following command to edit the GRUB config file in Nano editor. You’ll have to enter your account’s password.

```
sudo nano /etc/default/grub
```

I hope you know a little bit about [using Nano editor][7]. Use the arrow keys to go to the line starting with GRUB_CMDLINE_LINUX. Make its value look like this:

```
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```

Be careful of the inverted commas and spaces. Don’t touch other lines.

![][8]

Save your changes by using the Ctrl+x keys. It will ask you to confirm the changes. Press Y or enter when asked.

#### Step 2: Update grub

You have made changes to the GRUB bootloader configuration. These changes won’t be taken into account until you update grub. Use the command below for that:

```
sudo update-grub
```

![][9]

Now when you restart your system, IPv6 will be disabled for your networks. You should not encounter the network interruption issue anymore.

You may think why I didn’t mention disabling IPv6 from the network settings. It’s because Ubuntu uses [Netplan][10] to manage network configuration these days and it seems that changes in Network Manager are not fully taken into account by Netplan. I tried it but despite IPv6 being disabled in the Network Manager, the problem didn’t go away until I used the command line method.

Even after so many years, IPv6 support has not matured and it keeps causing trouble. Disabling IPv6 sometimes [improve WiFi speed in Linux][11]. Weird, I know.

Anyway, I hope this trick helps you with the network change detection issue in your system as well.

--------------------------------------------------------------------------------

via: https://itsfoss.com/network-change-detected/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/brave-web-browser/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/network-change-detected.png?resize=800%2C418&ssl=1
[3]: https://feedly.com/
[4]: https://itsfoss.com/install-chrome-ubuntu/
[5]: https://itsfoss.com/microsoft-edge-linux/
[6]: https://itsfoss.com/disable-ipv6-ubuntu-linux/
[7]: https://itsfoss.com/nano-editor-guide/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/disabling-ipv6-via-grub.png?resize=800%2C453&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/updating-grub-ubuntu.png?resize=800%2C434&ssl=1
[10]: https://netplan.io/
[11]: https://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/
