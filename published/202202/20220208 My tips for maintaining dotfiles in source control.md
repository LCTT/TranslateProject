[#]: subject: "My tips for maintaining dotfiles in source control"
[#]: via: "https://opensource.com/article/22/2/dotfiles-source-control"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14283-1.html"

我在源码控制中维护点文件的技巧
======

> 当你把环境保持在源码控制中，开发虚拟机和容器就成了一个解决方案，而不是一个问题。

![](https://img.linux.net.cn/data/attachment/album/202202/18/145014pc7lmh5ts15mm0tm.jpg)

你是否曾经开始使用一台新的电脑，不管是出于自愿还是因为旧的电脑让你的魔法烟消云散，并且对花了多长时间才把所有东西都 _弄好_ 而感到沮丧？更糟糕的是，有没有花了一些时间重新配置你的 shell 提示符，然后意识到你更喜欢以前的样子？

对我来说，当我决定要在 [容器][2] 中进行开发时，这个问题就变得很严重了。容器是非持久的。开发工具很容易解决：一个带有工具的容器镜像就可以工作。源码很容易解决：源码控制维护它，开发是在分支上。但是，如果每次我创建一个容器，我都需要仔细地配置它，这就太痛苦了。

### 主目录的版本控制

将配置文件保存在版本控制中一直是一个有吸引力的选择。但是天真地这么做是令人担忧的。不可能直接对 `~` 进行版本控制。

首先，太多的程序认为把秘密放在那里是安全的。此外，它也是 `~/Downloads` 和 `~/Pictures` 等文件夹的位置，这些文件夹可能不应该被版本化。

小心翼翼地在主目录下保留一个 `.gitignore` 文件来管理 `include` 和 `exclude` 列表是有风险的。在某些时候，其中一个路径会出错，花费了几个小时的配置会丢失，大文件会出现在 Git 历史记录中，或者最糟糕的是，秘密和密码会被泄露。当这一策略失败时，它就成了灾难性的失败。

手动维护大量的符号链接也是行不通的。版本控制的全部原因是为了避免手动维护配置。

### 写一个安装脚本

这暗示了在源码控制中维护点文件的第一条线索：写一个安装脚本。

就像所有好的安装脚本一样，让它 _幂等_：运行两次不会两次增加配置。

像所有好的安装脚本一样，让它 _只做最少的事情_：使用其他的技巧来指向你的源码控制中的配置文件。

### ~/.config 目录

现代 Linux 程序在直接在主目录中寻找配置之前，会先在 `~/.config` 中寻找。最重要的例子是 `git`，它在 `~/.config/git` 中寻找。

这意味着安装脚本可以将 `~/.config` 符号链接到主目录中源码控制的管理目录中的一个目录：

```
#!/bin/bash
set -e
DOTFILES="$(dirname $(realpath $0))"
[ -L ~/.config ] || ln -s $DOTFILES/config ~/.config
```

此脚本寻找它的位置，然后将 `~/.config` 链接到它被签出的地方。这意味着几乎没有关于它需要位于主目录中的位置的假设。

### 获取文件

大多数 shells 仍然直接在主目录下寻找文件。为了解决这个问题，你要增加一层指示。从 `$DOTFILES` 中获取文件意味着在修改 shell 配置时不需要重新运行安装程序。

```
$!/bin/bash
set -e
DOTFILES="$(dirname $(realpath $0))"
grep -q 'SETTING UP BASH' ~/.bashrc || \
  echo "source $DOTFILES/starship.bash # SETTING UP BASH" >> ~/.bashrc
```

再次注意，这个脚本很仔细地做了幂等：如果这一行已经在那里了，它就不会再添加。它还考虑到了你在 `.bashrc` 上已经做的任何编辑，虽然这不是一个好主意，但也没有必要惩罚它。

### 反复测试

当你把环境保持在源码控制中时，开发虚拟机和容器就成了一个解决方案，而不是一个问题。试着做一个实验。建立一个新的开发环境，克隆你的点文件，安装，并看看有什么问题。

不要只做一次。至少每周做一次。这将使你更快地完成工作，同时也会告诉你什么是不可行的。暴露问题，修复它们，然后重复。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/dotfiles-source-control

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/tags/containers
