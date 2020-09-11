[#]: collector: (lujun9972)
[#]: translator: (Starryi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why we open sourced our security project)
[#]: via: (https://opensource.com/article/20/8/why-open-source)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

Why we open sourced our security project
======
It’s not just coding that we do in the open.
![A lock on the side of a building][1]

When Nathaniel McCallum and I embarked on the project that is now called [Enarx][2], we made one decision right at the beginning: the code for Enarx would be open source, a stance fully supported by our employer, Red Hat (see the [standard disclaimer][3] on my blog). All of it, and forever.

That's a decision that we've not regretted at any point, and it's something we stand behind. As soon as we had enough code for a demo and were ready to show it, we created a [repository on GitHub][4] and made it public. There's a very small exception, which is that there are some details of upcoming chip features that are shared with us under an NDA[1][5] where publishing any code we might write for them would be a breach of the NDA. But where this applies (which is rarely), we are absolutely clear with the vendors that we intend to make the code open as soon as possible, and we lobby them to release details as early as they can (which may be earlier than they might prefer) so that more experts can look over both their designs and our code.

### Auditability and trust

This brings us to possibly the most important reasons for making Enarx open source: auditability and trust. Enarx is a security-related project, and I believe passionately not only that [security should be done in the open][6] but also that if anybody is actually going to trust their sensitive data, algorithms, and workloads to a piece of software, then they want to be in a position where as many experts as possible have looked at it, scrutinised it, criticised it, and improved it, whether that is the people running the software, their employees, contractors, or (even better) the wider security community. The more people who check the code, the happier you should be to [trust it][7]. This is important for any piece of security software, but it is _vital_ for software such as Enarx, which is designed to protect your most sensitive workloads.

### Bug catching

There are bugs in Enarx. I know: I'm writing some of the code,[2][8] and I found one yesterday (which I'd put in), just as I was about to give a demo.[3][9] It is very, very difficult to write perfect code, and we know that if we make our source open, then more people can help us fix issues.

### Commonwealth

For Nathaniel and me, open source is an ethical issue, and we make no apologies for that. I think it's the same for most, if not all, of the team working on Enarx. This includes a number of Red Hat employees (see standard disclaimer), so it shouldn't come as a surprise, but we also have non-Red Hat contributors from a number of backgrounds. We feel that Enarx should be a Common Good and [contribute to the commonwealth][10] of intellectual property out there.

### More brainpower

Making something open source doesn't just make it easier to fix bugs: it can improve the quality of what you produce in general. The more brainpower you have to apply to the problem, the better your chances of making something great––assuming that the brainpower is applied efficiently (not always an easy task!). In a recent design meeting, one of the participants said towards the end, "I'm sure I could implement some of this, but I don't know a huge amount about this topic, and I'm worried that I'm not contributing to this discussion." In fact, they had contributed by asking questions and clarifying some points, and we assured them that we wanted to include experienced, senior developers for their expertise and knowledge and to pull out assumptions and validate the design, and not because we expected everybody to be experts in all parts of the project.

Having bright people involved in design and coding spreads expertise and knowledge and helps keep the work from becoming an insulated, isolated "ivory tower" construction, understood by few, and almost impossible to validate.

### Not just code

It's not just coding that we do in the open. We manage our architecture in the open, our design meetings, our protocol design, our design methodology,[4][11] our documentation, our bug tracking, our chat, our CI/CD processes: all of it is open. The one exception is our [vulnerability management][12] process, which needs the opportunity for confidential exposure for a limited time. Here is where you can find our resources:

  * [Code][4]
  * [Wiki][13]
  * Design is on the wiki and [request for comments][14] repo
  * [Issues][15] and [pull requests][16]
  * [Chat][17] (thanks to [Rocket.chat][18]!)
  * CI/CD resources thanks to [Packet][19]!
  * [Stand-ups][20]



We also take diversity seriously, and the project contributors are subject to the [Contributor Covenant Code of Conduct][21].

In short, Enarx is an open project. I'm sure we could do better, and we'll strive for that, but our underlying principles are that open is good in general and vital for security. If you agree, please come and visit!

* * *

  1. Non-disclosure agreement
  2. To the surprise of many of the team, including myself. At least it's not in Perl.
  3. I fixed it. Admittedly, after the demo.
  4. We've just moved to a sprint pattern, the details of which we designed and agreed to in the open.



* * *

_This article was originally published on [Alice, Eve, and Bob][22] and is adapted and reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/why-open-source

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://enarx.dev/
[3]: https://aliceevebob.com/
[4]: https://github.com/enarx
[5]: tmp.PM1nWCfATC#1
[6]: https://opensource.com/article/17/10/many-eyes
[7]: https://aliceevebob.com/2019/06/18/trust-choosing-open-source/
[8]: tmp.PM1nWCfATC#2
[9]: tmp.PM1nWCfATC#3
[10]: https://opensource.com/article/17/11/commonwealth-open-source
[11]: tmp.PM1nWCfATC#4
[12]: https://aliceevebob.com/2020/05/26/security-disclosure-or-vulnerability-management/
[13]: https://github.com/enarx/enarx/wiki
[14]: https://github.com/enarx/rfcs
[15]: https://github.com/enarx/enarx/issues
[16]: https://github.com/enarx/enarx/pulls
[17]: https://chat.enarx.dev/
[18]: https://rocket.chat/
[19]: https://packet.com/
[20]: https://github.com/enarx/enarx/wiki/How-to-contribute
[21]: https://github.com/enarx/.github/blob/master/CODE_OF_CONDUCT.md
[22]: https://aliceevebob.com/2020/07/28/why-enarx-is-open/
