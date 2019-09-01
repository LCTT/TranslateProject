[#]: collector: "lujun9972"
[#]: translator: "hello-wn"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11293-1.html"
[#]: subject: "Getting Started with Go on Fedora"
[#]: via: "https://fedoramagazine.org/getting-started-with-go-on-fedora/"
[#]: author: "Clément Verna https://fedoramagazine.org/author/cverna/"

在 Fefora 上开启 Go 语言之旅
======

![][1]

[Go][2] 编程语言于 2009 年首次公开发布，此后被广泛使用。特别是，Go 已经成为云基础设施领域的一种代表性语言，例如 [Kubernetes][3]、[OpenShift][4] 或 [Terraform][5] 等大型项目都使用了 Go。

Go 越来越受欢迎的原因是性能好、易于编写高并发的程序、语法简单和编译快。

让我们来看看如何在 Fedora 上开始 Go 语言编程吧。

### 在 Fedora 上安装 Go

Fedora 可以通过官方库简单快速地安装 Go 语言。

```
$ sudo dnf install -y golang
$ go version
go version go1.12.7 linux/amd64
```

既然装好了 Go ，让我们来写个简单的程序，编译并运行。

### 第一个 Go 程序

让我们来用 Go 语言写一波 “Hello, World!”。首先创建 `main.go` 文件，然后输入或者拷贝以下内容。

```
package main

import "fmt"

func main() {
     fmt.Println("Hello, World!")
}
```

运行这个程序很简单。

```
$ go run main.go
Hello, World!
```

Go 会在临时目录将 `main.go` 编译成二进制文件并执行，然后删除临时目录。这个命令非常适合在开发过程中快速运行程序，它还凸显了 Go 的编译速度。

编译一个可执行程序就像运行它一样简单。

```
$ go build main.go
$ ./main
Hello, World!
```

### 使用 Go 的模块

Go 1.11 和 1.12 引入了对模块的初步支持。模块可用于管理应用程序的各种依赖包。Go 通过 `go.mod` 和 `go.sum` 这两个文件，显式地定义依赖包的版本。

为了演示如何使用模块，让我们为 `hello world` 程序添加一个依赖。

在更改代码之前，需要初始化模块。

```
$ go mod init helloworld
go: creating new go.mod: module helloworld
$ ls
go.mod main  main.go
```

然后按照以下内容修改 `main.go` 文件。

```
package main

import "github.com/fatih/color"

func main () {
     color.Blue("Hello, World!")
}
```

在修改后的 `main.go` 中，不再使用标准库 `fmt` 来打印 “Hello, World!” ，而是使用第三方库打印出有色字体。

让我们来跑一下新版的程序吧。

```
$ go run main.go
Hello, World!
```

因为程序依赖于 `github.com/fatih/color` 库，它需要在编译前下载所有依赖包。 然后把依赖包都添加到 `go.mod`  中，并将它们的版本号和哈希值记录在 `go.sum` 中。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-go-on-fedora/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[hello-wn](https://github.com/hello-wn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/go-article-816x345.jpg
[2]: https://golang.org/
[3]: https://kubernetes.io/
[4]: https://www.openshift.com/
[5]: https://www.terraform.io/

