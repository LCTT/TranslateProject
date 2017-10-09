函数式编程简介
============================================================

> 我们来解释函数式编程的什么，它的优点是哪些，并且给出一些函数式编程的学习资源。

![Introduction to functional programming ](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb_computer_person_general_.png?itok=BRGJXU7e " 函数式编程简介 ") 

这要看您问的是谁， <ruby>函数式编程<rt>functional programming</rt></ruby>（FP）要么是一种理念先进的、应该广泛传播的程序设计方法；要么是一种偏学术性的、实际用途不多的编程方式。在这篇文章中我将讲解函数式编程，探究其优点，并推荐学习函数式编程的资源。

### 语法入门

本文的代码示例使用的是 [Haskell][40] 编程语言。在这篇文章中你只需要了解的基本函数语法：

```
even :: Int -> Bool
even = ...    -- 具体的实现放在这里
```

上述示例定义了含有一个参数的函数 `even` ，第一行是 _类型声明_，具体来说就是 `even` 函数接受一个 Int 类型的参数，返回一个 Bool 类型的值，其实现跟在后面，由一个或多个等式组成。在这里我们将忽略具体实现方法（名称和类型已经足够了）：

```
map :: (a -> b) -> [a] -> [b]
map = ...
```

这个示例，`map` 是一个有两个参数的函数：

1.  `(a -> b)` ：将 `a` 转换成 `b` 的函数
2.  `[a]`：一个 `a` 的列表，并返回一个 `b` 的列表。（LCTT 译注： 将函数作用到 `[a]` （List 序列对应于其它语言的数组）的每一个元素上，将每次所得结果放到另一个 `[b]` ，最后返回这个结果 `[b]`。）

同样我们不去关心要如何实现，我们只感兴趣它的定义类型。`a` 和 `b` 是任何一种的的 <ruby>类型变量<rt>type variable</rt></ruby> 。就像上一个示例中， `a` 是 `Int` 类型， `b` 是 `Bool` 类型:

```
map even [1,2,3]
```

这个是一个 Bool 类型的序列：

```
[False,True,False]
```

如果你看到你不理解的其他语法，不要惊慌；对语法的充分理解不是必要的。

### 函数式编程的误区

我们先来解释一下常见的误区：

