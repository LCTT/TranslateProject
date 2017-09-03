函数式编程简介
============================================================

> 我们来解释函数式编程的什么，它的优点是哪些，并且寻找一些函数式编程的学习资源。


 ![Introduction to functional programming ](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb_computer_person_general_.png?itok=BRGJXU7e" 函数式编程简介 ") 
图片来源于: 

opensource.com

根据您的问题来回答,  _函数式编程_  (FP) 是一种开放的程序设计方法，理应广泛传播或者流行于理论学术中，在现实中没有实际的作用。在这篇文章中我来讲解函数式编程，探究其优点，并推荐学习函数式编程的资源。

### 语法入门

本文的代码示例使用的是 [Haskell][40] 编程语言。因而你需要理解这篇文章的基本函数语法：

```
  even :: Int -> Bool
  even = ...    -- implementation goes here
```

示例定义了含有一个参数的函数 **even** ，第一行是 _类型声明_ 具体来说就是 **even** 函数接受一个 int 类型的参数返回一个 bool 类型的值，由一个或多个方法实现，在这里我们将忽略具体实现方法（名称和类型已经足够了）：

```
  map :: (a -> b) -> [a] -> [b]
  map = ...
```

这个示例, **map** 是一个有两个参数的函数:

1.  **(a -> b)** : 将**a** 转换成 **b** 的匿名函数
2.  **［a］**: 将匿名函数作用到 **［a］** （List 序列与其它语言的数组对应）的每一个元素上，将每次所得结果放到另一个 **［b］** ,最后返回这个结果 **［b］** 。

同样我们不去关心是要如何实现，我们只感兴趣它的定义类型。
**a** 和 **b** 是任何一种的的 _类型变量_ 。就像上一个示例中， **a** 是 **Int** 类型， **b** 是 **Bool** 类型:

```
  map even [1,2,3]
```

这个是一个bool类型的序列:

```
  [False,True,False]
```

如果你看到你不理解的其他语法，不要惊慌；对语法的充分理解不是必要的。

### 函数式编程的误区

编程与开发

*   [我们最新的 JavaScript 文章][1]
*   [最近 Perl 的帖子][2]
*   [新的 Python 内容][3]
*   [红帽开发者博客][4]
*   [红帽开发者工具][5]

我们先来解释一下常见的误区：

*   函数式编程不是像命令行编程或者面向对象编程一样对立，这些都是虚假的。
*   函数式编程不仅仅是学术领域在其他领域也有使用。这是真的，在函数式编程的历史中，如像Haskell和OCaml语言是最流行的研究。但是今天许多公司使用函数式编程来处理大型系统，小型专业程序，以及两者之间的一切。甚至还有一个面向函数式编程的商业用户的年度会议；过去的程序让我们了解了函数式编程在工业中的用途，以及由谁来使用它。
*   函数式编程与monads无关  ，也不是任何其他特殊的抽象。对于围绕这个monad只是一个抽象的规定，有些是有些也的不是。
*   函数式编程不是特别难学的。有些语言可能与您已经知道的语法不同，但这些差异是浅显的。函数式编程中有dense的概念，但其他方法也是如此。（这里的dense不懂什么意思，校对者注意一下）

### 什么是函数式编程?

核心是函数式编程是只使用_纯粹_的数学函数编程，函数的结果取决于参数，就像 I/O 或者状态转换这样。程序是通过 _组合函数_ 的方法构建的:

```
  (.) :: (b -> c) -> (a -> b) -> (a -> c)
  (g . f) x = g (f x)
```

这个_（.）_ 表示的是二个函数组合成一个，将 **g** 作用到 **f** 上。我们将在下一个示例中看到它的使用。这里使用 Python 中的函数:

```
  def compose(g, f):
    return lambda x: g(f(x))
```

函数式编程的优点在于：由于函数是确定的，所以可以用应用程序的结果替换函数，这种替代等价于使用使 _等式推理_ 。每个程序员都有使用自己代码和别人代码的理由，而等式推理就是解决这样问题不错的工具。来看一个示例。等你遇到这个问题:

```
  map even . map (+1)
```

这段代码是做什么的？可以简化吗？通过等式推理，可以通过一系列替换来分析代码:

```
  map even . map (+1)
  map (even . (+1))         -- from definition of 'map'
  map (\x -> even (x + 1))  -- lambda abstraction
  map odd                   -- from definition of 'even'
```

我们可以使用等式推理来理解程序并优化。Haskell编译器使用等式推理进行多种方案的优化。没有纯粹的函数，等式推理是不可能的，或者需要程序员更多的努力。

### 函数式编程语言

你需要一种编程语言来做函数式编程。

在没有高阶函数（传递函数作为参数和返回函数的能力）的语言中有意义地进行函数式编程， _lambdas_ （匿名函数）和泛型是困难的。 大多数现代语言都有这些，但在不同语言支持函数式编程方面存在差异。 具有最佳支持的语言称为函数式编程语言。 这些包括静态类型的 _Haskell_， _OCaml_ ， _F＃_ 和 _Scala_ ，动态类型的 _Erlang_ 和 _Clojure_。

在函数式语言之间可以在多大程度上利用函数编程有很大差异。有一个类型系统会有很大的帮助，特别是它支持 _类型推断_ （所以你并不总是必须键入类型）。这篇文章中没有详细介绍这部分，但足以说明，并非所有类型的系统都是平等的。

与所有语言一样，不同的函数的语言强调不同的概念，技术或用例。选择语言时，考虑到它支持函数式编程的程度以及是否适合您的用例很重要。如果您使用某些非 FP 语言，会受益于在语言支持的范围内的函数式编程。

