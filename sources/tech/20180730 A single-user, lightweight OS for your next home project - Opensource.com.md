A single-user, lightweight OS for your next home project | Opensource.com
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/robot_arm_artificial_ai.png?itok=8CUU3U_7)

What on earth is RISC OS? Well, it's not a new kind of Linux. And it's not someone's take on Windows. In fact, released in 1987, it's older than either of these. But you wouldn't necessarily realize it by looking at it.

The point-and-click graphic user interface features a pinboard and an icon bar across the bottom for your active applications. So, it looks eerily like Windows 95, eight years before it happened.

This OS was originally written for the [Acorn Archimedes][1] . The Acorn RISC Machines CPU in this computer was completely new hardware that needed completely new software to run on it. This was the original operating system for the ARM chip, long before anyone had thought of Android or [Armbian][2]

And while the Acorn desktop eventually faded to obscurity, the ARM chip went on to conquer the world. And here, RISC OS has always had a niche—often in embedded devices, where you'd never actually know it was there. RISC OS was, for a long time, a completely proprietary operating system. But in recent years, the owners have started releasing the source code to a project called [RISC OS Open][3].

### 1\. You can install it on your Raspberry Pi

The Raspberry Pi's official operating system, [Raspbian][4], is actually pretty great (but if you aren't interested in tinkering with novel and different things in tech, you probably wouldn't be fiddling with a Raspberry Pi in the first place). Because RISC OS is written specifically for ARM, it can run on all kinds of small-board computers, including every model of Raspberry Pi.

### 2\. It's super lightweight

The RISC OS installation on my Raspberry Pi takes up a few hundred megabytes—and that's after I've loaded dozens of utilities and games. Most of these are well under a megabyte.

If you're really on a diet, the RISC OS Pico will fit on a 16MB SD card. This is perfect if you're hacking something to go in an embedded system or IoT project. Of course, 16MB is actually a fair bit more than the 512KB ROM chip squeezed into the old Archimedes. But I guess with 30 years of progress in memory technology, it's okay to stretch your legs just a little a bit.

### 3\. It's excellent for retro gaming

When the Archimedes was in its prime, the ARM CPU was several times faster than the Motorola 68000 in the Apple Macintosh and Commodore Amiga, and it totally smoked that new 386, too. This made it an attractive platform for game developers who wanted to strut their stuff with the most powerful desktop computer on the planet.

Many of the rights holders to these games have been generous enough to give permission for hobbyists to download their old work for free. And while RISC OS and the hardware has moved on, with a very small amount of fiddling you can get them to run.

If you're interested in exploring this, [here's a guide][5] to getting these games working on your Raspberry Pi.

### 4\. It's got BBC BASIC

Press F12 to go to the command line, type `*BASIC`, and you get a full BBC BASIC interpreter, just like the old days.

For those who weren't around for it in the 80s, let me explain: BBC BASIC was the first ever programming language for so many of us back in the day, for the excellent reason that it was specifically designed to teach children how to code. There were mountains of books and magazine articles that taught us to code our own simple but highly playable games.

Decades later, coding your own game in BBC BASIC is still a great project for a technically minded kid who wants something to do during school holidays. But few kids have a BBC micro at home anymore. So what should they run it on?

Well, there are interpreters you can run on just about every home computer, but that's not helpful when someone else needs to use it. So why not a Raspberry Pi with RISC OS installed?

### 5\. It's a simple, single-user operating system

RISC OS is not like Linux, with its user and superuser access. It has one user who has full access to the whole machine. So it's probably not the best daily driver to deploy across an enterprise, or even to give to granddad to do his banking. But if you're looking for something to hack and tinker with, it's absolutely fantastic. There isn't all that much between you and the bare metal, so you can just tuck right in.

### Further reading

If you want to learn more about this operating system, check out [RISC OS Open][3], or just flash an image to a card and start using it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/gentle-intro-risc-os

作者：[James Mawson][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dxmjames
[1]:https://en.wikipedia.org/wiki/Acorn_Archimedes
[2]:https://www.armbian.com/
[3]:https://www.riscosopen.org/content/
[4]:https://www.raspbian.org/
[5]:https://www.riscosopen.org/wiki/documentation/show/Introduction%20to%20RISC%20OS
