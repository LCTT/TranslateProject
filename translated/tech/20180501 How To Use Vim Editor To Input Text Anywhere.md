如何在任何地方使用 Vim 编辑器输入文本
======
![](https://www.ostechnix.com/wp-content/uploads/2018/05/vim-anywhere-720x340.png)

各位Vim使用者大家好！今天，我这里有个好消息告诉大家。我会向大家介绍 **Vim-anywhere**，这是一个简单的脚本，它允许你使用 Vim 编辑器在 Linux 中的任何地方输入文本。这意味着你能简单地调用自己最爱的 Vim 编辑器，输入任何你所想的，并将这些文本粘贴到任意的应用和网站中。这些文本将在剪贴板可用，直到你重启了系统。这个工具对那些喜欢在非 Vim 环境中使用 Vim 键位绑定的人来说十分有用。

### 在 Linux 中安装 Vim-anywhere
Vim-anywhere 工具可以运行在任何基本 GNOME（或其他衍生品）的 Linux 发行版上。另外，确保你已经安装了下面的依赖。

  * Curl
  * Git
  * gVim
  * xclip


比如，你可以用下面的命令在 Ubuntu 中安装这些工具：
```
$ sudo apt install curl git vim-gnome xclip

```
然后运行如下的命令来安装 Vim-anywhere：
```
$ curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash

```
Vim-anywhere 到此已经安装完成。现在我们来看看如何使用它。
### 在任何地方使用 Vim 编辑器输入文本
假如你需要创建一个 word 文档。但是你更愿意使用 Vim 编辑器，而不是 LibreOffice。没问题，这里 Vim-anywhere 就派上用场了。Vim-anywhere 自动化了整个流程。它仅仅简单地调用 Vim 编辑器，所以你能写任何你所想的，然后将之粘贴到 .doc 文件中。

让我给你展示一个用例。打开 LibreOffice 或者你选的任何图形文本编辑器。然后打开 Vim-anywhere。你只需要按下 **CTRL+ALT+V** 即可。它将会打开 gVim 编辑器。按下"i"切换到交互模式然后输入文本。完成之后，键入 **:wq** 关闭并保存文件。

![][2]

这些文本会在剪贴板中可用，直到你重启了系统。在你关闭编辑器之后，你之前的应用会重新占据主界面。你只需按下 **CTRL+P** 将文本粘贴进去。

![][3]

这仅仅只是一个例子。你甚至可以使用 Vim-anywhere 在烦人的 web 表单或者其他应用上进行输入。一旦 Vim-anywhere被调用，它将会打开一个缓冲区。关闭 Vim-anywhere之后，缓冲器内的内容会自动复制到你的剪贴板中，之前的应用会重新占据主界面。

Vim-anywhere 在被调用的时候会在 **/tmp/vim-anywhere** 中创建一个临时文件。这些临时文件会一致保存着，直到你重启了系统，并为你提供临时的历史记录。
```
$ ls /tmp/vim-anywhere

```
你可以用下面的命令重新打开最近的文件：
```
$ vim $( ls /tmp/vim-anywhere | sort -r | head -n 1 )

```
**更新 Vim-anywhere **

运行下面的命令来更新 Vim-anywhere：
```
$ ~/.vim-anywhere/update

```

**更改快捷键**

默认调用 Vim-anywhere 的键位是 CTRL+ALT+V。你可以用 gconf 工具将其更改为任何自定义的键位绑定。
```
$ gconftool -t str --set /desktop/gnome/keybindings/vim-anywhere/binding <custom binding>

```

**卸载 Vim-anywhere**

可能有些人觉得每次打开Vim编辑器，输入一些文本，然后将文本复制到其他应用中是没有意义也毫无必要的。

如果你不觉得这个工具有用，只需使用下面的命令来卸载它：
```
$ ~/.vim-anywhere/uninstall

```



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-use-vim-editor-to-input-text-anywhere/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[paperzhang](https://github.com/paperzhang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/05/vim-anywhere-1-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/vim-anywhere-2.png











