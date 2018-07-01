对可互换通证（ERC-20 系列）的通证 ERC 的比较
======

> “对于标准来说，最好的事情莫过于大量的人都去选择使用它。“

> —— [_Andrew S. Tanenbaum_][1]

### 通证标准的现状

在以太坊平台上，通证标准的现状出奇的简单：ERC-20 <ruby>通证<rt>token</rt></ruby>标准是通证接口中唯一被采用（ [EIP-20][2]）和接受的通证标准。

它在 2015 年被提出，最终接受是在 2017 年末。

在此期间，提出了许多解决 ERC-20 缺点的<ruby>以太坊意见征集<rt>Ethereum Requests for Comments</rt></ruby>（ERC），其中的一部分是因为以太坊平台自身变更所导致的，比如，由 [EIP-150][3] 修复的<ruby>重入<rt>re-entrancy</rt></ruby> bug。其它 ERC 提出的对 ERC-20 通证模型的强化。这些强化是通过收集大量的以太坊区块链和 ERC-20 通证标准的使用经验所确定的。ERC-20 通证接口的实际应用产生了新的要求和需要，比如像权限和操作方面的非功能性需求。

这篇文章将浅显但完整地对以太坊平台上提出的所有通证（类）的标准进行简单概述。我将尽可能客观地去做比较，但不可避免地仍有一些不客观的地方。

### 通证标准之母：ERC-20

有成打的 [非常好的][4] 关于 ERC-20 的详细描述，在这里就不一一列出了。只对在文章中提到的相关核心概念做个比较。

#### 提取模式

用户不太好理解 ERC-20 接口，尤其是从一个<ruby>外部所有者帐户<rt>externally owned account</rt></ruby>（EOA）_转账_ 通证的模式，即一个终端用户（“Alice”）到一个智能合约的转账，很难正确理解 `approve`/`transferFrom` 模式。

![][5]

从软件工程师的角度看，这个提取模式非常类似于 <ruby>[好莱坞原则][6]<rt>Hollywood Principle</rt></ruby> （“不要给我们打电话，我们会给你打电话的！”）。那个调用链的想法正好相反：在 ERC-20 通证转账中，通证不能调用合约，但是合约可以调用通证上的 `transferFrom`。

虽然好莱坞原则经常用于去实现<ruby>关注点分离<rt>Separation-of-Concerns</rt></ruby>（SoC），但在以太坊中它是一个安全模式，目的是为了防止通证合约去调用外部合约上的未知的函数。这种行为是非常有必要的，因为会出现 <ruby>[调用深度攻击][7]<rt>Call Depth Attack</rt></ruby>，直到 [EIP-150][3] 被启用才解决。在这个硬分叉之后，这个重入 bug 将不再可能出现了，并且提取模式也不能提供任何比直接通证调用更好的安全性。

但是，为什么现在它成了一个问题呢？可能是由于某些原因，它的用法设计有些欠佳，但是我们可以通过前端的 DApp 来修复这个问题，对吗？

因此，我们来看一看，如果一个用户使用 `transfer` 去发送一些通证到智能合约会发生什么事情。Alice 对通证合约的合约地址进行转账，

**….啊啊啊，它不见了！**

是的，通证没有了。很有可能，没有任何人再能拿回通证了。但是像 Alice 的这种做法并不鲜见，正如 ERC-223 的发明者 Dexaran 所发现的，大约有 $400.000 的通证（由于 ETH 波动很大，我们只能说很多）是由于用户意外发送到智能合约中，并因此而丢失。

即便合约开发者是一个非常友好和无私的用户，他也不能创建一个合约以便将它收到的通证返还给你。因为合约并不会提示这类转账，并且事件仅在通证合约上发出。

从软件工程师的角度来看，那就是 ERC-20 的重大缺点。如果发生一个事件（为简单起见，我们现在假设以太坊交易是真实事件），对参与的当事人应该有一个提示。但是，这个事件是在通证的智能合约中触发的，合约接收方是无法知道它的。

目前，还不能做到防止用户向智能合约发送通证，并且在 ERC-20 通证合约上使用这种不直观的转账将导致这些发送的通证永远丢失。

### 帝国反击战：ERC-223

第一个尝试去修复 ERC-20 的问题的提案是 [Dexaran][8]  提出来的。这个提议通过将 EOA 和智能合约账户做不同的处理的方式来解决这个问题。

强制的策略是去反转调用链（并且使用 [EIP-150][3] 解决它现在能做到了），并且在正在接收的智能合约上使用一个预定义的回调（`tokenFallback`）。如果回调没有实现，转账将失败（将消耗掉发送方的燃料，这是 ERC-223 最常被批评的一个地方）。

![][9]

**好处：**

  * 创建一个新接口，有意使用这个废弃的函数来不遵守 ERC-20
  * 允许合约开发者去处理收到的通证（即：接受/拒绝）并因此遵守事件模式
  * 用一个交易来代替两个交易（`transfer` vs. `approve`/`transferFrom`）并且节省了燃料和区域链的存储空间

**坏处：**

  * 如果 `tokenFallback` 不存在，那么合约的 `fallback` 功能将运行，这可能会产生意料之外的副作用
  * 假如合约使用通证转账功能的话，比如，发送通证到一个特定的像多签名钱包一样的账户，这将使 ERC-223 通证失败，它将不能转移（即它们会丢失）。

