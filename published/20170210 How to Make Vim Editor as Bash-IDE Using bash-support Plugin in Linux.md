在 Linux 如何用 bash-support 插件将 Vim 编辑器打造成一个 Bash-IDE
============================================================

IDE（[集成开发环境][1]）就是这样一个软件，它为了最大化程序员生产效率，提供了很多编程所需的设施和组件。 IDE 将所有开发工作集中到一个程序中，使得程序员可以编写、修改、编译、部署以及调试程序。

在这篇文章中，我们会介绍如何通过使用 bash-support vim 插件将 [Vim 编辑器安装和配置][2] 为一个 Bash-IDE。

#### 什么是 bash-support.vim 插件？

bash-support 是一个高度定制化的 vim 插件，它允许你插入：文件头、补全语句、注释、函数、以及代码块。它也使你可以进行语法检查、使脚本可执行、一键启动调试器；而完成所有的这些而不需要关闭编辑器。

它使用快捷键（映射），通过有组织地、一致的文件内容编写/插入，使得 bash 脚本变得有趣和愉快。

插件当前版本是 4.3，4.0 版本 重写了之前的 3.12.1 版本，4.0 及之后的版本基于一个全新的、更强大的、和之前版本模板语法不同的模板系统。 

### 如何在 Linux 中安装 Bash-support 插件

用下面的命令下载最新版本的 bash-support 插件：

```
$ cd Downloads
$ curl http://www.vim.org/scripts/download_script.php?src_id=24452 >bash-support.zip
```

按照如下步骤安装；在你的主目录创建 `.vim` 目录（如果它不存在的话），进入该目录并提取 bash-support.zip 内容： 

```
$ mkdir ~/.vim
$ cd .vim
$ unzip ~/Downloads/bash-support.zip
```

下一步，在 `.vimrc` 文件中激活它：

```
$ vi ~/.vimrc
```

并插入下面一行：

```
filetype plug-in on   
set number   # 可选，增加这行以在 vim 中显示行号
```

### 如何在 Vim 编辑器中使用 Bash-support 插件

为了简化使用，通常使用的结构和特定操作可以分别通过键映射来插入/执行。 `~/.vim/doc/bashsupport.txt` 和 `~/.vim/bash-support/doc/bash-hotkeys.pdf` 或者 `~/.vim/bash-support/doc/bash-hotkeys.tex` 文件中介绍了映射。

**重要：**

1.	所有映射（`(\)+charater(s)` 组合）都是针对特定文件类型的：为了避免和其它插件的映射冲突，它们只适用于 `sh` 文件。
2.	使用键映射的时候打字速度也有关系，引导符 `('\')` 和后面字符的组合要在特定短时间内才能识别出来（很可能少于 3 秒 - 基于假设）。

下面我们会介绍和学习使用这个插件一些显著的功能：

#### 如何为新脚本自动生成文件头

看下面的示例文件头，为了要在你所有的新脚本中自动创建该文件头，请按照以下步骤操作。

