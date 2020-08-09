[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I track my home's energy consumption with open source)
[#]: via: (https://opensource.com/article/20/5/energy-monitoring)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)

How I track my home's energy consumption with open source
======
These open source components help you find ways to save money and
conserve resources.
![lightbulb drawing outline][1]

An important step towards optimizing energy consumption is knowing your actual consumption. My house was built during the oil crisis in the 1970s, and due to the lack of a natural gas connection, the builders decided to use electricity to do all of the heating (water and home heating). This is not unusual for this area of Germany, and it remains an appropriate solution in countries that depend highly on nuclear power.

Electricity prices here are quite high (around € 0.28/kWh), so I decided to monitor my home's energy consumption to get a feel for areas where I could save some energy.

I used to work for a company that sold energy-monitoring systems for industrial customers. While this company mostly used proprietary software, you can set up a similar smart monitoring and logging solution for your home based on open source components. This article will show you how.

In Germany, the grid operator owns the electricity meter. The grid operator is obliged to provide an interface on its metering device to enable the customer to access the meter reading. Here is the metering device on my home:

![Actaris ACE3000 electricity meter][2]

Actaris ACE3000 Type 110 (dry contact located behind the marked cover)

Generally, almost every metering device has at least a [dry contact][3]—as my electricity meter does—that you can use to log metering. As you can see, my electricity meter has two counters: The upper one is for the day tariff (6am to 10pm), and the lower one is for the night tariff (10pm to 6am). The night tariff is a bit cheaper. Two-tariff meters are usually found only in houses with electric heating.

### Design

A reliable energy-monitoring solution for private use should meet the following requirements:

  * Logging of metering impulses (dry contact)
  * 24/7 operation
  * Energy-saving operation
  * Visualization of consumption data
  * Long-term recording of consumption data
  * Connectivity (e.g., Ethernet, USB, WiFi, etc.)
  * Affordability



I choose the Siemens SIMATIC IOT2020 as my hardware platform. This industrial-proven device is based on an Intel Quark x86 CPU, has programmable interrupts, and is compatible with many Arduino shields.

![Siemens SIMATIC IOT2020][4]

Siemens SIMATIC IOT2020

The Siemens device comes without an SD card and, therefore, without an operating system. Luckily, you can find a current Yocto-based Linux OS image and instructions on how to flash the SD card in the [Siemens forum][5].

In addition to the hardware platform, you also need some accessories. The following materials list shows the minimum components you need. Each item includes links to the parts I purchased, so you can get a sense of the project's costs.

#### Materials list

  * [Siemens SIMATIC IoT2020 unit][6]
  * [Siemens I/O Shield for SIMATIC IoT2000 series][7]
  * [microSD card][8] (2GB or more)
  * [CSL 300Mbit USB-WLAN adapter][9]
  * 24V power supply (I used a 2.1A [TDK-Lambda DRB50-24-1][10], which I already owned). You could use a less expensive power supply with less power: the SIMATIC IOT2020 has a maximum current of 1.4A, and the dry contact needs an additional 0.1A (24V / 220Ω).
  * 5 terminal blocks ([Weidmueller WDU 2.5mm][11])
  * 2 terminal cross-connecting bridges ([Weidmueller WQV][12])
  * [DIN rail][13] (~300 mm)
  * [220Ω / 3W resistor][14]
  * Wire



Here is the assembled result:

![Mounted and hooked up energy logger][15]

Energy logger mounted and hooked up

Unfortunately, I didn't have enough space at the rear wall of the cabinet; therefore, the DIN rail with the mounted parts lies on the ground.

The connections between the meter and the Siemens device look like this:

![Wiring between meter and energy logger][16]

### How it works

A dry contact is a current interface. When the electricity meter triggers, a current of 0.1A starts flowing between **s0+** and **s0-**. On **DI0**, the voltage rises to 24V and triggers an interrupt. When the electricity meter disconnects **s0+** and **s0-**, **DI0** is grounded over the resistor.

On my device, the contact closes 1,000 times per kWh (this value varies between metering devices).

To count these peaks reliably, I created [a C program][17] that registers an interrupt service routine on the DI0 input and counts upwards in memory. Once a minute, the values from memory are written to an [SQLite][18] database.

The overall meter reading is also written to a text file and can be preset with a starting value. This acts as a copy of the overall metering value of the meter in the cabinet.

![Energy logger architecture][19]

Energy logger architecture

The data is visualized using [Node-RED][20], and I can access overviews, like the daily consumption dashboard below, over a web-based GUI.

![Node-RED based GUI][21]

Daily overview in the Node-RED GUI

For the daily overview, I calculate the hourly costs based on the consumption data (the large bar chart). On the top-left of the dashboard you can see the actual power; below that is the daily consumption (energy and costs). The water heater for the shower causes the large peak in the bar chart.

### A reliable system

Aside from a lost timestamp during a power failure (the real-time clock in the Siemens device is not backed by a battery by default), everything has been working fine for more than one-and-a-half years.

If you can set up the whole Linux system completely from the command line, you'll get a reliable and flexible system with the ability to link interrupt service routines to the I/O level.

Because the I/O Shield runs on standard control voltage (24V), you can extend its functionality with the whole range of standardized industrial components (e.g., relays, sensors, actors, etc.). And, due to its open architecture, this system can be extended easily and applied to other applications, like for monitoring gas or water consumption or as a weather station, a simple controller for tasks, and more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/energy-monitoring

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Collaboration%20for%20health%20innovation.png?itok=s4O5EX2w (lightbulb drawing outline)
[2]: https://opensource.com/sites/default/files/uploads/openenergylogger_1_electricity_meter.jpg (Actaris ACE3000 electricity meter)
[3]: https://en.wikipedia.org/wiki/Dry_contact
[4]: https://opensource.com/sites/default/files/uploads/openenergylogger_2_siemens_device.jpg (Siemens SIMATIC IOT2020)
[5]: https://support.industry.siemens.com/tf/ww/en/posts/new-example-image-version-online/189090/?page=0&pageSize=10
[6]: https://de.rs-online.com/web/p/products/1244037
[7]: https://de.rs-online.com/web/p/products/1354133
[8]: https://de.rs-online.com/web/p/micro-sd-karten/7582584/
[9]: https://www.amazon.de/300Mbit-WLAN-Adapter-Hochleistungs-Antennen-Dual-Band/dp/B00LLIOT34
[10]: https://de.rs-online.com/web/p/products/8153133
[11]: https://de.rs-online.com/web/p/din-schienenklemmen-ohne-sicherung/0425190/
[12]: https://de.rs-online.com/web/p/din-schienenklemmen-zubehor/0202574/
[13]: https://de.rs-online.com/web/p/din-schienen/2835729/
[14]: https://de.rs-online.com/web/p/widerstande-durchsteckmontage/2142673/
[15]: https://opensource.com/sites/default/files/uploads/openenergylogger_3_assembled_device.jpg (Mounted and hooked up energy logger)
[16]: https://opensource.com/sites/default/files/uploads/openenergylogger_4_wiring.png (Wiring between meter and energy logger)
[17]: https://github.com/hANSIc99/OpenEnergyLogger
[18]: https://www.sqlite.org/index.html
[19]: https://opensource.com/sites/default/files/uploads/openenergylogger_5_architecure.png (Energy logger architecture)
[20]: https://nodered.org/
[21]: https://opensource.com/sites/default/files/uploads/openenergylogger_6_dashboard.png (Node-RED based GUI)
