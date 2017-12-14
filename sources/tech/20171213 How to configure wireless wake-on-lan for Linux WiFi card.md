translating by lujun9972
How to configure wireless wake-on-lan for Linux WiFi card
======
[![linux-configire-wake-on-wireless-lan-wowlan][1]][1]
Wake on Wireless (WoWLAN or WoW) is a feature to allow the Linux system to go into a low-power state while the wireless NIC remains active and stay connected to an AP. This quick tutorial shows how to enable WoWLAN or WoW (wireless wake-on-lan) mode with a wifi card installed in a Linux based laptop or desktop computer.

Please note that not all WiFi cards or Linux drivers support the WoWLAN feature.

## Syntax

You need to use the iw command to see or manipulate wireless devices and their configuration on a Linux based system. The syntax is:
```
iw command
iw [options] command
```

## List all wireless devices and their capabilities

Type the following command:
```
$ iw list
$ iw list | more
$ iw dev`
```
Sample outputs:
```
phy#0
	Interface wlp3s0
		ifindex 3
		wdev 0x1
		addr 6c:88:14:ff:36:d0
		type managed
		channel 149 (5745 MHz), width: 40 MHz, center1: 5755 MHz
		txpower 15.00 dBm

```

Please note down phy0.

## Find out the current status of your wowlan

Open the terminal app and type the following command to tind out wowlan status:
`$ iw phy0 wowlan show`
Sample outputs:
`WoWLAN is disabled`

## How to enable wowlan

The syntax is:
`sudo iw phy {phyname} wowlan enable {option}`
Where,

  1. {phyname} - Use iw dev to get phy name.
  2. {option} - Can be any, disconnect, magic-packet and so on.



For example, I am going to enable wowlan for phy0:
`$ sudo iw phy0 wowlan enable any`
OR
`$ sudo iw phy0 wowlan enable magic-packet disconnect`
Verify it:
`$ iw phy0 wowlan show`
Sample outputs:
```
WoWLAN is enabled:
 * wake up on disconnect
 * wake up on magic packet

```

## Test it

Put your laptop in suspend or sleep mode and send ping request or magic packet from your nas server:
`$ sudo sh -c 'echo mem > /sys/power/state'`
Send ping request from your nas server using the [ping command][3]
`$ ping your-laptop-ip`
OR [send magic packet using wakeonlan command][4] :
`$ wakeonlan laptop-mac-address-here
$ etherwake MAC-Address-Here`

## How do I disable WoWLAN?

The syntax is:
`$ sudo phy {phyname} wowlan disable
$ sudo phy0 wowlan disable`

For more info read the iw command man page:
`$ man iw
$ iw --help`


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/configure-wireless-wake-on-lan-for-linux-wifi-wowlan-card/

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/nixcraft
[1] https://www.cyberciti.biz/media/new/faq/2017/12/linux-configire-wake-on-wireless-lan-wowlan.jpg
[2] https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html
[3] //www.cyberciti.biz/faq/unix-ping-command-examples/ (See Linux/Unix ping command examples for more info)
[4] https://www.cyberciti.biz/faq/apple-os-x-wake-on-lancommand-line-utility/
