[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10761-1.html)
[#]: subject: (Using Square Brackets in Bash: Part 2)
[#]: via: (https://www.linux.com/blog/learn/2019/4/using-square-brackets-bash-part-2)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

在 Bash 中使用[方括号]（二）
======

![square brackets][1]

> 我们继续来看方括号的用法，它们甚至还可以在 Bash 当中作为一个命令使用。

欢迎回到我们的方括号专题。在[前一篇文章][3]当中，我们介绍了方括号在命令行中可以用于通配操作，如果你已经读过前一篇文章，就可以从这里继续了。

方括号还可以以一个命令的形式使用，就像这样：

```
[ "a" = "a" ]
```

上面这种  `[ ... ]` 的形式就可以看成是一个可执行的命令。要注意，方括号内部的内容 `"a" = "a"` 和方括号 `[`、`]` 之间是有空格隔开的。因为这里的方括号被视作一个命令，因此要用空格将命令和它的参数隔开。

上面这个命令的含义是“判断字符串 `"a"` 和字符串 `"a"` 是否相同”，如果判断结果为真，那么 `[ ... ]` 就会以<ruby>状态码<rt>status code</rt></ruby> 0 退出，否则以状态码 1 退出。在[之前的文章][4]中，我们也有介绍过状态码的概念，可以通过 `$?` 变量获取到最近一个命令的状态码。

分别执行

```
[ "a" = "a" ]
echo $?
```

以及

```
[ "a" = "b" ]
echo $?
```

这两段命令中，前者会输出 0（判断结果为真），后者则会输出 1（判断结果为假）。在 Bash 当中，如果一个命令的状态码是 0，表示这个命令正常执行完成并退出，而且其中没有出现错误，对应布尔值 `true`；如果在命令执行过程中出现错误，就会返回一个非零的状态码，对应布尔值 `false`。而 `[ ... ]` 也同样遵循这样的规则。

因此，`[ ... ]` 很适合在 `if ... then`、`while` 或 `until` 这种在代码块结束前需要判断是否达到某个条件结构中使用。

对应使用的逻辑判断运算符也相当直观：

```
[ STRING1 = STRING2 ] => 检查字符串是否相等
[ STRING1 != STRING2 ] => 检查字符串是否不相等
[ INTEGER1 -eq INTEGER2 ] => 检查整数 INTEGER1 是否等于 INTEGER2 
[ INTEGER1 -ge INTEGER2 ] => 检查整数 INTEGER1 是否大于等于 INTEGER2
[ INTEGER1 -gt INTEGER2 ] => 检查整数 INTEGER1 是否大于 INTEGER2
[ INTEGER1 -le INTEGER2 ] => 检查整数 INTEGER1 是否小于等于 INTEGER2
[ INTEGER1 -lt INTEGER2 ] => 检查整数 INTEGER1 是否小于 INTEGER2
[ INTEGER1 -ne INTEGER2 ] => 检查整数 INTEGER1 是否不等于 INTEGER2
等等……
```

方括号的这种用法也可以很有 shell 风格，例如通过带上 `-f` 参数可以判断某个文件是否存在：

```
for i in {000..099}; \
 do \
  if [ -f file$i ]; \
  then \
   echo file$i exists; \
  else \
   touch file$i; \
   echo I made file$i; \
  fi; \
done
```

如果你在上一篇文章使用到的测试目录中运行以上这串命令，其中的第 3 行会判断那几十个文件当中的某个文件是否存在。如果文件存在，会输出一条提示信息；如果文件不存在，就会把对应的文件创建出来。最终，这个目录中会完整存在从 `file000` 到 `file099` 这一百个文件。

上面这段命令还可以写得更加简洁：

```
for i in {000..099};\
do\
 if [ ! -f file$i ];\
 then\
  touch file$i;\
  echo I made file$i;\
 fi;\
done
```

其中 `!` 运算符表示将判断结果取反，因此第 3 行的含义就是“如果文件 `file$i` 不存在”。

可以尝试一下将测试目录中那几十个文件随意删除几个，然后运行上面的命令，你就可以看到它是如何把被删除的文件重新创建出来的。

除了 `-f` 之外，还有很多有用的参数。`-d` 参数可以判断某个目录是否存在，`-h` 参数可以判断某个文件是不是一个符号链接。可以用 `-G` 参数判断某个文件是否属于某个用户组，用 `-ot` 参数判断某个文件的最后更新时间是否早于另一个文件，甚至还可以判断某个文件是否为空文件。

运行下面的几条命令，可以向几个文件中写入一些内容：

```
echo "Hello World" >> file023
echo "This is a message" >> file065
echo "To humanity" >> file010
```

然后运行：

```
for i in {000..099};\
do\
 if [ ! -s file$i ];\
 then\
  rm file$i;\
  echo I removed file$i;\
 fi;\
done
```

你就会发现所有空文件都被删除了，只剩下少数几个非空的文件。

如果你还想了解更多别的参数，可以执行 `man test` 来查看 `test` 命令的 man 手册（`test` 是 `[ ... ]` 的命令别名）。

有时候你还会看到 `[[ ... ]]` 这种双方括号的形式，使用起来和单方括号差别不大。但双方括号支持的比较运算符更加丰富：例如可以使用 `==` 来判断某个字符串是否符合某个<ruby>模式<rt>pattern</rt></ruby>，也可以使用 `<`、`>` 来判断两个字符串的出现顺序。

可以在 [Bash 表达式文档][5]中了解到双方括号支持的更多运算符。

### 下一集

在下一篇文章中，我们会开始介绍圆括号 `()` 在 Linux 命令行中的用法，敬请关注！

### 更多

- [Linux 工具：点的含义][6]
- [理解 Bash 中的尖括号][7]
- [Bash 中尖括号的更多用法][8]
- [Linux 中的 &][9]
- [Bash 中的 ＆ 符号和文件描述符][10]
- [Bash 中的逻辑和（&）][4]
- [浅析 Bash 中的 {花括号}][11]
- [在 Bash 中使用[方括号] （一）][3]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/4/using-square-brackets-bash-part-2

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/square-brackets-3734552_1920.jpg?itok=hv9D6TBy "square brackets"
[2]: /LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://linux.cn/article-10717-1.html
[4]: https://linux.cn/article-10596-1.html
[5]: https://www.gnu.org/software/bash/manual/bashref.html#Bash-Conditional-Expressions
[6]: https://linux.cn/article-10465-1.html
[7]: https://linux.cn/article-10502-1.html
[8]: https://linux.cn/article-10529-1.html
[9]: https://linux.cn/article-10587-1.html
[10]: https://linux.cn/article-10591-1.html
[11]: https://linux.cn/article-10624-1.html

