如何管理开源产品的安全漏洞
============================================================


 ![software vulnerabilities](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/security-software-vulnerabilities.jpg?itok=D3joblgb "software vulnerabilities") 
在即将举行的 ELC + OpenIoT 峰会上，英特尔安全架构师 Ryan Ware 将会解释如何解决大量漏洞，并管理你产品的安全性。

[Creative Commons Zero][2]Pixabay

在开发开源软件时, 你需要考虑的安全漏洞可能是大量的。常见漏洞枚举（CVE）ID、零日和其他漏洞似乎每天都在公布。随着这些大量的信息，你怎么能跟上最新消息？

英特尔安全架构师 Ryan Ware 表示：“如果你发布了基于 Linux 内核 4.4.1 的产品，该内核截止今日已经有 9 个针对该内核的 CVE。这些都会影响你的产品，尽管事实上它们在出货时不知道。”

 ![Ryan Ware](https://www.linux.com/sites/lcom/files/styles/floated_images/public/ryan-ware_01.jpg?itok=cy13TM9g "Ryan Ware") 

英特尔安全架构师 Ryan Ware [经许可使用][1]

在即将举行的 [ELC][6] + [OpenIoT 峰会][7]上，英特尔安全架构师 Ryan Ware 的演讲将介绍如何实施并成功管理产品的安全性的策略。在他的演讲中，Ware 讨论了最常见的开发者错误，跟上最新的漏洞的策略等等。

**Linux.com：让我们从头开始。你能否简要介绍一下常见漏洞和曝光（CVE），零日以及其他漏洞么？它们是什么，为什么重要？**

Ryan Ware：好问题。常见漏洞和曝光（CVE）是由美国政府的要求由 MITR Corporation（一个非营利组织）维护的数据库。目前由美国国土安全部资助。它是在 1999 年创建的，以包含有关所有公众安全漏洞的信息。这些漏洞中的每一个都有自己的标识符（CVE-ID），并且可以被引用。这就是 CVE 这个术语，已经演变成一个单独的安全漏洞: 一个 CVE。
 
CVE 数据库中的许多漏洞最初是零日漏洞。这些漏洞出于不管什么原因没有遵循更有序的披露过程，如负责披露。关键在于，如果没有软件供应商能够通过某种类型的修复（通常是软件补丁）来进行响应，那么它们已经成为公开和可利用的。这些和其他未打补丁的软件漏洞至关重要，因为在修补软件之前，漏洞是可以利用的。在许多方面，发布 CVE 或者零日就像是开枪。在你比赛结束之前，你的客户很容易受到伤害。

**Linux.com：有多少漏洞？你如何确定那些与你的产品相关？**

Ryan：在探讨有多少之前，任何以任何形式发布软件的人都应该记住。即使你采取一切努力确保你发布的软件没有已知的漏洞，你的软件*也会*存在漏洞。他们只是不知道而已。例如，如果你发布了一个基于 Linux 内核 4.4.1 的产品，那么截止今日，已经有了 9 个CVE。这些都会影响你的产品，尽管事实上它们在出货时不知道。

此时，CVE 数据库包含 80,957 个条目（2017年1月30日），包括追溯到 1999 年的记录，当时有 894 个已记录问题。迄今为止，一年中最大的数字是 2014 年，当时记录了 7,946 个问题。也就是说，我相信过去两年的数字减少并不是因为安全漏洞的减少。这是我将在我的谈话中说到的东西

**Linux.com：开发人员可以使用哪些策略来跟上这些信息？**

Ryan：开发人员可以通过各种方式跟上漏洞信息。我最喜欢的工具之一是 [CVE Details][8]。它以一种非常容易理解的方式展示了来自 MITRE 的信息。它最好的功能是创建自定义 RSS 源的能力，以便你可以跟踪你关心的组件的漏洞。那些追踪更复杂问题的人可能希望从下载 MITR CVE 数据库（免费提供）开始，并定期更新。其他优秀工具，如 cvechecker，可以让你检查软件中已知的漏洞。

对于软件栈中的关键部分，我还推荐一个非常有用的工具：参与上游社区。这些是最理解你发布的软件的人。世界上没有比他们更好的专家。与他们一起合作。

**Linux.com：你怎么知道你的产品是否涵盖了所有漏洞？有推荐的工具吗？**

Ryan：不幸的是，正如我上面所说，你永远无法从你的产品中移除所有的漏洞。上面提到的一些工具是关键。但是，我还没有提到一个对你发布的任何产品来说都是至关重要的软件：软件更新机制。如果你无法在当场更新产品软件，则当客户受到影响时，你无法解决安全问题。你的软件必须能够更新，更新过程更容易，你的客户将受到更好的保护。

**Linux.com：开发人员还需要知道什么才能成功管理安全漏洞？**

Ryan：有一个我反复看到的错误。开发人员总是需要牢记将攻击面最小化的想法。这是什么意思？在实践中，这意味着只包括你的产品实际需要的东西！这不仅包括确保你不将无关的软件包加入到你的产品中，而且还可以关闭不需要的功能的配置来编译项目。

这有什么帮助？想象这是 2014 年。你刚刚上班就看到 Heartbleed 的技术新闻。你知道你在产品中包含 OpenSSL，因为你需要执行一些基本的加密功能，但不使用 TLS 心跳，该问题与该漏洞相关。你愿意:：

a. 花费时间与客户和合作伙伴合作，通过关键的软件更新来修复这个高度安全问题？

b. 只需要告诉你的客户和合作伙伴，你使用 “-DOPENSSL_NO_HEARTBEATS” 标志编译 OpenSSL 产品，他们不会受到损害，你就可以专注于新功能和其他生产活动。

最简单解决漏洞的方法是你不包含这个漏洞。

_嵌入式 Linux 会议 + OpenIoT 北美峰会将于 2017 年 2 月 21 日至 23 日在俄勒冈州波特兰举行。查看关于 Linux 内核、嵌入式开发和系统，以及最新的开放物联网的[超过 130 个会话][5]。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/elcna/2017/2/how-manage-security-vulnerabilities-your-open-source-product

作者：[AMBER ANKERHOLZ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/aankerholz
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/ryan-ware01jpg
[4]:https://www.linux.com/files/images/security-software-vulnerabilitiesjpg
[5]:http://events.linuxfoundation.org/events/embedded-linux-conference/program/schedule?utm_source=linux&utm_campaign=elc17&utm_medium=blog&utm_content=video-blog
[6]:http://events.linuxfoundation.org/events/embedded-linux-conference
[7]:http://events.linuxfoundation.org/events/openiot-summit
[8]:http://www.cvedetails.com/
