用一些超酷的功能使 Vim 变得更强大
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/making-vim-even-more-awesome-with-these-cool-features_orig.jpg)

**Vim** 是每个 [Linux 发行版][1] 中不可或缺的一部分，也是 Linux 用户最常用的工具(当然是基于终端的)。至少，这个说法对我来说是成立的。人们可能会在利用什么工具进行程序设计更好产生争议，的确 Vim 可能不是一个好的选择，因为有很多不同的 IDE 或其他高性能的类似于  `Sublime Text 3`，`Atom` 等使程序设计变得更加容易的文本编辑器。
#### 我的感想

但我认为，Vim 应该从一开始就以我们想要的方式运作，而其他编辑器让我们按照已经设计好的方式工作，实际上不是我们想要的工作方式。我不能过多地谈论其他编辑器，因为我没有过多地使用它们(我对 Vim 有偏见` Linux 中国注：我对 Vim 情有独钟`)。

不管怎样，让我们用 Vim 来做一些事情吧，它完全可以胜任。
### 利用 Vim 进行程序设计

#### 执行代码


考虑一个场景，当我们使用 Vim 设计 C++ 代码并需要编译和运行它时，该怎么做呢。

(a). 我们通过 `(Ctrl + Z)` 返回到终端，或者利用 `(:wq)` 保存并退出。

(b). 但是任务还没有结束，接下来需要在终端上输入类似于 `g++ fileName.cxx` 的命令进行编译。

(c). 接下来需要键入 `./a.out` 执行它。


为了让我们的 C++ 代码在 shell 中运行，需要做很多事情。但这似乎并不是利用 Vim 操作的方法( Vim 总是倾向于把几乎所有操作方法利用一个/两个按键实现)。那么，做这些事情的 Vim 的方式究竟是什么?
#### Vim 方式


Vim 不仅仅是一个文本编辑器，它是一种编辑文本的编程语言。这种帮助我们扩展 Vim 功能的编程语言是 `“VimScript”（Linux 中国注： Vim 脚本）`。

因此，在 `VimScript` 的帮助下，我们可以只需一个按键轻松地将编译和运行代码的任务自动化。
 [![create functions in vim .vimrc](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_orig.png)][2] 


以上是在我的 `.vimrc` 配置文件里创建的一个名为 CPP() 函数的片段。
#### 利用 VimScript 创建函数


在VimScript中创建函数的语法非常简单。它以关键字“
**func**
”开头，然后是函数名[在 VimScript 中函数名必须以大写字母开头，否则 Vim 将提示错误]。在函数的结尾用关键词
“**endfunc**
”。
在函数的主体中，可以看到
**exec**
声明,无论您在 **exec** 关键字之后写什么，都要在 Vim 的命令模式上执行(记住，在 Vim 窗口的底部以 `：` 开始)。现在，传递给 **exec** 的字符串是（Linux 中国注： ``:!clear && g++ % && ./a.out``） - 
[![vim functions commands & symbols](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_1_orig.png)][3]


当这个函数被调用时，它首先清除终端屏幕，因此只能看到输出，接着利用 `g++` 执行正在处理的文件，然后运行由前一步编译而形成的 `a.out` 文件。

将 `Ctrl+r` 映射为运行 C++ 代码。
-------------------------------------------------------------


映射语句: `call CPP()` 到键组合 `Ctrl+r`，以便我现在可以按 `Ctrl+r` 来执行我的 C++ 代码，无需手动输入: `call CPP()`，然后按 `Enter` 键。
#### 最终结果


我们终于找到了 Vim Way 操作的方法。现在，你只需点击一个按钮，你编写的 C++ 代码就输出在你的屏幕上，你不需要键入所有冗长的命令了。这也节省了你的时间。

我们也可以为其他语言实现这类功能。
 [![create function in vim for python](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_2_orig.png)][4] 


对于Python:您可以按下映射键执行您的代码。
 [![create function in vim for java](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_3_orig.png)][5] 


对于Java:您现在可以按下映射健，它将首先编译您的 Java 代码，然后执行您的 Java 类文件并显示输出。
### 进一步提高


所以，这就是如何在 Vim 中操作的方法。现在，我们来看看如何在 Vim 中实现所有这些。我们可以直接在 Vim 中使用这些代码片段，而另一种方法是使用 Vim 中的自动命令 `autocmd`。`autocmd` 的优点是这些命令无需用户调用，它们在用户所提供的任何特定条件下自动执行。

我想用 [autocmd] 实现类似于单一的映射来执行每种语言替代使用不同的映射执行不同程序设计语言编译出的代码，。
 [![autocmd in vimrc](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_4_orig.png)][6] 


在这里做的是，为所有的定义了执行相应文件类型代码的函数编写了自动命令。

会发生什么当我打开任何上述提到的文件类型的缓冲区, Vim 会自动将 `Ctrl + r` 映射到函数调用和表示 Enter Key （Linux 中国注：回车键）,这样就不需要每完成一个独立的任务就按一次 “Enter key” 了。

为了实现这个功能，您只需将函数片段添加到[dot]vimrc（Linux 中国注： `.vimrc` 文件）文件中，然后将所有这些 `autocmds` 也一并添加进去。这样，当您下一次打开 Vim 时，Vim 将拥有所有相应的功能来执行所有具有相同绑定键的代码。
### 总结

就这些了。希望这些能让你更爱 Vim 。我目前正在探究 Vim 中的一些内容，正阅读文档，补充 [.vimrc] 文件，当我研究出一些成果后我会再次与你分享。
如果你想看一下我现在的 [.vimrc] 文件，这是我的 Github 账户的链接: [MyVimrc][7]。 

期待你的好评。
--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/making-vim-even-more-awesome-with-these-cool-features

作者：[LINUXANDUBUNTU][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/category/distros
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_orig.png
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_1_orig.png
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_2_orig.png
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_3_orig.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vim_4_orig.png
[7]:https://github.com/phenomenal-ab/VIm-Configurations/blob/master/.vimrc
