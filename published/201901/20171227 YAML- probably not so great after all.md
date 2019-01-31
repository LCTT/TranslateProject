[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10423-1.html)
[#]: subject: (YAML: probably not so great after all)
[#]: via: (https://arp242.net/weblog/yaml_probably_not_so_great_after_all.html)
[#]: author: (Martin Tournoij https://arp242.net/)

YAML：可能并不是那么完美
======

我之前写过[为什么将 JSON 用于人类可编辑的配置文件是一个坏主意][1]，今天我们将讨论 YAML 格式的一些常见问题。

### 默认情况下不安全 

YAML 默认是不安全的。加载用户提供的（不可信的）YAML 字符串需要仔细考虑。

```
!!python/object/apply:os.system
args: ['ls /']
```

用 `print(yaml.load(open('a.yaml')))` 运行它，应该给你这样的东西：

```
bin   etc   lib    lost+found  opt   root  sbin  tmp  var sys
boot  dev   efi    home        lib64 mnt   proc  run  srv usr
0
```

许多其他语言（包括 Ruby 和 PHP [^1] ）默认情况下也不安全（LCTT 译注：这里应该说的是解析 yaml）。[在 GitHub 上搜索 yaml.load][2] 会得到惊人的 280 万个结果，而 [yaml.safe_load][3] 只能得到 26000 个结果。

提个醒，很多这样的 `yaml.load()` 都工作的很好，在配置文件中加载 `yaml.load()` 通常没问题，因为它通常（虽然并不总是！）来自“可靠源”，而且很多都来自静态的 YAML 测试文件。但是，人们还是不禁怀疑在这 280 万个结果中隐藏了多少漏洞。

这不是一个理论问题。在 2013 年，[正是由于这个问题，所有的 Ruby on Rails 应用程序都被发现易受][4]远程代码执行攻击。

有人可能会反驳说这不是 YAML 格式的错误，而是那些库实现错误的的问题，但似乎大多数库默认不是安全的（特别是动态语言），所以事实上这是 YAML 的一个问题。

有些人可能会反驳认为修复它就像用 `safe_load()` 替换 `load()` 一样容易，但是很多人都没有意识到这个问题，即使你知道它，它也是很容易忘记的事情之一。这是非常糟糕的 API 设计。

### 可能很难编辑，特别是对于大文件

YAML 文件可能很难编辑，随着文件变大，这个难度会快速增大。

一个很好的例子是 Ruby on Rails 的本地化翻译文件。例如：

```
en:
   formtastic:
	 labels:
	   title: "Title"  # Default global value
	   article:
		 body: "Article content"
	   post:
		 new:
		   title: "Choose a title..."
		   body: "Write something..."
		 edit:
		   title: "Edit title"
		   body: "Edit body"
```

看起来不错，对吧？但是如果这个文件有 100 行怎么办？或者 1,000 行？在文件中很难看到 “where”，因为它可能在屏幕外。你需要向上滚动，但是你需要跟踪缩进，即使遵循缩进指南也很难，特别是因为 2 个空格缩进是常态而且 [制表符缩进被禁止][5] [^2] 。

不小心缩进出错通常不算错误，它通常只是反序列化为你不想要的东西。这样只能祝你调试快乐！

我已经愉快地编写 Python 长达十多年，所以我已经习惯了显眼的空白，但有时候我仍在和 YAML 抗争。在 Python 中，虽然没有那种长达几页的函数，但数据或配置文件的长度没有这种自然限制，这就带来了缺点和损失了清晰度。

对于小文件，这不是问题，但它确实无法很好地扩展到较大的文件，特别是如果你以后想编辑它们的话。

### 这非常复杂

在浏览一个基本的例子时，YAML 看似“简单”和“显而易见”，但事实证明并非如此。[YAML 规范][6]有 23449 个单词，为了比较，[TOML][7] 有 3339 个单词，[Json][8] 有 1969 个单词，[XML][9] 有 20603 个单词。

我们中有谁读过全部规范吗？有谁读过并理解了全部？谁阅读过，理解进而**记住**所有这些？

例如，你知道[在 YAML 中编写多行字符串有 9 种方法][10]吗？并且它们具有细微的不同行为。

是的 :-/

如果你看一下[那篇文章的修订历史][11]，它就会变得更加有趣，因为文章的作者发现了越来越多的方法可以实现这一点，以及更多的细微之处。

它从预览开始告诉我们 YAML 规范，它表明（强调我的）：

> 本节简要介绍了 YAML 的表达能力。**预计初次阅读的人不可能理解所有的例子**。相反，这些选择用作该规范其余部分的动机。

#### 令人惊讶的行为

以下会解析成什么（[Colm O’Connor][12] 提供的例子）：

```
- Don Corleone: Do you have faith in my judgment?
- Clemenza: Yes
- Don Corleone: Do I have your loyalty?
```

结果为：

```
[
    {'Don Corleone': 'Do you have faith in my judgment?'},
    {'Clemenza': True},
    {'Don Corleone': 'Do I have your loyalty?'}
]
```

那么这个呢：

```
python: 3.5.3
postgres: 9.3
```

`3.5.3` 被识别为字符串，但 `9.3` 被识别为数字而不是字符串：

```
{'python': '3.5.3', 'postgres': 9.3}
```

这个呢：

```
Effenaar: Eindhoven
013: Tilburg
```

`013` 是<ruby>蒂尔堡<rt>Tilburg<rt></ruby>的一个流行音乐场地，但 YAML 会告诉你错误答案，因为它被解析为八进制数字：

```
{11: 'Tilburg', 'Effenaar': 'Eindhoven'}
```

所有这一切，以及更多，就是为什么许多经验丰富的 YAMLer 经常会将所有字符串用引号引起来的原因，即使它不是严格要求。许多人不使用引号，而且很容易忘记，特别是如果文件的其余部分（可能由其他人编写）不使用引号。

### 它不方便

因为它太复杂了，它所声称的可移植性被夸大了。例如，考虑以下这个从 YAML 规范中获取的示例：

```
? - Detroit Tigers
  - Chicago cubs
:
  - 2001-07-23

? [ New York Yankees,
	Atlanta Braves ]
: [ 2001-07-02, 2001-08-12,
	2001-08-14 ]
```

抛开大多数读者可能甚至不知道这是在做什么之外，请尝试使用 PyYAML 在 Python 中解析它：

```
yaml.constructor.ConstructorError: while constructing a mapping
  in "a.yaml", line 1, column 1
found unhashable key
  in "a.yaml", line 1, column 3
```

在 Ruby 中，它可以工作：

```
{
    ["Detroit Tigers", "Chicago cubs"] => [
        #<Date: 2001-07-23 ((2452114j,0s,0n),+0s,2299161j)>
    ],
    ["New York Yankees", "Atlanta Braves"] => [
        #<Date: 2001-07-02 ((2452093j,0s,0n),+0s,2299161j)>,
        #<Date: 2001-08-12 ((2452134j,0s,0n),+0s,2299161j)>,
        #<Date: 2001-08-14 ((2452136j,0s,0n),+0s,2299161j)>
    ]
}
```

这个原因是你不能在 Python 中使用列表作为一个字典的键：

```
>>> {['a']: 'zxc'}
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  TypeError: unhashable type: 'list'
```

而这种限制并不是 Python 特有的，PHP、JavaScript 和 Go 等常用语言都有此限制。

因此，在 YAML 文件中使用这种语法，你将无法在大多数语言中解析它。

这是另一个从 YAML 规范的示例部分中获取的：

```
# Ranking of 1998 home runs
---
- Mark McGwire
- Sammy Sosa
- Ken Griffey

# Team ranking
---
- Chicago Cubs
- St Louis Cardinals
```

Python 会输出：

```
yaml.composer.ComposerError: expected a single document in the stream
  in "a.yaml", line 3, column 1
but found another document
  in "a.yaml", line 8, column 1
```

然而 Ruby 输出：

```
["Mark McGwire", "Sammy Sosa", "Ken Griffey"]
```

原因是单个文件中有多个 YAML 文档（`---` 意味开始一个新文档）。在 Python 中，有一个 `load_all` 函数来解析所有文档，而 Ruby 的 `load()` 只是加载第一个文档，据我所知，它没有办法加载多个文档。

[在实现之间存在很多不兼容][13]。

### 目标实现了吗？

规范说明：

> YAML 的设计目标是降低优先级：
> 
> 1. YAML 很容易被人类阅读。
> 2. YAML 数据在编程语言之间是可移植的。
> 3. YAML 匹配敏捷语言的原生数据结构。
> 4. YAML 有一个一致的模型来支持通用工具。
> 5. YAML 支持一次性处理。
> 6. YAML 具有表现力和可扩展性。
> 7. YAML 易于实现和使用。

那么它做的如何呢？

> YAML 很容易被人类阅读。

只有坚持一小部分子集时才有效。完整的规则集很复杂 —— 远远超过 XML 或 JSON。

> YAML 数据在编程语言之间是可移植的。

事实并非如此，因为创建常见语言不支持的结构太容易了。

> YAML 匹配敏捷语言的原生数据结构。

参见上面。另外，为什么只支持敏捷（或动态）语言？其他语言呢？

> YAML 有一个一致的模型来支持通用工具。

我甚至不确定这意味着什么，我找不到任何详细说明。

> YAML 支持一次性处理。

这点我接受。

> YAML 具有表现力和可扩展性。

嗯，是的，但它太富有表现力（例如太复杂）。

> YAML 易于实现和使用。

```
$ cat `ls -1 ~/gocode/src/github.com/go-yaml/yaml/*.go | grep -v _test` | wc -l
9247

$ cat /usr/lib/python3.5/site-packages/yaml/*.py | wc -l
5713
```

### 结论

不要误解我的意思，并不是说 YAML 很糟糕 —— 它肯定不像[使用 JSON 那么多的问题][1] —— 但它也不是非常好。有一些一开始并不明显的缺点和惊喜，还有许多更好的替代品，如 [TOML][7] 和其他更专业的格式。

就个人而言，当我有选择时，我不太可能再次使用它。

如果你必须使用 YAML，那么我建议你使用 [StrictYAML][14]，它会删除一些（虽然不是全部）比较麻烦的部分。

### 反馈

你可以发送电子邮件至 [martin@arp242.net][15] 或[创建 GitHub issue][16] 以获取反馈、问题等。

[^1]: 在 PHP 中你需要修改一个 INI 设置来获得安全的行为，不能只是调用像 `yaml_safe()` 这样的东西。PHP 想尽办法让愚蠢的东西越发愚蠢。干得漂亮！
[^2]: 不要在这里做空格与制表符之争，如果这里可以用制表符的话，我可以（临时）增加制表符宽度来使它更易读——这是制表符的一种用途。

--------------------------------------------------------------------------------

via: https://arp242.net/weblog/yaml_probably_not_so_great_after_all.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: http://arp242.net/weblog/JSON_as_configuration_files-_please_dont.html
[2]: https://github.com/search?q=yaml.load&type=Code&utf8=%E2%9C%93
[3]: https://github.com/search?q=yaml.safe_load&type=Code&utf8=%E2%9C%93
[4]: https://www.sitepoint.com/anatomy-of-an-exploit-an-in-depth-look-at-the-rails-yaml-vulnerability/
[5]: http://www.yaml.org/faq.html
[6]: http://yaml.org/spec/1.2/spec.pdf
[7]: https://github.com/toml-lang/toml
[8]: http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf
[9]: https://www.w3.org/TR/REC-xml/
[10]: http://stackoverflow.com/a/21699210/660921
[11]: http://stackoverflow.com/posts/21699210/revisions
[12]: https://github.com/crdoconnor/strictyaml/blob/master/FAQ.rst#what-is-wrong-with-implicit-typing
[13]: https://github.com/cblp/yaml-sucks
[14]: https://github.com/crdoconnor/strictyaml
[15]: mailto:martin@arp242.net
[16]: https://github.com/Carpetsmoker/arp242.net/issues/new
