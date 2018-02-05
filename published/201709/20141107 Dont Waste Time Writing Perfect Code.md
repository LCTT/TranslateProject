不要浪费时间写完美的代码
============================================================ 

系统可以持续运行 5 年、10 年甚至 20 年或者更多年。但是，特定的代码行的生命，即使是经过设计，通常要短得多：当你通过各种方式来迭代寻求解决方案时，它会有几个月、几天甚至几分钟的生命。

### 一些代码比其他代码重要

通过研究[代码如何随时间变化][4]，Michael Feathers 确定了[一个代码库的冥曲线][5]。每个系统都有代码，通常有很多是一次性写成，永远都不会改变。但是有少量的代码，包括最重要和最有用的代码，会一次又一次地改变、会有几次重构或者从头重写。

当你在一个系统、或者问题领域、体系结构方法中有更多经验时，会更容易了解并预测什么代码将一直改变，哪些代码将永远不会改变：什么代码重要，什么代码不重要。

### 我们应该尝试编写完美的代码么？

我们知道我们应该写[干净的代码][6]，代码应该一致、清晰也要尽可能简单。

有些人把这变成了极端，他们迫使自己写出[美丽][7]、优雅、接近[完美][8]的代码，[痴迷于重构][9]并且纠结每个细节。

但是，如果代码只写一次而从不改变，或者如果在另一个极端下，它一直在改变的话，就如同尝试去写完美的需求和尝试做完美的前期设计那样，写完美的代码难道不是既浪费又没有必要（也不可能实现）的么？

> “你不能写出完美的软件。是不是收到了伤害？并不。把它作为生活的公理接受它、拥抱它、庆祝它。因为完美的软件不存在。在计算机的短暂历史中从没有人写过完美的软件。你不可能成为第一个。除非你接受这个事实，否则你最终会浪费时间和精力追逐不可能的梦想。”

> Andrew Hunt，[务实的程序员: 从熟练工到大师][10]

一次性写的代码不需要美观优雅。但它必须是正确的、可以理解的 —— 因为绝不会改变的代码在系统的整个生命周期内可能仍然被阅读很多次。它不需要干净并紧凑 —— 只要干净就够了。代码中[复制和粘贴][11]和其他小的裁剪是允许的，至少在某种程度上是这样的。这些是永远不需要打磨的代码。即使周围的其他代码正在更改，这些也是不需要重构的代码（除非你需要更改它）。这是不值得花费额外时间的代码。

你一直在改变的代码怎么样了呢？纠结于代码风格以及提出最优雅的解决方案是浪费时间，因为这段代码可能会再次更改，甚至可能会在几天或几周内重写。因此，每当你进行更改时，都会[痴迷重构][12]代码，或者没有重构没有改变的代码，因为它可能会更好。代码总是可以更好。但这并不重要。

重要的是：代码是否做了应该做的 —— 是正确的、可用的和高效的吗？它可以[处理错误和不良数据][13]而不会崩溃 —— 或者至少可以[安全地失败][14]？调试容易吗？改变是否容易且安全？这些不是美的主观方面。这些是成功与失败实际措施之间的差异。

### 务实编码和重构

<ruby>精益开发<rt>Lean Development</rt></ruby>的核心思想是：不要浪费时间在不重要的事情上。这应该提醒我们该如何编写代码，以及我们如何重构它、审查它、测试它。

为了让工作完成，只[重构你需要的][15] —— [Martin Fowler][16] 称之为<ruby>机会主义重构<rt>opportunistic refactoring</rt></ruby>（理解、清理、[童子军规则][17] ）和<ruby>准备重构<rt>preparatory refactoring</rt></ruby>。足够使改变更加容易和安全，而不是更多。如果你不改变那些代码，那么它并不会如看起来的那么重要。

在代码审查中，只聚焦在[重要的事上][18]。代码是否正确？有防御机制吗？是否安全？你能理解么？改变是否安全？

忘记代码风格（除非代码风格变成无法理解）。让你的 IDE 处理代码格式化。不要争议代码是否应该是“更多的 OO”。只要它有意义，它是否适当地遵循这种或那种模式并不重要。无论你喜欢还是不喜欢都没关系。你是否有更好的方式做到这一点并不重要 —— 除非你在教新接触这个平台或者语言的人，而且需要在做代码审查时做一部分指导。

写测试很重要。测试涵盖主要流程和重要的意外情况。测试让你用最少的工作获得最多的信息和最大的信心。[大面积覆盖测试，或小型针对性测试][19] —— 都没关系，只要一直在做这个工作，在编写代码之前或之后编写测试并不重要。

### （不只是）代码无关

