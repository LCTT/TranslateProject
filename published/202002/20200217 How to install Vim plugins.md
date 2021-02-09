[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11923-1.html)
[#]: subject: (How to install Vim plugins)
[#]: via: (https://opensource.com/article/20/2/how-install-vim-plugins)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何安装 Vim 插件
======

> 无论你是手动安装还是通过包管理器安装，插件都可以帮助你在工作流中打造一个完美的 Vim 。

![](https://img.linux.net.cn/data/attachment/album/202002/23/215719kwhqzwwj1ezoen6o.jpg)

虽然 [Vim][2] 是快速且高效的，但在默认情况下，它仅仅只是一个文本编辑器。至少，这就是没有插件的情况 Vim 应当具备的样子，插件构建在 Vim 之上，并添加额外的功能，使 Vim 不仅仅是一个输入文本的窗口。有了合适的插件组合，你可以控制你的生活，形成你自己独特的 Vim 体验。你可以[自定义你的主题][3]，你可以添加语法高亮，代码 linting，版本跟踪器等等。

### 怎么安装 Vim 插件

Vim 可以通过插件进行扩展，但很长一段时间以来，并没有官方的安装方式去安装这些插件。从 Vim 8 开始，有一个关于插件如何安装和加载的结构。你可能会在网上或项目自述文件中遇到旧的说明，但只要你运行 Vim 8 或更高版本，你应该根据 Vim 的[官方插件安装方法][4]安装或使用 Vim 包管理器。你可以使用包管理器，无论你运行的是什么版本（包括比 8.x 更老的版本），这使得安装过程比你自己维护更新更容易。

手动和自动安装方法都值得了解，所以请继续阅读以了解这两种方法。

### 手动安装插件（Vim 8 及以上版本）

所谓的 “Vim 包”是一个包含一个或多个插件的目录。默认情况下，你的 Vim 设置包含在 `~/.vim` 中，这是 Vim 在启动时寻找插件的地方。（下面的示例使用了通用名称 `vendor` 来表示插件是从其它地方获得的。）

当你启动 Vim 时，它首先处理你的 `.vimrc`文件，然后扫描 `~/.vim` 中的所有目录，查找包含在 `pack/*/start` 中的插件。

默认情况下，你的 `~/.vim` 目录（如果你有的话）中没有这样的文件结构，所以设置为:

```
$ mkdir -p ~/.vim/pack/vendor/start
```

现在，你可以将 Vim 插件放在 `~/.vim/pack/vendor/start` 中，它们会在你启动 Vim 时自动加载。

例如，尝试安装一下 [NERDTree][5]，这是一个基于文本的 Vim 文件管理器。首先，使用 Git 克隆 NERDTree 存储库的快照:

```
$ git clone --depth 1 \
  https://github.com/preservim/nerdtree.git \
  ~/.vim/pack/vendor/start/nerdtree
```

启动 Vim 或者 gvim，然后键入如下命令：

```
:NERDTree
```

Vim 窗口左侧将打开一个文件树。

![NERDTree plugin][6]

如果你不想让一个插件每次启动 Vim 时都自动加载，你可以在 `~/.vim/pack/vendor` 中创建 `opt` 文件夹：

```
$ mkdir ~/.vim/pack/vendor/opt
```

任何安装到 `opt` 的插件都可被 Vim 使用，但是只有当你使用 `packadd` 命令将它们添加到一个会话中时，它们才会被加载到内存中。例如，一个虚构的叫 foo 的插件：

```
:packadd foo
```

Vim 官方建议每个插件项目在 `~/.Vim/pack` 中创建自己的目录。例如，如果你要安装 NERDTree 插件和假想的 foo 插件，你需要创建这样的目录结构:

```
$ mkdir -p ~/.vim/pack/NERDTree/start/
$ git clone --depth 1 \
  https://github.com/preservim/nerdtree.git \
  ~/.vim/pack/NERDTree/start/NERDTree
$ mkdir -p ~/.vim/pack/foo/start/
$ git clone --depth 1 \
  https://notabug.org/foo/foo.git \
  ~/.vim/pack/foo/start/foo
```

这样做是否方便取决于你。

### 使用 Vim 包管理器（任何 Vim 版本）

自从 Vim 8 以后，包管理器变得不那么有用了，但是一些用户仍然喜欢它们，因为它们能够自动更新一些插件。有几个包管理器可供选择，并且它们各不相同，但是 [vim-plug][7] 有一些很棒的特性和最好的文档，这使我们很容易开始并在以后深入研究。

#### 使用 vim-plug 安装插件

安装 vim-plug，以便它在启动时自动加载：

```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

创建一个 `~/.vimrc` 文件（如果你还没有这个文件），然后输入以下文本：

```
call plug#begin()
Plug 'preservim/NERDTree'
call plug#end()
```

每次要安装插件时，都必须在 `plug＃begin()` 和 `plug＃end()` 之间输入插件的名称和位置（上面以 NERDTree 文件管理器为例）。如果你所需的插件未托管在 GitHub 上，你可以提供完整的 URL，而不仅仅是 GitHub 的用户名和项目 ID。你甚至可以在 `~/.vim` 目录之外“安装”本地插件。

最后，启动 Vim 并提示 vim-plug 安装 `~/.vimrc` 中列出的插件：

```
:PlugInstall
```

等待插件下载。

#### 通过 vim-plug 更新插件

与手动安装过程相比，编辑 `~/.vimrc` 并使用命令来进行安装可能看起来并没有多省事，但是 vim-plug 的真正优势在更新。更新所有安装的插件，使用这个 Vim 命令:

```
:PlugUpdate
```

如果你不想更新所有的插件，你可以通过添加插件的名字来更新任何插件:

```
:PlugUpdate NERDTree
```

#### 恢复插件

vim-plug 的另一个优点是它的导出和恢复功能。Vim 用户都知道，正是插件的缘故，通常每个用户使用 Vim 的工作方式都是独一无二的。一旦你安装和配置了正确的插件组合，你最不想要的局面就是再也找不到它们。

Vim-plug 有这个命令来生成一个脚本来恢复所有当前的插件:

```
:PlugSnapshot ~/vim-plug.list
```
vim-plug 还有许多其他的功能，所以请参考它的[项目页面][7]以获得完整的文档。

### 打造一个完美的 Vim

当你整天都在做一个项目时，你希望每一个小细节都能为你提供最好的服务。了解 Vim 和它的许多插件，直到你为你所做的事情构建出一个完美的应用程序。

有喜欢的 Vim 插件吗？请在评论中告诉我们吧!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/how-install-vim-plugins

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[qianmingtian][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[c]: https://github.com/qianmingtian
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://www.vim.org/
[3]: https://opensource.com/article/19/12/colors-themes-vim
[4]: https://github.com/vim/vim/blob/03c3bd9fd094c1aede2e8fe3ad8fd25b9f033053/runtime/doc/repeat.txt#L515
[5]: https://github.com/preservim/nerdtree
[6]: https://opensource.com/sites/default/files/uploads/vim-nerdtree.jpg (NERDTree plugin)
[7]: https://github.com/junegunn/vim-plug
