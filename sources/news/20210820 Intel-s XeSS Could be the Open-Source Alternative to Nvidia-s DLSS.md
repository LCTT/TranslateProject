[#]: subject: "Intel’s XeSS Could be the Open-Source Alternative to Nvidia’s DLSS"
[#]: via: "https://news.itsfoss.com/intel-xess-open-source/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Intel’s XeSS Could be the Open-Source Alternative to Nvidia’s DLSS
======

Over the past year, everyone in the PC gaming community has been talking about DLSS and FidelityFX. However, it seems that Linux gamers have been missing out, with DLSS only working through Proton when combined with a beta Nvidia driver and FidelityFX leaving much to be desired in terms of graphics.

Fortunately, Intel appears to want to change that with their new XeSS frame rate boosting technology. Launching alongside their upcoming Alchemist range of GPUs, it promises the ease of implementation of FidelityFX while competing in terms of image quality with DLSS.

Here, we will be exploring how this technology works and the incredible impact it will have on gaming on Linux.

### Is it like Nvidia’s DLSS?

![][1]

Similar to DLSS (Deep Learning Super Sampling), XeSS stands for Xe Super Sampling. AMD’s FidelityFX is a collection of technologies that enable games to run at a much higher frame rate than traditional rendering with minimal loss to visual quality.

Currently, two different technologies are used to achieve this. These are AI and traditional upscaling, both with various drawbacks and advantages.

#### Traditional Upscaling

Unlike AI, this approach has been worked on for many years. Previously, we have seen it being used in many TVs, computer monitors, and even some games to make a lower resolution image (or frame) appear clearer, with decent results.

This is the technology that AMD has chosen for their FidelityFX. They did this for several reasons; some possible ones include:

  * Easier implementation by game developers
  * The capability to run on almost any GPU
  * Proven technology



That isn’t to say that it is without its disadvantages, some being:

  * Reduced visual quality compared to AI-based solutions
  * More limited in opportunities to improve it in the future



AMD is currently the only major company using this technology for game upscaling. That means that we must move on to the other major upscaling technology: AI.

#### AI Upscaling

![][2]

It is the latest advancement in upscaling technology used by DLSS and XeSS.

Unlike traditional upscaling, this approach typically depends on some special hardware to run.

Specifically, it would help if you had a GPU with dedicated AI cores. On Nvidia’s cards, these come in the form of Tensor cores.

Because these cores are new, they are only available on 20 and 30 series GPUs, meaning that older cards are stuck with traditional upscaling. Additionally, it is much harder for developers to implement as the AI needs to be “trained,” involving feeding the AI thousands of hours of gameplay.

Yet, these trade-offs are worth it for many people, as AI provides better image quality and performance.

This is the route Intel has taken for its solution.

### Open Source and Upscaling

DLSS is completely closed source in true Nvidia style, like the drivers that annoyed Linus Torvalds so much.

Fortunately, Intel is following in the footsteps of AMD, and they plan to open-source XeSS once it’s ready for prime time.

While there is no significant commitment made by them, but multiple reports suggest that they plan to eventually open-source it.

This allows them to take advantage of the numerous contributions the open-source community will (hopefully) make. The result should be a fascinating GPU landscape with many different technologies and companies constantly fight for the top spot in upscaling.

### Intel XeSS

![][3]

Compared to Nvidia’s DLSS (XeSS’s main competitor), XeSS promises better performance, visual quality, and ease of implementation.

So far, we have seen demos running at as much as double the native performance, backing up the performance claims. But that’s press material for now.

As I mentioned, Intel is planning to make it open-source.

While it may not be open-source at launch, they intend on open-sourcing once it matures.

![][4]

If Intel is to be believed, this could be the killer feature of their upcoming Alchemy GPUs, putting them ahead of both AMD and Nvidia in one single scoop.

### Final Thoughts

I am incredibly excited about this feature, more so than I was about DLSS and FidelityFX combined. It should be noted that this is still some time away, with it expected to release in early 2022.

Overall, it looks like a significant step forward for Intel and maybe the key to them coming back from behind AMD and Nvidia.

_Are you excited about XeSS? Let me know in the comments below!_

**Via**: [Videocardz][5]

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/intel-xess-open-source/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM4MSIgd2lkdGg9IjY3OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://i2.wp.com/i.ytimg.com/vi/-Dp61_bM948/hqdefault.jpg?w=780&ssl=1
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzMiIgd2lkdGg9Ijc2OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://videocardz.com/newz/intel-xess-ai-based-super-sampling-technology-will-be-open-source-once-it-matures
