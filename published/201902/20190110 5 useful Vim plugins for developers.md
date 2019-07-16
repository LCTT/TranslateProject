[#]: collector: (lujun9972)
[#]: translator: (pityonline)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10563-1.html)
[#]: subject: (5 useful Vim plugins for developers)
[#]: via: (https://opensource.com/article/19/1/vim-plugins-developers)
[#]: author: (Ricardo Gerardi https://opensource.com/users/rgerardi)

5 个好用的开发者 Vim 插件
======

> 通过这 5 个插件扩展 Vim 功能来提升你的编码效率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

我用 Vim 已经超过 20 年了，两年前我决定把它作为我的首要文本编辑器。我用 Vim 来编写代码、配置文件、博客文章及其它任意可以用纯文本表达的东西。Vim 有很多超级棒的功能，一旦你适合了它，你的工作会变得非常高效。

在日常编辑工作中，我更倾向于使用 Vim 稳定的原生功能，但开源社区对 Vim 开发了大量的插件，可以扩展 Vim 的功能、改进你的工作流程和提升工作效率。

以下列举 5 个非常好用的可以用于编写任意编程语言的插件。

### 1、Auto Pairs

[Auto Pairs][2] 插件可以帮助你插入和删除成对的文字，如花括号、圆括号或引号。这在编写代码时非常有用，因为很多编程语言都有成对标记的语法，就像圆括号用于函数调用，或引号用于字符串定义。

Auto Pairs 最基本的功能是在你输入一个左括号时会自动补全对应的另一半括号。比如，你输入了一个 `[`，它会自动帮你补充另一半 `]`。相反，如果你用退格键删除开头的一半括号，Auto Pairs 会删除另一半。

如果你设置了自动缩进，当你按下回车键时 Auto Pairs 会在恰当的缩进位置补全另一半括号，这比你找到放置另一半的位置并选择一个正确的括号要省劲多了。

例如下面这段代码：

```
package main

import "fmt"

func main() {
    x := true
    items := []string{"tv", "pc", "tablet"}

    if x { 
        for _, i := range items
    } 
}
```

在 `items` 后面输入一个左花括号按下回车会产生下面的结果：

```
package main

import "fmt"

func main() {
    x := true
    items := []string{"tv", "pc", "tablet"}

    if x {
        for _, i := range items  {
            | (cursor here)
        }
    }
}
```

Auto Pairs 提供了大量其它选项（你可以在 [GitHub][3] 上找到），但最基本的功能已经很让人省时间了。

### 2、NERD Commenter

[NERD Commenter][4] 插件给 Vim 增加了代码注释的功能，类似在 <ruby>IDE<rt>integrated development environment</rt></ruby> 中注释功能。有了这个插件，你可以一键注释单行或多行代码。

NERD Commenter 可以与标准的 Vim [filetype][5] 插件配合，所以它能理解一些编程语言并使用合适的方式来注释代码。

最易上手的方法是按 `Leader+Space` 组合键来切换注释当前行。Vim 默认的 Leader 键是 `\`。

在<ruby>可视化模式<rt>Visual mode</rt></ruby>中，你可以选择多行一并注释。NERD Commenter 也可以按计数注释，所以你可以加个数量 n 来注释 n 行。

还有个有用的特性 “Sexy Comment” 可以用 `Leader+cs` 来触发，它的块注释风格更漂亮一些。例如下面这段代码：

```
package main

import "fmt"

func main() {
    x := true
    items := []string{"tv", "pc", "tablet"}

    if x {
        for _, i := range items {
            fmt.Println(i)
        }
    }
}
```

选择 `main` 函数中的所有行然后按下 `Leader+cs` 会出来以下注释效果：

```
package main

import "fmt"

func main() {
/*
 *    x := true
 *    items := []string{"tv", "pc", "tablet"}
 *
 *    if x {
 *        for _, i := range items {
 *            fmt.Println(i)
 *        }
 *    }
 */
}
```

因为这些行都是在一个块中注释的，你可以用 `Leader+Space` 组合键一次去掉这里所有的注释。

NERD Commenter 是任何使用 Vim 写代码的开发者都必装的插件。

### 3、VIM Surround

[Vim Surround][6] 插件可以帮你“环绕”现有文本插入成对的符号（如括号或双引号）或标签（如 HTML 或 XML 标签）。它和 Auto Pairs 有点儿类似，但是用于处理已有文本，在编辑文本时更有用。

比如你有以下一个句子：

```
"Vim plugins are awesome !"
```

当你的光标处于引起来的句中任何位置时，你可以用 `ds"` 组合键删除句子两端的双引号。

```
Vim plugins are awesome !
```

你也可以用 `cs"'` 把双端的双引号换成单引号：

```
'Vim plugins are awesome !'
```

或者再用 `cs'[` 替换成中括号：

```
[ Vim plugins are awesome ! ]
```

它对编辑 HTML 或 XML 文本中的<ruby>标签<rt>tag</rt></ruby>尤其在行。假如你有以下一行 HTML 代码：

```
<p>Vim plugins are awesome !</p>
```

当光标在 “awesome” 这个单词的任何位置时，你可以按 `ysiw<em>` 直接给它加上着重标签（`<em>`）：

```
<p>Vim plugins are <em>awesome</em> !</p>
```

注意它聪明地加上了 `</em>` 闭合标签。

Vim Surround 也可以用 `ySS` 缩进文本并加上标签。比如你有以下文本：

```
<p>Vim plugins are <em>awesome</em> !</p>
```

你可以用 `ySS<div class="normal">` 加上 `div` 标签，注意生成的段落是自动缩进的。

```
<div class="normal">
        <p>Vim plugins are <em>awesome</em> !</p>
</div>
```

Vim Surround 有很多其它选项，你可以参照 [GitHub][7] 上的说明尝试它们。

### 4、Vim Gitgutter

[Vim Gitgutter][8] 插件对使用 Git 作为版本控制工具的人来说非常有用。它会在 Vim 的行号列旁显示 `git diff` 的差异标记。假设你有如下已提交过的代码：

```
  1 package main
  2
  3 import "fmt"
  4
  5 func main() {
  6     x := true
  7     items := []string{"tv", "pc", "tablet"}
  8
  9     if x {
 10         for _, i := range items {
 11             fmt.Println(i)
 12         }
 13     }
 14 }
```

当你做出一些修改后，Vim Gitgutter 会显示如下标记：

```
    1 package main
    2
    3 import "fmt"
    4
_   5 func main() {
    6     items := []string{"tv", "pc", "tablet"}
    7
~   8     if len(items) > 0 {
    9         for _, i := range items {
   10             fmt.Println(i)
+  11             fmt.Println("------")
   12         }
   13     }
   14 }
```

`_` 标记表示在第 5 行和第 6 行之间删除了一行。`~` 表示第 8 行有修改，`+` 表示新增了第 11 行。

另外，Vim Gitgutter 允许你用 `[c` 和 `]c` 在多个有修改的块之间跳转，甚至可以用 `Leader+hs` 来暂存某个变更集。

这个插件提供了对变更的即时视觉反馈，如果你用 Git 的话，有了它简直是如虎添翼。

### 5、VIM Fugitive

[Vim Fugitive][9] 是另一个将 Git 工作流集成到 Vim 中的超棒插件。它对 Git 做了一些封装，可以让你在 Vim 里直接执行 Git 命令并将结果集成在 Vim 界面里。这个插件有超多的特性，更多信息请访问它的 [GitHub][10] 项目页面。

这里有一个使用 Vim Fugitive 的基础 Git 工作流示例。设想我们已经对下面的 Go 代码做出修改，你可以用 `:Gblame` 调用 `git blame` 来查看每行最后的提交信息：

```
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    1 package main
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    2
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    3 import "fmt"
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    4
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│_   5 func main() {
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    6     items := []string{"tv", "pc", "tablet"}
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    7
00000000 (Not Committed Yet 2018-12-05 18:55:00 -0500)│~   8     if len(items) > 0 {
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│    9         for _, i := range items {
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   10             fmt.Println(i)
00000000 (Not Committed Yet 2018-12-05 18:55:00 -0500)│+  11             fmt.Println("------")
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   12         }
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   13     }
e9949066 (Ricardo Gerardi   2018-12-05 18:17:19 -0500)│   14 }
```

可以看到第 8 行和第 11 行显示还未提交。用 `:Gstatus` 命令检查仓库当前的状态：

```
  1 # On branch master
  2 # Your branch is up to date with 'origin/master'.
  3 #
  4 # Changes not staged for commit:
  5 #   (use "git add <file>..." to update what will be committed)
  6 #   (use "git checkout -- <file>..." to discard changes in working directory)
  7 #
  8 #       modified:   vim-5plugins/examples/test1.go
  9 #
 10 no changes added to commit (use "git add" and/or "git commit -a")
--------------------------------------------------------------------------------------------------------
    1 package main
    2
    3 import "fmt"
    4
_   5 func main() {
    6     items := []string{"tv", "pc", "tablet"}
    7
~   8     if len(items) > 0 {
    9         for _, i := range items {
   10             fmt.Println(i)
+  11             fmt.Println("------")
   12         }
   13     }
   14 }
```

Vim Fugitive 在分割的窗口里显示 `git status` 的输出结果。你可以在该行按下 `-` 键用该文件的名字暂存这个文件的提交，再按一次 `-` 可以取消暂存。这个信息会随着你的操作自动更新：

```
  1 # On branch master
  2 # Your branch is up to date with 'origin/master'.
  3 #
  4 # Changes to be committed:
  5 #   (use "git reset HEAD <file>..." to unstage)
  6 #
  7 #       modified:   vim-5plugins/examples/test1.go
  8 #
--------------------------------------------------------------------------------------------------------
    1 package main
    2
    3 import "fmt"
    4
_   5 func main() {
    6     items := []string{"tv", "pc", "tablet"}
    7
~   8     if len(items) > 0 {
    9         for _, i := range items {
   10             fmt.Println(i)
+  11             fmt.Println("------")
   12         }
   13     }
   14 }
```

现在你可以用 `:Gcommit` 来提交修改了。Vim Fugitive 会打开另一个分割窗口让你输入提交信息：

```
  1 vim-5plugins: Updated test1.go example file
  2 # Please enter the commit message for your changes. Lines starting
  3 # with '#' will be ignored, and an empty message aborts the commit.
  4 #
  5 # On branch master
  6 # Your branch is up to date with 'origin/master'.
  7 #
  8 # Changes to be committed:
  9 #       modified:   vim-5plugins/examples/test1.go
 10 #
```

按 `:wq` 保存文件完成提交：

```
[master c3bf80f] vim-5plugins: Updated test1.go example file
 1 file changed, 2 insertions(+), 2 deletions(-)
Press ENTER or type command to continue
```

然后你可以再用 `:Gstatus` 检查结果并用 `:Gpush` 把新的提交推送到远程。

```
  1 # On branch master
  2 # Your branch is ahead of 'origin/master' by 1 commit.
  3 #   (use "git push" to publish your local commits)
  4 #
  5 nothing to commit, working tree clean
```

Vim Fugitive 的 GitHub 项目主页有很多屏幕录像展示了它的更多功能和工作流，如果你喜欢它并想多学一些，快去看看吧。

### 接下来？

这些 Vim 插件都是程序开发者的神器！还有另外两类开发者常用的插件：自动完成插件和语法检查插件。它些大都是和具体的编程语言相关的，以后我会在一些文章中介绍它们。

你在写代码时是否用到一些其它 Vim 插件？请在评论区留言分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/vim-plugins-developers

作者：[Ricardo Gerardi][a]
选题：[lujun9972][b]
译者：[pityonline](https://github.com/pityonline)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgerardi
[b]: https://github.com/lujun9972
[1]: https://www.vim.org/
[2]: https://www.vim.org/scripts/script.php?script_id=3599
[3]: https://github.com/jiangmiao/auto-pairs
[4]: https://github.com/scrooloose/nerdcommenter
[5]: http://vim.wikia.com/wiki/Filetype.vim
[6]: https://www.vim.org/scripts/script.php?script_id=1697
[7]: https://github.com/tpope/vim-surround
[8]: https://github.com/airblade/vim-gitgutter
[9]: https://www.vim.org/scripts/script.php?script_id=2975
[10]: https://github.com/tpope/vim-fugitive
