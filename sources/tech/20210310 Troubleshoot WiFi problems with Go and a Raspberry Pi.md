[#]: subject: "Troubleshoot WiFi problems with Go and a Raspberry Pi"
[#]: via: "https://opensource.com/article/21/3/troubleshoot-wifi-go-raspberry-pi"
[#]: author: "Chris Collins https://opensource.com/users/clcollins"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Troubleshoot WiFi problems with Go and a Raspberry Pi
======
Build a WiFi scanner for fun.

![Selfcare, drinking tea on the porch][1]
(Image by: opensource.com)

Last summer, my wife and I sold everything we owned and moved with our two dogs to Hawaii. It's been everything we thought it would be: beautiful sun, warm sand, cool surf—you name it. We've also run into some things we didn't expect: WiFi problems.

Now, that's not a Hawaii problem. It's limited to the apartment we are renting. We are living in a single-room studio apartment attached to our landlord's apartment. Part of the rent includes free internet! YAY! However, said internet is provided by the WiFi router in the landlord's apartment. BOO!

In all honesty, it works OK. Ish. OK, it doesn't work well, and I'm not sure why. The router is literally on the other side of the wall, but our signal is spotty, and we have some trouble staying connected. Back home, our WiFi router's signal crossed through many walls and some floors. Certainly, it covered an area larger than the 600 sq. foot apartment we live in!

What does a good techie do in such a situation? Why, investigate, of course!

Luckily the "everything we own" that we sold before moving here did not include our Raspberry Pi Zero W. So small! So portable! Of course, I took it to Hawaii with me. My bright idea was to use the Pi and its built-in WiFi adapter, write a little program in Go to measure the WiFi signal received from the router, and display that output. I'm going to make it super simple, quick, and dirty and worry later about making it better. I just want to know what's up with the WiFi, dang it!

Hunting around on Google for a minute turns up a relatively useful Go package for working with WiFi, [mdlayher/wifi][2]. Sounds promising!

### Getting information about the WiFi interfaces

My plan is to query the WiFi interface statistics and return the signal strength, so I need to find the interfaces on the device. Luckily the mdlayher/wifi package has a method to query them, so I can do that by creating a file named `main.go`:

```
package main

import (
    "fmt"
    "github.com/mdlayher/wifi"
)

func main() {
    c, err := wifi.New()
    defer c.Close()

    if err != nil {
        panic(err)
    }

    interfaces, err := c.Interfaces()

    for _, x := range interfaces {
        fmt.Printf("%+v\n", x)
    }
}
```

So, what's going on here? After importing it, the mdlayher/wifi module `c`an be used in the main fun`c`tion to `c`reate a new Client (type `*Client`). The new `c`lient (named `c`) `c`an then get a list of the interfa`c`es on the system with `c`.Interfa`c`es(). Then it `c`an loop over the sli`c`e of Interfa`c`e pointers and print information about them.

By adding "+" to `%+v`, it prints the names of the fields in the `*Interface` struct, too, which helps me identify what I'm seeing without having to refer back to documentation.

Running the code above provides a list of the WiFi interfaces on my machine:

```
&{Index:0 Name: HardwareAddr:5c:5f:67:f3:0a:a7 PHY:0 Device:3 Type:P2P device Frequency:0}
&{Index:3 Name:wlp2s0 HardwareAddr:5c:5f:67:f3:0a:a7 PHY:0 Device:1 Type:station Frequency:2412}
```

More on Raspberry Pi

* What is Raspberry Pi?
* eBook: Guide to Raspberry Pi
* Getting started with Raspberry Pi cheat sheet
* eBook: Running Kubernetes on your Raspberry Pi
* Whitepaper: Data-intensive intelligent applications in a hybrid cloud blueprint
* Understanding edge computing
* Our latest on Raspberry Pi

Note that the MAC address, `HardwareAddr`, is the same for both lines, meaning this is the same physical hardware. This is confirmed by ``PHY`: 0`. The Go [wifi module's docs][3] note that `PHY` is the physical device to which the interface belongs.

The first interface has no name and is `TYPE:P2P`. The second, named `wpl2s0` is `TYPE:Station`. The wifi module documentation lists the [different types of interfaces][4] and describes what they are. According to the docs, the "P2P" type indicates "an interface is a device within a peer-to-peer client network." I believe, and please correct me in the comments if I'm wrong, that this interface is for [WiFi Direct][5], a standard for allowing two WiFi devices to connect without an intermediate access point.

The "Station" type indicates "an interface is part of a managed basic service set (BSS) of client devices with a controlling access point." This is the standard function for a wireless device that most people are used to—as a client connected to an access point. This is the interface that matters for testing the quality of the WiFi.

### Getting the Station information from the interface

Using this information, I can update the loop over the interfaces to retrieve the information I'm looking for:

```
for _, x := range interfaces {
    if x.Type == wifi.InterfaceTypeStation {
        // c.StationInfo(x) returns a slice of all
        // the staton information about the interface
        info, err := c.StationInfo(x)
        if err != nil {
            fmt.Printf("Station err: %s\n", err)
        }
        for _, x := range info {
            fmt.Printf("%+v\n", x)
        }
    }
}
```

First, it checks that `x.Type` (the Interface `type`) is `wifi.`InterfaceType`Station`—a Station interface (that's the only `type` that matters for this exercise). This is an unfortunate naming collision—the interface "`type`" is not a "`type`" in the Golang sense. In fact, what I'm working on here is a Go `type` named `InterfaceType` to represent the `type` of interface. Whew, that took me a minute to figure out!

So, assuming the interface is of the *correct* type, the station information can be retrieved with `c.StationInfo(`x`)` using the client `StationInfo()` method to get the info about the interface, `x`.

This returns a slice of `*StationInfo` pointers. I'm not sure quite why there's a slice. Perhaps the interface can have multiple StationInfo responses? In any case, I can loop over the slice and use the same `+%v` trick to print the keys and values for the StationInfo struct.

Running the above returns:

```
&{HardwareAddr:70:5a:9e:71:2e:d4 Connected:17m10s Inactive:1.579s ReceivedBytes:2458563 TransmittedBytes:1295562 ReceivedPackets:6355 TransmittedPackets:6135 ReceiveBitrate:2000000 TransmitBitrate:43300000 Signal:-79 TransmitRetries:2306 TransmitFailed:4 BeaconLoss:2}
```

The thing I'm interested in is the "Signal" and possibly "TransmitFailed" and "BeaconLoss." The signal is reported in units of dBm (or decibel-milliwatts).

#### A quick aside: How to read WiFi dBm

According to [MetaGeek][6]:

* –30 is the best possible signal strength—it's neither realistic nor necessary
* –67 is very good; it's for apps that need reliable packet delivery, like streaming media
* –70 is fair, the minimum reliable packet delivery, fine for email and web
* –80 is poor, absolute basic connectivity, unreliable packet delivery
* –90 is unusable, approaching the "noise floor"

*Note that dBm is logarithmic scale: -60 is 1,000x lower than -30*

### Making this a real "scanner"

So, looking at my signal from above: –79. YIKES, not good. But that single result is not especially helpful. That's just a point-in-time reference and only valid for the particular physical space where the WiFi network adapter was at that instant. What would be more useful would be a continuous reading, making it possible to see how the signal changes as the Raspberry Pi moves around. The main function can be tweaked again to accomplish this:

```
var i *wifi.Interface

for _, x := range interfaces {
    if x.Type == wifi.InterfaceTypeStation {
        // Loop through the interfaces, and assign the station
        // to var x
        // We could hardcode the station by name, or index,
        // or hardwareaddr, but this is more portable, if less efficient
        i = x
        break
    }
}

for {
    // c.StationInfo(x) returns a slice of all
    // the staton information about the interface
    info, err := c.StationInfo(i)
    if err != nil {
        fmt.Printf("Station err: %s\n", err)
    }

    for _, x := range info {
        fmt.Printf("Signal: %d\n", x.Signal)
    }

    time.Sleep(time.Second)
}
```

First, I name a variable `i` of type *wifi.Interface. Since it's outside the loop, I can use it to store the interface information. Any variable created inside the loop is inaccessible outside the scope of that loop.

Then, I can break the loop into two. The first loop ranges over the interfaces returned by `c.Interfaces()`, and if that interface is a Station type, it stores that in the i variable created earlier and breaks out of the loop.

The second loop is an infinite loop, so it'll just run over and over until I hit **Ctrl** + **C** to end the program. This loop takes that interface information and retrieves the station information, as before, and prints out the signal information. Then it sleeps for one second and runs again, printing the signal information over and over until I quit.

So, running that:

```
[chris@marvin wifi-monitor]$ go run main.go
Signal: -81
Signal: -81
Signal: -79
Signal: -81
```

Oof. Not good.

### Mapping the apartment

This information is good to know, at least. With an attached screen or E Ink display and a battery (or a looooong extension cable), I can walk the Pi around the apartment and map out where the dead spots are.

Spoiler alert: With the landlord's access point in the apartment next door, the big dead spot for me is a cone shape emanating from the refrigerator in the studio apartment's kitchen area… the refrigerator that shares a wall with the landlord's apartment!

I think in Dungeons and Dragons lingo, this is a "Cone of Silence." Or at least a "Cone of Poor Internet."

Anyway, this code can be compiled directly on the Raspberry Pi with `go build -o wifi_scanner`, and the resulting binary, `wifi_scanner`, can be shared with any other ARM devices (of the same version). Alternatively, it can be compiled on a regular system with the right libraries for ARM devices.

Happy Pi scanning! May your WiFi router not be behind your refrigerator! You can find the code used for this project in [my GitHub repo][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/troubleshoot-wifi-go-raspberry-pi

作者：[Chris Collins][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_selfcare_wfh_porch_520.png
[2]: https://github.com/mdlayher/wifi
[3]: https://godoc.org/github.com/mdlayher/wifi#Interface
[4]: https://godoc.org/github.com/mdlayher/wifi#InterfaceType
[5]: https://en.wikipedia.org/wiki/Wi-Fi_Direct
[6]: https://www.metageek.com/training/resources/wifi-signal-strength-basics.html
[7]: https://github.com/clcollins/goPiWiFi
