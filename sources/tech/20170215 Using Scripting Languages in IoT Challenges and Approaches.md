Using Scripting Languages in IoT: Challenges and Approaches
============================================================


 ![Scripting IoT](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/scripting-languages-iot.jpg?itok=d6uog0Ss "Scripting IoT") 

At the upcoming Embedded Linux Conference + OpenIoT Summit, Paul Sokolovsky will discuss some of the challenges of using scripting languages in embedded development.[Creative Commons Zero][2]Pixabay

Scripting languages (aka Very High-Level Languages or VHLLs), such as Python, PHP, and JavaScript are commonly used in desktop, server, and web development. And, their powerful built-in functionality lets you develop small useful applications with little time and effort, says Paul Sokolovsky, IoT engineer at Linaro. However, using VHLLs for deeply embedded development is a relatively recent twist in IoT.

 ![Paul Sokolovsky](https://www.linux.com/sites/lcom/files/styles/floated_images/public/paul-sokolovsky-2014-09-21.jpg?itok=nUlGjxf3 "Paul Sokolovsky") 

Paul Sokolovsky, IoT engineer at Linaro[Used with permission][1]

At the upcoming [Embedded Linux Conference][6] + [OpenIoT Summit][7], Sokolovsky will discuss the challenges of using VHLLs in embedded development and compare different approaches, based on the  examples of MicroPython and JerryScript + Zephyr.js projects. We talked with Sokolovsky to get more information.

**Linux.com: Can you please give our readers some background on VHLLs?**

Paul Sokolovsky: Very High Level Languages have been a part of the computer science and information technologies landscape for several decades now. Perhaps the first popular scripting language was a Unix shell (sh), although it's rarely considered a VHLL, but rather a domain-specific language, due to its modest feature set. However, the first truly record-breaker VHLLs were Perl (1987) and Tcl (1988), soon followed by Python (1991), Ruby (1995), PHP (1995), JavaScript (1995), and many others.

The distinctive features of VHLLs are their interpreted nature (from the user's point of view, there may be sophisticated compilers inside), built-in availability of powerful data types like arbitrary-sized lists and mappings, sizable standard library, and external modules system allowing users to access even larger third-party libraries. All that is coupled with a general easy feel (less typing, no build times, etc.) and an easy learning curve.

**Linux.com: What are the benefits of these languages for development?**

Sokolovsky: The benefits stem from the features described above. One can start with a scripting language quite easily and learn it quickly. Many VHLLs offer a powerful interactive mode, so you don't need to read thick manuals to get started but can explore and experiment right away. Powerful built-in functionality allows you to develop small useful applications -- scripts -- with little time and effort (that's where the "scripting languages" name came from). Moving to larger applications, vast third-party libraries and an easy-to-use module system make developing them also streamlined and productive.

**Linux.com: How does scripting for embedded platforms differ from development for other platforms?**

Sokolovsky: With all the exciting capabilities of VHLLs discussed above, there's an idea -- why we can't enjoy all (or at least some) benefits of them when developing for embedded devices? And by "embedded devices" I mean here not just small Linux systems with 8-32MB of RAM, but deeply embedded systems running on microcontrollers (MCUs) with mere kilobytes of memory. Small, and sometimes really scarce, resources definitely add complexity to this idea. Another issue is device access and interaction. Embedded devices usually don't have displays and keyboards, but fortunately the answer is known for decades thanks to Unix -- just use a terminal connection over a serial (UART). Of course, on a host side, it can be hidden behind a graphical IDE, which some users prefer.

So, with all the differences the embedded devices have, the idea is to provide as familiar a working environment as possible. That's on one side of the spectrum and, on the other, the idea is to make it as scaled down as possible to accommodate even the smallest of devices. These conflicting aims require embedded VHLLs implementations to be highly configurable, to adjust for the needs of different projects and hardware.

**Linux.com: What are the specific challenges of using these languages for IoT? How do you address memory constraints, for example?**

Sokolovsky: It's definitely true that the interpreter consumes scarce hardware resources. But nowadays the most precious resource is the human time. Whether you are an R&D engineer, a maker with only a few hours on weekend, a support engineer overwhelmed with bugs and security issues, or a project manager planning a product -- you likely don't have extra time on your hands. The idea is to deliver the productivity of VHLLs into the hands of embedded engineers.

Nowadays, the state of art is very enabling of this. It's fair to say that, even of microcontroller units (MCUs), an average now is 16-32KB RAM and 128-256K ROM. That's just enough to host a core interpreter, a no-nonsense subset of standard library types, some hardware drivers, and a small -- but still useful -- user application. If you go slightly above the middle line, capabilities raise rapidly -- it's actually a well-known trick from 1970s that using custom bytecode/pcode lets you achieve greater code/feature density than the raw machine code.

There are a lot of challenges on that road, scarcity of RAM being the main one. I write these words on a laptop with 16GB of RAM (and there're still slowdowns due to swapping), and the 16KB mentioned above is a million times less! And yet, by using carefully chosen algorithms and coding techniques, it's possible to implement a scripting language that can execute simple applications in that amount of RAM, and fairly complex ones in 128-256K.

There are many technical challenges to address (and which are being successfully addressed), and there wouldn't be a space to cover them here. Instead, my presentation at OpenIoT Summit will cover experiences and achievements of two embedded scripting languages: MicroPython (Python3 language subset) and Zephyr.js (JavaScript/Node.js subset), both running on top of The Linux Foundation's Zephyr RTOS, which is expected to do for the IoT industry what Linux did for the mobile and server industries. (The slides will be available afterwards for people who can't attend OpenIoT Summit.)

**Linux.com: Can you give us some examples of applications for which VHLLs are most appropriate? And for which they are inappropriate?**

Sokolovsky: Above are many bright prospects for VHLLs, fairly speaking; in embedded, there's a lot of wishful thinking in that (or hopefully, self-fulfilling prophecy). Where VHLLs in embedded can deliver right now are: rapid prototyping, and educational/maker markets where easy learnability and usage is a must. There are pioneers that use VHLLs in other areas, but generally, it requires more investment into infrastructure and tools. It's important that such investment be guided by open source principles and be shared, or otherwise it undermines the idea that VHLLs can save their users time and effort.

With that in mind, embedded VHLLs are full-fledged ("Turing complete") languages suitable for any type of application, subject to hardware constraints. For example, if an MCU is below the thresholds stated above, of a legacy 8-bit micro, good old C is the only choice you can enjoy. Another limit is when you really want to get the most out of the hardware -- C or Assembler is the right choice. But, here's a surprise -- the developers of embedded VHLLs thought about that, too, and, for example, MicroPython allows you to combine Python and Assembler in one application.

Where embedded VHLLs excel is configurability and (re)programmability, coupled with flexible connectivity support. That's exactly what IoT and smart devices are all about, and many IoT applications don't have to be complex to be useful. Consider, for example, a smart button you can stick anywhere to do any task. But, what if you need to adjust the double-click time? With a scripting language, you can. Maybe you didn't think about triple-clicks at all, but now find that even four clicks would be useful in some cases. With a scripting language you can change that -- easily.

 _Embedded Linux Conference + OpenIoT Summit North America will be held on February 21 - 23, 2017 in Portland, Oregon. [Check out over 130 sessions][5] on the Linux kernel, embedded development & systems, and the latest on the open Internet of Things._

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/elcna/2017/2/using-scripting-languages-iot-challenges-and-approaches

作者：[AMBER ANKERHOLZ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/aankerholz
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/paul-sokolovsky-2014-09-21jpg
[4]:https://www.linux.com/files/images/scripting-languages-iotjpg
[5]:http://events.linuxfoundation.org/events/embedded-linux-conference/program/schedule?utm_source=linux&utm_campaign=elc17&utm_medium=blog&utm_content=video-blog
[6]:http://events.linuxfoundation.org/events/embedded-linux-conference
[7]:https://events.linuxfoundation.org/events/openiot-summit/program/schedule
