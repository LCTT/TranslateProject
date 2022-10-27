[#]: subject: (What is a config file?)
[#]: via: (https://opensource.com/article/21/6/what-config-files)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (unigeorge)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13832-1.html)

浅谈配置文件格式
======

> 流行的配置文件格式有若干种，每种都有其自身优势。从中找到最适合你的格式吧！

![](https://img.linux.net.cn/data/attachment/album/202109/29/134955py5ypl58dgplyx4x.jpg)

计算机上有数以千计的配置文件。你可能永远不会直接与其中的大部分文件打交道，但它们确实散落在你的 `/etc` 以及 `~/.config`、`~/.local`、`/usr` 文件夹中。还有一些可能在 `/var`，甚至 `/opt` 文件夹中。如果无意中打开过或更改过它们，你就可能会有疑问：为什么有些配置文件看起来是某一种格式，而另一些则是看起来完全不同的格式？ 

存储配置是一项很灵活的任务，因为只要开发人员知道他们的代码是如何将数据存入文件的，他们就可以轻松编写代码来根据需要提取数据。然而，科技行业非常青睐有详细文档的标准化事物，因此多年来出现了几种比较普遍的格式用来简化配置任务。

### 为什么我们需要配置文件

配置文件对于现代计算来说很重要。它们使你能够自定义与应用程序交互的方式，或自定义应用程序与系统内其他程序的交互方式。有了配置文件，每当你启动某个应用程序时，它都会有“记忆”，记录了你喜欢如何去使用该程序。

配置文件的结构可以很简单，而且通常确实也很简单。例如，如果你要编写一个应用程序，程序唯一需要知道的是其用户的偏好名字，那么它的唯一配置文件就可以只包含一个词：用户名。就像下面这样： 

```
Tux
```

但通常应用程序需要追踪的不仅仅是一条信息，因此配置文件通常会有一个键和一个值： 

```
NAME='Tux'
SPECIES='Penguin'
```

即使没有编程经验，你也可以想象出代码如何解析这些数据。这里有两个简单的例子，一个使用 [awk 命令][2]，另一个使用 [grep 命令][3]。两个例子都是只关注包含 `NAME` “键”的行，并返回出现在等号 (`=`) 之后的“值”： 

```
$ awk -F'=' '/NAME/ { print $2; }' myconfig.ini
'Tux'
$ grep NAME fake.txt | cut -d'=' -f2
'Tux'
```

同样的原则适用于任何编程语言和任何配置文件。只要你有统一的数据结构，就可以在需要的时候编写简单的代码来提取和解析它。 

### 选择格式

为了保证普遍有效性，配置文件最重要的一点是它们是一致的和可预测的。你绝对不会想做这样的事：以保存用户首选项的名义，将信息随意存储到文件中，然后花好几天时间逆向工程，来找到最终出现在文件中的随机信息。 

流行的配置文件格式有若干种，每种格式都有自己的优势。

#### INI

INI 文件采用了键值对的格式：

```
[example]
name=Tux
style=widgety,fidgety
enabled=1
```

这种简单的配置风格很直观，只要你别选择使用糟糕的键名（比如用 `unampref` 这样的神秘键名来代替 `name`）就好。这些键值对很容易解析和编辑。 

除了键和值之外，INI 格式还可以分 <ruby>节<rt>section</rt></ruby>。在下列示例代码中，`[example]` 和 `[demo]` 就是配置文件中的两个节： 

```
[example]
name=Tux
style=widgety,fidgety
enabled=1

[demo]
name=Beastie
fullscreen=1
```

这几个配置语句解析起来有点复杂，因为有两个 `name` 键。想象一下，一个粗心的程序员在这个配置文件中查询 `name`，结果总是返回 `Beastie`，因为这是文件中对 `name` 的最后一个定义值。在解析这样的文件时，开发人员必须加倍小心地在各节中搜索键，这可能会很棘手，具体取决于用来解析该文件的语言。然而，它仍然是一种很流行的格式，大多数语言都会有一个现成的库来帮助程序员解析 INI 文件。 

#### YAML

[YAML 文件][4] 是结构化列表，可以包含值或者键值对： 

```
---
Example:
  Name: 'Tux'
  Style:
   - 'widgety'
    - 'fidgety'
  Enabled: 1
```

YAML 格式很流行，部分原因是它看起来很整洁。数据要放置到相对其上层数据的特定位置，除此之外没有太多其他语法。然而，对于某些人来说的这种特色，在其他人眼中可能就是一个问题。许多开发人员不愿使用 YAML，正是因为它很看重本质上 _不存在_ 的东西。如果你在 YAML 中缩进错误，YAML 解析器可能会将你的文件视为无效文件，即使不视为无效，返回的数据也可能是错误的。 

大多数语言都有 YAML 解析器，并且有很好的开源 YAML linters（验证语法的应用程序）来帮你确保 YAML 文件的完整性。 

#### JSON

JSON 文件在技术上来说是 YAML 的子集，因此其数据结构是相同的，尽管其语法完全不同： 

```
{
  "Example": {
    "Name": [
      "Tux"
    ],
    "Style": [
      "widgety",
      "fidgety"
    ],
    "Enabled": 1
  }
}
```

JSON 在 JavaScript 程序员中很流行，这并不奇怪，因为 JSON 全称为<ruby>JavaScript 对象符号<rt>JavaScript Object Notation</rt></ruby>。由于与 Web 开发密切相关，JSON 是 Web API 的常见输出格式。大多数编程语言都有解析 JSON 的库。

#### XML

XML 使用标签作为键，将配置值围绕起来：

```
<example>
  <name>Tux</name>
  <style priority="user">widgety</style>
  <style priority="fallback">fidgety</style>
  <enabled>1</enabled>
</example>
```

XML 经常被 Java 程序员使用，Java 有一套丰富的 XML 解析器。虽然 XML 以非常严格而著称，但同时也非常灵活。与有一系列特定标签的 HTML 不同，XML 中可以随意发明自己的标签。只要始终坚持相同的构建规则，并有一个良好的库来解析它，你就可以准确而轻松地提取数据。

有一些很好的开源 linter 可以帮你验证 XML 文件，并且大多数编程语言都提供用于解析 XML 的库。 

#### 二进制格式

Linux 以纯文本配置为傲。这样做的优点是可以使用 [cat][5] 等基本工具查看配置数据，甚至可以使用你 [最喜欢的文本编辑器][6] 来编辑配置。

但是，某些应用程序使用二进制格式配置，就意味着数据以某种非自然语言的格式进行编码。这些文件通常需要一个特殊的应用程序（通常是它们要配置的应用程序）来解释它们的数据。你无法查看这些文件，至少无法以任何有意义的方式查看，并且无法在其宿主应用程序之外编辑它们。选用二进制格式的一些原因如下： 

  * **速度：** 程序员可以使用自定义符号在二进制配置文件中的某些点注册特定的信息位。提取数据时不涉及搜索，因为所有内容都已标注了索引。 
  * **大小：** 文本文件可能会变大，如果选择压缩文本文件，实际上是在将其转换为二进制格式。二进制文件可以通过编码技巧变得更小（文本文件也是如此，但在某些时候，你的优化会使数据变得晦涩，以至于文件也成了二进制文件）。 
  * **晦涩：** 一些程序员甚至不希望人们查看他们的配置文件，因此将它们编码为二进制数据。这通常只会让用户感到沮丧，并不是使用二进制格式的好理由。 

如果必须使用二进制格式进行配置，请使用已作为开放标准存在的格式，例如 [NetCDF][7]。

### 找到有效的配置格式

配置格式帮助开发人员存储应用程序所需的数据，并帮助用户存储他们希望应用程序如何操作的偏好项。对于应该使用什么格式的问题，可能没有错误的答案，只要你觉得所使用的语言能很好地支持就可以。在开发应用程序时，查看可用格式，用一些样例数据建模，查看和评估你的编程语言提供的库和实用程序，然后选择你觉得最合适的一种格式吧。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/what-config-files

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/20/9/awk-ebook
[3]: https://opensource.com/downloads/grep-cheat-sheet
[4]: https://www.redhat.com/sysadmin/yaml-beginners
[5]: https://opensource.com/article/19/2/getting-started-cat-command
[6]: https://opensource.com/article/21/2/open-source-text-editors
[7]: https://www.unidata.ucar.edu/software/netcdf/
