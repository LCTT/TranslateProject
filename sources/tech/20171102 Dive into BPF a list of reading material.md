Dive into BPF: a list of reading material
============================================================

*   [What is BPF?][143]

*   [Dive into the bytecode][144]

*   [Resources][145]
    *   [Generic presentations][23]
        *   [About BPF][1]

        *   [About XDP][2]

        *   [About other components related or based on eBPF][3]

    *   [Documentation][24]
        *   [About BPF][4]

        *   [About tc][5]

        *   [About XDP][6]

        *   [About P4 and BPF][7]

    *   [Tutorials][25]

    *   [Examples][26]
        *   [From the kernel][8]

        *   [From package iproute2][9]

        *   [From bcc set of tools][10]

        *   [Manual pages][11]

    *   [The code][27]
        *   [BPF code in the kernel][12]

        *   [XDP hooks code][13]

        *   [BPF logic in bcc][14]

        *   [Code to manage BPF with tc][15]

        *   [BPF utilities][16]

        *   [Other interesting chunks][17]

        *   [LLVM backend][18]

        *   [Running in userspace][19]

        *   [Commit logs][20]

    *   [Troubleshooting][28]
        *   [Errors at compilation time][21]

        *   [Errors at load and run time][22]

    *   [And still more!][29]

 _~ [Updated][146] 2017-11-02 ~_ 

# What is BPF?

BPF, as in **B**erkeley **P**acket **F**ilter, was initially conceived in 1992 so as to provide a way to filter packets and to avoid useless packet copies from kernel to userspace. It initially consisted in a simple bytecode that is injected from userspace into the kernel, where it is checked by a verifier—to prevent kernel crashes or security issues—and attached to a socket, then run on each received packet. It was ported to Linux a couple of years later, and used for a small number of applications (tcpdump for example). The simplicity of the language as well as the existence of an in-kernel Just-In-Time (JIT) compiling machine for BPF were factors for the excellent performances of this tool.

Then in 2013, Alexei Starovoitov completely reshaped it, started to add new functionalities and to improve the performances of BPF. This new version is designated as eBPF (for “extended BPF”), while the former becomes cBPF (“classic” BPF). New features such as maps and tail calls appeared. The JIT machines were rewritten. The new language is even closer to native machine language than cBPF was. And also, new attach points in the kernel have been created.

Thanks to those new hooks, eBPF programs can be designed for a variety of use cases, that divide into two fields of applications. One of them is the domain of kernel tracing and event monitoring. BPF programs can be attached to kprobes and they compare with other tracing methods, with many advantages (and sometimes some drawbacks).

The other application domain remains network programming. In addition to socket filter, eBPF programs can be attached to tc (Linux traffic control tool) ingress or egress interfaces and perform a variety of packet processing tasks, in an efficient way. This opens new perspectives in the domain.

And eBPF performances are further leveraged through the technologies developed for the IO Visor project: new hooks have also been added for XDP (“eXpress Data Path”), a new fast path recently added to the kernel. XDP works in conjunction with the Linux stack, and relies on BPF to perform very fast packet processing.

Even some projects such as P4, Open vSwitch, [consider][155] or started to approach BPF. Some others, such as CETH, Cilium, are entirely based on it. BPF is buzzing, so we can expect a lot of tools and projects to orbit around it soon…

# Dive into the bytecode

As for me: some of my work (including for [BEBA][156]) is closely related to eBPF, and several future articles on this site will focus on this topic. Logically, I wanted to somehow introduce BPF on this blog before going down to the details—I mean, a real introduction, more developed on BPF functionalities that the brief abstract provided in first section: What are BPF maps? Tail calls? What do the internals look like? And so on. But there are a lot of presentations on this topic available on the web already, and I do not wish to create “yet another BPF introduction” that would come as a duplicate of existing documents.

So instead, here is what we will do. After all, I spent some time reading and learning about BPF, and while doing so, I gathered a fair amount of material about BPF: introductions, documentation, but also tutorials or examples. There is a lot to read, but in order to read it, one has to  _find_  it first. Therefore, as an attempt to help people who wish to learn and use BPF, the present article introduces a list of resources. These are various kinds of readings, that hopefully will help you dive into the mechanics of this kernel bytecode.

# Resources

