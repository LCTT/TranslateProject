[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11877-1.html)
[#]: subject: (What's HTTPS for secure computing?)
[#]: via: (https://opensource.com/article/20/1/confidential-computing)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

用于安全计算的 HTTPS 是什么？
======

> 在默认的情况下，网站的安全性还不足够。

![](https://img.linux.net.cn/data/attachment/album/202002/11/123552rqncn4c7474j44jq.jpg)

在过去的几年里，寻找一个只以 “http://...” 开头的网站变得越来越难，这是因为业界终于意识到，网络安全“是件事”，同时也是因为客户端和服务端之间建立和使用 https 连接变得更加容易了。类似的转变可能正以不同的方式发生在云计算、边缘计算、物联网、区块链，人工智能、机器学习等领域。长久以来，我们都知道我们应该对存储的静态数据和在网络中传输的数据进行加密，但是在使用和处理数据的时候对它进行加密是困难且昂贵的。可信计算（使用例如<ruby>受信任的执行环境<rt>Trusted Execution Environments</rt></ruby> TEEs 这样的硬件功能来提供数据和算法这种类型的保护）可以保护主机系统中的或者易受攻击的环境中的数据。

关于 [TEEs][2]，当然，还有我和 Nathaniel McCallum 共同创立的 [Enarx 项目][3]，我已经写了几次文章（参见《[给每个人的 Enarx（一个任务）][4]》 和 《[Enarx 迈向多平台][5]》）。Enarx 使用 TEEs 来提供独立于平台和语言的部署平台，以此来让你能够安全地将敏感应用或者敏感组件（例如微服务）部署在你不信任的主机上。当然，Enarx 是完全开源的（顺便提一下，我们使用的是 Apache 2.0 许可证）。能够在你不信任的主机上运行工作负载，这是可信计算的承诺，它扩展了使用静态敏感数据和传输中数据的常规做法：

* **存储**：你要加密你的静态数据，因为你不完全信任你的基础存储架构。
* **网络**：你要加密你正在传输中的数据，因为你不完全信任你的基础网络架构。
* **计算**：你要加密你正在使用中的数据，因为你不完全信任你的基础计算架构。

关于信任，我有非常多的话想说，而且，上述说法里的单词“**完全**”是很重要的（在重新读我写的这篇文章的时候，我新加了这个单词）。不论哪种情况，你必须在一定程度上信任你的基础设施，无论是传递你的数据包还是存储你的数据块，例如，对于计算基础架构，你必须要去信任 CPU 和与之关联的固件，这是因为如果你不信任他们，你就无法真正地进行计算（现在有一些诸如<ruby>同态加密<rt>homomorphic encryption</rt></ruby>一类的技术，这些技术正在开始提供一些可能性，但是它们依然有限，这些技术还不够成熟）。

考虑到发现的一些 CPU 安全性问题，是否应该完全信任 CPU 有时自然会产生疑问，以及它们是否在针对其所在的主机的物理攻击中具有完全的安全性。

这两个问题的回答都是“不”，但是在考虑到大规模可用性和普遍推广的成本，这已经是我们当前拥有的最好的技术了。为了解决第二个问题，没有人去假装这项技术（或者任何的其他技术）是完全安全的：我们需要做的是思考我们的[威胁模型][6]并确定这个情况下的 TEEs 是否为我们的特殊需求提供了足够的安全防护。关于第一个问题，Enarx 采用的模型是在部署时就对你是否信任一个特定的 CPU 组做出决定。举个例子，如果供应商 Q 的 R 代芯片被发现有漏洞，可以很简单地说“我拒绝将我的工作内容部署到 Q 的 R 代芯片上去，但是仍然可以部署到 Q 的 S 型号、T 型号和 U 型号的芯片以及任何 P、M 和 N 供应商的任何芯片上去。”

我认为这里发生了三处改变，这些改变引起了人们现在对<ruby>机密计算<rt>confidential computing</rt></ruby>的兴趣和采用。

1. **硬件可用**：只是在过去的 6 到 12 个月里，支持 TEEs 的硬件才开始变得广泛可用，这会儿市场上的主要例子是 Intel 的 SGX 和 AMD 的 SEV。我们期望在未来可以看到支持 TEE 的硬件的其他例子。
2. **行业就绪**：就像上云越来越多地被接受作为应用程序部署的模型，监管机构和立法机构也在提高各类组织保护其管理的数据的要求。组织开始呼吁在不受信任的主机运行敏感程序（或者是处理敏感数据的应用程序）的方法，更确切地说，是在无法完全信任且带有敏感数据的主机上运行的方法。这不足为奇：如果芯片制造商看不到这项技术的市场，他们就不会投太多的钱在这项技术上。Linux 基金会的[机密计算联盟（CCC）][7]的成立就是业界对如何寻找使用加密计算的通用模型并且鼓励开源项目使用这些技术感兴趣的案例。（红帽发起的 Enarx 是一个 CCC 项目。）
3. **开放源码**：就像区块链一样，机密计算是使用开源绝对明智的技术之一。如果你要运行敏感程序，你需要去信任正在为你运行的程序。不仅仅是 CPU 和固件，同样还有在 TEE 内执行你的工作负载的框架。可以很好地说，“我不信任主机机器和它上面的软件栈，所以我打算使用 TEE，”但是如果你不够了解 TEE 软件环境，那你就是将一种软件不透明换成另外一种。TEEs 的开源支持将允许你或者社区（实际上是你与社区）以一种专有软件不可能实现的方式来检查和审计你所运行的程序。这就是为什么 CCC 位于 Linux 基金会旗下（这个基金会致力于开放式开发模型）并鼓励 TEE 相关的软件项目加入且成为开源项目（如果它们还没有成为开源）。

我认为，在过去的 15 到 20 年里，硬件可用、行业就绪和开放源码已成为推动技术改变的驱动力。区块链、人工智能、云计算、<ruby>大规模计算<rt>webscale computing</rt></ruby>、大数据和互联网商务都是这三个点同时发挥作用的例子，并且在业界带来了巨大的改变。

在一般情况下，安全是我们这数十年来听到的一种承诺，并且其仍然未被实现。老实说，我不确定它未来会不会实现。但是随着新技术的到来，特定用例的安全变得越来越实用和无处不在，并且在业内受到越来越多的期待。这样看起来，机密计算似乎已准备好成为成为下一个重大变化 —— 而你，我亲爱的读者，可以一起来加入到这场革命（毕竟它是开源的）。

这篇文章最初是发布在 Alice, Eve, and Bob 上的，这是得到了作者许可的重发。


--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/confidential-computing

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/secure_https_url_browser.jpg?itok=OaPuqBkG (Secure https browser)
[2]: https://aliceevebob.com/2019/02/26/oh-how-i-love-my-tee-or-do-i/
[3]: https://enarx.io/
[4]: https://aliceevebob.com/2019/08/20/enarx-for-everyone-a-quest/
[5]: https://aliceevebob.com/2019/10/29/enarx-goes-multi-platform/
[6]: https://aliceevebob.com/2018/02/20/there-are-no-absolutes-in-security/
[7]: https://confidentialcomputing.io/
[8]: tmp.VEZpFGxsLv#1
[9]: https://aliceevebob.com/2019/12/03/confidential-computing-the-new-https/
