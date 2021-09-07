[#]: subject: "Neither Windows, nor Linux! Shrine is ‘God’s Operating System’"
[#]: via: "https://itsfoss.com/shrine-os/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Neither Windows, nor Linux! Shrine is ‘God’s Operating System’
======

We’ve all used multiple operating systems in our lives. Some were good and some were bad. But can you say that you’ve ever used an operating system designed by God? Today, I’d like to introduce you to Shrine.

### What is Shrine?

![Shrine interface][1]

From that introduction, you’re probably wondering what the heck is going on. Well, it all started with a guy named Terry Davis. Before we go any further, I’d better warn you that Terry suffered from schizophrenia during his life and often didn’t take his medication. Because of this, he said or did things during his life that were not quite socially acceptable.

Anyway, back to the story line. In the early 2000s, Terry released a simple operating system. Over the years, it went through several names, including J Operating System, LoseThos, and SparrowOS. He finally settled on the name [TempleOS][2]. He chose that name because this operating system would be God’s temple. As such. God gave Terry the following [specifications][3] for the operating system:

  * It would have 640×480 16 color graphics
  * It would use “a single-voice 8-bit signed MIDI-like sample for sound”.
  * It would follow the Commodore 64, i.e. “a non-networked, simple machine where programming was the goal, not just a means to an end”.
  * It would only support one file system (named “Red Sea”).
  * It would be limited to 100,000 lines of code to make it “easy to learn the whole thing”.
  * “Ring-0-only. Everything runs in kernel mode, including user applications”
  * The font would be limited to “one 8×8 fixed-width font”.
  * The use would have “full access to everything. All memory, I/O ports, instructions, and similar things must never be off limits. All functions, variables and class members will be accessible.”
  * It would only support one platform, 64-bit PCs.



Terry wrote this operating system using in a programming language that he called HolyC. TechRepublic called it a “modified version of C++ (“more than C, less than C++”)”. If you are interested in getting a flavor of HolyC, I would recommend, [this article][4] and the HolyC entry on [RosettaCode][5].

In 2013, Terry announced on his website that TempleOS was complete. Tragically, Terry died a few years later in August of 2018 when he was hit by a train. He was homeless at the time. Over the years, many people followed Terry through his work on the operating system. Most were impressed at his ability to write an operating system in such a small package.

Now, you are probably wondering what all this talk of TempleOS has to do with Shrine. Well, as the [GitHub page][6] for Shrine states, it is “A TempleOS distro for heretics”. GitHub user [minexew][7] created Shrine to add features to TempleOS that Terry had neglected. These features include:

  * 99% compatibility with TempleOS programs
  * Ships with Lambda Shell, which feels a bit like a classic Unix command interpreter
  * TCP/IP stack &amp; internet access out of the box
  * Includes a package downloader



minexew is planning to add more features in the future, but hasn’t announced what exactly will be included. He has plans to make a full TempleOS environment for Linux.

### Experience

It’s fairly easy to get Shrine virtualized. All you need to do is install your virtualizing software of choice. (Mine is VirtualBox.) When you create a virtual machine for Shrine, make sure that it is 64-bit and has at least 512 MB of RAM.

Once you boot into Shrine, you will be asked if you want to install to your (virtual) hard drive. Once that is finished (or not, if you choose), you will be offered a tour of the operating system. From there you can explore.

### Final Thoughts

Temple OS and (Shrine) is obviously not intended to be a replacement for Windows or Linux. Even though Terry referred to it as “God’s temple”, I’m sure in his more lucid moments, he would have acknowledged that it was more of a hobby operating system. With that in mind, the finished product is fairly [impressive][8]. Over a twelve-year period, Terry created an operating system in a little over 100,000 lines of code, using a language that he had created himself. He also wrote his own compiler, graphics library and several games. All this while fighting his own personal demons.

--------------------------------------------------------------------------------

via: https://itsfoss.com/shrine-os/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/shrine.jpg?resize=800%2C600&ssl=1
[2]: https://templeos.org/
[3]: https://web.archive.org/web/20170508181026/http://www.templeos.org:80/Wb/Doc/Charter.html
[4]: https://harrisontotty.github.io/p/a-lang-design-analysis-of-holyc
[5]: https://rosettacode.org/wiki/Category:HolyC
[6]: https://github.com/minexew/Shrine
[7]: https://github.com/minexew
[8]: http://www.codersnotes.com/notes/a-constructive-look-at-templeos/
