使用 Argbash 来改进你的 Bash 脚本
======

![](https://fedoramagazine.org/wp-content/uploads/2017/11/argbash-1-945x400.png)

你编写或维护过有意义的 bash 脚本吗？如果回答是，那么你可能希望它们以标准且健壮的方式接收命令行参数。Fedora 最近得到了[一个很好的附加组件][2]，它可以帮助你生成更好的脚本。不用担心，它不会花费你很多时间或精力。

### 为什么需要 Argbash?

Bash 是一种解释性的命令行语言，没有标准库。因此，如果你编写 bash 脚本并希望命令行界面符合 [POSIX][3] 和 [GNU CLI][4] 标准，那么你一般只有两种选择：

1. 直接编写为脚本量身定制的参数解析功能（可使用内置的 `getopts`）。
2. 使用外部 bash 模块。

第一个选项看起来非常愚蠢，因为正确实现接口并非易事。但是，从 [Stack Overflow][5] 到 [Bash Hackers][6] wiki 的各种站点上，它却被认为是最佳选择。

第二个选项看起来更聪明，但使用模块有它自己的问题。最大的问题是你必须将其代码与脚本捆绑在一起。这可能意味着：

 * 要么，你将库作为单独的文件分发
 * 或者，在脚本的开头包含库代码

有两个文件而不是一个是愚蠢的；但采用一个文件的话，会让一堆上千行的复杂代码污染了你的脚本。

这是 Argbash [项目诞生][7]的主要原因。Argbash 是一个代码生成器，它为你的脚本生成一个量身定制的解析库。与其他 bash 模块的通用代码不同，它生成你的脚本所需的最少代码。此外，如果你不需要 100% 符合那些 CLI 标准的话，你可以生成更简单的代码。

### 示例

#### 分析

假设你要实现一个脚本，它可以在终端窗口中[绘制条形图][8]，你可以通过重复一个字符选定的次数来做到这一点。这意味着你需要从命令行获取以下信息：

 * _哪个字符是组成该行的元素。如果未指定，使用破折号 `-`。_ 在命令行上，这是个单值定位参数 `character`，其默认值为 `-`。（LCTT 译注：定位参数是指确定位置的参数，此处 `character` 需是命令行的第一个参数）
 * _直线的长度。如果未指定，会选择 `80`。_ 这是一个单值可选参数 `length`，默认值为 `80`。
 * _Verbose 模式（用于调试）。_ 这是一个布尔型参数 `verbose`，默认情况下关闭。

由于脚本的主体非常简单，因此本文主要关注从命令行获取用户的输入到合适的脚本变量。Argbash 生成的代码会将参数解析结果保存到 shell 变量 `_arg_character`、`_arg_length` 和 `_arg_verbose` 当中。

#### 执行

接下来，你还需要 `argbash-init` 和 `argbash` bash 脚本，它们是 argbash 包的一部分。因此，运行以下命令：

```
sudo dnf install argbash
```

然后，使用 `argbash-init` 来为 `argbash` 生成模板，它会生成可执行脚本。你需要三个参数：一个名为  `character` 的定位参数，一个可选的 `length` 参数以及一个可选的布尔 `verbose`。将这些传递给 `argbash-init`，然后将输出传递给 `argbash` :
```
argbash-init --pos character --opt length --opt-bool verbose script-template.sh
argbash script-template.sh -o script
./script
```

看到帮助信息了吗？看起来该脚本不知道字符参数的默认选项。因此，看一下 [Argbash API][9]，然后通过编辑脚本的模板部分来解决问题：

```
# ...
# ARG_OPTIONAL_SINGLE([length],[l],[Length of the line],[80])
# ARG_OPTIONAL_BOOLEAN([verbose],[V],[Debug mode])
# ARG_POSITIONAL_SINGLE([character],[The element of the line],[-])
# ARG_HELP([The line drawer])
# ...
```

Argbash 非常智能，它试图让每个生成的脚本都成为自己的模板，这意味着你不需要存储源模版以供进一步使用，你也不要丢掉生成的 bash 脚本。现在，尝试重新生成如你所预期的下一个线条绘图脚本：

```
argbash script -o script
./script
```

如你所见，一切正常。剩下要做的唯一事情就是完成线条绘图功能。

### 结论

你可能会发现包含解析代码的部分很长，但考虑到它允许你以 `./script.sh x -Vl50` 的方式调用，并且能像 `./script -V -l 50 x` 一样工作。确实需要一些代码才能做到这一点。

但是，通过调用 `argbash-init` 并将参数 `-mode` 设置为 `minimal`，你可以平衡生成的代码复杂度和解析能力，而转向更简单的代码。这个选项将脚本的大小减少了大约 20 行，这相当于生成的解析代码大小减少了大约 25%。另一方面，`full` 模式使脚本更加智能。

如果你想要检查生成的代码，请给 `argbash` 提供参数 `-commented`，它会将注释放入解析代码中，从而揭示各个部分背后的意图。与其他参数解析库相比较，如 [shflags][10], [argsparse][11] 或 [bash-modules/arguments][12]，你将看到 Argbash 强大的简单性。如果出现了严重的错误，你需要快速修复解析功能中的一个故障，Argbash 也允许你这样做。

由于你很有可能是 Fedora 用户，因此你可以享受从官方仓库安装命令行 Argbash 的便利。不过，也有一个[在线解析代码生成器][13]服务可以使用。此外，如果你在服务器上使用 Docker 工作，你可以试试 [Argbash Docker 镜像][14]。

这样你可以让你的脚本具有令用户满意的命令行界面。Argbash 随时为你提供帮助，你只需付出很少的努力。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/improve-bash-scripts-argbash/

作者：[Matěj Týč][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/bubla/
[1]:https://fedoramagazine.org/improve-bash-scripts-argbash/
[2]:https://argbash.readthedocs.io/
[3]:http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html
[4]:https://www.gnu.org/prep/standards/html_node/Command_002dLine-Interfaces.html
[5]:https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
[6]:http://wiki.bash-hackers.org/howto/getopts_tutorial
[7]:https://argbash.readthedocs.io/
[8]:http://wiki.bash-hackers.org/snipplets/print_horizontal_line
[9]:http://argbash.readthedocs.io/en/stable/guide.html#argbash-api
[10]:https://raw.githubusercontent.com/Anvil/bash-argsparse/master/argsparse.sh
[11]:https://raw.githubusercontent.com/Anvil/bash-argsparse/master/argsparse.sh
[12]:https://raw.githubusercontent.com/vlisivka/bash-modules/master/main/bash-modules/src/bash-modules/arguments.sh
[13]:https://argbash.io/generate
[14]:https://hub.docker.com/r/matejak/argbash/
