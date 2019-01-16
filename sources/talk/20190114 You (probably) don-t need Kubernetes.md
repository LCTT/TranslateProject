[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (You (probably) don't need Kubernetes)
[#]: via: (https://arp242.net/weblog/dont-need-k8s.html)
[#]: author: (Martin Tournoij https://arp242.net/)

You (probably) don't need Kubernetes
======

This may perhaps be an unpopular opinion, but the overwhelming majority of companies are probably better off not using k8s.

You know those old “Hello world according to programmer skill” jokes that start with `printf("hello, world\n")` for a junior programmer and end with some convoluted Java OOP design pattern solution for senior software architect engineer? This is kind of like that.

* Junior sysops
  `./binary`
* Experienced sysops
  `./binary` on EC2.
* devops
  Self-deployed CI pipeline to run `./binary` on EC2.
* Senior cloud orchestration engineer
  k8s orchestrated self-deployed CI pipeline to run `./binary` on E2C platform.



¯\\_(ツ)_/¯

That doesn’t mean that Kubernetes or any of these things are bad per se, just as Java or OOP aren’t bad per se, but rather that they’re horribly misapplied in many cases, just as using several Java OOP design patterns are horribly misapplied to a hello world program. For most companies the sysops requirements are fundamentally not very complex, and applying k8s to them makes litle sense.

Complexity creates work by its very nature, and I’m skeptical that using k8s is a time-saver for most users. It’s like spending a day on a script to automate some 10-minute task that you do once a month. That’s not a good time investment (especially since the chances are you’ll have to invest further time in the future by expanding or debugging that script at some point).

Your deployments probably should be automated – lest you [end up like Knightmare][1] – but k8s can often be replaced by a simple shell script.

In our own company the sysops team spent a lot of time setting up k8s. They also had to spend a lot of time on updating to a newer version a while ago (1.6 ➙ 1.8). And the result is something no one really understands without really diving in to k8s, and even then it’s hard (those YAML files, yikes!)

Before I could debug and fix deploy issues myself. Now that’s a lot harder. I understand the basic concepts, but that’s not all that useful when actually debugging practical issues. I don’t deal with k8s often enough to justify learning this.

That k8s is really hard is not a novel insight, which is why there are a host of “k8s made easy” solutions out there. The idea of adding another layer on top of k8s to “make it easier” strikes me as, ehh, unwise. It’s not like that complexity disappears; you’ve just hidden it.

I have said this many times before: when determining if something is “easy” then my prime concern is not how easy something is to write, but how easy something is to debug when things fail. Wrapping k8s will not make things easier to debug, quite the opposite: it will make it even harder.

There is a famous Blaise Pascal quote:

> All human evil comes from a single cause, man’s inability to sit still in a room.

k8s – and to lesser extent, Docker – seem to be an example of that. A lot of people seem lost in the excitement of the moment and are “k8s al the things!”, just as some people were lost in the excitement when Java OOP was new, so everything has to be converted from the “old” way to the “new” ones, even though the “old” ways still worked fine.

Sometimes the IT industry is pretty silly.

Or to summarize this post [with a Tweet][2]:

> 2014 - We must adopt #microservices to solve all problems with monoliths
>  2016 - We must adopt #docker to solve all problems with microservices
>  2018 - We must adopt #kubernetes to solve all problems with docker

You can mail me at [martin@arp242.net][3] or [create a GitHub issue][4] for feedback, questions, etc.

--------------------------------------------------------------------------------

via: https://arp242.net/weblog/dont-need-k8s.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://dougseven.com/2014/04/17/knightmare-a-devops-cautionary-tale/
[2]: https://twitter.com/sahrizv/status/1018184792611827712
[3]: mailto:martin@arp242.net
[4]: https://github.com/Carpetsmoker/arp242.net/issues/new
