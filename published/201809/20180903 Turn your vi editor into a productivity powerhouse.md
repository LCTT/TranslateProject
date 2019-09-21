增强 Vim 编辑器，提高编辑效率
======
> 这 20 多个有用的命令可以增强你使用 Vi 的体验。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk)

*编者注：标题和文章最初称呼的 `vi` 编辑器，现已更新为编辑器的正确名称：`Vim`。*

`Vim` 作为一款功能强大、选项丰富的编辑器，为许多用户所热爱。本文介绍了一些在 `Vim` 中默认未启用但实际非常有用的选项。虽然可以在每个 `Vim` 会话中单独启用，但为了创建一个开箱即用的高效编辑环境，还是建议在 `Vim` 的配置文件中配置这些命令。

### 开始前的准备

这里所说的选项或配置均位于用户主目录中的 `Vim` 启动配置文件 `.vimrc`。 按照下面的说明在 `.vimrc` 中设置选项：

（注意：`vimrc` 文件也用于 `Linux` 中的全局配置，如 `/etc/vimrc` 或 `/etc/vim/vimrc`。本文所说的 `.vimrc` 均是指位于用户主目录中的 `.vimrc` 文件。）

Linux 系统中：

  * 用 `Vim` 打开 `.vimrc` 文件： `vim ~/.vimrc`
  * 复制本文最后的 `选项列表` 粘贴到 `.vimrc` 文件
  * 保存并关闭 (`:wq`)

（LCTT 译注：此处不建议使用 `Vim` 编辑 `.vimrc` 文件，因为很可能无法粘贴成功，可以选择 `gedit` 编辑器编辑 `.vimrc` 文件。）

Windows 系统中：

  * 首先，[安装 gvim][1]
  * 打开 `gvim`
  * 单击 “编辑” -> “启动设置”，打开 `_vimrc` 文件
  * 复制本文最后的 “选项列表” 粘贴到 `_vimrc` 文件
  * 单击 “文件” -> “保存”

（LCTT 译注：此处应注意不要使用 `Windows` 自带的记事本编辑该 `_vimrc` 文件，否则可能会因为行结束符不同而导致问题。）

下面，我们将深入研究提高 `Vim` 编辑效率的选项。主要分为以下几类：

  1. 缩进 & 制表符
  2. 显示 & 格式化
  3. 搜索
  4. 浏览 & 滚动
  5. 拼写
  6. 其他选项

### 1. 缩进 & 制表符

使 `Vim` 在创建新行的时候使用与上一行同样的缩进：

```vim
set autoindent
```

创建新行时使用智能缩进，主要用于 `C` 语言一类的程序。通常，打开 `smartindent` 时也应该打开 `autoindent`：

```vim
set smartindent
```

注意：`Vim` 具有语言感知功能，且其默认设置可以基于文件中的编程语言来改变配置以提高效率。有许多默认的配置选项，包括 `axs cindent`，`cinoptions`，`indentexpr` 等，没有在这里说明。 `syn` 是一个非常有用的命令，用于设置文件的语法以更改显示模式。

（LCTT 译注：这里的 `syn` 是指 `syntax`，可用于设置文件所用的编程语言，开启对应的语法高亮，以及执行自动事件 (`autocmd`)。）

设置文件里的制表符 `(TAB)` 的宽度（以空格的数量表示）：

```vim
set tabstop=4
```

设置移位操作 `>>` 或 `<<` 的缩进长度（以空格的数量表示）：

```vim
set shiftwidth=4
```

如果你更喜欢在编辑文件时使用空格而不是制表符，设置以下选项可以使 `Vim` 在你按下 `Tab` 键时用空格代替制表符。 

```vim
set expandtab
```

注意：这可能会导致依赖于制表符的 `Python` 等编程语言出现问题。这时，你可以根据文件类型设置该选项（请参考 `autocmd`）。

### 2. 显示 & 格式化

要在每行的前面显示行号：

```vim
set number
```

![](https://opensource.com/sites/default/files/uploads/picture01.png)

要在文本行超过一定长度时自动换行：

```vim
set textwidth=80
```

要根据从窗口右侧向左数的列数来自动换行：

```vim
set wrapmargin=2
```

（LCTT 译注：如果 `textwidth` 选项不等于零，本选项无效。)

当光标遍历文件时经过括号时，高亮标识匹配的括号：

```vim
set showmatch
```