[
 ![脚本示例文件头选项](http://www.tecmint.com/wp-content/uploads/2017/02/Script-Header-Options.png) 
][3]

*脚本示例文件头选项*

首先设置你的个人信息（作者名称、作者参考、组织、公司等）。在一个 Bash 缓冲区（像下面这样打开一个测试脚本）中使用映射 `\ntw` 启动模板设置向导。

选中选项 1 设置个性化文件，然后按回车键。

```
$ vi test.sh
```

[
 ![在脚本文件中设置个性化信息](http://www.tecmint.com/wp-content/uploads/2017/02/Set-Personalization-in-Scripts.png) 
][4]

*在脚本文件中设置个性化信息*

之后，再次输入回车键。然后再一次选中选项 1 设置个性化文件的路径并输入回车。

[
 ![设置个性化文件路径](http://www.tecmint.com/wp-content/uploads/2017/02/Set-Personalization-File-Location.png) 
][5]

*设置个性化文件路径*

设置向导会把目标文件 `.vim/bash-support/rc/personal.templates` 拷贝到 `.vim/templates/personal.templates`，打开并编辑它，在这里你可以输入你的信息。

按 `i` 键像截图那样在单引号中插入合适的值。 

[
 ![在脚本文件头添加信息](http://www.tecmint.com/wp-content/uploads/2017/02/Add-Info-in-Script-Header.png) 
][6]

*在脚本文件头添加信息*

一旦你设置了正确的值，输入 `:wq` 保存并退出文件。关闭 Bash 测试脚本，打开另一个脚本来测试新的配置。现在文件头中应该有和下面截图类似的你的个人信息：

```
$ test2.sh
```
[
 ![自动添加文件头到脚本](http://www.tecmint.com/wp-content/uploads/2017/02/Auto-Adds-Header-to-Script.png) 
][7]

*自动添加文件头到脚本*

#### 添加 Bash-support 插件帮助信息

为此，在 Vim 命令行输入下面的命令并按回车键，它会创建 `.vim/doc/tags` 文件：

```
:helptags $HOME/.vim/doc/
```

[
 ![在 Vi 编辑器添加插件帮助](http://www.tecmint.com/wp-content/uploads/2017/02/Add-Plugin-Help-in-Vi-Editor.png) 
][8]

*在 Vi 编辑器添加插件帮助*

#### 如何在 Shell 脚本中插入注释

要插入一个块注释，在普通模式下输入 `\cfr`：

[
 ![添加注释到脚本](http://www.tecmint.com/wp-content/uploads/2017/02/Add-Comments-to-Scripts.png) 
][9]

*添加注释到脚本*

#### 如何在 Shell 脚本中插入语句

下面是一些用于插入语句的键映射（`n` – 普通模式, `i` – 插入模式，`v` 可视模式）：

1.  `\sc` – `case in … esac` （n, i）
2.  `\sei` – `elif then` （n, i）
3.  `\sf` – `for in do done` （n, i, v）
4.  `\sfo` – `for ((…)) do done` （n, i, v）
5.  `\si` – `if then fi` （n, i, v）
6.  `\sie` – `if then else fi` （n, i, v）
7.  `\ss` – `select in do done` （n, i, v）
8.  `\su` – `until do done` （n, i, v）
9.  `\sw` – `while do done` （n, i, v）
10.  `\sfu` – `function` （n, i, v）
11.  `\se` – `echo -e "…"` （n, i, v）
12.  `\sp` – `printf "…"` （n, i, v）
13.  `\sa` – 数组元素, `${.[.]}` （n, i, v） 和其它更多的数组功能。

#### 插入一个函数和函数头

输入 `\sfu` 添加一个新的空函数，然后添加函数名并按回车键创建它。之后，添加你的函数代码。

[
 ![在脚本中插入新函数](http://www.tecmint.com/wp-content/uploads/2017/02/Insert-New-Function-in-Script.png) 
][10]

*在脚本中插入新函数*

为了给上面的函数创建函数头，输入 `\cfu`，输入函数名称，按回车键并填入合适的值（名称、介绍、参数、返回值）：

[
 ![在脚本中创建函数头](http://www.tecmint.com/wp-content/uploads/2017/02/Insert-New-Function-in-Script.png) 
][11]

*在脚本中创建函数头*

#### 更多关于添加 Bash 语句的例子

下面是一个使用 `\si` 插入一条 `if` 语句的例子：

[
 ![在脚本中插入语句](http://www.tecmint.com/wp-content/uploads/2017/02/Add-Insert-Statement-to-Script.png) 
][12]

*在脚本中插入语句*

下面的例子显示使用 `\se` 添加一条 `echo` 语句：

[
 ![在脚本中添加 echo 语句](http://www.tecmint.com/wp-content/uploads/2017/02/Add-echo-Statement-to-Script.png) 
][13]

*在脚本中添加 echo 语句*

#### 如何在 Vi 编辑器中使用运行操作

下面是一些运行操作键映射的列表：

1.  `\rr` – 更新文件，运行脚本（n, i）
2.  `\ra` – 设置脚本命令行参数 （n, i）
3.  `\rc` – 更新文件，检查语法 （n, i）
4.  `\rco` – 语法检查选项 （n, i）
5.  `\rd` – 启动调试器（n, i）
6.  `\re` – 使脚本可/不可执行(*) （n, i）

#### 使脚本可执行

编写完脚本后，保存它然后输入 `\re` 和回车键使它可执行。

[
 ![使脚本可执行](http://www.tecmint.com/wp-content/uploads/2017/02/make-script-executable.png) 
][14]

*使脚本可执行*

#### 如何在 Bash 脚本中使用预定义代码片段

预定义代码片段是为了特定目的包含了已写好代码的文件。为了添加代码段，输入 `\nr` 和 `\nw` 读/写预定义代码段。输入下面的命令列出默认的代码段：

```
$ .vim/bash-support/codesnippets/
```

[
 ![代码段列表](http://www.tecmint.com/wp-content/uploads/2017/02/list-of-code-snippets.png) 
][15]

*代码段列表*

为了使用代码段，例如 free-software-comment，输入 `\nr` 并使用自动补全功能选择它的名称，然后输入回车键：

[
 ![添加代码段到脚本](http://www.tecmint.com/wp-content/uploads/2017/02/Add-Code-Snippet-to-Script.png) 
][16]

*添加代码段到脚本*

#### 创建自定义预定义代码段

可以在  `~/.vim/bash-support/codesnippets/` 目录下编写你自己的代码段。另外，你还可以从你正常的脚本代码中创建你自己的代码段：

1.	选择你想作为代码段的部分代码，然后输入  `\nw` 并给它一个相近的文件名。
2.	要读入它，只需要输入  `\nr` 然后使用文件名就可以添加你自定义的代码段。

#### 在当前光标处查看内建和命令帮助

要显示帮助，在普通模式下输入：

1.  `\hh` – 内建帮助
2.  `\hm` – 命令帮助

[
 ![查看内建命令帮助](http://www.tecmint.com/wp-content/uploads/2017/02/View-Built-in-Command-Help.png) 
][17]

*查看内建命令帮助*

更多参考资料，可以查看文件：

```
~/.vim/doc/bashsupport.txt  #在线文档的副本
~/.vim/doc/tags
```

- 访问 Bash-support 插件 GitHub 仓库：[https://github.com/WolfgangMehner/bash-support][18]
- 在 Vim 网站访问 Bash-support 插件：[http://www.vim.org/scripts/script.php?script_id=365][19]

就是这些啦，在这篇文章中，我们介绍了在 Linux 中使用 Bash-support 插件安装和配置 Vim 为一个 Bash-IDE 的步骤。快去发现这个插件其它令人兴奋的功能吧，一定要在评论中和我们分享哦。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 爱好者、Linux 系统管理员、网络开发人员，现在也是 TecMint 的内容创作者，她喜欢和电脑一起工作，坚信共享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-vim-as-bash-ide-using-bash-support-in-linux/

作者：[Aaron Kili][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/best-linux-ide-editors-source-code-editors/
[2]:http://www.tecmint.com/vi-editor-usage/
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Script-Header-Options.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Personalization-in-Scripts.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Personalization-File-Location.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Info-in-Script-Header.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Auto-Adds-Header-to-Script.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Plugin-Help-in-Vi-Editor.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Comments-to-Scripts.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/02/Insert-New-Function-in-Script.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Create-Header-Function-in-Script.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Insert-Statement-to-Script.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-echo-Statement-to-Script.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/02/make-script-executable.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/02/list-of-code-snippets.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/02/Add-Code-Snippet-to-Script.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/02/View-Built-in-Command-Help.png
[18]:https://github.com/WolfgangMehner/bash-support
[19]:http://www.vim.org/scripts/script.php?script_id=365
