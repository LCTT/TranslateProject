[#]: collector: (lujun9972)
[#]: translator: (Kevin3599)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13321-1.html)
[#]: subject: (Open Source Supply Chain: A Matter of Trust)
[#]: via: (https://www.linux.com/articles/open-source-supply-chain-a-matter-of-trust/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

开源供应链：一个有关信任的问题
======

[![][1]][2]

共同作者：Curtis Franklin, Jr

开源软件通常被认为比专有软件更安全、更有保障，因为如果用户愿意，他们可以从源代码编译软件。他们知道在他们环境中运行的代码的来源。在他们的环境中运行的代码每个部分都可以被审查，也可以追溯每段代码的开发者。
  
然而，用户和提供者们正在逐渐远离完全控制软件所带来的复杂性，而在转而追求软件的便捷和易用。
 
VMware 副总裁兼首席开源官 Dirk Hohndel 说：“当我看到在一个有关网络安全和隐私的讲座中，演讲者运行 `docker run` 命令来安装和运行一些从互联网上下载的随机二进制文件时，我经常会大吃一惊。这两件事似乎有点相左。”
  
软件供应链，即将应用程序从编码、打包、分发到最终用户的过程是相当复杂的。如果其中有一环出现错误，可能会导致软件存在潜在的风险，特别是对于开源软件。一个恶意行为者可以访问后端，并在用户不知情或不受控的情况下向其插入任何可能的恶意代码。
  
这样的问题不单单存在于云原生领域，在现代应用开发中很常见，这包括 JavaScript、NPM、PyPI、RubyGems 等等。甚至连 Mac 上的 Homebrew 过去也是通过源代码提供，由用户自己编译。
 
“如今，你只需要下载二进制文件并安装它，并期望其源代码并没有被恶意修改过。”Hohndel 说，“作为一个行业，我们需要更加关注我们的开源代码供应。这对我来说是非常重要的事，我正努力让更多的人意识到其重要性。”
  
然而，这不仅仅是一个二进制与源代码的关系。只运行一个二进制文件，而不必从源代码构建所有东西有着巨大的优势。当软件开发需求发生转变时候，这种运行方式允许开发人员在过程中更加灵活和响应更快。通过重用一些二进制文件，他们可以在新的开发和部署中快速地循环。
 
Hohndel 说：“如果有办法向这些软件添加签名，并建立一个‘即时’验证机制，让用户知道他们可以信任此软件，那就更好了。”
 
Linux 发行版解决了这个问题，因为发行版充当了看门人的角色，负责检查进入受支持的软件存储库的软件包的完整性。
 
“像通过 Debian 等发行版提供的软件包都使用了密钥签名。要确保它确实是发行版中应包含的软件，需要进行大量工作。开发者们通过这种方式解决了开源供应链问题。”Hohndel 说。
 
但是，即使在 Linux 发行版上，人们也希望简化事情，并以正确性和安全性换取速度。现在，诸如 AppImage、Snap 和 Flatpack 之类的项目已经采用了二进制方式，从而将开源供应链信任问题带入了 Linux 发行版。这和 Docker 容器的问题如出一辙。

“理想的解决方案是为开源社区找到一种设计信任系统的方法，该系统可以确保如果二进制文件是用受信任网络中的密钥签名的，那么它就可以被信任，并允许我们可靠地返回源头并进行审核，” Hohndel 建议。
 
但是，所有这些额外的步骤都会产生成本，大多数项目开发者要么不愿意，或无力承担。一些项目正在尝试寻找解决该问题的方法。例如，NPM 已开始鼓励提交软件包的用户正确认证和保护其账户安全，以提高平台的可信度。

### 开源社区善于解决问题

Hohndel 致力于解决开源供应链问题，并正试图让更多开发者意识到其重要性。去年，VMware 收购了 Bitnami，这为管理由 VMware 所签名的开源软件提供了一个良机。
 
“我们正在与各种上游开源社区进行交流，以提高对此的认识。我们还在讨论技术解决方案，这些方案将使这些社区更容易解决潜在的开源供应链问题。” Hohndel 说。
 
开源社区历来致力于确保软件质量，这其中也包括安全性和隐私性。不过，Hohndel 说：“我最担心的是，在对下一个新事物感到兴奋时，我们经常忽略了需要的基础工程原则。”
 
最终，Hohndel 认为答案将来自开源社区本身。 “开源是一种工程方法论，是一种社会实验。开源就是人们之间相互信任、相互合作、跨国界和公司之间以及竞争对手之间的合作，以我们以前从未有过的方式。”他解释说。

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/open-source-supply-chain-a-matter-of-trust/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[Kevin3599](https://github.com/kevin3599)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/01/hand-1137978_1920-1068x801.jpg (hand-1137978_1920)
[2]: https://www.linux.com/wp-content/uploads/2020/01/hand-1137978_1920.jpg
[3]: https://www.swapnilbhartiya.com/open-source-leaders-dirk-hohndel-brings-open-source-to-vmware/
[4]: https://techcrunch.com/2019/05/15/vmware-acquires-bitnami-to-deliver-packaged-applications-anywhere/
