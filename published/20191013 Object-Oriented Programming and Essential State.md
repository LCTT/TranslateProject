[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11519-1.html)
[#]: subject: (Object-Oriented Programming and Essential State)
[#]: via: (https://theartofmachinery.com/2019/10/13/oop_and_essential_state.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

面向对象编程和根本状态
======

![](https://img.linux.net.cn/data/attachment/album/201910/30/232452kvdivhgb9b2yi0ug.jpg)

早在 2015 年，Brian Will 撰写了一篇有挑衅性的博客：[面向对象编程：一个灾难故事][1]。他随后发布了一个名为[面向对象编程很糟糕][2]的视频，该视频更加详细。我建议你花些时间观看视频，下面是我的一段总结：

> OOP 的柏拉图式理想是一堆相互解耦的对象，它们彼此之间发送无状态消息。没有人真的像这样制作软件，Brian 指出这甚至没有意义：对象需要知道向哪个对象发送消息，这意味着它们需要相互引用。该视频大部分讲述的是这样一个痛点：人们试图将对象耦合以实现控制流，同时假装它们是通过设计解耦的。

总的来说，他的想法与我自己的 OOP 经验产生了共鸣：对象没有问题，但是我一直不满意的是*面向*对象建模程序控制流，并且试图使代码“正确地”面向对象似乎总是在创建不必要的复杂性。

有一件事我认为他无法完全解释。他直截了当地说“封装没有作用”，但在脚注后面加上“在细粒度的代码级别”，并继续承认对象有时可以奏效，并且在库和文件级别封装是可以的。但是他没有确切解释为什么有时会奏效，有时却没有奏效，以及如何和在何处划清界限。有人可能会说这使他的 “OOP 不好”的说法有缺陷，但是我认为他的观点是正确的，并且可以在根本状态和偶发状态之间划清界限。

如果你以前从未听说过“<ruby>根本<rt>essential</rt></ruby>”和“<ruby>偶发<rt>accidental</rt></ruby>”这两个术语的使用，那么你应该阅读 Fred Brooks 的经典文章《[没有银弹][3]》。（顺便说一句，他写了许多很棒的有关构建软件系统的文章。）我以前曾写过[关于根本和偶发的复杂性的文章][4]，这里有一个简短的摘要：软件是复杂的。部分原因是因为我们希望软件能够解决混乱的现实世界问题，因此我们将其称为“根本复杂性”。“偶发复杂性”是所有其它的复杂性，因为我们正尝试使用硅和金属来解决与硅和金属无关的问题。例如，对于大多数程序而言，用于内存管理或在内存与磁盘之间传输数据或解析文本格式的代码都是“偶发的复杂性”。

假设你正在构建一个支持多个频道的聊天应用。消息可以随时到达任何频道。有些频道特别有趣，当有新消息传入时，用户希望得到通知。而其他频道静音：消息被存储，但用户不会受到打扰。你需要跟踪每个频道的用户首选设置。

一种实现方法是在频道和频道设置之间使用<ruby>映射<rt>map</rt></ruby>（也称为哈希表、字典或关联数组）。注意，映射是 Brian Will 所说的可以用作对象的抽象数据类型（ADT）。

如果我们有一个调试器并查看内存中的映射对象，我们将看到什么？我们当然会找到频道 ID 和频道设置数据（或至少指向它们的指针）。但是我们还会找到其它数据。如果该映射是使用红黑树实现的，我们将看到带有红/黑标签和指向其他节点的指针的树节点对象。与频道相关的数据是根本状态，而树节点是偶发状态。不过，请注意以下几点：该映射有效地封装了它的偶发状态 —— 你可以用 AVL 树实现的另一个映射替换该映射，并且你的聊天程序仍然可以使用。另一方面，映射没有封装根本状态（仅使用 `get()` 和 `set()` 方法访问数据并不是封装）。事实上，映射与根本状态是尽可能不可知的，你可以使用基本相同的映射数据结构来存储与频道或通知无关的其他映射。

这就是映射 ADT 如此成功的原因：它封装了偶发状态，并与根本状态解耦。如果你思考一下，Brian 用封装描述的问题就是尝试封装根本状态。其他描述的好处是封装偶发状态的好处。

要使整个软件系统都达到这一理想状况相当困难，但扩展开来，我认为它看起来像这样：

* 没有全局的可变状态
* 封装了偶发状态（在对象或模块或以其他任何形式）
* 无状态偶发复杂性封装在单独函数中，与数据解耦
* 使用诸如依赖注入之类的技巧使输入和输出变得明确
* 组件可由易于识别的位置完全拥有和控制

其中有些违反了我很久以来的直觉。例如，如果你有一个数据库查询函数，如果数据库连接处理隐藏在该函数内部，并且唯一的参数是查询参数，那么接口会看起来会更简单。但是，当你使用这样的函数构建软件系统时，协调数据库的使用实际上变得更加复杂。组件不仅以自己的方式做事，而且还试图将自己所做的事情隐藏为“实现细节”。数据库查询需要数据库连接这一事实从来都不是实现细节。如果无法隐藏某些内容，那么显露它是更合理的。

我对将面向对象编程和函数式编程放在对立的两极非常警惕，但我认为从函数式编程进入面向对象编程的另一极端是很有趣的：OOP 试图封装事物，包括无法封装的根本复杂性，而纯函数式编程往往会使事情变得明确，包括一些偶发复杂性。在大多数时候，这没什么问题，但有时候（比如[在纯函数式语言中构建自我指称的数据结构][5]）设计更多的是为了函数编程，而不是为了简便（这就是为什么 [Haskell 包含了一些“<ruby>逃生出口<rt>escape hatches</rt></ruby>”][6]）。我之前写过一篇[所谓“<ruby>弱纯性<rt>weak purity</rt></ruby>”的中间立场][7]。

Brian 发现封装对更大规模有效，原因有几个。一个是，由于大小的原因，较大的组件更可能包含偶发状态。另一个是“偶发”与你要解决的问题有关。从聊天程序用户的角度来看，“偶发的复杂性”是与消息、频道和用户等无关的任何事物。但是，当你将问题分解为子问题时，更多的事情就变得“根本”。例如，在解决“构建聊天应用”问题时，可以说频道名称和频道 ID 之间的映射是偶发的复杂性，而在解决“实现 `getChannelIdByName()` 函数”子问题时，这是根本复杂性。因此，封装对于子组件的作用比对父组件的作用要小。

顺便说一句，在视频的结尾，Brian Will 想知道是否有任何语言支持*无法*访问它们所作用的范围的匿名函数。[D][8] 语言可以。 D 中的匿名 Lambda 通常是闭包，但是如果你想要的话，也可以声明匿名无状态函数：

```
import std.stdio;

void main()
{
    int x = 41;

    // Value from immediately executed lambda
    auto v1 = () {
        return x + 1;
    }();
    writeln(v1);

    // Same thing
    auto v2 = delegate() {
        return x + 1;
    }();
    writeln(v2);

    // Plain functions aren't closures
    auto v3 = function() {
        // Can't access x
        // Can't access any mutable global state either if also marked pure
        return 42;
    }();
    writeln(v3);
}
```

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/10/13/oop_and_essential_state.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://medium.com/@brianwill/object-oriented-programming-a-personal-disaster-1b044c2383ab
[2]: https://www.youtube.com/watch?v=QM1iUe6IofM
[3]: http://www.cs.nott.ac.uk/~pszcah/G51ISS/Documents/NoSilverBullet.html
[4]: https://theartofmachinery.com/2017/06/25/compression_complexity_and_software.html
[5]: https://wiki.haskell.org/Tying_the_Knot
[6]: https://en.wikibooks.org/wiki/Haskell/Mutable_objects#The_ST_monad
[7]: https://theartofmachinery.com/2016/03/28/dirtying_pure_functions_can_be_useful.html
[8]: https://dlang.org
