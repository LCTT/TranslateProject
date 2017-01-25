什么是 Copyleft ？
=============

如果你在开源项目中花费了很多时间的话，你可能会看到使用的术语 “copyleft”（GNU 官方网站上的释义：[中文][1]，[英文][2]）。虽然这个术语使用比较普遍，但是很多人却不理解它。软件许可是一个至少不亚于文件编辑器和打包格式的激烈辩论的主题。专家们对 copyleft 的理解可能会充斥在好多书中，但是这篇文章可以作为你理解 copyleft 启蒙之路的起点。

### 什么是 copyright？

在我们可以理解 copyleft 之前，我们必须先介绍一下 copyright 的概念。copyleft 并不是一个脱离于 copyright 的法律框架，copyleft 存在于 copyright 规则中。那么，什么是 copyright？

它的准确定义随着司法权的不同而不同，但是其本质就是：作品的作者对于作品的复制（copying）（因此这个术语称之为 “copyright”：copy right）、表现等有一定的垄断性。在美国，其宪法明确地阐述了美国国会的任务就是制定版权法律来“促进科学和实用艺术的进步”。

不同于以往，版权会立刻附加到作品上——而且不需要注册。默认情况下，所有的权力都是保留的。也就是说，没有经过作者的允许，没有人可以重新出版、表现或者修改作品。这种“允许”就是一种许可，可能还会附加有一定的条件。

如果希望得到对于 copyright 更彻底的介绍，Coursera 上的[教育工作者和图书管理员的著作权](https://www.coursera.org/learn/copyright-for-education)是一个非常优秀的课程。

### 什么是 copyleft？

先不要着急，在我们讨论 copyleft 是什么之前，还有一步。首先，让我们解释一下开源（open source）意味着什么。所有的开源许可协议，按照[开源倡议的定义（Open Source Inititative's definition）](https://opensource.org/osd)（规定），除其他形式外，必须以源码的形式发放。获得开源软件的任何人都有权利查看并修改源码。

copyleft 许可和所谓的 “自由（permissive）” 许可不同的地方在于，其衍生的作品中，也需要相同的 copyleft 许可。我倾向于通过这种方式来区分两者不同： 自由（permissive）许可向直接下游的开发者提供了最大的自由（包括能够在闭源项目中使用开源代码的权力），而 copyleft 许可则向最终用户提供最大的自由。

GNU 项目为 copyleft 提供了这个简单的定义（[中文][3]，[英文][4]）：“规则就是当重新分发该程序时，你不可以添加限制来否认其他人对于[自由软件]的自由。（the rule that when redistributing the program, you cannot add restrictions to deny other people the central freedoms [of free software].）”这可以被认为权威的定义，因为 [GNU 通用许可证（GNU General Public License，GPL）](https://www.gnu.org/licenses/gpl.html)的各种版本的依然是最广泛使用的 copyleft 许可。	

### 软件中的 copyleft

GPL 家族是最出名的 copyleft 许可，但是它们并不是唯一的。[Mozilla 公共许可协议（Mozilla Public License，MPL）](https://www.mozilla.org/en-US/MPL/)和[Eclipse 公共许可协议（ Eclipse Public License，EPL）](https://www.eclipse.org/legal/epl-v10.html)也很出名。很多[其它的 copyleft 许可](https://tldrlegal.com/licenses/tags/Copyleft) 也有较少的采用。

就像之前章节介绍的那样，一个 copyleft 许可意味着下游的项目不可以在软件的使用上添加额外的限制。这最好用一个例子来说明。如果我写了一个名为 MyCoolProgram 的程序，并且使用 copyleft 许可来发布，你将有使用和修改它的自由。你可以发布你修改后的版本，但是你必须让你的用户拥有我给你的同样的自由。（但）如果我使用 “自由（permissive）” 许可，你将可以将它自由地合并到一个不提供源码的闭源软件中。

对于我的 MyCoolProgram 程序，和你必须能做什么同样重要的是你必须不能做什么。你不必用和我完全一样的许可协议，只要它们相互兼容就行（但一般的为了简单起见，下游的项目也使用相同的许可）。你不必向我贡献出你的修改，但是你这么做的话，通常被认为一个很好的形式，尤其是这些修改是 bug 修复的话。

### 非软件中的 copyleft

虽然，copyleft 的概念起始于软件世界，但是它也存在于之外的世界。“做你想做的，只要你保留其他人也有做同样的事的权力”的概念是应用于文字创作、视觉艺术等方面的知识共享署名许可（[中文][5]，[英文][6]）的一个显著的特点（CC BY-SA 4.0 是贡献于 Opensource.com 默认的许可，也是很多开源网站，包括 [Linux.cn][7] 在内所采用的内容许可协议）。[GNU 自由文档许可证](https://www.gnu.org/licenses/fdl.html)是另一个非软件协议中 copyleft 的例子。在非软件中使用软件协议通常不被建议。

### 我是否需要选择一种 copyleft 许可？

关于项目应该使用哪一种许可，可以用（已经有了）成篇累牍的文章在阐述。我的建议是首先将许可列表缩小，以满足你的哲学信条和项目目标。GitHub 的 [choosealicense.com](http://choosealicense.com/) 是一种查找满足你的需求的许可协议的好方法。[tl;drLegal](https://tldrlegal.com/)使用平实的语言来解释了许多常见和不常见的软件许可。而且也要考虑你的项目所在的生态系统，围绕一种特定语言和技术的项目经常使用相同或者相似的许可。如果你希望你的项目可以运行的更出色，你可能需要确保你选择的许可是兼容的。

关于更多 copyleft 的信息，请查看 [copyleft 指南](https://copyleft.org/)。

--------------------------------------------------------------------------------

via: https://opensource.com/resources/what-is-copyleft

作者：[Ben Cotton][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[1]: https://www.gnu.org/licenses/copyleft.zh-cn.html
[2]: https://www.gnu.org/licenses/copyleft.en.html
[3]: https://www.gnu.org/philosophy/free-sw.zh-cn.html
[4]: https://www.gnu.org/philosophy/free-sw.en.html
[5]: https://creativecommons.org/licenses/by-sa/4.0/deed.zh
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://linux.cn/