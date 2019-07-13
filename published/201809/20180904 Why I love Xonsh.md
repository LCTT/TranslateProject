我为什么喜欢 Xonsh
======

> 有没有想过用 Python 做你的 shell？

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/shelloff.png?itok=L8pjHXjW)

Shell 语言对交互式使用很有用。但是在使用它们作为编程语言时这种优化就需要权衡，有时在编写 shell 脚本时会感觉到这点。

如果你的 shell 也能理解一种更可伸缩的语言会怎样？比如说，Python？

进入 [Xonsh][1]。

安装 Xonsh 就像创建虚拟环境一样简单，运行 `pip install xonsh [ptk，linux]`，然后运行 `xonsh`。

首先，你可能奇怪为什么你的 Python shell 有一个奇怪的提示：

```
$ 1+1
2
```

好的，计算器！

```
$ print("hello world")
hello world
```

我们还可以调用其他函数：

```
$ from antigravity import geohash
$ geohash(37.421542, -122.085589, b'2005-05-26-10458.68')
37.857713 -122.544543
```

然而，我们仍然可以像常规 shell 一样使用它：

```
$ echo "hello world"
hello world
```

我们甚至可以混搭！

```
$ for i in range(3):
.     echo "hello world"
.
hello world
hello world
hello world
```

Xonsh 支持使用 [Prompt Toolkit][2] 补全 shell 命令和 Python 表达式。补全有可视化提示，会显示可能的补全并有下拉列表。

它还支持访问环境变量。它使用简单但强大的启发式方法将 Python 类型应用于环境变量。默认值为 “string”，但是，例如，路径变量是自动列表。

```
$ '/usr/bin' in $PATH
True
```

Xonsh 接受 shell 形式或 Python 形式的布尔快捷运算符：

```
$ cat things
foo
$ grep -q foo things and echo "found"
found
$ grep -q bar things && echo "found"
$ grep -q foo things or echo "found"
$ grep -q bar things || echo "found"
found
```

这意味着 Python 关键字是被解释了。如果我们想要打印著名的《苏斯博士》书的标题，我们需要引用关键词。

```
$ echo green eggs "and" ham
green eggs and ham
```

如果我们不这样做，我们会感到惊讶：

```
$ echo green eggs and ham
green eggs
xonsh: For full traceback set: $XONSH_SHOW_TRACEBACK = True
xonsh: subprocess mode: command not found: ham
Did you mean one of the following?
    as:   Command (/usr/bin/as)
    ht:   Command (/usr/bin/ht)
    mag:  Command (/usr/bin/mag)
    ar:   Command (/usr/bin/ar)
    nm:   Command (/usr/bin/nm)
```

虚拟环境可能会有点棘手。一般的虚拟环境（取决于它们类似 Bash 的语法）无法工作。但是，Xonsh 自带了一个名为 `vox` 的虚拟环境管理系统。

`vox` 可以创建、激活和停用 `~/.virtualenvs` 中的环境。如果你用过 `virtualenvwrapper`，这就是环境变量所在的地方。

请注意，当前激活的环境不会影响 `xonsh`。它无法从激活的环境中导入任何内容。

```
$ xontrib load vox
$ vox create my-environment                                                    
...
$ vox activate my-environment        
Activated "my-environment".                                                    
$ pip install money                                                            
...
$ python                                                              
...
>>> import money                                                              
>>> money.Money('3.14')                        
$ import money
xonsh: For full traceback set: $XONSH_SHOW_TRACEBACK = True
ModuleNotFoundError: No module named 'money'
```

第一行启用 `vox`：它是一个 `xontrib`，是 Xonsh 的一个第三方扩展。`xontrib` 管理器可以列出所有可能的 `xontribs` 及其当前状态（已安装、已加载或未加载）。

可以编写一个 `xontrib` 并上传到 `PyPi` 以使其可用。但是，最好将它添加到 `xontrib` 索引中，以便 Xonsh 提前知道它。比如，这能让配置向导建议它。

如果你曾经想过，“Python 可以成为我的 shell 吗？”，然后你只要  `pip install xonsh` 一下就能知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/xonsh-bash-alternative

作者：[Moshe Zadka][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[1]: https://xon.sh/
[2]: https://python-prompt-toolkit.readthedocs.io/en/master/
