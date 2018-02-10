如何在  Linux/Unix 中不重启 vim 而重新加载 .vimrc 文件
======

我是一位新的 vim 编辑器用户。我通常加载 ~/.vimrc 用于配置。在编辑 .vimrc 时，我需要不重启 vim 会话而重新加载它。在 Linux 或者类 Unix 系统中，如何在编辑 .vimrc 后，重新加载它而不用重启 vim？

vim 是免费开源并且向上兼容 vi 的编辑器。它可以用来编辑各种文本。它在编辑用 C/Perl/Python 编写的程序时特别有用。可以用它来编辑 Linux/Unix 配置文件。~/.vimrc 是你个人的 vim 初始化和自定义文件。

### 如何在不重启 vim 会话的情况下重新加载 .vimrc

在 vim 中重新加载 .vimrc 而不重新启动的流程：

  1. 输入 `vim filename` 启动 vim
  2. 按下 `Esc` 接着输入  `:vs ~/.vimrc` 来加载 vim 配置
  3. 像这样添加自定义：

  ```
  filetype indent plugin on
  set number
  syntax on
  ```

  4. 使用 `:wq`  保存文件，并从 ~/.vimrc 窗口退出
  5. 输入下面任一命令重载  ~/.vimrc：

  ```
  :so $MYVIMRC
  ```
  或者
  ```
  :source ~/.vimrc
  ```

[![How to reload .vimrc file without restarting vim][1]][1]
图1：编辑 ~/.vimrc 并在需要的时候重载而不用退出 vim，这样你就可以继续编辑程序了

`:so[urce]! {file}` 这个 vim 命令会从给定的文件比如  ~/.vimrc 读取配置。这些命令是在正常模式下执行，就像你输入它们一样。当你在  :global、:argdo、 :windo、:bufdo 之后、循环中或者跟着另一个命令时，显示不会再在执行命令时更新。

### 如何编辑按键来编辑并重载 ~/.vimrc

在你的  ~/.vimrc 后面跟上这些

```
" Edit vimr configuration file
nnoremap confe :e $MYVIMRC<CR>
"

 Reload vims configuration file
nnoremap confr :source $MYVIMRC<CR>
```

现在只要按下  `Esc` 接着输入 `confe` 开编辑 ~/.vimrc。按下 `Esc` ，接着输入 `confr` 来重新加载。一些喜欢在 .vimrc 中使用 <Leader>。因此上面的映射变成：

```
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
"
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
```

<Leader> 键默认映射成  \\ 键。因此只要输入 \\ 接着 ve 就能编辑文件。按下 \\ 接着 vr 就能重载 ~/vimrc。
 这就完成了，你可以不用再重启 vim 就能重新加载 .vimrc 了。 

### 关于作者

作者是 nixCraft 的创建者，经验丰富的系统管理员，也是 Linux 操作系统/Unix shell 脚本的培训师。他曾与全球客户以及IT、教育、国防和太空研究以及非营利部门等多个行业合作。在 [Twitter][9]、[Facebook][10]、[Google +][11] 上关注他。通过[我的 RSS/XML 订阅][5]获取**最新的系统管理、Linux/Unix 以及开源主题教程**。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-reload-vimrc-file-without-restarting-vim-on-linux-unix/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/media/new/faq/2018/02/How-to-reload-.vimrc-file-without-restarting-vim.jpg
[2]:https://twitter.com/nixcraft
[3]:https://facebook.com/nixcraft
[4]:https://plus.google.com/+CybercitiBiz
[5]:https://www.cyberciti.biz/atom/atom.xml
