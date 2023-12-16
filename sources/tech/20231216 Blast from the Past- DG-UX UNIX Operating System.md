[#]: subject: "Blast from the Past: DG/UX UNIX Operating System"
[#]: via: "https://itsfoss.com/dg-ux-os/"
[#]: author: "Bill Dyer https://itsfoss.com/author/bill/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Blast from the Past: DG/UX UNIX Operating System
======

I tried looking up some information on an old operating system I used to work with: [DG/UX][1]. Sadly, there isn't a lot of information about it anymore. I loved that little operating system, and while I am sure that my experiences will not make history at all, I wanted to add some written account of my experiences with it for the historical record.

Developed by [Data General][2], DG/UX was a [Unix][3] [operating system][4] for its [Eclipse MV][5] minicomputer line, and later the [AViiON][6] workstations and servers. I never worked on the Eclipse systems, but I worked on the AViiON systems. Built like tanks, they were and amazingly simple to use.

![Data General AV/4000 | Picture copyright WolfeDen.org][7]

### OS Overview

I was introduced to DG/UX in the mid 1990s, but it had been around for a while. DG/UX 1 was released in March, 1985 and, was based on [UNIX System V][8] Release 2 with additions from [4.1BSD][9]. DG/UX 3.10 came around a couple of years later with [TCP/IP][10] networking, [NFS][11] and the [X Window System][12] included. Remember [CDE][13]?

![CDE \(Common Desktop Environment\)][14]

![][15]

DG/UX 4 (the "4" would later confuse me to no end later on...) was released in 1988, and was a major re-design of the system, based on [System V Release 3][16]. The filesystem, using the logical disk facility, could span multiple disks.

DG/UX 5.4 was a biggie. This was the version I started working with. This version replaced the legacy Unix file buffer cache with unified, demand paged virtual memory management.

The operating system was also more complete than some other Unix variants; for example, the operating system included a full [C][17] compiler. We also had an army of [COBOL][18] programmers, but if I remember correctly, COBOL was an add-on. Today, a C compiler may seem to be a given, but it was a blessing back in the day. While I wrote scripts for many of my admin tasks, I did write several C programs specific to the work required.

The OS was small and compact, but extremely easy to use. The System V and added BSD tools were the right mix - the best of both worlds, you could say. It was simple and easy to install or upgrade and did not need much resources of memory or processing power.

The [volume manager][19] built into the OS was simple, but very powerful. Any disk administration could be performed online, without taking any file system offline. Again, in an insurance/risk management shop, this was important. We could extend, relocate, mirror, or shrink - and the same functions could be performed on the swap area, allowing in-place migrations of disk storage without downtime.

### The Machines

The AViiON machines I worked on, came in two types: One was an AV300 [pizza box][20] workstation and the other was the AV9500 server with [CLARiiON][21] disk arrays.

![Data General AViiON AV/300D came in Pizza Box style | Picture Credit Pizza Box Computer][22]

On the AViiON, DG/UX supported [multiprocessors][23]. Working in an insurance/risk management shop, this was a huge plus. Not every Unix package supported this. DG/UX also worked seamlessly with the CLARiiON arrays.

Having raids, like the CLARiiON, it was easy to allocate space for certain accounts, but a previous administrator would "use first available space" when creating accounts. It didn't take long to run into problems with this approach: a single query could cause the lights on all 125 disks to light up - an account's data was spread across the entire set of arrays.

![By Michael Moll - photo taken by Michael Moll, CC BY 2.5, https://commons.wikimedia.org/w/index.php?curid=512844][24]

Once I took over as senior administrator, I set about correcting the problem by assigning an array to certain large accounts and smaller accounts grouped onto two arrays. It took about a week of night work to do, but DG/UX made the rearranging of files to specifically assigned arrays, easy.

The raids themselves were rock solid too. At one time, we had IBM 1GB disks. The mechanisms in these disks had a habit of sticking and the only way to get them to work again was to remove them and spin them on the floor like a top (I'm serious!). Once in a while, the disk was beyond hope and would never spin again. Now, the raid makes copies of each disk across its array, so the data was still present, although efficiency was lost. Once, I had to "borrow" a disk from another computer to keep an array running until a replacement could be obtained. The CLARiiON handled it superbly for the day. Rather than test our luck further, we replaced every disk. - and the DG/UX backup/restore utility made that work seamless as well.

### Support

There is not much to say about support except that it was fantastic. I had never had a problem with support. Every question I had was answered courteously and always accurately. That's something not seen today.

Remember the "4" I mentioned earlier, that would confuse me later? I called support on that. In 1995, I received the operating system upgrade tapes for the OS. Now, we had been running 5.4. I was surprised to see 4.10 tapes. I thought this was an error and that I was sent the wrong set of tapes; I didn't want to be downgraded.

As it turned out, I did have the right tapes. The "4" was a nod to the System V Release **4** update. I sometimes still think that it was odd - upgrading an OS while backing off the version number. Here's a short list of versions to illustrate:

  1. DG/UX 5.4 - 3.00 - Jan '94
  2. DG/UX 5.4 - 3.10 - Jul '94
  3. DG/UX 5.4 - 4.00 - Jan '95
  4. DG/UX - **4.10** \- Aug '95
  5. DG/UX - **4.11** \- Dec '95



### The End of DG/UX and AViiON

I transferred out of the shop at the end of '95 but I heard that [EMC][25] bought Data General, around the turn of the century, in order to get their hands on the CLARiiON arrays and software. Considering how solid the CLARiiON was, I cannot say that I blame them. If I remember the reports correctly, EMC did support the DG/UX OS and AViiONs for a couple of years, and then dropped them. A part of me wishes that they had kept the OS, but at that time, bigger companies, such as [IBM][26], [Sun Microsystems][27], and [HP][28], were calling the shots in the Unix world. Also, let's not forget the rise of [Linux][29] which would become popular.

Data General and DG/UX certainly had a good run. Excellent support and operating system - a combination not easily matched today. I certainly enjoyed that operating system and it is definitely one to be remembered.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dg-ux-os/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://archive.org/details/installing_the_dgux_system
[2]: https://en.wikipedia.org/wiki/Data_General
[3]: https://en.wikipedia.org/wiki/Unix
[4]: https://en.wikipedia.org/wiki/Operating_system
[5]: https://en.wikipedia.org/wiki/Eclipse_MV
[6]: https://en.wikipedia.org/wiki/Aviion
[7]: https://itsfoss.com/content/images/2023/12/data-general-avion.jpg
[8]: https://en.wikipedia.org/wiki/UNIX_System_V
[9]: https://en.wikipedia.org/wiki/BSD
[10]: https://en.wikipedia.org/wiki/TCP/IP
[11]: https://en.wikipedia.org/wiki/Network_File_System
[12]: https://en.wikipedia.org/wiki/X_Window_System
[13]: https://itsfoss.com/common-desktop-environment/
[14]: https://itsfoss.com/content/images/wordpress/2021/12/cde_desktop-4.jpg
[15]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[16]: https://en.wikipedia.org/wiki/System_V_Release_3
[17]: https://en.wikipedia.org/wiki/C_(programming_language)
[18]: https://en.wikipedia.org/wiki/COBOL
[19]: https://en.wikipedia.org/wiki/Logical_volume_management
[20]: https://en.wikipedia.org/wiki/Pizza_box_form_factor
[21]: https://en.wikipedia.org/wiki/Clariion
[22]: https://itsfoss.com/content/images/2023/12/aviion-av300-front--1-.jpg
[23]: https://en.wikipedia.org/wiki/Multiprocessor
[24]: https://itsfoss.com/content/images/2023/12/EMC_Clariion_CX500.jpg
[25]: https://en.wikipedia.org/wiki/EMC_Corporation
[26]: https://en.wikipedia.org/wiki/IBM
[27]: https://en.wikipedia.org/wiki/Sun_Microsystems
[28]: https://en.wikipedia.org/wiki/Hewlett-Packard
[29]: https://www.linux.com/what-is-linux/
