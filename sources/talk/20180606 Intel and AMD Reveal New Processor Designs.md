Intel and AMD Reveal New Processor Designs
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/whiskey-lake.jpg?itok=b1yuW71L)

With this week's Computex show in Taipei and other recent events, processors are front and center in the tech news cycle. Intel made several announcements ranging from new Core processors to a cutting-edge technology for extending battery life. AMD, meanwhile, unveiled a second-gen, 32-core Threadripper CPU for high-end gaming and revealed some new Ryzen chips including some embedded friendly models.

Here’s a quick tour of major announcements from Intel and AMD, focusing on those processors of greatest interest to embedded Linux developers.

### Intel’s latest 8th Gen CPUs

In April, Intel announced that mass production of its 10nm fabricated Cannon Lake generation of Core processors would be delayed until 2019, which led to more grumbling about Moore’s Law finally running its course. Yet, there were plenty of consolation prizes in Intel’s [Computex showcase][1]. Intel revealed two power-efficient, 14nm 8th Gen Core product families, as well as its first 5GHz designs.

The Whiskey Lake U-series and Amber Lake Y-series Core chips will arrive in more than 70 different laptop and 2-in-1 models starting this fall. The chips will bring “double digit performance gains” compared to 7th Gen Kaby Lake Core CPUs, said Intel. The new product families are more power efficient than the [Coffee Lake][2] chips that are now starting to arrive in products.

Both Whiskey Lake and Amber Lake will provide Intel’s higher performance gigabit WiFi ((Intel 9560 AC), which is also appearing on the new [Gemini Lake][3] Pentium Silver and Celeron SoCs, the follow-ups to the Apollo Lake generation. Gigabit WiFi is essentially Intel’s spin on 802.11ac with 2×2 MU-MIMO and 160MHz channels.

Intel’s Whiskey Lake is a continuation of the 7th and 8th Gen Skylake U-series processors, which have been popular on embedded equipment. Intel had few details, but Whiskey Lake will presumably offer the same, relatively low 15W TDPs. It’s also likely that like the [Coffee Lake U-series chips][4] it will be available in quad-core models as well as the dual-core only Kaby Lake and Skylake U-Series chips.

The Amber Lake Y-series chips will primarily target 2-in-1s. Like the dual-core [Kaby Lake Y-Series][5] chips, Amber Lake will offer 4.5W TDPs, reports [PC World][6].

To celebrate Intel’s upcoming 50th anniversary, as well as the 40th anniversary of the first 8086 processor, Intel will launch a limited edition, 8th Gen [Core i7-8086K][7] CPU with a clock rate of 4GHz. The limited edition, 64-bit offering will be its first chip with 5GHz, single-core turbo boost speed, and the first 6-core, 12-thread processor with integrated graphics. Intel will be [giving away][8] 8,086 of the overclockable Core i7-8086K chips starting on June 7.

Intel also revealed plans to launch a new high-end Core X series with high core and thread counts by the end of the year. [AnandTech predicts][9] that this will use the Xeon-like Cascade Lake architecture. Later this year, it will announce new Core S-series models, which AnandTech projects will be octa-core Coffee Lake chips.

Intel also said that the first of its speedy Optane SSDs -- an M.2 form-factor product called the [905P][10] \-- is finally available. Due later this year is an Intel XMM 800 series modem that supports Sprint’s 5G cellular technology. Intel says 5G-enabled PCs will arrive in 2019.

### Intel promises all day laptop battery life

In other news, Intel says it will soon launch an Intel Low Power Display Technology that will provide all-day battery life on laptops. Co-developers Sharp and Innolux are using the technology for a late-2018 launch of a 1W display panel that can cut LCD power consumption in half.

### AMD keeps on ripping

At Computex, AMD unveiled a second generation Threadripper CPU with 32 cores and 64 threads. The high-end gaming processor will launch in the third quarter to go head to head with Intel’s unnamed 28-core monster. According to [Engadget][11], the new Threadripper adopts the same 12nm Zen+ architecture used by its Ryzen chips.

AMD also said it was sampling a 7nm Vega Instinct GPU designed for graphics cards with 32GB of expensive HBM2 memory rather than GDDR5X or GDDR6. The Vega Instinct will offer 35 percent greater performance and twice the power efficiency of the current 14nm Vega GPUs. New rendering capabilities will help it compete with Nvidia’s CUDA enabled GPUs in ray tracing, says [WCCFTech][12].

Some new Ryzen 2000-series processors recently showed up on an ASRock CPU chart that have the lowest power efficiency of the mainstream Ryzen chips. As detailed on [AnandTech][13], the 2.8GHz, octa-core, 16-thread Ryzen 7 2700E and 3.4GHz/3.9GHz, hexa-core, 12-thread Ryzen 5 2600E each have 45W TDPs. This is higher than the 12-54W TDPs of its [Ryzen Embedded V1000][2] SoCs, but lower than the 65W and up mainstream Ryzen chips. The new Ryzen-E models are aimed at SFF (small form factor) and fanless systems.

Join us at [Open Source Summit + Embedded Linux Conference Europe][14] in Edinburgh, UK on October 22-24, 2018, for 100+ sessions on Linux, Cloud, Containers, AI, Community, and more.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/6/intel-amd-and-arm-reveal-new-processor-designs

作者：[Eric Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://newsroom.intel.com/editorials/pc-personal-contribution-platform-pushing-boundaries-modern-computers-computex/
[2]:https://www.linux.com/news/elc-openiot/2018/3/hot-chips-face-mwc-and-embedded-world
[3]:http://linuxgizmos.com/intel-launches-gemini-lake-socs-with-gigabit-wifi/
[4]:http://linuxgizmos.com/intel-coffee-lake-h-series-debuts-in-congatec-and-seco-modules
[5]:http://linuxgizmos.com/more-kaby-lake-chips-arrive-plus-four-nuc-mini-pcs/
[6]:https://www.pcworld.com/article/3278091/components-processors/intel-computex-news-a-28-core-chip-a-5ghz-8086-two-new-architectures-and-more.html
[7]:https://newsroom.intel.com/wp-content/uploads/sites/11/2018/06/intel-i7-8086k-launch-fact-sheet.pdf
[8]:https://game.intel.com/8086sweepstakes/
[9]:https://www.anandtech.com/show/12878/intel-discuss-whiskey-lake-amber-lake-and-cascade-lake
[10]:https://www.intel.com/content/www/us/en/products/memory-storage/solid-state-drives/gaming-enthusiast-ssds/optane-905p-series.htm
[11]:https://www.engadget.com/2018/06/05/amd-threadripper-32-cores/
[12]:https://wccftech.com/amd-demos-worlds-first-7nm-gpu/
[13]:https://www.anandtech.com/show/12841/amd-preps-new-ryzen-2000series-cpus-45w-ryzen-7-2700e-ryzen-5-2600e
[14]:https://events.linuxfoundation.org/events/elc-openiot-europe-2018/
