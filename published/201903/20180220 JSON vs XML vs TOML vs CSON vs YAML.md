[#]: collector: (lujun9972)
[#]: translator: (GraveAccent)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10664-1.html)
[#]: subject: (JSON vs XML vs TOML vs CSON vs YAML)
[#]: via: (https://www.zionandzion.com/json-vs-xml-vs-toml-vs-cson-vs-yaml/)
[#]: author: (Tim Anderson https://www.zionandzion.com)

JSON、XML、TOML、CSON、YAML 大比拼
======

### 一段超级严肃的关于样本序列化的集合、子集和超集的文字

我是一名开发者，我读代码，我写代码，我写会写代码的代码，我写会写出供其它代码读的代码的代码。这些都非常火星语，但是有其美妙之处。然而，最后一点，写会写出供其它代码读的代码的代码，可以很快变得比这段文字更费解。有很多方法可以做到这一点。一种不那么复杂而且开发者社区最爱的方式是数据序列化。对于那些不了解我刚刚抛给你的时髦词的人，数据序列化是从一个系统获取一些信息，将其转换为其它系统可以读取的格式，然后将其传递给其它系统的过程。

虽然[数据序列化格式][1]多到可以埋葬哈利法塔，但它们大多分为两类：

  * 易于人类读写，
  * 易于机器读写。

很难两全其美，因为人类喜欢让我们更具表现力的松散类型和灵活格式标准，而机器倾向于被确切告知一切事情而没有二义性和细节缺失，并且认为“严格规范”才是它们最爱的口味。

由于我是一名 web 开发者，而且我们是一个创建网站的机构，我们将坚持使用 web 系统可以理解或不需要太多努力就能理解的特殊格式，而且对人类可读性特别有用的格式：XML、JSON、TOML、CSON 以及 YAML。每个都有各自的优缺点和适当的用例场景。

### 事实最先

回到互联网的早期，[一些非常聪明的家伙][2]决定整合一种让每个系统都能理解的标准语言，并创造性地将其命名为<ruby>标准通用标记语言<rt>Standard Generalized Markup Language</rt></ruby>（简称 SGML）。SGML 非常灵活，发布者也很好地定义了它。它成为了 XML、SVG 和 HTML 等语言之父。所有这三个都符合 SGML 规范，可是它们都是规则更严格、灵活性更少的子集。

最终，人们开始看到非常小、简洁、易读且易于生成的数据的好处，这些数据可以在系统之间以编程的方式共享，而开销很小。大约在那个时候，JSON 诞生了并且能够满足所有的需求。而另一方面，其它语言也开始出现以处理更多的专业用例，如 CSON，TOML 和 YAML。

### XML：不行了

原本，XML 语言非常灵活且易于编写，但它的缺点是冗长，人类难以阅读、计算机非常难以读取，并且有很多语法对于传达信息并不是完全必要的。

今天，它在 web 上的数据序列化的用途已经消失了。除非你在编写 HTML 或者 SVG，否则你不太能在许多其它地方看到 XML。一些过时的系统今天仍在使用它，但是用它传递数据往往太重了。

我已经可以听到 XML 老爷爷开始在它们的石碑上乱写为什么 XML 是了不起的，所以我将提供一个小小的补充：XML 可以很容易地由系统和人读写。然而，真的，我的意思是荒谬的，很难创建一个可以规范的读取它的系统。这是一个简单美观的 XML 示例：

```
<book id="bk101">
<author>Gambardella, Matthew</author>
<title>XML Developer's Guide</title>
<genre>Computer</genre>
<price>44.95</price>
<publish_date>2000-10-01</publish_date>
<description>An in-depth look at creating applications
with XML.</description>
</book>
```

太棒了。易于阅读、理解、写入，也容易编码一个可以读写它的系统。但请考虑这个例子：

```
<!DOCTYPE r [ <!ENTITY y "a]>b"> ]>
<r>
<a b="&y;>" />
<![CDATA[[a>b <a>b <a]]>
<?x <a> <!-- <b> ?> c --> d
</r>
```

这上面是 100% 有效的 XML。几乎不可能阅读、理解或推理。编写可以使用和理解这个的代码将花费至少 36 根头发和 248 磅咖啡渣。我们没有那么多时间或咖啡，而且我们大多数老程序员们现在都是秃头。所以，让它活在我们的记忆里，就像 [css hacks][3]、[IE 6 浏览器][4] 和[真空管][5]一样好了。 

### JSON：并列聚会

好吧，我们都同意，XML = 差劲。那么，好的替代品是什么？<ruby>JavaScript 对象表示法<rt>JavaScript Object Notation</rt></ruby>，简称 JSON。JSON（读起来像 Jason 这个名字） 是 Brendan Eich 发明的，并且得到了伟大而强力的 [JavaScript 意见领袖][6] Douglas Crockford 的推广。它现在几乎用在任何地方。这种格式很容易由人和机器编写，按规范中的严格规则[解析][7]也相当容易，并且灵活 —— 允许深层嵌套数据，支持所有的原始数据类型，及将集合解释为数组或对象。JSON 成为了将数据从一个系统传输到另一个系统的事实标准。几乎所有语言都有内置读写它的功能。

JSON语法很简单。方括号表示数组，花括号表示记录，由冒号分隔的两个值分别表示属性或“键”（在左边）、值（在右边）。所有键必须用双引号括起来：

```
  {
    "books": [
      {
        "id": "bk102",
        "author": "Crockford, Douglas",
        "title": "JavaScript: The Good Parts",
        "genre": "Computer",
        "price": 29.99,
        "publish_date": "2008-05-01",
        "description": "Unearthing the Excellence in JavaScript"
      }
    ]
  }
```

这对你来说应该是完全有意义的。它简洁明了，并且从 XML 中删除了大量额外废话，并传达相同数量的信息。JSON 现在是王道，本文剩下的部分会介绍其它语言格式，这些格式只不过是 JSON 的简化版，尝试让其更简洁或对人类更易读，可结构还是非常相似的。

### TOML: 缩短到彻底的利他主义

TOML（<ruby>Tom 的显而易见的最小化语言<rt>Tom’s Obvious, Minimal Language</rt></ruby>）允许以相当快捷、简洁的方式定义深层嵌套的数据结构。名字中的 Tom 是指发明者 [Tom Preston Werner][8]，他是一位活跃于我们行业的创造者和软件开发人员。与 JSON 相比，语法有点尴尬，更类似 [ini 文件][9]。这不是一个糟糕的语法，但是需要一些时间适应。

```
[[books]]
id = 'bk101'
author = 'Crockford, Douglas'
title = 'JavaScript: The Good Parts'
genre = 'Computer'
price = 29.99
publish_date = 2008-05-01T00:00:00+00:00
description = 'Unearthing the Excellence in JavaScript'
```

TOML 中集成了一些很棒的功能，例如多行字符串、保留字符的自动转义、日期、时间、整数、浮点数、科学记数法和“表扩展”等数据类型。最后一点是特别的，是 TOML 如此简洁的原因：

```
[a.b.c]
d = 'Hello'
e = 'World'
```

以上扩展到以下内容：

```
{
  "a": { 
    "b": {
      "c": { 
        "d": "Hello"
        "e": "World"
      }
    }
  }
}
```

使用 TOML，你可以肯定在时间和文件长度上会节省不少。很少有系统使用它或非常类似的东西作为配置，这是它最大的缺点。根本没有很多语言或库可以用来解释 TOML。

### CSON: 特定系统所包含的简单样本

首先，有两个 CSON 规范。 一个代表 CoffeeScript Object Notation，另一个代表 Cursive Script Object Notation。后者不经常使用，所以我们不会关注它。我们只关注 CoffeeScript。

[CSON][10] 需要一点介绍。首先，我们来谈谈 CoffeeScript。[CoffeeScript][11] 是一种通过运行编译器生成 JavaScript 的语言。它允许你以更加简洁的语法编写 JavaScript 并[转译][12]成实际的 JavaScript，然后你可以在你的 web 应用程序中使用它。CoffeeScript 通过删除 JavaScript 中必需的许多额外语法，使编写 JavaScript 变得更容易。CoffeeScript 摆脱的一个大问题是花括号 —— 不需要它们。同样，CSON 是没有大括号的 JSON。它依赖于缩进来确定数据的层次结构。CSON 非常易于读写，并且通常比 JSON 需要更少的代码行，因为没有括号。

CSON 还提供一些 JSON 不提供的额外细节。多行字符串非常容易编写，你可以通过使用 `#` 符号开始一行来输入[注释][13]，并且不需要用逗号分隔键值对。

```
books: [
  id: 'bk102'
  author: 'Crockford, Douglas'
  title: 'JavaScript: The Good Parts'
  genre: 'Computer'
  price: 29.99
  publish_date: '2008-05-01'
  description: 'Unearthing the Excellence in JavaScript'
]
```

这是 CSON 的大问题。它是 <ruby>CoffeScript 对象表示法<rt>CoffeeScript Object Notation</rt></ruby>。也就是说你要用 CoffeeScript 解析/标记化/lex/转译或其它方式来使用 CSON。CoffeeScript 是读取数据的系统。如果数据序列化的目的是允许数据从一个系统传递到另一个系统，这里我们有一个只能由单个系统读取的数据序列化格式，这使得它与防火火柴、防水海绵或者叉匙恼人的脆弱叉子部分一样有用。

如果这种格式被其它系统也采用，那它在开发者世界中可能非常有用。但到目前为止这基本上没有发生，所以在 PHP 或 JAVA 等替代语言中使用它是不行的。

### YAML：年轻人的呼喊

开发人员感到高兴，因为 YAML 来自[一个 Python 的贡献者][14]。YAML 具有与 CSON 相同的功能集和类似的语法，有一系列新功能，以及几乎所有 web 编程语言都可用的解析器。它还有一些额外的功能，如循环引用、软包装、多行键、类型转换标签、二进制数据、对象合并和[集合映射][15]。它具有非常好的可读性和可写性，并且是 JSON 的超集，因此你可以在 YAML 中使用完全合格的 JSON 语法并且一切正常工作。你几乎不需要引号，它可以解释大多数基本数据类型（字符串、整数、浮点数、布尔值等）。

```
books:
  - id: bk102
  author: Crockford, Douglas
  title: 'JavaScript: The Good Parts'
  genre: Computer
  price: 29.99
  publish_date: !!str 2008-05-01
  description: Unearthing the Excellence in JavaScript
```

业界的年轻人正在迅速采用 YAML 作为他们首选的数据序列化和系统配置格式。他们这样做很机智。YAML 具有像 CSON 一样简洁的所有好处，以及与 JSON 一样的数据类型解释的所有功能。YAML 像加拿大人容易相处一样容易阅读。

YAML 有两个问题，对我而言，第一个是大问题。在撰写本文时，YAML 解析器尚未内置于多种语言，因此你需要使用第三方库或扩展来为你选择的语言解析 .yaml 文件。这不是什么大问题，可似乎大多数为 YAML 创建解析器的开发人员都选择随机将“附加功能”放入解析器中。有些允许[标记化][16]，有些允许[链引用][17]，有些甚至允许内联计算。这一切都很好（某种意义上），只是这些功能都不是规范的一部分，因此很难在其他语言的其他解析器中找到。这导致系统限定，你最终遇到了与 CSON 相同的问题。如果你使用仅在一个解析器中找到的功能，则其他解析器将无法解释输入。大多数这些功能都是无意义的，不属于数据集，而是属于你的应用程序逻辑，因此最好简单地忽略它们和编写符合规范的 YAML。

第二个问题是很少有解析器完全实现规范。所有的基本要素都有，但是很难找到一些更复杂和更新的东西，比如软包装、文档标记和首选语言的循环引用。我还没有看到对这些东西的刚需，所以希望它们不让你很失望。考虑到上述情况，我倾向于保持 [1.1 规范][18] 中呈现的更成熟的功能集，而避免在 [1.2 规范][19] 中找到的新东西。然而，编程是一个不断发展的怪兽，所以当你读完这篇文章时，你或许就可以使用 1.2 规范了。

### 最终哲学

这是最后一段话。每个序列化语言都应该以个案标准的方式评价。当涉及机器的可读性时，有些<ruby>无出其右<rt>the bee’s knees</rt></ruby>。对于人类可读性，有些<ruby>名至实归<rt>the cat’s meow</rt></ruby>，有些只是<ruby>金玉其外<rt>gilded turds</rt></ruby>。以下是最终细分：如果你要编写供其他代码阅读的代码，请使用 YAML。如果你正在编写能写出供其他代码读取的代码的代码，请使用 JSON。最后，如果你正在编写将代码转译为供其他代码读取的代码的代码，请重新考虑你的人生选择。

--------------------------------------------------------------------------------

via: https://www.zionandzion.com/json-vs-xml-vs-toml-vs-cson-vs-yaml/

作者：[Tim Anderson][a]
选题：[lujun9972][b]
译者：[GraveAccent](https://github.com/GraveAccent)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.zionandzion.com
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Comparison_of_data_serialization_formats
[2]: https://en.wikipedia.org/wiki/Standard_Generalized_Markup_Language#History
[3]: https://www.quirksmode.org/css/csshacks.html
[4]: http://www.ie6death.com/
[5]: https://en.wikipedia.org/wiki/Vacuum_tube
[6]: https://twitter.com/BrendanEich/status/773403975865470976
[7]: https://en.wikipedia.org/wiki/Parsing#Parser
[8]: https://en.wikipedia.org/wiki/Tom_Preston-Werner
[9]: https://en.wikipedia.org/wiki/INI_file
[10]: https://github.com/bevry/cson#what-is-cson
[11]: http://coffeescript.org/
[12]: https://en.wikipedia.org/wiki/Source-to-source_compiler
[13]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[14]: http://clarkevans.com/
[15]: http://exploringjs.com/es6/ch_maps-sets.html
[16]: https://www.tutorialspoint.com/compiler_design/compiler_design_lexical_analysis.htm
[17]: https://en.wikipedia.org/wiki/Fluent_interface
[18]: http://yaml.org/spec/1.1/current.html
[19]: http://www.yaml.org/spec/1.2/spec.html
