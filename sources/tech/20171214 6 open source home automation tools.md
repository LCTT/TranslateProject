6 open source home automation tools
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_openlightbulbs.png?itok=nrv9hgnH)

The [Internet of Things][13] isn't just a buzzword, it's a reality that's expanded rapidly since we last published a review article on home automation tools in 2016\. In 2017, [26.5% of U.S. households][14] already had some type of smart home technology in use; within five years that percentage is expected to double.

With an ever-expanding number of devices available to help you automate, protect, and monitor your home, it has never been easier nor more tempting to try your hand at home automation. Whether you're looking to control your HVAC system remotely, integrate a home theater, protect your home from theft, fire, or other threats, reduce your energy usage, or just control a few lights, there are countless devices available at your disposal.

But at the same time, many users worry about the security and privacy implications of bringing new devices into their homes—a very real and [serious consideration][15]. They want to control who has access to the vital systems that control their appliances and record every moment of their everyday lives. And understandably so: In an era when even your refrigerator may now be a smart device, don't you want to know if your fridge is phoning home? Wouldn't you want some basic assurance that, even if you give a device permission to communicate externally, it is only accessible to those who are explicitly authorized?

[Security concerns][16] are among the many reasons why open source will be critical to our future with connected devices. Being able to fully understand the programs that control your home means you can view, and if necessary modify, the source code running on the devices themselves.

While connected devices often contain proprietary components, a good first step in bringing open source into your home automation system is to ensure that the device that ties your devices together—and presents you with an interface to them (the "hub")—is open source. Fortunately, there are many choices out there, with options to run on everything from your always-on personal computer to a Raspberry Pi.

Here are just a few of our favorites.

### Calaos

[Calaos][17] is designed as a full-stack home automation platform, including a server application, touchscreen interface, web application, native mobile applications for iOS and Android, and a preconfigured Linux operating system to run underneath. The Calaos project emerged from a French company, so its support forums are primarily in French, although most of the instructional material and documentation have been translated into English.

Calaos is licensed under version 3 of the [GPL][18] and you can view its source on [GitHub][19].

### Domoticz

[Domoticz][20] is a home automation system with a pretty wide library of supported devices, ranging from weather stations to smoke detectors to remote controls, and a large number of additional third-party [integrations][21] are documented on the project's website. It is designed with an HTML5 frontend, making it accessible from desktop browsers and most modern smartphones, and is lightweight, running on many low-power devices like the Raspberry Pi.

Domoticz is written primarily in C/C++ under the [GPLv3][22], and its [source code][23] can be browsed on GitHub.

### Home Assistant

[Home Assistant][24] is an open source home automation platform designed to be easily deployed on almost any machine that can run Python 3, from a Raspberry Pi to a network-attached storage (NAS) device, and it even ships with a Docker container to make deploying on other systems a breeze. It integrates with a large number of open source as well as commercial offerings, allowing you to link, for example, IFTTT, weather information, or your Amazon Echo device, to control hardware from locks to lights.

Home Assistant is released under an [MIT license][25], and its source can be downloaded from [GitHub][26].

### MisterHouse

[MisterHouse][27] has gained a lot of ground since 2016, when we mentioned it as "another option to consider" on this list. It uses Perl scripts to monitor anything that can be queried by a computer or control anything capable of being remote controlled. It responds to voice commands, time of day, weather, location, and other events to turn on the lights, wake you up, record your favorite TV show, announce phone callers, warn that your front door is open, report how long your son has been online, tell you if your daughter's car is speeding, and much more. It runs on Linux, macOS, and Windows computers and can read/write from a wide variety of devices including security systems, weather stations, caller ID, routers, vehicle location systems, and more

MisterHouse is licensed under the [GPLv2][28] and you can view its source code on [GitHub][29].

### OpenHAB

[OpenHAB][30] (short for Open Home Automation Bus) is one of the best-known home automation tools among open source enthusiasts, with a large user community and quite a number of supported devices and integrations. Written in Java, openHAB is portable across most major operating systems and even runs nicely on the Raspberry Pi. Supporting hundreds of devices, openHAB is designed to be device-agnostic while making it easier for developers to add their own devices or plugins to the system. OpenHAB also ships iOS and Android apps for device control, as well as design tools so you can create your own UI for your home system.

You can find openHAB's [source code][31] on GitHub licensed under the [Eclipse Public License][32].

### OpenMotics

