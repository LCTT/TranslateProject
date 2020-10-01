[#]: collector: "lujun9972"
[#]: translator: "hom"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12632-1.html"
[#]: subject: "Manage your SSH connections with this open source tool"
[#]: via: "https://opensource.com/article/20/9/ssh-connection-manager"
[#]: author: "Kenneth Aaron https://opensource.com/users/flyingrhino"

使用开源工具 nccm 管理 SSH 连接
======

> 使用 nccm 让你的终端连接 SSH 会话更快、更稳、更轻松。

![](https://img.linux.net.cn/data/attachment/album/202009/19/233942j6ne6wllnlbnjd36.jpg)

OpenSSH 很常用，但没有一个知名的连接管理器，因此我开发了 ncurses SSH 连接管理器（`nccm`）来填补这个重要的空白。 `nccm` 是一个简单的 SSH 连接管理器，具有非常便于移植的终端界面（就如项目名称所示，使用 ncurses 编写）。最重要的是，它使用起来非常简单。有了 `nccm`，你可以花费最少的精力和最少的按键连接到你选择的 SSH 会话。

### 安装 nccm

最快的方式是从它的 [Git 仓库][2]克隆该项目：

```
$ git clone https://github.com/flyingrhinonz/nccm nccm.git
```

在 `nccm.git/nccm` 的文件夹中有两个文件：`nccm` 自身和 `nccm.yml` 配置文件。

首先将 `nccm` 脚本复制到系统目录 `/usr/local/bin/` 中并添加执行权限，也可以通过使用`install` 命令来完成操作：

```
$ sudo install -m755 nccm –target-directory /usr/local/bin
```

文件 `nccm.yml` 可以拷贝到以下任意一个位置，默认从找到的第一个位置获取配置:

  * `~/.config/nccm/nccm.yml`
  * `~/.nccm.yml`
  * `~/nccm.yml`
  * `/etc/nccm.yml`

`nccm` 需要在 Python 3 的环境中运行，这在大部分的 Linux 环境是没问题的。大多数 Python 库的依赖包已经作为 Python 3 的一部分存在，但是，有一些 YAML 的依赖包和实用程序是你必须安装的。

如果你没有安装 `pip`，你可以使用包管理器来安装它。在安装的同时，也请安装 `yamllint` 应用程序来帮助你验证 `nccm.yml` 文件。

在 Debian 或类似系统使用 `apt` 命令：

```
$ sudo apt install python3-pip yamllint
```

在 Fedora 或者类似系统使用 `dnf` 命令：

```
$ sudo dnf install python3-pip yamllint
```

`PyYAML` 也是必须安装的，可以通过使用 `pip` 来安装：

```
$ pip3 install --user PyYAML
```

### 使用 nccm

开始之前，需要修改 `nccm.yml` 文件来添加 SSH 连接配置，可以参照示例文件格式化 YAML 文件。仿照示例文件在开头添加连接名称，配置项使用两个空格缩进。不要忘了冒号（`:`），这是 YAML 的语言的格式。

不要担心你的 SSH 会话信息以何顺序排列，因为 `nccm` 在程序内提供了排序的方式。

如果修改完成，可以使用 `yamllint` 来校验配置：

```
$ yamllint ~/.config/nccm/nccm.yml
```

如果没有错误信息返回，说明文件的内容格式是正确的，可以进行下面的步骤。

如果 `nccm` 可以[从你的路径][3]中找到并且可以执行，那么输入 `nccm` 就可以启动 TUI（文本用户界面）了。如果你看到 Python 3 抛出的异常，请检查依赖包是否正确安装，任何异常都应该提到缺少的依赖包。

只要你没有在 YAML 配置文件中更改 `ncm_config_control` 模式，那么你可以使用以下的键盘按键来控制：

  * `Up`/`Down` 方向键 - 移动光标
  * `Home`/`End` - 跳转到文件开始和结尾
  * `PgUp`/`PgDn` - 以页为单位查看
  * `Left`/`Right` 方向键 - 水平滚动
  * `TAB` - 在文本框之间移动
  * 回车 - 连接选中的 SSH 会话
  * `Ctrl-h` - 显示帮助菜单
  * `Ctrl-q`/`Ctrl-c` - 退出
  * `F1`-`F5` 或 `!` `@` `#` `$` `%` - 按 1-5 列排序

使用 `F1` 到 `F5` 来按 1-5 列排序，如果你的设备占用了这些 `F1` - `F5` 键，你可以使用`!` `@` `#` `$` `%` 来替代。默认界面显示 4 列内容，但我们将用户名和服务器地址作为单独的列来排序，这样我们就有了 5 个排序方式。你也可以通过再次按下排序的按键来逆转排序。在选中的行上按回车可以建立会话。

![nccm screenshot terminal view][4]

在 `Filter` 文本框中输入过滤内容，会用输入的内容以“与”的关系来过滤输出内容。这是不区分大小写的，而条目间用空白分隔。在 `Conn` 部分也是如此，但在这里按回车键可以连接到那个特定的条目编号。

这个工具还有许多功能需要你去发掘，比如专注模式，这些部分留下等待你去探索，也可以查看项目主页或者内置的帮助文档查看更多细节内容。

项目的 YAML 配置文件的文档是完善的，所以你可以查阅修改使 `nccm` 使用起来更加顺手。`nccm` 项目是非常希望得到你的反馈的，所以你可以复刻该项目然后添加更多新功能，欢迎大家提出拉取请求。

### 使用 nccm 来放松连接 SSH 的压力

像我一样，我希望这个工具可以对你有用，感谢能够为开源工作增加自己的贡献，请接受 `nccm` 作为我对开源项目自由、高效工作所做的贡献。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/ssh-connection-manager

作者：[Kenneth Aaron][a]
选题：[lujun9972][b]
译者：[hom](https://github.com/hom)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flyingrhino
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_ "Penguins"
[2]: https://github.com/flyingrhinonz/nccm
[3]: https://opensource.com/article/17/6/set-path-linux
[4]: https://opensource.com/sites/default/files/uploads/nccm_screenshot.png "nccm screenshot terminal view"
