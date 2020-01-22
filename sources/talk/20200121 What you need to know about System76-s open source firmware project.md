[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about System76's open source firmware project)
[#]: via: (https://opensource.com/article/20/1/system76-open-source-firmware)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

What you need to know about System76's open source firmware project
======
This Q&A with System76 principal engineer Jeremy Soller discusses the
company's project for an open source embedded controller.
![Person using a laptop][1]

When you power on your computer, there’s a lot more going on than you might think. One of the most important elements involved is the embedded controller (EC). This is what is responsible for providing abstractions for the battery, charging system, keyboard, touchpad, suspend/resume, and thermal control, among others. These controllers are typically proprietary and usually run proprietary firmware.

System76 is about to change that paradigm. Recently, the company adopted [coreboot][2] for their Galago Pro and Darter Pro laptop models. Now they intend to extend the open source approach to the EC. There is a project associated with Chrome OS devices called [Chromium EC][3] that is open source; however, it is only available for Chromebooks and specific EC chips. System76 wanted to supply their customers with an open source embedded controller firmware, too.

They had to start from scratch with a project that can compile for the EC architecture they have in their laptops, the [Intel 8051][4]. Their project for an [open source EC][5], the System76 EC, is a GPLv3-licensed embedded controller firmware for System76 laptops. It is designed to be portable to boards using several 8-bit microcontrollers. This project has grown to the point where it is now possible to boot a System76 Galago Pro and have the battery, keyboard, touchpad, suspend/resume, and thermal control mentioned earlier.

Eager to learn more, I emailed [Jeremy Soller][6], who is Principal Engineer at System76, for a deeper dive. Below are some highlights from our conversation.

### Q: What is the importance of the Intel 8051? Do all laptops use that chipset?

A: The embedded controller in our laptops, the ITE IT8587E, uses the Intel 8051 instruction set. Not all laptops use this instruction set, but many do. This is important because we need a toolchain that can compile firmware for the 8051 instruction set, as well as firmware that is written for that toolchain.

### Q: What is involved in writing open code to utilize the Intel 8051?

A: Mostly we have to define the registers for utilizing hardware on the embedded controller. There are protocols like SMBus and PECI that are implemented in hardware and need drivers for them. These drivers often have to be written for each embedded controller to abstract its hardware, so there is a common interface. Our EC firmware has abstractions for some Arduinos as well as the EC in our laptops, so we can write firmware that is portable.

### Q: Google developed an open EC. Why not fork that project?

A: Our initial concept was to utilize Chromium EC for our open EC firmware, but this was not possible. After discussions with members of the team at Google working on it, it became clear that the firmware was not capable of being ported to 8-bit microcontrollers like the 8051 used in our EC, or the AVR used in many Arduinos. It was mostly targeted to ARM microcontrollers. We mutually concluded that it was better to start a new project targeting 8-bit microcontrollers, which is a new codebase that is GPLv3, as opposed to the BSD license used by Chromium EC.

### Q: How significant is it that System76 is open sourcing the code?

A: The only other x86_64 laptops with open source EC firmware are certain Chromebooks using Chromium EC. However, these laptops have poor support for full desktop Linux distributions such as Ubuntu. We are providing users of our laptops with significant capabilities to view and modify the behavior of the laptop to their needs, all while running a full desktop operating system. When it is paired with our open system firmware, there is very little that a user cannot do with one of these laptops.

### Q: What implications does open code have for firmware and other developers?

A: I strongly believe that open EC firmware will be just as important for hardware customization as open system firmware. The user can adjust keyboard mappings, change fan curves, modify battery charging settings, and more. The most exciting thing about this is that I cannot predict all that is possible with this change. Many of the components in the system are tied to the EC firmware. Having the ability to change the EC and system firmware means these components could potentially be modified in a large number of different, unpredictable ways.

### Q: What is really important about developing software for this EC, and what sets it apart?

A: Something particularly important is that the EC we are using is the IT8587E, and its instruction set architecture is Intel 8051. Chromium EC cannot be compiled for the 8051, due to being targeted toward 32-bit microcontrollers. Our project aims to support the ubiquitous 8-bit microcontrollers from many vendors, as well as Arduino’s for easy prototyping. In addition, this unifies the work we were doing on [Thelio Io][7] with the work we have done on laptop firmware.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/system76-open-source-firmware

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/19/11/coreboot-system76-laptops
[3]: https://chromium.googlesource.com/chromiumos/platform/ec/+/master/README.md
[4]: https://en.wikipedia.org/wiki/Intel_MCS-51
[5]: https://github.com/system76/ec
[6]: https://www.linkedin.com/in/jeremy-soller-0475a117/
[7]: https://opensource.com/article/18/11/system76-thelio-desktop-computer
