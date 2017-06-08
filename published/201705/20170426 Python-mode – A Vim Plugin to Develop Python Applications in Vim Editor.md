Python-mode：在 Vim 编辑器中开发 Python 应用的 Vim 插件
============================================================

Python-mode 是一个 Vim 插件，它使你能够在 [Vim 编辑器][1]中更快的利用包括 pylint、rope、pydoc、pyflakes、pep8、autopep8、pep257　和 mccable 在内的各种库来写 Python 代码，这些库提供了一些编码功能，比如静态分析、特征重构、折叠、补全和文档等。

**推荐阅读：** [如何用 Bash-Support 插件将 Vim 编辑器打造成编写 Bash 脚本的 IDE][2]

这个插件包含了所有你在 Vim 编辑器中可以用来开发 Python 应用的特性。

### Python-mode 的特性

它包含下面这些值得一提的特性：

*   支持 Python 2.6+ 至 Python 3.2 版本
*   语法高亮
*   提供 virtualenv 支持
*   支持 Python 式折叠
*   提供增强的 Python 缩进
*   能够在 Vim 中运行 Python 代码
*   能够添加/删除断点
*   支持 Python 的 motion 和运算符
*   能够在运行的同时检查代码（pylint、pyflakes、pylama ……）
*   支持自动修复 PEP8 错误
*   允许在 Python 文档中进行搜索
*   支持代码重构
*   支持强代码补全
*   支持定义跳转

在这篇教程中，我将阐述如何在 Linux 中为 Vim 安装设置 Python-mode，从而在 Vim 编辑器中开发 Python 应用。

### 如何在 Linux 系统中为 Vim 安装 Python-mode

首先安装 [Pathogen][3] （它使得安装插件超级简单，并且运行文件位于私有目录中），从而更加容易的安装 Python-mode

运行下面的命令来获取 `pathogen.vim` 文件和它需要的目录：

```
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

然后把下面这些内容加入 `~/.vimrc` 文件中：

```
execute pathogen#infect()
syntax on
filetype plugin indent on
```

安装好 pathogen 以后，你可以像下面这样把 Python-mode 插件放入 `~/.vim/bunble` 目录中：

```
# cd ~/.vim/bundle 
# git clone https://github.com/klen/python-mode.git
```

然后像下面这样在 Vim 中重建 `helptags` ：

```
:helptags
```

你需要启用 `filetype-plugin` （:help filetype-plugin-on）和 `filetype-indent` （:help filetype-indent-on）来使用 Python-mode 。

### 在 Debian 和 Ubuntu 中安装 Python-mode

另一种在 Debian 和 Ubuntu 中安装 Python-mode 的方法是使用 PPA，就像下面这样

```
$ sudo add-apt-repository https://klen.github.io/python-mode/deb main
$ sudo apt-get update
$ sudo apt-get install vim-python-mode
```

如果你遇到消息：“The following signatures couldn’t be verified because the public key is not available”，请运行下面的命令：

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B5DF65307000E266
```

现在，使用 `vim-addon-manager` 启用 Python-mode：

```
$ sudo apt install vim-addon-manager
$ vim-addons install python-mode
```

### 在 Linux 中定制 Python-mode

如果想覆盖默认键位绑定，可以在 `.vimrc` 文件中重定义它们，比如：

```
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"
```

注意，默认情况下， Python-mode 使用 Python 2 进行语法检查。你可以在 `.vimrc` 文件中加入下面这行内容从而启动 Python 3 语法检查。

```
let g:pymode_python = 'python3'
```

你可以在 Python-mode 的 GitHub 仓库找到更多的配置选项： [https://github.com/python-mode/python-mode][4]

这就是全部内容了。在本教程中，我向你们展示了如何在 Linux 中使用 Python-mode 来配置 Vim 。请记得通过下面的反馈表来和我们分享你的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 爱好者、Linux 系统管理员、网络开发人员，现在也是 TecMint 的内容创作者，他喜欢和电脑一起工作，坚信共享知识。

------------------

via: https://www.tecmint.com/python-mode-a-vim-editor-plugin/

作者：[Aaron Kili][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/vi-editor-usage/
[2]:https://linux.cn/article-8467-1.html
[3]:https://github.com/tpope/vim-pathogen
[4]:https://github.com/python-mode/python-mode
[5]:https://www.tecmint.com/author/aaronkili/
[6]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:https://www.tecmint.com/free-linux-shell-scripting-books/
