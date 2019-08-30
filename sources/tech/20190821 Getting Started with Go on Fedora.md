[#]: collector: (lujun9972)
[#]: translator: (hello-wn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting Started with Go on Fedora)
[#]: via: (https://fedoramagazine.org/getting-started-with-go-on-fedora/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

Getting Started with Go on Fedora
======

![][1]

The [Go][2] programming language was first publicly announced in 2009, since then the language has become widely adopted. In particular Go has become a reference in the world of cloud infrastructure with big projects like [Kubernetes][3], [OpenShift][4] or [Terraform][5] for example.

Some of the main reasons for Go’s increasing popularity are the performances, the ease to write fast concurrent application, the simplicity of the language and fast compilation time. So let’s see how to get started with Go on Fedora.

### Install Go in Fedora

Fedora provides an easy way to install the Go programming language via the official repository.

```
$ sudo dnf install -y golang
$ go version
go version go1.12.7 linux/amd64
```

Now that Go is installed, let’s write a simple program, compile it and execute it.

### First program in Go

Let’s write the traditional “Hello, World!” program in Go. First create a _main.go_ file and type or copy the following.

```
package main

import "fmt"

func main() {
     fmt.Println("Hello, World!")
}
```

Running this program is quite simple.

```
$ go run main.go
Hello, World!
```

This will build a binary from main.go in a temporary directory, execute the binary, then delete the temporary directory. This command is really great to quickly run the program during development and it also highlights the speed of Go compilation.

Building an executable of the program is as simple as running it.

```
$ go build main.go
$ ./main
Hello, World!
```

### Using Go modules

Go 1.11 and 1.12 introduce preliminary support for modules. Modules are a solution to manage application dependencies. This solution is based on 2 files _go.mod_ and _go.sum_ used to explicitly define the version of the dependencies.

To show how to use modules, let’s add a dependency to the hello world program.

Before changing the code, the module needs to be initialized.

```
$ go mod init helloworld
go: creating new go.mod: module helloworld
$ ls
go.mod main  main.go
```

Next modify the main.go file as follow.

```
package main

import "github.com/fatih/color"

func main () {
     color.Blue("Hello, World!")
}
```

In the modified main.go, instead of using the standard library “_fmt_” to print the “Hello, World!”. The application uses an external library which makes it easy to print text in color.

Let’s run this version of the application.

```
$ go run main.go
Hello, World!
```

Now that the application is depending on the _github.com/fatih/color_ library, it needs to download all the dependencies before compiling it. The list of dependencies is then added to _go.mod_ and the exact version and commit hash of these dependencies is recorded in _go.sum_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-go-on-fedora/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/go-article-816x345.jpg
[2]: https://golang.org/
[3]: https://kubernetes.io/
[4]: https://www.openshift.com/
[5]: https://www.terraform.io/
