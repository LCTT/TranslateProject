[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10610-1.html)
[#]: subject: (zsh shell inside Emacs on Windows)
[#]: via: (https://www.onwebsecurity.com/configuration/zsh-shell-inside-emacs-on-windows.html)
[#]: author: (Peter Mosmans https://www.onwebsecurity.com/)

Windows 下 Emacs 中的 zsh shell
======

![zsh shell inside Emacs on Windows][5]

运行跨平台 shell（例如 Bash 或 zsh）的最大优势在于你能在多平台上使用同样的语法和脚本。在 Windows 上设置（替换）shell 挺麻烦的，但所获得的回报远远超出这小小的付出。

MSYS2 子系统允许你在 Windows 上运行 Bash 或 zsh 之类的 shell。使用 MSYS2 很重要的一点在于确保搜索路径都指向 MSYS2 子系统本身：存在太多依赖关系了。

MSYS2 安装后默认的 shell 就是 Bash；zsh 则可以通过包管理器进行安装：

```
pacman -Sy zsh
```

通过修改 `etc/passwd` 文件可以设置 zsh 作为默认 shell，例如：

```
mkpasswd -c | sed -e 's/bash/zsh/' | tee -a /etc/passwd
```

这会将默认 shell 从 bash 改成 zsh。

要在 Windows 上的 Emacs 中运行 zsh ，需要修改 `shell-file-name` 变量，将它指向 MSYS2 子系统中的 zsh 二进制文件。该二进制 shell 文件在 Emacs `exec-path` 变量中的某个地方。

```
(setq shell-file-name (executable-find "zsh.exe"))
```

不要忘了修改 Emacs 的 `PATH` 环境变量，因为 MSYS2 路径应该先于 Windows 路径。接上一个例子，假设 MSYS2 安装在 `c:\programs\msys2` 中，那么执行：

```
(setenv "PATH" "C:\\programs\\msys2\\mingw64\\bin;C:\\programs\\msys2\\usr\\local\\bin;C:\\programs\\msys2\\usr\\bin;C:\\Windows\\System32;C:\\Windows")
```

在 Emacs 配置文件中设置好这两个变量后，在 Emacs 中运行：

```
M-x shell
```

应该就能看到熟悉的 zsh 提示符了。

Emacs 的终端设置（eterm）与 MSYS2 的标准终端设置（xterm-256color）不一样。这意味着某些插件和主题（提示符）可能不能正常工作 - 尤其在使用 oh-my-zsh 时。

检测 zsh 否则在 Emacs 中运行很简单，使用变量 `$INSIDE_EMACS`。

下面这段代码片段取自 `.zshrc`（当以交互式 shell 模式启动时会被加载），它会在 zsh 在 Emacs 中运行时启动 git 插件并更改主题：

```
# Disable some plugins while running in Emacs
if [[ -n "$INSIDE_EMACS" ]]; then
  plugins=(git)
  ZSH_THEME="simple"
else
  ZSH_THEME="compact-grey"
fi
```

通过在本地 `~/.ssh/config` 文件中将 `INSIDE_EMACS` 变量设置为 `SendEnv` 变量……

```
Host myhost
SendEnv INSIDE_EMACS
```

……同时在 ssh 服务器的 `/etc/ssh/sshd_config` 中设置为 `AcceptEnv` 变量……

```
AcceptEnv LANG LC_* INSIDE_EMACS
```

……这使得在 Emacs shell 会话中通过 ssh 登录另一个运行着 zsh 的 ssh 服务器也能工作的很好。当在 Windows 下的 Emacs 中的 zsh 上通过 ssh 远程登录时，记得使用参数 `-t`，`-t` 参数会强制分配伪终端（之所以需要这样，时因为 Windows 下的 Emacs 并没有真正的 tty）。

跨平台，开源真是个好东西……

--------------------------------------------------------------------------------

via: https://www.onwebsecurity.com/configuration/zsh-shell-inside-emacs-on-windows.html

作者：[Peter Mosmans][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.onwebsecurity.com/
[b]: https://github.com/lujun9972
[1]: https://www.onwebsecurity.com/category/configuration.html
[2]: https://www.onwebsecurity.com/tag/emacs.html
[3]: https://www.onwebsecurity.com/tag/msys2.html
[4]: https://www.onwebsecurity.com/tag/zsh.html
[5]: https://www.onwebsecurity.com//images/zsh-shell-inside-emacs-on-windows.png
