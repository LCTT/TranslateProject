[#]: subject: "Fedora Workstation’s State of Gaming – A Case Study of Far Cry 5 (2018)"
[#]: via: "https://fedoramagazine.org/fedora-workstation-state-of-gaming-far-cry-5/"
[#]: author: "Akashdeep Dhar https://fedoramagazine.org/author/t0xic0der/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Workstation’s State of Gaming – A Case Study of Far Cry 5 (2018)
======
![][1]

[Liam Dawe/GamingOnLinux, PNG version by Vulphere][2], [CC BY-SA 4.0][3], via Wikimedia Commons

First-person shooter video games are a great proving ground for strategies that make you finish on the top, reflexes that help you to shoot before getting shot and agility that adjusts you to whatever a situation throws at you. Add the open-ended nature brought in by large intricately-designed worlds into the mix, and it dials the player experience to eleven and, with that, it also becomes great evidence of what a platform is capable of. Needless to say, I have been a great fan of open-world first-person shooter games. And Ubisoft’s Far Cry series happens to be the one which remains closest to my heart. So I tried the (second) most recent release in the long-running series, Far Cry 5 which came out in 2018, on Fedora Workstation 35 to see how it performs.

Just like in [my previous case study][4], the testing hardware has an AMD RDNA2-based GPU, where the video game was configured to the *highest possible graphical preset* to stress the hardware into performing as much as its limiting factor. To ensure that we have a fair comparison, I set up two environments – one with Windows 10 Pro 21H2 and one with Fedora Workstation 35, both having up-to-date drivers and support software such as MSI Afterburner or MangoHUD for monitoring, Steam or Lutris for video game management and OBS Studio for footage recording. Adding to that, the benchmarks were ensured to be both representatives of a common gameplay scenario and variable enough to address resolution scaling and HD textures.

![][5]

Before we get into some actual performance testing and comparison results, I would like to go into detail about the video game that is at the centre of this case study. Far Cry 5 is a first-person action-adventure video game developed by Ubisoft Montreal and Ubisoft Toronto. The player takes the role of an unnamed junior deputy sheriff who is trapped in Hope County, a fictional region based in Montana and has to fight against a doomsday cult to take back the county from the grasp of its charismatic and powerful leader. The video game has been well received for the inclusion of branching storylines, role-playing elements and side quests, and is optimized enough to be a defining showcase of what the underlying hardware and platform are capable of.

### Preliminary

#### Framerate

The first test that was performed had a direct implication on how smooth the playing experience would be across different platforms but on the same hardware configuration.

##### Without HD textures

On a default Far Cry 5 installation, I followed the configuration stated above but opted out of the HD textures pack to warm up the platforms with a comparatively easier test. Following are the results.

![][6]

1. On average, the video game had around a whopping 59.25% more framerate on Fedora Workstation 35 than on Windows 10 Pro 21H2.
2. To ensure an overall consistent performance, both the minimum and maximum framerates were also noted to monitor dips and rises.
3. The minimum framerates on Fedora Workstation 35 were ahead by a big 49.10% margin as compared to those on Windows 10 Pro 21H2.
4. The maximum framerates on Fedora Workstation 35 were ahead by a big 62.52% margin as compared to those on Windows 10 Pro 21H2.
5. The X11 display server had roughly 0.52% more minimum framerate as compared to Wayland, which can be taken as a margin of error.
6. The Wayland display server had roughly 3.87% more maximum framerate as compared to X11, which can be taken as a margin of error.

##### With HD textures

On a default Far Cry 5 installation, I followed the configuration stated above, but this time I enabled the HD textures pack to stress the platforms with a comparatively harder test. Following are the results.

![][7]

1. On average, the video game had around a whopping 65.63% more framerate on Fedora Workstation 35 than on Windows 10 Pro 21H2.
2. To ensure an overall consistent performance, both the minimum and maximum framerates were also noted to monitor dips and rises.
3. The minimum framerates on Fedora Workstation 35 were ahead by a big 59.11% margin as compared to those on Windows 10 Pro 21H2.
4. The maximum framerates on Fedora Workstation 35 were ahead by a big 64.21% margin as compared to those on Windows 10 Pro 21H2.
5. The X11 display server had roughly 9.77% more minimum framerate as compared to Wayland, which is big enough to be considered.
6. The Wayland display server had roughly 1.12% more maximum framerate as compared to X11, which can be taken as a margin of error.

#### Video memory usage

The second test that was performed had less to do with the playing experience and more with the efficiency of graphical resource usage. Following are the results.

##### Without HD textures

On a default Far Cry 5 installation, I followed the configuration stated above but opted out of the HD textures pack to use comparatively lesser video memory across the platforms. Following are the results.

![][8]

1. On average, Fedora Workstation 35 uses around 31.94% lesser video memory as compared to Windows 10 Pro 21H2.
2. The Wayland display server uses roughly 1.78% more video memory as compared to X11, which can be taken as a margin of error.
3. The video game usage estimated is closer to the actual readings on Fedora Workstation 35 than they are those on Windows 10 Pro 21H2.
4. Adding this to the previous results speaks about how Fedora Workstation 35 performs better while using fewer resources.

##### With HD textures

On a default Far Cry 5 installation, I followed the configuration stated above but this time I enabled the HD textures pack to stress the platforms by occupying more video memory. Following are the results.

![][9]

1. On average, Fedora Workstation 35 uses around 22.79% lesser video memory as compared to Windows 10 Pro 21H2.
2. The Wayland display server uses roughly 2.73% more video memory as compared to X11, which can be taken as a margin of error.
3. The video game usage estimated is closer to the actual readings on Fedora Workstation 35 than they are those on Windows 10 Pro 21H2.
4. Adding this to the previous results speaks about how Fedora Workstation 35 performs better while using fewer resources.

#### System memory usage

The third test that was performed had less to do with the playing experience and more with how other applications can fit in the available memory while the video game is running. Following are the results.

##### Without HD textures

On a default Far Cry 5 installation, I followed the configuration stated above but opted out of the HD textures pack to warm up the platforms with a comparatively easier test. Following are the results.

![][10]

1. On average, Fedora Workstation 35 uses around 38.10% lesser system memory as compared to Windows 10 Pro 21H2.
2. The Wayland display server uses roughly 4.17% more system memory as compared to X11, which can be taken as a margin of error.
3. Adding this to the previous results speaks about how Fedora Workstation 35 performs better while using fewer resources.
4. Lesser memory usage by the video game leaves out extra headroom for other applications to run simultaneously with no compromises.

##### With HD textures

On a default Far Cry 5 installation, I followed the configuration stated above, but this time I enabled the HD textures pack to stress the platforms with a comparatively harder test. Following are the results.

![][11]

1. On average, Fedora Workstation 35 uses around 33.58% lesser system memory as compared to Windows 10 Pro 21H2.
2. The Wayland display server uses roughly 7.28% more system memory as compared to X11, which is big enough to be considered.
3. Adding this to the previous results speaks about how Fedora Workstation 35 performs better while using fewer resources.
4. Lesser memory usage by the video game leaves out extra headroom for other applications to run simultaneously with no compromises.

### Advanced

#### Without HD textures

On a default Far Cry 5 installation, I followed the previously stated configuration without the HD textures pack and ran the tests with varied resolution multipliers. Following are the results.

##### Minimum framerates recorded

![][12]

1. A great deal of inconsistent performance is visible on Fedora Workstation 35 with both display servers in lower resolution scales.
2. The inconsistencies seem to normalize for the resolution multipliers on and beyond the 1.1x resolution scale for Fedora Workstation 35.
3. Resolution multipliers do not seem to have a great effect on the framerate on Windows 10 Pro 21H2 as much as on Fedora Workstation 35.
4. Although Windows 10 Pro 21H2 misses out on potential performance advantages in lower resolution multipliers, it has been consistent.
5. Records on Windows 10 Pro 21H2 in the 2.0x resolution multiplier appear to be marginally better than those on Fedora Workstation 35.

##### Maximum framerates recorded

![][13]

1. A small amount of inconsistent performance is visible on Fedora Workstation 35 with both display servers in lower resolution scales.
2. The inconsistencies seem to normalize for the resolution multipliers on and beyond the 1.1x resolution scale for Fedora Workstation 35.
3. Resolution multipliers change starts noticeably affecting performance on Windows 10 Pro 21H2 on a 1.6x scale, beyond which it falls greatly.
4. Although Windows 10 Pro 21H2 misses out on potential performance advantages in lower resolution multipliers, it has been consistent.
5. Records on Windows 10 Pro 21H2 in the 1.6x resolution multiplier and beyond appear to be better than those on Fedora Workstation 35.

##### Average framerates recorded

![][14]

1. A minor amount of inconsistent performance is visible on Fedora Workstation 35 with both display servers in lower resolution scales.
2. The inconsistencies seem to normalize for the resolution multipliers on and beyond the 1.1x resolution scale for Fedora Workstation 35.
3. Resolution multipliers change starts noticeably affecting performance on Windows 10 Pro 21H2 on a 1.6x scale, beyond which it falls greatly.
4. Although Windows 10 Pro 21H2 misses out on potential performance advantages in lower resolution multipliers, it has been consistent.
5. Records on Windows 10 Pro 21H2 in the 1.9x resolution multiplier and beyond appear to be better than those on Fedora Workstation 35.

#### With HD textures

On a default Far Cry 5 installation, I followed the previously stated configuration with the HD textures pack and ran the tests with varied resolution multipliers. Following are the results.

##### Minimum framerates recorded

![][15]

1. A great deal of inconsistent performance is visible on Fedora Workstation 35 with both display servers in lower resolution scales.
2. The inconsistencies seem to normalize for the resolution multipliers on and beyond the 1.5x resolution scale for Fedora Workstation 35.
3. Resolution multipliers do not seem to have a great effect on the framerate on Windows 10 Pro 21H2 as much as on Fedora Workstation 35.
4. Although Windows 10 Pro 21H2 misses out on potential performance advantages in lower resolution multipliers, it has been consistent.
5. Records on Windows 10 Pro 21H2 in the 2.0x resolution multiplier appear to be marginally better than those on Fedora Workstation 35.

##### Maximum framerates recorded

![][16]

1. A great deal of inconsistent performance is visible on Fedora Workstation 35 with both display servers in lower resolution scales.
2. The inconsistencies seem to normalize for the resolution multipliers on and beyond the 1.0x resolution scale for Fedora Workstation 35.
3. Resolution multipliers change starts noticeably affecting performance on Windows 10 Pro 21H2 on a 1.6x scale, beyond which it falls greatly.
4. Although Windows 10 Pro 21H2 misses out on potential performance advantages in lower resolution multipliers, it has been consistent.
5. Records on Windows 10 Pro 21H2 in the 1.6x resolution multiplier and beyond appear to be better than those on Fedora Workstation 35.

##### Average framerates recorded

![][17]

1. A minor amount of inconsistent performance is visible on Fedora Workstation 35 with both display servers in lower resolution scales.
2. The inconsistencies seem to normalize for the resolution multipliers on and beyond the 1.1x resolution scale for Fedora Workstation 35.
3. Resolution multipliers change starts noticeably affecting performance on Windows 10 Pro 21H2 on a 1.6x scale, beyond which it falls greatly.
4. Although Windows 10 Pro 21H2 misses out on potential performance advantages in lower resolution multipliers, it has been consistent.
5. Records on Windows 10 Pro 21H2 in the 1.9x resolution multiplier and beyond appear to be better than those on Fedora Workstation 35.

### Inferences

If the test results and observations baffle you, please allow me to tell you that you are not the only one who feels like that. For a video game that was created to run on Windows, it is hard to imagine how it ends up performing way better on Fedora Workstation 35, all while using a much lesser amount of system resources at all times. Special attention has been given to noting down the highest highs and lowest lows of framerates to ensure that consistent performance is made available.

But wait a minute – how is it that Fedora Workstation 35 manages to make this possible? Well, while I do not have a clear idea of what exactly goes on behind the scenes, I do have a certain number of assumptions that I suspect might be the reasons attributing to such brilliant visuals, great framerates and efficient resource usage. These can potentially act as starting points for us to understand the features of Fedora Workstation 35 for compatibility layers to make use of.

1. Effective caching of graphical elements and texture assets in the video memory allows for keeping only those data in the memory which are either actively made use of or regularly referenced. The open-source AMD drivers help Fedora Workstation 35 make efficient use of the available frame buffer.
2. Quick and frequent cycling of data elements from the video memory helps to bring down total occupancy per application at any point in time. The memory clocks and shader clocks are left at the application’s disposal by the open-source AMD drivers, and firmware bandwidth limits are all but absent.
3. With AMD Smart Access Memory (SAM) enabled, the CPU is no longer restricted to using only 256MiB of the video memory at a time. A combination of leading-edge kernel and up-to-date drivers makes it available on Fedora Workstation 35 and capable of harnessing the technology to its limits.
4. Extremely low system resource usage by supporting software and background services leaves out a huge majority of them to be used by the applications which need it the most. Fedora Workstation 35 is a lightweight distribution, which does not get in your way and puts the resources on what’s important.
5. Faster loading of data elements to and from the physical storage devices to the system memory is greatly enhanced with the use of high-capacity modern copy-on-write file systems like BTRFS and journaling file systems like EXT4, which happens to be the suggested file system for Fedora Workstation 35.

Performance improvements like these only make me want to indulge more in testing and finding out what else Fedora Workstation is capable of. Do let me know what you think in the comments section below.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-workstation-state-of-gaming-far-cry-5/

作者：[Akashdeep Dhar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/t0xic0der/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/06/gaming-2-816x345.jpg
[2]: https://commons.wikimedia.org/wiki/File:Steam_Deck_(front).png
[3]: https://creativecommons.org/licenses/by-sa/4.0
[4]: https://fedoramagazine.org/fedora-workstations-state-of-gaming/
[5]: https://user-images.githubusercontent.com/49605954/172998217-ea8b7adf-1f83-4f46-89d1-9406387542c3.png
[6]: https://user-images.githubusercontent.com/49605954/172686721-eb2469c0-a81f-4e32-a4b3-aabbdb0035a4.svg
[7]: https://user-images.githubusercontent.com/49605954/172686709-8c5a17e6-9e91-4a21-8c8e-95fc9606853c.svg
[8]: https://user-images.githubusercontent.com/49605954/172686723-d03b6a2f-7950-416c-9256-cae1e0a15e2f.svg
[9]: https://user-images.githubusercontent.com/49605954/172686713-2b45753b-92ad-4ecf-801f-b8e5e2bd7778.svg
[10]: https://user-images.githubusercontent.com/49605954/172686727-dc6feb71-30ef-4792-90c6-72a3c1f95da7.svg
[11]: https://user-images.githubusercontent.com/49605954/172686719-6c9f621c-a41b-454e-92b3-7cf9a5f79502.svg
[12]: https://user-images.githubusercontent.com/49605954/172686748-bcba2e85-9f3e-4331-9338-238748424081.svg
[13]: https://user-images.githubusercontent.com/49605954/172686758-36422b22-b66c-4ee5-bb74-b7bdf3d4d02a.svg
[14]: https://user-images.githubusercontent.com/49605954/172686753-f20e057d-c631-4aa7-9366-0d84dd227840.svg
[15]: https://user-images.githubusercontent.com/49605954/172686730-450b7d5b-8e13-49a8-8967-cb820514ec28.svg
[16]: https://user-images.githubusercontent.com/49605954/172686745-1b4fd578-91b9-4080-8049-05736774f484.svg
[17]: https://user-images.githubusercontent.com/49605954/172686739-1139158c-0e85-484c-ba42-d3ddac07419a.svg
