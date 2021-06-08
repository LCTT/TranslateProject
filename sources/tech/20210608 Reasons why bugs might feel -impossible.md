[#]: subject: (Reasons why bugs might feel "impossible")
[#]: via: (https://jvns.ca/blog/2021/06/08/reasons-why-bugs-might-feel-impossible/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Reasons why bugs might feel "impossible"
======

Hello! I’m [very slowly][1] working on writing a zine about debugging, so I [asked on Twitter the other day][2]:

> If you’ve run into a bug where it felt “impossible” to understand what was happening – what made it feel that way?

Of course, bugs always happen for logical reasons, but I’ve definitely run into bugs that felt like they might be impossible for me to understand (until I figured them out!)

I got about 400 responses, which I’ll try to summarize here. I’m not going to talk about how to deal with these various kinds of “impossible” bugs in this post, I’ll just try to classify them.

Here are the categories I came up with for ways a bug might feel impossible to understand. Each one of them has a bunch of sub variants which are bolded below.

  1. it’s hard to reproduce
  2. you don’t understand the overall system well
  3. it’s hard to get data about the bug
  4. one of your assumptions is wrong
  5. the bug is really complex



### 1\. the bug is hard to reproduce locally

I thought [this description][3] was really great:

> The ones that make me contemplate a career change are usually bugs that are only happen to a few users, can’t be reproduced consistently by users or at all in-house, and have slightly varying descriptions in each bug report (kinda like Bigfoot sightings).

Here are some specific ways a bug can be hard to reproduce:

**the bug is nondeterministic**

You run your program with the exact same inputs 1000 times, and it only fails once. This happens a lot with race conditions in multithreaded programs.

**the bug only happens in production**

Lots of bugs are hard to reproduce in your dev environment, either because it’s hard to figure out exactly which inputs trigger the bug, or because they only happen under certain conditions (like a lot of traffic) which are hard to recreate.

**you don’t have access to the machine where the bug is happening**

Three examples of this:

  * you’re shipping software (a binary or a website) that runs on your customer’s computer, they have a problem, and you don’t have direct access to their computer to see what’s going on.
  * the problem involves a managed cloud service that you don’t have a lot of access to.
  * the problem only happens on an input of data that you don’t have access to (perhaps because the data is classified/private)



**you don’t have access to the data you need to reproduce the bug**

One person mentioned a case where the bug was easy to reproduce, but the data they needed to reproduce it was confidential, so they weren’t allowed to have access to it.

**it’s very slow to reproduce**

There are bugs where you know exactly _how_ to reproduce it, but it takes a long time (like 20 minutes or way longer) to reproduce the bug. This is hard because it’s hard to maintain your focus: maybe you can only try 1 experiment per day!

### 2\. you don’t understand the overall system well

Even if you can reproduce the bug, if you don’t understand how the part of the program with the bug works, you can end up VERY stuck.

Some examples of this that came up:

**unknown unknowns: the bug involves a system or concept you’ve didn’t know about**

Sometimes bugs are caused by a part of the system that you didn’t even know existed. For example, when I was debugging [this TCP issue][4], I’d never heard of Nagle’s algorithm or delayed ACKs. So it was pretty difficult to recognize that they were causing the problem!

The only reason I was able to diagnose that bug was that someone at work had coincidentally posted a blog post about it and I remembered the symptoms were similar.

Here’s another example of this from the Twitter replies:

> I was sending strings containing null bytes (long story) between two systems that support them, but in some cases, theres a step along the way that doesn’t support them

Another example of “the bug is in a surprising place” is [this case of a bug in a scanner][5].

The next few sections are more specific ways confusion about the program works can make a bug difficult to solve.

**the bug is in an external library you don’t understand**

Sometimes the bug is in a library or an open source program you’re completely unfamiliar with, but you have to fix it anyway. This makes debugging hrad because:

  1. you need to learn how the library works
  2. it’s not always easy to modify the library and get your program to use your modified version of the library, so it’s hard to experiment and make changes or add extra instrumentation to the library



**you don’t understand the error message at all**

Some error messages initially seem totally incomprehensible. A couple of examples of this:

  * “values of β may give rise to dom!”, from [this talk by Mark Allen on that error message][6] or
  * “Size must be between and 16793600(16MB) First element: oints” from the talk [The tales of the cursed operating systems textbook][7] by Kiran Bhattaram
  * Some compiler error messages can be very confusing if you don’t know what they mean



These are tricky because it’s not clear where to start – what is β? What is this element oints doing here?

Another variant of this is debugging output that’s formatted in a confusing way.

**you don’t know what keywords to search to get more information**

One case that a lot of people mentioned is: you search for a keyword that you think is related to your bug, you get 10 million results, and none of them are helpful.

**the bug is in a proprietary system**

Figuring out an unfamiliar system is already hard, and it’s even worse when you can’t even read the source code!

**the system is poorly documented**

A few variants of this:

  * there’s no documentation, or very sparse documentation
  * the only information about the system is from someone you can’t contact – person who _does_ understand it has left the company, or you don’t know who they are, or they work at a company you can’t find any contact information for
  * the information you need is in a 2000 page PDF and you don’t know where to start looking



### 3\. it’s hard to get information about the program’s internal state

Even if you generally understand the system you’re working with and you can reproduce the bug, debugging is almost impossible if you can’t get enough information about the program’s internal state when the bug happens.

Here are a few specific reasons it can be hard to get data about the program’s internal state.

**there’s no output at all**

Your program failed, but there’s no output at all to read to tell you why it failed. Not even an error message! It just didn’t work.

This has happened to me before with operating systems bugs – my toy OS didn’t start and because it failed before I had any way of printing output, I had no idea was wrong – it just didn’t work!

**there’s way too much output**

It’s also easy to drown in _too much_ output – I’ve turned on debug output and then been totally overwhelmed by how much information there is. It’s very hard to tell what’s relevant and what’s irrelevant in a million log lines!

**information about the bug is split across many places**

When investigating a distributed systems bug, the log lines related to the bug are often spread across a bunch of different services. And sometimes there’s no request ID that you can use to easily figure out which log lines from service A corresponded to the exception you saw in service B.

So you end up spending a long time manually staring at logs and trying to correlate them. I’ve spent more of my life doing this than I’d prefer :)

**it’s not possible to use a debugger/add print statements**

For example, if you want to know something about the state of your database (like Postgres), you’re definitely not going to attach a debugger to your production database, and you probably don’t want to recompile it to add extra logging information. (though I have definitely recompiled programs just to add extra logging information I needed!)

So you need to rely on the program’s existing logging mechanisms and hope that they have the information you need.

**the bug goes away when you use a debugger**

Here’s a story from the Twitter replies about that:

> I had a bug in C++ code that would cause a seg fault. When I compiled with the debug flag on, it worked fine. So really hard to find. Turned out I was copying a string that was 2 bytes too big into a struct. The debug flag created extra space for it!

Another reason a debugger can cause a bug to go away is if it’s a race condition – debuggers often make the program run a little bit slower which can cause the race not to happen.

A related story about how a print statement can make the bug disappear:

> In c or c++ printf can act as an ad-hoc synchronization point/cooperative MT point so adding printf changes the execution order of the threads, making them problem go away.

### 4\. one of your assumptions is wrong

For example, in almost all cases it’s fair to assume that the compiler does not have a bug and that the bug is in your code. But as someone on Twitter pointed out, very rarely it is a compiler bug! ([here’s the compiler bug they experienced][8])

Other examples of (more mundane) assumptions that can be wrong:

  * assuming your new code is being run when in fact something is being cached
  * assuming some environment variable is set when it isn’t
  * assuming the bug is in the software when it’s in the hardware (like a bad cable!)
  * assuming the documentation is correct



Let’s go over a few variants of “one of your assumptions is wrong”.

**the red herring**

Sometimes you see something early on when debugging that looks VERY suspicious and spend a long time investigating it, but then it turns out to be totally unrelated to the bug. This is pretty normal and it often doesn’t mean you did anything wrong (you can’t take the perfect most efficient path to understanding the bug every time!). But it can be really demoralizing.

**the case that works and the case that doesn’t work look EXACTLY the same**

This one is SO frustrating when it happens – you’re 100% sure nothing changed but somehow the code is no longer working! (of course, the answer is that something did change, you just can’t see it)

A few examples of this.

  1. one input causes your code to break, but it succeeds on a bunch of other inputs and you can’t figure out what’s different about the input that makes the code break
  2. there’s a typo that your brain is just refusing to notice
  3. a very small code change has caused a bug and you really think it shouldn’t have made any difference
  4. the exact same code is running on the same inputs, but there’s some external factor causing the bug that you haven’t considered (like a file on disk or an environment variable)



The last type we’ll talk about is bugs that are just really complex!

### 5\. the bug is really complicated

I wanted to separate this one out because a lot of bugs that are VERY DIFFICULT to understand are actually pretty simple in the end! They’re just difficult to understand because of some of the above reasons (incorrect assumptions! you don’t understand the system! it’s hard to observe the program’s state!).

But some bugs are genuinely very complicated. A few variants of this one:

**the code is complicated**

One [example from twitter][9]:

> too many, far-flung, and unknown influences on system behavior. e.g. multiple inheritance run amok _across_ libraries

**the error message has 0 results when you Google it**

This doesn’t always mean the bug is complicated, but it’s alarming when there are 0 results, or there’s 1 result and it’s… the library’s source code, or 1 sad person on a forum posting about your exact bug but there are no replies. (“Oh no, has NOBODY ever run into this bug before?!?!”)

**the bug is actually 3 bugs**

With most bugs, only one thing is going wrong – everything in the system is working correctly except 1 thing and you just need to identify the 1 thing that’s causing the problem.

It’s a lot harder when multiple things are broken at once – maybe there’s a bug in your program, and also a bug in a library you’re using, and also some unexpected behaviour on the part of your load balancer.

One common example of this is security vulnerabilities – they often involve pretty complex bugs that take a long time to explain and understand even when you figure out exactly what’s going on.

### bonus: you’re tired

This isn’t really a technical reason, but tricky bugs are WAY harder to fix when you’re tired or stressed out after a long day.

### it’s fun to see that many people have the same types of impossible bugs

I really enjoyed seeing how many people talked about the same reasons for “impossible” bugs. Debugging sometimes feels like a really intense personal struggle (WHY is this happening to ME?!?!) and I thought it was really cool to see that even some of the weirdest reasons for bugs are shared by a lot of people! More than one person mentioned “the debugger stops the bug from happening”!

### many of these can happen all at once

I was chatting with my partner about a performance problem at work that took them months to diagnose. It was challenging because:

  * it was intermittent (only happened when there was a lot of traffic)
  * it only happened in production
  * they didn’t have direct access to the system where it was happening (it was managed by a vendor)
  * it involved a Linux kernel system that they didn’t previously know existed



They figured it out, but because there were so many things that made it difficult, it took a lot of time!

If you’re interested in hearing about this debugging zine if/when I ever finish it, you can subscribe to my [zine announcements][10] mailing list. And of course I’ll post about it on this blog.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/06/08/reasons-why-bugs-might-feel-impossible/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2019/06/23/a-few-debugging-resources/
[2]: https://twitter.com/b0rk/status/1400169409277218821
[3]: https://twitter.com/BFormations/status/1400180379051597824
[4]: https://jvns.ca/blog/2015/11/21/why-you-should-understand-a-little-about-tcp/
[5]: http://www.dkriesel.com/en/blog/2013/0802_xerox-workcentres_are_switching_written_numbers_when_scanning
[6]: https://www.youtube.com/watch?v=FyLnF9U18rY
[7]: https://youtu.be/QxtwVsHxvC4?t=471
[8]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=38644
[9]: https://twitter.com/EllieOnSoftware/status/1400494936877846530
[10]: https://wizardzines.com/zine-announcements/
