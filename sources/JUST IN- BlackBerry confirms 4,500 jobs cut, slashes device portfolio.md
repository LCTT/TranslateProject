JUST IN: BlackBerry confirms 4,500 jobs cut, slashes device portfolio
================================================================================
> Summary: No, Planetary Resource isn't kidding. It’s working on using Linux, open-source software, and commercial off-the-shelf hardware to build the first robotic asteroid miners.

When I was a kid in the 60s, books such as Miss Pickerell on the Moon, On the Trail of the Space Pirates, and Robert A. Heinlein's The Rolling Stones had me dreaming of flying rockets to asteroids with my trusty Geiger counter and pick-axe in hand. It was science fiction then. [Planetary Resources][1] is on its way to making it science-fact within the next few years.

![](http://cdn-static.zdnet.com/i/r/story/70/00/020989/aakrydseries100-600x286.png)

*By 2014, Planetary Resources first Linux-powered asteroid prospecting robots will be in orbit. (Credit: Planetary Resources)*

At a [LinuxCon][2] session in New Orleans, Planetary Resources' Marc Allen, a Senior Embedded Systems Engineer, and Ray Ramadorai, Principal Avionics Engineer, explained that the company is dead serious about making asteroid mining real. The company’s principals include [X-Prize Foundation][3] founder Peter Diamandis; former NASA Flight Director Chris Lewicki; [Virgin Galactic's][4] Sir Richard Branson, and Google's Eric Schmidt and Larry Page. The staff includes numerous folks from NASA and JPL. In short, the company has real expertise and financial backing. The group is also using crowdsourcing both for resources and to drum up support for its plans.

At the same time, Planetary Resources wants to mine asteroids on the cheap. So according to Allen, the company plans to use commercial off-the-shelf (COTS) hardware to make low cost, highly reliable spacecraft. Once these spacecraft become commodities, they can rapidly be modified to keep pace with modern technology. In addition, the failure of any one spacecraft will not be catastrophic. Ramadorai explained, "This approach is crucial to commercial space exploration and development, and is a key part of the Planetary Resources strategy."

A COTS spaceship's computer is also much cheaper. Today, a standard space probe uses a 133Mz PowerPC RAD750 with 128MBS of RAM, and 256K of EEPROM memory. At a cost of $20,000, this radiation- hardened computer is "insanely expensive." Allen believes that "We can use something like an 1.6GHz Intel Atom Z530processor at 1/200th [of] the cost."

Linux and open-source software fits in because it saves the company the costs of reinventing the wheel in many basic system functions and is much cheaper than traditional spacecraft software. "Traditional missions cost millions," said Allen. They're very risk conservative. They use VxWorks or other commercial RTOS (real-time operating systems) to create a unique operating system for each space vehicle."

With Linux, however, Planetary Resource can build a common spaceship operating system more cheaply and much more easily. Almost all software used in the current generation of spacecraft is custom made and manually coded. That's expensive.

In addition, the company considers virtualization is very important for their spacecraft, since decoupling the software and hardware virtualization will make security and fault isolation much easier.

Planetary Resources won't be using Linux only in space. "Linux can be everywhere in our stack, said Allen. "There will be a single board computer running Linux on the spacecraft and on the ground station, a single board virtual machine clone." This will better enable engineers to troubleshoot problems harmlessly on the ground rather than address them dangerously in space.

## Hubble snaps amazing Comet ISON speeding toward Earth encounter (Gallery) ##

In addition, Planetary Resources will use Linux and other open-source programs, such as [Git][5] and [Jenkins][6] to manage its software projects. The company will also be using [Monte-Carlo simulations][7] on open-source-based cloud using [QEMU][8] to work out the best, and most affordable, asteroids to mine.

Affordable in this case means how easy they'll be to intercept. According to the pair from Planetary Resources, we’re currently aware of at almost 600,000 asteroids today, and there may be as many as 1.5-million of them.

Most of these, of course, are in the [asteroid belt][9] between Mars and Jupiter. But, there are over 20,000 near-Earth asteroids that are larger than 100-meters in diameter. Of these, 17 percent, 3,400 are energetically closer than the moon. It's these relatively close asteroids that Planetary Resources will be "prospecting."

The company will do this with its ARKYD series of robot spaceships. The first of the [ARKYD 100 Series][10], should be in orbit in 2014. These are microwave-oven-sized commercial space telescopes that will look for asteroids that may be likely sources of water or valuable minerals.

Promising asteroids will be followed by ARKYD 200 Series fly-by missions for a closer look. Then, once the most valuable asteroids have been spotted, the 300 ARKYD series will land—dock, actually—and get to work mining the asteroid.

Why is Planetary Resources doing this? For the money.

A 140-meter long asteroid, like 2011 AG5, which will approach Earth in 2040, could contain more platinum than all the platinum mined on Earth to date. The price for platinum, by the by, is currently about $1,427 per ounce.

It’s possible, then, that a single asteroid could be worth tens of billions of dollars. So if you could mine it for even a a billion or two, you'd still have enough to buy your own private island.

In addition, Planetary Resources is mining for water, to be used to fuel both other near-Earth orbit and deep space robot asteroid mining spaceships.

Sound interesting? Allen concluded by saying that "[We're looking for a few good asteroid miners.][11]" In particular, the company is looking for software and electrical engineers. If you love space and open-source software, this may be the job for you.


via: http://www.zdnet.com/penguins-in-space-asteroid-mining-and-linux-7000020989/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.planetaryresources.com/
[2]:http://events.linuxfoundation.org/events/linuxcon-north-america
[3]:http://www.xprize.org/
[4]:http://www.virgingalactic.com/
[5]:http://git-scm.com/
[6]:http://jenkins-ci.org/
[7]:http://www.palisade.com/risk/monte_carlo_simulation.asp
[8]:http://wiki.qemu.org/Main_Page
[9]:http://www.space.com/16105-asteroid-belt.html
[10]:http://www.planetaryresources.com/products/
[11]:http://www.planetaryresources.com/careers/