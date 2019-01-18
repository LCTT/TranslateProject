zhs852 is translating.

Dawn of the Microcomputer: The Altair 8800
======
Subscribers to Popular Electronics were a sophisticated group. The magazine’s editor, Arthur Salsberg, felt compelled to point out as much in the editorial section of the [December 1974 issue][1]. The magazine had received letters complaining that a recent article, titled “How to Set Up a Home TV Service Shop,” would inspire a horde of amateur TV technicians to go out and undercut professional repairmen, doing great damage to everyone’s TVs in the process. Salsberg thought this concern was based on a misunderstanding about who read Popular Electronics. He explained that, according to the magazine’s own surveys, 52% of Popular Electronics subscribers were electronics professionals of some kind and 150,000 of them had repaired a TV in the last 60 days. Moreover, the average Popular Electronics subscriber had spent $470 on electronics equipment ($3578 in 2018) and possessed such necessities as VOMs, VTVMs, tube testers, transistor testers, r-f signal generators, and scopes. “Popular Electronics readers are not largely neophytes,” Salsberg concluded.

I am surprised that anyone familiar with Popular Electronics could ever have doubted its subscribers. I certainly haven’t repaired a TV in the last 60 days. My computer is a block of aluminum that I have never seen the inside of. Yet the December 1974 issue of Popular Electronics features articles such as “Standing Wave Ratio: What It Is and How to Deal with It” and “Test Scene: Uses for Your Multimeter.” Even the ads are intimidating. One of them, which seems to be for some kind of stereo system, boldly proclaims that “no piece of audio equipment is as eagerly awaited as the ‘one four-channel unit that does everything—i.e. the receiver with built-in circuitry for SQ, RM and CD-4 record decoding.’” The mere hobbyists subscribed to Popular Electronics, let alone the professionals, must have been very knowledgeable indeed.

But Popular Electronics readers were introduced to something in the [January 1975 issue][2] that they had never encountered before. Below a heading that read “PROJECT BREAKTHROUGH,” the magazine’s cover showed a large gray and black box whose front panel bore a complicated array of lights and toggles. This was the Altair 8800, the “world’s first minicomputer kit to rival commercial models,” available for under $400. Though advertised as a “minicomputer,” the Altair would actually be the first commercially successful member of a new class of computers, first known as “microcomputers” and then eventually as PCs. The Altair was small enough and cheap enough that the average family could have one at home. Its appearance in Popular Electronics magazine meant that, as Salsberg wrote in that issue, “the home computer age is here—finally.”

![January 1975 cover of Popular Electronics][3]

I have written briefly about [the Altair before][4], but I think the Altair is worth revisiting. It was not an especially powerful computer compared to others available at the time (though it cost significantly less money). Nor was it the first general-purpose computer to incorporate a microprocessor chip—at least three microprocessor-based computers preceded it. But the Altair was and is a kind of Ur-Computer for all of us. It was the first popular computer in a lineage that includes our own devices, whereas the mainframes and bulky minicomputers that predated the Altair were an entirely different kind of machine, programmed by punched card or else rarely interacted with directly. The Altair was also a radically simple computer, without any kind of operating system or even a bootloader. Unless you bought peripherals for it, the Altair was practically a bank of RAM with switches and lights on the front. The Altair’s simplicity makes learning about it a great way to reacquaint yourself with the basic concepts of computing, exactly as they were encountered by the denizens of the old analog world as they first ventured into our digital one.

### Roberts and Co.

The Altair was designed and manufactured by a company called Micro Instrumentation and Telemetry Systems (MITS), based in Albuquerque, New Mexico. MITS was run by a man named H. Edward Roberts. The company had started off making telemetry systems for model rocket kits before moving into the calculator market, which in the early 1970s was booming. Integrated circuits were bringing the cost of a calculator down dramatically and suddenly every working American professional had to have one. But the calculator market was ruthlessly competitive and, by the beginning of 1974, MITS was deeply in debt.

The year 1974 would prove to be an “annus mirabilis” in computing. In January, Hewlett-Packard introduced the HP-65, the world’s first programmable handheld calculator. In April, Intel released the Intel 8080, its second 8-bit microprocessor and the first microprocessor to become widely popular. Then, in July, Radio Electronics magazine advertised a build-it-yourself minicomputer called the Mark-8, which employed the Intel 8008 microprocessor that Intel had released in 1972. The Mark-8 was only the third computer ever built using a microprocessor and it was the first to be appear on the cover of a magazine. The Mark-8’s appearance in Radio Electronics pushed Popular Electronics to look for a minicomputer project of their own to feature.

