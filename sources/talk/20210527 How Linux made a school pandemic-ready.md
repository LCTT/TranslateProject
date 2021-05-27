[#]: subject: (How Linux made a school pandemic-ready)
[#]: via: (https://opensource.com/article/21/5/linux-school-servers)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How Linux made a school pandemic-ready
======
By going all-in on Linux, teacher Robert Maynord ensured his school was
ready for remote learning—even before it needed to be.
![Digital images of a computer desktop][1]

More than 20 years ago, when [Robert Maynord][2] started teaching at [Immaculate Heart of Mary School][3] in Monona, Wisconsin, the school had only eight functioning computers, all running Windows 95. Through his expertise in and enthusiasm for Linux and open source software, Robert has transformed the school community, its faculty, and its students, who are in kindergarten to eighth grade.

"In those early years, it quickly became apparent that paying license fees to Microsoft for each computer, in addition to purchasing all the software to install, was absurd when the computer itself was only worth $20," says Robert. So he began installing Linux on the school's computers.

Robert holds a PhD in education with an emphasis on technology for twice-exceptional children. I was eager to learn more about him and his work, so I asked for the opportunity to interview him. The following email conversation has been edited slightly for grammar and clarity.

**Don Watkins: What got you interested in Linux?**

**Robert Maynord**: My first experiences with computers involved an Amiga 1000, which I used to edit videos and create a four-color magazine. I was always amused by my Apple Mac friends who bragged about having the new orange screens when I was working with 1,024 colors. The [Amiga was a gaming machine][4], and the community reflected an open, exploratory attitude with people making parts and programs in garages and selling them in small quantities through the mail. When the Amiga was no longer available and Linux was becoming more popular, it was the next logical step for me—for philosophical reasons more than financial concerns—to enter the world of open source technology.

A few years later, I was working in several schools as a consultant, repairing non-working machines and modifying Macs so that they could communicate with Windows computers. I was hired by one of the schools to teach computers and get their lab working. They had eight Windows 95 machines, and three of them worked. Their budget was essentially zero. I acquired a few donated machines from a local non-profit and soon discovered that the operating systems and software would cost far more than what the old computers were worth. At this point, I fully committed to the world of Linux—the only possible way to get our school up and running.

**DW: What first steps did you take?**

**RM**: My first steps involved experimenting with various distributions, including Debian and Red Hat. This was pre-RHEL and pre-Fedora. Linux required a significant amount of work to be made useful on our diverse, recycled machines. When the school finally dropped their dial-up modems and began to use Ethernet cards, it was a substantial improvement. The advent of multiple distributions over time greatly added to the overall usability of Linux, especially when the desktop user interface improved. After 2005, we began to look more closely at the emerging Ubuntu distribution because its rapid growth in popularity and the distributions built on it meant that installation on a diversity of machines was more predictable.

**DW: How has using Linux and open source benefited the school, other than lowering the total cost of ownership?**

**RM**: The school has greatly benefited from using Linux and open source systems because it has allowed a closer integration of technology with the daily needs of classroom teachers and administration. When a new system or implementation is needed, we do not contract with an outside service provider; we can do almost everything in-house. For example, when we needed online video interaction with our distance-learning students because of COVID-19, I set up a [BigBlueButton server that integrated well with Moodle][5]. Another example is our phone system. The phones are all digital, connecting through a CAT-6A network. They communicate to our trunk and outside lines through a FreePBX server running Linux. The wiring, phone setup, and server setup were all done internally, and if there is a problem, it is solved quickly, with no "service call" required.

It is also important to emphasize that, as a school, we collect a large amount of data on students and teachers. We are in full charge of the ownership of this data, and it is not turned over to Google or any other large data-mining companies. This places the school in much closer agreement to the spirit of COPPA (Children's Online Privacy Protection Act), allowing us to shield students from being tracked, and preventing any permanent long-term profile from being built from their activities. Since we work with K-8 children, this consistent protection of their privacy remains central and essential.

**DW: What hardware are you using as servers? Where do you get them?**

**RM**: We are currently using a range of servers, some being custom-built for us by a local computer shop. Several of our servers are older, donated by corporate recycling programs, but a few of them are newer with SSD drives. In general, we have maintained the stance of using less-expensive hardware rather than making large investments every three years. We are a small parochial school with around 200 students, and so our budget is defined accordingly. However, we are receiving a large amount of funding in the near future from federal COVID Relief Funds. This funding will allow us to replace dated netbooks and other hardware. About half of our netbooks are Acer C720Ps, and half are Dell 3189s. All the netbooks run GalliumOS and have a full suite of programs, including [Epoptes][6], where teachers can directly monitor students' use of time. In addition to desktops, teachers all have Dell E6420 laptops with cameras so that synchronous online students can be video connected throughout the day. On the smaller size of the hardware spectrum, we are implementing Linux-based Raspberry Pi computers for the students to learn game emulation, robot construction, and programming or coding.

**DW: What whiteboard software are you using with Linux?**

**RM**: We have evolved through several whiteboard systems, including Promethean and Smart. However, the delay in upgrades for those systems proved to be too discouraging for the teachers. At this point, most of our teachers simply use an Ubuntu desktop on their whiteboards, controlled with a wireless mouse and keyboard. Since the whiteboards have the same [Nextcloud][7] local folders on the desktops, teachers can prepare their presentations on their laptops or desktops and have them immediately available on the whiteboards.

In addition to the projector-based whiteboards, we have one Clevertouch board for use in the library. The Clevertouch board is a touch screen and Linux compatible, displaying a Linux desktop. Dell also has a selection of Linux-compatible touch screens, which we are considering. When mounted on portable supports, touch screens have the advantage of being movable throughout the classroom.

**DW: What are the advantages of using open source software for instruction as opposed to proprietary software?**

**RM**: Far and away, the most important benefit of using open source software is that both teachers and students are learning technological skills in a broad framework, rather than narrowly based on brand names and marketing strategies. We all remember the days when a teacher, when asked about using a computer, would respond, "I took a workshop in Word." Then there were the days when the Oregon Trail was the cutting edge of educational instruction. Both students and teachers benefit greatly when they learn that there are many different browsers rather than just "the internet." Likewise, there are very important reasons to know about Duck Duck Go and Brave, rather than defaulting to "search Google."

**DW: What advantages do your students and faculty have as a result of using open source software?**

**RM**: Because we use open source software, we have the singular advantage of addressing technology directly as skilled users with students and faculty and not simply as consumers. Technology is clearly a central, integrated part of our world, essential to how we live, and we each carry the responsibility for how it is used. We can and should be much more than passive consumers. Just like all aspects of life, technology has issues of ethics and justice that we must struggle with for the good of all. To do less would be to abdicate our responsibility to society. I know of at least two schools that have recently "retired" their computer teachers in favor of a complete turnover of school-related technology to Google Classrooms. In other words, students will be taught that Google Docs is synonymous with computing. This is, in my opinion, a terrible loss. The schools have abdicated their responsibility for a broad education, replacing it with "convenience." Hopefully, over time, educators will realize the importance and advantage of a technologically well-educated population for society as a whole.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/linux-school-servers

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://twitter.com/robertmaynord
[3]: https://www.ihmcatholicschool.org/
[4]: https://opensource.com/article/19/3/amiga-raspberry-pi
[5]: https://opensource.com/article/21/3/moodle-plugins
[6]: https://epoptes.org/
[7]: https://nextcloud.com/
