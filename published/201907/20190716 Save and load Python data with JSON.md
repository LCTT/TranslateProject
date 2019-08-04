[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11133-1.html)
[#]: subject: (Save and load Python data with JSON)
[#]: via: (https://opensource.com/article/19/7/save-and-load-data-python-json)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Python 处理 JSON 格式的数据
======

> 如果你不希望从头开始创造一种数据格式来存放数据，JSON 是一个很好的选择。如果你对 Python 有所了解，就更加事半功倍了。下面就来介绍一下如何使用 Python 处理 JSON 数据。

![Cloud and databsae incons][1]

[JSON][2] 的全称是 <ruby>JavaScript 对象表示法<rt>JavaScript Object Notation</rt></ruby>。这是一种以键值对的形式存储数据的格式，并且很容易解析，因而成为了一种被广泛使用的数据格式。另外，不要因为 JSON 名称而望文生义，JSON 并不仅仅在 JavaScript 中使用，它也可以在其它语言中使用。下文会介绍它是如何在 Python 中使用的。

首先我们给出一个 JSON 示例：

```
{
    "name":"tux",
    "health":"23",
    "level":"4"
}
```

上面是一个和编程语言无关的原生 JSON 数据。熟悉 Python 的人会看出来这个 JSON 数据跟 Python 中的<ruby>字典<rt>dictionary</rt></ruby>长得很像。而这两者之间确实非常相似，如果你对 Python 中的列表和字典数据结构有一定的理解，那么 JSON 理解起来也不难。

### 使用字典存放数据

如果你的应用需要存储一些结构复杂的数据，不妨考虑使用 JSON 格式。对比你可能曾经用过的自定义格式的文本配置文件，JSON 提供了更加结构化的可递归的存储格式。同时，Python 自带的 `json` 模块已经提供了可以将 JSON 数据导入/导出应用时所需的所有解析库。因此，你不需要针对 JSON 自行编写代码进行解析，而其他开发人员在与你的应用进行数据交互的时候也不需要去解析新的数据格式。正是这个原因，JSON 在数据交换时被广泛地采用了。

以下是一段在 Python 中使用嵌套字典的代码：

```
#!/usr/bin/env python3

import json

# instantiate an empty dict
team = {}

# add a team member
team['tux'] = {'health': 23, 'level': 4}
team['beastie'] = {'health': 13, 'level': 6}
team['konqi'] = {'health': 18, 'level': 7}
```

这段代码声明了一个名为 `team` 的字典，并初始化为一个空字典。

如果要给这个字典添加内容，首先需要创建一个键，例如上面示例中的 `tux`、`beastie`、`konqi`，然后为这些键一一提供对应的值。上面示例中的值由一个个包含游戏玩家信息的字典充当。

字典是一种可变的变量。字典中的数据可以随时添加、删除或更新。这样的特性使得字典成为了应用程序存储数据的极好选择。

### 使用 JSON 格式存储数据

如果存放在字典中的数据需要持久存储，这些数据就需要写到文件当中。这个时候就需要用到 Python 中的 `json` 模块了：

```
with open('mydata.json', 'w') as f:
    json.dump(team, f)
```

上面的代码首先创建了一个名为 `mydata.json` 的文件，然后以写模式打开了这个文件，这个被打开的文件以变量 `f` 表示（当然也可以用任何你喜欢的名称，例如 `file`、`output` 等）。而 `json` 模块中的 `dump()` 方法则是用于将一个字典输出到一个文件中。

从应用中导出数据就是这么简单，同时这些导出的数据是结构化的、可理解的。现在可以查看导出的数据：

```
$ cat mydata.json
{"tux": {"health": 23, "level": 4}, "beastie": {"health": 13, "level": 6}, "konqi": {"health": 18, "level": 7}}
```

### 从 JSON 文件中读取数据

如果已经将数据以 JSON 格式导出到文件中了，也有可能需要将这些数据读回到应用中去。这个时候，可以使用 Python `json` 模块中的 `load()` 方法：

```
#!/usr/bin/env python3

import json

f = open('mydata.json')
team = json.load(f)

print(team['tux'])
print(team['tux']['health'])
print(team['tux']['level'])

print(team['beastie'])
print(team['beastie']['health'])
print(team['beastie']['level'])

# when finished, close the file
f.close()
```

这个方法实现了和保存文件大致相反的操作。使用一个变量 `f` 来表示打开了的文件，然后使用 `json` 模块中的 `load()` 方法读取文件中的数据并存放到 `team` 变量中。

其中的 `print()` 展示了如何查看读取到的数据。在过于复杂的字典中迭代调用字典键的时候有可能会稍微转不过弯来，但只要熟悉整个数据的结构，就可以慢慢摸索出其中的逻辑。

当然，这里使用 `print()` 的方式太不灵活了。你可以将其改写成使用 `for` 循环的形式：

```
for i in team.values():
    print(i)
```

### 使用 JSON

如上所述，在 Python 中可以很轻松地处理 JSON 数据。因此只要你的数据符合 JSON 的模式，就可以选择使用 JSON。JSON 非常灵活易用，下次使用 Python 的时候不妨尝试一下。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/save-and-load-data-python-json

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_cloud_database.png?itok=lhhU42fg (Cloud and databsae incons)
[2]: https://json.org