建筑和工程方面的隐喻对软件从未有效过。我们不是设计和建造几年或几代将保持基本不变的桥梁或摩天大楼。我们构建的是更加弹性和抽象、更加短暂的东西。代码写来是被修改的 —— 这就是为什么它被称为“软件”。

> “经过五年的使用和修改，成功的软件程序的源码通常完全认不出它原来的样子，而一个成功建筑五年后几乎没有变化。”

> Kevin Tate，[可持续软件开发][20]

我们需要将代码看作是我们工作的一个暂时的手工制品：

> 有时候面对更重要的事情时，我们会迷信代码。我们经常有一个错觉，让卖出的产品有价值的是代码，然而实际上可能是对该问题领域的了解、设计难题的进展甚至是客户反馈。

> Dan Grover，[Code and Creative Destruction][21]

迭代开发教会我们来体验和检验我们工作的结果 —— 我们是否解决了这个问题，如果没有，我们学到了什么，我们如何改进？软件构建从没有止境。即使设计和代码是正确的，它们也可能只是一段时间内正确，直到环境要求再次更改或替换为更好的东西。

我们需要编写好的代码：代码可以理解、正确、安全和可靠。我们需要重构和审查它，并写出好的有用的测试，同时知道这其中一些或者所有的代码，可能会很快被抛弃，或者它可能永远不会被再被查看，或者它可能根本不会用到。我们需要认识到，我们的一些工作必然会被浪费，并为此而进行优化。做需要做的，没有别的了。不要浪费时间尝试编写完美的代码。

--------------------------------------------------------------------------------

作者简介：

Jim Bird

我是一名经验丰富的软件开发经理、项目经理和 CTO，专注于软件开发和维护、软件质量和安全性方面的困难问题。在过去 15 年中，我一直在管理建立全球证券交易所和投资银行电子交易平台的团队。我特别感兴趣的是，小团队在构建真正的软件中如何有效率：在可靠性，性能和适应性极限限制下的高质量，安全系统。

------

via: https://dzone.com/articles/dont-waste-time-writing

作者：[Jim Bird][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://dzone.com/users/722527/jim.bird.html
[1]:https://dzone.com/users/722527/jim.bird.html
[2]:https://dzone.com/users/722527/jim.bird.html
[3]:https://dzone.com/articles/dont-waste-time-writing?utm_source=wanqu.co&utm_campaign=Wanqu%20Daily&utm_medium=website#
[4]:http://www.youtube.com/watch?v=0eAhzJ_KM-Q
[5]:http://swreflections.blogspot.ca/2012/10/bad-things-happen-to-good-code.html
[6]:http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882
[7]:http://www.makinggoodsoftware.com/2011/03/27/the-obsession-with-beautiful-code-the-refactor-syndrome/
[8]:http://stackoverflow.com/questions/1196405/how-to-keep-yourself-from-perfectionism-when-coding
[9]:http://programmers.stackexchange.com/questions/43506/is-it-bad-to-have-an-obsessive-refactoring-disorder
[10]:https://pragprog.com/the-pragmatic-programmer
[11]:http://swreflections.blogspot.com/2012/03/is-copy-and-paste-programming-really.html
[12]:http://programmers.stackexchange.com/questions/43506/is-it-bad-to-have-an-obsessive-refactoring-disorder
[13]:http://swreflections.blogspot.com/2012/03/defensive-programming-being-just-enough.html
[14]:https://buildsecurityin.us-cert.gov/articles/knowledge/principles/failing-securely
[15]:http://swreflections.blogspot.com/2012/04/what-refactoring-is-and-what-it-isnt.html
[16]:http://martinfowler.com/articles/workflowsOfRefactoring/
[17]:http://programmer.97things.oreilly.com/wiki/index.php/The_Boy_Scout_Rule
[18]:http://randomthoughtsonjavaprogramming.blogspot.com/2014/08/building-real-software-dont-waste-time.html
[19]:http://swreflections.blogspot.com/2012/08/whats-better-big-fat-tests-or-little.html
[20]:http://www.amazon.com/Sustainable-Software-Development-Agile-Perspective/dp/0321286081
[21]:http://dangrover.com/2013/07/16/code-and-creative-destruction/
[22]:https://dzone.com/devops-tutorials-tools-news
[23]:https://dzone.com/articles/dont-waste-time-writing?utm_source=wanqu.co&utm_campaign=Wanqu%20Daily&utm_medium=website#
[24]:https://dzone.com/go?i=228233&u=https%3A%2F%2Foffers.automic.com%2Fblueprint-to-continuous-delivery-with-automic-release-automation%3Futm_campaign%3DAMER%252520Online%252520Syndication%252520DZone%252520Platinum%252520Sponsorship%252520Ads%252520JULY-2017%26utm_source%3DDzone%252520Ads%26utm_medium%3DBlueprint%252520to%252520CD
