[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (GNOME and KDE team up on the Linux desktop, docs for Nvidia GPUs open up, a powerful new way to scan for firmware vulnerabilities, and more news)
[#]: via: (https://opensource.com/article/19/8/news-august-17)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

GNOME and KDE team up on the Linux desktop, docs for Nvidia GPUs open up, a powerful new way to scan for firmware vulnerabilities, and more news
======
Catch up on the biggest open source headlines from the past two weeks.
![Weekly news roundup with TV][1]

In this edition of our open source news roundup, we take a look two new powerful data visualization tools, Nvidia open sourcing GPU documentation, exciting new tooling to secure firmware for self-driving cars, and more!

### GNOME and KDE partner on the Linux Desktop

Linux on desktop computers has been a space of fragmentation. In a recent [announcement][2], "the two chief Linux desktop rivals, [GNOME Foundation][3] and [KDE][4], have agreed to work together."

Both organizations will be sponsors of [Linux App Summit (LAS) 2019][5] in Barcelona this November. This move, in part, appears to be in response to desktop computing no longer being the best place to fight for dominance. No matter the reason, Linux desktop fans have a new reason to hope for a future where there is a standardized GUI environment. 

### New open source data visualization tools

There's very little in the world that isn't driven by data. Unless that data is in a shape that people can interact with, it's not much good. Two data visualization projects that were recently open sourced are trying to make data a little more useful.

The first tool, called **Neuroglancer**, was created by [a research team at Google][6]. It "enables neurologists to build 3D models of a brain’s neural pathways in interactive visualisations." Neuroglancer does that by using a neural network to trace paths of neurons in a brain and build a complete visualization. Scientists have already used Neuroglancer, which you can [grab off GitHub][7], to build an interactive map from scans of a fruit fly's brain.

The second tool comes from an unlikely source: the Australian Signals Directorate. That's the country's analog to the NSA, which "open sourced one of its [in-house data visualisation and analysis tools][8]." Called **[Constellation][9]**, it can "identify trends and patterns in complex datasets, and is capable of scaling to 'billions of inputs'." Mike Burgess, the agency's Director General, said that he hopes "this tool will help generate scientific and other breakthroughs that will benefit all Australians." Given it is open source, it could benefit the whole world.

### Nvidia begins releasing GPU documentation

Over the years, graphics processing unit (GPU) maker Nvidia hasn't made it easy for open source projects to develop drivers for its wares. The company took a big step towards making nice with those projects by [publishing GPU hardware documentation.][10]

The documentation, which the company is releasing under an MIT license, is [available on GitHub][11]. It covers several key areas — like device initialization, memory clocking/tweaking, and power states. According to hardware news site Phoronix, the Nouveau project (which develops open source drivers for Nvidia GPUs) will be the among the first to use this documentation to boost its development efforts.

### New tool for securing firmware

It seems as if every week there's news of a new vulnerability in a mobile device or an internet-connected gadget. Often, those vulnerabilities are found in the firmware that controls a device. Self-driving car service Cruise has [released an open source tool][12] for catching those vulnerabilities before they become a problem.

That tool is called [FwAnalzyer][13]. It checks firmware code for a number of potential problems, including "identify(ing) potentially dangerous executables," and pinpointing "any debugging code that was mistakenly left behind." Collin Mulliner, an engineer at Cruise who helped develop the tool, said that by running FwAnalyzer over their code, firmware developers "now have the ability to detect and prevent a wide variety of security issues."

#### In other news

  * [Why Los Angeles decided to open source its future][14]
  * [The MIT Press releases a comprehensive report on open-source publishing software][15]
  * [Huawei unveils Harmony operating system, won't ditch Android for smartphones][16]



*Thanks, as always, to Opensource.com staff members and moderators for their help this week. *

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/news-august-17

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://www.zdnet.com/article/gnome-and-kde-work-together-on-the-linux-desktop/
[3]: https://www.gnome.org/
[4]: https://kde.org/
[5]: https://linuxappsummit.org/
[6]: https://www.cbronline.com/news/brain-mapping-google-ai
[7]: https://github.com/google/neuroglancer
[8]: https://www.computerworld.com.au/article/665286/australian-signals-directorate-open-sources-data-analysis-tool/
[9]: https://www.constellation-app.com/
[10]: https://www.phoronix.com/scan.php?page=news_item&px=NVIDIA-Open-GPU-Docs
[11]: https://github.com/nvidia/open-gpu-doc
[12]: https://arstechnica.com/information-technology/2019/08/self-driving-car-service-open-sources-new-tool-for-securing-firmware/
[13]: https://github.com/cruise-automation/fwanalyzer
[14]: https://www.techrepublic.com/article/why-la-decided-to-open-source-its-future/
[15]: https://news.mit.edu/2019/mit-press-report-open-source-publishing-software-0808
[16]: https://www.itnews.com.au/news/huawei-unveils-harmony-operating-system-wont-ditch-android-for-smartphones-529432