Popular Electronics subscribers actually received their copies of the January 1975 issue in the mail in December of 1974. So the announcement of the Altair closed out the “annus mirabilis” that was that year. The Altair’s introduction was so momentous because never before had such a fully capable computer been offered to the public at an affordable price. The PDP-8, one the most popular minicomputers at the time, could only be bought for several thousand dollars. Yet the Intel 8080 chip at the heart of the Altair made it almost as capable as the PDP-8, if not more so; the 8080 supported a wider instruction set and the Altair could be expanded to have up to 64kb of memory, while the stock PDP-8 typically only had 4kb. The Altair was also more powerful than the Mark-8, which, because it was based on the Intel 8008, could only address 16kb of memory. And whereas the Mark-8 had to be built from scratch by customers with only a booklet and printed circuit boards to guide them, the Altair could be purchased fully assembled, though MITS soon became so inundated with orders that the only real way to get an Altair was to order the construction kit.

For many Popular Electronics readers, the Altair was their first window into the world of digital computing. The article introducing the Altair in the January 1975 issue was written by Roberts and the Altair’s co-designer, William Yates. Roberts and Yates took pains to explain, in terms familiar to the electricians and radio enthusiasts in their audience, the basic concepts underlying digital hardware and computer programming. “A computer,” they wrote, “is basically a piece of variable hardware. By changing the bit pattern stored in the memory, the hardware can be altered from one type of device to another.” Of programming, meanwhile, Roberts and Yates wrote that the basic concepts are “simple enough to master in a relatively short time,” but that becoming “an efficient programmer requires a lot of experience and a large amount of creativity,” which sounds about right to me. The article included a detailed diagram explaining all the constituent circuits of the Intel 8080 CPU, even though readers would receive at least that part fully assembled. It explained the difference between a CPU and a computer’s memory unit, the uses of a stack pointer, and the enormous advantages offered by assembly languages and higher-level languages like FORTRAN and BASIC over manual entry of machine code.

Popular Electronics had in fact been running a series written by Roberts for several issues before January 1975. The series was billed as a short course in “digital logic.” In the December 1974 issue, Roberts walked readers through building a “very low cost computer terminal,” which was basically an octal keypad that could input values into an 8-bit computer. In the course of describing the keypad, Roberts explained how transistor-to-transistor logic works and also how to construct a flip-flop, a kind of circuit capable of “remembering” digital values. The keypad, Roberts promised, could be used with the Altair computer, to be announced the following month.

It’s unclear how many Popular Electronics readers actually built the keypad, but it would have been a very useful thing to have. Without a keypad or some other input mechanism, the only way to input values into the Altair was through the switches on the front panel. The front panel had a row of 16 switches that could be used to set an address and a lower row of eight switches that could be used to control the operation of the computer. The eight right-most switches in the row of 16 could also be used to specify a value to be stored in memory. This made sense because the Intel 8080 used 16-bit values to address 8-bit words. The 16 switches on the front panel each represented a bit—the up position represented a one, while the down position represented a zero. Interacting with a computer this way is a revelation (more on that in a minute), because the Altair’s front panel is a true binary interface. It’s as close as you can get to the bare metal.

As alien as the Altair’s interface is to us today, it was not unusual for its time. The PDP-8, for example, had a similar binary input mechanism on its front panel, though the PDP-8’s switches were nicer and colored in that attractive orange and yellow color scheme that really ought to make a comeback. The PDP-8, however, was often paired with a paper-tape reader or a teletype machine, which made program entry much easier. These I/O devices were expensive, meaning that most Altair users in the early days were stuck with the front panel. As you might imagine, entering long programs via the switches was a chore. Eventually the Altair could be hooked up to a cassette recorder and programs could be loaded that way. Bill Gates and Paul Allen, in what would become Microsoft’s first ever commercial venture, also wrote a version of BASIC for the Altair that MITS licensed and released in the middle of 1975. Users that could afford a teletype could then [load BASIC into the Altair via paper tape][5] and interact with their Altair through text. BASIC, which had become everyone’s favorite introductory programming language in schools, would go on to become the standard interface to the machines produced in the early microcomputer era.