*   函数式编程不是命令行编程或者面向对象编程的竞争对手或对立面，这并不是非此即彼的。
*   函数式编程不仅仅用在学术领域。这是真的，在函数式编程的历史中，如像 Haskell 和 OCaml 语言是最流行的研究语言。但是今天许多公司使用函数式编程来用于大型的系统、小型专业程序，以及种种不同场合。甚至还有一个[面向函数式编程的商业用户[33]的年度会议；以前的那些程序让我们了解了函数式编程在工业中的用途，以及谁在使用它。
*   函数式编程与 [monad][34] 无关  ，也不是任何其他特殊的抽象。在这篇文章里面 monad 只是一个抽象的规定。有些是 monad，有些不是。
*   函数式编程不是特别难学的。某些语言可能与您已经知道的语法或求值语义不同，但这些差异是浅显的。函数式编程中有大量的概念，但其他语言也是如此。

### 什么是函数式编程?

核心是函数式编程是只使用_纯粹_的数学函数编程，函数的结果仅取决于参数，而没有副作用，就像 I/O 或者状态转换这样。程序是通过 <ruby>组合函数<rt>function composition</rt></ruby> 的方法构建的：

```
(.) :: (b -> c) -> (a -> b) -> (a -> c)
(g . f) x = g (f x)
```

这个<ruby>中缀<rt>infix</rt></ruby>函数 `(.)` 表示的是二个函数组合成一个，将 `g` 作用到 `f` 上。我们将在下一个示例中看到它的使用。作为比较，我们看看在 Python 中同样的函数：

```
def compose(g, f):
  return lambda x: g(f(x))
```

函数式编程的优点在于：由于函数是确定的、没有副作用的，所以可以用结果替换函数，这种替代等价于使用使 <ruby>等式推理<rt>equational reasoning</rt></ruby> 。每个程序员都有使用自己代码和别人代码的理由，而等式推理就是解决这样问题不错的工具。来看一个示例。等你遇到这个问题：

```
map even . map (+1)
```

这段代码是做什么的？可以简化吗？通过等式推理，可以通过一系列替换来分析代码：

```
map even . map (+1)
map (even . (+1))         -- 来自 'map' 的定义
map (\x -> even (x + 1))  -- lambda 抽象
map odd                   -- 来自 'even' 的定义
```

我们可以使用等式推理来理解程序并优化可读性。Haskell 编译器使用等式推理进行多种程序优化。没有纯函数，等式推理是不可能的，或者需要程序员付出更多的努力。

### 函数式编程语言

你需要一种编程语言来做函数式编程吗？

在没有<ruby>高阶函数<rt>higher-order function</rt></ruby>（传递函数作为参数和返回函数的能力）、lambdas （匿名函数）和<ruby>泛型<rt>generics</rt></ruby>的语言中进行有意义的函数式编程是困难的。 大多数现代语言都有这些，但在不同语言中支持函数式编程方面存在差异。 具有最佳支持的语言称为<ruby>函数式编程语言<rt>functional programming language</rt></ruby>。 这些包括静态类型的 _Haskell_、_OCaml_、_F#_ 和 _Scala_ ，以及动态类型的 _Erlang_ 和 _Clojure_。

即使是在函数式语言里，可以在多大程度上利用函数编程有很大差异。有一个<ruby>类型系统<rt>type system</rt></ruby>会有很大的帮助，特别是它支持 <ruby>类型推断<rt>type inference</rt></ruby> 的话（这样你就不用总是必须键入类型）。这篇文章中没有详细介绍这部分，但足以说明，并非所有的类型系统都是平等的。

与所有语言一样，不同的函数的语言强调不同的概念、技术或用例。选择语言时，考虑它支持函数式编程的程度以及是否适合您的用例很重要。如果您使用某些非 FP 语言，你仍然会受益于在该语言支持的范围内的函数式编程。

### 不要打开陷阱之门

回想一下，函数的结果只取决于它的输入。但是，几乎所有的编程语言都有破坏这一原则的“功能”。空值、<ruby>实例类型<rt>type case</rt></ruby>（`instanceof`）、类型转换、异常、<ruby>边际效用<rt>side-effect</rt></ruby>，以及无尽循环的可能性都是陷阱，它打破等式推理，并削弱程序员对程序行为正确性的理解能力。（所有语言里面，没有任何陷阱的语言包括 Agda、Idris 和 Coq。）

幸运的是，作为程序员，我们可以选择避免这些陷阱，如果我们受到严格的规范，我们可以假装陷阱不存在。 这个方法叫做<ruby>轻率推理<rt>fast and loose reasoning</rt></ruby> 。它不需要任何条件，几乎任何程序都可以在不使用陷阱的情况下进行编写，并且通过避免这些可以而获得等式推理、可组合性和可重用性。

让我们详细讨论一下。 这个陷阱破坏了等式推理，因为异常终止的可能性没有反映在类型中。（你可以庆幸文档中甚至没有提到能抛出的异常）。但是没有理由我们没有一个可以包含所有故障模式的返回类型。

避开陷阱是语言特征中出现很大差异的领域。为避免例外， <ruby>代数数据类型<rt>algebraic data type</rt></ruby>可用于模型错误的条件下，就像：

```
-- new data type for results of computations that can fail
--
data Result e a = Error e | Success a

-- new data type for three kinds of arithmetic errors
--
data ArithError = DivByZero | Overflow | Underflow

-- integer division, accounting for divide-by-zero
--
safeDiv :: Int -> Int -> Result ArithError Int
safeDiv x y =
  if y == 0
    then Error DivByZero
    else Success (div x y)
```

在这个例子中的权衡你现在必须使用 Result ArithError Int 类型，而不是以前的 Int 类型，但这也是解决这个问题的一种方式。你不再需要处理异常，而能够使用轻率推理 ，总体来说这是一个胜利。

### 自由定理

大多数现代静态类型语言具有<ruby>范型<rt>generics</rt></ruby>（也称为<ruby>参数多态性<rt>parametric polymorphism</rt></ruby> ），其中函数是通过一个或多个抽象类型定义的。 例如，看看这个 List（序列）函数:

```
f :: [a] -> [a]
f = ...
```

Java 中的相同函数如下所示：

```
static <A> List<A> f(List<A> xs) { ... }
```

该编译的程序证明了这个函数适用于类型 `a` 的*任意*选择。考虑到这一点，采用轻率推理的方法，你能够弄清楚该函数的作用吗？知道类型有什么帮助？

在这种情况下，该类型并不能告诉我们函数的功能（它可以逆转序列、删除第一个元素，或许多其它的操作），但它确实告诉了我们很多信息。只是从该类型，我们可以推演出该函数的定理：

*   定理 1 ：输出中的每个元素也出现于输入中；不可能在输入的序列 `a` 中添加值，因为你不知道 `a` 是什么，也不知道怎么构造一个。
*   定理 2 ：如果你映射某个函数到列表上，然后对其应用 `f`，其等同于对映射应用 `f`。

定理 1 帮助我们了解代码的作用，定理 2 对于程序优化提供了帮助。我们从类型中学到了这一切！其结果，即从类型中获取有用的定理的能力，称之为<ruby>参数化<rt>parametricity</rt></ruby>。因此，类型是函数行为的部分（有时是完整的）规范，也是一种机器检查机制。

现在你可以利用参数化了。你可以从 `map`  和 `(.)`  的类型或者下面的这些函数中发现什么呢？

*   `foo :: a -> (a, a)`
*   `bar :: a -> a -> a`
*   `baz :: b -> a -> a`

### 学习功能编程的资源

也许你已经相信函数式编程是编写软件不错的方式，你想知道如何开始？有几种学习功能编程的方法；这里有一些我推荐（我承认，我对 Haskell 偏爱）：

*   UPenn 的 [CIS 194: 介绍 Haskell][35] 是函数式编程概念和 Haskell 实际开发的不错选择。有课程材料，但是没有讲座（您可以用几年前 Brisbane 函数式编程小组的 [CIS 194 系列讲座][36]。
*   不错的入门书籍有 《[Scala 的函数式编程][30]》 、 《[Haskell 函数式编程思想][31]》 , 和  《[Haskell 编程原理][32]》。
*   [Data61 FP 课程][37] （即 _NICTA_ 课程）通过<ruby>类型驱动开发<rt>type-driven development</rt></ruby>来教授基础的抽象概念和数据结构。这是十分困难，但收获也是丰富的，其起源于培训会，如果你有一名愿意引导你函数式编程的程序员，你可以尝试。
*   在你的工作学习中使用函数式编程书写代码，写一些纯函数（避免不确定性和异常的出现），使用高阶函数和递归而不是循环，利用参数化来提高可读性和重用性。许多人从体验和实验各种语言的美妙之处，开始走上了函数式编程之旅。
*   加入到你的地区中的一些函数式编程小组或者学习小组中，或者创建一个，也可以是参加一些函数式编程的会议（新的会议总是不断的出现）。

### 总结

在本文中，我讨论了函数式编程是什么以及不是什么，并了解到了函数式编程的优势，包括等式推理和参数化。我们了解到在大多数编程语言中都有一些函数式编程功能，但是语言的选择会影响受益的程度，而 Haskell 是函数式编程中语言最受欢迎的语言。我也推荐了一些学习函数式编程的资源。

函数式编程是一个丰富的领域，还有许多更深入（更神秘）的主题正在等待探索。我没有提到那些具有实际意义的事情，比如：

*   lenses 和 prisms （是一流的设置和获取值的方式；非常适合使用嵌套数据）；
*   定理证明（当你可以证明你的代码正确时，为什么还要测试你的代码？）；
*   延迟评估（让您处理潜在的无数的数据结构）；
*   分类理论（函数式编程中许多美丽实用的抽象的起源）；

我希望你喜欢这个函数式编程的介绍，并且启发你走上这个有趣和实用的软件开发之路。

 _本文根据 [CC BY 4.0][38] 许可证发布。_

（题图: opensource.com）

--------------------------------------------------------------------------------

作者简介：

红帽软件工程师。对函数式编程，分类理论，数学感兴趣。Crazy about jalapeños.

----------------------

via: https://opensource.com/article/17/4/introduction-functional-programming

作者：[Fraser Tweedale][a]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/frasertweedale
[1]:https://opensource.com/tags/javascript?src=programming_resource_menu
[2]:https://opensource.com/tags/perl?src=programming_resource_menu
[3]:https://opensource.com/tags/python?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:https://developers.redhat.com/products/#developer_tools?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[6]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[7]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[8]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[9]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:div
[10]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[11]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Int
[12]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#t:Bool
[13]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[14]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[15]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[16]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[17]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[18]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[19]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[20]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[21]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[22]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[23]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[24]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[25]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[26]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[27]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:even
[28]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:map
[29]:http://haskell.org/ghc/docs/latest/html/libraries/base/Prelude.html#v:odd
[30]:https://www.manning.com/books/functional-programming-in-scala
[31]:http://www.cambridge.org/gb/academic/subjects/computer-science/programming-languages-and-applied-logic/thinking-functionally-haskell
[32]:http://haskellbook.com/
[33]:http://cufp.org/
[34]:https://www.haskell.org/tutorial/monads.html
[35]:https://www.cis.upenn.edu/~cis194/fall16/
[36]:https://github.com/bfpg/cis194-yorgey-lectures
[37]:https://github.com/data61/fp-course
[38]:https://creativecommons.org/licenses/by/4.0/
[39]:https://opensource.com/article/17/4/introduction-functional-programming?rate=_tO5hNzT4hRKNMJtWwQM-K3Jmxm10iPeqoy3bbS12MQ
[40]:https://wiki.haskell.org/Introduction
[41]:https://opensource.com/user/123116/feed
[42]:https://opensource.com/users/frasertweedale
