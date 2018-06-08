在 Fedora 系统上设置 zsh
======

![](https://fedoramagazine.org/wp-content/uploads/2017/12/zsh-816x345.jpg)

对于一些人来说，终端可能会很吓人。但终端不仅仅是在黑屏中输入。它通常运行一个 shell，因为它围绕着内核调用。shell 是一个基于文本的界面，可让你在系统上运行命令。它有时也被称为命令行解释器或 CLI。与大多数Linux发行版一样，Fedora带有bash作为默认shell。但是，它不是唯一可用的 shell，你可以安装其他的 shell。本文重点介绍 Z Shell 或 zsh。

Bash 是对 UNIX 中提供的旧 Bourne shell（sh）的重写。通过更好的交互，zsh 旨在比 bash 更友善。它的一些有用功能是：

  * 可编程的命令行补全
  * 在运行的 shell 会话之间共享命令历史
  * 拼写纠正
  * 可加载模块
  * 交互选择文件和文件夹



zsh 在 Fedora 仓库中存在。要安装，请运行以下命令：
```
$ sudo dnf install zsh

```

### 使用 zsh

要开始使用它，只需输入 zsh，新的 shell 在第一次运行时显示向导。该向导可帮助你配置初始功能，如历史记录行为和自动补全。或者你可以选择保持[ rc 文件][1] 为空：

![zsh First Run Wizzard][2]

如果输入 1，则启动配置向导。其他选项立即启动 shell。

请注意，与 bash 相同，用户提示符是 **％** 而不是 **$**。这里的一个重要功能是自动补全功能，它允许你使用 Tab 键在文件和目录之间移动，非常类似于菜单：

![zsh cd Feature][3]

另一个有趣的功能是拼写纠正，这有助于在混合大小写的情况下输入文件名：

![zsh Auto Completion][4]

## 使用 zsh 成为你的默认 shell

zsh 提供了很多插件，如 zsh-syntax-highlighting 和著名的 “Oh my zsh”（[在此查看其页面][5]）。也许你希望将其设为默认 shell，以便在你在开始会话或打开终端时运行。为此，请使用 chsh（“更改 shell”）命令：
```
$ chsh -s $(which zsh)

```

这个命令告诉你的系统你要设置（-s）默认shell 的正确位置（which zsh）。

图片来自 [Flickr][7] 由 [Kate Ter Haar][6] 提供（CC BY-SA）。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/set-zsh-fedora-system/

作者：[Eduard Lucena][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/x3mboy/
[1]:https://en.wikipedia.org/wiki/Configuration_file
[2]:https://fedoramagazine.org/wp-content/uploads/2017/12/zshFirstRun.gif
[3]:https://fedoramagazine.org/wp-content/uploads/2017/12/zshChangingFeature-1.gif
[4]:https://fedoramagazine.org/wp-content/uploads/2017/12/zshAutoCompletion.gif
[5]:http://ohmyz.sh/
[6]:https://www.flickr.com/photos/katerha/
[7]:https://www.flickr.com/photos/katerha/34714051013/