### z80pack

Thanks to the efforts of several internet people, in particular a person named Udo Munk, you can run a simulation of the Altair on your computer. The simulation is built on top of some software that emulates the Zilog Z80 CPU, a CPU designed to be software-compatible with the Intel 8080. The Altair simulation allows you to input programs entirely via the front panel switches like early users of the Altair had to do. Though clicking on switches does not offer the same tactile satisfaction as flipping real switches, playing with the Altair simulation is a great way to appreciate how a binary human/computer interface was both horribly inefficient and, at least in my opinion, charmingly straightforward.

z80pack, Udo Munk’s Z80 emulation package, can be downloaded from the z80pack website. There are instructions in [my last Altair post][4] explaining how to get it set up on Mac OS. If you are able to compile both the FrontPanel library and the `altairsim` executable, you should be able to run `altairsim` and see the following window:

![Simulated Altair Front Panel][6]

By default, at least with the version of z80pack that I am using (1.36), the Altair is configured with something called Tarbell boot ROM, which I think is used to load disk images. In practice, what this means is that you can’t write values into the first several words in RAM. If you edit the file `/altairsim/conf/system.conf`, you can instead set up a simple Altair that has 16 pages of RAM and no ROM or bootloader software at all. You can also use this configuration file to increase the size of the window the simulation runs in, which is handy.

The front panel of the Altair is intimidating, but in reality there isn’t that much going on. The [Altair manual][7] does a good job of explaining the many switches and status lights, as does this [YouTube video][8]. To enter and run a simple program, you only really need to know a few things. The lights labeled D0 through D7 near the top right of the Altair indicate the contents of the currently addressed word. The lights labeled A0 through A15 indicate the current address. The 16 switches below the address lights can be used to set a new address; when the “EXAMINE” switch is pressed upward, the data lights update to show the contents of the newly addressed word. In this way, you can “peek” at all the words in memory. You can also press the “EXAMINE” switch down to the “EXAMINE NEXT” position, which automatically examines the next memory address, which makes peeking at sequential words significantly easier.

To save a bit pattern to a word, you have to set the bit pattern using the right-most eight switches labeled 0 through 7. You then press the “DEPOSIT” switch upward.

In the [February 1975 issue][9] of Popular Electronics, Roberts and Yates walked Altair owners through inputting a small sample program to ensure that their Altair was functioning. The program loads two integers from memory, adds them, and saves the sum back into memory. The program consists of only six instructions, but those six instructions involve 14 words of memory altogether, which takes some time to input correctly. The sample program also appears in the Altair manual in table form, which I’ve reproduced here:

Address Mnemonic Bit Pattern Octal Equivalent 0 LDA 00 111 010 0 7 2 1 (address) 10 000 000 2 0 0 2 (address) 00 000 000 0 0 0 3 MOV B, A 01 000 111 1 0 7 4 LDA 00 111 010 0 7 2 5 (address) 10 000 001 2 0 1 6 (address) 00 000 000 0 0 0 7 ADD B 10 000 000 2 0 0 8 STA 00 110 010 0 6 2 9 (address) 10 000 010 2 0 2 10 (address) 00 000 000 0 0 0 11 JMP 11 000 011 3 0 3 12 (address) 00 000 000 0 0 0 13 (address) 00 000 000 0 0 0

If you input each word in the above table into the Altair via the switches, you end up with a program that loads the value in word 128, adds it to the value in the word 129, and finally saves it into word 130. The addresses that accompany each instruction taking an address are given with the least-significant bits first, which is why the second byte is always zeroed out (no addresses are higher than 255). Once you’ve input the program and entered some values into words 128 and 129, you can press the “RUN” switch into the down position briefly before pushing it into the “STOP” position. Since the program loops, it repeatedly adds those values and saves the sum thousands of times a second. The sum is always the same though, so if you peek at word 130 after stopping the program, you should find the correct answer.

I don’t know whether any regular users of the Altair ever had access to an assembler, but z80pack includes one. The z80pack assembler, `z80asm`, is meant for Z80 assembly, so it uses a different set of mnemonics altogether. But since the Z80 was designed to be compatible with software written for the Intel 8080, the opcodes are all the same, even if the mnemonics are different. So just to illustrate what it might have been like to write the same program in assembly, here is a version that can be assembled by `z80asm` and loaded into the Altair:

