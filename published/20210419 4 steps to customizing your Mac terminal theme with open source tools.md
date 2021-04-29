[#]: subject: (4 steps to customizing your Mac terminal theme with open source tools)
[#]: via: (https://opensource.com/article/21/4/zsh-mac)
[#]: author: (Bryant Son https://opensource.com/users/brson)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13323-1.html)

用开源工具定制 Mac 终端主题的 4 个步骤
======

> 用开源工具让你的终端窗口在 Mac 上漂亮起来。

![](https://img.linux.net.cn/data/attachment/album/202104/22/234534t3t7ntpvdde3v892.jpg)

你是否曾经厌倦了在你的 macOS 电脑上看到同样老式的终端窗口？如果是这样，使用开源的 Oh My Zsh 框架和 Powerlevel10k 主题为你的视图添加一些点缀。

这个基本的逐步教程将让你开始定制你的 macOS 终端。如果你是一个 Linux 用户，请查看 Seth Kenlon 的指南 [为 Zsh 添加主题和插件][2] 以获得深入指导。

### 步骤 1：安装 Oh My Zsh

[Oh My Zsh][3] 是一个开源的、社区驱动的框架，用于管理你的 Z shell （Zsh） 配置。

![Oh My Zsh][4]

Oh My Zsh 是在 MIT 许可下发布的。使用以下命令安装：

```
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 步骤 2：安装 Powerlevel10k 字体

![Powerlevel10k][6]

Powerlevel10k 是一个 MIT 许可的 Zsh 主题。在安装 Powerlevel10k 之前，你需要为你的终端安装自定义字体。

到 [Powerlevel10 GitHub][7] 页面，在 `README` 中 搜索 “fonts”。安装自定义字体的步骤会根据你的操作系统而有所不同。这只需要简单地点击-下载-安装的系列操作。

![Powerlevel10k fonts][8]

### 步骤 3：安装 Powerlevel10k 主题

接下来，运行以下命令安装 Powerlevel10k：

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

完成后，用文本编辑器，比如 [Vim][9]，打开 `~/.zshrc` 配置文件，设置行 `ZSH_THEME="powerlevel10k/powerlevel10k`，然后保存文件。

### 步骤 4：完成 Powerlevel10 的设置

打开一个新的终端，你应该看到 Powerlevel10k 配置向导。如果没有，运行 `p10k configure` 来调出配置向导。如果你在步骤 2 中安装了自定义字体，那么图标和符号应该正确显示。将默认字体更改为 `MeslowLG NF`。

![Powerlevel10k configuration][10]

当你完成配置后，你应该会看到一个漂亮的终端。

![Oh My Zsh/Powerlevel10k theme][11]

就是这些了！你应该可以享受你美丽的新终端了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/zsh-mac

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/article/19/9/adding-plugins-zsh
[3]: https://ohmyz.sh/
[4]: https://opensource.com/sites/default/files/uploads/1_ohmyzsh.jpg (Oh My Zsh)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/2_powerlevel10k.jpg (Powerlevel10k)
[7]: https://github.com/romkatv/powerlevel10k
[8]: https://opensource.com/sites/default/files/uploads/3_downloadfonts.jpg (Powerlevel10k fonts)
[9]: https://opensource.com/resources/what-vim
[10]: https://opensource.com/sites/default/files/uploads/4_p10kconfiguration.jpg (Powerlevel10k configuration)
[11]: https://opensource.com/sites/default/files/uploads/5_finalresult.jpg (Oh My Zsh/Powerlevel10k theme)
