[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Retro computing with FPGAs and MiSTer)
[#]: via: (https://opensource.com/article/19/11/fpga-mister)
[#]: author: (Sarah Thornton https://opensource.com/users/sarah-thornton)

Retro computing with FPGAs and MiSTer
======
Field-programmable gate arrays are used in devices like smartphones,
medical devices, aircraft, and—here—emulating an old-school Amiga.
![Mesh networking connected dots][1]

Another weekend rolls around, and I can spend some time working on my passion projects, including working with single-board computers, playing with emulators, and general tinkering with a soldering iron. Earlier this year, I wrote about [resurrecting the Commodore Amiga on the Raspberry Pi][2]. A colleague referred to our shared obsession with old technology as a "[passion for preserving our digital culture][3]."

In my travels in the world of "digital archeology," I heard about a new way to emulate old systems by using [field-programmable gate arrays][4] (FPGAs). I was intrigued by the concept, so I dedicated a weekend to learn more. Specifically, I wanted to know if I could use an FPGA to emulate a Commodore Amiga.

### What is an FPGA?

When you build a circuit board, everything is literally etched in silicon. You can change the software that runs on it, but the physical circuit is immutable. So if you want to add a new component to it or modify it later, you are limited by the physical nature of the hardware. With an FPGA, you can program the hardware to simulate new components or change existing ones. This is achieved through programmable logic gates (hence the name). This provides a lot of flexibility for Internet-of-Things (IoT) devices, as they can be changed later to meet new requirements.

![Terasic DE10-Nano][5]

FPGAs are used in many devices today, including smartphones, medical devices, motor vehicles, and aircraft. Because FPGAs can be easily modified and generally have low power requirements, these devices are everywhere! They are also inexpensive to manufacture and can be configured for multiple uses.

The Commodore Amiga was designed with chips that had specific uses and fun names. For example, "Gary" was a gate array that later became "Fat Gary" when "he" was upgraded on the A3000 and A4000. "Bridgette" was an integrated bus buffer, and the delightful "Amber" was a "flicker fixer" on the A3000. The ability to simulate these chips with programmable gates makes an ideal platform for Amiga emulation.

When you use an emulator, you are tricking an application into using software to find the architecture it expects. The primary limitations are the accuracy of the emulation and the sequential nature of how the commands are processed through the CPU. With an FPGA, you can teach the hardware what chips are in play, and software can talk to each chip as if it was native and in parallel. It also means applications can thread as if they were running on the original hardware. This makes FGPAs especially good for emulating old systems.

### Introducing the MiSTer project

The board I have been working with is [Terasic][6]'s [DE10-Nano][7]. Out of the box, this device is excellent for learning how FPGAs work and gives you access to tools to get you started.

![Terasic DE10-Nano][8]

The [MiSTer project][9] is built on top of this board and employs daughter boards to provide memory expansion, SDRAM, and improved I/O, all built on a Linux-based distribution. To use it as a platform for emulation, it's expanded through the use of "cores" that define the architecture the board will emulate.

Once you have flashed the device with the MiSTer distro, you can load a "core," which is a combination of a definition for the chips you want to use and the associated menus to manage the emulated system.

![Terasic DE10-Nano][10]

Compared to a Raspberry Pi running emulation software, these cores provide a more native experience for emulation, and often apps that don't run perfectly on software-based emulators will run fine on a MiSTer.

### How to get started

There are excellent resources online to help get you started. The first stop is the [documentation][11] on MiSTer's [GitHub page][12], which has step-by-step instructions on putting everything together. If you prefer a visual walkthrough of the board, check out [this video][13] from the [Retro Man Cave][14] YouTube channel. For more information on configuring the [Minimig][15] (short for mini Amiga) core to load disks or using Amiga's classic [Workbench][16] and [WHDLoad][17], check out this great [tutorial][18] from [Phil's Computer Lab][19] on YouTube.

### Cores

MiSTer has cores available for a multitude of systems; my main interest is in Amiga emulation, which is provided by the Minimig core. I'm also interested in the Commodore 64 and PET and the BBC microcomputer, which I used at college. I also have a soft spot for playing [Space Invaders on the Commodore PET][20], which I will admit (many years later!) was the real reason I booked time in the college computer lab at the end of the week.

Once a core is loaded, you can interact with it through a connected keyboard and by pressing F12 to access the "core" menu. To access a shell, you can log in by using the F9 key, which presents you with a login prompt. You will need a [kickstart ROM][21] (the equivalent of a PC's BIOS), to get your Amiga running. You can obtain these from [Cloanto][22], which sells the [Amiga Forever][23] kickstart that contains the ROMs required to boot a system as well as games, demos, and hard drive files that can be used on your MiSTer. Store the kickstart ROM in the root of your SD card and name it "KICK.ROM."

On my MiSTer board, I can run Amiga demos that don't run on my Raspberry Pi, even though my Pi has much more memory available. The emulation is more accurate and runs more efficiently. Through the expansion board, I can even use old hardware, such as an original Commodore monitor and Amiga joysticks.

### Source code

All code for the MiSTer project is available in its [GitHub repo][12]. You have access to the cores as well as the main MiSTer setup, associated scripts, and menu files. These are actively updated, and there is a solid community actively developing, bug fixing, and improving all contributions, so check back regularly for updates. The repo has a wealth of information available to help get you up and running.

### Security considerations

With the flexibility of customization comes the potential for [security vulnerabilities][24]. All MiSTer installs come with a preset password on the root account, so one of the first things you want to do is to change the password. If you are using the device to build a cabinet for a game and you have given the device access to your network, it can be exploited using the default login credentials, and that can lead to giving a third party access to your network.

For non-MiSTer projects, FPGAs expose the ability for one process to be able to listen in on another process, so limiting access to the device should be one of the first things you do. When you build your application, you should isolate processes to prevent unwanted access. This is especially important if you intend to deploy your board where access is open to other users or with shared applications.

### Find more information

There is a lot of information about this type of project online. Here are some of the resources you may find helpful.

#### Community

  * [MiSTer wiki][9]
  * [Setup guide][11]
  * [Internet connections on supporting cores][25]
  * [Discussion forums][26]
  * [MiSTer add-ons][27] (public Facebook group)



#### Daughter boards

  * [SDRAM board][28]
  * [I/O board][29]
  * [RTC board][30]
  * [USB hub][31]



#### Videos and walkthroughs

  * [Exploring the MiSTer and DE-10 Nano FPGA][32]: Is this the future of retro?
  * [FPGA emulation MiSTer project on the Terasic DE10-Nano][33]
  * [Amiga OS 3.1 on FPGA—DE10-Nano running MisTer][34]



#### Where to buy the hardware

##### MiSTer project

  * [DE10-Nano][35] (Amazon)
  * [Ultimate Mister][36]
  * [MiSTer Add-ons][37]



##### Other FPGAs

  * [TinyFPGA BX—ICE40 FPGA development board with USB][38] (Adafruit)
  * [Terasic][6], makers of the DE10-Nano and other high-performance FPGAs



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/fpga-mister

作者：[Sarah Thornton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sarah-thornton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mesh_networking_dots_connected.png?itok=ovINTRR3 (Mesh networking connected dots)
[2]: https://opensource.com/article/19/3/amiga-raspberry-pi
[3]: https://www.linkedin.com/pulse/passion-preserving-digital-culture-%C3%B8ivind-ekeberg/
[4]: https://en.wikipedia.org/wiki/Field-programmable_gate_array
[5]: https://opensource.com/sites/default/files/uploads/image5_0.jpg (Terasic DE10-Nano)
[6]: https://www.terasic.com.tw/en/
[7]: https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=165&No=1046
[8]: https://opensource.com/sites/default/files/uploads/image2_0.jpg (Terasic DE10-Nano)
[9]: https://github.com/MiSTer-devel/Main_MiSTer/wiki
[10]: https://opensource.com/sites/default/files/uploads/image1_0.jpg (Terasic DE10-Nano)
[11]: https://github.com/MiSTer-devel/Main_MiSTer/wiki/Setup-Guide
[12]: https://github.com/MiSTer-devel
[13]: https://www.youtube.com/watch?v=e5yPbzD-W-I&t=2s
[14]: https://www.youtube.com/channel/UCLEoyoOKZK0idGqSc6Pi23w
[15]: https://github.com/MiSTer-devel/Minimig-AGA_MiSTer
[16]: https://en.wikipedia.org/wiki/Workbench_%28AmigaOS%29
[17]: https://en.wikipedia.org/wiki/WHDLoad
[18]: https://www.youtube.com/watch?v=VFespp1adI0
[19]: https://www.youtube.com/channel/UCj9IJ2QvygoBJKSOnUgXIRA
[20]: https://www.youtube.com/watch?v=hqs6gIZbpxo
[21]: https://en.wikipedia.org/wiki/Kickstart_(Amiga)
[22]: https://cloanto.com/
[23]: https://www.amigaforever.com/
[24]: https://www.helpnetsecurity.com/2019/06/03/vulnerability-in-fpgas/
[25]: https://github.com/MiSTer-devel/Main_MiSTer/wiki/Internet-and-console-connection-from-supported-cores
[26]: http://www.atari-forum.com/viewforum.php?f=117
[27]: https://www.facebook.com/groups/251655042432052/
[28]: https://github.com/MiSTer-devel/Main_MiSTer/wiki/SDRAM-Board
[29]: https://github.com/MiSTer-devel/Main_MiSTer/wiki/IO-Board
[30]: https://github.com/MiSTer-devel/Main_MiSTer/wiki/RTC-board
[31]: https://github.com/MiSTer-devel/Main_MiSTer/wiki/USB-Hub-daughter-board
[32]: https://www.youtube.com/watch?v=e5yPbzD-W-I
[33]: https://www.youtube.com/watch?v=1jb8YPXc8DA
[34]: https://www.youtube.com/watch?v=tAz8VRAv7ig
[35]: https://www.amazon.com/Terasic-Technologies-P0496-DE10-Nano-Kit/dp/B07B89YHSB/
[36]: https://ultimatemister.com/
[37]: https://misteraddons.com/
[38]: https://www.adafruit.com/product/4038
