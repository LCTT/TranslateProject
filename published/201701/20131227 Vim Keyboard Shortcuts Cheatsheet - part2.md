Vim 快捷键速查表
============================================================


 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2013/12/vim-shortcut-cheatsheet-featured.jpg "Vim Keyboard Shortcuts Cheatsheets") 

本文是 [Vim 用户指南][12] 系列的其中一篇：

*   [Vim 初学者入门指南][3]
*   Vim 快捷键速查表
*   [5 个针对有经验用户的 Vim 技巧][4]
*   [3 个针对高级用户的 Vim 编辑器实用技巧][5]

Vim 编辑器是一个基于命令行的工具，是传奇编辑器 vi 的增强版。尽管图形界面的富文本编辑有很多，但是熟悉 Vim 对于每一位 Linux 的使用者都能有所帮助——无论你是经验丰富的系统管理员，还是刚上手树莓派的新手用户。

这个轻量级的编辑器是个非常强大的工具。在有经验的使用者手中，它能完成不可思议的任务。除了常规的文本编辑功能以外，它还支持一些进阶特性。例如，基于正则表达式的搜索和替换、编码转换，以及语法高亮、代码折叠等的编程特性。

使用 Vim 时有一个非常重要的一点需要注意，那就是按键的功能取决于编辑器当前的“模式”。例如，在“普通模式”输入字母`j`时，光标会向下移动一行。而当你在“插入模式”下输入字符，则只是正常的文字录入。

下面就是速查表，以便于你充分利用 Vim。

### 基本操作

| 快捷键 | 功能 |
| --- | --- |
| `Esc` | 从当前模式转换到“普通模式”。所有的键对应到命令。 |
| `i` | “插入模式”用于插入文字。回归按键的本职工作。 |
| `:` | “命令行模式” Vim 希望你输入类似于保存该文档命令的地方。 |


### 方向键

| 快捷键 | 功能 |
| --- | --- |
| `h` | 光标向左移动一个字符 |
| `j` 或 `Ctrl + J` | 光标向下移动一行 |
| `k` 或 `Ctrl + P` | 光标向上移动一行 |
| `l` | 光标向右移动一个字符 |
| `0` | （数字 0）移动光标至本行开头 |
| `$` | 移动光标至本行末尾 |
| `^` | 移动光标至本行第一个非空字符处 |
| `w` | 向前移动一个词 （上一个字母和数字组成的词之后） |
| `W` | 向前移动一个词 （以空格分隔的词） |
| `5w` | 向前移动五个词 |
| `b` | 向后移动一个词 （下一个字母和数字组成的词之前） |
| `B` | 向后移动一个词 （以空格分隔的词） |
| `5b` | 向后移动五个词 |
| `G` | 移动至文件末尾 |
| `gg` | 移动至文件开头 |


### 浏览文档

| 快捷键 | 功能 |
| --- | --- |
| `(` | 跳转到上一句 |
| `)` | 跳转到下一句 |
| `{` | 跳转到上一段 |
| `}` | 跳转到下一段 |
| `[[` | 跳转到上一部分 |
| `]]` | 跳转到下一部分 |
| `[]` | 跳转到上一部分的末尾 |
| `][` | 跳转到上一部分的开头 |


### 插入文本

| 快捷键 | 功能 |
| --- | --- |
| `a` | 在光标后插入文本 |
| `A` | 在行末插入文本 |
| `i` | 在光标前插入文本 |
| `o` | （小写字母 o）在光标下方新开一行 |
| `O` | （大写字母 O）在光标上方新开一行 |



### 特殊插入

| 快捷键 | 功能 |
| --- | --- |
| `:r [filename]` | 在光标下方插入文件 [filename] 的内容 |
| `:r ![command]` | 执行命令 [command] ，并将输出插入至光标下方 |



### 删除文本

| 快捷键 | 功能 |
| --- | --- |
| `x` | 删除光标处字符 |
| `dw` | 删除一个词 |
| `d0` | 删至行首 |
| `d$` | 删至行末 |
| `d)` | 删至句末 |
| `dgg` | 删至文件开头 |
| `dG` | 删至文件末尾 |
| `dd` | 删除该行 |
| `3dd` | 删除三行 |

