5 个针对有经验用户的 Vim 实用技巧
============================================================
 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-tips-tricks-featured.jpg "5 Vim Tips and Tricks for Experienced Userss")

这篇文章是 [Vim 用户指南][12]系列文章中的一篇：

*   [Vim 初学者入门指南][3]
*   [Vim 快捷键速查表][4]
*   5 个针对有经验用户的 Vim 实用技巧
*   [3 个针对高级用户的 Vim 编辑器实用技巧][5]

Vim 编辑器提供了很多的特性，要想全部掌握它们很困难。然而，花费更多的时间在命令行编辑器上总是有帮助的。毫无疑问，和 Vim 用户们进行交流能够让你更快地学习新颖有创造性的东西。


**注：** 本文中用到的例子，使用的 Vim 版本是 7.4.52 。

### 1、 同时编辑多个文件

如果你是一名软件开发者或者把 Vim 作为主要的编辑器，那么可能很多时候你需要同时编辑多个文件。“紧跟（following）”是在同时编辑多个文件时可用的实用技巧。

不需要在多个 shell 界面中打开多个文件，你可以通过把多个文件的文件名作为 Vim 命令的参数从而在一个 shell 界面中打开多个文件。比如：

```
vim 文件1 文件2 文件3
```

第一个文件（例子中的文件1）将成为当前文件并被读入缓冲区。

在编辑器中，使用 `:next` 或 `:n` 命令来移动到下一个文件，使用 `:prev` 或 `:N` 命令返回上一个文件。如果想直接切换到第一个文件或最后一个文件，使用 `:bf` 和 `:bl` 命令。特别地，如果想打开另外的文件并编辑，使用 `:e` 命令并把文件名作为参数（如果该文件不在当前目录中则需要完整路径做为参数）。

任何时候如果需要列出当前打开的所有文件，使用 `:ls` 命令。看下面展示的屏幕截图。

 ![vim-ls](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-ls.png "vim-ls")

注意 ”%a” 表示文件在当前活动窗口，而 “#” 表示上一个活动窗口的文件。

### 2、 通过自动补全节约时间

想节约时间并提高效率吗？使用缩写吧。使用它们能够快速写出文件中多次出现、复杂冗长的词。在 Vim 中缩写命令写就是 `ab` 。

比如，当你运行下面的命令以后：

```
:ab asap as soon as possible
```

文件中出现的每一个 `asap` 都会被自动替换为 `as soon as possible` ，就像你自己输入的一样。

类似地，你可以使用缩写来更正常见的输入错误。比如，下面的命令

```
:ab recieve receive
```

将会自动更正拼写错误，就像你自己输入的一样。如果在一次特殊情况下你想阻止缩写展开或更正发生，那么你只需要在输入一个单词的最后一个字母以后按 `Ctrl + V` ，然后按空格键。

如果你想把刚才使用的缩写保存下来，从而当你下次使用 Vim 编辑器的时候可以再次使用，那么只需将完整的 `ab` 命令(没有起始的冒号)添加到　`/etc/vim/vimrc` 文件中。如果想删除某个缩写，你可以使用 `una` 命令。比如： `una asap` 。


### 3、 切分窗口便于复制/粘贴

有时，你需要从一个文件将一段代码或文本的一部分复制到另一个。当使用 GUI（图形界面）编辑器的时候，这很容易实现，但是当使用一个命令行编辑器的时候，这就变得比较困难并且很费时间。幸运的是， Vim 提供了一种高效、节约时间的方式来完成这件事。

打开两个文件中的一个然后切分 Vim 窗口来打开另一个文件。可以通过使用 `split` 命令并以文件名作为参数来完成这件事。比如：

```
:split test.c
```

上面的命令将分离窗口并打开文件 “test.c”

 ![vim-split](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-split.png "vim-split")

注意到 `split` 命令水平分离 Vim 窗口。如果你想垂直分离窗口，那么你可以使用 `vsplit` 命令。当同时打开了两个文件并从一个文件中复制好内容以后，按 `Ctrl + W` 切换到另一个文件，然后粘贴。

### 4、 保存一个没有权限的已编辑文件

有时候当你对一个文件做了大量更改以后才会意识到你对该文件仅有 `只读` 权限。

 ![vim-sudo](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-sudo.png "vim-sudo")

虽然把文件关闭，获取权限以后再重新打开是一种解决方法。但是如果你已经做了大量更改，这样做会很浪费时间，因为在这个过程中所有的更改都会丢失。 Vim 提供了一种方式来处理这种情况：你可以在编辑器中在保存文件前更改文件权限。命令是：

```
:w !sudo tee %
```

这个命令将会向你询问密码，就像在命令行中使用 `sudo` 一样，然后就能保存更改。

**一个相关的技巧**：在 Vim 中编辑一个文件的时候，如果想快速进入命令行提示符，可以在编辑器中运行 `:sh` 命令，从而你将进入一个交互的 shell 中。完成以后，运行 `exit` 命令可以快速回到 Vim 模式中。

### 5、 在复制/粘贴过程中保持缩进

大多数有经验的程序员在 Vim 上工作时都会启用自动缩进。虽然这是一个节约时间的做法，但是在粘贴一段已经缩进了的代码的时候会产生新的问题。比如，下图是我把一段已缩进代码粘贴到一个在自动缩进的 Vim 编辑器中打开的文件中时遇到的问题：

 ![vim-indentation](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-indentation.png "vim-indentation")

这个问题的解决方法是 `pastetoggle` 选项。在 `/etc/vim/vimrc` 文件中加入下面这行内容：

```
set pastetoggle=<F2>
```

然后当你在 `插入` 模式中准备粘贴代码前先按 `F2` 键，就不会再出现上图中的问题，这样会保留原始的缩进。注意，你可以用其他的任何键来代替 `F2`，如果它已经映射到了别的功能上。

### 结论

更进一步的提高你的 Vim 编辑器技巧的唯一方法是，在你日复一日的工作中使用命令行编辑器。留意那些耗时多的操作，然后尝试去寻找是否有编辑器命令可以很快地完成这个操作。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/

作者：[Himanshu Arora][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/himanshu/
[2]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/#comments
[3]:https://www.maketecheasier.com/start-with-vim-linux/
[4]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[5]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-for-experienced-users%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-for-experienced-users%2F&text=5+Vim+Tips+and+Tricks+for+Experienced+Users
[9]:mailto:?subject=5%20Vim%20Tips%20and%20Tricks%20for%20Experienced%20Users&body=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-for-experienced-users%2F
[10]:https://www.maketecheasier.com/enable-two-step-verification-apple-icloud-account/
[11]:https://www.maketecheasier.com/mistakes-wordpress-user-should-avoid/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343
