Top Linux developers' recommended programming books
======
Without question, Linux was created by brilliant programmers who employed good computer science knowledge. Let the Linux programmers whose names you know share the books that got them started and the technology references they recommend for today's developers. How many of them have you read?

Linux is, arguably, the operating system of the 21st century. While Linus Torvalds made a lot of good business and community decisions in building the open source community, the primary reason networking professionals and developers adopted Linux is the quality of its code and its usefulness. While Torvalds is a programming genius, he has been assisted by many other brilliant developers.

I asked Torvalds and other top Linux developers which books helped them on their road to programming excellence. This is what they told me.

### By shining C

Linux was developed in the 1990s, as were other fundamental open source applications. As a result, the tools and languages the developers used reflected the times, which meant a lot of C programming language. While [C is no longer as popular][1], for many established developers it was their first serious language, which is reflected in their choice of influential books.

“You shouldn't start programming with the languages I started with or the way I did,” says Torvalds. He started with BASIC, moved on to machine code (“not even assembly language, actual ‘just numbers’ machine code,” he explains), then assembly language and C.

“None of those languages are what anybody should begin with anymore,” Torvalds says. “Some of them make no sense at all today (BASIC and machine code). And while C is still a major language, I don't think you should begin with it.”

It's not that he dislikes C. After all, Linux is written in [GNU C][2]. "I still think C is a great language with a pretty simple syntax and is very good for many things,” he says. But the effort to get started with it is much too high for it to be a good beginner language by today's standards. “I suspect you'd just get frustrated. Going from your first ‘Hello World’ program to something you might actually use is just too big of a step."

From that era, the only programming book that stood out for Torvalds is Brian W. Kernighan and Dennis M. Ritchie's [C Programming Language][3], known in serious programming circles as K&R. “It was small, clear, concise,” he explains. “But you need to already have a programming background to appreciate it."

Torvalds is not the only open source developer to recommend K&R. Several others cite their well-thumbed copies as influential references, among them Wim Coekaerts, senior vice president for Linux and virtualization development at Oracle; Linux developer Alan Cox; Google Cloud CTO Brian Stevens; and Pete Graner, Canonical's vice president of technical operations.

If you want to tackle C today, Jeremy Allison, co-founder of Samba, recommends [21st Century C][4]. Then, Allison suggests, follow it up with the older but still thorough [Expert C Programming][5] as well as the 20-year-old [Programming with POSIX Threads][6].

### If not C, what?

Linux developers’ recommendations for current programming books naturally are an offshoot of the tools and languages they think are most suitable for today’s development projects. They also reflect the developers’ personal preferences. For example, Allison thinks young developers would be well served by learning Go with the help of [The Go Programming Language][7] and Rust with [Programming Rust][8].

But it may make sense to think beyond programming languages (and thus books to teach you their techniques). To do something meaningful today, “start from some environment with a toolkit that does 99 percent of the obscure details for you, so that you can script things around it," Torvalds recommends.

"Honestly, the language itself isn't nearly as important as the infrastructure around it,” he continues. “Maybe you'd start with Java or Kotlin—not because of those languages per se, but because you want to write an app for your phone and the Android SDK ends up making those better choices. Or, maybe you're interested in games, so you start with one of the game engines, which often have some scripting language of their own."

That infrastructure includes programming books specific to the operating system itself. Graner followed K&R by reading W. Richard Stevens' [Unix Network Programming][10] books. In particular, Stevens' [TCP/IP Illustrated, Volume 1: The Protocols][11] is considered still relevant even though it's almost 30 years old. Because Linux development is largely [relevant to networking infrastructure][12], Graner also recommends the many O’Reilly books on [Sendmail][13], [Bash][14], [DNS][15], and [IMAP/POP][16].

Coekaerts is also fond of Maurice Bach's [The Design of the Unix Operating System][17]. So is James Bottomley, a Linux kernel developer who used Bach's tome to pull apart Linux when the OS was new.

### Design knowledge never goes stale

But even that may be too tech-specific. "All developers should start with design before syntax,” says Stevens. “[The Design of Everyday Things][18] is one of my favorites.”

