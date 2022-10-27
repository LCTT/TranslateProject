[#]: subject: (3 key considerations for your trusted compute base)
[#]: via: (https://opensource.com/article/21/5/trusted-compute-base)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

3 key considerations for your trusted compute base
======
The smaller your TCB, the less there is to attack, and that's a good
thing.
![Puzzle pieces coming together to form a computer screen][1]

This isn't the first article I've written about trusted computing bases (TCBs), so if the concept is new to you, I suggest you have a look at _[What's a trusted compute base?][2]_ to get an idea of what I'll be talking about here. In that article, I noted the importance of the size of the TCB: "What you want is a small, easily measurable and easily auditable TCB on which you can build the rest of your system—from which you can build a 'chain of trust' to the other parts of your system about which you care."

In this article, I want to discuss the importance of a TCB's size, how you might measure it, and how difficult it can be to reduce its size. Let's look at those issues in order.

### Sizing things up

However you measure it—and I'll get to that below—the size of the TCB matters for two reasons:

  1. The larger the TCB is, the more bugs there are likely to be.
  2. The larger the TCB is, the larger the attack surface.



The first of these is true of any system. Although there may be ways of reducing the number of bugs by proving the correctness of all (or, more likely, part) of the system, bugs are both tricky to remove and resilient; if you remove one, you may well introduce another (or worse, several). You can reduce the kinds and number of bugs through a multitude of techniques, from language choice (choosing Rust over C/C++ to decrease memory allocation errors, for instance), to better specification, and on to improved test coverage and fuzzing. In the end, however, the smaller the TCB, the less code (or hardware—don't forget we're considering the broader system here) you have to trust, the less space there is for bugs in it.

The concept of an attack surface is important (and, like TCBs, it's one I've introduced before—see _[What's an attack surface?][3]_). Like bugs, there may be no absolute measure of the ratio of _danger:attack surface_, but the smaller your TCB, the less there is to attack, and that's a good thing. As with bug reduction, there are many techniques you may want to apply to reduce your attack surface, but the smaller it is, by definition, the fewer opportunities attackers have to try to compromise your system.

### Measurement

Measuring the size of your TCB is really, really hard. Or maybe I should say that coming up with an absolute measure that you can compare to other TCBs is really, really hard. The problem is that there are so many measurements you might take. The ones you care about are probably those that can be related to the attack surface. But there are so many different attack vectors that _might_ be relevant to a TCB that there are likely to be multiple attack surfaces. Some of the possible measurements include:

  * Number of API methods
  * Amount of data that can be passed across each API method
  * Number of parameters that can be passed across each API method
  * Number of open network sockets
  * Number of open local (e.g., Unix) sockets
  * Number of files read from local storage
  * Number of dynamically loaded libraries
  * Number of Direct Memory Access (DMA) calls
  * Number of lines of code
  * Amount of compilation optimisation carried out
  * Size of binary
  * Size of executing code in memory
  * Amount of memory shared with other processes
  * Use of various caches (L1, L2, etc.)
  * Number of syscalls made
  * Number of strings visible using a `strings` command or similar
  * Number of cryptographic operations not subject to constant time checks



This is not meant to be an exhaustive list; it just shows the range of different areas where vulnerabilities might appear. Designing your application to reduce one may increase another; a very simple example is attempting to reduce the number of API calls exposed by increasing the number of parameters on each call; another might be reducing the size of the binary by using more dynamically linked libraries.

This leads me to an important point that I'm not going to address in detail in this article but is fundamental to understanding TCBs: without a threat model, there's very little point in considering what your TCB is.

### Reducing TCB size

I've just shown one of the main reasons that reducing your TCB size is difficult: it's likely to involve tradeoffs between different measures. If all you're trying to do is produce competitive marketing material where you say, "my TCB is smaller than yours," then you're likely to miss the point. The point of a TCB is to have a well-defined computing base that can protect against specific threats. This requires you to be clear about exactly what functionality _requires_ it to be trusted, where it sits in the system, and how the other components in the system rely on it. In other words, what trust relationships they have.

Recently, I was speaking to a colleague who relayed a story of a software project by saying, "we've reduced our TCB to this tiny component by designing it very carefully and checking how we implement it." But my colleague overlooked the fact that the rest of the stack—which contains a complete Linux distribution and applications—could not be trusted any more than before. The threat model (if there is one—we didn't get into details) seems to assume that only the TCB would be attacked. This misses the point entirely; it just adds another "[turtle][4]" to the stack without fixing the problem that is presumably at issue: improving the system's security.

Reducing the TCB by artificially defining what the TCB is to suit your capabilities or particular beliefs around what it should be protecting against is not only unhelpful but actively counterproductive. This is because it ignores the fact that a TCB is there to serve the needs of a broader system, and if it is considered in isolation, then it becomes irrelevant: what is it acting as a base _for_?

In conclusion, it's all very well saying, "we have a tiny TCB," but you need to know what you're protecting, from what, and how.

* * *

_This article was originally published on [Alice, Eve, and Bob][5] and is reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/trusted-compute-base

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://aliceevebob.com/2019/10/22/whats-a-trusted-compute-base/
[3]: https://aliceevebob.com/2018/04/24/whats-an-attack-surface/
[4]: https://aliceevebob.com/2019/07/02/turtles-and-chains-of-trust/
[5]: https://aliceevebob.com/2021/05/11/does-my-tcb-look-big-in-this/
