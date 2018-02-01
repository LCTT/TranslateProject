使用 Vi/Vim 编辑器：高级概念
======

早些时候我们已经讨论了一些关于 VI/VIM 编辑器的基础知识，但是 VI 和 VIM 都是非常强大的编辑器，还有很多其他的功能可以和编辑器一起使用。在本教程中，我们将学习 VI/VIM 编辑器的一些高级用法。

（**推荐阅读**：[使用 VI 编辑器：基础知识] [1]）

### 使用 VI/VIM 编辑器打开多个文件

要打开多个文件，命令将与打开单个文件相同。我们只要添加第二个文件的名称。

```
 $ vi file1 file2 file 3
```

要浏览到下一个文件，我们可以（在 vim 命令模式中）使用：

```
:n
```

或者我们也可以使用

```
:e filename
```

### 在编辑器中运行外部命令

我们可以在 vi 编辑器内部运行外部的 Linux/Unix 命令，也就是说不需要退出编辑器。要在编辑器中运行命令，如果在插入模式下，先返回到命令模式，我们使用 BANG 也就是 `!` 接着是需要使用的命令。运行命令的语法是：

```
:! command
```

这是一个例子：

```
:! df -H
```

### 根据模板搜索

要在文本文件中搜索一个单词或模板，我们在命令模式下使用以下两个命令：

* 命令 `/` 代表正向搜索模板
* 命令 `?` 代表正向搜索模板

这两个命令都用于相同的目的，唯一不同的是它们搜索的方向。一个例子是：

如果在文件的开头向前搜索，

```
:/ search pattern 
```

如果在文件末尾向后搜索，

```
:? search pattern
``` 

### 搜索并替换一个模式

我们可能需要搜索和替换我们的文本中的单词或模式。我们不是从整个文本中找到单词的出现的地方并替换它，我们可以在命令模式中使用命令来自动替换单词。使用搜索和替换的语法是：

```
:s/pattern_to_be_found/New_pattern/g
```

假设我们想要将单词 “alpha” 用单词 “beta” 代替，命令就是这样：

```
:s/alpha/beta/g
```

如果我们只想替换第一个出现的 “alpha”，那么命令就是：

```
$ :s/alpha/beta/
```

### 使用 set 命令

我们也可以使用 set 命令自定义 vi/vim 编辑器的行为和外观。下面是一些可以使用 set 命令修改 vi/vim 编辑器行为的选项列表：

```
:set ic  ' 在搜索时忽略大小写

:set smartcase ' 搜索强制区分大小写

:set nu ' 在每行开始显示行号

:set hlsearch ' 高亮显示匹配的单词

:set ro ' 将文件类型更改为只读

:set term ' 打印终端类型

:set ai ' 设置自动缩进

:set noai ' 取消自动缩进
```

其他一些修改 vi 编辑器的命令是：

```
:colorscheme ' 用来改变编辑器的配色方案 。（仅适用于 VIM 编辑器）

:syntax on ' 为 .xml、.html 等文件打开颜色方案。（仅适用于VIM编辑器）
```

这篇结束了本系列教程，请在下面的评论栏中提出你的疑问/问题或建议。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/working-vivim-editor-advanced-concepts/

作者：[Shusain][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/working-vi-editor-basics/
