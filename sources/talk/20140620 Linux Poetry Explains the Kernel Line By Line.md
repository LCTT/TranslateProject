Linux Poetry Explains the Kernel, Line By Line
================================================================================
> Editor's Note: Feeling inspired? Send your Linux poem to [editors@linux.com][1] for your chance to win a free pass to [LinuxCon North America][2] in Chicago, Aug. 20-22. Be sure to include your name, contact information and a brief explanation of your poem. We'll draw one winner at random from all eligible entries each week through Aug. 1, 2014.

![Software developer Morgan Phillips is teaching herself how the Linux kernel works by writing poetry.](http://www.linux.com/images/stories/41373/Morgan-Phillips-2.jpg)

Software developer Morgan Phillips is teaching herself how the Linux kernel works by writing poetry.

Writing poems about the Linux kernel has been enlightening in more ways than one for software developer Morgan Phillips.

Over the past few months she's begun to teach herself how the Linux kernel works by studying text books, including [Understanding the Linux Kernel][3], Unix Network Programming, and The Unix Programming Environment. But instead of taking notes, she weaves the new terminology and ideas she learns into poetry about system architecture and programming concepts. (See some examples, below, and on her [Linux Poetry blog][4].) 

It's a “pedagogical hack” she adopted in college and took up again a few years ago when she first landed a job as a data warehouse engineer at Facebook and needed to quickly learn Hadoop.

“I could remember bits and pieces of information but it was too rote, too rigid in my mind, so I started writing poems,” she said. “It forced me to wrap all of these bits of information into context and helped me learn things much more effectively.”

The Linux kernel's history, architecture, abundant terminology and complex concepts, are rich fodder for her poetry.

“I could probably write thousands of poems about just one subsystem in the kernel,” she said.

### Why learn Linux? ###

![Phillips publishes on her Linux Poetry blog.](http://www.linux.com/images/stories/41373/multiplexing-poem.png)
Phillips publishes on her Linux Poetry blog.

Phillips started her software career through a somewhat unconventional route as a physics major in a research laboratory. Instead of writing journal articles she was writing Python scripts to parse research project data on active galactic nuclei. She never learned the fundamentals of computer science (CS), but picked up the information on the job, as the need arose.

She soon got a job doing network security research for the Army Research Laboratory in Adelphi, Maryland, working with Linux. That was her first foray into the networking stack and the lower levels of the operating system.

Most recently she worked at Facebook until about six months ago when she moved from the Silicon Valley back to Nashville, near her home state of Kentucky, to work for a software startup that helps major record labels manage their business.

“I have all this experience but I suffer from a thing that almost every person who doesn’t have an actual background in CS does: I have islands of knowledge with big gaps in between,” she said. “Every time I'd come across some concept, some data structure in the kernel, I'd have to go educate myself on it.”

A few weeks ago her frustration peaked. She was trying to do a form of message passing between web application processes and a web socket server she had written and found herself having to brush up on all the ways she could do interprocess communication.

“I was like, that's it. I'm going to start really learning everything I should have known starting at the bottom up with the Linux kernel,” she said. “So I bought some textbooks and started reading.”

![](http://www.linux.com/images/stories/41373/process-poem.png)

### What she's learned ###

Over the course of a few months of reading books and writing poems she's learned about how the virtual memory subsystem works. She's learned about the data structures that hold process information, about the virtual memory layout and how pages are mapped into memory, and about memory management.

“I hadn't thought about a lot of things, like that a system that's multiprocessing shouldn’t bother with semaphores,” she said. “Spin locks are often more efficient.”

Writing poems has also given her insight into her own way of thinking about the world. In some small way she is communicating not just her knowledge of Linux systems, but also the way that she conceptualizes them.

“It's a deep look into my mind,” she said. “Poetry is the best way to share these abstract ideas and things that we can't possibly truly share with other people.”

Writing a Linux poem

The inspiration for her Linux poems starts with reading a textbook chapter. She hones the topics down to the key concepts that she wants to remember and what others might find interesting, as well as things she can “wrap a conceptual bubble around.”

A concept like demand paging is too broad to fit into a single poem, for example. “So I'm working my way down deeper in it,” she said. “Instead I'm looking at writing a poem about the actual data structure where process memory is laid out and then mapped into a page map.”

She hasn't had any formal training writing poetry, but writes the lines so that they are visually appealing and have a nice rhythm when they're read aloud.

In her poem, “The Reentrant Kernel,” Phillips writes about an important property in software that allows a function to be paused and restarted later with the same result. System calls need to have this reentrant property in order to make the scheduler run as efficiently as possible, Phillips explains. The poem also includes a program, written in C style pseudocode, to help illustrate the concept.

Phillips hopes her Linux poetry helps her increase her understanding enough to start contributing to the Linux kernel.

“I've been very intimidated for a long time by the idea of submitting a patch to the kernel, being a kernel hacker,” she said. “To me that's the pinnacle of success.

“My ultimate dream is that I can gain a good enough understanding of the kernel and C to submit a patch and have it accepted.”

    The Reentrant Kernel
    
    A reentrant function,
    if interrupted,
    will return a result,
    which is not perturbed.
    
    int global_int;
    int is_not_reentrant(int x) { 
    int x = x; 
    return global_int + x; },
    depends on a global variable,
    which may change during execution.
    
    int global_int;
    int is_reentrant(int x) { 
    int saved = global_int; 
    return saved + x; },
    mitigates external dependency,
    it is reentrant, though not thread safe.
    
    UNIX kernels are reentrant,
    a process may be interrupted while in kernel mode,
    so that, for instance, time is not wasted,
    waiting on devices.
    
    Process alpha requests to read from a device,
    the kernel obliges,
    CPU switches into kernel mode,
    system call begins execution.
    
    Process alpha is waiting for data,
    it yields to the scheduler,
    process beta writes to a file,
    the device signals that data is available.
    
    Context switches,
    process alpha continues execution,
    data is fetched,
    CPU enters user mode.

注：上面代码内文本发布时请参考原文排版（第一行着重，全部居中）

--------------------------------------------------------------------------------

via: http://www.linux.com/news/featured-blogs/200-libby-clark/777473-linux-poetry-explains-the-kernel-line-by-line/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:editors@linux.com
[2]:http://events.linuxfoundation.org/events/linuxcon-north-america
[3]:http://shop.oreilly.com/product/9780596005658.do
[4]:http://www.linux-poetry.com/