zpl1025
Embedded tech and use of Linux at the 2014 GPU Technology Conference
================================================================================
![Image by opensource.com](http://opensource.com/sites/default/files/imagecache/image-full-size/images/life-uploads/gputechcon2.jpg)

This year I attended my first [GPU Technology Conference][1] in San Jose, California (it took place the week after the [Game Developers Conference][2]). Hosted by NVIDIA, the event featured a range of talks from a large array of market segments including automotive, motion picture, gaming, scientific, cloud, system integrators, and startups. The schedule was a mixture of three main keynotes, 500 technical sessions, hands-on programming labs, demos, and an expo floor with a large number of vendors showing their latest work.

![](http://opensource.com/sites/default/files/resize/images/life-uploads/gputechconf1-520x385.jpg)

The first keynote took place on the second day, and was delivered by Jen-Hsun Huang, NVIDIA CEO. His talk featured announcements of new architectures such as [Pascal][3] that will power the next generation of GPGPU products from the company, to the [Jetson TK1][4] which is billed as the world's first embedded supercomputer. While Pascal will be used in the next generation of supercomputers and workstations, Jetson is targeted at the embedded market and both make extensive use of Linux. The keynote featured an Audi self-driven car appearing on stage powered by a Jetson-based architecture, and it ended in the announcement that all attendees would receive an Android powered NVIDIA shield.

![](http://opensource.com/sites/default/files/resize/images/life-uploads/jetson-350x466.jpg)

The second keynote featured a live demo of the real-time rendering work done at Pixar, showing how the animators have benefited from the latest developments in GPU technology to more effectively gain feedback before final renders. The final keynote was delivered by Dr. Adam Gazzaley, a neuroscientist at the University of California at San Francisco who is working on the use of video games for cognitive enhancement. This featured a live demo with virtual reality using the Occulus Rift, and real-time electrical measurement/feedback into the game.

![](http://opensource.com/sites/default/files/resize/images/life-uploads/pixartech2-520x390.jpg)

One of the major reasons I attended was to learn more about the latest development in visualization, and there were a good number of sessions that looked at this along with the synergy of GPGPU computation and real-time feedback from visualization. More and more supercomputers are now making use of GPGPU accelerators, such as Titan at Oak Ridge National Lab. A large number of sessions were delivered by NVIDIA engineers and developers, but there were also a number of sessions delivered by scientists working on real problems (largely focused on GPGPU rather than rendering/visualization). There was an extensive poster session, showcasing applications across a broad range of areas with the opportunity to talk to the developers. Many of the projects featured were open source and made extensive use of libraries familiar to many of us.

It is clear that OpenGL is alive and well, with many exciting developments in this area. Interestingly, many of these are being fuelled by growing interest from the gaming industry as they port to new Linux-based platforms such as [SteamOS][5]. Live demos were given on the Jetson in the future of OpenGL session, and the [Approaching Zero Driver Overhead][6] talk from the preceding Game Developers Conference was referenced quite heavily. Several enhancements to the binary driver were mentioned in reference to better supporting scene graphs and real-time ray-tracing using nVidia's Optix platform was showcased and ultimately featured in one of the awards for the work on the [HIV capsid as a showcase][7] of what GPU technology can do to help drive forward progress in scientific research.

--------------------------------------------------------------------------------

via: http://opensource.com/life/14/4/gpu-technology-conference-2014

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.gputechconf.com/
[2]:http://www.gdconf.com/
[3]:http://blogs.nvidia.com/blog/2014/03/25/gpu-roadmap-pascal/
[4]:http://www.nvidia.com/object/jetson-tk1-embedded-dev-kit.html
[5]:http://steamcommunity.com/linux
[6]:http://www.slideshare.net/CassEveritt/approaching-zero-driver-overhead
[7]:http://blogs.nvidia.com/blog/2014/03/27/researchers-win-third-annual-cuda-achievement-award-three-new-cuda-fellows-named/
