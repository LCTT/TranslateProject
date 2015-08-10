For Linux, Supercomputers R Us
================================================================================
![Credit: Michel Ngilen, CC BY 2.0, via Wikimedia Commons](http://images.techhive.com/images/article/2015/08/playstation_3-100602985-primary.idge.jpg)
Credit: Michel Ngilen, CC BY 2.0, via Wikimedia Commons

> Almost all supercomputers run Linux, including the ones built from Raspberry Pi boards and PlayStation 3 game consoles

Supercomputers are serious things, called on to do serious computing. They tend to be engaged in serious pursuits like atomic bomb simulations, climate modeling and high-level physics. Naturally, they cost serious money. At the very top of the latest [Top500][1] supercomputer ranking is the Tianhe-2 supercomputer at China’s National University of Defense Technology. It cost about $390 million to build.

But then there’s the supercomputer that Joshua Kiepert, a doctoral student at Boise State’s Electrical and Computer Engineering department, [created with Raspberry Pi computers][2].It cost less than $2,000.

No, I’m not making that up. It’s an honest-to-goodness supercomputer made from overclocked 1-GHz [Model B Raspberry Pi][3] ARM11 processors with Videocore IV GPUs. Each one comes with 512MB of RAM, a pair of USB ports and a 10/100 BaseT Ethernet port.

And what do the Tianhe-2 and the Boise State supercomputer have in common? They both run Linux. As do [486 out of the world’s fastest 500 supercomputers][4]. It’s part of a domination of the category that began over 20 years ago. And now it’s trickling down to built-on-the-cheap supercomputers. Because Kiepert’s machine isn’t the only budget number cruncher out there.

Gaurav Khanna, an associate professor of physics at the University of Massachusetts Dartmouth, created a [supercomputer with something shy of 200 PlayStation 3 video game consoles][5].

The PlayStations are powered by a 3.2-GHz PowerPC-based Power Processing Element. Each comes with 512MB of RAM. You can still buy one, although Sony will be phasing them out by year’s end, for just over $200. Khanna started with only 16 PlayStation 3s for his first supercomputer, so you too could put a supercomputer on your credit card for less than four grand.

These machines may be built from toys, but they’re not playthings. Khanna has done serious astrophysics on his rig. A white-hat hacking group used a similar [PlayStation 3 supercomputer in 2008 to crack the SSL MD5 hashing algorithm][6] in 2008.

Two years later, the Air Force Research Laboratory [Condor Cluster was using 1,760 Sony PlayStation 3 processors][7] and 168 general-purpose graphical processing units. This bargain-basement supercomputer runs at about 500TFLOPs, or 500 trillion floating point operations per second.

Other cheap options for home supercomputers include specialist parallel-processing boards such as the [$99 credit-card-sized Parallella board][8], and high-end graphics boards such as [Nvidia’s Titan Z][9] and [AMD’s FirePro W9100][10]. Those high-end boards, coveted by gamers with visions of a dream machine or even a chance at winning the first-place prize of over $100,000 in the [Intel Extreme Masters World Championship League of][11] [Legends][12], cost considerably more, retailing for about $3,000. On the other hand, a single one can deliver over 2.5TFLOPS all by itself, and for scientists and researchers, they offer an affordable way to get a supercomputer they can call their own.

As for the Linux connection, that all started in 1994 at the Goddard Space Flight Center with the first [Beowulf supercomputer][13].

By our standards, there wasn’t much that was super about the first Beowulf. But in its day, the first homemade supercomputer, with its 16 Intel 486DX processors and 10Mbps Ethernet for the bus, was great. [Beowulf, designed by NASA contractors Don Becker and Thomas Sterling][14], was the first “maker” supercomputer. Its “compute components,” 486DX PCs, cost only a few thousand dollars. While its speed was only in single-digit gigaflops, [Beowulf][15] showed you could build supercomputers from commercial off-the-shelf (COTS) hardware and Linux.

I wish I’d had a part in its creation, but I’d already left Goddard by 1994 for a career as a full-time technology journalist. Darn it!

But even from this side of my reporter’s notebook, I can still appreciate how COTS and open-source software changed supercomputing forever. I hope you can too. Because, whether it’s a cluster of Raspberry Pis or a monster with over 3 million Intel Ivy Bridge and Xeon Phi chips, almost all of today’s supercomputers trace their ancestry to Beowulf.

--------------------------------------------------------------------------------

via: 

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.computerworld.com/author/Steven-J.-Vaughan_Nichols/
[1]:http://www.top500.org/
[2]:http://www.zdnet.com/article/build-your-own-supercomputer-out-of-raspberry-pi-boards/
[3]:https://www.raspberrypi.org/products/model-b/
[4]:http://www.zdnet.com/article/linux-still-rules-supercomputing/
[5]:http://www.nytimes.com/2014/12/23/science/an-economical-way-to-save-progress.html?smid=fb-nytimes&smtyp=cur&bicmp=AD&bicmlukp=WT.mc_id&bicmst=1409232722000&bicmet=1419773522000&_r=4
[6]:http://www.computerworld.com/article/2529932/cybercrime-hacking/researchers-hack-verisign-s-ssl-scheme-for-securing-web-sites.html
[7]:http://phys.org/news/2010-12-air-playstation-3s-supercomputer.html
[8]:http://www.zdnet.com/article/parallella-the-99-linux-supercomputer/
[9]:http://blogs.nvidia.com/blog/2014/03/25/titan-z/
[10]:http://www.amd.com/en-us/press-releases/Pages/amd-flagship-professional-2014apr7.aspx
[11]:http://en.intelextrememasters.com/news/check-out-the-intel-extreme-masters-katowice-prize-money-distribution/
[12]:http://www.google.com/url?q=http%3A%2F%2Fen.intelextrememasters.com%2Fnews%2Fcheck-out-the-intel-extreme-masters-katowice-prize-money-distribution%2F&sa=D&sntz=1&usg=AFQjCNE6yoAGGz-Hpi2tPF4gdhuPBEckhQ
[13]:http://www.beowulf.org/overview/history.html
[14]:http://yclept.ucdavis.edu/Beowulf/aboutbeowulf.html
[15]:http://www.beowulf.org/