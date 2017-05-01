GoTTY：把你的 Linux 终端放到浏览器里面
============================================================

GoTTY 是一个简单的基于 Go 语言的命令行工具，它可以将你的终端（TTY）作为 web 程序共享。它会将命令行工具转换为 web 程序。

它使用 Chrome OS 的终端仿真器（hterm）来在 Web 浏览器上执行基于 JavaScript 的终端。重要的是，GoTTY 运行了一个 Web 套接字服务器，它基本上是将 TTY 的输出传输给客户端，并从客户端接收输入（即允许客户端的输入），并将其转发给 TTY。

它的架构（hterm + web socket 的想法）灵感来自 [Wetty 项目][1]，它使终端能够通过 HTTP 和 HTTPS 使用。

### 先决条件

你需要在 Linux 中安装 [GoLang (Go 编程语言)][2] 环境来运行 GoTTY。

### 如何在 Linux 中安装 GoTTY

如果你已经有一个[可以工作的 Go 语言环境][3]，运行下面的 `go get` 命令来安装它：

```
# go get github.com/yudai/gotty
```

上面的命令会在你的 `GOBIN` 环境变量中安装 GOTTY 的二进制，尝试检查下是否如此：

```
# $GOPATH/bin/
```

[
 ![Check GOBIN Environment](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Go-Environment.png) 
][4]

*检查 GOBIN 环境*

### 如何在 Linux 中使用 GoTTY

要运行它，你可以使用 GOBIN 环境变量并用命令补全：

```
# $GOBIN/gotty
```

另外，要不带完整命令路径运行 GoTTY 或其他 Go 程序，使用 `export` 命令将 `GOBIN` 变量添加到 `~/.profile` 文件中的 `PATH` 环境变量中。

```
export PATH="$PATH:$GOBIN"
```

保存文件并关闭。接着运行 `source` 来使更改生效：

```
# source ~/.profile
```

运行 GoTTY 命令的常规语法是：

```
Usage: gotty [options] <Linux command here> [<arguments...>]
```

现在用 GoTTY 运行任意命令，如 [df][5] 来从 Web 浏览器中查看系统分区空间及使用率。

```
# gotty df -h
```

GoTTY 默认会在 8080 启动一个 Web 服务器。在浏览器中打开 URL：`http://127.0.0.1:8080/`，你会看到运行的命令仿佛运行在终端中一样：

[
 ![Gotty Linux Disk Usage](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Linux-Disk-Usage.png) 
][6]

*Gotty 查看 Linux 磁盘使用率*

### 如何在 Linux 中自定义 GoTTY

你可以在 `~/.gotty` 配置文件中修改默认选项以及终端，如果该文件存在，它会在每次启动时加载这个文件。

这是由 getty 命令读取的主要自定义文件，因此，按如下方式创建：

```
# touch ~/.gotty
```

并为配置选项设置你自己的有效值（在此处查找所有配置选项）以自定义 GoTTY，例如：

```
// Listen at port 9000 by default
port = "9000"
// Enable TSL/SSL by default
enable_tls = true
// hterm preferences
// Smaller font and a little bit bluer background color
preferences {
font_size = 5,
background_color = "rgb(16, 16, 32)"
}
```

你可以使用命令行中的 `--html` 选项设置你自己的 `index.html` 文件：

```
# gotty --index /path/to/index.html uptime
```

### 如何在 GoTTY 中使用安全功能

由于 GoTTY 默认不提供可靠的安全保障，你需要手动使用下面说明的某些安全功能。

#### 允许客户端在终端中运行命令

请注意，默认情况下，GoTTY 不允许客户端输入到TTY中，它只支持窗口缩放。

但是，你可以使用 `-w` 或 `--permit-write` 选项来允许客户端写入 TTY，但是并不推荐这么做因为会有安全威胁。

以下命令会使用 [vi 命令行编辑器][7]在 Web 浏览器中打开文件 `fossmint.txt` 进行编辑：

```
# gotty -w vi fossmint.txt
```

以下是从 Web 浏览器看到的 vi 界面（像平常一样使用 vi 命令）：

[
 ![Gotty Web Vi Editor](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Web-Vi-Editor.png) 
][8]

*Gotty Web Vi 编辑器*

#### 使用基本（用户名和密码）验证运行 GoTTY