### 简单替换文本

| 快捷键 | 功能 |
| --- | --- |
| `r{text}` | 将光标处的字符替换成 {text} |
| `R` | 进入覆写模式，输入的字符将替换原有的字符 |

### 复制/粘贴文本

| 快捷键 | 功能 |
| --- | --- |
| `yy` | 复制当前行至存储缓冲区 |
| `["x]yy` | 复制当前行至寄存器 x |
| `p` | 在当前行之后粘贴存储缓冲区中的内容 |
| `P` | 在当前行之前粘贴存储缓冲区中的内容 |
| `["x]p` | 在当前行之后粘贴寄存器 x 中的内容 |
| `["x]P` | 在当前行之前粘贴寄存器 x 中的内容 |

### 撤销/重做操作

| 快捷键 | 功能 |
| --- | --- |
| `u` | 撤销最后的操作 |
| `Ctrl+r` | 重做最后撤销的操作 |

### 搜索和替换

| 快捷键 | 功能 |
| --- | --- |
| `/search_text` | 检索文档，在文档后面的部分搜索 search_text |
| `?search_text` | 检索文档，在文档前面的部分搜索 search_text |
| `n` | 移动到后一个检索结果 |
| `N` | 移动到前一个检索结果 |
| `:%s/original/replacement` | 检索第一个 “original” 字符串并将其替换成 “replacement” |
| `:%s/original/replacement/g` | 检索并将所有的 “original” 替换为 “replacement” |
| `:%s/original/replacement/gc` | 检索出所有的 “original” 字符串，但在替换成 “replacement” 前，先询问是否替换 |

### 书签

| 快捷键 | 功能 |
| --- | --- |
| `m {a-zA-Z}` | 在当前光标位置设置书签，书签名可用一个大小写字母（{a-zA-Z}） |
| `:marks` | 列出所有书签 |
| `{a-zA-Z}` | 跳转到书签 {a-zA-Z} |


### 选择文本

| 快捷键 | 功能 |
| --- | --- |
| `v` | 进入逐字可视模式 |
| `V` | 进入逐行可视模式 |
| `Esc` | 退出可视模式 |


### 改动选中文本

| 快捷键 | 功能 |
| --- | --- |
| `~` | 切换大小写 |
| `d` | 删除一个词 |
| `c` | 变更 |
| `y` | 复制 |
| `>` | 右移 |
| `<` | 左移 |
| `!` | 通过外部命令进行过滤 |


### 保存并退出

| 快捷键 | 功能 |
| --- | --- |
| `:q` | 退出 Vim，如果文件已被修改，将退出失败 |
| `:w` | 保存文件 |
| `:w new_name` | 用 new_name 作为文件名保存文件 |
| `:wq` | 保存文件并退出 Vim |
| `:q!` | 退出 Vim，不保存文件改动 |
| `ZZ` | 退出 Vim，如果文件被改动过，保存改动内容 |
| `ZQ` | 与 :q! 相同，退出 Vim，不保存文件改动 |

### 下载 Vim 快捷键速查表

仅仅是这样是否还不足以满足你？别担心，我们已经为你整理好了一份下载版的速查表，以备不时之需。

[点此下载（英文）][14]

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/

作者：[Himanshu Arora][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/mayank/
[2]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/#comments
[3]:https://linux.cn/article-8143-1.html
[4]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[5]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-keyboard-shortcuts-cheatsheet%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-keyboard-shortcuts-cheatsheet%2F&text=Vim+Keyboard+Shortcuts+Cheatsheet
[9]:mailto:?subject=Vim%20Keyboard%20Shortcuts%20Cheatsheet&body=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-keyboard-shortcuts-cheatsheet%2F
[10]:https://www.maketecheasier.com/locate-system-image-tool-in-windows-81/
[11]:https://www.maketecheasier.com/create-system-image-in-windows8/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343
[14]:http://www.maketecheasier.com/cheatsheet/vim-keyboard-shortcuts-cheatsheet/
