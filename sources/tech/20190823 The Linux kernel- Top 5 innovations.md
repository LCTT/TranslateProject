[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Linux kernel: Top 5 innovations)
[#]: via: (https://opensource.com/article/19/8/linux-kernel-top-5-innovations)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/mhaydenhttps://opensource.com/users/mralexjuarez)

The Linux kernel: Top 5 innovations
======
Want to know what the actual (not buzzword) innovations are when it
comes to the Linux kernel? Read on.
![Penguin with green background][1]

The word _innovation_ gets bandied about in the tech industry almost as much as _revolution_, so it can be difficult to differentiate hyperbole from something that’s actually exciting. The Linux kernel has been called innovative, but then again it’s also been called the biggest hack in modern computing, a monolith in a micro world.

Setting aside marketing and modeling, Linux is arguably the most popular kernel of the open source world, and it’s introduced some real game-changers over its nearly 30-year life span.

### Cgroups (2.6.24)

Back in 2007, Paul Menage and Rohit Seth got the esoteric [_control groups_ (cgroups)][2] feature added to the kernel (the current implementation of cgroups is a rewrite by Tejun Heo.) This new technology was initially used as a way to ensure, essentially, quality of service for a specific set of tasks.

For example, you could create a control group definition (cgroup) for all tasks associated with your web server, another cgroup for routine backups, and yet another for general operating system requirements. You could then control a percentage of resources for each cgroup, such that your OS and web server gets the bulk of system resources while your backup processes have access to whatever is left.

What cgroups has become most famous for, though, is its role as the technology driving the cloud today: containers. In fact, cgroups were originally named [process containers][3]. It was no great surprise when they were adopted by projects like [LXC][4], [CoreOS][5], and Docker.

The floodgates being opened, the term _containers_ justly became synonymous with Linux, and the concept of microservice-style cloud-based “apps” quickly became the norm. These days, it’s hard to get away from cgroups, they’re so prevalent. Every large-scale infrastructure (and probably your laptop, if you run Linux) takes advantage of cgroups in a meaningful way, making your computing experience more manageable and more flexible than ever.

For example, you might already have installed [Flathub][6] or [Flatpak][7] on your computer, or maybe you’ve started using [Kubernetes][8] and/or [OpenShift][9] at work. Regardless, if the term “containers” is still hazy for you, you can gain a hands-on understanding of containers from [Behind the scenes with Linux containers][10].

### LKMM (4.17)

In 2018, the hard work of Jade Alglave, Alan Stern, Andrea Parri, Luc Maranget, Paul McKenney, and several others, got merged into the mainline Linux kernel to provide formal memory models. The Linux Kernel Memory [Consistency] Model (LKMM) subsystem is a set of tools describing the Linux memory coherency model, as well as producing _litmus tests_ (**klitmus**, specifically) for testing.

As systems become more complex in physical design (more CPU cores added, cache and RAM grow, and so on), the harder it is for them to know which address space is required by which CPU, and when. For example, if CPU0 needs to write data to a shared variable in memory, and CPU1 needs to read that value, then CPU0 must write before CPU1 attempts to read. Similarly, if values are written in one order to memory, then there’s an expectation that they are also read in that same order, regardless of which CPU or CPUs are doing the reading.

Even on a single CPU, memory management requires a specific task order. A simple action such as **x = y** requires a CPU to load the value of **y** from memory, and then store that value in **x**. Placing the value stored in **y** into the **x** variable cannot occur _before_ the CPU has read the value from memory. There are also address dependencies: **x[n] = 6** requires that **n** is loaded before the CPU can store the value of six.

LKMM helps identify and trace these memory patterns in code. It does this in part with a tool called **herd**, which defines the constraints imposed by a memory model (in the form of logical axioms), and then enumerates all possible outcomes consistent with these constraints.

### Low-latency patch (2.6.38)

Long ago, in the days before 2011, if you wanted to do "serious" [multimedia work on Linux][11], you had to obtain a low-latency kernel. This mostly applied to [audio recording][12] while adding lots of real-time effects (such as singing into a microphone and adding reverb, and hearing your voice in your headset with no noticeable delay). There were distributions, such as [Ubuntu Studio][13], that reliably provided such a kernel, so in practice it wasn't much of a hurdle, just a significant caveat when choosing your distribution as an artist.

However, if you weren’t using Ubuntu Studio, or you had some need to update your kernel before your distribution got around to it, you had to go to the rt-patches web page, download the kernel patches, apply them to your kernel source code, compile, and install manually.

And then, with the release of kernel version 2.6.38, this process was all over. The Linux kernel suddenly, as if by magic, had low-latency code (according to benchmarks, latency decreased by a factor of 10, at least) built-in by default. No more downloading patches, no more compiling. Everything just worked, and all because of a small 200-line patch implemented by Mike Galbraith.

For open source multimedia artists the world over, it was a game-changer. Things got so good from 2011 on that in 2016, I challenged myself to [build a Digital Audio Workstation (DAW) on a Raspberry Pi v1 (model B)][14] and found that it worked surprisingly well.

### RCU (2.5)

RCU, or Read-Copy-Update, is a system defined in computer science that allows multiple processor threads to read from shared memory. It does this by deferring updates, but also marking them as updated, to ensure that the data’s consumers read the latest version. Effectively, this means that reads happen concurrently with updates.

The typical RCU cycle is a little like this:

  1. Remove pointers to data to prevent other readers from referencing it.
  2. Wait for readers to complete their critical processes.
  3. Reclaim the memory space.



Dividing the update stage into removal and reclamation phases means the updater performs the removal immediately while deferring reclamation until all active readers are complete (either by blocking them or by registering a callback to be invoked upon completion).

While the concept of read-copy-update was not invented for the Linux kernel, its implementation in Linux is a defining example of the technology.

### Collaboration (0.01)

The final answer to the question of what the Linux kernel innovated will always be, above all else, collaboration. Call it good timing, call it technical superiority, call it hackability, or just call it open source, but the Linux kernel and the many projects that it enabled is a glowing example of collaboration and cooperation.

And it goes well beyond just the kernel. People from all walks of life have contributed to open source, arguably _because_ of the Linux kernel. The Linux was, and remains to this day, a major force of [Free Software][15], inspiring users to bring their code, art, ideas, or just themselves, to a global, productive, and diverse community of humans.

### What’s your favorite innovation?

This list is biased toward my own interests: containers, non-uniform memory access (NUMA), and multimedia. I’ve surely left your favorite kernel innovation off the list. Tell me about it in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-kernel-top-5-innovations

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/mhaydenhttps://opensource.com/users/mralexjuarez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://en.wikipedia.org/wiki/Cgroups
[3]: https://lkml.org/lkml/2006/10/20/251
[4]: https://linuxcontainers.org
[5]: https://coreos.com/
[6]: http://flathub.org
[7]: http://flatpak.org
[8]: http://kubernetes.io
[9]: https://www.redhat.com/sysadmin/learn-openshift-minishift
[10]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[11]: http://slackermedia.info
[12]: https://opensource.com/article/17/6/qtractor-audio
[13]: http://ubuntustudio.org
[14]: https://opensource.com/life/16/3/make-music-raspberry-pi-milkytracker
[15]: http://fsf.org