![](https://opensource.com/sites/default/files/uploads/picture02-03.jpg)

### 3. 搜索

高亮搜索内容的所有匹配位置：

```vim
set hlsearch
```

![](https://opensource.com/sites/default/files/uploads/picture04.png)

搜索过程中动态显示匹配内容：

```vim
set incsearch
```

![](https://opensource.com/sites/default/files/picture05.png)

搜索时忽略大小写：

```vim
set ignorecase
```

在打开 `ignorecase` 选项的条件下，搜索内容包含部分大写字符时，要使搜索大小写敏感：

```vim
set smartcase
```

例如，如果文件内容是：

```
test
Test
```

当打开 `ignorecase` 和 `smartcase` 选项时，搜索 `test` 时的突出显示：

> <font color=yellow>test</font>
> <font color=yellow>Test</font>

搜索 `Test` 时的突出显示：

> test
> <font color=yellow>Test</font>

### 4. 浏览 & 滚动

为获得更好的视觉体验，你可能希望将光标放在窗口中间而不是第一行，以下选项使光标距窗口上下保留 5 行。

```vim
set scrolloff=5
```

一个例子：

第一张图中 `scrolloff=0`，第二张图中 `scrolloff=5`。

![](https://opensource.com/sites/default/files/uploads/picture06-07.jpg)

提示：如果你没有设置选项 `nowrap`，那么设置 `sidescrolloff` 将非常有用。

在 `Vim` 窗口底部显示一个永久状态栏，可以显示文件名、行号和列号等内容：

```vim
set laststatus=2
```

![](https://opensource.com/sites/default/files/picture08.png)

### 5. 拼写

`Vim` 有一个内置的拼写检查器，对于文本编辑和编码非常有用。`Vim` 可以识别文件类型并仅对代码中的注释进行拼写检查。使用下面的选项打开英语拼写检查：

```vim
set spell spelllang=en_us
```

（LCTT 译注：中文、日文或其它东亚语字符通常会在打开拼写检查时被标为拼写错误，因为拼写检查不支持这些语种，可以在 `spelllang` 选项中加入 `cjk` 来忽略这些错误标注。）

### 6. 其他选项

禁止创建备份文件：启用此选项后，`Vim` 将在覆盖文件前创建一个备份，文件成功写入后保留该备份。如果不想保留该备份文件，可以按下面的方式关闭：

```vim
set nobackup
```

禁止创建交换文件：启用此选项后，`Vim` 将在编辑该文件时创建一个交换文件。 交换文件用于在崩溃或发生使用冲突时恢复文件。交换文件是以 `.` 开头并以 `.swp` 结尾的隐藏文件。

```vim
set noswapfile
```

如果需要在同一个 `Vim` 窗口中编辑多个文件并进行切换。默认情况下，工作目录是打开的第一个文件的目录。而将工作目录自动切换到正在编辑的文件的目录是非常有用的。要自动切换工作目录：

```vim
set autochdir
```

`Vim` 自动维护编辑的历史记录，允许撤消更改。默认情况下，该历史记录仅在文件关闭之前有效。`Vim` 包含一个增强功能，使得即使在文件关闭后也可以维护撤消历史记录，这意味着即使在保存、关闭和重新打开文件后，也可以撤消之前的更改。历史记录文件是使用 `.un~` 扩展名保存的隐藏文件。

```vim
set undofile
```

错误信息响铃，只对错误信息起作用：

```vim
set errorbells
```

如果你愿意，还可以设置错误视觉提示：

```vim
set visualbell
```

### 惊喜

`Vim` 提供长格式和短格式命令，两种格式都可用于设置或取消选项配置。

`autoindent` 选项的长格式是：

```vim
set autoindent
```

`autoindent` 选项的短格式是：

```vim
set ai
```

要在不更改选项当前值的情况下查看其当前设置，可以在 `Vim` 的命令行上使用在末尾加上 `?` 的命令：

```vim
set autoindent?
```

在大多数选项前加上 `no` 前缀可以取消或关闭选项：

```vim
set noautoindent
```

可以为单独的文件配置选项，而不必修改全局配置文件。需要的话，请打开文件并输入 `:`，然后键入 `set`命令。这样的话，配置仅对当前的文件编辑会话有效。

![](https://opensource.com/sites/default/files/uploads/picture09.png)

使用命令行获取帮助：

```vim
:help autoindent
```

![](https://opensource.com/sites/default/files/uploads/picture10-11.jpg)

注意：此处列出的命令仅对 Linux 上的 Vim 7.4 版本和 Windows 上的 Vim 8.0 版本进行了测试。

这些有用的命令肯定会增强您的 `Vim` 使用体验。你会推荐哪些其他有用的命令?

### 选项列表

复制该选项列表粘贴到 `.vimrc` 文件中：

```vim
" Indentation & Tabs
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
" Display & format
set number
set textwidth=80
set wrapmargin=2
set showmatch
" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" Browse & Scroll
set scrolloff=5
set laststatus=2
" Spell
set spell spelllang=en_us
" Miscellaneous
set nobackup
set noswapfile
set autochdir
set undofile
set visualbell
set errorbells
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/vi-editor-productivity-powerhouse

作者：[Girish Managoli][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[idea2act](https://github.com/idea2act)
校对：[apemost](https://github.com/apemost), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gammay
[1]: https://www.vim.org/download.php#pc
