[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10566-1.html)
[#]: subject: (Will quantum computing break security?)
[#]: via: (https://opensource.com/article/19/1/will-quantum-computing-break-security)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

量子计算会打破现有的安全体系吗？
======

> 你会希望<ruby>[某黑客][6]<rt>J. Random Hacker</rt></ruby>假冒你的银行吗？

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

近年来，<ruby>量子计算机<rt>quantum computer</rt></ruby>已经出现在大众的视野当中。量子计算机被认为是第六类计算机，这六类计算机包括：

1. <ruby>人力<rt>Humans</rt></ruby>：在人造的计算工具出现之前，人类只能使用人力去进行计算。而承担计算工作的人，只能被称为“计算者”。
2. <ruby>模拟计算工具<rt>Mechanical analogue</rt></ruby>：由人类制造的一些模拟计算过程的小工具，例如<ruby>[安提凯希拉装置][1]<rt>Antikythera mechanism</rt></ruby>、<ruby>星盘<rt>astrolabe</rt></ruby>、<ruby>计算尺<rt>slide rule</rt></ruby>等等。
3. <ruby>机械工具<rt>Mechanical digital</rt></ruby>：在这一个类别中包括了运用到离散数学但未使用电子技术进行计算的工具，例如<ruby>算盘<rt>abacus</rt></ruby>、Charles Babbage 的<ruby>差分机<rt>Difference Engine</rt></ruby>等等。
4. <ruby>电子模拟计算工具<rt>Electronic analogue</rt></ruby>：这一个类别的计算机多数用于军事方面的用途，例如炸弹瞄准器、枪炮瞄准装置等等。
5. <ruby>电子计算机<rt>Electronic digital</rt></ruby>：我在这里会稍微冒险一点，我觉得 Colossus 是第一台电子计算机，[^1] ：这一类几乎包含现代所有的电子设备，从移动电话到超级计算机，都在这个类别当中。
6. <ruby>量子计算机<rt>Quantum computer</rt></ruby>：即将进入我们的生活，而且与之前的几类完全不同。

### 什么是量子计算？

<ruby>量子计算<rt>Quantum computing</rt></ruby>的概念来源于<ruby>量子力学<rt>quantum mechanics</rt></ruby>，使用的计算方式和我们平常使用的普通计算非常不同。如果想要深入理解，建议从参考[维基百科上的定义][2]开始。对我们来说，最重要的是理解这一点：量子计算机使用<ruby>量子位<rt>qubit</rt></ruby>进行计算。在这样的前提下，对于很多数学算法和运算操作，量子计算机的计算速度会比普通计算机要快得多。

这里的“快得多”是按数量级来说的“快得多”。在某些情况下，一个计算任务如果由普通计算机来执行，可能要耗费几年或者几十年才能完成，但如果由量子计算机来执行，就只需要几秒钟。这样的速度甚至令人感到可怕。因为量子计算机会非常擅长信息的加密解密计算，即使在没有密钥的情况下，也能快速完成繁重的计算任务。

这意味着，如果拥有足够强大的量子计算机，那么你的所有信息都会被一览无遗，任何被加密的数据都可以被正确解密出来，甚至伪造数字签名也会成为可能。这确实是一个严重的问题。谁也不想被某个黑客冒充成自己在用的银行，更不希望自己在区块链上的交易被篡改得面目全非。

### 好消息

尽管上面的提到的问题非常可怕，但也不需要太担心。

首先，如果要实现上面提到的能力，一台可以操作大量量子位的量子计算机是必不可少的，而这个硬件上的要求就是一个很高的门槛。[^4] 目前普遍认为，规模大得足以有效破解经典加密算法的量子计算机在最近几年还不可能出现。

其次，除了攻击现有的加密算法需要大量的量子位以外，还需要很多量子位来保证容错性。

还有，尽管确实有一些理论上的模型阐述了量子计算机如何对一些现有的算法作出攻击，但是要让这样的理论模型实际运作起来的难度会比我们[^5] 想象中大得多。事实上，有一些攻击手段也是未被完全确认是可行的，又或者这些攻击手段还需要继续耗费很多年的改进才能到达如斯恐怖的程度。

最后，还有很多专业人士正在研究能够防御量子计算的算法（这样的算法也被称为“<ruby>后量子算法<rt>post-quantum algorithms</rt></ruby>”）。如果这些防御算法经过测试以后投入使用，我们就可以使用这些算法进行加密，来对抗量子计算了。

总而言之，很多专家都认为，我们现有的加密方式在未来 5 年甚至未来 10 年内都是安全的，不需要过分担心。

### 也有坏消息

但我们也并不是高枕无忧了，以下两个问题就值得我们关注：

1. 人们在设计应用系统的时候仍然没有对量子计算作出太多的考量。如果设计的系统可能会使用 10 年以上，又或者数据加密和签名的时间跨度在 10 年以上，那么就必须考虑量子计算在未来会不会对系统造成不利的影响。   
2. 新出现的防御量子计算的算法可能会是专有的。也就是说，如果基于这些防御量子计算的算法来设计系统，那么在系统落地的时候，可能会需要为此付费。尽管我是支持开源的，尤其是[开源密码学][3]，但我最担心的就是无法开源这方面的内容。而且最糟糕的是，在建立新的协议标准时（不管是事实标准还是通过标准组织建立的标准），无论是故意的，还是无意忽略，或者是没有好的开源替代品，他们都很可能使用专有算法而排除使用开源算法。

### 我们要怎样做？

幸运的是，针对上述两个问题，我们还是有应对措施的。首先，在整个系统的设计阶段，就需要考虑到它是否会受到量子计算的影响，并作出相应的规划。当然了，不需要现在就立即采取行动，因为当前的技术水平也没法实现有效的方案，但至少也要[在加密方面保持敏捷性][4]，以便在任何需要的时候为你的协议和系统更换更有效的加密算法。[^7]

其次是参与开源运动。尽可能鼓励密码学方面的有识之士团结起来，支持开放标准，并投入对非专有的防御量子计算的算法研究当中去。这一点也算是当务之急，因为号召更多的人重视起来并加入研究，比研究本身更为重要。

本文首发于《[Alice, Eve, and Bob][5]》，并在作者同意下重新发表。

[^1]: 我认为把它称为第一台电子可编程计算机是公平的。我知道有早期的非可编程的，也有些人声称是 ENIAC，但我没有足够的空间或精力在这里争论这件事。
[^2]: No。
[^3]: See 2. Don't get me wrong, by the way—I grew up near Weston-super-Mare, and it's got things going for it, but it's not Mayfair.
[^4]: 如果量子物理学家说很难，那么在我看来，就很难。
[^5]: 而且我假设我们都不是量子物理学家或数学家。
[^6]: I'm definitely not.
[^7]: 而且不仅仅是出于量子计算的原因：我们现有的一些经典算法很可能会陷入其他非量子攻击，例如新的数学方法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/will-quantum-computing-break-security

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Antikythera_mechanism
[2]: https://en.wikipedia.org/wiki/Quantum_computing
[3]: https://opensource.com/article/17/10/many-eyes
[4]: https://aliceevebob.com/2017/04/04/disbelieving-the-many-eyes-hypothesis/
[5]: https://aliceevebob.com/2019/01/08/will-quantum-computing-break-security/
[6]: https://www.techopedia.com/definition/20225/j-random-hacker
