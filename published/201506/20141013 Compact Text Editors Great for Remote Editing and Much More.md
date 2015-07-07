适合于远程编辑以及更多环境的简洁文本编辑器
================================================================================
文本编辑器是用来编辑纯文本的软件。这种软件有许多用处，包括修改配置文件，编写程序源代码，记下一些想法或者甚至写一份购物列表。由于这种编辑器能都用于许多不同的方面，因此值得花些时间找一个最适合您喜好的编辑器。

不论编辑器有多么复杂，它们通常有一个共同的功能集，包括查找/替换文本，格式化文本，导入文件以及在文件中移动文本。

所有这些文本编辑器都是基于终端的应用，因此他们很适合在远程主机上编辑文件。文本编辑器通常也会提供一个图形化的用户界面，但依旧会保证快速和精简。

基于终端的应用程序在系统资源方面也是轻量级的（在低配置机器上很有用），比起它的图形化版本来也会更快、更高效，由于它们在X需要重启时也不会停止工作，因此非常适合编写脚本。

我选择了一些我最喜欢的开源文本编辑器，他们在使用系统资源方面都非常节俭。



### Textadept ###

![](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Textadept.png)

Textadept是一款适合程序员的，快速、精简、可扩展、跨平台的开源文本编辑器。这个开源程序由C和Lua写就，并且于这些年间在速度和精简方面进行了优化。

Textadept是那些想要无限的扩展性且不愿牺牲速度或屈服于代码膨胀的程序员们的理想编辑器。

它也有一个用于终端的版本，仅仅依赖ncurses，适合在远程主机上进行编辑。

#### 功能包括: ####

- 轻量级
- 精简设计以最大化利用屏幕
- 自包含的执行文件 - 无需安装
- 全键盘驱动
- 无限制的分割视图（GUI版本），以您所好任意水平或垂直的分割编辑器窗口。请注意Textadep不是一个选项卡式的编辑器。
- 支持多达80种的编程语言
- 强大的代码片段和快捷键命令
- 代码自动补全和API查询
- 无与伦比的扩展性
- 书签
- 查找和替换
- 在文件中查找
- 基于缓存的单词补全
- 成熟的编程语言符号自动补全，以及显示API文档的功能
- 主题：亮色、暗色、终端
- 使用词法分析器将名称放到缓冲中，如评论、字符串、关键词
- 支持会话
- 快速打开
- 许多可用的模块，包括对Java、Python、Ruby和近期打开文件列表的支持
- 符合Gnome HIG用户接口的指导
- 支持编辑Lua代码。许多Textadept对象和Lua的标准库支持语法自动补全和LuaDoc。

---

- 网址: [foicica.com/textadept][1]
- 开发者: Mitchell and contributors
- 许可证: MIT License
- 版本号: 7.7


### Vim ###

![](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-vim.png)

vim是一个高级的文本编辑器，它在'vi'强大的基础上，并拥有更全面的功能集。

这个编辑器对编程和编辑其他纯ASCII的文件十分有用。所有的命令都由普通的键盘按键提供，能够使用十指来输入，因而十分快捷。另外，功能键可以由用户来定义，并且可也以使用鼠标。

Vim通常被称作"程序员的编辑器"，它十分适合于编程，并被认为可以作为完整的集成开发环境。然而，这个软件并不是仅仅面向程序员。Vim适合于各种文本编辑，从编写email到修改配置文件。

Vim的界面基于文本界面下的命令行。尽管它的图形化版本gVim为常用的命令添加了菜单和工具栏，但这个软件的整个功能依旧依赖于它的命令行模式。

#### 功能包括: ####

- 3 种模式:
	- 命令模式
	- 插入模式
	- 命令行模式
- 无限制的撤销
- 多个窗口和缓冲区
- 平滑的插入模式
- 根据所编辑的文件的类型使用不同的颜色或风格进行语法高亮
- 交互命令
	- 标记一行
	- vi 行缓冲
	- 移动代码块
- 块操作
- 命令行历史
- 扩展的正则表达式
- 可编辑压缩/打包文件 (gzip, bzip2, zip, tar)
- 文件名补全
- 标记跳转
- 折叠文本
- 缩进
- ctags和cscope整合
- 100%与vi的模式兼容
- 插件用于添加/扩展功能
- 宏
- vimscript, Vim的内部脚本
- Unicode支持
- 多语言支持
- 在线帮助支持

