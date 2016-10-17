GHLandy Translating

Solving the Linux kernel code reviewer shortage
====

Operating system security is [top of mind right now](http://www.infoworld.com/article/3124432/linux/is-the-linux-kernel-a-security-problem.html), and Linux is a big part of that discussion. One of the questions to be solved is: How do we ensure that patches going upstream are properly reviewed?

Wolfram Sang has been a Linux kernel developer since 2008, and frequently talks at Linux conferences around the world, like[LinuxCon Berlin 2016](https://linuxconcontainerconeurope2016.sched.org/event/7oA4/kernel-development-i-still-think-we-have-a-scaling-problem-wolfram-sang-consultant), about ways to improve kernel development practices. 

Let's get his point of view.

![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

### In 2013, you warned the ELCE audience in Edinburgh about subsystem latencies and other issues that may arise if things don't change. Did things change? Did some of the things you warned about end up happening?

Yes, to some extent. Of course, the Linux kernel is a very heterogeneous project, so subsystems with more focus are in a slightly better position. However, there are enough subsystems which are "just a piece of the puzzle" and for them latency has not improved, generally speaking.

### You've pointed out that the number of reviewers is a problem. Why do you think the kernel development community doesn't have enough reviewers?

One thing is that some people prefer to actually write code and not so much read code. This is OK. It just shows that not everyone is a reviewer, so we should really encourage everyone who likes to do that.

Another thing I see is when we ask people to join our community, it is first mostly about contributing patches. This is natural, I think, and worked well in the beginning when contributions were fewer. But as more and more have joined, especially companies, we've hit this review resource problem. Don't get me wrong, having so many contributions is awesome! I think that we now need to point out that taking part in the community also means more, like to take over some responsibility as a next step. It happens in some parts, but it is not enough to scale yet.

### Do you think more reviewer training or incentivization of reviewing would help?

One key point for me is to speak out about there being a problem. Yes, we are doing great so far, but that doesn't mean all is well. We also have problems like this scalability issue. Let people know so maybe some parties get interested and join. I don't think we need special training, though. Most reviewers I know are pretty good or talented, they are just too few or have too little time.

What you should have is this intrinsic motivation. For the rest, learning-by-doing works great in this field. This is one of the advantages I like to point out: Reviewing patches makes you a better coder.

### In your opinion, are there large, popular projects that you think are doing a really great job at scaling that we might borrow some ideas from?

I don't know one, but am open to hearing about them if there are.

I am very focused on the Linux kernel, so it might be plain bias. However, in my opinion the kernel is indeed special in terms of size, number of contributions, and diversity. So while I think looking at other projects to get inspiration for workflow improvements is always healthy, our scalability problems are pretty unique currently. I find it most useful to look what other subsystems in the kernel are doing.

### You've mentioned security issues as something that could come up. What should users be doing to avoid or ameliorate the severity of security issues?

My talk at LinuxCon Berlin this year is targeted at the development level. The security implications could come from patches going in without proper review. I don't want to have users deal with that, I rather want such issues to never happen. This will never work perfectly, but it is still my preferred way to tackle things.

### I'm wondering how the wider community could help. Are there certain kinds of bug reports that you wish people would file more often? Particular areas that need regular attention but don't get it for some reason?

We are not short on bug reports. What I am more afraid of is that the shortage of reviewers will lead to more bug reports due to incomplete patches going in. So, we then we'll not only have to deal with the huge amount of contributions, but also with more bugs and regressions.

### Is there anything else you wish our readers knew about your work?

With all the specialities around the Linux kernel, it often helps me to remember that at the bottom, it is just code.

--------------------------------------------------------------------------------

via: https://opensource.com/business/16/10/linux-kernel-review

作者：[Deb Nicholson][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/eximious
