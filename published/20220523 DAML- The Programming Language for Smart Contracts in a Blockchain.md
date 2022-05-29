[#]: subject: "DAML: The Programming Language for Smart Contracts in a Blockchain"
[#]: via: "https://www.opensourceforu.com/2022/05/daml-the-programming-language-for-smart-contracts-in-a-blockchain/"
[#]: author: "Dr Kumar Gaurav https://www.opensourceforu.com/author/dr-gaurav-kumar/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14649-1.html"

DAML：区块链中智能合约的编程语言
======

> DAML 智能合约语言是一种专门设计的<ruby>特定领域语言<rt>domain specific language</rt></ruby>（DSL），用于编码应用的共享业务逻辑。它用于区块链环境中分布式应用的开发和部署。

![](https://img.linux.net.cn/data/attachment/album/202205/29/090752supudcno3dufa41j.jpg)

区块链技术是一种安全机制，以一种使人难以或不可能修改或入侵的方式来跟踪信息。区块链整合了交易的数字账本，它被复制并发送至其网络上的每台计算机。在链的每个区块中，都有一些交易。当区块链上发生新的交易时，该交易的记录就会被添加到属于该链的每个人的账簿中。

区块链使用<ruby>分布式账本技术<rt>distributed ledger technology</rt></ruby>（DLT），其中数据库并不保存在一个服务器或节点中。在区块链中，交易被记录在一个被称为<ruby>哈希<rt>hash</rt></ruby>的不可改变的加密符号中。这意味着，如果一个通道或链上的一个区块被改变，黑客将很难改变链上的那个区块，因为他们必须对外面的每一个版本的链都要这样做。区块链，如比特币和以太坊，随着新的区块被添加到链上而不断增长，这使得账本更加安全。

随着区块链中智能合约的实施，在没有任何人工干预的情况下，有了自动执行的场景。智能合约技术使得执行最高级别的安全、隐私和反黑客实施成为可能。

![Figure 1: Market size of blockchain technology (Source: Statista.com)][2]

区块链的用例和应用是：

* 加密货币
* 智能合约
* 安全的个人信息
* 数字健康记录
* 电子政务
* 不可伪造的代币（NFT）
* 游戏
* 跨境金融交易
* 数字投票
* 供应链管理

根据 Statista.com，自过去几年以来，区块链技术市场的规模正在以非常快的速度增长，预计到 2025 年将达到 400 亿美元。

### 区块链的编程语言和工具箱

有许多编程语言和开发工具包可用于分布式应用和智能合约。区块链的编程和脚本语言包括 Solidity、Java、Vyper、Serpent、Python、JavaScript、GoLang、PHP、C++、Ruby、Rust、Erlang 等，并根据实施场景和用例进行使用。

选择一个合适的平台来开发和部署区块链，取决于一系列因素，包括对安全、隐私、交易速度和可扩展性的需求（图 2）。

![Figure 2: Factors to look at when selecting a blockchain platform][3]

开发区块链的主要平台有：

* 以太坊
* XDC Network
* Tezos
* Stellar
* Hyperledger
* Ripple
* Hedera Hashgraph
* Quorum
* Corda
* NEO
* OpenChain
* EOS
* Dragonchain
* Monero

### DAML：一种高性能的编程语言

<ruby>数字资产建模语言<rt>Digital Asset Modeling Language</rt></ruby>，即 DAML（daml.com），是一种高性能的编程语言，用于开发和部署区块链环境中的分布式应用。它是一个轻量级和简洁的平台，用于快速应用开发。

![Figure 3: Official portal of DAML][4]

DAML 的主要特点是：

* 细粒度的权限
* 基于场景的测试
* 数据模型
* 业务逻辑
* 确定性的执行
* 存储抽象化
* 无重复开销
* 负责任的跟踪
* 原子的可组合性
* 授权检查
* 需要知道的隐私

### 安装和使用 DAML

DAML SDK 可以安装在 Linux、macOS 或 Windows 上。在多个操作系统上安装 DAML 的详细说明可访问 https://docs.daml.com/getting-started/installation.html 。

你必须具备以下条件才能使用 DAML：

* Visual Studio Code
* Java 开发套件（JDK）

DAML 可以通过下载并运行可执行的安装程序在 Windows 上安装，你可访问 https://github.com/digital-asset/daml/releases/download/v1.18.1/daml-sdk-1.18.1-windows.exe 。

在 Linux 或 Mac 上安装 DAML 可以通过在终端执行以下内容来完成：

```
$ curl -sSL https://get.daml.com/ | sh
```

安装 DAML 后，可以创建基于区块链的新应用，如图 4 和 5 所示。

![Figure 4: Creating a new app][5]

在另一个终端中，新的应用被导航并安装了项目的依赖：

![Figure 5: Running DAML][6]

```
WorkingDirectory>cd myapp/ui
WorkingDirectory>npm install
WorkingDirectory>npm start
```

这样启动了 WebUI，该应用可在 Web 浏览器上通过 URL http://localhost:3000/ 访问。

![Figure 6: Login panel in DAML app][7]

### 研究和开发的范围

区块链技术为不同类别的应用提供了广泛的开发平台和框架。其中许多平台是免费和开源的，可以下载和部署以用于基于研究的实现。研究学者、从业者和专家们可以使用这些平台为众多应用提出和实施他们的算法。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/daml-the-programming-language-for-smart-contracts-in-a-blockchain/

作者：[Dr Kumar Gaurav][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/dr-gaurav-kumar/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/blockchain-hand-shake.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Market-size-of-blockchain-technology.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Untitled.png
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-3-Official-portal-of-DAML-1.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-4-Creating-a-new-app.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-5-Running-DAML.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-6-Login-panel-in-DAML-app.jpg
