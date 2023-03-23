[#]: subject: "Build a home thermostat with a Raspberry Pi"
[#]: via: "https://opensource.com/article/21/3/thermostat-raspberry-pi"
[#]: author: "Joe Truncale https://opensource.com/users/jtruncale"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build a home thermostat with a Raspberry Pi
======
The ThermOS project is an answer to the many downsides of off-the-shelf smart thermostats.

![Orange home vintage thermostat][1]

Image by: Photo by [Moja Msanii][2] on [Unsplash][3]

My wife and I moved into a new home in October 2020. As soon as it started getting cold, we realized some shortcomings of the home's older heating system (including one heating zone that was *always* on). We had Nest thermostats in our previous home, and the current setup was not nearly as convenient. There are multiple thermostats in our house, and some had programmed heating schedules, others had different schedules, some had none at all.

![Old thermostats][4]

The home's previous owner left notes explaining how some of the thermostats worked. (Joseph Truncale, CC BY-SA 4.0)

It was time for a change, but the house has some constraints:

* It was built in the late 1960s with a renovation during the '90s.
* The heat is hydronic (hot water baseboard).
* It has six thermostats for the six heating zones.
* There are only two wires that go to each thermostat for heat (red and white).

![Furnace valves][5]

### To buy or to build?

I wanted "smart" thermostat control for all of the heat zones (schedules, automations, home/away, etc.). I had several options if I wanted to buy something off the shelf, but all of them have drawbacks:

**Option 1: A Nest or Ecobee**

* It's expensive: No smart thermostat can handle multiple zones, so I would need one for each zone (~$200*6 = $1,200).
* It's difficult: I would have to rerun the thermostat wire to get the infamous [C wire][6], which enables continuous power to the thermostat. The wires are 20 to 100 feet each, in-wall, and might be stapled to the studs.

**Option 2: A battery-powered thermostat** such as the [Sensi WiFi thermostat][7]

* The batteries last only a month or two.
* It's not HomeKit-compatible in battery-only mode.

**Option 3: A commercial-off-the-shelf thermostat**, but only one exists (kind of): [Honeywell's TrueZONE][8]

* It's old and poorly supported (it was released in 2008).
* It's expensive—more than $300 for just the controller, and you need a [RedLINK gateway][9] for a shoddy app to work.

And the winner is…

**Option 4: Build my own!**

I decided to build my own multizone smart thermostat, which I named [ThermOS][10].

* It's centralized at the furnace (you need one device, not six).
* It uses the existing in-wall thermostat wires.
* It's HomeKit compatible, complete with automation, scheduling, home/away, etc.
* Anddddd it's… fun? Yeah, fun… I think.

### The ThermOS hardware

I knew that I wanted to use a Raspberry Pi. Since they've gotten so inexpensive, I decided to use a Raspberry Pi 4 Model B 2GB. I'm sure I could get by with a Raspberry Pi Zero W, but that will be for a future revision.

Here's a full list of the parts I used:

| Name | Quantity | Price | 
| :- | :- | :- |
| Raspberry Pi 4 Model B 2GB | 1 | $29.99 | 
| Raspberry Pi 4 official 15W power supply | 1 | $6.99 | 
| Inland 400 tie-point breadboard | 1 | $2.99 | 
| Inland 8 channel 5V relay module for Arduino | 1 | $8.99 | 
| Inland DuPont jumper wire 20cm (3 pack) | 1 | $4.99 | 
| DS18B20 temperature sensor (genuine) from Mouser.com | 6 | $6.00 | 
| 3-pin screw terminal blocks (40 pack) | 1 | $7.99 | 
| RPi GPIO terminal block breakout board module for Raspberry Pi | 1 | $17.99 | 
| Alligator clip test leads (10 pack) | 1 | $5.89 | 
| Southwire 18/2 thermostat wire (50ft) | 1 | $10.89 | 
| Shrinkwrap | 1 | $4.99 | 
| Solderable breadboard (5 pack) | 1 | $11.99 | 
| PCB mounting brackets (50 pack) | 1 | $7.99 | 
| Plastic housing/enclosure | 1 | $27.92 |

I began drawing out the hardware diagram on [draw.io][11] and realized I lacked some crucial knowledge about the furnace. I opened the side panel and found the step-down transformer that takes the 120V electrical line and makes it 24V for the heating system. If your heating system is anything like mine, you'll see a lot of jumper wires between the Taco zone valves. Terminal 3 on the Taco is jumped across all of my zone valves. This is because it doesn't matter how many valves are on/open—it just controls the circulator pump. If any combination of one to five valves is open, it should be on; if no valves are open, it should be off… simple!

![Furnace wiring architecture][12]

At its core, a thermostat is just a type of switch. Once the thermistor (temp sensor) inside the thermostat detects a lower temperature, the switch closes and completes the 24V circuit. Instead of having a thermostat in every room, this project keeps all of them right next to the furnace so that all six-zone valves can be controlled by a relay module using six of the eight relays. The Raspberry Pi acts as the brains of the thermostat and controls each relay independently.

![Manually setting relays using Raspberry Pi and Python][13]

The next problem was how to get temperature readings from each room. I could have a wireless temperature sensor in each room running on an Arduino or Raspberry Pi, but that can get expensive and complicated. Instead, I wanted to reuse the existing thermostat wire in the walls but purely for temperature sensors.

The "1-wire" [DS18B20][14] temperature sensor appeared to fit the bill:

* It has an accuracy of +/- 0.5°C or 0.9°F.
* It uses the "1-wire" protocol for data.
* Most importantly, the DS18B20 can use "[parasitic power][15]" mode where it needs just two wires for power and data. Just a heads up… almost all of the DS18B20s out there are [counterfeit][16]. I purchased a few (hoping they were genuine), but they wouldn't work when I tried to use parasitic power. I then bought real ones from [Mouser.com][17], and they worked like a charm!

![Temperature sensors][18]

Starting with a breadboard and all the components locally, I started writing code to interact with all of it. Once I proved out the concept, I added the existing in-wall thermostat wire into the mix. I got consistent readings with that setup, so I set out to make them a bit more polished. With help from my [dad][19], the self-proclaimed "just good enough" solderer, we soldered leads to the three-pin screw terminals (to avoid overheating the sensor) and then attached the sensor into the terminals. Now the sensors can be attached with wire nuts to the existing in-wall wiring.

![Attaching temperature sensors][20]

I'm still in the process of "prettifying" my temperature sensor wall mounts, but I've gone through a few 3D printing revisions, and I think I'm almost there.

![Wall mounts][21]

### The ThermOS software

As usual, writing the logic wasn't the hard part. However, deciding on the application architecture and framework was a confusing, multi-day process. I started out evaluating open source projects like [PiHome][22], but it relied on specific hardware *and* was written in PHP. I'm a Python fan and decided to start from scratch and write my own REST API.

Since HomeKit integration was so important, I figured I would eventually write a [HomeBridge][23] plugin to integrate it. I didn't realize that there was an entire Python HomeKit framework called [HAP-Python][24] that implements the accessory protocol. It helped me get a proof of concept running and controlled through my iPhone's Home app within 30 minutes.

![ThermOS HomeKit integration][25]

![ThermOS software architecture][26]

The rest of the "temp" logic is relatively straightforward, but I do want to highlight a piece that I initially missed. My code was running for a few days, and I was working on the hardware, when I noticed that my relays were turning on and off every few seconds. This "short-cycling" isn't necessarily harmful, but it certainly isn't efficient. To avoid that, I added some thresholding to make sure the heat toggles only when it's +/- 0.5C°.

Here is the threshold logic (you can see the [rubber-duck debugging][27] in the comments):

```
# check that we want heat
if self.target_state.value == 1:
    # if heat relay is already on, check if above threshold
    # if above, turn off .. if still below keep on
    if GPIO.input(self.relay_pin):
        if self.current_temp.value - self.target_temp.value >= 0.5:
            status = 'HEAT ON - TEMP IS ABOVE TOP THRESHOLD, TURNING OFF'
            GPIO.output(self.relay_pin, GPIO.LOW)
        else:
            status = 'HEAT ON - TEMP IS BELOW TOP THRESHOLD, KEEPING ON'
            GPIO.output(self.relay_pin, GPIO.HIGH)
    # if heat relay is not already on, check if below threshold
    elif not GPIO.input(self.relay_pin):
        if self.current_temp.value - self.target_temp.value <= -0.5:
            status = 'HEAT OFF - TEMP IS BELOW BOTTOM THRESHOLD, TURNING ON'
            GPIO.output(self.relay_pin, GPIO.HIGH)
        else:
          status = 'HEAT OFF - KEEPING OFF'
```

![Thresholding][28]

And I achieved my ultimate goal—to be able to control all of it from my phone.

![ThermOS as a HomeKit Hub][29]

### Putting my ThermOS in a lunchbox

My proof of concept was pretty messy.

![Initial ThermOS setup][30]

With the software and general hardware design in place, I started figuring out how to package all of the components in a more permanent and polished form. One of my main concerns for a permanent installation was to use a breadboard with DuPont jumper wires. I ordered some [solderable breadboards][31] and a [screw terminal breakout board][32] (thanks [@arduima][33] for the Raspberry Pi GPIO pins).

Here's what the solderable breadboard with mounts and enclosure looked like in progress.

![ThermOS hardware][34]

And here it is, mounted in the boiler room.

![ThermOS mounted][35]

Now I just need to organize and label the wires, and then I can start swapping the remainder of the thermostats over to ThermOS. And I'll be on to my next project: ThermOS for my central air conditioning.

Image by: (Joseph Truncale, CC BY-SA 4.0)

*This originally appeared on [Medium][36] and is republished with permission.*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/thermostat-raspberry-pi

作者：[Joe Truncale][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jtruncale
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/home-thermostat.jpg
[2]: https://unsplash.com/@mojamsanii?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/thermostat?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://opensource.com/sites/default/files/uploads/oldthermostats.jpeg
[5]: https://opensource.com/sites/default/files/uploads/furnacevalves.jpeg
[6]: https://smartthermostatguide.com/thermostat-c-wire-explained/
[7]: https://www.amazon.com/Emerson-Thermostat-Version-Energy-Certified/dp/B01NB1OB0I
[8]: https://www.honeywellhome.com/us/en/products/air/forced-air-zone-panels/truezone-hz432-panel-hz432-u/
[9]: https://www.amazon.com/Honeywell-Redlink-Enabled-Internet-THM6000R7001/dp/B0783HK9ZZ
[10]: https://github.com/truncj/thermos
[11]: http://draw.io/
[12]: https://opensource.com/sites/default/files/uploads/furnacewiring.png
[13]: https://opensource.com/sites/default/files/uploads/settingrelays.gif
[14]: https://datasheets.maximintegrated.com/en/ds/DS18B20.pdf
[15]: https://learn.openenergymonitor.org/electricity-monitoring/temperature/DS18B20-temperature-sensing
[16]: https://github.com/cpetrich/counterfeit_DS18B20
[17]: https://www.mouser.com/
[18]: https://opensource.com/sites/default/files/uploads/tempsensors.png
[19]: https://twitter.com/jofredrick
[20]: https://opensource.com/sites/default/files/uploads/attachingsensors.jpeg
[21]: https://opensource.com/sites/default/files/uploads/wallmount.jpeg
[22]: https://github.com/pihome-shc/pihome
[23]: https://github.com/homebridge/homebridge
[24]: https://github.com/ikalchev/HAP-python
[25]: https://opensource.com/sites/default/files/uploads/iphoneintegration.gif
[26]: https://opensource.com/sites/default/files/uploads/thermosarchitecture.png
[27]: https://en.wikipedia.org/wiki/Rubber_duck_debugging
[28]: https://opensource.com/sites/default/files/uploads/thresholding.png
[29]: https://opensource.com/sites/default/files/uploads/thermoshomekit.png
[30]: https://opensource.com/sites/default/files/uploads/unpackaged.jpeg
[31]: https://www.amazon.com/gp/product/B07ZV8FWM4/r
[32]: https://www.amazon.com/gp/product/B084C69VSQ/
[33]: https://twitter.com/dimitri_koshkin
[34]: https://opensource.com/sites/default/files/uploads/breadboard.png
[35]: https://opensource.com/sites/default/files/uploads/mounted.png
[36]: https://joetruncale.medium.com/thermos-d089e1c4974b