---

- 网址: [www.vim.org][2]
- 开发者: Bram Moolenaar
- 许可证: GNU GPL compatible (charityware)
- 版本号: 7.4



### ne ###

![](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-ne.png)

ne是一款全屏幕的开源文本编辑器。它像是一个比vi更容易学习的vi替代物，并且可以在POSIX-兼容的系统中便携使用。

ne对于新手来说易于使用，但也非常强大并有完全可配置的引导程序，并且在资源使用上十分节约。

#### 功能包括: ####

- 三种用户界面： 控制键，命令行、菜单；按键和菜单都可配置
- 语法高亮
- 对于UTF-8文件的完全支持，包括占据多列的字符（宽字符）
- 文档，剪切块，显示的维度和文件/行号长度都有编号，并且仅受制于机器的整型字长
- 简单的脚本语言，脚本可以用简单易理解的录制/播放的方式制作
- 无限制的撤销/重做功能（可以通过命令禁用）
- 基于被编辑的文件扩展名的自动个性化配置系统
- 使用您文档中的词语做字典来进行自动前缀补全
- 易用的文件存取功能
- 扩展的正则表达式可用于查找和替换，类似emacs和vi
- 非常紧凑的内存模型，在加载和修改大型文件时十分快速
- 可编辑二进制文件

---

- 网址: [ne.di.unimi.it][3]
- 开发者: Sebastiano Vigna (original developer). Additional features added by Todd M. Lewis
- 许可证: GNU GPL v3
- 版本号: 2.5

----------

### Zile ###

![](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Zile.png)

Zile（Zile Is Lossy Emacs，Emacs精简版），它是一个小型的Emacs的克隆版。Zile是一个可定制的，自文档化，实时显示的编辑器，Zile被开发的尽可能像Emacs一样，每个Emacs用户都会对Zile感到亲切。

Zile以它极小的RAM用量，大约130KB，以及快速开始编辑而闻名。它是支持8比特字符集的，允许用于编写任何种类的文件。

#### 功能包括:  ####

- 小型但快速、强大
- 多个缓冲区，允许多级的撤销
- 多窗口
- 以最小的缓冲区完成补全
- 自动填充 (自动换行)
- Registers
- 看起来像Emacs，键序列、功能和变量名都与Emacs相同
- Killing
- Yanking
- 自动行末检测

---

- 网址: [www.gnu.org/software/zile][4]
- 开发者: Reuben Thomas, Sandro Sigala, David A. Capello
- 许可证: GNU GPL v2
- 版本号: 2.4.11



### nano ###

![](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-nano.png)

nano是基于curses库的文本编辑器。它是Pico（Pine电子邮件客户端编辑器）的一个复刻版。

由于Pine套件的许可证问题诉讼案（Pine并未以开源许可证发布），并且也因为Pine缺少一些重要的功能，nano项目于1999年发起。

nano致力于赶上Pico的功能和其易用性，与此同时提供更多的功能，但不集成Pine/Pico的邮件客户端。

nano像Pico一样是以键盘为导向的设计，可以用控制键来控制。

#### 功能包括:  ####

- 交互式的查找和替换
- 彩色语法高亮
- 转到行号和列号处
- 自动缩进
- 功能开关
- 支持UTF-8
- 混合型的文件类型自动转换
- 逐字输入模式
- 多个文件缓冲区
- 平滑滚动
- 括号匹配
- 自定义引用字符串
- 备份文件
- 国际化支持
- tab补全文件名

---

- 网址: [nano-editor.org][5]
- 开发者: Chris Allegretta, David Lawrence, Jordi Mallach, Adam Rogoyski, Robert Siemborski, Rocco Corsi, David Benbennick, Mike Frysinger
- 许可证: GNU GPL v3
- 版本号: 2.2.6

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20141011073917230/TextEditors.html

作者：Frazer Kline
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://foicica.com/textadept/
[2]:http://www.vim.org/
[3]:http://ne.di.unimi.it/
[4]:http://www.gnu.org/software/zile/
[5]:http://nano-editor.org/
