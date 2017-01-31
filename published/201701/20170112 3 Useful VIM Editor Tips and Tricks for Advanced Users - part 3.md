3 个针对高级用户的 Vim 编辑器实用技巧
============================================================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/vim-featured.jpg "3 Useful VIM Editor Tips and Tricks for Advanced Userss")

这篇文章是[ Vim 用户指南][12]系列文章中的一篇：

*   [Vim 初学者入门指南][3]
*   [Vim 快捷键速查表][4]
*   [5 个针对有经验用户的 Vim 技巧][4]
*   3 个针对高级用户的 Vim 编辑器实用技巧

毫无疑问， Vim 是一个很强大的文本编辑器。它提供了大量的特性，这意味着学习并记住 Vim 的所有功能实际上是不可能的。但是我们至少可以不断学习简单的方法来完成事情，从而随着时间的增长，我们使用编辑器的经验将会变得更好。

请记住，在这篇文章中我们将讨论的一些 Vim 编辑器技巧是针对高级用户的。

**注**：如果你是第一次接触 Vim，你可以首先阅读我们的[入门指南][14]。对于已经使用过 Vim 编辑器的用户，我确信[ Vim 快捷键速查表][15]将会对你很有帮助。如果你已经是一名有经验的用户，你可能对[一些针对有经验用户的技巧][16]比较感兴趣。

请注意文中提到的所有技巧绝大多数都是在简单、易于理解的代码环境中进行阐述的，因为它们在软件开发中确实很实用。但这并不意味着普通用户(非程序员、没有把 Vim 作为一般的文本编辑器)在他们的工作中用不到。

### 1、为文件设置特定的变量

有时候，在一个特定文件中，你可能想把输入的制表符用空格代替，或者想要把源代码文件使用两个空格缩进，即便编辑器的默认缩进是四个空格。

基本上我们在这儿讨论对针对文件的的更改。 Vim 提供的这个特性允许你对一个指定的文件更改特定的设置。这个特性叫做 “模式行（Modeline）” 。

比如，如果你想把输入的每一个制表符（Tab）用空格代替，那么你只需要在文件的前几行或最后几行加入下面的模式行：

```
# vim: set expandtab:
```

如果想把默认缩进从 4 个空格变成 2 个空格，可以在源文件中添加下面的模式行：

```
// vim: noai:ts=2:sw=2
```

在使用模式行时，请记住下面这几个重要的点：

* 模式行只能添加在文件中的前五行或者最后五行。
* 为了使用模式行这个特性，必须在 `.vimrc` 文件中添加 `:set modeline` 。
* 在以 root 用户身份对文件进行编辑的时候该特性失效。

了解更多的信息，请阅读该特性的[官方文档][17]。

### 2、 关键字补全

当你开始写的复杂代码越来越多或者开始在一个大的源文件上编辑时，你会遇到一些变量名字。有时，要记住所有的变量名字不太容易，所以当需要输入变量名字的时候，你通常从已经使用过的地方复制过来。

幸运的是，使用 Vim 你只需要输入变量的几个起始字母即可。在’插入模式’中，按 `Ctrl + n` 或者 `Ctrl + p` 可以得到一个匹配的关键词列表。 `Ctrl + n` 用来插入下一个匹配词； `Ctrl + p` 给出一个之前匹配的关键词列表。

下图是该特性的一个展示：

 ![vim-keyword-completion1](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/vim-keyword-completion1.jpg "vim-keyword-completion1")

正如上面的屏幕截图清晰展示的那样，列表中也会出现其他源文件中包含的词。关于该特性的更多信息，请访问[这儿][18]。

### 3、 搜索

假设你正在调试代码，其中一个需要做的工作是快速查看一个变量在一个文件中所有出现的地方。一个常用的方法是退出‘插入模式’，输入 `/[变量名字]` 命令，按回车 ，然后返回‘插入模式’，使用 `n` 和 `p` 在关键字之间导航。

上面讲到的这种方法没毛病，但是还有一种更简单、更快捷的方法可以来完成这样的搜索。使用这种方法，首先你需要退出‘插入模式’，然后把光标移动到你想要搜索的词/变量下面，这并不费时。接下来，你只需要按 `Shift + *` 即可。

重复这样做，然后编辑器将会带你找到在文件中所有使用了这个词/变量的地方。

### 结论

尽管是针对高级用户，但文章中讨论的这些技巧并不难理解，也比较容易使用。如果你具有一定的基础，那么你能够从中获益很多。不必多说，无论是任何新特性或观念，你需要勤于练习这些技巧才能够把它们变成一种习惯。


--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/vim-tips-tricks-advanced-users/

作者：[Himanshu Arora][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/himanshu/
[2]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/#respond
[3]:https://www.maketecheasier.com/start-with-vim-linux/
[4]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[5]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-advanced-users%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-advanced-users%2F&text=3+Useful+VIM+Editor+Tips+and+Tricks+for+Advanced+Users
[9]:mailto:?subject=3%20Useful%20VIM%20Editor%20Tips%20and%20Tricks%20for%20Advanced%20Users&body=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-advanced-users%2F
[10]:https://www.maketecheasier.com/opt-out-google-personalized-ads/
[11]:https://www.maketecheasier.com/wi-fi-vs-ethernet-vs-4g/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343
[14]:https://www.maketecheasier.com/start-with-vim-linux/
[15]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[16]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[17]:http://vim.wikia.com/wiki/Modeline_magic
[18]:http://vim.wikia.com/wiki/Any_word_completion
