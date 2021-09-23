[#]: subject: "Start using YAML now"
[#]: via: "https://opensource.com/article/21/9/intro-yaml"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

现在就开始使用 YAML
======
什么是 YAML，为什么我们现在应该开始使用它了？
![woman on laptop sitting at the window][1]

YAML（YAML Ain't Markup Language）是一种人类可读的数据序列化语言。它的语法很简单，而且是人类可读的。它不包含引号、打开和关闭标签或大括号。它不包含任何可能使人类难以解析嵌套规则的东西。你可以扫描你的 YAML 文档并立即知道发生了什么。

### YAML 特性

YAML 有一些超级特性，使其优于其他序列化格式：

  * 易于浏览。
  * 易于使用。
  * 可在编程语言之间移植。
  * 敏捷语言的原生数据结构。
  * 支持通用工具的一致的模型。
  * 支持一次性处理。
  * 表现力和可扩展性。



我将通过一些例子进一步向你展示 YAML 的强大。

你能弄清楚下面发生了什么吗？


```
\-------
# My grocery list
groceries:
  - Milk
  - Eggs
  - Bread
  - Butter
...
```

上面的例子包含了一个简单的要买的杂货清单，它是一个完全格式化的 YAML 文档。在 YAML 中，字符串不加引号，而列表需要简单的连字符和空格。一个 YAML 文档以 **\---** 开始，以 **...** 结束，但它们是可选的。YAML中的注释以 **#** 开始。

缩进是 YAML 的关键。缩进必须包含空格，而不是制表符。虽然所需的空格数量是灵活的，但保持一致是个好主意。

### 基本元素

#### 集合

YAML 有两种类型的集合。_列表_（用于序列）和_字典_（用于映射）。列表是键值对，每个值都在一个新的行中，以连字符和空格开始。字典是键值对，每个值都是一个映射，包含一个键、一个冒号和空格以及一个值。

例如：


```
# My List
groceries:
  - Milk
  - Eggs
  - Bread
  - Butter

# My dictionary
contact:
name: Ayush Sharma
email: [myemail@example.com][2]
```

列表和字典经常被结合起来，以提供更复杂的数据结构。列表可以包含字典，而字典可以包含列表。

#### 字符串

YAML 中的字符串不需要加引号。多行字符串可以用 **|** 或 **&gt;** 来定义。前者保留了换行符，而后者则没有。

例如：


```
my_string: |
  This is my string.
  It can contain many lines.
  Newlines are preserved.
my_string_2: &gt;
  This is my string.
  This can also contain many lines.
  Newlines aren't preserved and all lines are folded.
```

#### 锚点

YAML 可以通过节点锚点来获得可重复的数据块。**&amp;** 字符定义了一个数据块，以后可以用 * 来引用。例如：


```
billing_address: &amp;add1
house: B1
street: My Street

shipping_address: *add1
```

到此为止，你对 YAML 的了解足以让你开始工作。你可以使用在线 YAML 解析器来测试。如果你每天都与 YAML 打交道，那么[这个方便的备忘单][3]会对你有所帮助。

* * *

_这篇文章最初发表在[作者的个人博客][4]上，并经授权改编。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/intro-yaml

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: mailto:myemail@example.com
[3]: https://yaml.org/refcard.html
[4]: https://notes.ayushsharma.in/2021/08/introduction-to-yaml
