[#]: subject: "Customize your shell prompt with Starship"
[#]: via: "https://opensource.com/article/22/2/customize-prompt-starship"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14274-1.html"

用 Starship 定制你的 shell 提示符
======

> 控制你的提示符，让你需要的所有信息触手可及。

![](https://img.linux.net.cn/data/attachment/album/202202/14/232227pkh7bxi1a9asbfd5.jpg)

没有什么比我忘记在我的 Git 仓库中 `git add` 文件更让我恼火的了。我在本地测试，提交，然后推送，却发现在持续集成阶段失败了。更糟糕的是，我在 `main` 分支而不是特性分支上，并不小心推送到它。最好的情况是，因为分支保护而失败，我需要做一些操作才能把改动推送到一个分支。更糟糕的是，我没有正确配置分支保护，不小心直接推送到了 `main` 分支。

如果这些信息能在提示中直接获得，那不是很好吗？

在提示符中甚至还有更多有用的信息。虽然 Python 虚拟环境的名称在提示符中，但虚拟环境的 Python 版本却不在提示符中。

可以仔细地将 `PS1` 环境变量配置为所有相关的信息。这可能会变得很长，很烦人，而且调试起来并不简单。

这就是 Starship 被设计来解决的问题。

### 安装 Starship

Starship 的初始设置只需要两个步骤：安装并配置你的 shell。安装可以很简单：

```
$ curl -fsSL https://starship.rs/install.sh
```

阅读安装脚本，确保你理解它的作用，然后让它可执行并运行它：

```
$ chmod +x install.sh
$ ./install.sh
```

还有其他的安装方法，在其网站上有介绍。你可以在构建镜像的步骤中设置虚拟机或容器。

### 配置 Starship

下一步是配置你的 shell 来使用它。要一次性尝试，假设 shell 是 `bash` 或 `zsh`，请运行以下命令：

```
$ eval "$(starship init $(basename $SHELL))"
```

你的提示符立即改变：

```
localhost in myproject on  master
>
```

如果你喜欢你所看到的，把 `eval "$(starship init $(basename $SHELL))"` 添加到你的 shell 的 `rc` 文件中，使其永久化。

### 自定义 Starship

默认安装假定你可以安装“电脑迷字体”，例如 [Fantasque Sans Mono][2]。 特别是，你需要一种带有来自 Unicode 的“私有实现”部分的字形的字体。

这在控制终端时非常有效，但有时，终端的配置并不容易。例如，当使用一些浏览器内的 shell 抽象时，配置浏览器的字体可能是不太容易的。

该码位的最大用户是 Git 集成，它使用一个特殊的自定义符号来表示“分支”。禁用它可以通过使用文件 `~/.config/starship.toml` 来配置 `starship.rs`。

禁用分支符号是通过配置 `git_branch` 部分的 `format` 变量完成的：

```
[git_branch]
format = "on [$branch]($style) "
```

`starship.rs` 的一个好处是，改变配置会立即生效。保存文件，按下**回车**，看看字体是否符合预期。

还可以配置提示符中不同部分的颜色。例如，如果 Python 部分的亮黄色在白色背景上有点难看，你可以配置为蓝色：

```
[python]
style = "blue bold"
```

许多语言都有配置支持，包括 Go、.NET 和 JavaScript。还支持显示命令的持续时间（只针对耗时超过阈值的命令）等。

### 控制提示符

控制你的提示符，让你需要的所有信息触手可及。安装 Starship，让它为你工作，并享受吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/customize-prompt-starship

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/space_stars_cosmic.jpg?itok=bE94WtN- (Cosmic stars in outer space)
[2]: https://github.com/belluzj/fantasque-sans