尝试激活基本身份验证机制，这样客户端将需要输入指定的用户名和密码才能连接到 GoTTY 服务器。

以下命令使用 `-c` 选项限制客户端访问，以向用户询问指定的凭据（用户名：`test` 密码：`@67890`）：

```
# gotty -w -p "9000" -c "test@67890" glances
```
[
 ![Gotty with Basic Authentication](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-use-basic-authentication.png) 
][9]

*使用基本验证运行 GoTTY*

#### Gotty 生成随机 URL

限制访问服务器的另一种方法是使用 `-r` 选项。GoTTY 会生成一个随机 URL，这样只有知道该 URL 的用户才可以访问该服务器。

还可以使用 `-title-format "GoTTY – {{ .Command }} ({{ .Hostname }})"` 选项来定义浏览器标题。[glances][10] 用于显示系统监控统计信息：

```
# gotty -r --title-format "GoTTY - {{ .Command }} ({{ .Hostname }})" glances
```

以下是从浏览器中看到的上面的命令的结果：

[
 ![Gotty Random URL for Glances Linux Monitoring](http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Random-URL-for-Glances-Linux-Monitoring.png) 
][11]

*使用 Gotty 随机 URL 用于 Glances 系统监控*

#### 带有 SSL/TLS 使用 GoTTY

因为默认情况下服务器和客户端之间的所有连接都不加密，当你通过 GoTTY 发送秘密信息（如用户凭据或任何其他信息）时，你需要使用 `-t` 或 `--tls` 选项才能在会话中启用 TLS/SSL：

默认情况下，GoTTY 会读取证书文件 `~/.gotty.crt` 和密钥文件 `~/.gotty.key`，因此，首先使用下面的 `openssl` 命令创建一个自签名的证书以及密钥（ 回答问题以生成证书和密钥文件）：

```
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/.gotty.key -out ~/.gotty.crt
```

按如下所示，通过启用 SSL/TLS，以安全方式使用 GoTTY：

```
# gotty -tr --title-format "GoTTY - {{ .Command }} ({{ .Hostname }})" glances
```

#### 与多个客户端分享你的终端

你可以使用[终端复用程序][12]来与多个客户端共享一个进程，以下命令会启动一个名为 gotty 的新 [tmux 会话][13]来运行 [glances][14]（确保你安装了 tmux）：

```
# gotty tmux new -A -s gotty glances 
```

要读取不同的配置文件，像下面那样使用 `–config "/path/to/file"` 选项：

```
# gotty -tr --config "~/gotty_new_config" --title-format "GoTTY - {{ .Command }} ({{ .Hostname }})" glances
```

要显示 GoTTY 版本，运行命令：

```
# gotty -v 
```

访问 GoTTY GitHub 仓库以查找更多使用示例：[https://github.com/yudai/gotty][15] 。

就这样了！你有尝试过了吗？如何知道 GoTTY 的？通过下面的反馈栏与我们分享你的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，即将成为 Linux SysAdmin 和网络开发人员，目前是 TecMint 的内容创作者，他喜欢在电脑上工作，并坚信分享知识。


----------


via: http://www.tecmint.com/gotty-share-linux-terminal-in-web-browser/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/access-linux-server-terminal-in-web-browser-using-wetty/
[2]:http://www.tecmint.com/install-go-in-linux/
[3]:http://www.tecmint.com/install-go-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Go-Environment.png
[5]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Linux-Disk-Usage.png
[7]:http://www.tecmint.com/vi-editor-usage/
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Web-Vi-Editor.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-use-basic-authentication.png
[10]:http://www.tecmint.com/glances-an-advanced-real-time-system-monitoring-tool-for-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Gotty-Random-URL-for-Glances-Linux-Monitoring.png
[12]:http://www.tecmint.com/tmux-to-access-multiple-linux-terminals-inside-a-single-console/
[13]:http://www.tecmint.com/tmux-to-access-multiple-linux-terminals-inside-a-single-console/
[14]:http://www.tecmint.com/glances-an-advanced-real-time-system-monitoring-tool-for-linux/
[15]:https://github.com/yudai/gotty
[16]:http://www.tecmint.com/author/aaronkili/
[17]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[18]:http://www.tecmint.com/free-linux-shell-scripting-books/
