[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11691-1.html)
[#]: subject: (Easily Upload Text Snippets To Pastebin-like Services From Commandline)
[#]: via: (https://www.ostechnix.com/how-to-easily-upload-text-snippets-to-pastebin-like-services-from-commandline/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

从命令行轻松将文本片段上传到类似 Pastebin 的服务中
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-720x340.png)

每当需要在线共享代码片段时，我们想到的第一个便是 Pastebin.com，这是 Paul Dixon 于 2002 年推出的在线文本共享网站。现在，有几种可供选择的文本共享服务可以上传和共享文本片段、错误日志、配置文件、命令输出或任何类型的文本文件。如果你碰巧经常使用各种类似于 Pastebin 的服务来共享代码，那么这对你来说确实是个好消息。向 Wgetpaste 打个招呼吧，它是一个命令行 BASH 实用程序，可轻松地将文本摘要上传到类似 Pastebin 的服务中。使用 Wgetpaste 脚本，任何人都可以与自己的朋友、同事或想在类似 Unix 的系统中的命令行中查看/使用/审查代码的人快速共享文本片段。

### 安装 Wgetpaste

Wgetpaste 在 Arch Linux [Community] 存储库中可用。要将其安装在 Arch Linux 及其变体（如 Antergos 和 Manjaro Linux）上，只需运行以下命令：

```
$ sudo pacman -S wgetpaste
```

对于其他发行版，请从 [Wgetpaste 网站][1] 获取源代码，并按如下所述手动安装。

首先下载最新的 Wgetpaste tar 文件：

```
$ wget http://wgetpaste.zlin.dk/wgetpaste-2.28.tar.bz2
```

提取它：

```
$ tar -xvjf wgetpaste-2.28.tar.bz2
```

它将 tar 文件的内容提取到名为 `wgetpaste-2.28` 的文件夹中。

转到该目录：

```
$ cd wgetpaste-2.28/
```

将 `wgetpaste` 二进制文件复制到 `$PATH` 中，例如 `/usr/local/bin/`。

```
$ sudo cp wgetpaste /usr/local/bin/
```

最后，使用命令使其可执行：

```
$ sudo chmod +x /usr/local/bin/wgetpaste
```

### 将文本片段上传到类似 Pastebin 的服务中

使用 Wgetpaste 上传文本片段很简单。让我向你展示一些示例。

#### 1、上传文本文件

要使用 Wgetpaste 上传任何文本文件，只需运行：

```
$ wgetpaste mytext.txt
```

此命令将上传 `mytext.txt` 文件的内容。

示例输出：

```
Your paste can be seen here: https://paste.pound-python.org/show/eO0aQjTgExP0wT5uWyX7/
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-1.png)

你可以通过邮件、短信、whatsapp 或 IRC 等任何媒体共享 pastebin 的 URL。拥有此 URL 的人都可以访问它，并在他们选择的 Web 浏览器中查看文本文件的内容。

这是 Web 浏览器中 `mytext.txt` 文件的内容：

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-2.png)

你也可以使用 `tee` 命令显示粘贴的内容，而不是盲目地上传它们。

为此，请使用如下的 `-t` 选项。

```
$ wgetpaste -t mytext.txt
```

![][3]

#### 2、将文字片段上传到其他服务

默认情况下，Wgetpaste 会将文本片段上传到 poundpython（<https://paste.pound-python.org/>）服务。

要查看支持的服务列表，请运行：

```
$ wgetpaste -S
```

示例输出：

```
Services supported: (case sensitive):
Name: | Url:
=============|=================
bpaste | https://bpaste.net/
codepad | http://codepad.org/
dpaste | http://dpaste.com/
gists | https://api.github.com/gists
*poundpython | https://paste.pound-python.org/
```

在这里，`*` 表示默认服务。

如你所见，Wgetpaste 当前支持五种文本共享服务。我并没有全部尝试，但是我相信所有服务都可以使用。

要将内容上传到其他服务，例如 bpaste.net，请使用如下所示的 `-s` 选项。

```
$ wgetpaste -s bpaste mytext.txt
Your paste can be seen here: https://bpaste.net/show/5199e127e733
```

#### 3、从标准输入读取输入

Wgetpaste 也可以从标准输入读取。

```
$ uname -a | wgetpaste
```

此命令将上传 `uname -a` 命令的输出。

#### 4、上传命令及命令的输出

有时，你可能需要粘贴命令及其输出。为此，请在如下所示的引号内指定命令的内容。

```
$ wgetpaste -c 'ls -l'
```

这会将命令 `ls -l` 及其输出上传到 pastebin 服务。

当你想让其他人清楚地知道你刚运行的确切命令及其输出时，此功能很有用。

![][4]

如你在输出中看到的，我运行了 `ls -l` 命令。

#### 5、上载系统日志文件、配置文件

就像我已经说过的，我们可以上载你的系统中任何类型的文本文件，而不仅仅是普通的文本文件，例如日志文件、特定命令的输出等。例如，你刚刚更新了 Arch Linux 机器，最后系统损坏了。你问你的同事该如何解决此问题，他（她）想阅读 `pacman.log` 文件。 这是上传 `pacman.log` 文件内容的命令：

```
$ wgetpaste /var/log/pacman.log
```

与你的同事共享 pastebin URL，以便他/她可以查看 `pacman.log`，并通过查看日志文件来帮助你解决问题。

通常，日志文件的内容可能太长，你不希望全部共享它们。在这种情况下，只需使用 `cat` 命令读取输出，然后使用 `tail -n` 命令定义要共享的行数，最后将输出通过管道传递到 Wgetpaste，如下所示。

```
$ cat /var/log/pacman.log | tail -n 50 | wgetpaste
```

上面的命令将仅上传 `pacman.log` 文件的“最后 50 行”。

#### 6、将输入网址转换为短链接

默认情况下，Wgetpaste 将在输出中显示完整的 pastebin URL。如果要将输入 URL 转换为短链接，只需使用 `-u` 选项。

```
$ wgetpaste -u mytext.txt
Your paste can be seen here: http://tinyurl.com/y85d8gtz
```

#### 7、设定语言

默认情况下，Wgetpaste 将上传“纯文本”中的文本片段。

要列出指定服务支持的语言，请使用 `-L` 选项。

```
$ wgetpaste -L
```

该命令将列出默认服务（poundpython <https://paste.pound-python.org/>）支持的所有语言。

我们可以使用 `-l` 选项来改变它。

```
$ wgetpaste -l Bash mytext.txt
```

#### 8、在输出中禁用语法突出显示或 html

如上所述，文本片段将以特定的语言格式（纯文本、Bash 等）显示。

但是，你可以更改此行为，以使用 `-r` 选项显示原始文本摘要。

```
$ wgetpaste -r mytext.txt
Your raw paste can be seen here: https://paste.pound-python.org/raw/CUJhQ3jEmr2UvfmD2xCL/
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-5.png)

如你在上面的输出中看到的，没有语法突出显示，没有 html 格式。只是原始输出。

#### 9、更改 Wgetpaste 默认值

所有默认值（`DEFAULT_{NICK,LANGUAGE,EXPIRATION}[_${SERVICE}]` 和 `DEFAULT_SERVICE`）都可以在 `/etc/wgetpaste.conf` 中全局更改，也可以在 `~/.wgetpaste.conf` 文件中针对每个用户更改。但是，这些文件在我的系统中默认情况下并不存在。我想我们需要手动创建它们。开发人员已经在[这里][5]和[这里][6]为这两个文件提供了示例内容。只需使用给定的样本内容手动创建这些文件，并相应地修改参数即可更改 Wgetpaste 的默认设置。

#### 10、获得帮助

要显示帮助部分，请运行：

```
$ wgetpaste -h
```

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-easily-upload-text-snippets-to-pastebin-like-services-from-commandline/

作者：[SK][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: http://wgetpaste.zlin.dk/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-3.png
[4]: http://www.ostechnix.com/wp-content/uploads/2018/12/wgetpaste-4.png
[5]: http://wgetpaste.zlin.dk/zlin.conf
[6]: http://wgetpaste.zlin.dk/wgetpaste.example
