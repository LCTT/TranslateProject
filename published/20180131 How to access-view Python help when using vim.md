如何在使用 Vim 时访问/查看 Python 帮助
======

我是一名新的 Vim 编辑器用户。我用它编写 Python 代码。有没有办法在 vim 中查看 Python 文档而无需访问互联网？假设我的光标在 Python 的 `print` 关键字下，然后按下 F1，我想查看关键字 `print` 的帮助。如何在 vim 中显示 python `help()` ？如何在不离开 vim 的情况下调用 `pydoc3`/`pydoc` 寻求帮助？

`pydoc` 或 `pydoc3` 命令可以根据 Python 关键字、主题、函数、模块或包的名称显示文本文档，或在模块内或包中的模块对类或函数的引用。你可以从 Vim 中调用 `pydoc`。让我们看看如何在 Vim 编辑器中使用 `pydoc` 访问 Python 文档。

### 使用 pydoc 访问 python 帮助

语法是：

```
pydoc keyword
pydoc3 keyword
pydoc len
pydoc print
```

编辑你的 `~/.vimrc`：

```
$ vim ~/.vimrc
```

为 `pydoc3` 添加以下配置（python v3.x 文档）。在正常模式下创建 `H` 键的映射：

```
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
```

保存并关闭文件。打开 Vim 编辑器：

```
$ vim file.py
```

写一些代码：

```
#!/usr/bin/python3
x=5
y=10
z=x+y
print(z)
print("Hello world")
```

将光标置于 Python 关键字 `print` 的下方，然后按下 `Shift`，然后按 `H`。你将看到下面的输出：

[![Access Python Help Within Vim][1]][1]

*按 H 查看 Python 关键字 print 的帮助*

### 如何在使用 Vim 时查看 python 帮助

[jedi-vim][2] 是一个绑定自动补全库 Jed 的 Vim 插件。它可以做很多事情，包括当你按下 `Shift` 后跟 `K` （即按大写 `K`） 就显示关键字的帮助。

#### 如何在 Linux 或类 Unix 系统上安装 jedi-vim

使用 [pathogen][3]、[vim-plug][4] 或 [Vundle][5] 安装 jedi-vim。我使用的是 vim-plug。在 `~/.vimrc` 中添加以下行：

```
Plug 'davidhalter/jedi-vim'
```

保存并关闭文件。启动 Vim 并输入：

```
PlugInstall
```

在 Arch Linux 上，你还可以使用 `pacman` 命令从官方仓库中的 vim-jedi 安装 jedi-vim：

```
$ sudo pacman -S vim-jedi
```

它也可以在 Debian（比如 8）和 Ubuntu（ 比如 14.04）上使用 [apt-get command][6]/[apt-get command][7] 安装 vim-python-jedi：

```
$ sudo apt install vim-python-jedi
```

在 Fedora Linux 上，它可以用 `dnf` 安装 vim-jedi：

```
$ sudo dnf install vim-jedi
```

Jedi 默认是自动初始化的。所以你不需要进一步的配置。要查看 Documentation/Pydoc，请按 `K`。它将弹出帮助窗口：

[![How to view python help when using vim][8]][8]

### 关于作者

作者是 nixCraft 的创建者，也是经验丰富的系统管理员和 Linux 操作系统/Unix shell 脚本的培训师。他曾与全球客户以及 IT、教育、国防和太空研究以及非营利部门等多个行业合作。在 [Twitter][9]、[Facebook][10]、[Google +][11] 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-access-view-python-help-when-using-vim/

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2018/01/Access-Python-Help-Within-Vim.gif
[2]:https://github.com/davidhalter/jedi-vim
[3]:https://github.com/tpope/vim-pathogen
[4]:https://www.cyberciti.biz/programming/vim-plug-a-beautiful-and-minimalist-vim-plugin-manager-for-unix-and-linux-users/
[5]:https://github.com/gmarik/vundle
[6]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[7]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[8]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-view-Python-Documentation-using-pydoc-within-vim-on-Linux-Unix.jpg
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
