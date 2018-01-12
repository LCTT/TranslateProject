Translating by qhwdw [20090211 Page Cache, the Affair Between Memory and Files][1]
============================================================


Previously we looked at how the kernel [manages virtual memory][2] for a user process, but files and I/O were left out. This post covers the important and often misunderstood relationship between files and memory and its consequences for performance.

Two serious problems must be solved by the OS when it comes to files. The first one is the mind-blowing slowness of hard drives, and [disk seeks in particular][3], relative to memory. The second is the need to load file contents in physical memory once and share the contents among programs. If you use [Process Explorer][4] to poke at Windows processes, you'll see there are ~15MB worth of common DLLs loaded in every process. My Windows box right now is running 100 processes, so without sharing I'd be using up to ~1.5 GB of physical RAM just for common DLLs. No good. Likewise, nearly all Linux programs need [ld.so][5] and libc, plus other common libraries.

Happily, both problems can be dealt with in one shot: the page cache, where the kernel stores page-sized chunks of files. To illustrate the page cache, I'll conjure a Linux program named render, which opens file scene.dat and reads it 512 bytes at a time, storing the file contents into a heap-allocated block. The first read goes like this:

![Reading and the page cache](http://static.duartes.org/img/blogPosts/readFromPageCache.png)

After 12KB have been read, render's heap and the relevant page frames look thus:

![Non-mapped file read](http://static.duartes.org/img/blogPosts/nonMappedFileRead.png)

This looks innocent enough, but there's a lot going on. First, even though this program uses regular read calls, three 4KB page frames are now in the page cache storing part of scene.dat. People are sometimes surprised by this, but all regular file I/O happens through the page cache. In x86 Linux, the kernel thinks of a file as a sequence of 4KB chunks. If you read a single byte from a file, the whole 4KB chunk containing the byte you asked for is read from disk and placed into the page cache. This makes sense because sustained disk throughput is pretty good and programs normally read more than just a few bytes from a file region. The page cache knows the position of each 4KB chunk within the file, depicted above as #0, #1, etc. Windows uses 256KB views analogous to pages in the Linux page cache.

Sadly, in a regular file read the kernel must copy the contents of the page cache into a user buffer, which not only takes cpu time and hurts the [cpu caches][6], but also wastes physical memory with duplicate data. As per the diagram above, the scene.dat contents are stored twice, and each instance of the program would store the contents an additional time. We've mitigated the disk latency problem but failed miserably at everything else. Memory-mapped files are the way out of this madness:

![Mapped file read](http://static.duartes.org/img/blogPosts/mappedFileRead.png)

When you use file mapping, the kernel maps your program's virtual pages directly onto the page cache. This can deliver a significant performance boost: [Windows System Programming][7] reports run time improvements of 30% and up relative to regular file reads, while similar figures are reported for Linux and Solaris in [Advanced Programming in the Unix Environment][8]. You might also save large amounts of physical memory, depending on the nature of your application.

As always with performance, [measurement is everything][9], but memory mapping earns its keep in a programmer's toolbox. The API is pretty nice too, it allows you to access a file as bytes in memory and does not require your soul and code readability in exchange for its benefits. Mind your [address space][10] and experiment with [mmap][11] in Unix-like systems, [CreateFileMapping][12] in Windows, or the many wrappers available in high level languages. When you map a file its contents are not brought into memory all at once, but rather on demand via [page faults][13]. The fault handler [maps your virtual pages][14] onto the page cache after [obtaining][15] a page frame with the needed file contents. This involves disk I/O if the contents weren't cached to begin with.

Now for a pop quiz. Imagine that the last instance of our render program exits. Would the pages storing scene.dat in the page cache be freed immediately? People often think so, but that would be a bad idea. When you think about it, it is very common for us to create a file in one program, exit, then use the file in a second program. The page cache must handle that case. When you think more about it, why should the kernel ever get rid of page cache contents? Remember that disk is 5 orders of magnitude slower than RAM, hence a page cache hit is a huge win. So long as there's enough free physical memory, the cache should be kept full. It is therefore not dependent on a particular process, but rather it's a system-wide resource. If you run render a week from now and scene.dat is still cached, bonus! This is why the kernel cache size climbs steadily until it hits a ceiling. It's not because the OS is garbage and hogs your RAM, it's actually good behavior because in a way free physical memory is a waste. Better use as much of the stuff for caching as possible.

Due to the page cache architecture, when a program calls [write()][16] bytes are simply copied to the page cache and the page is marked dirty. Disk I/O normally does not happen immediately, thus your program doesn't block waiting for the disk. On the downside, if the computer crashes your writes will never make it, hence critical files like database transaction logs must be [fsync()][17]ed (though one must still worry about drive controller caches, oy!). Reads, on the other hand, normally block your program until the data is available. Kernels employ eager loading to mitigate this problem, an example of which is read ahead where the kernel preloads a few pages into the page cache in anticipation of your reads. You can help the kernel tune its eager loading behavior by providing hints on whether you plan to read a file sequentially or randomly (see [madvise()][18], [readahead()][19], [Windows cache hints][20] ). Linux [does read-ahead][21] for memory-mapped files, but I'm not sure about Windows. Finally, it's possible to bypass the page cache using [O_DIRECT][22] in Linux or [NO_BUFFERING][23] in Windows, something database software often does.

A file mapping may be private or shared. This refers only to updates made to the contents in memory: in a private mapping the updates are not committed to disk or made visible to other processes, whereas in a shared mapping they are. Kernels use the copy on write mechanism, enabled by page table entries, to implement private mappings. In the example below, both render and another program called render3d (am I creative or what?) have mapped scene.dat privately. Render then writes to its virtual memory area that maps the file:

![The Copy-On-Write mechanism](http://static.duartes.org/img/blogPosts/copyOnWrite.png)

The read-only page table entries shown above do not mean the mapping is read only, they're merely a kernel trick to share physical memory until the last possible moment. You can see how 'private' is a bit of a misnomer until you remember it only applies to updates. A consequence of this design is that a virtual page that maps a file privately sees changes done to the file by other programs as long as the page has only been read from. Once copy-on-write is done, changes by others are no longer seen. This behavior is not guaranteed by the kernel, but it's what you get in x86 and makes sense from an API perspective. By contrast, a shared mapping is simply mapped onto the page cache and that's it. Updates are visible to other processes and end up in the disk. Finally, if the mapping above were read-only, page faults would trigger a segmentation fault instead of copy on write.

Dynamically loaded libraries are brought into your program's address space via file mapping. There's nothing magical about it, it's the same private file mapping available to you via regular APIs. Below is an example showing part of the address spaces from two running instances of the file-mapping render program, along with physical memory, to tie together many of the concepts we've seen.

![Mapping virtual memory to physical memory](http://static.duartes.org/img/blogPosts/virtualToPhysicalMapping.png)

This concludes our 3-part series on memory fundamentals. I hope the series was useful and provided you with a good mental model of these OS topics.

--------------------------------------------------------------------------------

via:https://manybutfinite.com/post/page-cache-the-affair-between-memory-and-files/

作者：[Gustavo Duarte][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://duartes.org/gustavo/blog/about/
[1]:https://manybutfinite.com/post/page-cache-the-affair-between-memory-and-files/
[2]:https://manybutfinite.com/post/how-the-kernel-manages-your-memory
[3]:https://manybutfinite.com/post/what-your-computer-does-while-you-wait
[4]:http://technet.microsoft.com/en-us/sysinternals/bb896653.aspx
[5]:http://ld.so
[6]:https://manybutfinite.com/post/intel-cpu-caches
[7]:http://www.amazon.com/Windows-Programming-Addison-Wesley-Microsoft-Technology/dp/0321256190/
[8]:http://www.amazon.com/Programming-Environment-Addison-Wesley-Professional-Computing/dp/0321525949/
[9]:https://manybutfinite.com/post/performance-is-a-science
[10]:https://manybutfinite.com/post/anatomy-of-a-program-in-memory
[11]:http://www.kernel.org/doc/man-pages/online/pages/man2/mmap.2.html
[12]:http://msdn.microsoft.com/en-us/library/aa366537(VS.85).aspx
[13]:http://lxr.linux.no/linux+v2.6.28/mm/memory.c#L2678
[14]:http://lxr.linux.no/linux+v2.6.28/mm/memory.c#L2436
[15]:http://lxr.linux.no/linux+v2.6.28/mm/filemap.c#L1424
[16]:http://www.kernel.org/doc/man-pages/online/pages/man2/write.2.html
[17]:http://www.kernel.org/doc/man-pages/online/pages/man2/fsync.2.html
[18]:http://www.kernel.org/doc/man-pages/online/pages/man2/madvise.2.html
[19]:http://www.kernel.org/doc/man-pages/online/pages/man2/readahead.2.html
[20]:http://msdn.microsoft.com/en-us/library/aa363858(VS.85).aspx#caching_behavior
[21]:http://lxr.linux.no/linux+v2.6.28/mm/filemap.c#L1424
[22]:http://www.kernel.org/doc/man-pages/online/pages/man2/open.2.html
[23]:http://msdn.microsoft.com/en-us/library/cc644950(VS.85).aspx