[OpenMotics][33] is a home automation system with both hardware and software under open source licenses. It's designed to provide a comprehensive system for controlling devices, rather than stitching together many devices from different providers. Unlike many of the other systems designed primarily for easy retrofitting, OpenMotics focuses on a hardwired solution. For more, see our [full article][34] from OpenMotics backend developer Frederick Ryckbosch.

The source code for OpenMotics is licensed under the [GPLv2][35] and is available for download on [GitHub][36].

These aren't the only options available, of course. Many home automation enthusiasts go with a different solution, or even decide to roll their own. Other users choose to use individual smart home devices without integrating them into a single comprehensive system.

If the solutions above don't meet your needs, here are some potential alternatives to consider:

*   [EventGhost][1] is an open source ([GPL v2][2]) home theater automation tool that operates only on Microsoft Windows PCs. It allows users to control media PCs and attached hardware by using plugins that trigger macros or by writing custom Python scripts. 

*   [ioBroker][3] is a JavaScript-based IoT platform that can control lights, locks, thermostats, media, webcams, and more. It will run on any hardware that runs Node.js, including Windows, Linux, and macOS, and is open sourced under the [MIT license][4]. 

*   [Jeedom][5] is a home automation platform comprised of open source software ([GPL v2][6]) to control lights, locks, media, and more. It includes a mobile app (Android and iOS) and operates on Linux PCs; the company also sells hubs that it says provide a ready-to-use solution for setting up home automation.

*   [LinuxMCE][7] bills itself as the "'digital glue' between your media and all of your electrical appliances." It runs on Linux (including Raspberry Pi), is released under the Pluto open source [license][8], and can be used for home security, telecom (VoIP and voice mail), A/V equipment, home automation, and—uniquely—to play video games. 

*   [OpenNetHome][9], like the other solutions in this category, is open source software for controlling lights, alarms, appliances, etc. It's based on Java and Apache Maven, operates on Windows, macOS, and Linux—including Raspberry Pi, and is released under [GPLv3][10].

*   [Smarthomatic][11] is an open source home automation framework that concentrates on hardware devices and software, rather than user interfaces. Licensed under [GPLv3][12], it's used for things such as controlling lights, appliances, and air humidity, measuring ambient temperature, and remembering to water your plants.

Now it's your turn: Do you already have an open source home automation system in place? Or perhaps you're researching the options to create one. What advice would you have to a newcomer to home automation, and what system or systems would you recommend?

--------------------------------------------------------------------------------

via: https://opensource.com/life/17/12/home-automation-tools

作者：[Jason Baker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:http://www.eventghost.net/
[2]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
[3]:http://iobroker.net/
[4]:https://github.com/ioBroker/ioBroker#license
[5]:https://www.jeedom.com/site/en/index.html
[6]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
[7]:http://www.linuxmce.com/
[8]:http://wiki.linuxmce.org/index.php/License
[9]:http://opennethome.org/
[10]:https://github.com/NetHome/NetHomeServer/blob/master/LICENSE
[11]:https://www.smarthomatic.org/
[12]:https://github.com/breaker27/smarthomatic/blob/develop/GPL3.txt
[13]:https://opensource.com/resources/internet-of-things
[14]:https://www.statista.com/outlook/279/109/smart-home/united-states
[15]:http://www.crn.com/slide-shows/internet-of-things/300089496/black-hat-2017-9-iot-security-threats-to-watch.htm
[16]:https://opensource.com/business/15/5/why-open-source-means-stronger-security
[17]:https://calaos.fr/en/
[18]:https://github.com/calaos/calaos-os/blob/master/LICENSE
[19]:https://github.com/calaos
[20]:https://domoticz.com/
[21]:https://www.domoticz.com/wiki/Integrations_and_Protocols
[22]:https://github.com/domoticz/domoticz/blob/master/License.txt
[23]:https://github.com/domoticz/domoticz
[24]:https://home-assistant.io/
[25]:https://github.com/home-assistant/home-assistant/blob/dev/LICENSE.md
[26]:https://github.com/balloob/home-assistant
[27]:http://misterhouse.sourceforge.net/
[28]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[29]:https://github.com/hollie/misterhouse
[30]:http://www.openhab.org/
[31]:https://github.com/openhab/openhab
[32]:https://github.com/openhab/openhab/blob/master/LICENSE.TXT
[33]:https://www.openmotics.com/
[34]:https://opensource.com/life/14/12/open-source-home-automation-system-opemmotics
[35]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[36]:https://github.com/openmotics
