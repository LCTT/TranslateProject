Open hardware meets open science in a multi-microphone hearing aid project
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_OpenInnovation.png?itok=l29msbql)

Since [Opensource.com][1] first published the story of the [GNU/Linux hearing aid][2] research platform in 2010, there has been an explosion in the availability of miniature system boards, including the original BeagleBone in 2011 and the Raspberry Pi in 2012. These ARM processor devices built from cellphone chips differ from the embedded system reference boards of the past—not only by being far less expensive and more widely available—but also because they are powerful enough to run familiar GNU/Linux distributions and desktop applications.

What took a laptop to accomplish in 2010 can now be achieved with a pocket-sized board costing a fraction as much. Because a hearing aid does not need a screen and a small ARM board's power consumption is far less than a typical laptop's, field trials can potentially run all day. Additionally, the system's lower weight is easier for the end user to wear.

The [openMHA project][3]—from the [Carl von Ossietzky Universität Oldenburg][4] in Germany, [BatAndCat Sound Labs][5] in Palo Alto, California, and [HörTech gGmbH][6]—is an open source platform for improving hearing aids using real-time audio signal processing. For the next iteration of the research platform, openMHA is using the US$ 55 [BeagleBone Black][7] board with its 1GHz Cortex A8 CPU.

The BeagleBone family of boards enjoys guaranteed long-term availability, thanks to its open hardware design that can be produced by anyone with the requisite knowledge. For example, BeagleBone hardware variations are available from community members including [SeeedStudio][8] and [SanCloud][9].

![BeagleBone Black][11]

The BeagleBone Black is open hardware finding its way into research labs.

Spatial filtering techniques, including [beamforming][12] and [directional microphone arrays][13], can suppress distracting noise, focusing audio amplification on the point in space where the hearing aid wearer is looking, rather than off to the side where a truck might be thundering past. These neat tricks can use two or three microphones per ear, yet typical sound cards for embedded devices support only one or two input channels in total.

Fortunately, the [McASP][14] communication peripheral in Texas Instruments chips offers multiple channels and support for the [I2S protocol][15], originally devised by Philips for short digital audio interconnects inside CD players. This means an add-on "cape" board can hook directly into the BeagleBone's audio system without using USB or other external interfaces. The direct approach helps reduce the signal processing delay into the range where it is undetectable by the hearing aid wearer.

The openMHA project uses an audio cape developed by the [Hearing4all][16] project, which combines three stereo codecs to provide up to six input channels. Like the BeagleBone, the Cape4all is open hardware with design files available on [GitHub][17].

The Cape4all, [presented recently][18] at the Linux Audio Conference in Berlin, Germany, runs at a sample rate from 24kHz to 96Khz with as few as 12 samples per period, leading to internal latencies in the sub-millisecond range. With hearing enhancement algorithms running, the complete round-trip latency from a microphone to an earpiece has been measured at 3.6 milliseconds (at 48KHz sample rate with 16 samples per period). Using the speed of sound for comparison, this latency is similar to listening to someone just over four feet away without a hearing aid.

![Cape4all ][20]

The Cape4all might be the first multi-microphone hearing aid on an open hardware platform.

The next step for the openMHA project is to develop a [Bluetooth Low Energy][21] module that will enable remote control of the research device from a smartphone and perhaps route phone calls and media playback to the hearing aid. Consumer hearing aids support Bluetooth, so the openMHA research platform must do so, too.

Also, instructions for running a [stereo hearing aid on the Raspberry Pi][22] were released by an openMHA user-project.

As evidenced by the openMHA project, open source innovation has transformed digital hearing aid research from an esoteric branch of audiology into an accessible open science.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/open-hearing-aid-platform

作者：[Daniel James,Christopher Obbard][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/daniel-james
[1]:http://Opensource.com
[2]:https://opensource.com/life/10/9/open-source-designing-next-generation-digital-hearing-aids
[3]:http://www.openmha.org/
[4]:https://www.uni-oldenburg.de/
[5]:http://batandcat.com/
[6]:http://www.hoertech.de/
[7]:https://beagleboard.org/black
[8]:https://www.seeedstudio.com/
[9]:http://www.sancloud.co.uk
[10]:/file/403046
[11]:https://opensource.com/sites/default/files/uploads/1-beagleboneblack-600.jpg (BeagleBone Black)
[12]:https://en.wikipedia.org/wiki/Beamforming
[13]:https://en.wikipedia.org/wiki/Microphone_array
[14]:https://en.wikipedia.org/wiki/McASP
[15]:https://en.wikipedia.org/wiki/I%C2%B2S
[16]:http://hearing4all.eu/EN/
[17]:https://github.com/HoerTech-gGmbH/Cape4all
[18]:https://lac.linuxaudio.org/2018/pages/event/35/
[19]:/file/403051
[20]:https://opensource.com/sites/default/files/uploads/2-beaglebone-wireless-with-cape4all-labelled-600.jpg (Cape4all )
[21]:https://en.wikipedia.org/wiki/Bluetooth_Low_Energy
[22]:http://www.openmha.org/userproject/2017/12/21/openMHA-on-raspberry-pi.html
