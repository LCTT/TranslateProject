[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Games Get A Performance Boost for AMD GPUs Thanks to Valve’s New Compiler)
[#]: via: (https://itsfoss.com/linux-games-performance-boost-amd-gpu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Linux Games Get A Performance Boost for AMD GPUs Thanks to Valve’s New Compiler
======

It has been a few days since Steam asked for the public feedback in order to test ACO (a new Mesa [shader][1] compiler) for AMD GPUs.

Currently, the AMD drivers use a shader compiler utilizing LLVM. However, [Mesa][2] is an open source alternative to [LLVM][3].

So, in this case, Valve wants to support AMD graphics to improve the performance of Linux games on various Linux distros.

![][4]

For gaming performance improvement, the compile time is critical and with the new ACO compiler, it reduces the time by almost 50%. Valve explained more about it in its [Steam community][5] post:

> The AMD OpenGL and Vulkan drivers currently use a shader compiler that is part of the upstream LLVM project. That project is massive, and has many different goals, with online compilation of game shaders only being one of them. That can result in development tradeoffs, where improving gaming-specific functionality is harder than it otherwise would, or where gaming-specific features would often accidentally get broken by LLVM developers working on other things. In particular, shader compilation speed is one such example: it’s not really a critical factor in most other scenarios, just a nice-to-have. But for gaming, compile time is critical, and slow shader compilation can result in near-unplayable stutter.

### Is there really a performance boost for Linux games?

Yes, there is.

The primary highlight here is the compile time. If the shader compilation time reduces dramatically, it should theoretically improve the performance of the game.

And, as per the [initial benchmark reports][6], we really do see some significant improvements.

![][7]

Of course, the in-game FPS improvement isn’t huge. But, it is still a good progress in its early stage.

If you’re curious about the compile time improvement, then here it is:

![][8]

Yes, even a big compile time reduction did not affect the in-game FPS by a large margin. But, it is still a big deal because currently, it is a work in progress. So, we can expect even more.

[][9]

Suggested read  Chrome OS Look-Alike Linux Distro Chromixium Released

But, what more can be done?

Well, the ACO compiler isn’t complete yet. Here’s why (as Valve mentioned):

> Right now, ACO only handles pixel and compute shader stages. When the rest of the stages are implemented, we expect the compile times will be reduced even further.

#### Wrapping Up

Even though I don’t have an AMD GPU on board, it is actually interesting to see improvements for the Linux gaming scene in general.

Also, we shall be expecting more benchmarks and reports as this progresses.

What do you think? Let us know your thoughts in the comments below. If you have a benchmark report to share, do let us know about it.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-games-performance-boost-amd-gpu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Shader
[2]: https://en.wikipedia.org/wiki/Mesa_(computer_graphics)
[3]: https://en.wikipedia.org/wiki/LLVM
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/Improved-Linux-Gaming.png?resize=800%2C450&ssl=1
[5]: https://steamcommunity.com/games/221410/announcements/detail/1602634609636894200
[6]: https://gist.github.com/pendingchaos/aba1e4c238cf039d17089f29a8c6aa63
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/fps-improvement-amd.png?fit=800%2C412&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/compile-time-amd-gpu-linux.png?ssl=1
[9]: https://itsfoss.com/chromixiumos-released/
