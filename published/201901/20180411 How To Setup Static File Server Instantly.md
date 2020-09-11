如何即时设置一个静态文件服务器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/serve-720x340.png)

曾经想通过网络共享你的文件或项目，但不知道怎么做？别担心！这里有一个名为 **serve** 的简单实用程序，可以通过网络即时共享你的文件。这个简单的实用程序会立即将你的系统变成一个静态文件服务器，允许你通过网络提供文件。你可以从任何设备访问这些文件，而不用担心它们的操作系统是什么。你所需的只是一个  Web 浏览器。这个实用程序还可以用来服务静态网站。它以前称为 “list” 或 “micri-list”，但现在名称已改为 “serve”（提供），这更适合这个实用程序的目的。

### 使用 Serve 来设置一个静态文件服务器

要安装 serve，首先你需要安装 NodeJS 和 NPM。参考以下链接在 Linux 中安装 NodeJS 和 NPM。
    
* [如何在 Linux 上安装 NodeJS](https://www.ostechnix.com/install-node-js-linux/)

NodeJS 和 NPM 安装完成后，运行以下命令来安装 serve：

```
$ npm install -g serve
```

完成！现在是时候 serve 文件或文件夹了。

使用 serve 的典型语法是：

```
$ serve [options] <path-to-files-or-folders>
```

### 提供特定文件或文件夹

例如，让我们共享 `Documents` 目录里的内容。为此，运行：

```
$ serve Documents/
```

示例输出：

![][2]

正如你在上图中看到的，给定目录的内容已通过两个 URL 提供网络支持。

要从本地系统访问内容，你只需打开 Web 浏览器，输入 URL `http://localhost:5000/`：

![][3]

serve 实用程序以简单的布局显示给定目录的内容。你可以下载（右键单击文件并选择“将链接另存为...”）或只在浏览器中查看它们。

如果想要在浏览器中自动打开本地地址，使用 `-o` 选项。

```
$ serve -o Documents/
```

运行上述命令后，serve 实用程序将自动打开 Web 浏览器并显示共享项的内容。

同样，要通过网络从远程系统访问共享目录，可以在浏览器地址栏中输入  `http://192.168.43.192:5000`。用你系统的 IP 替换 192.168.43.192。

### 通过不同的端口提供内容

你可能已经注意到，默认情况下，serve 实用程序使用端口 5000。因此，确保防火墙或路由器中允许使用端口 5000。如果由于某种原因被阻止，你可以使用 `-p` 选项使用不同端口来提供内容。

```
$ serve -p 1234 Documents/
```

上面的命令将通过端口 1234 提供 `Documents` 目录的内容。

![][4]

要提供文件而不是文件夹，只需给它完整的路径，如下所示。

```
$ serve Documents/Papers/notes.txt
```

只要知道路径，网络上的任何用户都可以访问共享目录的内容。

### 提供整个 `$HOME` 目录

打开终端输入

```
$ serve
```

这将通过网络共享整个 `$HOME` 目录的内容。

要停止共享，按下 `CTRL+C`。

### 提供选定的文件或文件夹

你可能不想共享所有文件或目录，只想共享其中的一些。你可以使用 `-i` 选项排除文件或目录。

```
$ serve -i Downloads/
```

以上命令将提供整个文件系统，除了 `Downloads` 目录。

### 仅在本地主机上提供内容

有时，你只想在本地系统而不是整个网络上提供内容。为此，使用 `-l` 标志，如下所示：

```
$ serve -l Documents/
```

此命令会仅在本地提供 `Documents` 目录。

![][5]

当你在共享服务器上工作时，这可能会很有用。系统中的所有用户都可以访问共享，但远程用户不能。

### 使用 SSL 提供内容

由于我们通过本地网络提供内容，因此我们不需要使用 SSL。但是，serve 实用程序可以使用 `-ssl` 选项来使用 SSL 共享内容。

```
$ serve --ssl Documents/
```

![][6]

要通过 Web 浏览器访问共享，输入 `https://localhost:5000` 或 `https://ip:5000`。

![][7]

### 通过身份验证提供内容

在上面的所有示例中，我们在没有任何身份验证的情况下提供内容，所以网络上的任何人都可以在没有任何身份验证的情况下访问共享内容。你可能会觉得应该使用用户名和密码访问某些内容。

为此，使用：

```
$ SERVE_USER=ostechnix SERVE_PASSWORD=123456 serve --auth
```

现在用户需要输入用户名（即 `ostechnix`）和密码（`123456`）来访问共享。（LCTT 译注：123456 是非常不好的密码，仅在实验情况下使用）

![][8]

serve 实用程序还有一些其它功能，例如禁用 [Gzip 压缩][9]，设置 CORS 头以允许来自任河源的请求，防止自动复制地址到剪贴板等。通过以下命令，你可以阅读完整的帮助部分。

```
$ serve help
```

好了，这就是全部了。希望这可以帮助到你。更多好东西要来了，敬请关注！

共勉！

资源：
  
* [Serve GitHub 仓库](https://github.com/zeit/serve) 

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-setup-static-file-server-instantly/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-4.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-3.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-6.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-5-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-7-1.png
[9]:https://www.ostechnix.com/how-to-compress-and-decompress-files-in-linux/
