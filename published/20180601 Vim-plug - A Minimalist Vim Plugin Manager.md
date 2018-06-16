Vim-plug：极简 Vim 插件管理器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/vim-plug-720x340.png)

当没有插件管理器时，Vim 用户必须手动下载 tarball 包形式的插件，并将它们解压到 `~/.vim` 目录中。在少量插件的时候可以。但当他们安装更多的插件时，就会变得一团糟。所有插件文件分散在单个目录中，用户无法找到哪个文件属于哪个插件。此外，他们无法找到他们应该删除哪个文件来卸载插件。这时 Vim 插件管理器就可以派上用场。插件管理器将安装插件的文件保存在单独的目录中，因此管理所有插件变得非常容易。我们几个月前已经写了关于 [Vundle][1] 的文章。今天，我们将看到又一个名为 “Vim-plug” 的 Vim 插件管理器。

Vim-plug 是一个自由、开源、速度非常快的、极简的 vim 插件管理器。它可以并行地安装或更新插件。你还可以回滚更新。它创建<ruby>浅层克隆<rt>shallow clone</rt></ruby>最小化磁盘空间使用和下载时间。它支持按需加载插件以加快启动时间。其他值得注意的特性是支持分支/标签/提交、post-update 钩子、支持外部管理的插件等。

### 安装

安装和使用起来非常容易。你只需打开终端并运行以下命令：

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Neovim 用户可以使用以下命令安装 Vim-plug：

```
$ curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 用法

#### 安装插件

要安装插件，你必须如下所示首先在 Vim 配置文件中声明它们。一般 Vim 的配置文件是 `~/.vimrc`，Neovim 的配置文件是 `~/.config/nvim/init.vim`。请记住，当你在配置文件中声明插件时，列表应该以 `call plug#begin(PLUGIN_DIRECTORY)` 开始，并以 `plug#end()` 结束。

例如，我们安装 “lightline.vim” 插件。为此，请在 `~/.vimrc` 的顶部添加以下行。

```
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
call plug#end()

```

在 vim 配置文件中添加上面的行后，通过输入以下命令重新加载：

```
:source ~/.vimrc
```

或者，只需重新加载 Vim 编辑器。

现在，打开 vim 编辑器：

```
$ vim
```

使用以下命令检查状态：

```
:PlugStatus

```

然后输入下面的命令，然后按回车键安装之前在配置文件中声明的插件。

```
:PlugInstall
```

#### 更新插件

要更新插件，请运行：

```
:PlugUpdate
```

更新插件后，按下 `d` 查看更改。或者，你可以之后输入 `:PlugDiff`。

#### 审查插件

有时，更新的插件可能有新的 bug 或无法正常工作。要解决这个问题，你可以简单地回滚有问题的插件。输入 `:PlugDiff` 命令，然后按回车键查看上次 `:PlugUpdate`的更改，并在每个段落上按 `X` 将每个插件回滚到更新前的前一个状态。

#### 删除插件

删除一个插件删除或注释掉你以前在你的 vim 配置文件中添加的 `plug` 命令。然后，运行 `:source ~/.vimrc` 或重启 Vim 编辑器。最后，运行以下命令卸载插件：

```
:PlugClean
```

该命令将删除 vim 配置文件中所有未声明的插件。

#### 升级 Vim-plug

要升级vim-plug本身，请输入：

```
:PlugUpgrade
```

如你所见，使用 Vim-plug 管理插件并不难。它简化了插件管理。现在去找出你最喜欢的插件并使用 Vim-plug 来安装它们。

就是这些了。我将很快在这里发布另一个有趣的话题。在此之前，请继续关注我们。

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/vim-plug-a-minimalist-vim-plugin-manager/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://linux.cn/article-9416-1.html