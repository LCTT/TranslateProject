[#]: subject: "Some ways to get better at debugging"
[#]: via: "https://jvns.ca/blog/2022/08/30/a-way-to-categorize-debugging-skills/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Some ways to get better at debugging
======
Hello! I’ve been working on writing a zine about debugging for a while (here’s [an early draft of the table of contents][1]).

As part of that I thought it might be fun to read some academic papers about
debugging, and last week [Greg Wilson][2] sent me some
papers about academic research into debugging.

One of those papers ([Towards a framework for teaching debugging
[paywalled]][3]) had a
categorization I really liked of the different kinds of knowledge/skills we
need to debug effectively. It comes from another more general paper on
troubleshooting: [Learning to Troubleshoot: A New Theory-Based Design Architecture][4].

I thought the categorization was a very useful structure for thinking about how
to get better at debugging, so I’ve reframed the five categories in the paper
into actions you can take to get better at debugging.

Here they are:

#### 1. learn the codebase

To debug some code, you need to understand the codebase you’re working with.
This seems kind of obvious (of course you can’t debug code without
understanding how it works!).

This kind of learning happens pretty naturally over time, and actually
debugging is also one of the best ways to *learn* how a new codebase works –
seeing how something breaks helps you learn a lot about how it works.

The paper calls this “System Knowledge”.

#### 2. learn the system

The paper mentions that you need to understand the programming language, but I
think there’s more to it than that – to fix bugs, often you need to learn a
lot about the broader environment than just the language.

For example, if you’re a backend web developer, some “system” knowledge you
might need includes:

* how HTTP caching works
* CORS
* how database transactions work

I find that I often have to be a bit more intentional about learning systemic
things like this – I need to actually take the time to look them up and read
about them.

The paper calls this “Domain Knowledge”.

#### 3. learn your tools

There are lots of debugging tools out there, for example:

* debuggers (gdb etc)
* browser developer tools
* profilers
* strace / ltrace
* tcpdump / wireshark
* core dumps
* and even basic things like error messages (how do you read them properly)

I’ve written a lot about debugging tools on this blog, and definitely
learning these tools has made a huge difference to me.

The paper calls this “Procedural Knowledge”.

#### 4. learn strategies

This is the fuzziest category, we all have a lot of strategies and heuristics
we pick up along the way for how to debug efficiently. For example:

* writing a unit test
* writing a tiny standalone program to reproduce the bug
* finding a working version of the code and seeing what changed
* printing out a million things
* adding extra logging
* taking a break
* explaining the bug to a friend and then figuring out what’s wrong halfway through
* looking through the github issues to see if anything matches

I’ve been thinking a lot about this category while writing the zine, but I want
to keep this post short so I won’t say more about it here.

The paper calls this “Strategic Knowledge”.

#### 5. get experience

The last category is “experience”. The paper has a really funny comment about this:

> Their findings did not show a significant difference in the strategies
employed by the novices and experts. Experts simply formed more correct
hypotheses and were more efficient at finding the fault. The authors suspect
that this result is due to the difference in the programming experience between
novices and experts.

This really resonated with me – I’ve had SO MANY bugs that were really
frustrating and difficult the first time I ran into them, and very straightforward
the fifth or tenth or 20th time.

This also feels like one of the most straightforward categories of knowledge to
acquire to me – all you need to do is investigate a million bugs, which is our
whole life as programmers anyway :). It takes a long time but I feel like it
happens pretty naturally.

The paper calls this “Experiential Knowledge”.

#### that’s all!

I’m going to keep this post short, I just really liked this categorization and
wanted to share it.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/08/30/a-way-to-categorize-debugging-skills/

作者：[Julia Evans][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lkxed
[1]: https://twitter.com/b0rk/status/1562480240240525314?s=20&t=BwKd6i0mVCTaCud2HDEUBA
[2]: https://third-bit.com/
[3]: https://dl.acm.org/doi/abs/10.1145/3286960.3286970
[4]: https://www.researchgate.net/profile/Woei-Hung/publication/225547853_Learning_to_Troubleshoot_A_New_Theory-Based_Design_Architecture/links/556f471c08aec226830a74e7/Learning-to-Troubleshoot-A-New-Theory-Based-Design-Architecture.pdf