![](https://qmonnet.github.io/whirl-offload/img/icons/pic.svg)

### Generic presentations

The documents linked below provide a generic overview of BPF, or of some closely related topics. If you are very new to BPF, you can try picking a couple of presentation among the first ones and reading the ones you like most. If you know eBPF already, you probably want to target specific topics instead, lower down in the list.

### About BPF

Generic presentations about eBPF:

*   [_Making the Kernel’s Networking Data Path Programmable with BPF and XDP_][53]  (Daniel Borkmann, OSSNA17, Los Angeles, September 2017):
    One of the best set of slides available to understand quickly all the basics about eBPF and XDP (mostly for network processing).

*   [The BSD Packet Filter][54] (Suchakra Sharma, June 2017): 
    A very nice introduction, mostly about the tracing aspects.

*   [_BPF: tracing and more_][55]  (Brendan Gregg, January 2017):
    Mostly about the tracing use cases.

*   [_Linux BPF Superpowers_][56]  (Brendan Gregg, March 2016):
    With a first part on the use of **flame graphs**.

*   [_IO Visor_][57]  (Brenden Blanco, SCaLE 14x, January 2016):
    Also introduces **IO Visor project**.

*   [_eBPF on the Mainframe_][58]  (Michael Holzheu, LinuxCon, Dubin, October 2015)

*   [_New (and Exciting!) Developments in Linux Tracing_][59]  (Elena Zannoni, LinuxCon, Japan, 2015)

*   [_BPF — in-kernel virtual machine_][60]  (Alexei Starovoitov, February 2015):
    Presentation by the author of eBPF.

*   [_Extending extended BPF_][61]  (Jonathan Corbet, July 2014)

**BPF internals**:

*   Daniel Borkmann has been doing an amazing work to present **the internals** of eBPF, in particular about **its use with tc**, through several talks and papers.
    *   [_Advanced programmability and recent updates with tc’s cls_bpf_][30]  (netdev 1.2, Tokyo, October 2016):
        Daniel provides details on eBPF, its use for tunneling and encapsulation, direct packet access, and other features.

    *   [_cls_bpf/eBPF updates since netdev 1.1_][31]  (netdev 1.2, Tokyo, October 2016, part of [this tc workshop][32])

    *   [_On getting tc classifier fully programmable with cls_bpf_][33]  (netdev 1.1, Sevilla, February 2016):
        After introducing eBPF, this presentation provides insights on many internal BPF mechanisms (map management, tail calls, verifier). A must-read! For the most ambitious, [the full paper is available here][34].

    *   [_Linux tc and eBPF_][35]  (fosdem16, Brussels, Belgium, January 2016)

    *   [_eBPF and XDP walkthrough and recent updates_][36]  (fosdem17, Brussels, Belgium, February 2017)

    These presentations are probably one of the best sources of documentation to understand the design and implementation of internal mechanisms of eBPF.

The [**IO Visor blog**][157] has some interesting technical articles about BPF. Some of them contain a bit of marketing talks.

**Kernel tracing**: summing up all existing methods, including BPF:

*   [_Meet-cute between eBPF and Kerne Tracing_][62]  (Viller Hsiao, July 2016):
    Kprobes, uprobes, ftrace

*   [_Linux Kernel Tracing_][63]  (Viller Hsiao, July 2016):
    Systemtap, Kernelshark, trace-cmd, LTTng, perf-tool, ftrace, hist-trigger, perf, function tracer, tracepoint, kprobe/uprobe…

Regarding **event tracing and monitoring**, Brendan Gregg uses eBPF a lot and does an excellent job at documenting some of his use cases. If you are in kernel tracing, you should see his blog articles related to eBPF or to flame graphs. Most of it are accessible [from this article][158] or by browsing his blog.

Introducing BPF, but also presenting **generic concepts of Linux networking**:

*   [_Linux Networking Explained_][64]  (Thomas Graf, LinuxCon, Toronto, August 2016)

*   [_Kernel Networking Walkthrough_][65]  (Thomas Graf, LinuxCon, Seattle, August 2015)

**Hardware offload**:

*   eBPF with tc or XDP supports hardware offload, starting with Linux kernel version 4.9 and introduced by Netronome. Here is a presentation about this feature:
    [eBPF/XDP hardware offload to SmartNICs][147] (Jakub Kicinski and Nic Viljoen, netdev 1.2, Tokyo, October 2016)

About **cBPF**:

*   [_The BSD Packet Filter: A New Architecture for User-level Packet Capture_][66]  (Steven McCanne and Van Jacobson, 1992):
    The original paper about (classic) BPF.

*   [The FreeBSD manual page about BPF][67] is a useful resource to understand cBPF programs.

*   Daniel Borkmann realized at least two presentations on cBPF, [one in 2013 on mmap, BPF and Netsniff-NG][68], and [a very complete one in 2014 on tc and cls_bpf][69].

*   On Cloudflare’s blog, Marek Majkowski presented his [use of BPF bytecode with the `xt_bpf`module for **iptables**][70]. It is worth mentioning that eBPF is also supported by this module, starting with Linux kernel 4.10 (I do not know of any talk or article about this, though).

*   [Libpcap filters syntax][71]

### About XDP

*   [XDP overview][72] on the IO Visor website.

*   [_eXpress Data Path (XDP)_][73]  (Tom Herbert, Alexei Starovoitov, March 2016):
    The first presentation about XDP.

*   [_BoF - What Can BPF Do For You?_][74]  (Brenden Blanco, LinuxCon, Toronto, August 2016).

*   [_eXpress Data Path_][148]  (Brenden Blanco, Linux Meetup at Santa Clara, July 2016):
    Contains some (somewhat marketing?) **benchmark results**! With a single core:
    *   ip routing drop: ~3.6 million packets per second (Mpps)

    *   tc (with clsact qdisc) drop using BPF: ~4.2 Mpps

    *   XDP drop using BPF: 20 Mpps (<10 % CPU utilization)

    *   XDP forward (on port on which the packet was received) with rewrite: 10 Mpps

    (Tests performed with the mlx4 driver).

*   Jesper Dangaard Brouer has several excellent sets of slides, that are essential to fully understand the internals of XDP.
    *   [_XDP − eXpress Data Path, Intro and future use-cases_][37]  (September 2016):
         _“Linux Kernel’s fight against DPDK”_ . **Future plans** (as of this writing) for XDP and comparison with DPDK.

    *   [_Network Performance Workshop_][38]  (netdev 1.2, Tokyo, October 2016):
        Additional hints about XDP internals and expected evolution.

    *   [_XDP – eXpress Data Path, Used for DDoS protection_][39]  (OpenSourceDays, March 2017):
        Contains details and use cases about XDP, with **benchmark results**, and **code snippets** for **benchmarking** as well as for **basic DDoS protection** with eBPF/XDP (based on an IP blacklisting scheme).

    *   [_Memory vs. Networking, Provoking and fixing memory bottlenecks_][40]  (LSF Memory Management Summit, March 2017):
        Provides a lot of details about current **memory issues** faced by XDP developers. Do not start with this one, but if you already know XDP and want to see how it really works on the page allocation side, this is a very helpful resource.

    *   [_XDP for the Rest of Us_][41]  (netdev 2.1, Montreal, April 2017), with Andy Gospodarek:
        How to get started with eBPF and XDP for normal humans. This presentation was also summarized by Julia Evans on [her blog][42].

    (Jesper also created and tries to extend some documentation about eBPF and XDP, see [related section][75].)

*   [_XDP workshop — Introduction, experience, and future development_][76]  (Tom Herbert, netdev 1.2, Tokyo, October 2016) — as of this writing, only the video is available, I don’t know if the slides will be added.

*   [_High Speed Packet Filtering on Linux_][149]  (Gilberto Bertin, DEF CON 25, Las Vegas, July 2017) — an excellent introduction to state-of-the-art packet filtering on Linux, oriented towards DDoS protection, talking about packet processing in the kernel, kernel bypass, XDP and eBPF.

### About other components related or based on eBPF

*   [_P4 on the Edge_][77]  (John Fastabend, May 2016):
    Presents the use of **P4**, a description language for packet processing, with BPF to create high-performance programmable switches.

*   If you like audio presentations, there is an associated [OvS Orbit episode (#11), called  _**P4** on the Edge_][78] , dating from August 2016\. OvS Orbit are interviews realized by Ben Pfaff, who is one of the core maintainers of Open vSwitch. In this case, John Fastabend is interviewed.

*   [_P4, EBPF and Linux TC Offload_][79]  (Dinan Gunawardena and Jakub Kicinski, August 2016):
    Another presentation on **P4**, with some elements related to eBPF hardware offload on Netronome’s **NFP** (Network Flow Processor) architecture.

*   **Cilium** is a technology initiated by Cisco and relying on BPF and XDP to provide “fast in-kernel networking and security policy enforcement for containers based on eBPF programs generated on the fly”. [The code of this project][150] is available on GitHub. Thomas Graf has been performing a number of presentations of this topic:
    *   [_Cilium: Networking & Security for Containers with BPF & XDP_][43] , also featuring a load balancer use case (Linux Plumbers conference, Santa Fe, November 2016)

    *   [_Cilium: Networking & Security for Containers with BPF & XDP_][44]  (Docker Distributed Systems Summit, October 2016 — [video][45])

    *   [_Cilium: Fast IPv6 container Networking with BPF and XDP_][46]  (LinuxCon, Toronto, August 2016)

    *   [_Cilium: BPF & XDP for containers_][47]  (fosdem17, Brussels, Belgium, February 2017)

    A good deal of contents is repeated between the different presentations; if in doubt, just pick the most recent one. Daniel Borkmann has also written [a generic introduction to Cilium][80] as a guest author on Google Open Source blog.

*   There are also podcasts about **Cilium**: an [OvS Orbit episode (#4)][81], in which Ben Pfaff interviews Thomas Graf (May 2016), and [another podcast by Ivan Pepelnjak][82], still with Thomas Graf about eBPF, P4, XDP and Cilium (October 2016).

*   **Open vSwitch** (OvS), and its related project **Open Virtual Network** (OVN, an open source network virtualization solution) are considering to use eBPF at various level, with several proof-of-concept prototypes already implemented:

    *   [Offloading OVS Flow Processing using eBPF][48] (William (Cheng-Chun) Tu, OvS conference, San Jose, November 2016)

    *   [Coupling the Flexibility of OVN with the Efficiency of IOVisor][49] (Fulvio Risso, Matteo Bertrone and Mauricio Vasquez Bernal, OvS conference, San Jose, November 2016)

    These use cases for eBPF seem to be only at the stage of proposals (nothing merge to OvS main branch) as far as I know, but it will be very interesting to see what comes out of it.

*   XDP is envisioned to be of great help for protection against Distributed Denial-of-Service (DDoS) attacks. More and more presentations focus on this. For example, the talks from people from Cloudflare ( [_XDP in practice: integrating XDP in our DDoS mitigation pipeline_][83] ) or from Facebook ( [_Droplet: DDoS countermeasures powered by BPF + XDP_][84] ) at the netdev 2.1 conference in Montreal, Canada, in April 2017, present such use cases.

*   [_CETH for XDP_][85]  (Yan Chan and Yunsong Lu, Linux Meetup, Santa Clara, July 2016):
    **CETH** stands for Common Ethernet Driver Framework for faster network I/O, a technology initiated by Mellanox.

*   [**The VALE switch**][86], another virtual switch that can be used in conjunction with the netmap framework, has [a BPF extension module][87].

*   **Suricata**, an open source intrusion detection system, [seems to rely on eBPF components][88] for its “capture bypass” features:
     [_The adventures of a Suricate in eBPF land_][89]  (Éric Leblond, netdev 1.2, Tokyo, October 2016)
     [_eBPF and XDP seen from the eyes of a meerkat_][90]  (Éric Leblond, Kernel Recipes, Paris, September 2017)

*   [InKeV: In-Kernel Distributed Network Virtualization for DCN][91] (Z. Ahmed, M. H. Alizai and A. A. Syed, SIGCOMM, August 2016):
    **InKeV** is an eBPF-based datapath architecture for virtual networks, targeting data center networks. It was initiated by PLUMgrid, and claims to achieve better performances than OvS-based OpenStack solutions.

*   [_**gobpf** - utilizing eBPF from Go_][92]  (Michael Schubert, fosdem17, Brussels, Belgium, February 2017):
    A “library to create, load and use eBPF programs from Go”

*   [**ply**][93] is a small but flexible open source dynamic **tracer** for Linux, with some features similar to the bcc tools, but with a simpler language inspired by awk and dtrace, written by Tobias Waldekranz.

*   If you read my previous article, you might be interested in this talk I gave about [implementing the OpenState interface with eBPF][151], for stateful packet processing, at fosdem17.

![](https://qmonnet.github.io/whirl-offload/img/icons/book.svg)

### Documentation

Once you managed to get a broad idea of what BPF is, you can put aside generic presentations and start diving into the documentation. Below are the most complete documents about BPF specifications and functioning. Pick the one you need and read them carefully!

### About BPF

*   The **specification of BPF** (both classic and extended versions) can be found within the documentation of the Linux kernel, and in particular in file[linux/Documentation/networking/filter.txt][94]. The use of BPF as well as its internals are documented there. Also, this is where you can find **information about errors thrown by the verifier** when loading BPF code fails. Can be helpful to troubleshoot obscure error messages.

*   Also in the kernel tree, there is a document about **frequent Questions & Answers** on eBPF design in file [linux/Documentation/bpf/bpf_design_QA.txt][95].

*   … But the kernel documentation is dense and not especially easy to read. If you look for a simple description of eBPF language, head for [its **summarized description**][96] on the IO Visor GitHub repository instead.

*   By the way, the IO Visor project gathered a lot of **resources about BPF**. Mostly, it is split between[the documentation directory][97] of its bcc repository, and the whole content of [the bpf-docs repository][98], both on GitHub. Note the existence of this excellent [BPF **reference guide**][99] containing a detailed description of BPF C and bcc Python helpers.

*   To hack with BPF, there are some essential **Linux manual pages**. The first one is [the `bpf(2)` man page][100] about the `bpf()` **system call**, which is used to manage BPF programs and maps from userspace. It also contains a description of BPF advanced features (program types, maps and so on). The second one is mostly addressed to people wanting to attach BPF programs to tc interface: it is [the `tc-bpf(8)` man page][101], which is a reference for **using BPF with tc**, and includes some example commands and samples of code.

*   Jesper Dangaard Brouer initiated an attempt to **update eBPF Linux documentation**, including **the different kinds of maps**. [He has a draft][102] to which contributions are welcome. Once ready, this document should be merged into the man pages and into kernel documentation.

*   The Cilium project also has an excellent [**BPF and XDP Reference Guide**][103], written by core eBPF developers, that should prove immensely useful to any eBPF developer.

*   David Miller has sent several enlightening emails about eBPF/XDP internals on the [xdp-newbies][152]mailing list. I could not find a link that gathers them at a single place, so here is a list:
    *   [bpf.h and you…][50]

    *   [Contextually speaking…][51]

    *   [BPF Verifier Overview][52]

    The last one is possibly the best existing summary about the verifier at this date.

*   Ferris Ellis started [a **blog post series about eBPF**][104]. As I write this paragraph, the first article is out, with some historical background and future expectations for eBPF. Next posts should be more technical, and look promising.

*   [A **list of BPF features per kernel version**][153] is available in bcc repository. Useful is you want to know the minimal kernel version that is required to run a given feature. I contributed and added the links to the commits that introduced each feature, so you can also easily access the commit logs from there.

### About tc

When using BPF for networking purposes in conjunction with tc, the Linux tool for **t**raffic **c**ontrol, one may wish to gather information about tc’s generic functioning. Here are a couple of resources about it.

*   It is difficult to find simple tutorials about **QoS on Linux**. The two links I have are long and quite dense, but if you can find the time to read it you will learn nearly everything there is to know about tc (nothing about BPF, though). There they are:  [_Traffic Control HOWTO_  (Martin A. Brown, 2006)][105], and the  [_Linux Advanced Routing & Traffic Control HOWTO_  (“LARTC”) (Bert Hubert & al., 2002)][106].

*   **tc manual pages** may not be up-to-date on your system, since several of them have been added lately. If you cannot find the documentation for a particular queuing discipline (qdisc), class or filter, it may be worth checking the latest [manual pages for tc components][107].

*   Some additional material can be found within the files of iproute2 package itself: the package contains [some documentation][108], including some files that helped me understand better [the functioning of **tc’s actions**][109].
    **Edit:** While still available from the Git history, these files have been deleted from iproute2 in October 2017.

*   Not exactly documentation: there was [a workshop about several tc features][110] (including filtering, BPF, tc offload, …) organized by Jamal Hadi Salim during the netdev 1.2 conference (October 2016).

*   Bonus information—If you use `tc` a lot, here are some good news: I [wrote a bash completion function][111] for this tool, and it should be shipped with package iproute2 coming with kernel version 4.6 and higher!

### About XDP

*   Some [work-in-progress documentation (including specifications)][112] for XDP started by Jesper Dangaard Brouer, but meant to be a collaborative work. Under progress (September 2016): you should expect it to change, and maybe to be moved at some point (Jesper [called for contribution][113], if you feel like improving it).

*   The [BPF and XDP Reference Guide][114] from Cilium project… Well, the name says it all.

### About P4 and BPF

[P4][159] is a language used to specify the behavior of a switch. It can be compiled for a number of hardware or software targets. As you may have guessed, one of these targets is BPF… The support is only partial: some P4 features cannot be translated towards BPF, and in a similar way there are things that BPF can do but that would not be possible to express with P4\. Anyway, the documentation related to **P4 use with BPF** [used to be hidden in bcc repository][160]. This changed with P4_16 version, the p4c reference compiler including [a backend for eBPF][161].

![](https://qmonnet.github.io/whirl-offload/img/icons/flask.svg)

### Tutorials

Brendan Gregg has produced excellent **tutorials** intended for people who want to **use bcc tools** for tracing and monitoring events in the kernel. [The first tutorial about using bcc itself][162] comes with eleven steps (as of today) to understand how to use the existing tools, while [the one **intended for Python developers**][163] focuses on developing new tools, across seventeen “lessons”.

Sasha Goldshtein also has some  [_**Linux Tracing Workshops Materials**_][164]  involving the use of several BPF tools for tracing.

Another post by Jean-Tiare Le Bigot provides a detailed (and instructive!) example of [using perf and eBPF to setup a low-level tracer][165] for ping requests and replies

Few tutorials exist for network-related eBPF use cases. There are some interesting documents, including an  _eBPF Offload Starting Guide_ , on the [Open NFP][166] platform operated by Netronome. Other than these, the talk from Jesper,  [_XDP for the Rest of Us_][167] , is probably one of the best ways to get started with XDP.

![](https://qmonnet.github.io/whirl-offload/img/icons/gears.svg)

### Examples

It is always nice to have examples. To see how things really work. But BPF program samples are scattered across several projects, so I listed all the ones I know of. The examples do not always use the same helpers (for instance, tc and bcc both have their own set of helpers to make it easier to write BPF programs in C language).

### From the kernel

The kernel contains examples for most types of program: filters to bind to sockets or to tc interfaces, event tracing/monitoring, and even XDP. You can find these examples under the [linux/samples/bpf/][168]directory.

Also do not forget to have a look to the logs related to the (git) commits that introduced a particular feature, they may contain some detailed example of the feature.

### From package iproute2

The iproute2 package provide several examples as well. They are obviously oriented towards network programming, since the programs are to be attached to tc ingress or egress interfaces. The examples dwell under the [iproute2/examples/bpf/][169] directory.

### From bcc set of tools

Many examples are [provided with bcc][170]:

*   Some are networking example programs, under the associated directory. They include socket filters, tc filters, and a XDP program.

*   The `tracing` directory include a lot of example **tracing programs**. The tutorials mentioned earlier are based on these. These programs cover a wide range of event monitoring functions, and some of them are production-oriented. Note that on certain Linux distributions (at least for Debian, Ubuntu, Fedora, Arch Linux), these programs have been [packaged][115] and can be “easily” installed by typing e.g. `# apt install bcc-tools`, but as of this writing (and except for Arch Linux), this first requires to set up IO Visor’s own package repository.

*   There are also some examples **using Lua** as a different BPF back-end (that is, BPF programs are written with Lua instead of a subset of C, allowing to use the same language for front-end and back-end), in the third directory.

### Manual pages

While bcc is generally the easiest way to inject and run a BPF program in the kernel, attaching programs to tc interfaces can also be performed by the `tc` tool itself. So if you intend to **use BPF with tc**, you can find some example invocations in the [`tc-bpf(8)` manual page][171].

![](https://qmonnet.github.io/whirl-offload/img/icons/srcfile.svg)

### The code

Sometimes, BPF documentation or examples are not enough, and you may have no other solution that to display the code in your favorite text editor (which should be Vim of course) and to read it. Or you may want to hack into the code so as to patch or add features to the machine. So here are a few pointers to the relevant files, finding the functions you want is up to you!

### BPF code in the kernel

*   The file [linux/include/linux/bpf.h][116] and its counterpart [linux/include/uapi/bpf.h][117] contain **definitions** related to eBPF, to be used respectively in the kernel and to interface with userspace programs.

*   On the same pattern, files [linux/include/linux/filter.h][118] and [linux/include/uapi/filter.h][119] contain information used to **run the BPF programs**.

*   The **main pieces of code** related to BPF are under [linux/kernel/bpf/][120] directory. **The different operations permitted by the system call**, such as program loading or map management, are implemented in file `syscall.c`, while `core.c` contains the **interpreter**. The other files have self-explanatory names: `verifier.c` contains the **verifier** (no kidding), `arraymap.c` the code used to interact with **maps** of type array, and so on.

*   The **helpers**, as well as several functions related to networking (with tc, XDP…) and available to the user, are implemented in [linux/net/core/filter.c][121]. It also contains the code to migrate cBPF bytecode to eBPF (since all cBPF programs are now translated to eBPF in the kernel before being run).

*   The **JIT compilers** are under the directory of their respective architectures, such as file[linux/arch/x86/net/bpf_jit_comp.c][122] for x86.

*   You will find the code related to **the BPF components of tc** in the [linux/net/sched/][123] directory, and in particular in files `act_bpf.c` (action) and `cls_bpf.c` (filter).

*   I have not hacked with **event tracing** in BPF, so I do not really know about the hooks for such programs. There is some stuff in [linux/kernel/trace/bpf_trace.c][124]. If you are interested in this and want to know more, you may dig on the side of Brendan Gregg’s presentations or blog posts.

*   Nor have I used **seccomp-BPF**. But the code is in [linux/kernel/seccomp.c][125], and some example use cases can be found in [linux/tools/testing/selftests/seccomp/seccomp_bpf.c][126].

### XDP hooks code

Once loaded into the in-kernel BPF virtual machine, **XDP** programs are hooked from userspace into the kernel network path thanks to a Netlink command. On reception, the function `dev_change_xdp_fd()` in file [linux/net/core/dev.c][172] is called and sets a XDP hook. Such hooks are located in the drivers of supported NICs. For example, the mlx4 driver used for some Mellanox hardware has hooks implemented in files under the [drivers/net/ethernet/mellanox/mlx4/][173] directory. File en_netdev.c receives Netlink commands and calls `mlx4_xdp_set()`, which in turns calls for instance `mlx4_en_process_rx_cq()` (for the RX side) implemented in file en_rx.c.

### BPF logic in bcc

One can find the code for the **bcc** set of tools [on the bcc GitHub repository][174]. The **Python code**, including the `BPF` class, is initiated in file [bcc/src/python/bcc/__init__.py][175]. But most of the interesting stuff—to my opinion—such as loading the BPF program into the kernel, happens [in the libbcc **C library**][176].

### Code to manage BPF with tc

The code related to BPF **in tc** comes with the iproute2 package, of course. Some of it is under the[iproute2/tc/][177] directory. The files f_bpf.c and m_bpf.c (and e_bpf.c) are used respectively to handle BPF filters and actions (and tc `exec` command, whatever this may be). File q_clsact.c defines the `clsact` qdisc especially created for BPF. But **most of the BPF userspace logic** is implemented in[iproute2/lib/bpf.c][178] library, so this is probably where you should head to if you want to mess up with BPF and tc (it was moved from file iproute2/tc/tc_bpf.c, where you may find the same code in older versions of the package).

### BPF utilities

The kernel also ships the sources of three tools (`bpf_asm.c`, `bpf_dbg.c`, `bpf_jit_disasm.c`) related to BPF, under the [linux/tools/net/][179] or [linux/tools/bpf/][180] directory depending on your version:

*   `bpf_asm` is a minimal cBPF assembler.

*   `bpf_dbg` is a small debugger for cBPF programs.

*   `bpf_jit_disasm` is generic for both BPF flavors and could be highly useful for JIT debugging.

*   `bpftool` is a generic utility written by Jakub Kicinski, and that can be used to interact with eBPF programs and maps from userspace, for example to show, dump, pin programs, or to show, create, pin, update, delete maps.

Read the comments at the top of the source files to get an overview of their usage.

### Other interesting chunks

If you are interested the use of less common languages with BPF, bcc contains [a **P4 compiler** for BPF targets][181] as well as [a **Lua front-end**][182] that can be used as alternatives to the C subset and (in the case of Lua) to the Python tools.

### LLVM backend

The BPF backend used by clang / LLVM for compiling C into eBPF was added to the LLVM sources in[this commit][183] (and can also be accessed on [the GitHub mirror][184]).

### Running in userspace

As far as I know there are at least two eBPF userspace implementations. The first one, [uBPF][185], is written in C. It contains an interpreter, a JIT compiler for x86_64 architecture, an assembler and a disassembler.

The code of uBPF seems to have been reused to produce a [generic implementation][186], that claims to support FreeBSD kernel, FreeBSD userspace, Linux kernel, Linux userspace and MacOSX userspace. It is used for the [BPF extension module for VALE switch][187].

The other userspace implementation is my own work: [rbpf][188], based on uBPF, but written in Rust. The interpreter and JIT-compiler work (both under Linux, only the interpreter for MacOSX and Windows), there may be more in the future.

### Commit logs

As stated earlier, do not hesitate to have a look at the commit log that introduced a particular BPF feature if you want to have more information about it. You can search the logs in many places, such as on [git.kernel.org][189], [on GitHub][190], or on your local repository if you have cloned it. If you are not familiar with git, try things like `git blame <file>` to see what commit introduced a particular line of code, then `git show <commit>` to have details (or search by keyword in `git log` results, but this may be tedious). See also [the list of eBPF features per kernel version][191] on bcc repository, that links to relevant commits.

![](https://qmonnet.github.io/whirl-offload/img/icons/wand.svg)

### Troubleshooting

The enthusiasm about eBPF is quite recent, and so far I have not found a lot of resources intending to help with troubleshooting. So here are the few I have, augmented with my own recollection of pitfalls encountered while working with BPF.

### Errors at compilation time

*   Make sure you have a recent enough version of the Linux kernel (see also [this document][127]).

*   If you compiled the kernel yourself: make sure you installed correctly all components, including kernel image, headers and libc.

*   When using the `bcc` shell function provided by `tc-bpf` man page (to compile C code into BPF): I once had to add includes to the header for the clang call:

    ```
    __bcc() {
            clang -O2 -I "/usr/src/linux-headers-$(uname -r)/include/" \
                      -I "/usr/src/linux-headers-$(uname -r)/arch/x86/include/" \
                    -emit-llvm -c $1 -o - | \
            llc -march=bpf -filetype=obj -o "`basename $1 .c`.o"
    }

    ```

    (seems fixed as of today).

*   For other problems with `bcc`, do not forget to have a look at [the FAQ][128] of the tool set.

*   If you downloaded the examples from the iproute2 package in a version that does not exactly match your kernel, some errors can be triggered by the headers included in the files. The example snippets indeed assume that the same version of iproute2 package and kernel headers are installed on the system. If this is not the case, download the correct version of iproute2, or edit the path of included files in the examples to point to the headers included in iproute2 (some problems may or may not occur at runtime, depending on the features in use).

### Errors at load and run time

*   To load a program with tc, make sure you use a tc binary coming from an iproute2 version equivalent to the kernel in use.

*   To load a program with bcc, make sure you have bcc installed on the system (just downloading the sources to run the Python script is not enough).

*   With tc, if the BPF program does not return the expected values, check that you called it in the correct fashion: filter, or action, or filter with “direct-action” mode.

*   With tc still, note that actions cannot be attached directly to qdiscs or interfaces without the use of a filter.

*   The errors thrown by the in-kernel verifier may be hard to interpret. [The kernel documentation][129]may help, so may [the reference guide][130] or, as a last resort, the source code (see above) (good luck!). For this kind of errors it is also important to keep in mind that the verifier  _does not run_  the program. If you get an error about an invalid memory access or about uninitialized data, it does not mean that these problems actually occurred (or sometimes, that they can possibly occur at all). It means that your program is written in such a way that the verifier estimates that such errors could happen, and therefore it rejects the program.

*   Note that `tc` tool has a verbose mode, and that it works well with BPF: try appending `verbose`at the end of your command line.

*   bcc also has verbose options: the `BPF` class has a `debug` argument that can take any combination of the three flags `DEBUG_LLVM_IR`, `DEBUG_BPF` and `DEBUG_PREPROCESSOR` (see details in [the source file][131]). It even embeds [some facilities to print output messages][132] for debugging the code.

*   LLVM v4.0+ [embeds a disassembler][133] for eBPF programs. So if you compile your program with clang, adding the `-g` flag for compiling enables you to later dump your program in the rather human-friendly format used by the kernel verifier. To proceed to the dump, use:

    ```
    $ llvm-objdump -S -no-show-raw-insn bpf_program.o

    ```

*   Working with maps? You want to have a look at [bpf-map][134], a very userful tool in Go created for the Cilium project, that can be used to dump the contents of kernel eBPF maps. There also exists [a clone][135] in Rust.

*   There is an old [`bpf` tag on **StackOverflow**][136], but as of this writing it has been hardly used—ever (and there is nearly nothing related to the new eBPF version). If you are a reader from the Future though, you may want to check whether there has been more activity on this side.

![](https://qmonnet.github.io/whirl-offload/img/icons/zoomin.svg)

### And still more!

*   In case you would like to easily **test XDP**, there is [a Vagrant setup][137] available. You can also **test bcc**[in a Docker container][138].

*   Wondering where the **development and activities** around BPF occur? Well, the kernel patches always end up [on the netdev mailing list][139] (related to the Linux kernel networking stack development): search for “BPF” or “XDP” keywords. Since April 2017, there is also [a mailing list specially dedicated to XDP programming][140] (both for architecture or for asking for help). Many discussions and debates also occur [on the IO Visor mailing list][141], since BPF is at the heart of the project. If you only want to keep informed from time to time, there is also an [@IOVisor Twitter account][142].

And come back on this blog from time to time to see if they are new articles [about BPF][192]!

 _Special thanks to Daniel Borkmann for the numerous [additional documents][154] he pointed to me so that I could complete this collection._

--------------------------------------------------------------------------------

via: https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/

作者：[Quentin Monnet ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://qmonnet.github.io/whirl-offload/about/
[1]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-bpf
[2]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-xdp
[3]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-other-components-related-or-based-on-ebpf
[4]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-bpf-1
[5]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-tc
[6]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-xdp-1
[7]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-p4-and-bpf
[8]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#from-the-kernel
[9]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#from-package-iproute2
[10]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#from-bcc-set-of-tools
[11]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#manual-pages
[12]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#bpf-code-in-the-kernel
[13]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#xdp-hooks-code
[14]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#bpf-logic-in-bcc
[15]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#code-to-manage-bpf-with-tc
[16]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#bpf-utilities
[17]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#other-interesting-chunks
[18]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#llvm-backend
[19]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#running-in-userspace
[20]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#commit-logs
[21]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#errors-at-compilation-time
[22]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#errors-at-load-and-run-time
[23]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#generic-presentations
[24]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#documentation
[25]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#tutorials
[26]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#examples
[27]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#the-code
[28]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#troubleshooting
[29]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#and-still-more
[30]:http://netdevconf.org/1.2/session.html?daniel-borkmann
[31]:http://netdevconf.org/1.2/slides/oct5/07_tcws_daniel_borkmann_2016_tcws.pdf
[32]:http://netdevconf.org/1.2/session.html?jamal-tc-workshop
[33]:http://www.netdevconf.org/1.1/proceedings/slides/borkmann-tc-classifier-cls-bpf.pdf
[34]:http://www.netdevconf.org/1.1/proceedings/papers/On-getting-tc-classifier-fully-programmable-with-cls-bpf.pdf
[35]:https://archive.fosdem.org/2016/schedule/event/ebpf/attachments/slides/1159/export/events/attachments/ebpf/slides/1159/ebpf.pdf
[36]:https://fosdem.org/2017/schedule/event/ebpf_xdp/
[37]:http://people.netfilter.org/hawk/presentations/xdp2016/xdp_intro_and_use_cases_sep2016.pdf
[38]:http://netdevconf.org/1.2/session.html?jesper-performance-workshop
[39]:http://people.netfilter.org/hawk/presentations/OpenSourceDays2017/XDP_DDoS_protecting_osd2017.pdf
[40]:http://people.netfilter.org/hawk/presentations/MM-summit2017/MM-summit2017-JesperBrouer.pdf
[41]:http://netdevconf.org/2.1/session.html?gospodarek
[42]:http://jvns.ca/blog/2017/04/07/xdp-bpf-tutorial/
[43]:http://www.slideshare.net/ThomasGraf5/clium-container-networking-with-bpf-xdp
[44]:http://www.slideshare.net/Docker/cilium-bpf-xdp-for-containers-66969823
[45]:https://www.youtube.com/watch?v=TnJF7ht3ZYc&list=PLkA60AVN3hh8oPas3cq2VA9xB7WazcIgs
[46]:http://www.slideshare.net/ThomasGraf5/cilium-fast-ipv6-container-networking-with-bpf-and-xdp
[47]:https://fosdem.org/2017/schedule/event/cilium/
[48]:http://openvswitch.org/support/ovscon2016/7/1120-tu.pdf
[49]:http://openvswitch.org/support/ovscon2016/7/1245-bertrone.pdf
[50]:https://www.spinics.net/lists/xdp-newbies/msg00179.html
[51]:https://www.spinics.net/lists/xdp-newbies/msg00181.html
[52]:https://www.spinics.net/lists/xdp-newbies/msg00185.html
[53]:http://schd.ws/hosted_files/ossna2017/da/BPFandXDP.pdf
[54]:https://speakerdeck.com/tuxology/the-bsd-packet-filter
[55]:http://www.slideshare.net/brendangregg/bpf-tracing-and-more
[56]:http://fr.slideshare.net/brendangregg/linux-bpf-superpowers
[57]:https://www.socallinuxexpo.org/sites/default/files/presentations/Room%20211%20-%20IOVisor%20-%20SCaLE%2014x.pdf
[58]:https://events.linuxfoundation.org/sites/events/files/slides/ebpf_on_the_mainframe_lcon_2015.pdf
[59]:https://events.linuxfoundation.org/sites/events/files/slides/tracing-linux-ezannoni-linuxcon-ja-2015_0.pdf
[60]:https://events.linuxfoundation.org/sites/events/files/slides/bpf_collabsummit_2015feb20.pdf
[61]:https://lwn.net/Articles/603983/
[62]:http://www.slideshare.net/vh21/meet-cutebetweenebpfandtracing
[63]:http://www.slideshare.net/vh21/linux-kernel-tracing
[64]:http://www.slideshare.net/ThomasGraf5/linux-networking-explained
[65]:http://www.slideshare.net/ThomasGraf5/linuxcon-2015-linux-kernel-networking-walkthrough
[66]:http://www.tcpdump.org/papers/bpf-usenix93.pdf
[67]:http://www.gsp.com/cgi-bin/man.cgi?topic=bpf
[68]:http://borkmann.ch/talks/2013_devconf.pdf
[69]:http://borkmann.ch/talks/2014_devconf.pdf
[70]:https://blog.cloudflare.com/introducing-the-bpf-tools/
[71]:http://biot.com/capstats/bpf.html
[72]:https://www.iovisor.org/technology/xdp
[73]:https://github.com/iovisor/bpf-docs/raw/master/Express_Data_Path.pdf
[74]:https://events.linuxfoundation.org/sites/events/files/slides/iovisor-lc-bof-2016.pdf
[75]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-xdp-1
[76]:http://netdevconf.org/1.2/session.html?herbert-xdp-workshop
[77]:https://schd.ws/hosted_files/2016p4workshop/1d/Intel%20Fastabend-P4%20on%20the%20Edge.pdf
[78]:https://ovsorbit.benpfaff.org/#e11
[79]:http://open-nfp.org/media/pdfs/Open_NFP_P4_EBPF_Linux_TC_Offload_FINAL.pdf
[80]:https://opensource.googleblog.com/2016/11/cilium-networking-and-security.html
[81]:https://ovsorbit.benpfaff.org/
[82]:http://blog.ipspace.net/2016/10/fast-linux-packet-forwarding-with.html
[83]:http://netdevconf.org/2.1/session.html?bertin
[84]:http://netdevconf.org/2.1/session.html?zhou
[85]:http://www.slideshare.net/IOVisor/ceth-for-xdp-linux-meetup-santa-clara-july-2016
[86]:http://info.iet.unipi.it/~luigi/vale/
[87]:https://github.com/YutaroHayakawa/vale-bpf
[88]:https://www.stamus-networks.com/2016/09/28/suricata-bypass-feature/
[89]:http://netdevconf.org/1.2/slides/oct6/10_suricata_ebpf.pdf
[90]:https://www.slideshare.net/ennael/kernel-recipes-2017-ebpf-and-xdp-eric-leblond
[91]:https://github.com/iovisor/bpf-docs/blob/master/university/sigcomm-ccr-InKev-2016.pdf
[92]:https://fosdem.org/2017/schedule/event/go_bpf/
[93]:https://wkz.github.io/ply/
[94]:https://www.kernel.org/doc/Documentation/networking/filter.txt
[95]:https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/tree/Documentation/bpf/bpf_design_QA.txt?id=2e39748a4231a893f057567e9b880ab34ea47aef
[96]:https://github.com/iovisor/bpf-docs/blob/master/eBPF.md
[97]:https://github.com/iovisor/bcc/tree/master/docs
[98]:https://github.com/iovisor/bpf-docs/
[99]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md
[100]:http://man7.org/linux/man-pages/man2/bpf.2.html
[101]:http://man7.org/linux/man-pages/man8/tc-bpf.8.html
[102]:https://prototype-kernel.readthedocs.io/en/latest/bpf/index.html
[103]:http://docs.cilium.io/en/latest/bpf/
[104]:https://ferrisellis.com/tags/ebpf/
[105]:http://linux-ip.net/articles/Traffic-Control-HOWTO/
[106]:http://lartc.org/lartc.html
[107]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/man/man8
[108]:https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git/tree/doc?h=v4.13.0
[109]:https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git/tree/doc/actions?h=v4.13.0
[110]:http://netdevconf.org/1.2/session.html?jamal-tc-workshop
[111]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/commit/bash-completion/tc?id=27d44f3a8a4708bcc99995a4d9b6fe6f81e3e15b
[112]:https://prototype-kernel.readthedocs.io/en/latest/networking/XDP/index.html
[113]:https://marc.info/?l=linux-netdev&m=147436253625672
[114]:http://docs.cilium.io/en/latest/bpf/
[115]:https://github.com/iovisor/bcc/blob/master/INSTALL.md
[116]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/linux/bpf.h
[117]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/bpf.h
[118]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/linux/filter.h
[119]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/filter.h
[120]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/bpf
[121]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/core/filter.c
[122]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/x86/net/bpf_jit_comp.c
[123]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/sched
[124]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/trace/bpf_trace.c
[125]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/seccomp.c
[126]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/seccomp/seccomp_bpf.c
[127]:https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
[128]:https://github.com/iovisor/bcc/blob/master/FAQ.txt
[129]:https://www.kernel.org/doc/Documentation/networking/filter.txt
[130]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md
[131]:https://github.com/iovisor/bcc/blob/master/src/python/bcc/__init__.py
[132]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md#output
[133]:https://www.spinics.net/lists/netdev/msg406926.html
[134]:https://github.com/cilium/bpf-map
[135]:https://github.com/badboy/bpf-map
[136]:https://stackoverflow.com/questions/tagged/bpf
[137]:https://github.com/iovisor/xdp-vagrant
[138]:https://github.com/zlim/bcc-docker
[139]:http://lists.openwall.net/netdev/
[140]:http://vger.kernel.org/vger-lists.html#xdp-newbies
[141]:http://lists.iovisor.org/pipermail/iovisor-dev/
[142]:https://twitter.com/IOVisor
[143]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#what-is-bpf
[144]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#dive-into-the-bytecode
[145]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#resources
[146]:https://github.com/qmonnet/whirl-offload/commits/gh-pages/_posts/2016-09-01-dive-into-bpf.md
[147]:http://netdevconf.org/1.2/session.html?jakub-kicinski
[148]:http://www.slideshare.net/IOVisor/express-data-path-linux-meetup-santa-clara-july-2016
[149]:https://cdn.shopify.com/s/files/1/0177/9886/files/phv2017-gbertin.pdf
[150]:https://github.com/cilium/cilium
[151]:https://fosdem.org/2017/schedule/event/stateful_ebpf/
[152]:http://vger.kernel.org/vger-lists.html#xdp-newbies
[153]:https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
[154]:https://github.com/qmonnet/whirl-offload/commit/d694f8081ba00e686e34f86d5ee76abeb4d0e429
[155]:http://openvswitch.org/pipermail/dev/2014-October/047421.html
[156]:https://qmonnet.github.io/whirl-offload/2016/07/15/beba-research-project/
[157]:https://www.iovisor.org/resources/blog
[158]:http://www.brendangregg.com/blog/2016-03-05/linux-bpf-superpowers.html
[159]:http://p4.org/
[160]:https://github.com/iovisor/bcc/tree/master/src/cc/frontends/p4
[161]:https://github.com/p4lang/p4c/blob/master/backends/ebpf/README.md
[162]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md
[163]:https://github.com/iovisor/bcc/blob/master/docs/tutorial_bcc_python_developer.md
[164]:https://github.com/goldshtn/linux-tracing-workshop
[165]:https://blog.yadutaf.fr/2017/07/28/tracing-a-packet-journey-using-linux-tracepoints-perf-ebpf/
[166]:https://open-nfp.org/dataplanes-ebpf/technical-papers/
[167]:http://netdevconf.org/2.1/session.html?gospodarek
[168]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/samples/bpf
[169]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/examples/bpf
[170]:https://github.com/iovisor/bcc/tree/master/examples
[171]:http://man7.org/linux/man-pages/man8/tc-bpf.8.html
[172]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/core/dev.c
[173]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mellanox/mlx4/
[174]:https://github.com/iovisor/bcc/
[175]:https://github.com/iovisor/bcc/blob/master/src/python/bcc/__init__.py
[176]:https://github.com/iovisor/bcc/blob/master/src/cc/libbpf.c
[177]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/tc
[178]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/lib/bpf.c
[179]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/tools/net
[180]:https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/tree/tools/bpf
[181]:https://github.com/iovisor/bcc/tree/master/src/cc/frontends/p4/compiler
[182]:https://github.com/iovisor/bcc/tree/master/src/lua
[183]:https://reviews.llvm.org/D6494
[184]:https://github.com/llvm-mirror/llvm/commit/4fe85c75482f9d11c5a1f92a1863ce30afad8d0d
[185]:https://github.com/iovisor/ubpf/
[186]:https://github.com/YutaroHayakawa/generic-ebpf
[187]:https://github.com/YutaroHayakawa/vale-bpf
[188]:https://github.com/qmonnet/rbpf
[189]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
[190]:https://github.com/torvalds/linux
[191]:https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
[192]:https://qmonnet.github.io/whirl-offload/categories/#BPF
