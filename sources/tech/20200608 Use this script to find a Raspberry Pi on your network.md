[#]: collector: (lujun9972)
[#]: translator: ()
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this script to find a Raspberry Pi on your network)
[#]: via: (https://opensource.com/article/20/6/find-raspberry-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Use this script to find a Raspberry Pi on your network
======
Identify a specific Raspberry Pi in your cluster with a script that
triggers an LED to flash.
![Raspberries with pi symbol overlay][1]

We've all been there. "I'm going to get this [Raspberry Pi][2] to try out. They look kinda cool." And then, like tribbles on an Enterprise, suddenly you have [Kubernetes clusters][3] and [NFS servers][4] and [Tor proxies][5]. Maybe even a [hotel booking system][6]!

Pis cover the desk. They spill out onto the floor. Carrier boards for Raspberry Pi compute modules installed into lunchboxes litter the shelves.

…or maybe that's just me?

I'll bet if you have one Raspberry Pi, you've got _at least_ two others, though, and gosh darn it, they all look the same.

This was the situation I found myself in recently while testing a network filesystem (NFS) server I set up on one of my Raspberry Pis. I needed to plug in a USB hard drive, but … to which one? Ol' Lingonberry Pi was the chosen host, and I was SSH'd into her, but which actual, _physical_ RPi was she? There was no way of knowing…

Or was there?

![Raspberry Pis stacked up in cluster cases][7]

So, so many Raspberry Pis. Which one is Lingonberry? (Chris Collins, [CC BY-SA 4.0][8])

At a previous job, I sometimes worked on servers in our data centers, and some of them had a neat feature: an ID button on the front of the server that, when pressed, started an LED flashing on the front and back of the server. If I needed to deal with the other side of the server, I could press the ID button, then walk _allllll_ the way around to the other side of the rack, and easily find the right server.

I needed something like this to find Lingonberry.

There aren't any buttons on the Pis, but there are LEDs, and after a quick Google search, I learned that [one of them is _controllable_][9]. _Cue maniacal laughter._

There are three important bits to know. First, the LED path: on Raspberry Pis, at least those running Ubuntu 20.04, the front (and user-controllable) LED is found at `/sys/class/leds/led0`. If you navigate to it, you'll find it is a symlink to a directory that has a number of files in it. The two important files are `trigger` and `brightness`.

The `trigger` file controls what lights up the LED. If you `cat` that file, you will find a list:

```
none usb-gadget usb-host rc-feedback rfkill-any
rfkill-none kbd-scrolllock kbd-numlock kbd-capslock
kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock
kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock
kbd-ctrlrlock timer oneshot disk-activity disk-read
disk-write ide-disk mtd nand-disk heartbeat backlight
gpio cpu cpu0 cpu1 cpu2 cpu3 default-on input panic
mmc1 [mmc0] bluetooth-power rfkill0
unimac-mdio--19:01:link unimac-mdio--19:01:1Gbps
unimac-mdio--19:01:100Mbps unimac-mdio--19:01:10Mbps
```


    The item in brackets indicates what triggers the LED; in the example above, it's [mmc0]—the disk activity for when the SD card plugged into the Raspberry Pi. The trigger file isn't a normal file, though. Rather than editing it directly, you change the trigger by echoing one of the triggers into the file.


    To identify Lingonberry, I needed to temporarily disable the [mmc0] trigger, so I could make the LED work how I wanted it to work. In the script, I disabled all the triggers by echoing "none" into the trigger file:

    [code]

```
# You must be root to do this
$ echo none &gt;trigger

$ cat trigger
[none] usb-gadget usb-host rc-feedback rfkill-any rfkill-none kbd-scrolllock kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock kbd-altgrlock kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock kbd-ctrlllock kbd-ctrlrlock timer oneshot disk-activity disk-read disk-write ide-disk mtd nand-disk heartbeat backlight gpio cpu cpu0 cpu1 cpu2 cpu3 default-on input panic mmc1 mmc0 bluetooth-power rfkill0 unimac-mdio--19:01:link unimac-mdio--19:01:1Gbps unimac-mdio--19:01:100Mbps unimac-mdio--19:01:10Mbps
```

    
```
In the contents of the trigger file above, you can see [none] is now the selected trigger. Now the LED is off and not flashing.


Next up is the brightness file. You can control whether the LED is on (1) or off (0) by echoing either 0 or 1 into the file. Alternating 