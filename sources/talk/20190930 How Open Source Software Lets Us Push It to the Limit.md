[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Open Source Software Lets Us Push It to the Limit)
[#]: via: (https://opensourceforu.com/2019/09/how-open-source-software-lets-us-push-it-to-the-limit/)
[#]: author: (Ebbe Kernel https://opensourceforu.com/author/ebbe-kernel/)

How Open Source Software Lets Us Push It to the Limit
======

[![best text editors for web development][1]][2]

_Here is a conversation with Johan, a leading developer of an advanced proxy network. As his team tackles complex load-balancing problems, they are constantly forced to push their solutions beyond what the original developers imagined. He says that the decision to use an open source load-balancer HAProxy has made it possible to do what would not be possible with other solutions._

**Ebbe: Tell us a bit about why you chose HAProxy for load-balancing.**

**Johan: **Even though we use both open source and private source solutions for our network, I am a real ambassador for open source in our team. I think HAProxy is a perfect example of a great solution for a particular problem that can be adapted in unforeseen ways precisely because it is open sourced.

Ever since we started work developing our proxy network, I looked into using an open source solution for load-balancing. We tried Nginx and Squid, but we soon realized that HAProxy is an indisputable industry standard and the only option for our product.

**Ebbe: What made it exemplary?**

**Johan: **What I’ve found with great open source software is that it must be constantly evolving, updated and managed. And in the case of HAProxy, we get minor updates every month. At first we liked the quick bug fixes. But now we jumped the waggon on the new major release, as it offered new features we were aching to implement.

Everyone knows that you do not update any working solutions until the last minute to make sure that early bugs are fixed, but good software [_offers features you can’t resist_][3]. We trust it because it is transparent and has a strong community that has proven it can tackle most issues quickly.

**Ebbe: You mentioned the community, which often accompanies great open source solutions. Does it really have that much of an impact for your business?**

**Johan:** Of course. In terms of scale, everything pales in comparison to the community that HAProxy has mustered over the years. Every issue we encounter is usually solved or already escalated, and, as more and more companies use HAProxy, the community becomes vaster and more intelligent.

What we’ve found with other services we use, even enterprise solutions might not offer the freedom and flexibility we need. In our case, an active community is what makes it possible to adapt software in previously untested ways.

**Ebbe: What in particular does it let you do?**

**Johan: **Since we chose HAProxy to use in our network, we found that creating ‘add-ons’ with Lua let us fully customize it to our own logic and integrate it with all of the other services that make the network work. This was extremely important, as we have a lot of services that need to work together, including some that are not open source.

Another great thing is that the community is always solving problems and bugs, so we do not really encounter stuff we couldn’t handle. Over the years, I’ve found that this is only possible for open source software.

What makes it a truly exceptional open source solution is the documentation. Even though I’ve been working closely with HAProxy for over two years, I still find new things almost every month.

I know it sounds like a lot of praise, but I really love HAProxy for its resilience to our constant attempts to break it.

**Ebbe: What do you mean by ‘break it’?**

**Johan: **Originally, HAProxy works great as [_a load balancer for a couple of dozen servers_][4], usually 10 to 20. But, since our network is several orders of magnitude larger, we’ve constantly pushed it to its limits.

It’s not uncommon for our HAProxy instances to load-balance over 10,000 servers, and we are certain that the original developers haven’t thought about optimizing it for these kind of loads. Due to this, it sometimes fails, but we are constantly optimizing our own solutions to make everything work. And, thanks to HAProxy’s developers and community, we are able to solve most of the issues we encounter easily.

**Ebbe: Doesn’t this downtime impact your product negatively?**

**Johan: **First of all, our product would not work without HAProxy. At least not as successfully as it has over the years. As I’ve said, all other solutions on the market are less optimized for what we do than HAProxy.

Also, ‘breaking’ a service is nothing bad in and of itself. We always have backup services in place to handle the network. Testing in production is what we do for a simple reason: since we ‘break’ the HAProxy so much, we cannot really test any updates before launching something on our network. We need the full scale of our network to run HAProxy instances and all the millions of servers to be available, and creating such a testing environment seems like a huge waste of resources.

**Ebbe: Do you have anything to add to the community of OpenSourceForU.com?**

**Johan: **My team and I want to thank everyone for supporting open source principles and making the world a better place!

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/how-open-source-software-lets-us-push-it-to-the-limit/

作者：[Ebbe Kernel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/ebbe-kernel/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2017/07/developer-blog.jpg?resize=696%2C433&ssl=1 (text editor)
[2]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2017/07/developer-blog.jpg?fit=750%2C467&ssl=1
[3]: https://smartproxy.com/what-is-a-proxy
[4]: https://opensourceforu.com/2016/09/github-open-sources-internal-load-balancer/
