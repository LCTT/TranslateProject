[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13000-1.html)
[#]: subject: (Learn Lua by writing a "guess the number" game)
[#]: via: (https://opensource.com/article/20/12/lua-guess-number-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

通过编写“猜数字”游戏学习 Lua
======

> 通过编写一个简单的游戏来认识 Lua，它是一种动态类型的、轻量级的、高效的、可嵌入的脚本语言。

![](https://img.linux.net.cn/data/attachment/album/202101/10/125405hgrqrigagbucpbqg.jpg)

如果你是 Bash、Python 或 Ruby 等脚本语言的爱好者，你可能会发现 Lua 很有趣。Lua 是一种动态类型的、轻量级的、高效的、可嵌入的脚本语言，它有与 C 语言的 API 接口。它通过基于寄存器的虚拟机解释字节码来运行，它可以用于过程式编程、函数式编程和数据驱动编程等编程方式。它甚至可以通过巧妙地使用数组（即“<ruby>表<rt>table</rt></ruby>”）来模拟类，以用于面向对象的编程。

感受一门语言的好方法是通过编写一个你已经熟悉的简单应用。最近，一些作者已经演示了如何使用他们最喜欢的语言来创建一个“猜数字”游戏。[Lua][2] 是我最喜欢的语言之一，所以这是我的 Lua 版猜数字游戏。

### 安装 Lua

如果你是在 Linux 上，你可以从你的发行版仓库中安装 Lua。在 macOS 上，你可以从 [MacPorts][3] 或 [Homebrew][4] 安装 Lua。在 Windows 上，你可以从 [Chocolatey][5] 安装 Lua。

安装 Lua 后，打开你最喜欢的文本编辑器，可以准备编写了。

### Lua 代码

首先，你必须设置一个伪随机数生成器，这样你的玩家就有一些不可预知的东西来尝试猜测。这是一个两个步骤的过程：首先，你根据当前的时间生成一个随机种子，然后在 1 到 100 的范围内选择一个数字：

```
math.randomseed(os.time())
number = math.random(1,100)
```

接下来，创建一个 Lua 所谓的<ruby>表<rt>table</rt></ruby>来表示你的玩家。表就像一个 [Bash 中的数组][7]或 Java 中的 `ArrayList`。你可以创建一个表，然后分配与该表相关的子变量。在这段代码中，`player` 是表，而 `player.guess` 是表中的一个条目：

```
player = {}
player.guess = 0
```

处于调试的需求，可以输出这个秘密数字。这对游戏并不合适，但对测试很有帮助。Lua 中的注释是在前面放双破折号：

```
print(number) --debug
```

接下来，设置一个 `while` 循环，当分配给 `player.guess` 的值不等于代码开始时建立的随机的 `number` 时，循环将永远运行。目前，`player.guess` 被设置为 0，所以它不等于 `number`。Lua 的不等式数学运算符是 `~=`，诚然这很独特，但过一段时间你就会习惯。

在这个无限循环的过程中，首先游戏会打印一个提示，让玩家明白游戏的内容。

接下来，Lua 会暂停，等待玩家输入猜测的数。Lua 使用 `io.read` 函数从文件和标准输入 （stdin） 中读取数据。你可以将 `io.read` 的结果分配到一个变量中，这个变量是在 `player` 表中动态创建的。处理玩家输入的问题是，即使它是一个数字，它也是作为一个字符串读取的。你可以使用 `tonumber()` 函数将这个输入转换为整数类型，将结果赋值回初始为 `0` 的 `player.guess` 变量：

```
while ( player.guess ~= number ) do
  print("Guess a number between 1 and 100")
  player.answer = io.read()
  player.guess = tonumber(player.answer)
```

现在 `player.guess` 包含了一个新的值，它将与 `if` 语句中的随机数进行比较。Lua 使用关键字 `if`、`elseif` 和 `else`，并用关键字 `end` 来结束该语句：

```
  if ( player.guess > number ) then
    print("Too high")
  elseif ( player.guess < number) then
    print("Too low")
  else
    print("That's right!")
    os.exit()
  end
end
```

最后，函数 `os.exit()` 在成功后关闭应用，关键字 `end` 使用了两次：一次是结束 `if` 语句，另一次是结束 `while` 循环。

### 运行应用

在终端上运行游戏：

```
$ lua ./guess.lua
96
Guess a number between 1 and 100
1
Too low
Guess a number between 1 and 100
99
Too high
Guess a number between 1 and 100
96
That's right!
```

就是这样！

### 直观且一致

从这段代码中可以看出，Lua 是非常一致且相当直观的。它的表机制是一种令人耳目一新的数据关联方式，它的语法也是简约而高效的。Lua 代码中几乎没有浪费的行，事实上，这个例子中至少有两行可以进一步优化，但我想把数据转换作为它的步骤来演示（也许你可以找到我所指的两行，并对它们进行重构）。

Lua 非常易于使用，它的[文档阅读起来很愉快][9]，主要是因为它的内容实在是不多。你会在短时间内学会核心语言，然后你就可以自由地探索 [LuaRocks][10]，发现别人贡献的各种很棒的库。“Lua” 在葡萄牙语中的意思是“月亮”，所以今晚可以尝试一下。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/lua-guess-number-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://www.lua.org/
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/article/20/3/chocolatey
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/time.html
[7]: https://opensource.com/article/20/6/associative-arrays-bash
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[9]: https://www.lua.org/docs.html
[10]: https://opensource.com/article/19/11/getting-started-luarocks
