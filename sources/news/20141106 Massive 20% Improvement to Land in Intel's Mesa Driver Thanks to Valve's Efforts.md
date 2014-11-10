Massive 20% Improvement to Land in Intel's Mesa Driver Thanks to Valve's Efforts
================================================================================
> A group of devs from LunarG found a bottleneck in the driver

**Intel users should see a major improvement with their hardware after a group of developers from LunarG found out that there was a bottleneck in the DRM driver.**

![](http://i1-news.softpedia-static.com/images/news2/Massive-20-Improvement-to-Land-in-Intel-s-Mesa-Driver-Thanks-to-Valve-s-Efforts-464233-2.jpg)

The drivers on the Linux platform are not stellar, and most of the time, pieces of hardware work better on other operating systems, like Windows, for example. It might be strange that the same game, on the same hardware, works better on one platform than it does on the other, but things have been like this forever and no one expects any kind of big breakthroughs.

To be fair, the drivers from AMD, NVIDIA, and Intel have been improving in the last couple of years, especially after Steam for Linux was released. Actually, LunarG works with Valve to improve the state of the Intel drivers and to find ways to boost the performance on Linux. They had a big breakthrough and a kernel update should arrive very soon.

### Users with Intel-powered machines should be very happy ###

Valve tasked LunarG with improving the Intel drivers, which are lagging a little bit behind the competition, at least in terms of graphics. Some of the latest Intel processors are pretty powerful and you would expect them to be able to perform much better, at least as well as on Windows, but there was a problem.

The guys from LunarG worked on a piece of software called GlassyMesa, which drastically improved Intel's shader compiler stack. They also made a number of improvements in the past few months, but none of these changes was reflected in the driver's performance. This led them to believe that there had to be a bottleneck somewhere along the line.

"We started to suspect there was a bigger bottleneck masking the improvements, and sure enough we were able to generate a test program that showed a huge performance issue with how the hardware samplers were working as compared to the OpenGL driver running under windows. Something was slowing down the samplers on Linux, and we were determined to find out what," wrote the devs on their blog.

They did all sorts of testing, but they don't have access to the way the hardware is set up. Therefore, they sent the test program to Intel and the engineers found the problem and corrected it. As you can imagine, the people at Intel didn't say anything about what they actually corrected.

### 20% increase in performance is no small matter ###

In any case, LunarG also published some of the improvements they saw, and one of them is a 20% increase in game framerate.

- Left4Dead2 with frames that have hordes of zombies we've seen an increase of 17-25%
- Counter-Strike GO: 16-20%
- Lightsmark increased on a GT2 by 60% (HD4600) 4770

A kernel patch is required to make all these improvements available to users. It's not clear whether it will be available in Linux kernel 3.18 or 3.19, but it's coming. It also means that the kernel patch will be backported to the SteamOS kernel as well. 

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Massive-20-Improvement-to-Land-in-Intel-s-Mesa-Driver-Thanks-to-Valve-s-Efforts-464233.shtml

作者：[Silviu Stahie][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/silviu-stahie