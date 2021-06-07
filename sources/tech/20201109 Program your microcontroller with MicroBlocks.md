[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Program your microcontroller with MicroBlocks)
[#]: via: (https://opensource.com/article/20/11/microblocks)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Program your microcontroller with MicroBlocks
======
MicroBlocks brings a Scratch-like interface to programming the
Micro:bit, Circuit Playground Express, and other microcontroller boards.
![Computer hardware components, generic][1]

If you like to tinker with technology, you may be familiar with programmable microcontroller boards, such as AdaFruit's [Circuit Playground Express][2] and the [BBC Micro:bit][3]. Now there's a new programming option for you to try: [MicroBlocks][4]. It's a simple Scratch-like programming interface that works well with several microcontrollers, including those two.

I own both the Circuit Playground Express and the BBC Micro:bit and was eager to try MicroBlocks after discovering it on [Twitter][5].

### Install MicroBlocks

To set up MicroBlocks on a Debian-based Linux distribution, [download][6] and install the .deb file. If you use an RPM-based Linux distribution, you can download the Linux [64-bit][7] or [32-bit][8] standalone executable. MicroBlocks also offers installers for [Windows][9], [macOS][10], and [Raspberry Pi][11].

MicroBlocks can also run in a Chrome, Chromium, or Edge [browser][12] using its experimental web platform, which enables special web serial connections. The Chrome web store also has a [browser extension][13] for MicroBlocks.

### Connect your microcontroller

Before you can access your microcontroller on Linux, you must add yourself to your computer's dialout group. Linux uses this group to communicate with serial devices, and if your user account isn't in that group, you won't be able to control your device.

Run the following in a terminal to add yourself to the dialout group:


```
`$ sudo usermod -G dialout -a `whoami``
```

Log out of your desktop and then log back in (or just reboot). Then connect your BBC Micro:bit, Circuit Playground Express, or other microcontroller board to an available USB port on your computer. My [Intel NUC][14] recognized my microcontroller without issue.

After connecting your microcontroller, you may be asked to update the device's firmware. It's safe to do so.

![Update firmware option][15]

(Don Watkins, [CC BY-SA 4.0][16])

Once that's done, you're all ready to go.

### Start programming

Use the programming interface to set what language you want to use when interacting with MicroBlocks.

![MicroBlocks language options][17]

(Don Watkins, [CC BY-SA 4.0][16])

You can verify that your microcontroller is connected by checking the Connect icon on the menu.

![MicroBlocks Connection icon][18]

(Don Watkins, [CC BY-SA 4.0][16])

Now you're ready to start exploring. One of my favorite ways to learn is to tinker with a user interface's different options. What makes MicroBlocks special is that it's a live coding environment, so you get to see changes you make right away.

Try this: Go to the Display category (in the left-hand column) and drag the display array into the scripting area. Use the menu to change A to B in one of them.

Click on a programming block, and your code, simple though it may be, runs immediately on the board.

### Use programming blocks

If you are familiar with [Scratch][19], you are likely to find MicroBlocks extremely easy to use. Students love it because of the instant feedback from the board and the program.

My first program was very simple. I wanted to make a simple "smiley face" on my Micro:bit.

First, I clicked on the Control block and selected: "When button 'a' is pressed."

Then I selected a smiley face from the LED Display library and connected that to the Control block. 

Finally, I pressed Button A on my Micro:bit. Feedback is instantaneous.

![Smiley face displayed on Micro:bit][20]

(Don Watkins, [CC BY-SA 4.0][16])

### Save your code

Saving your program is easy. On the top menu bar, click on the third icon from the left (the document icon). Choose the Save option from the drop-down menu.

![Save file in MicroBlocks][21]

(Don Watkins, [CC BY-SA 4.0][16])

Try experimenting with the interface to program your board however you want. For my second program, I used the Control and LED Display blocks to spell out "Bills," which is my favorite NFL team. But there are lots of other functions available, so try designing something that interests you.

!["Bills" on Micro:Bit][22]

(Don Watkins, [CC BY-SA 4.0][16])

### Do more with MicroBlocks

Be sure to check out the [quickstart][23] guide on the MicroBlocks website for more information. The site also contains [activity guides][24] with easy-to-follow code examples for students and teachers. These will help anyone get started programming the Micro:bit or the Circuit Playground Express with MicroBlocks.

MicroBlocks is fully [open source][25] and released under the [Mozilla Public License 2.0][26].

MicroBlocks is still under active development by the core team, and they're not currently soliciting code contributions or pull requests. However, they are interested in any MicroBlocks tutorials, lesson plans, or examples from the community, so please [contact them][27] if you have something to share.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/microblocks

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/hardware_disk_components.png?itok=W1fhbwYp (Computer hardware components, generic)
[2]: https://opensource.com/article/19/7/circuit-playground-express
[3]: https://opensource.com/article/19/8/getting-started-bbc-microbit
[4]: https://microblocks.fun/
[5]: https://twitter.com/microblocksfun
[6]: https://microblocks.fun/download
[7]: https://microblocks.fun/downloads/latest/standalone/ublocks-linux64bit.zip
[8]: https://microblocks.fun/downloads/latest/standalone/ublocks-linux32bit.zip
[9]: https://microblocks.fun/downloads/latest/packages/microBlocks%20setup.exe
[10]: https://microblocks.fun/downloads/latest/packages/MicroBlocks.app.zip
[11]: https://microblocks.fun/downloads/latest/packages/ublocks-armhf.deb
[12]: https://microblocks.fun/run/microblocks.html
[13]: https://chrome.google.com/webstore/detail/microblocks/cbmcbhgijipgdmlnieolilhghfmnngbb?hl=en
[14]: https://opensource.com/article/20/9/linux-intel-nuc
[15]: https://opensource.com/sites/default/files/uploads/microblocks_update-firmware.png (Update firmware option)
[16]: https://creativecommons.org/licenses/by-sa/4.0/
[17]: https://opensource.com/sites/default/files/uploads/microblocks_set-language.png (MicroBlocks language options)
[18]: https://opensource.com/sites/default/files/uploads/microblocks_connected.png (MicroBlocks Connection icon)
[19]: https://scratch.mit.edu/
[20]: https://opensource.com/sites/default/files/uploads/smileyface.jpg (Smiley face displayed on Micro:bit)
[21]: https://opensource.com/sites/default/files/uploads/microblocks_save.png (Save file in MicroBlocks)
[22]: https://opensource.com/sites/default/files/uploads/microblocks_bills.png ("Bills" on Micro:Bit)
[23]: https://microblocks.fun/learn#getstarted
[24]: https://microblocks.fun/learn#activity_cards
[25]: https://bitbucket.org/john_maloney/smallvm/src/master/
[26]: https://www.mozilla.org/en-US/MPL/2.0/
[27]: https://microblocks.fun/info#contact
