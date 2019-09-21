[#]: collector: (lujun9972)
[#]: translator: (jdh8383)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10772-1.html)
[#]: subject: (The shell scripting trap)
[#]: via: (https://arp242.net/weblog/shell-scripting-trap.html)
[#]: author: (Martin Tournoij https://arp242.net/)

Shell 脚本编程陷阱
======

Shell 脚本很棒，你可以非常轻松地写出有用的东西来。甚至像是下面这个傻瓜式的命令：

```
# 用含有 Go 的词汇起名字：
$ grep -i ^go /usr/share/dict/* | cut -d: -f2 | sort -R | head -n1
goldfish
```

如果用其他编程语言，就需要花费更多的脑力，用多行代码实现，比如用 Ruby 的话：

```
puts(Dir['/usr/share/dict/*-english'].map do |f|
  File.open(f)
    .readlines
    .select { |l| l[0..1].downcase == 'go' }
end.flatten.sample.chomp)
```

Ruby 版本的代码虽然不是那么长，也并不复杂。但是 shell 版是如此简单，我甚至不用实际测试就可以确保它是正确的。而 Ruby 版的我就没法确定它不会出错了，必须得测试一下。而且它要长一倍，看起来也更复杂。

这就是人们使用 Shell 脚本的原因，它简单却实用。下面是另一个例子：

```
curl https://nl.wikipedia.org/wiki/Lijst_van_Nederlandse_gemeenten |
    grep '^<li><a href=' |
    sed -r 's|<li><a href="/wiki/.+" title=".+">(.+)</a>.*</li>|\1|' |
    grep -Ev '(^Tabel van|^Lijst van|Nederland)'
```

这个脚本可以从维基百科上获取荷兰基层政权的列表。几年前我写了这个临时的脚本，用来快速生成一个数据库，到现在它仍然可以正常运行，当时写它并没有花费我多少精力。但要用 Ruby 完成同样的功能则会麻烦得多。

---

现在来说说 shell 的缺点吧。随着代码量的增加，你的脚本会变得越来越难以维护，但你也不会想用别的语言重写一遍，因为你已经在这个 shell 版上花费了很多时间。

我把这种情况称为“Shell 脚本编程陷阱”，这是[沉没成本谬论][1]的一种特例（LCTT 译注：“沉没成本谬论”是一个经济学概念，可以简单理解为，对已经投入的成本可能被浪费而念念不忘）。

实际上许多脚本会增长到超出预期的大小，你经常会花费过多的时间来“修复某个 bug”，或者“添加一个小功能”。如此循环往复，让人头大。

如果你从一开始就使用 Python、Ruby 或是其他类似的语言来写这个程序，你可能会在写第一版的时候多花些时间，但以后维护起来就容易很多，bug 也肯定会少很多。

以我的 [packman.vim][2] 脚本为例。它起初只包含一个简单的用来遍历所有目录的 `for` 循环，外加一个 `git pull`，但在这之后就刹不住车了，它现在有 200 行左右的代码，这肯定不能算是最复杂的脚本，但假如我一上来就按计划用 Go 来编写它的话，那么增加一些像“打印状态”或者“从配置文件里克隆新的 git 库”这样的功能就会轻松很多；添加“并行克隆”的支持也几乎不算个事儿了，而在 shell 脚本里却很难实现（尽管不是不可能）。事后看来，我本可以节省时间，并且获得更好的结果。

出于类似的原因，我很后悔写出了许多这样的 shell 脚本，而我在 2018 年的新年誓言就是不要再犯类似的错误了。

### 附录：问题汇总

需要指出的是，shell 编程的确存在一些实际的限制。下面是一些例子：

  * 在处理一些包含“空格”或者其他“特殊”字符的文件名时，需要特别注意细节。绝大多数脚本都会犯错，即使是那些经验丰富的作者（比如我）编写的脚本，因为太容易写错了，[只添加引号是不够的][3]。
  * 有许多所谓“正确”和“错误”的做法。你应该用 `which` 还是 `command`？该用 `$@` 还是 `$*`，是不是得加引号？你是该用 `cmd $arg` 还是 `cmd "$arg"`？等等等等。
  * 你没法在变量里存储空字节（0x00）；shell 脚本处理二进制数据很麻烦。
  * 虽然你可以非常快速地写出有用的东西，但实现更复杂的算法则要痛苦许多，即使用 ksh/zsh/bash 扩展也是如此。我上面那个解析 HTML 的脚本临时用用是可以的，但你真的不会想在生产环境中使用这种脚本。
  * 很难写出跨平台的通用型 shell 脚本。`/bin/sh` 可能是 `dash` 或者 `bash`，不同的 shell 有不同的运行方式。外部工具如 `grep`、`sed` 等，不一定能支持同样的参数。你能确定你的脚本可以适用于 Linux、macOS 和 Windows 的所有版本吗（无论是过去、现在还是将来）？
  * 调试 shell 脚本会很难，特别是你眼中的语法可能会很快变得记不清了，并不是所有人都熟悉 shell 编程的语境。
  * 处理错误会很棘手（检查 `$?` 或是 `set -e`），排查一些超过“出了个小错”级别的复杂错误几乎是不可能的。
  * 除非你使用了 `set -u`，变量未定义将不会报错，而这会导致一些“搞笑事件”，比如 `rm -r ~/$undefined` 会删除用户的整个家目录（[瞅瞅 Github 上的这个悲剧][4]）。
  * 所有东西都是字符串。一些 shell 引入了数组，能用，但是语法非常丑陋和费解。带分数的数字运算仍然难以应付，并且依赖像 `bc` 或 `dc` 这样的外部工具（`$(( .. ))` 这种方式只能对付一下整数）。

**反馈**

你可以发邮件到 [martin@arp242.net][5]，或者[在 GitHub 上创建 issue][6] 来向我反馈，提问等。

--------------------------------------------------------------------------------

via: https://arp242.net/weblog/shell-scripting-trap.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[jdh8383](https://github.com/jdh8383)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://youarenotsosmart.com/2011/03/25/the-sunk-cost-fallacy/
[2]: https://github.com/Carpetsmoker/packman.vim
[3]: https://dwheeler.com/essays/filenames-in-shell.html
[4]: https://github.com/ValveSoftware/steam-for-linux/issues/3671
[5]: mailto:martin@arp242.net
[6]: https://github.com/Carpetsmoker/arp242.net/issues/new
