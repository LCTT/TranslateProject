[调试器如何工作: Part 2 - 断点][26]
============================================================
这是调试器如何工作系列文章的第二部分，阅读本文前，请确保你已经读过[第一部分][27]。

### 关于本文

--------------------------------------------------------------------------------

via: http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints

作者：[Eli Bendersky][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://eli.thegreenplace.net/
[1]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id1
[2]:http://en.wikipedia.org/wiki/Out-of-order_execution
[3]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id2
[4]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id3
[5]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id4
[6]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id5
[7]:http://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[8]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id6
[9]:http://eli.thegreenplace.net/tag/articles
[10]:http://eli.thegreenplace.net/tag/debuggers
[11]:http://eli.thegreenplace.net/tag/programming
[12]:http://www.alexonlinux.com/how-debugger-works
[13]:http://www.linuxforums.org/articles/understanding-elf-using-readelf-and-objdump_125.html
[14]:http://mainisusuallyafunction.blogspot.com/2011/01/implementing-breakpoints-on-x86-linux.html
[15]:http://www.nasm.us/xdoc/2.09.04/html/nasmdoc0.html
[16]:http://stackoverflow.com/questions/2187484/elf-binary-entry-point
[17]:http://news.ycombinator.net/item?id=2131894
[18]:http://www.deansys.com/doc/gdbInternals/gdbint_toc.html
[19]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id7
[20]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id8
[21]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id9
[22]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id10
[23]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id11
[24]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints#id12
[25]:https://github.com/eliben/code-for-blog/tree/master/2011/debuggers_part2_code
[26]:http://eli.thegreenplace.net/2011/01/27/how-debuggers-work-part-2-breakpoints
[27]:http://eli.thegreenplace.net/2011/01/23/how-debuggers-work-part-1/