### 程序员修练之道：ERC-677

[ERC-667：transferAndCall 通证标准][10] 尝试将 ERC-20 和 ERC-223 结合起来。这个创意是在 ERC-20 中引入一个 `transferAndCall` 函数，并保持标准不变。ERC-223 有意不完全向后兼容，由于不再需要 `approve`/`allowance` 模式，并因此将它删除。

ERC-667 的主要目标是向后兼容，为新合约向外部合约转账提供一个安全的方法。

![][11]

**好处：**

  * 容易适用新的通证
  * 兼容 ERC-20
  * 为 ERC-20 设计的适配器用于安全使用 ERC-20

**坏处：**

  * 不是真正的新方法。只是一个 ERC-20 和 ERC-223 的折衷
  * 目前实现 [尚未完成][12]

### 重逢：ERC-777

[ERC-777：一个先进的新通证标准][13]，引入它是为了建立一个演进的通证标准，它是吸取了像带值的 `approve()` 以及上面提到的将通证发送到合约这样的错误观念的教训之后得来的演进后标准。

另外，ERC-777 使用了新标准 [ERC-820：使用一个注册合约的伪内省][14]，它允许为合约注册元数据以提供一个简单的内省类型。并考虑到了向后兼容和其它的功能扩展，这些取决于由一个 EIP-820 查找到的地址返回的 `ITokenRecipient`，和由目标合约实现的函数。

ERC-777 增加了许多使用 ERC-20 通证的经验，比如，白名单操作者、提供带 `send(…)` 的以太兼容的接口，为了向后兼容而使用 ERC-820 去覆盖和调整功能。

![][15]

**好处：**

  * 从 ERC-20 的使用经验上得来的、经过深思熟虑的、进化的通证接口
  * 为内省要求 ERC-820 使用新标准，接受了增加的功能
  * 白名单操作者非常有用，而且比 `approve`/`allowance` 更有必要，它经常是无限的

**坏处：**

  * 刚刚才开始，复杂的依赖合约调用的结构
  * 依赖导致出现安全问题的可能性增加：第一个安全问题并不是在 ERC-777 中 [确认（并解决的）][16]，而是在最新的 ERC-820 中

### （纯主观的）结论（轻喷）

目前为止，如果你想遵循 “行业标准”，你只能选择 ERC-20。它获得了最广泛的理解与支持。但是，它还是有缺陷的，最大的一个缺陷是因为非专业用户设计和规范问题导致的用户真实地损失金钱的问题。ERC-223 是非常好的，并且在理论上找到了 ERC-20 中这个问题的答案了，它应该被考虑为 ERC-20 的一个很好的替代标准。在一个新通证中实现这两个接口并不复杂，并且可以降低燃料的使用。

ERC-677 是事件和金钱丢失问题的一个务实的解决方案，但是它并没能提供足够多的新方法，以促使它成为一个标准。但是它可能是 ERC-20 2.0 的一个很好的候选者。

ERC-777 是一个更先进的通证标准，它应该成为 ERC-20 的合法继任者，它提供了以太坊平台所需要的非常好的成熟概念，像白名单操作者，并允许以优雅的方式进行扩展。由于它的复杂性和对其它新标准的依赖，在主链上出现第一个 ERC-777 标准的通证还需要些时日。

### 链接

1. 在 ERC-20 中使用 approve/transferFrom 模式的安全问题： <https://drive.google.com/file/d/0ByMtMw2hul0EN3NCaVFHSFdxRzA/view>
2. ERC-20 中的无事件操作：<https://docs.google.com/document/d/1Feh5sP6oQL1-1NHi-X1dbgT3ch2WdhbXRevDN681Jv4>
3. ERC-20 的故障及历史：<https://github.com/ethereum/EIPs/issues/223#issuecomment-317979258>
4. ERC-20/223 的不同之处：<https://ethereum.stackexchange.com/questions/17054/erc20-vs-erc223-list-of-differences>

--------------------------------------------------------------------------------

via: http://blockchainers.org/index.php/2018/02/08/token-erc-comparison-for-fungible-tokens/

作者：[Alexander Culum][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://blockchainers.org/index.php/author/alex/
[1]:https://www.goodreads.com/quotes/589703-the-good-thing-about-standards-is-that-there-are-so
[2]:https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
[3]:https://github.com/ethereum/EIPs/blob/master/EIPS/eip-150.md
[4]:https://medium.com/@jgm.orinoco/understanding-erc-20-token-contracts-a809a7310aa5
[5]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-20-Token-Transfer-2.png
[6]:http://matthewtmead.com/blog/hollywood-principle-dont-call-us-well-call-you-4/
[7]:https://consensys.github.io/smart-contract-best-practices/known_attacks/
[8]:https://github.com/Dexaran
[9]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-223-Token-Transfer-1.png
[10]:https://github.com/ethereum/EIPs/issues/677
[11]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-677-Token-Transfer.png
[12]:https://github.com/ethereum/EIPs/issues/677#issuecomment-353871138
[13]:https://github.com/ethereum/EIPs/issues/777
[14]:https://github.com/ethereum/EIPs/issues/820
[15]:http://blockchainers.org/wp-content/uploads/2018/02/ERC-777-Token-Transfer.png
[16]:https://github.com/ethereum/EIPs/issues/820#issuecomment-362049573