```
 ORG 0000H
START: LD A,(80H) ;Load from address 128.
 LD B,A ;Move loaded value from accumulator (A) to reg B.
 LD A,(81H) ;Load from address 129.
 ADD A,B ;Add A and B.
 LD (82H),A ;Store A at address 130.
 JP START ;Jump to start.
```

You can turn this into something called an Intel HEX file by invoking the assembler like so (after you have compiled it):

```
$ ./z80asm -fh -oadd.hex add.asm
```

The `-f` flag, here taking `h` as an argument, specifies that a HEX file should be output. You can then load the program into the Altair by passing the HEX file in using the `-x` flag:

```
$ ./altairsim -x add.hex
```

This sets up the first 14 words in memory as if you had input the values manually via the switches. Instead of doing all that again, you can just run the program by using the “RUN” switch as before. Much easier!

As I said, I don’t think many Altair users wrote software this way. Once Altair BASIC became available, writing BASIC programs was probably the easiest way to program the Altair. z80pack also includes several HEX files containing different versions of Altair BASIC; the one I’ve been able to get working is version 4.0 of 4K BASIC, which you can load into the simulator like so:

```
$ ./altairsim -x basic4k40.hex
```

If you turn the simulated machine on and hit the “RUN” switch, you should see that BASIC has started talking to you in your terminal window. It first prompts you to enter the amount of memory you have available, which should be 4000 bytes. It then asks you a few more questions before presenting you with the “OK” prompt, which Gates and Allen used instead of the standard “READY” to save memory. From there, you can just use BASIC:

```
OK
PRINT 3 + 4
 7
```

Though running BASIC with only 4kb of memory didn’t give you a lot of room, you can see how it would have been a significant step up from using the front panel.

The Altair, of course, was nowhere near as capable as the home desktops and laptops we have available to us today. Even something like the Macintosh, released less than a decade later, seems like a quantum leap forward over the spartan Altair. But to those first Popular Electronics readers that bought the kit and assembled it, the Altair was a real, fully capable computer that they could own for themselves, all for the low cost of $400 and half the surface space of the credenza. This would have been an amazing thing for people that had thus far only been able to interact with computers by handing [a stack of cards][10] or a roll of tape to another human being entrusted with the actual operation of the computer. Subsequent microcomputers would improve upon what the Altair offered and quickly become much easier to use, but they were all, in some sense, just more complicated Altairs. The Altair—almost Brutalist in its minimalism—was the bare-essentials blueprint for all that would follow.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][11] on Twitter or subscribe to the [RSS feed][12] to make sure you know when a new post is out.

Previously on TwoBitHistory…

> "I invite you to come along with me on an exciting journey and spend the next ten minutes of your life learning about a piece of software nobody has used in the last decade." <https://t.co/R9zA5ibFMs>
>
> — TwoBitHistory (@TwoBitHistory) [July 7, 2018][13]

--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/07/22/dawn-of-the-microcomputer.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://www.americanradiohistory.com/Archive-Poptronics/70s/1974/Poptronics-1974-12.pdf
[2]: https://www.americanradiohistory.com/Archive-Poptronics/70s/1975/Poptronics-1975-01.pdf
[3]: https://twobithistory.org/images/jan1975-altair.jpg
[4]: https://twobithistory.org/2017/12/02/simulating-the-altair.html
[5]: https://www.youtube.com/watch?v=qv5b1Xowxdk
[6]: https://www.autometer.de/unix4fun/z80pack/altair.png
[7]: http://www.classiccmp.org/dunfield/altair/d/88opman.pdf
[8]: https://www.youtube.com/watch?v=suyiMfzmZKs
[9]: https://www.americanradiohistory.com/Archive-Poptronics/70s/1975/Poptronics-1975-02.pdf
[10]: https://twobithistory.org/2018/06/23/ibm-029-card-punch.html
[11]: https://twitter.com/TwoBitHistory
[12]: https://twobithistory.org/feed.xml
[13]: https://twitter.com/TwoBitHistory/status/1015647820353867776?ref_src=twsrc%5Etfw