### 不要打开表面没什么但却是陷阱的门

回想一下，函数的结果只取决于它的输入。几乎所有的编程语言都有这个。空值，类型case（instanceof），类型转换，异常以及无限递归的可能性都是陷阱，它打破等式推理，并削弱程序员对程序行为正确性的理解能力。（没有任何陷阱的语言包括Agda，Idris和Coq。）

幸运的是，作为程序员，我们可以选择避免这些陷阱，如果我们受到严格的规范，我们可以假装陷阱不存在。 这个方法叫做 _快速推理_ 。它不需要任何条件，几乎任何程序都可以在不使用陷阱的情况下进行编写，并且通过避免这些程序可以进行等式推理，可组合性和可重用性。

让我们详细讨论一下。 这个陷阱打破了等式推理，因为异常终止的可能性没有反映在类型中。（如果文档中提到可能抛出的异常，请自己计算一下）。但是没有理由我们无法包含所有故障模式的返回类型。

避开陷阱是语言特征中产生巨大影响的一个领域。为避免例外， 代数数据类型可用于模型误差的条件下，就像:

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

在这个例子中的权衡你现在必须使用ArithError 或者 Int 类型为结果,而不是旧的 Int 的值，但这也是解决这个问题的一种方式。你不再需要处理异常，使用 _快速推理_ ，总体来说这是一个胜利。

### 免费的定理

大多数现代静态类型语言具有 _范型_（也称为 _参数多态性_ ），其中函数是通过一个或多个抽象类型定义的。 例如，考虑List（序列）上的函数:

```
  f :: [a] -> [a]
  f = ...
```

Java中的相同函数如下所示:

```
  static <A> List<A> f(List<A> xs) { ... }
```

编译程序的过程是一个证明的过程是将 _a_ 类型做出选择的过程。考虑到这一点，采用快速推理的方法，你能够创造出怎样的函数。

在这种情况下，该类型并不能告诉我们函数的功能（它可以改变序列，删除第一个元素或许多其他的东西），但它确实告诉了我们很多信息。只是从类型，我们可以得出关于函数的定理：

*   **Theorem 1**: 输入决定输出；不可能在输入的序列 **a** 中添加值，因为你不知道它的数据结构。
*   **Theorem 2**: If you map any function over the list then apply **f**, the result is the same as applying **f** then mapping.

定理1帮助我们了解代码的作用，定理2对于程序优化提供了帮助。我们从类型中学到了这一切！从类型中获取有用的信息称为参数。因此，类型是函数行为的部分（有时是完整的）规范，也是一种检查机制。

现在你可以利用参数话了探寻了。你可以从 **map**  **(.)** 或者下面的这些函数中发现什么呢？

*   **foo :: a -> (a, a)**
*   **bar :: a -> a -> a**
*   **baz :: b -> a -> a**

### 学习功能编程的资源

也许你已经相信函数式编程是编写软件不错的方式，你想知道如何开始？有几种学习功能编程的方法; 这里有一些我推荐（我承认，我对 Haskell 偏爱：

*   UPenn's 的 [CIS 194: 介绍 Haskell][35] 是函数式编程概念和 Haskell 开发的不错选择。可以当课程材料使用，讲座（您可以查看几年前 Brisbane 函数式编程小组的 [系列 CIS 194 讲座][36]。
*   不错的入门书籍有 _[ Scala 的函数式编程][30]_ ,  _[ Haskell 对函数的思考][31]_ , 和  _[ Haskell 编程原理][32]_ .
*   [Data61 FP 课程][37] (f.k.a.,  _NICTA_  课程) 通过 _类型驱动_ 开发来教授抽象和数据结构的概念。这是十分困难，但收获也是丰富的，如果你有一名愿意引导你函数式编程的程序员，你可以尝试。
*   在你的工作学习中使用函数式编程书写代码，写一些纯粹的函数（避免不确定性和异常的出现），使用高阶函数而不是循环和递归，利用参数化来提高可读性和重用性。许多人从函数式编程开始，体验各种语言的美妙。
*   加入到你区域中的一些函数式编程小组或者学习小组中，也可以是参加一些函数式编程的会议（新的会议总是不断的出现）。

### 总结

在本文中，我讨论了什么是函数式编程，而不是函数式编程的优点，包括等式推理和参数化。我们了解到在大多数编程语言中执行一些函数编程，但是语言的选择会影响受益的程度，而 Haskell 是函数式编程中语言最受欢迎的语言。我也推荐学习函数式编程的资源。

函数式编程是一个丰富的领域，还有许多更深入（更神秘）的主题正在等待探索。我没有提到那些具有实际意义的事情，比如：

*   lenses and prisms (是一流的设置值的方式；非常适合使用嵌套数据);
*   定理证明 (当测试你代码的时候你可以你代码的正确性);
*   懒惰评估 (让您处理潜在无数的数据结构);
*   类型理论 (函数式编程中许多美丽实用的抽象的起源).

我希望你喜欢这个函数式编程的介绍，并且启发你使用这个有趣和实用的软件开发方法。

 _本文根据 [CC BY 4.0][38] 许可证发布。_

--------------------------------------------------------------------------------

作者简介：

红帽软件工程师。对函数式编程，分类理论，数学感兴趣。Crazy about jalapeños.

----------------------

via: https://opensource.com/article/17/4/introduction-functional-programming

作者：[Fraser Tweedale ][a]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[校对者ID](https://github.com/校对者ID)

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
