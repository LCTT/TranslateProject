[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New zine: How Containers Work!)
[#]: via: (https://jvns.ca/blog/2020/04/27/new-zine-how-containers-work/)
[#]: author: (Julia Evans https://jvns.ca/)

New zine: How Containers Work!
======

On Friday I published a new zine: “How Containers Work!”. I also launched a fun redesign of [wizardzines.com][1].

You can get it for $12 at <https://wizardzines.com/zines/containers>. If you buy it, you’ll get a PDF that you can either print out or read on your computer. Or you can get a pack of [all 8 zines][2] so far.

Here’s the cover and table of contents:

[![][3]][4] <https://jvns.ca/images/containers-toc.png>

### why containers?

I’ve spent a lot of time [figuring][5] [out][6] [how to][7] [run][8] [things][9] [in][10] [containers][11] over the last 3-4 years. And at the beginning I was really confused! I knew a bunch of things about Linux, and containers didn’t seem to fit in with anything I thought I knew (“is it a process? what’s a network namespace? what’s happening?“). The whole thing seemed really weird.

It turns out that containers ARE actually pretty weird. They’re not just one thing, they’re what you get when you glue together 6 different features that were mostly designed to work together but have a bunch of confusing edge cases.

As usual, the thing that helped me the most in my container adventures is a good understanding of the **fundamentals** – what exactly is actually happening on my server when I run a container?

So that’s what this zine is about – cgroups, namespaces, pivot_root, seccomp-bpf, and all the other Linux kernel features that make containers work.

Once I understood those ideas, it got a **lot** easier to debug when my containers were doing surprising things in production. I learned a couple of interesting and strange things about containers while writing this zine too – I’ll probably write a blog post about one of them later this week.

### containers aren’t magic

This picture (page 6 of the zine) shows you how to run a fish container image with only 15 lines of bash. This is heavily inspired by [bocker][12], which “implements” Docker in about 100 lines of bash.

<https://jvns.ca/images/containers-arent-magic.jpg>

The main things I see missing from that script compared to what Docker actually does when running a container (other than using an actual container image and not just a tarball) are:

  * it doesn’t drop any capabilities – the container is still running as root and has full root privileges (just in a different mount + PID namespace)
  * it doesn’t block any system calls with seccomp-bpf



### container command line tools

The zine also goes over a bunch of command line tools &amp; files that you can use to inspect running containers or play with Linux container features. Here’s a list:

  * `mount -t overlay` (create and view overlay filesystems)
  * `unshare` (create namespaces)
  * `nsenter` (use an existing namespace)
  * `getpcaps` (get a process’s capabilities)
  * `capsh` (drop or add capabilities, etc)
  * `cgcreate` (create a cgroup)
  * `cgexec` (run a command in an existing cgroup)
  * `chroot` (change root directory. not actually what containers use but interesting to play with anyway)
  * `/sys/fs/cgroups` (for information about cgroups, like `memory.usage_in_bytes`)
  * `/proc/PID/ns` (all a process’s namespaces)
  * `lsns` (another way to view namespaces)



I also made a short youtube video a while back called [ways to spy on a Docker container][13] that demos some of these command line tools.

### container runtime agnostic

I tried to keep this zine pretty container-runtime-agnostic – I mention Docker a couple of times because it’s so widely used, but it’s about the Linux kernel features that make containers work in general, not Docker or LXC or systemd-nspawn or Kubernetes or whatever. If you understand the fundamentals you can figure all those things out!

### we redesigned wizardzines.com!

On Friday I also launched a redesign of [wizardzines.com][1]! [Melody Starling][14] (who is amazing) did the design. I think now it’s better organized but the tiny touch that I’m most delighted by is that now the zines jump with joy when you hover over them.

One cool thing about working with a designer is – they don’t just make things _look_ better, they help _organize_ the information better so the website makes more sense and it’s easier to find things! This is probably obvious to anyone who knows anything about design but I haven’t worked with designers very much (or maybe ever?) so it was really cool to see.

One tiny example of this: Melody had the idea of adding a tiny FAQ on the landing page for each zine, where I can put the answers to all the questions people always ask! Here’s what the little FAQ box looks like:

[![][15]][4]

I probably want to edit those questions &amp; answers over time but it’s SO NICE to have somewhere to put them.

### what’s next: maybe debugging! or working more on flashcards!

The two projects I’m thinking about the most right now are

  1. a zine about debugging, which I started last summer and haven’t gotten around to finishing yet
  2. a [flashcards project][16] that I’ve been adding to slowly over the last couple of months. I think could become a nice way to explain basic ideas.



Here’s a link to where to [get the zine][4] again :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/04/27/new-zine-how-containers-work/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com
[2]: https://wizardzines.com/zines/all-the-zines/
[3]: https://jvns.ca/images/containers-cover.jpg
[4]: https://wizardzines.com/zines/containers
[5]: https://stripe.com/en-ca/blog/operating-kubernetes
[6]: https://jvns.ca/blog/2016/09/15/whats-up-with-containers-docker-and-rkt/
[7]: https://jvns.ca/blog/2016/10/10/what-even-is-a-container/
[8]: https://jvns.ca/blog/2016/12/22/container-networking/
[9]: https://jvns.ca/blog/2016/10/26/running-container-without-docker/
[10]: https://jvns.ca/blog/2017/02/17/mystery-swap/
[11]: https://jvns.ca/blog/2016/10/02/a-list-of-container-software/
[12]: https://github.com/p8952/bocker
[13]: https://www.youtube.com/watch?v=YCVSdnYzH34&t=1s
[14]: https://melody.dev
[15]: https://jvns.ca/images/wizardzines-faq.png
[16]: https://flashcards.wizardzines.com
