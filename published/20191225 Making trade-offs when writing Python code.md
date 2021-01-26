[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13053-1.html)
[#]: subject: (Making trade-offs when writing Python code)
[#]: via: (https://opensource.com/article/19/12/zen-python-trade-offs)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

编写 Python 代码时要有所取舍
======

> 本文是 Python 之禅特别系列的一部分，重点此篇着眼于第七、八、九条原则：可读性、特殊情况和实用性。

![](https://img.linux.net.cn/data/attachment/album/202101/26/105645c1looxqxns12loen.jpg)

软件开发是一门充满了取舍的学科。每一个选择，都有一个同样合理但相反的选择。将一个方法私有化？你在鼓励复制粘贴。将一个方法公开？你在过早地对一个接口做出承诺。

软件开发者每时每刻都在做艰难的选择。虽然 [Python 之禅][2] 中的所有原则都在一定程度上涵盖了权衡，但下面的原则对一些权衡进行了最艰难、最冷酷的审视。

### <ruby>可读性很重要<rt>Readability counts</rt></ruby>

从某种意义上说，这一中间原则确实是整个 Python 之禅的中心。这条原则与编写高效的程序无关。在大多数情况下，它甚至与编写健壮的程序也无关。它讲的是编写出*别人能读懂的程序*。

阅读代码，就其本质而言，发生在代码被添加到系统中之后。通常，它会发生在很久很久以后。忽略可读性是最简单的选择，因为它对现在没有伤害。无论添加新代码的原因是什么，它都会对现在造成影响，无论是一个令人痛苦的 bug 还是一个被强烈要求的功能。

如果面对巨大的压力，把可读性扔到一边，只管“解决问题”，而 Python 之禅提醒我们：可读性很重要。编写代码让它适合阅读，无论是对自己还是他人，都是一种慈悲。

### <ruby>特殊情况不足以违反规则<rt>Special cases aren't special enough to break the rules</rt></ruby>

总是有各种借口：这个 bug 特别麻烦，先简单处理一下吧；这个功能特别紧急，别管美观了；这种情况下所涉及的领域规则特别复杂，嵌套深点也没关系。

一旦我们对特例的借口妥协，大坝就会破裂，就丧失了原则；事情就会演变成一个疯狂麦克斯的荒诞症，每个程序员都会为自己试图找到最好的借口。

纪律需要承诺。只有当事情艰辛、有强烈的诱惑时，才是对一个软件开发人员的考验。总是有合理的借口来破坏规则，这就是为什么必须坚守规矩的原因。纪律就是向例外说不的艺术。没有任何解释可以改变这一点。

### <ruby>虽然，实用性胜过纯洁性<rt>Although, practicality beats purity</rt></ruby>

> “如果你只想着击打、弹跳、撞击、触碰敌人，你将无法真正打倒他。”
> —— 《宫本武藏：[水之卷][3]》

归根结底，软件开发是一门实用的学科。它的目标是解决真实的人所面临的实际问题。实用性比纯粹性更重要：首先，我们必须*解决问题*。如果我们只考虑可读性、简单性或美观性，我们将无法真正*解决问题*。

正如宫本武藏所说的，每一次代码修改的首要目标应该是*解决问题*。这个问题需要我们心心念念地去解决它。如果我们不以解决问题为目标，只想着 Python 之禅，我们就辜负了这些原则。这是 Python 之禅所固有的另一种矛盾。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-trade-offs

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxys)
校对：[wxy](https://github.com/wxys)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops_confusion_wall_questions.png?itok=zLS7K2JG (Brick wall between two people, a developer and an operations manager)
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://en.wikipedia.org/wiki/The_Book_of_Five_Rings#The_Book_of_Water
