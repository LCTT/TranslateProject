Can RISC-V - Linux of Microprocessors - Start an Open Hardware Renaissance?
============================================================


 ![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/riscv2-1122x812.png) 

<figcaption data-blog-inner="caption" class="inner-caption" style="border: 0px solid rgb(5, 28, 42); -webkit-font-smoothing: antialiased; margin-top: 10px; -webkit-tap-highlight-color: transparent;"></figcaption>

I share the hope with many people that we will soon have access to modern, capable devices powered by both open source hardware ( [OSH][1] ) _and_ software.

Open hardware is that which is fully documented and free to use, study, modify and reproduce for your own needs. Everything from the schematics to the PCB layout is all published, including the software that drives the hardware. There have been advancements in recent years and more hardware is being opened up, but the microprocessors in our pc's and other devices are stuck running one of the dominant, closed Instruction Set Architectures ( [ISA's][2] ) in the form of x86 on the desktop or an ARM variant in smartphones/tablets. Both of these ISA'a are closed source and are not candidates for an open device. Also, the many widely-used implementations of ARM like the A9 or Snapdragon add further proprietary layers to these already proprietary ISA's.

[RISC-V][3] is different. Introduced in 2010 by the researchers at UC Berkeley, RISC-V (pronounced risk-five) is built according to the same original [RISC][4] (Reduced Instruction Set Computing) CPU design that underlies other familiar ISA's such as ARM, MIPS, PowerPC and SPARC, but with the intention of being open and unencumbered by patents (Note: as of right now, the RISC-V specs are only free for private or educational use, with full openness planned for the future). The RISC design strategy is in opposition to the Complex Instruction Set Computing (CISC) design of the x86 family.

While RISC-V is not the only open ISA in existence, it's the only one poised to advance in a hurry. The RISC-V Foundation, which directs the development and adoption of the ISA, has some pretty big donors like Oracle, Western Digital, HP, Google, IBM, and Nvidia. I can think of a couple prominent chip manufacturers missing from that list. It seems that the big players have figured out that as with software, hardware will develop faster and better out in the open. Oh and also, you won't have to pay anyone to use it. A project like this hasn't been conquered any sooner because of the difficulty and cost involved in development. Now that an open result is actually what the big companies are after, the development money is rolling in.

RISC-V also has plenty of backing in the academic world. From its incubation at Berkeley to the over 35 University projects worldwide aiding in its development, there's no shortage of brilliant minds working on the project.

There's already progress happening in the background. On the software side, people are porting programs over to RISC-V and getting things booting up. Fedora has ported thousands of programs already - here's [Fedora/RISC-V][5] booting up in QEMU:
 ![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/booting-500x664.gif) 

<figcaption data-blog-inner="caption" class="inner-caption" style="border: 0px solid rgb(5, 28, 42); -webkit-font-smoothing: antialiased; margin-top: 10px; -webkit-tap-highlight-color: transparent;">_Hat tip to Richard WM Jones for this awesome gif._</figcaption>

On the hardware side, people are building dev boards. The HiFive1, a successfully funded Crowd Supply campaign, is an Arduino board from SiFive powered by their own FE310 SoC, a 32bit RISC-V chip that runs at 320+ MHz. It's shipping in February and you can pre-order one [here][6]for $59.

 ![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/si5-640x457.jpg) 



It all sure sounds great - I hope they can deliver because we will all benefit immensely. Support the project if you can. Tell people about it. Buy a HiFive1 and see what runs on it. I see these chips in your future.

--------------------------------------------------------------------------------

via: https://www.darrentoback.com/can-risc-v-linux-of-microprocessors-start-an-open-hardware-renaissance

作者：[ dmt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.darrentoback.com/about-me
[1]:https://en.wikipedia.org/wiki/Open-source_hardware
[2]:https://en.wikipedia.org/wiki/Comparison_of_instruction_set_architectures
[3]:https://en.wikipedia.org/wiki/RISC-V
[4]:https://en.wikipedia.org/wiki/Reduced_instruction_set_computing
[5]:https://fedoraproject.org/wiki/Architectures/RISC-V
[6]:https://www.crowdsupply.com/sifive/hifive1/
