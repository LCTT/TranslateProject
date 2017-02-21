Vim 编辑器的兼容模式
============================================================

目前，在我们讲述 [Vim][5] 的教程中，讨论过编辑器的模式行（Modeline）功能以及怎样用[插件][6]来扩展 Vim 的功能集。可正如我们所知，Vim 提供了非常多的内置功能：因此在本教程中更进一步，我们来谈谈在该编辑器启动时的可用模式。

但在我们开始之前，请注意在本教程中提及的所有例子、命令及用法说明都是在 Ubuntu 14.04 上测试的，我们测试用的 Vim 版本是 7.4 。

### Vim 中的兼容模式与不兼容模式

为了更好理解上述的 Vim 模式，你有必要先去了解下此编辑器初始化过程的一个重要方面。

#### 系统级及本地 vimrc 文件

当 Vim 启动时，编辑器会去搜索一个系统级的 vimrc 文件来进行系统范围内的默认初始化工作。

这个文件通常在你系统里 `$VIM/vimrc` 的路径下，如果没在那里，那你可以通过在 Vim 里面运行 `:version` 命令来找到它的正确存放位置。比如说，在我这里，这个命令的相关部分的输出结果如下： 

```
...
...
...
system vimrc file: "$VIM/vimrc"
user vimrc file: "$HOME/.vimrc"
2nd user vimrc file: "~/.vim/vimrc"
user exrc file: "$HOME/.exrc"
fall-back for $VIM: "/usr/share/vim"
...
...
...
```

可以看到那个系统 vimrc 文件确实位于 `$VIM/vimrc` ，但我检查了我机子上没设置过 `$VIM` 环境变量。所以在这个例子里 - 正如你在上面的输出所看到的 - $VIM 在我这的路径是 `/usr/share/vim` ，是一个回落值（LCTT 译注：即如果前面失败的话，最终采用的结果）。于是我试着在这个路径寻找 vimrc ，我看到这个文件是存在的。如上即是我的系统 vimrc 文件，就如前面提过的那样 - 它在 Vim 启动时会被读取。 

在这个系统级 vimrc 文件被读取解析完后，编辑器会查找一个用户特定的（或者说本地的）vimrc 文件。这个本地 vimrc 的[搜索顺序][7]是：环境变量 `VIMINIT`、`$HOME/.vimrc`、环境变量 `EXINIT`， 和一个叫 `exrc` 的文件。通常情况下，会存在 `$HOME/.vimrc` 或 `~/.vimrc` 这样的文件，这个文件可看作是本地 vimrc。

#### 我们谈论的是什么兼容性

就像我们谈论 Vim 的兼容性模式和不兼容性模式那样，这些模式的开启和禁用会做出什么样的兼容性也值得了解。要了解这些，先要知道 Vim 是 **V**i **IM**proved 的缩写，像这个全名暗示的那样，Vim 编辑器是 Vi 编辑器的改进版。

经过改进意味着 Vim 的功能集比 Vi 的更大。为了更好的理解这俩编辑器的区别，点[这里][8]。

当谈论 Vim 的兼容和不兼容模式时，我们所说的兼容性是指 Vim 兼容 Vi。在兼容模式下运行时，Vim 大部分增强及改善的功能就不可用了。不管怎样，要记住这种模式下，Vim 并不能简单等同 Vi - 此模式只是设定一些类似 Vi 编辑器工作方式的默认选项。

不兼容模式 - 不用多说 - 使得 Vim 用起来跟 Vi 不兼容，也使得用户可以用到它的所有增强、改善及特征。

#### 怎么启用/禁用这些模式？

在 Vim 中尝试运行 `:help compatible` 命令，接着你会看到如下语法：

```
'compatible' 'cp' boolean (默认开启 ，当 |vimrc| 或 |gvimrc| 存在时关闭)
```

描述中说到兼容模式默认开启的，不过当 vimrc 文件存在时会关闭。但说的是哪种 vimrc 文件呢？答案是本地 vimrc。深入研究下 `:help compatible` 命令给出的详情，你会发现下面内容说得更清楚:

> 事实上，这意味着当一个 |vimrc| 或 |gvimrc| 文件存在时，Vim 会用默认的 Vim，否则它会用 Vi 默认的。（注：如果系统级的 vimrc 或 gvimrc 文件中带有 |-u| 参数，则不会这样。）。

那么在 Vim 启动时，实际上进行的动作是，首先会解析系统 vimrc 文件 - 在这时处于兼容性模式默认开启状态。现在，无论何时发现一个用户（或成为本地） vimrc ，不兼容模式都会打开。`:help compatible-default`命令说的很清楚： 

> 在 Vim 启动时，‘compatible’选项是打开的。这将在 Vim 开始初始化时应用。但是一旦之后发现用户级 vimrc 文件，或在当前目录有一个 vimrc 文件，抑或是 `VIMINIT` 环境变量已设置，Vim 就会被设为不兼容模式。

假如你想无视默认的行为，要在编辑器开始解析系统 vimrc 文件时打开不兼容模式，你可以通过添加如下命令到那个文件的开头来完成这个操作。

```
:set nocompatible
```

#### 其他有用细节

这儿是一些关于这些模式的更有用的细节：

> 现在通过创建一个 .vimrc 文件来设置或重置兼容性会有一个副作用：（键盘）映射（`Mapping`）在解释的时候会有冲突。这使得在用诸如回车控制符 `<CR>` 等情况时会有影响。如果映射关系依赖于兼容性的某个特定值，在给出映射前设置或者重置它。

> 上述行为能够用以下方式能覆盖：
- 如果给出 `-N` 命令行参数，即使不存在 vimrc 文件， ‘不兼容模式’ 也会启用。
- 如果给出 `-C` 命令行参数，即使存在 vimrc 文件， ‘兼容模式’ 也会启用。
- 如果应用了 `-u {vimrc}` 参数，‘兼容模式’将会启用。
- 当 Vim 的可执行文件的名称以 `ex` 结尾时，那这个效果跟给出 `-C` 参数一样：即使存在一个 vimrc 文件，‘兼容模式’ 也会启用，因为当 Vim 以 “ex” 的名称启用时，就会让 Vim 的工作表现得像 “前任” 一样（LCTT 译注：意即 Vim 像 Vi 一样工作）。
```

### 结论

我们都觉得，你可能不会发现你自己有机会处于一种你需要打开 Vim 的 Vi 兼容模式的情形中，但是那并不意味着你应该不知道 Vim 编辑器的初始化过程。毕竟，你绝不会知道这些知识什么时候会帮到你。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/vim-editor-modes-explained/

作者：[Himanshu Arora][a]
译者：[ch-cn](https://github.com/ch-cn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/
[1]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#system-and-local-vimrc
[2]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#what-compatibility-are-we-talking
[3]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#how-to-enabledisable-these-modes
[4]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/#other-useful-details
[5]:https://www.howtoforge.com/vim-basics
[6]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-3/
[7]:http://vimdoc.sourceforge.net/htmldoc/starting.html#system-vimrc
[8]:http://askubuntu.com/questions/418396/what-is-the-difference-between-vi-and-vim
