
Greg Kroah-Hartman 解释内核社区是如何使 Linux 安全的
============

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kernel-security_0.jpg?itok=hOaTQwWV)

> 内核维护者 Greg Kroah-Hartman 谈论内核社区如何保护 Linux 不遭受损害。

由于 Linux 使用量持续扩大，内核社区去提高这个世界上使用最广泛的技术 —— Linux 内核的安全性的重要性越来越高。安全不仅对企业客户很重要，它对消费者也很重要，因为 80% 的移动设备都使用了 Linux。在本文中，Linux 内核维护者 Greg Kroah-Hartman 带我们了解内核社区如何应对威胁。

### bug 不可避免

![Greg Kroah-Hartman](https://www.linux.com/sites/lcom/files/styles/floated_images/public/greg-k-h.png?itok=p4fREYuj "Greg Kroah-Hartman")

*Greg Kroah-Hartman [Linux 基金会][1]*

正如 Linus Torvalds 曾经说过的，大多数安全问题都是 bug 造成的，而 bug 又是软件开发过程的一部分。是软件就有 bug。

Kroah-Hartman 说：“就算是 bug，我们也不知道它是安全的 bug 还是不安全的 bug。我修复的一个著名 bug，在三年后才被 Red Hat 认定为安全漏洞“。

在消除 bug 方面，内核社区没有太多的办法，只能做更多的测试来寻找 bug。内核社区现在已经有了自己的安全团队，它们是由熟悉内核核心的内核开发者组成。

Kroah-Hartman 说：”当我们收到一个报告时，我们就让参与这个领域的核心开发者去修复它。在一些情况下，他们可能是同一个人，让他们进入安全团队可以更快地解决问题“。但他也强调，内核所有部分的开发者都必须清楚地了解这些问题，因为内核是一个可信环境，它必须被保护起来。

Kroah-Hartman 说：”一旦我们修复了它，我们就将它放到我们的栈分析规则中，以便于以后不再重新出现这个 bug。“

除修复 bug 之外，内核社区也不断加固内核。Kroah-Hartman 说：“我们意识到，我们需要一些主动的缓减措施，因此我们需要加固内核。”

Kees Cook 和其他一些人付出了巨大的努力，带来了一直在内核之外的加固特性，并将它们合并或适配到内核中。在每个内核发行后，Cook 都对所有新的加固特性做一个总结。但是只加固内核是不够的，供应商们必须要启用这些新特性来让它们充分发挥作用，但他们并没有这么做。

Kroah-Hartman [每周发布一个稳定版内核][5]，而为了长期的支持，公司们只从中挑选一个，以便于设备制造商能够利用它。但是，Kroah-Hartman 注意到，除了 Google Pixel 之外，大多数 Android 手机并不包含这些额外的安全加固特性，这就意味着，所有的这些手机都是有漏洞的。他说：“人们应该去启用这些加固特性”。

Kroah-Hartman 说：“我购买了基于 Linux 内核 4.4 的所有旗舰级手机，去查看它们中哪些确实升级了新特性。结果我发现只有一家公司升级了它们的内核。……我在整个供应链中努力去解决这个问题，因为这是一个很棘手的问题。它涉及许多不同的组织 —— SoC 制造商、运营商等等。关键点是，需要他们把我们辛辛苦苦设计的内核去推送给大家。”

好消息是，与消费电子产品不一样，像 Red Hat 和 SUSE 这样的大供应商，在企业环境中持续对内核进行更新。使用容器、pod 和虚拟化的现代系统做到这一点更容易了。无需停机就可以毫不费力地更新和重启。事实上，现在来保证系统安全相比过去容易多了。

### Meltdown 和 Spectre

没有任何一个关于安全的讨论能够避免提及 Meltdown 和 Spectre 缺陷。内核社区一直致力于修改新发现的和已查明的安全漏洞。不管怎样，Intel 已经因为这些事情改变了它们的策略。

Kroah-Hartman 说：“他们已经重新研究如何处理安全 bug，以及如何与社区合作，因为他们知道他们做错了。内核已经修复了几乎所有大的 Spectre 问题，但是还有一些小问题仍在处理中”。

好消息是，这些 Intel 漏洞使得内核社区正在变得更好。Kroah-Hartman 说：“我们需要做更多的测试。对于最新一轮的安全补丁，在它们被发布之前，我们自己花了四个月时间来测试它们，因为我们要防止这个安全问题在全世界扩散。而一旦这些漏洞在真实的世界中被利用，将让我们认识到我们所依赖的基础设施是多么的脆弱，我们多年来一直在做这种测试，这确保了其它人不会遭到这些 bug 的伤害。所以说，Intel 的这些漏洞在某种程度上让内核社区变得更好了”。

对安全的日渐关注也为那些有才华的人创造了更多的工作机会。由于安全是个极具吸引力的领域，那些希望在内核空间中有所建树的人，安全将是他们一个很好的起点。

Kroah-Hartman 说：“如果有人想从事这方面的工作，我们有大量的公司愿意雇佣他们。我知道一些开始去修复 bug 的人已经被他们雇佣了。”

你可以在下面链接的视频上查看更多的内容：

[视频](https://youtu.be/jkGVabyMh1I)

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/10/greg-kroah-hartman-explains-how-kernel-community-securing-linux-0

作者：[SWAPNIL BHARTIYA][a]
选题：[oska874][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[b]:https://github.com/oska874
[1]:https://www.linux.com/licenses/category/linux-foundation
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/greg-k-hpng
[4]:https://www.linux.com/files/images/kernel-securityjpg-0
[5]:https://www.kernel.org/category/releases.html
