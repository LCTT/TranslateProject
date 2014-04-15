Torvalds Is Unconvinced By LTO'ing A Linux Kernel
================================================================================
Yesterday patches were published via a pull request to [enable experimental LTO support for the Linux 3.15 kernel][1], but Linus Torvalds hasn't yet decided whether he will accept this code in the upstream Linux kernel... Linus doesn't yet see the benefits in link-time optimizations for the kernel and isn't sure whether this code is ready yet to be mainlined.

[LTO'ing the Linux kernel][2] has the potential of reducing the size of the Linux kernel image along with generating a faster and more efficient binary. Link-time optimizations within GCC allow the whole program to be optimized at link-time stage across the entire binary. Previous results showed that an LTO'ed kernel could be over 10% smaller in size and a few percent faster by optimizing the kernel in this manner, but it currently results in much greater system memory usage and a much longer compilation process.

In responding to the Linux 3.15 LTO Kconfig pull request that would make it an experimental option for the next kernel release, Linus Torvalds [wrote][3]:

> So right now, I see several reasons not to merge it ("It's so experimental that we don't even want to encourage people to test it" to "it's not fully fleshed out yet and makes compile times _much_ longer").
> 
> And yet nobody has actually talked about why I *should* merge it.
> 
> Which - I think understandably - makes me less than enthusiastic.
> 
> So I think I'll let this wait a bit longer, _unless_ people start talking about the upsides. How much smaller is the end result? How much faster is it? How much more beautiful is it? Does it make new cool things possible? Are those cool things really close on the horizon and really want this merged even though it's not really quite ready yet?
> 
> So please: convince me. Andi?
> 
> Linus

In response to Torvalds' concerns, among the responses back were that the LTO kernels are smaller in size, they reduce the need for many lower-level Kconfig symbols / reduce the number of CONFIG options needed since unused code can automatically be eliminated, etc. Numbers reported by Tim Bird saw an 11% binary reduction on ARM with the LTO configuration while other users can see upwards of a 30% reduction. There's also reports of an LTO kernel having about 4% less system calls. Benchmark results vary based upon workload but can range from no improvement to generally a couple of percent.

At the moment the matter of [link-time optimization][4] support for the Linux kernel is still being discussed with Linus not yet coming out with any revised thoughts whether he's willing to merge this experimental feature for Linux 3.15 or not.

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=MTY1OTg

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.phoronix.com/scan.php?page=news_item&px=MTY1ODA
[2]:http://www.phoronix.com/scan.php?page=news_item&px=MTY0OTc
[3]:http://lkml.iu.edu/hypermail/linux/kernel/1404.1/00275.html
[4]:http://www.phoronix.com/scan.php?page=search&q=link-time+optimization