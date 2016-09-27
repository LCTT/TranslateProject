copyleft 是什么？
=============

如果你在开源项目中花费很多时间的话，你可能会看到使用的术语 “copyleft”。虽然这个术语使用比较普遍，但是很多人却不理解它。软件许可是一个至少不亚于文件编辑器和打包格式的激烈辩论的学科。专家的理解可能会充斥在好多书中，但是这篇文章可以作为你理解 copyleft 道路的起点。


## 什么是 copyright？

在我们可以理解 copyleft 之前，我们必须先介绍一下 copyright 的概念。copyleft 并不是一个脱离于 copyright 的独立的法律框架，copyleft 存在于 copyright 规则中。那么，什么是 copyright？

准确的定义随着地域的不同而不同，但是其本质就是：作品的作者对于作品的仿制【注：英文为 copying】（因此成为 “copyright”）、性能等有有限的垄断权。在美国，宪法明确地阐述了美国国会的任务就是制定版权法律来“促进科学和实用艺术的进步”。

不同于以往，版权会立马附加到作品上——而且不需要注册。默认的，所有的权力都是保留的。也就是说，没有经过作者的允许，没有人可以出版、执行或者修改作品。这种允许就是一种许可，可能还会附加一定的条件。

如果希望得到对于 copyright 更彻底的介绍，Coursera 上的[教育工作者和图书管理员的著作权](https://www.coursera.org/learn/copyright-for-education)是一个非常优秀的课程。

## 什么是 copyleft？

先不要着急，在我们讨论 copyleft 是什么之前，还有一步。首先，让我们解释一下开源意味着什么。所有的开源许可协议，通过[开源 Inititative ](https://opensource.org/osd)定义，除其他形式外，必须以源码的形式发放。获得源码的任何人都有权利查看并修改源码。

copyleft 许可和所谓的 “permissive” 许可不同的地方在于，其衍生的作品中，也需要相同的 copyleft 许可。我倾向于通过这种方式来讨论两者不同： permissive 许可向直接下游的开发者提供了最大的自由（包括闭源项目中使用开源代码的权力），而 copyleft 许可则向最终用户提供最大的自由。

GNU 项目为 copyleft 提供了这个[简单的定义](https://www.gnu.org/philosophy/free-sw.en.html)：规则就是当重新编辑程序时，你不可以添加限制来拒绝其他人对于[免费软件]的自由。这可以被认为典型的定义，自从不同版本的 GNU 通用许可证（GPL）依然是最广泛使用的 copyleft 许可。	

## 软件中的 Copyleft

GPL 家族是最出名的 copyleft 许可，但是它们并不是唯一的。[Mozilla 公共许可协议]和[Eclipse 公共许可协议]也很出名。很多[其他的 copyleft 许可](https://tldrlegal.com/licenses/tags/Copyleft) 则存在于很小的脚注那儿。

就像之前章节介绍的那样，一个 copyleft 许可意味着下游的项目不可以在软件的使用上添加额外的限制。这最好用一个例子来说明。如果我写了一个很酷的程序，并且使用 copyleft 许可来发布，你将有使用和修改它的自由。你可以发布你修改后的版本，但是你必须让你的用户有我给你同样的自由。如果我使用 “permissive” 许可，你将可以自由的合并到一个不提供源码的软件中。

对于我的很酷的程序，和你必须要做什么同样重要的是你必须不能做什么。你不必用和我完全一样的许可协议，只要它们相互兼容就行（一般的为了简单起见，下游的项目使用相同的许可）。你不必向我共享出你的修改，但是你这么做的话，通常被认为一个很好的形式，尤其是一些修改是为了bug的修复。

## 非软件中的 Copyleft

虽然，copyleft 起始于软件世界，但是它也存在之外的世界。“做你想做的，只要你保留其他人也有做同样的事的权力”的概念是应用于文字创作、视觉艺术等的知识共享署名许可的一个显著的特点（CC BY-SA 4.0 是贡献于 Opensource.com 默认的许可）。[GNU 自由文档许可证](https://www.gnu.org/licenses/fdl.html)是另一个非软件协议中 copyleft 的例子。在非软件中使用软件协议通常不被建议。


## 我是否需要选择一种 copyleft 许可？

文章可以（并且已经！）写一个项目应该使用哪一种许可。我的建议是首先缩小满足你项目的哲学和目标的许可列表。GitHub 的[choosealicense.com](http://choosealicense.com/) 是一种查找满足你的需求的许可协议的好方法。[tldrLegal](https://tldrlegal.com/)使用纯语言说明许多相同和不同的软件许可。而且研究了你的项目所在的生态系统。围绕一种特定语言和技术的项目经常使用相同或者相似的许可。如果你希望你的项目可以运行的更出色，你可能需要确保你选择的许可是兼容的。

关于更多 copyleft 的信息，请查看 [copyleft 指南](https://copyleft.org/)。

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Ben Cotton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
