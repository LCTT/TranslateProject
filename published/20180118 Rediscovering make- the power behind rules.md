重新发现 make： 规则背后的力量
======

![](https://user-images.githubusercontent.com/4419992/35015638-0529f1c0-faf4-11e7-9801-4995fc4b54f0.jpg)

我过去认为 makefile 只是一种将一组组的 shell 命令列出来的简便方法；过了一段时间我了解到它们是有多么的强大、灵活以及功能齐全。这篇文章带你领略其中一些有关规则的特性。

> 备注：这些全是针对 GNU Makefile 的，如果你希望支持 BSD Makefile ，你会发现有些新的功能缺失。感谢 [zge][5] 指出这点。

### 规则

<ruby>规则<rt>rule</rt></ruby>是指示 `make` 应该如何并且何时构建一个被称作为<ruby>目标<rt>target</rt></ruby>的文件的指令。目标可以依赖于其它被称作为<ruby>前提<rt>prerequisite</rt></ruby>的文件。

你会指示 `make` 如何按<ruby>步骤<rt>recipe</rt></ruby>构建目标，那就是一套按照出现顺序一次执行一个的 shell 命令。语法像这样：

```
target_name : prerequisites
    recipe
```

一但你定义好了规则，你就可以通过从命令行执行以下命令构建目标：

```
$ make target_name
```

目标一经构建，除非前提改变，否则 `make` 会足够聪明地不再去运行该步骤。

### 关于前提的更多信息

前提表明了两件事情：

* 当目标应当被构建时：如果其中一个前提比目标更新，`make` 假定目的应当被构建。
* 执行的顺序：鉴于前提可以反过来在 makefile 中由另一套规则所构建，它们同样暗示了一个执行规则的顺序。

如果你想要定义一个顺序但是你不想在前提改变的时候重新构建目标，你可以使用一种特别的叫做“<ruby>唯顺序<rt>order only</rt></ruby>”的前提。这种前提可以被放在普通的前提之后，用管道符（`|`）进行分隔。

### 样式

为了便利，`make` 接受目标和前提的样式。通过包含 `%` 符号可以定义一种样式。这个符号是一个可以匹配任何长度的文字符号或者空隔的通配符。以下有一些示例：

* `%`：匹配任何文件 
* `%.md`：匹配所有 `.md` 结尾的文件
* `prefix%.go`：匹配所有以 `prefix` 开头以 `.go` 结尾的文件

### 特殊目标

有一系列目标名字，它们对于 `make` 来说有特殊的意义，被称作<ruby>特殊目标<rt>special target</rt></ruby>。

你可以在这个[文档][1]发现全套特殊目标。作为一种经验法则，特殊目标以点开始后面跟着大写字母。

以下是几个有用的特殊目标：

- `.PHONY`：向 `make` 表明此目标的前提可以被当成伪目标。这意味着 `make` 将总是运行，无论有那个名字的文件是否存在或者上次被修改的时间是什么。
- `.DEFAULT`：被用于任何没有指定规则的目标。
- `.IGNORE`：如果你指定 `.IGNORE` 为前提，`make` 将忽略执行步骤中的错误。

### 替代

当你需要以你指定的改动方式改变一个变量的值，<ruby>替代<rt>substitution</rt></ruby>就十分有用了。

替代的格式是 `$(var:a=b)`，它的意思是获取变量 `var` 的值，用值里面的 `b` 替代词末尾的每个 `a` 以代替最终的字符串。例如：

```
foo := a.o
bar : = $(foo:.o=.c) # sets bar to a.c
```

注意：特别感谢 [Luis Lavena][2] 让我们知道替代的存在。

### 档案文件

档案文件是用来一起将多个数据文档（类似于压缩文件的概念）收集成一个文件。它们由 `ar` Unix 工具所构建。`ar` 可以用于为任何目的创建档案，但除了[静态库][3]，它已经被 `tar` 大量替代。

在 `make` 中，你可以使用一个档案文件中的单独一个成员作为目标或者前提，就像这样：

```
archive(member) : prerequisite 
    recipe
```

### 最后的想法

关于 `make` 还有更多可探索的，但是至少这是一个起点，我强烈鼓励你去查看[文档][4]，创建一个笨拙的 makefile 然后就可以探索它了。

--------------------------------------------------------------------------------

via: https://monades.roperzh.com/rediscovering-make-power-behind-rules/

作者：[Roberto Dip][a]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://monades.roperzh.com
[1]:https://www.gnu.org/software/make/manual/make.html#Special-Targets
[2]:https://twitter.com/luislavena/
[3]:http://tldp.org/HOWTO/Program-Library-HOWTO/static-libraries.html
[4]:https://www.gnu.org/software/make/manual/make.html
[5]:https://lobste.rs/u/zge
