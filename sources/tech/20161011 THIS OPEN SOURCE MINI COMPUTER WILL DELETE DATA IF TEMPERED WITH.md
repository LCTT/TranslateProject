THIS OPEN SOURCE MINI COMPUTER WILL DELETE DATA IF TEMPERED WITH
===========

[](https://twitter.com/share?original_referer=https%3A%2F%2Fitsfoss.com%2F&source=tweetbutton&text=This+Open+Source+Mini+Computer+Will+Delete+Data+If+Tempered+With&url=https%3A%2F%2Fitsfoss.com%2Forwl-physically-secure-computer%2F&via=%40itsfoss)[](https://www.linkedin.com/cws/share?url=https://itsfoss.com/orwl-physically-secure-computer/)[](http://pinterest.com/pin/create/button/?url=https://itsfoss.com/orwl-physically-secure-computer/&description=This+Open+Source+Mini+Computer+Will+Delete+Data+If+Tempered+With&media=https://itsfoss.com/wp-content/uploads/2016/10/ORWL-ultimate-physically-secured-computer.jpg)

[![ORWL Open source physically secure computer](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-ultimate-physically-secured-computer.jpg)](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-ultimate-physically-secured-computer.jpg)

In this era of information, the security is paramount. Nobody would possibly want their important data to fall into wrong hands. But even though unsecured hardware possesses no lesser threat, most of the time people take security measures only on the software end. ORWL is here to change that.

### [WHAT IS ORWL?](http://www.design-shift.com/orwl/)

Well, ORWL is the computer which claims to be “the most secure home computer ever built”, around the community. It is a small saucer shaped computer designed with complete physical security in mind. And physical security matters because it’s a truism among the information security professionals that once someone gains physical access to your machine, it’s game over.

![ORWL and the Secure Key Fob](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-fob.jpg)
>ORWL and the Secure Key Fob</figcaption

ORWL basic specs include Intel Skylake M3 processor, USB-C & micro HDMI ports, 8GB memory, 120GB Solid State Drive, Bluetooth, Wifi and NFC technology. Currently it supports Ubuntu 16.04, Qubes OS and Windows 10 out-of-the-box. All you need is a monitor, keyboard and mouse to get started.

### ORWL IS OPEN SOURCE

ORWL is totally open source. It means that the schematic and layout files, software, firmware, everything is up for grab if anyone wants to make one themselves or make improvements.

![ORWL Teardown](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-teardown.jpg)
>ORWL Teardown

### HOW DOES ORWL WORK?

ORWL uses a self encrypting SSD. A secure microcontroller integrated into its motherboard to generate and store the cryptographic encryption key. Once it verifies the integrity of the system and authenticated user, it uses the key to decrypt the SSD. In case of any type of tampering with ORWL the key is instantly erased rendering the SSD data useless.

For authentication purpose, ORWL has a key fob using the technology similar to smart-cards. It uses NFC technology to authenticate user, while using Bluetooth to check whether the user is within the range. The ORWL will be automatically locked if the user is not nearby.

![ORWL Block Diagram](https://itsfoss.com/wp-content/uploads/2016/10/ORWL-block-diagram.jpg)
>ORWL Block Diagram

The whole ORWL system is encased within an active clamshell mesh with pressure switches all over. The secure micro-controller constantly monitors a dedicated inertial measurement unit, the active mesh, the internal temperature and input power voltage for detecting tampering. This prevents access to the internal components as trying to breach the clamshell will trigger the secure microcontroller to erase the encryption key. Moreover, the DRAM is soldered with the shell for security reason.

That’s not all. There is much more detailed measurement to ensure complete physical security of the device, including protection from Cold Boot, DMA attacks etc.

More information can be found on the [ORWL landing page](https://www.orwl.org/). Here is a quick video about it’s working:

### IS ORWL THE ULTIMATE ANSWER TO INFORMATION SECURITY?

Sadly, no. Of course not. ORWL only provides physical security to the computer. And though that is robust and totally ninja, there are a lot of other vectors an attack on your system may come from. Nevertheless, it does provide a boost in the overall security.

[](https://itsfoss.com/maru-os-linux/)

What do you think about it? Let us know by commenting your thoughts.

--------------------------------------------------------------------------------

via: https://itsfoss.com/orwl-physically-secure-computer/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[ Munif Tanjim][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/munif/