Coekaerts likes Kernighan and Rob Pike's [The Practice of Programming][19]. The design-practice book wasn't around when Coekaerts was in school, “but I recommend it to everyone to read," he says.

Whenever you ask serious long-term developers about their favorite books, sooner or later someone's going to mention Donald Knuth’s [The Art of Computer Programming][20]. Dirk Hohndel, VMware's chief open source officer, considers it timeless though, admittedly, “not necessarily super-useful today."

### Read code. Lots of code

While programming books can teach you a lot, don’t miss another opportunity that is unique to the open source community: [reading the code][21]. There are untold megabytes of examples of how to solve a given programming problem—and how you can get in trouble, too. Stevens says his No. 1 “book” for honing programming skills is having access to the Unix source code.

Don’t overlook the opportunity to learn in person, too. “I learned BASIC by being in a computer club with other people all learning together,” says Cox. “In my opinion, that is still by far the best way to learn." He learned machine code from [Mastering Machine Code on Your ZX81][22] and the Honeywell L66 B compiler manuals, but working with other developers made a big difference.

“I still think the way to learn best remains to be with a group of people having fun and trying to solve a problem you care about together,” says Cox. “It doesn't matter if you are 5 or 55."

What struck me the most about these recommendations is how often the top Linux developers started at a low level—not just C or assembly language but machine language. Obviously, it’s been very useful in helping developers understand how computing works at a very basic level.

So, ready to give hard-core Linux development a try? Greg Kroah-Hartman, the Linux stable branch kernel maintainer, recommends Steve Oualline's [Practical C Programming][23] and Samuel Harbison and Guy Steele's [C: A Reference Manual][24]. Next, read "[HOWTO do Linux kernel development][25]." Then, says Kroah-Hartman, you'll be ready to start.

In the meantime, study hard, program lots, and best of luck to you in following the footsteps of Linux's top programmers.

--------------------------------------------------------------------------------

via: https://www.hpe.com/us/en/insights/articles/top-linux-developers-recommended-programming-books-1808.html

作者：[Steven Vaughan-Nichols][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.hpe.com/us/en/insights/contributors/steven-j-vaughan-nichols.html
[1]:https://www.codingdojo.com/blog/7-most-in-demand-programming-languages-of-2018/
[2]:https://www.gnu.org/software/gnu-c-manual/
[3]:https://amzn.to/2nhyjEO
[4]:https://amzn.to/2vsL8k9
[5]:https://amzn.to/2KBbWn9
[6]:https://amzn.to/2M0rfeR
[7]:https://amzn.to/2nhyrnMe
[8]:http://shop.oreilly.com/product/0636920040385.do
[9]:https://www.hpe.com/us/en/resources/storage/containers-for-dummies.html?jumpid=in_510384402_linuxbooks_containerebook0818
[10]:https://amzn.to/2MfpbyC
[11]:https://amzn.to/2MpgrTn
[12]:https://www.hpe.com/us/en/insights/articles/how-to-see-whats-going-on-with-your-linux-system-right-now-1807.html
[13]:http://shop.oreilly.com/product/9780596510299.do
[14]:http://shop.oreilly.com/product/9780596009656.do
[15]:http://shop.oreilly.com/product/9780596100575.do
[16]:http://shop.oreilly.com/product/9780596000127.do
[17]:https://amzn.to/2vsCJgF
[18]:https://amzn.to/2APzt3Z
[19]:https://www.amazon.com/Practice-Programming-Addison-Wesley-Professional-Computing/dp/020161586X/ref=as_li_ss_tl?ie=UTF8&linkCode=sl1&tag=thegroovycorpora&linkId=e6bbdb1ca2182487069bf9089fc8107e&language=en_US
[20]:https://amzn.to/2OknFsJ
[21]:https://amzn.to/2M4VVL3
[22]:https://amzn.to/2OjccJA
[23]:http://shop.oreilly.com/product/9781565923065.do
[24]:https://amzn.to/2OjzgrT
[25]:https://www.kernel.org/doc/html/v4.16/process/howto.html
