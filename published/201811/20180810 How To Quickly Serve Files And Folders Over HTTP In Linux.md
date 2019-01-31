如何在 Linux 中快速地通过 HTTP 提供文件访问服务
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/http-720x340.png)

如今，我有很多方法来通过 Web 浏览器为局域网中的其他系统提供单个文件或整个目录的访问。我在我的 Ubuntu 测试机上测试了这些方法，它们如下面描述的那样运行正常。如果你想知道如何在类 Unix 操作系统中通过 HTTP 轻松快速地提供文件和文件夹的访问服务，以下方法之一肯定会有所帮助。

### 在 Linux 中通过 HTTP 访问文件和文件夹

**免责声明：**此处给出的所有方法适用于安全的局域网。由于这些方法没有任何安全机制，因此**不建议在生产环境中使用它们**。你注意了！

#### 方法 1 - 使用 simpleHTTPserver（Python）

我们写了一篇简要的指南来设置一个简单的 http 服务器，以便在以下链接中即时共享文件和目录。如果你有一个安装了 Python 的系统，这个方法非常方便。

- [如何使用 simpleHTTPserver 设置一个简单的文件服务器](https://www.ostechnix.com/how-to-setup-a-file-server-in-minutes-using-python/)

#### 方法 2 - 使用 Quickserve（Python）

此方法针对 Arch Linux 及其衍生版。有关详细信息，请查看下面的链接。

- [如何在 Arch Linux 中即时共享文件和文件夹](https://www.ostechnix.com/instantly-share-files-folders-arch-linux/)

#### 方法 3 - 使用 Ruby

在此方法中，我们使用 Ruby 在类 Unix 系统中通过 HTTP 提供文件和文件夹访问。按照以下链接中的说明安装 Ruby 和 Rails。

- [在 CentOS 和 Ubuntu 中安装 Ruby on Rails](https://www.ostechnix.com/install-ruby-rails-ubuntu-16-04/)

安装 Ruby 后，进入要通过网络共享的目录，例如 ostechnix：

```
$ cd ostechnix
```

并运行以下命令：

```
$ ruby -run -ehttpd . -p8000
[2018-08-10 16:02:55] INFO WEBrick 1.4.2
[2018-08-10 16:02:55] INFO ruby 2.5.1 (2018-03-29) [x86_64-linux]
[2018-08-10 16:02:55] INFO WEBrick::HTTPServer#start: pid=5859 port=8000
```

确保在路由器或防火墙中打开端口 8000。如果该端口已被其他一些服务使用，那么请使用不同的端口。

现在你可以使用 URL 从任何远程系统访问此文件夹的内容 - `http:// <ip-address>:8000`。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/ruby-http-server.png)

要停止共享，请按 `CTRL+C`。

#### 方法 4 - 使用 Http-server（NodeJS）

[Http-server][1] 是一个用 NodeJS 编写的简单的可用于生产环境的命令行 http 服务器。它不需要配置，可用于通过 Web 浏览器即时共享文件和目录。

按如下所述安装 NodeJS。

- [如何在 Linux 上安装 NodeJS](https://www.ostechnix.com/install-node-js-linux/)

安装 NodeJS 后，运行以下命令安装 http-server。

```
$ npm install -g http-server
```

现在进入任何目录并通过 HTTP 共享其内容，如下所示。

```
$ cd ostechnix

$ http-server -p 8000
Starting up http-server, serving ./
Available on:
 http://127.0.0.1:8000
 http://192.168.225.24:8000
 http://192.168.225.20:8000
Hit CTRL-C to stop the server
```

现在你可以使用 URL 从任何远程系统访问此文件夹的内容 - `http:// <ip-address>:8000`。

![](http://www.ostechnix.com/wp-content/uploads/2018/08/nodejs-http-server.png)

要停止共享，请按 `CTRL+C`。

#### 方法 5 - 使用 Miniserve（Rust）

[**Miniserve**][2] 是另一个命令行程序，它允许你通过 HTTP 快速访问文件。它是一个非常快速、易于使用的跨平台程序，它用 Rust 编程语言编写。与上面的程序/方法不同，它提供身份验证支持，因此你可以为共享设置用户名和密码。

按下面的链接在 Linux 系统中安装 Rust。

- [在 Linux 上安装 Rust 编程语言](https://www.ostechnix.com/install-rust-programming-language-in-linux/)

安装 Rust 后，运行以下命令安装 miniserve：

```
$ cargo install miniserve
```

或者，你可以在其[发布页][3]下载二进制文件并使其可执行。

```
$ chmod +x miniserve-linux
```

然后，你可以使用命令运行它（假设 miniserve 二进制文件下载到当前的工作目录中）：

```
$ ./miniserve-linux <path-to-share>
```

**用法**

要提供目录访问：

```
$ miniserve <path-to-directory>
```

**示例：**

```
$ miniserve /home/sk/ostechnix/
miniserve v0.2.0
Serving path /home/sk/ostechnix at http://[::]:8080, http://localhost:8080
Quit by pressing CTRL-C
```

现在，你可以在本地系统使用 URL – `http://localhost:8080` 访问共享，或者在远程系统使用 URL – `http://<ip-address>:8080` 访问。

要提供单个文件访问：

```
$ miniserve <path-to-file>
```

**示例：**

```
$ miniserve ostechnix/file.txt
```

带用户名和密码提供文件/文件夹访问：

```
$ miniserve --auth joe:123 <path-to-share>
```

绑定到多个接口：

```
$ miniserve -i 192.168.225.1 -i 10.10.0.1 -i ::1 -- <path-to-share>
```

如你所见，我只给出了 5 种方法。但是，本指南末尾附带的链接中还提供了几种方法。也去测试一下它们。此外，收藏并时不时重新访问它来检查将来是否有新的方法。

今天就是这些。希望这篇文章有用。还有更多的好东西。敬请期待！

干杯！

### 资源

- [单行静态 http 服务器大全](https://gist.github.com/willurd/5720255)

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-quickly-serve-files-and-folders-over-http-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.npmjs.com/package/http-server
[2]:https://github.com/svenstaro/miniserve
[3]:https://github.com/svenstaro/miniserve/releases
