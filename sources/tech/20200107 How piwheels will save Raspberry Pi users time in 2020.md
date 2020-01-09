[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How piwheels will save Raspberry Pi users time in 2020)
[#]: via: (https://opensource.com/article/20/1/piwheels)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

How piwheels will save Raspberry Pi users time in 2020
======
By making pre-compiled Python packages for Raspberry Pi available, the
piwheels project saves users significant time and effort.
![rainbow colors on pinwheels in the sun][1]

Piwheels automates building Python wheels (pre-compiled Python packages) for all of the projects on [PyPI][2], the Python Package Index, using Raspberry Pi hardware to ensure compatibility. This means that when a Raspberry Pi user wants to install a Python library using **pip**, they get a ready-made compiled version that's guaranteed to work on the Raspberry Pi. This makes it much easier for Raspberry Pi users to dive in and get started with their projects.

![Piwheels logo][3]

When I wrote [_piwheels: Speedy Python package installation for the Raspberry Pi_][4] in October 2018, the piwheels project was in its first year and already proving its purpose of saving Raspberry Pi users considerable time and effort. But the project, which makes pre-compiled Python packages available for Raspberry Pi, has come a long way in its second year.

![Raspberry Pi 4][5]

### How it works

[Raspbian][6], the primary OS for Raspberry Pi, comes pre-configured to use piwheels, so users don't need to do anything special to get access to the wheels.

The configuration file (at **/etc/pip.conf**) tells pip to use [piwheels.org][7] as an _additional index_, so pip looks at PyPI first, then piwheels. The Piwheels website is hosted on a Raspberry Pi 3, and all the wheels built by the project are hosted on that Pi. It serves over 1 million packages per month—not bad for a $35 computer!

In addition to the main Raspberry Pi that serves the website, the piwheels project uses seven other Pis to build the packages. Some run Raspbian Jessie, building wheels for Python 3.4, some run Raspbian Stretch for Python 3.5, and some run Raspbian Buster for Python 3.7. The project doesn't generally support other Python versions. There's also a "proper server"—a virtual machine running the Postgres database. Since the Pi 3 has just 1GB of RAM, the (very large) database doesn't run well on it, so we moved it to a VM. The Pi 4 with 4GB RAM would probably be suitable, so we may move to this in the future.

The Pis are all on an IPv6-only network in a "Pi Cloud"—a brilliant service provided by Cambridge-based hosting company [Mythic Beasts][8].

![Mythic Beasts hosting service][9]

### Downloads and trends

Every time a wheel file is downloaded, it is logged in the database. This provides insight into what packages are most popular and what Python versions and operating systems people are using. We don't have much information from the user agent, but because the architecture of Pi 1/Zero shows as "armv6" and Pi 2/3/4 show as "armv7," we can tell them apart.

As of mid-December 2019, over 14 million packages have been downloaded from piwheels, with nearly 9 million in 2019 alone.

The 10 most popular packages since the project's inception are:

  1. [pycparser][10] (821,060 downloads)
  2. [PyYAML][11] (366,979)
  3. [numpy][12] (354,531)
  4. [cffi][13] (336,982)
  5. [MarkupSafe][14] (318,878)
  6. [future][15] (282,349)
  7. [aiohttp][16] (277,046)
  8. [cryptography][17] (276,167)
  9. [home-assistant-frontend][18] (266,667)
  10. [multidict][19] (256,185)



Note that many pure-Python packages, such as [urllib3][20], are provided as wheels on PyPI; because these are compatible across platforms, they're not usually downloaded from piwheels because PyPI takes precedence.

We also see trends in things like which Python versions are used over time. This shows the quick takeover of Python 3.7 from 3.5 when Raspbian Buster was released:

![Data from piwheels on Python versions used over time][21]

You can see more trends in our [stats blog posts][22].

### Time saved

Every package build is logged in the database, and every download is also stored. Cross-referencing downloads with build duration shows how much time has been saved. One example is numpy—the latest version took about 11 minutes to build.

So far, piwheels has saved users a total of over 165 years of build time. At the current usage rate, piwheels saves _over 200 days per day_.

As well as saving build time, having pre-compiled wheels also means people don't have to install various development tools to build packages. Some packages require other apt packages for them to access shared libraries. Figuring out which ones you need can be a pain, so we made that step easier, too. First, we figured out the process and [documented it on our blog][23]. Then we added this logic to the build process so that when a wheel is built, its dependencies are automatically calculated and added to the package's project page:

![numpy dependencies][24]

### What next for piwheels?

We launched project pages (e.g., [numpy][25]) this year, which are a really useful way to let people look up information about a project in a human-readable way. They also make it easier for people to report issues, such as if a project is missing from piwheels or they have an issue with a package they've downloaded.

In early 2020, we're planning to roll out some upgrades to piwheels that will enable a new JSON API, so you can automatically check which versions are available, look up dependencies for a project, and lots more.

The next Debian/Raspbian upgrade won't happen until mid-2021, so we won't start building wheels for any new Python versions until then.

You can read more about piwheels on the project's [blog][26], where I'll be publishing a 2019 roundup early in 2020. You can also follow [@piwheels][27] on Twitter, where you'll see daily and monthly stats along with any milestones reached.

Of course, piwheels is an open source project, and you can see the entire project [source code on GitHub][28].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/piwheels

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rainbow-pinwheel-piwheel-diversity-inclusion.png?itok=di41Wd3V (rainbow colors on pinwheels in the sun)
[2]: https://pypi.org/
[3]: https://opensource.com/sites/default/files/uploads/piwheels.png (Piwheels logo)
[4]: https://opensource.com/article/18/10/piwheels-python-raspberrypi
[5]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4_0.jpg (Raspberry Pi 4)
[6]: https://www.raspberrypi.org/downloads/raspbian/
[7]: http://piwheels.org
[8]: https://www.mythic-beasts.com/order/rpi
[9]: https://opensource.com/sites/default/files/uploads/pi-cloud.png (Mythic Beasts hosting service)
[10]: https://www.piwheels.org/project/pycparser
[11]: https://www.piwheels.org/project/PyYAML
[12]: https://www.piwheels.org/project/numpy
[13]: https://www.piwheels.org/project/cffi
[14]: https://www.piwheels.org/project/MarkupSafe
[15]: https://www.piwheels.org/project/future
[16]: https://www.piwheels.org/project/aiohttp
[17]: https://www.piwheels.org/project/cryptography
[18]: https://www.piwheels.org/project/home-assistant-frontend
[19]: https://www.piwheels.org/project/multidict
[20]: https://piwheels.org/project/urllib3/
[21]: https://opensource.com/sites/default/files/uploads/pyvers2019.png (Data from piwheels on Python versions used over time)
[22]: https://blog.piwheels.org/piwheels-stats-for-2019/
[23]: https://blog.piwheels.org/how-to-work-out-the-missing-dependencies-for-a-python-package/
[24]: https://opensource.com/sites/default/files/uploads/numpy-deps.png (numpy dependencies)
[25]: https://www.piwheels.org/project/numpy/
[26]: https://blog.piwheels.org/
[27]: https://twitter.com/piwheels
[28]: https://github.com/piwheels/
