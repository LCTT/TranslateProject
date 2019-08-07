[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11198-1.html"
[#]: subject: "How To Parse And Pretty Print JSON With Linux Commandline Tools"
[#]: via: "https://www.ostechnix.com/how-to-parse-and-pretty-print-json-with-linux-commandline-tools/"
[#]: author: "EDITOR https://www.ostechnix.com/author/editor/"

如何用 Linux 命令行工具解析和格式化输出 JSON 
======

![](https://www.ostechnix.com/wp-content/uploads/2019/03/json-720x340.png)

JSON 是一种轻量级且与语言无关的数据存储格式，易于与大多数编程语言集成，也易于人类理解 —— 当然，如果格式正确的话。JSON 这个词代表 **J**ava **S**cript **O**bject **N**otation，虽然它以 JavaScript 开头，而且主要用于在服务器和浏览器之间交换数据，但现在正在用于许多领域，包括嵌入式系统。在这里，我们将使用 Linux 上的命令行工具解析并格式化打印 JSON。它对于在 shell 脚本中处理大型 JSON 数据或在 shell 脚本中处理 JSON 数据非常有用。

### 什么是格式化输出？

JSON 数据的结构更具人性化。但是在大多数情况下，JSON 数据会存储在一行中，甚至没有行结束字符。

显然，这对于手动阅读和编辑不太方便。

这是<ruby>格式化输出<rt>pretty print</rt></ruby>就很有用。这个该名称不言自明：重新格式化 JSON 文本，使人们读起来更清晰。这被称为 **JSON 格式化输出**。

### 用 Linux 命令行工具解析和格式化输出 JSON

可以使用命令行文本处理器解析 JSON 数据，例如 `awk`、`sed` 和 `gerp`。实际上 `JSON.awk` 是一个来做这个的 awk 脚本。但是，也有一些专用工具可用于同一目的。

1. `jq` 或 `jshon`，shell 下的 JSON 解析器，它们都非常有用。
2. Shell 脚本，如 `JSON.sh` 或 `jsonv.sh`，用于在 bash、zsh 或 dash shell 中解析JSON。
3. `JSON.awk`，JSON 解析器 awk 脚本。
4. 像 `json.tool` 这样的 Python 模块。
5. `undercore-cli`，基于 Node.js 和 javascript。

在本教程中，我只关注 `jq`，这是一个 shell 下的非常强大的 JSON 解析器，具有高级过滤和脚本编程功能。

### JSON 格式化输出

JSON 数据可能放在一行上使人难以解读，因此为了使其具有一定的可读性，JSON 格式化输出就可用于此目的的。

**示例：**来自 `jsonip.com` 的数据，使用 `curl` 或 `wget` 工具获得 JSON 格式的外部 IP 地址，如下所示。

```
$ wget -cq http://jsonip.com/ -O -
```

实际数据看起来类似这样：

```
{"ip":"111.222.333.444","about":"/about","Pro!":"http://getjsonip.com"}
```

现在使用 `jq` 格式化输出它：

```
$ wget -cq http://jsonip.com/ -O - | jq '.'
```

通过 `jq` 过滤了该结果之后，它应该看起来类似这样：

```
{
   "ip": "111.222.333.444",
   "about": "/about",
   "Pro!": "http://getjsonip.com"
}
```

同样也可以通过 Python `json.tool` 模块做到。示例如下：

```
$ cat anything.json | python -m json.tool
```

这种基于 Python 的解决方案对于大多数用户来说应该没问题，但是如果没有预安装或无法安装 Python 则不行，比如在嵌入式系统上。

然而，`json.tool` Python 模块具有明显的优势，它是跨平台的。因此，你可以在 Windows、Linux 或 Mac OS 上无缝使用它。

### 如何用 jq 解析 JSON

首先，你需要安装 `jq`，它已被大多数 GNU/Linux 发行版选中，并使用各自的软件包安装程序命令进行安装。

在 Arch Linux 上：

```
$ sudo pacman -S jq
```

在 Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt-get install jq
```

在 Fedora 上：

```
$ sudo dnf install jq
```

在 openSUSE 上：

```
$ sudo zypper install jq
```

对于其它操作系统或平台参见[官方的安装指导][1]。

#### jq 的基本过滤和标识符功能

`jq` 可以从 `STDIN` 或文件中读取 JSON 数据。你可以根据情况使用。

单个符号 `.` 是最基本的过滤器。这些过滤器也称为**对象标识符-索引**。`jq` 使用单个 `.` 过滤器基本上相当将输入的 JSON 文件格式化输出。

- **单引号**：不必始终使用单引号。但是如果你在一行中组合几个过滤器，那么你必须使用它们。
- **双引号**：你必须用两个双引号括起任何特殊字符，如 `@`、`＃`、`$`，例如 `jq .foo.”@bar”`。
- **原始数据打印**：不管出于任何原因，如果你只需要最终解析的数据（不包含在双引号内），请使用带有 `-r` 标志的 `jq` 命令，如下所示：`jq -r .foo.bar`。

#### 解析特定数据

要过滤出 JSON 的特定部分，你需要了解格式化输出的 JSON 文件的数据层次结构。

来自维基百科的 JSON 数据示例：

```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25,
  "address": {
    "streetAddress": "21 2nd Street",
    "city": "New York",
    "state": "NY",
    "postalCode": "10021"
},
  "phoneNumber": [
{
  "type": "home",
  "number": "212 555-1234"
},
{
  "type": "fax",
  "number": "646 555-4567"
}
],
  "gender": {
  "type": "male"
  }
}
```

我将在本教程中将此 JSON 数据用作示例，将其保存为 `sample.json`。

假设我想从 `sample.json` 文件中过滤出地址。所以命令应该是这样的：

```
$ jq .address sample.json
```

示例输出：

```
{
  "streetAddress": "21 2nd Street",
  "city": "New York",
  "state": "NY",
  "postalCode": "10021"
}
```

再次，我想要邮政编码，然后我要添加另一个**对象标识符-索引**，即另一个过滤器。

```
$ cat sample.json | jq .address.postalCode
```

另请注意，**过滤器区分大小写**，并且你必须使用完全相同的字符串来获取有意义的输出，否则就是 null。

#### 从 JSON 数组中解析元素

JSON 数组的元素包含在方括号内，这无疑是非常通用的。

要解析数组中的元素，你必须使用 `[]` 标识符以及其他对象标识符索引。

在此示例 JSON 数据中，电话号码存储在数组中，要从此数组中获取所有内容，你只需使用括号，像这个示例：

```
$ jq .phoneNumber[] sample.json
```

假设你只想要数组的第一个元素，然后使用从 `0` 开始的数组对象编号，对于第一个项目，使用 `[0]`，对于下一个项目，它应该每步增加 1。

```
$ jq .phoneNumber[0] sample.json
```

#### 脚本编程示例

假设我只想要家庭电话，而不是整个 JSON 数组数据。这就是用 `jq` 命令脚本编写的方便之处。

```
$ cat sample.json | jq -r '.phoneNumber[] | select(.type == "home") | .number'
```

首先，我将一个过滤器的结果传递给另一个，然后使用 `select` 属性选择特定类型的数据，再次将结果传递给另一个过滤器。

解释每种类型的 `jq` 过滤器和脚本编程超出了本教程的范围和目的。强烈建议你阅读 `jq` 手册，以便更好地理解下面的内容。

资源：

- https://stedolan.github.io/jq/manual/
- http://www.compciv.org/recipes/cli/jq-for-parsing-json/
- https://lzone.de/cheat-sheet/jq

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-parse-and-pretty-print-json-with-linux-commandline-tools/

作者：[ostechnix][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://stedolan.github.io/jq/download/
