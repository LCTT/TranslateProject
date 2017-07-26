Linux Weather Forecast
============================================================

### Welcome to the Linux Weather Forecast

This page is an attempt to track ongoing developments in the Linux development community that have a good chance of appearing in a mainline kernel and/or major distributions sometime in the near future. Your "chief meteorologist" is Jonathan Corbet, Executive Editor at [LWN.net][8]. If you have suggestions on improving the forecast (and particularly if you have a project or patchset that you think should be tracked), please add your comments below. 

### Forecast Summaries

**Current conditions**: The 4.12 kernel was released on July 2\. It contains many new features, including:

*   The [BFQ and Kyber block I/O schedulers][2]. BFQ, which has been under development for years, promises better performance on interactive systems and has attracted interest in the mobile device area. Kyber, instead, is a much simpler scheduler intended for fast devices typically found in enterprise settings.

*   The epoll_wait() system call can now perform busy-polling of network sockets.

*   The live-patching mechanism has gained the [hybrid consistency model][3], which will allow more complex patches to be applied to running kernels.

*   The [trusted execution framework][4] should ease dealings between the kernel and code running in the ARM TrustZone secure world.

4.12 was one of the busiest kernel development cycles ever, with nearly 15,000 changes merged. See [this article][9] for an overview of where those changes came from.

**Short-term forecast**: The 4.13 kernel can be expected in early September 2017.  Some of the changes that will be found in this kernel are:

*   Better support for non-blocking direct block I/O operations.

*   The [structure-layout randomization mechanism][5] is the next step in the ongoing project of hardening the kernel against attack.

*   The kernel now has [native support for the TLS network protocol][6].

*   Steps toward the [swapping of transparent huge pages][7] have been taken, leading eventually to better memory-management performance.

*   The handling of writeback errors in the block subsystem [has been improved][1], with the result that errors are far less likely to go unreported to the application writing the data.

The 4.13 kernel is in the stabilization period now, so only fixes will be accepted during the remainder of this development cycle.

This [work][10] is licensed under a [Creative Commons Attribution-ShareAlike 3.0 License][11].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/2017/7/linux-weather-forecast

作者：[JONATHAN CORBET][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/corbet
[1]:https://lwn.net/Articles/724307/
[2]:https://lwn.net/Articles/720675/
[3]:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d83a7cb375eec21f04c83542395d08b2f6641da2
[4]:https://lwn.net/Articles/717125/
[5]:https://lwn.net/Articles/722293/
[6]:https://lwn.net/Articles/666509/
[7]:https://lwn.net/Articles/717707/
[8]:http://www.lwn.net/
[9]:https://lwn.net/Articles/726950/
[10]:http://purl.org/dc/elements/1.1/
[11]:http://creativecommons.org/licenses/by-sa/3.0/
