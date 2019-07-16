针对 Bash 的不完整路径展开（补全）功能
======


![](https://4.bp.blogspot.com/-k2pRIKTzcBU/W1BpFtzzWuI/AAAAAAAABOE/pqX4XcOX8T4NWkKOmzD0T0OioqxzCmhLgCLcBGAs/s1600/Gnu-bash-logo.png)

[bash-complete-partial-path][1] 通过添加不完整的路径展开（类似于 Zsh）来增强 Bash（它在 Linux 上，macOS 使用 gnu-sed，Windows 使用 MSYS）中的路径补全。如果你想在 Bash 中使用这个省时特性，而不必切换到 Zsh，它将非常有用。

这是它如何工作的。当按下 `Tab` 键时，bash-complete-partial-path 假定每个部分都不完整并尝试展开它。假设你要进入 `/usr/share/applications` 。你可以输入 `cd /u/s/app`，按下 `Tab`，bash-complete-partial-path 应该把它展开成 `cd /usr/share/applications` 。如果存在冲突，那么按 `Tab` 仅补全没有冲突的路径。例如，Ubuntu 用户在 `/usr/share` 中应该有很多以 “app” 开头的文件夹，在这种情况下，输入 `cd /u/s/app` 只会展开 `/usr/share/` 部分。

另一个更深层不完整文件路径展开的例子。在Ubuntu系统上输入 `cd /u/s/f/t/u`，按下 `Tab`，它应该自动展开为 `cd /usr/share/fonts/truetype/ubuntu`。

功能包括：

*   转义特殊字符
*   如果用户路径开头使用引号，则不转义字符转义，而是在展开路径后使用匹配字符结束引号
*   正确展开 `~` 表达式
*   如果正在使用 bash-completion 包，则此代码将安全地覆盖其 `_filedir` 函数。无需额外配置，只需确保在主 bash-completion 后引入此项目。

查看[项目页面][2]以获取更多信息和演示截图。

### 安装 bash-complete-partial-path

bash-complete-partial-path 安装说明指定直接下载 bash_completion 脚本。我更喜欢从 Git 仓库获取，这样我可以用一个简单的 `git pull` 来更新它，因此下面的说明将使用这种安装 bash-complete-partial-path。如果你喜欢，可以使用[官方][3]说明。

1、 安装 Git（需要克隆 bash-complete-partial-path 的 Git 仓库）。

在 Debian、Ubuntu、Linux Mint 等中，使用此命令安装 Git：

```
sudo apt install git
```

2、 在 `~/.config/` 中克隆 bash-complete-partial-path 的 Git 仓库：

```
cd ~/.config && git clone https://github.com/sio/bash-complete-partial-path
```

3、 在 `~/.bashrc` 文件中 source `~/.config/bash-complete-partial-path/bash_completion`，

用文本编辑器打开 ~/.bashrc。例如你可以使用 Gedit：

```
gedit ~/.bashrc
```

在 `~/.bashrc` 的末尾添加以下内容（在一行中）：

```
[ -s "$HOME/.config/bash-complete-partial-path/bash_completion" ] && source "$HOME/.config/bash-complete-partial-path/bash_completion"
```

我提到在文件的末尾添加它，因为这需要包含在你的 `~/.bashrc` 文件的主 bash-completion 下面（之后）。因此，请确保不要将其添加到原始 bash-completion 之上，因为它会导致问题。

4、 引入 `~/.bashrc`:

```
source ~/.bashrc
```

这样就好了，现在应该安装完 bash-complete-partial-path 并可以使用了。

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/07/incomplete-path-expansion-completion.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/sio/bash-complete-partial-path
[2]:https://github.com/sio/bash-complete-partial-path
[3]:https://github.com/sio/bash-complete-partial-path#installation-and-updating
