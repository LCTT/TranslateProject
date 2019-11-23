[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11447-1.html)
[#]: subject: (How to manage Go projects with GVM)
[#]: via: (https://opensource.com/article/19/10/introduction-gvm)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

如何用 GVM 管理 Go 项目
======

> 使用 Go 版本管理器管理多个版本的 Go 语言环境及其模块。

![正在编程的女人][1]

Go 语言版本管理器（[GVM][2]）是管理 Go 语言环境的开源工具。GVM “pkgsets” 支持安装多个版本的 Go 并管理每个项目的模块。它最初由 [Josh Bussdieker][3] 开发，GVM（像它的对手 Ruby RVM 一样）允许你为每个项目或一组项目创建一个开发环境，分离不同的 Go 版本和包依赖关系，以提供更大的灵活性，防止不同版本造成的问题。

有几种管理 Go 包的方式，包括内置于 Go 中的 Go 1.11 的 Modules。我发现 GVM 简单直观，即使我不用它来管理包，我还是会用它来管理 Go 不同的版本的。

### 安装 GVM 

安装 GVM 很简单。[GVM 存储库][4]安装文档指示你下载安装程序脚本并将其传送到 Bash 来安装:

```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

尽管越来越多的人采用这种安装方法，但是在安装之前先看看安装程序在做什么仍然是一个很好的想法。以 GVM 为例，该安装程序脚本:

1. 检查一些相关依赖性
2. 克隆 GVM 存储库
3. 使用 shell 脚本：
    * 安装 Go 语言
    * 管理 `GOPATH` 环境变量
    * 向 `bashrc`、`zshrc` 或配置文件中添加一行内容

如果你想确认它在做什么，你可以克隆该存储库并查看 shell 脚本，然后运行 `./binscripts/gvm-installer` 这个本地脚本进行设置。

`注意：` 因为 GVM 可以用来下载和编译新的 Go 版本，所以有一些预期的依赖关系，如 Make、Git 和 Curl。你可以在 [GVM 的自述文件][5]中找到完整的发行版列表。

### 使用 GVM 安装和管理 GO 版本

一旦安装了 GVM，你就可以使用它来安装和管理不同版本的 Go。`gvm listall` 命令显示可下载和编译的可用版本的 Go：

```
[chris@marvin ]$ gvm listall

gvm gos (available)

   go1
   go1.0.1
   go1.0.2
   go1.0.3

<输出截断>
```

安装特定的 Go 版本就像 `gvm install <版本>` 一样简单，其中 `<版本>` 是 `gvm listall` 命令返回的版本之一。

假设你正在进行一个使用 Go1.12.8 版本的项目。你可以使用 `gvm install go1.12.8` 安装这个版本:

```
[chris@marvin]$ gvm install go1.12.8
Installing go1.12.8...
 * Compiling...
go1.12.8 successfully installed!
```

输入 `gvm list`，你会看到 Go 版本 1.12.8 与系统 Go 版本（使用操作系统的软件包管理器打包的版本）一起并存：

```
[chris@marvin]$ gvm list

gvm gos (installed)

   go1.12.8
=> system
```

GVM 仍在使用系统版本的 Go ，由 `=>` 符号表示。你可以使用 `gvm use` 命令切换你的环境以使用新安装的 go1.12.8：

```
[chris@marvin]$ gvm use go1.12.8
Now using version go1.12.8

[chris@marvin]$ go version
go version go1.12.8 linux/amd64
```

GVM 使管理已安装版本的 Go 变得极其简单，但它不止于此！

### 使用 GVM pkgset

开箱即用，Go 有一种出色而令人沮丧的管理包和模块的方式。默认情况下，如果你 `go get` 获取一个包，它将被下载到 `$GOPATH` 目录中的 `src` 和 `pkg` 目录下，然后可以使用 `import` 将其包含在你的 Go 程序中。这使得获得软件包变得很容易，特别是对于非特权用户，而不需要 `sudo` 或 root 特权（很像 Python 中的 `pip install --user`）。然而，在不同的项目中管理相同包的不同版本是非常困难的。

有许多方法可以尝试修复或缓解这个问题，包括实验性 Go Modules（Go 1.11 版中增加了初步支持）和 [Go dep][6]（Go Modules 的“官方实验”并且持续迭代）。在我发现 GVM 之前，我会在一个 Go 项目自己的 Docker 容器中构建和测试它，以确保分离。 

GVM 通过使用 “pkgsets” 将项目的新目录附加到安装的 Go 版本的默认 `$GOPATH` 上，很好地实现了项目之间包的管理和隔离，就像 `$PATH` 在 Unix/Linux 系统上工作一样。
 
想象它如何运行的。首先，安装新版 Go 1.12.9：

```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.8/global

[chris@marvin]$ gvm install go1.12.9
Installing go1.12.9...
 * Compiling...
go1.12.9 successfully installed

[chris@marvin]$ gvm use go1.12.9
Now using version go1.12.9
```

当 GVM 被告知使用新版本时，它会更改为新的 `$GOPATH`，默认 `gloabl` pkgset 应用于该版本: 

```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.9/global

[chris@marvin]$ gvm pkgset list

gvm go package sets (go1.12.9)

=>  global
```

尽管默认情况下没有安装额外的包，但是全局 pkgset 中的包对于使用该特定版本的 Go 的任何项目都是可用的。

现在，假设你正在启用一个新项目，它需要一个特定的包。首先，使用 GVM 创建一个新的 pkgset，名为 `introToGvm`:

```
[chris@marvin]$ gvm pkgset create introToGvm

[chris@marvin]$ gvm pkgset use introToGvm
Now using version go1.12.9@introToGvm

[chris@marvin]$ gvm pkgset list

gvm go package sets (go1.12.9)

    global
=>  introToGvm
```

如上所述，pkgset 的一个新目录被添加到 `$GOPATH`：

```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.9/introToGvm:/home/chris/.gvm/pkgsets/go1.12.9/global
```

将目录更改为预先设置的 `introToGvm` 路径，检查目录结构，这里使用 `awk` 和 `bash` 完成。

```
[chris@marvin]$ cd $( awk -F':' '{print $1}' <<< $GOPATH )
[chris@marvin]$ pwd
/home/chris/.gvm/pkgsets/go1.12.9/introToGvm

[chris@marvin]$ ls
overlay  pkg  src
```

请注意，新目录看起来很像普通的 `$GOPATH`。新的 Go 包使用同样的 `go get` 命令下载并正常使用，且添加到 pkgset 中。

例如，使用以下命令获取 `gorilla/mux` 包，然后检查 pkgset 的目录结构：

```
[chris@marvin]$ go get github.com/gorilla/mux
[chris@marvin]$ tree
[chris@marvin introToGvm ]$ tree
.
├── overlay
│   ├── bin
│   └── lib
│       └── pkgconfig
├── pkg
│   └── linux_amd64
│       └── github.com
│           └── gorilla
│               └── mux.a
src/
└── github.com
    └── gorilla
        └── mux
            ├── AUTHORS
            ├── bench_test.go
            ├── context.go
            ├── context_test.go
            ├── doc.go
            ├── example_authentication_middleware_test.go
            ├── example_cors_method_middleware_test.go
            ├── example_route_test.go
            ├── go.mod
            ├── LICENSE
            ├── middleware.go
            ├── middleware_test.go
            ├── mux.go
            ├── mux_test.go
            ├── old_test.go
            ├── README.md
            ├── regexp.go
            ├── route.go
            └── test_helpers.go
```

如你所见，`gorilla/mux` 已按预期添加到 pkgset `$GOPATH` 目录中，现在可用于使用此 pkgset 项目了。

### GVM 让 Go 管理变得轻而易举

GVM 是一种直观且非侵入性的管理 Go 版本和包的方式。它可以单独使用，也可以与其他 Go 模块管理技术结合使用并利用 GVM Go 版本管理功能。按 Go 版本和包依赖来分离项目使得开发更加容易，并且减少了管理版本冲突的复杂性，GVM 让这变得轻而易举。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/introduction-gvm

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://github.com/moovweb/gvm
[3]: https://github.com/jbussdieker
[4]: https://github.com/moovweb/gvm#installing
[5]: https://github.com/moovweb/gvm/blob/master/README.md
[6]: https://golang.github.io/dep/
