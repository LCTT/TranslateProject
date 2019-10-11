[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage Go projects with GVM)
[#]: via: (https://opensource.com/article/19/10/introduction-gvm)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

如何用GVM管理Go项目
======

管理Go语言环境，包括安装多个版本和使用Go版本管理器管理模块。
![正在编程的女人][1]

Go语言版本管理器([GVM][2])是管理Go语言环境的开源工具。GVM “pkgsets” 支持安装多个版本的Go并管理每个项目的模块。最初由[乔什·布斯迪克][3]开发，GVM(像它的对手 Ruby RVM一样)允许你为每个项目或项目组创建一个开发环境，分离不同的Go版本和包依赖关系，以允许更大的灵活性和防止不同版本造成的问题。

有几种管理Go包的方式，包括内置于Go中的Go1.11模块。我发现GVM简单直观，即使我不用它来管理包，我还是会用它来管理Go不同的版本的。

### 安装 GVM 

安装GVM很简单。[GVM 存储库][4]安装文档指示你下载安装程序脚本并将其传送到Bash来安装:

```
`bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)`
```

尽管越来越多的人采用这种安装方法，但是在安装之前先看看安装程序在做什么仍然是一个很好的想法。以GVM为例，安装程序脚本:

  1. 检查一些相关依赖性
  2. 克隆 GVM 存储库
  3. 使用 shell 脚本:
    * 安装 Go 语言
    * 管理 GOPATH 环境变量
    * 向bashrc、zshrc或配置文件中添加一行内容

如果你想再次检查它在做什么，你可以克隆存储库并查看 shell 脚本，然后运行 **/binscripts/gvm-installer** 使用本地脚本进行设置。

_注意:_ 因为GVM可以用来下载和编译新的Go版本，所以有一些预期的依赖关系，如 Make、Git 和 Curl。您可以在[GVM的自述文件][5]中找到完整的分发列表。

### 使用 GVM 安装和管理 GO 版本

一旦安装了GVM，你就可以使用它来安装和管理不同版本的Go。**gvm listall** 命令显示可下载和编译的可用版本的Go:
```
[chris@marvin ]$ gvm listall
$ gvm listall

gvm gos (available)

   go1
   go1.0.1
   go1.0.2
   go1.0.3

&lt;output truncated&gt;
```

安装特定的Go版本就像 **gvm install &lt;version&gt;** 一样简单，其中 **&lt;version&gt;** 是**gvm listall** 命令返回的内容之一。

假设你正在进行一个使用Go1.12.8 版本的项目。您可以使用 **gvm install go1.12.8** 安装这个版本:

```
[chris@marvin]$ gvm install go1.12.8
Installing go1.12.8...
 * Compiling...
go1.12.8 successfully installed!
```

输入 **gvm list**，你会看到Go版本1.12.8 与系统Go版本(使用操作系统的软件包管理器打包的版本)一起并存:

```
[chris@marvin]$ gvm list

gvm gos (installed)

   go1.12.8
=&gt; system
```

GVM仍在使用系统版本的Go ，由 **=&gt;**符号表示。你可以使用 **gvm use** 命令切换你的环境以使用新安装的 go1.12.8:


```
[chris@marvin]$ gvm use go1.12.8
Now using version go1.12.8

[chris@marvin]$ go version
go version go1.12.8 linux/amd64
```

GVM使管理已安装版本的Go变得极其简单，但它变得更好了！

### 使用 GVM pkgset

开箱即用，Go有一种出色而令人沮丧的管理包和模块的方式。默认情况下，如果你 **go get** 包，它将被下载到 **$GOPATH** 目录中的 **src** 和 **pkg** 目录下 ,然后可以使用 **import** 将其包含在你的Go程序中。这使得获得软件包变得很容易，特别是对于非特权用户，而不需要**sudo**或root 特权(很像Python中的**pip install --user**)。然而，在不同的项目中管理相同包的不同版本是非常困难的。

有许多方法可以尝试修复或缓解这个问题，包括实验性Go模块(Go 1.11版中增加了初步支持)和[Go dep][6](Go 模块的“官方实验”并且持续迭代)。在我发现GVM之前，我会在他们自己的Docker容器中构建和测试Go项目，以确保分离。 

GVM通过使用“pkgsets”将项目的新目录附加到安装的Go版本的默认 **$GOPATH** 上，很好地实现了项目之间包的管理和隔离，就像 **$PATH** 在Unix/Linux系统上工作一样。
 
想象它如何运行的,例子如下。首先，安装新版 Go1.12.9:

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

当GVM被告知使用新版本时，它会更改为新的 **$GOPATH**，默认**gloabl** pkgset 应用于该版本: 


```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.9/global

[chris@marvin]$ gvm pkgset list

gvm go package sets (go1.12.9)

=&gt;  global
```
尽管默认情况下没有安装额外的包，但是全局pkgset中的包对于使用该特定版本的Go的任何项目都是可用的。

现在，假设你正在启用一个新项目，它需要一个特定的包。首先，使用 GVM 创建一个新的pkgset，名为 **introToGvm**:

```
[chris@marvin]$ gvm pkgset create introToGvm

[chris@marvin]$ gvm pkgset use introToGvm
Now using version go1.12.9@introToGvm

[chris@marvin]$ gvm pkgset list

gvm go package sets (go1.12.9)

    global
=&gt;  introToGvm
```

如上所述，pkgset的一个新目录被添加到 **$GOPATH**:

```
[chris@marvin]$ echo $GOPATH
/home/chris/.gvm/pkgsets/go1.12.9/introToGvm:/home/chris/.gvm/pkgsets/go1.12.9/global
```

将目录更改为预先设置的 **introToGvm** 路径，检查目录结构，并像你使用**awk**和**bash** 一样。

```
[chris@marvin]$ cd $( awk -F':' '{print $1}' &lt;&lt;&lt; $GOPATH )
[chris@marvin]$ pwd
/home/chris/.gvm/pkgsets/go1.12.9/introToGvm

[chris@marvin]$ ls
overlay  pkg  src
```
请注意，新目录看起来很像普通的 **$GOPATH**。新的Go包使用 **go get** 命令下载并正常使用，且添加到 pkgset 中。

例如，使用以下命令获取 **gorilla/mux** 包，然后检查pkgset的目录结构:


```
[chris@marvin]$ go get github.com/gorilla/mux
[chris@marvin]$ tree
[chris@marvin introToGvm ]$ tree
.
├── overlay
│   ├── bin
│   └── lib
│       └── pkgconfig
├── pkg
│   └── linux_amd64
│       └── github.com
│           └── gorilla
│               └── mux.a
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

如你所见，**gorilla/mux** 已按预期添加到 pkgset **$GOPATH** 目录中，现在可用于使用此 pkgset 项目了。

### GVM让 Go 管理变得轻而易举

GVM 是一种直观且非侵入性的管理 Go版本和包的方式。它可以单独使用，也可以与其他 Go 模块管理技术结合使用，并利用 GVM Go 版本管理功能。按Go 版本和包依赖来分离项目使得开发更加容易，并且减少了管理版本冲突的复杂性，GVM让这变得轻而易举。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/introduction-gvm

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://github.com/moovweb/gvm
[3]: https://github.com/jbussdieker
[4]: https://github.com/moovweb/gvm#installing
[5]: https://github.com/moovweb/gvm/blob/master/README.md
[6]: https://golang.github.io/dep/
