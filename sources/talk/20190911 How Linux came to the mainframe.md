[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Linux came to the mainframe)
[#]: via: (https://opensource.com/article/19/9/linux-mainframes-part-1)
[#]: author: (Elizabeth K. Joseph https://opensource.com/users/pleia2https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/jhibbetshttps://opensource.com/users/jimmyolano)

How Linux came to the mainframe
======
Linux's emergence on the mainframe is indebted to the external developer
community working with IBM.
![Person typing on a 1980's computer][1]

Despite my 15 years of experience in the Linux infrastructure space, if you had asked me a year ago what a mainframe was, I'd be hard-pressed to give a satisfying technical answer. I was surprised to learn that the entire time I'd been toiling away on x86 machines in various systems administration roles, Linux was running on the s390x architecture for mainframes. In fact, 2019 marks 20 years of IBM's involvement in Linux on the mainframe, with purely community efforts predating that by a year.

### What is a mainframe?

You can think of a mainframe as a big, enterprise-grade server. Everything from the custom s390x CPUs to memory and power, coupled with external storage arrays, is highly redundant and even built to survive earthquakes (check out the [z13 Earthquake Shake Test][2] on YouTube). Built-in hardware-based encryption allows for end-to-end encryption of your data without taking general processing power away from your workloads. Essentially, if you want your workloads and data to be safe and secure, it still makes sense to invest in a mainframe.

The traditional mainframe operating system is z/OS, which has a long history and still gets regular releases to add functionality, security, and stability. The [Open Mainframe Project][3] hosts a collection of open source projects, largely built around z/OS, to further modernize the platform. This includes [Zowe][4], which brings modern API, shell, automation, and scripting tooling to the mainframe. Systems administrators who are looking at mainframes now have a modern, familiar toolset to work with. Add support for Linux in the mix? Suddenly you have an incredibly powerful addition to infrastructure, and it supports all the tools you're familiar with.

### The origins of Linux on the mainframe

To get a real picture of how Linux got to the mainframe, I'll take you back in time. The first IBM mainframe, the IBM System/360, was introduced in 1964. Before this, computers were purpose-built for specific clients and industries. The S/360 was built to be a multi-purpose computer, able to cover a variety of computing needs across industries. Fast-forward to 1972, and we have what's really a pivotal moment in modern computing: the introduction of VM/370.

VM stands for the same thing it means today, virtual machine, and this was the first virtualization technology for the mainframe. Time-sharing on the mainframe had been an idea in whitepapers dating back to the 1950s, but VM/370 brought that to another level. If you're interested in why this was revolutionary and the technical history of the components and teams that made this happen, read Melinda Varian's fascinating article _[VM and the VM Community: Past, Present, and Future][5]_.

As a long-time open source enthusiast, I found one of the most interesting things about the development of the VM was how community-driven it was. People from various universities and companies outside IBM were driving the efforts and giving their feedback to IBM to push development forward. While learning about the history, I identified key people inside IBM—I would call them the first developer advocates—who went out of their way to support external developers on the platform and advocate for their needs internally to drive change at IBM.

Fast-forward to 1994, and we reach another milestone that helped pave the way for Linux on the mainframe: experimental TCP/IP support in VMs. Mainframes have supported a series of network-type interfaces; TCP/IP was just one, but for the purposes of porting Linux to the mainframe, it was a key one.

It was 1998 when a fellow named Linas Vepstas started the "Bigfoot" effort to see if he could get Linux running on a mainframe using a VM. I love this part of the history, partially because it goes back to the community driving development, but also because of his [_Why port Linux to the mainframe?_][6] page. His first four points really spoke to me as an infrastructure geek:

  * Stunt
  * To learn
  * Because it's there
  * Because it's knarly, duude!



Linas fleshes these points out—and reading them showed me immediately that I had found a kindred spirit. His list continues into more practical things: I/O, address spaces and access lists, VM, and the business model. But given how he orders his points, I think I know where his real motivations are.

But when did IBM join in and offer official support? I'll explain next week in part two of this history.

We got a chance to send a few questions to Jim Zemlin, executive director of the Linux Foundation...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/linux-mainframes-part-1

作者：[Elizabeth K. Joseph][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pleia2https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/jhibbetshttps://opensource.com/users/jimmyolano
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://www.youtube.com/watch?v=kmMn5Q_lnkk
[3]: https://www.openmainframeproject.org/
[4]: https://www.openmainframeproject.org/projects/zowe
[5]: http://www.leeandmelindavarian.com/Melinda/25paper.pdf
[6]: https://linas.org/linux/i370-why.html
