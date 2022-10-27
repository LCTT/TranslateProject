[#]: subject: "My favorite build options for Go"
[#]: via: "https://opensource.com/article/22/4/go-build-options"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14525-1.html"

我最喜欢的 Go 构建选项
======

> 这些方便的 Go 构建选项可以帮助你更好地理解 Go 的编译过程。

![](https://img.linux.net.cn/data/attachment/album/202204/30/172121exam5k8vx45kzk7p.jpg)

学习一门新的编程语言最令人欣慰的部分之一，就是最终运行了一个可执行文件，并获得预期的输出。当我开始学习 Go 这门编程语言时，我先是阅读一些示例程序来熟悉语法，然后是尝试写一些小的测试程序。随着时间的推移，这种方法帮助我熟悉了编译和构建程序的过程。

Go 的构建选项提供了更好地控制构建过程的方法。它们还可以提供额外的信息，帮助把这个过程分成更小的部分。在这篇文章中，我将演示我所使用的一些选项。注意：我使用的“<ruby>构建<rt>build</rt></ruby>”和“<ruby>编译<rt>compile</rt></ruby>”这两个词是同一个意思。

### 开始使用 Go

我使用的 Go 版本是 1.16.7。但是，这里给出的命令应该也能在最新的版本上运行。如果你没有安装 Go，你可以从 [Go 官网][2] 上下载它，并按照说明进行安装。你可以通过打开一个命令提示符，并键入下面的命令来验证你所安装的版本：

```
$ go version
```

你应该会得到类似下面这样的输出，具体取决于你安装的版本：

```
go version go1.16.7 linux/amd64
```

### 基本的 Go 程序的编译和执行方法

我将从一个在屏幕上简单打印 “Hello World” 的 Go 程序示例开始，就像下面这样：

```
$ cat hello.go
package main

import "fmt"

func main() {
    fmt.Println("Hello World")
}
```

在讨论更高级的选项之前，我将解释如何编译这个 Go 示例程序。我使用了 `build` 命令，后面跟着 Go 程序的源文件名，本例中是 `hello.go`，就像下面这样：

```
$ go build hello.go
```

如果一切工作正常，你应该看到在你的当前目录下创建了一个名为 `hello` 的可执行文件。你可以通过使用 `file` 命令验证它是 ELF 二进制可执行格式（在 Linux 平台上）。你也可以直接执行它，你会看到它输出 “Hello World”。

```
$ ls
hello  hello.go

$ file ./hello
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

$ ./hello
Hello World
```

Go 提供了一个方便的 `run` 命令，以便你只是想看看程序是否能正常工作，并获得预期的输出，而不想生成一个最终的二进制文件。请记住，即使你在当前目录中没有看到可执行文件，Go 仍然会在某个地方编译并生成可执行文件并运行它，然后把它从系统中删除。我将在本文后面的章节中解释。

```
$ go run hello.go
Hello World

$ ls
hello.go
```

### 更多细节

上面的命令就像一阵风一样，一下子就运行完了我的程序。然而，如果你想知道 Go 在编译这些程序的过程中做了什么，Go 提供了一个 `-x` 选项，它可以打印出 Go 为产生这个可执行文件所做的一切。

简单看一下你就会发现，Go 在 `/tmp` 内创建了一个临时工作目录，并生成了可执行文件，然后把它移到了 Go 源程序所在的当前目录。

```
$ go build -x hello.go

WORK=/tmp/go-build1944767317
mkdir -p $WORK/b001/

<< snip >>

mkdir -p $WORK/b001/exe/
cd .
/usr/lib/golang/pkg/tool/linux_amd64/link -o $WORK \
/b001/exe/a.out -importcfg $WORK/b001 \
/importcfg.link -buildmode=exe -buildid=K26hEYzgDkqJjx2Hf-wz/\
nDueg0kBjIygx25rYwbK/W-eJaGIOdPEWgwC6o546 \
/K26hEYzgDkqJjx2Hf-wz -extld=gcc /root/.cache/go-build /cc \
/cc72cb2f4fbb61229885fc434995964a7a4d6e10692a23cc0ada6707c5d3435b-d
/usr/lib/golang/pkg/tool/linux_amd64/buildid -w $WORK \
/b001/exe/a.out # internal
mv $WORK/b001/exe/a.out hello
rm -r $WORK/b001/
```

这有助于解决在程序运行后却在当前目录下没有生成可执行文件的谜团。使用 `-x` 显示可执行文件确实在 `/tmp` 工作目录下创建并被执行了。然而，与 `build` 命令不同的是，可执行文件并没有移动到当前目录，这使得看起来没有可执行文件被创建。

```
$ go run -x hello.go


mkdir -p $WORK/b001/exe/
cd .
/usr/lib/golang/pkg/tool/linux_amd64/link -o $WORK/b001 \
/exe/hello -importcfg $WORK/b001/importcfg.link -s -w -buildmode=exe -buildid=hK3wnAP20DapUDeuvAAS/E_TzkbzwXz6tM5dEC8Mx \
/7HYBzuaDGVdaZwSMEWAa/hK3wnAP20DapUDeuvAAS -extld=gcc \
/root/.cache/go-build/75/ \
7531fcf5e48444eed677bfc5cda1276a52b73c62ebac3aa99da3c4094fa57dc3-d
$WORK/b001/exe/hello
Hello World
```

### 模仿编译而不产生可执行文件

假设你不想编译程序并产生一个实际的二进制文件，但你确实想看到这个过程中的所有步骤。你可以通过使用 `-n` 这个构建选项来做到这一点，该选项会打印出通常的执行步骤，而不会实际创建二进制文件。

```
$ go build -n hello.go
```

### 保存临时目录

很多工作都发生在 `/tmp` 工作目录中，一旦可执行文件被创建和运行，它就会被删除。但是如果你想看看哪些文件是在编译过程中创建的呢？Go 提供了一个 `-work` 选项，它可以在编译程序时使用。`-work` 选项除了运行程序外，还打印了工作目录的路径，但它并不会在这之后删除工作目录，所以你可以切换到该目录，检查在编译过程中创建的所有文件。 

```
$ go run -work hello.go
WORK=/tmp/go-build3209320645
Hello World

$ find /tmp/go-build3209320645
/tmp/go-build3209320645
/tmp/go-build3209320645/b001
/tmp/go-build3209320645/b001/importcfg.link
/tmp/go-build3209320645/b001/exe
/tmp/go-build3209320645/b001/exe/hello

$ /tmp/go-build3209320645/b001/exe/hello
Hello World
```

### 其他编译选项

如果说，你想手动编译程序，而不是使用 Go 的 `build` 和 `run` 这两个方便的命令，最后得到一个可以直接由你的操作系统（这里指 Linux）运行的可执行文件。那么，你该怎么做呢？这个过程可以分为两部分：编译和链接。你可以使用 `tool` 选项来看看它是如何工作的。

首先，使用 `tool compile` 命令产生结果的 `ar` 归档文件，它包含了 `.o` 中间文件。接下来，对这个 `hello.o` 文件执行 `tool link` 命令，产生最终的可执行文件，然后你就可以运行它了。

```
$ go tool compile hello.go

$ file hello.o
hello.o: current ar archive

$ ar t hello.o
__.PKGDEF
_go_.o

$ go tool link -o hello hello.o

$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

$ ./hello
Hello World
```

如果你想进一步查看基于 `hello.o` 文件产生可执行文件的链接过程，你可以使用 `-v` 选项，它会搜索每个 Go 可执行文件中包含的 `runtime.a` 文件。

```
$ go tool link -v -o hello hello.o
HEADER = -H5 -T0x401000 -R0x1000
searching for runtime.a in /usr/lib/golang/pkg/linux_amd64/runtime.a
82052 symbols, 18774 reachable
        1 package symbols, 1106 hashed symbols, 77185 non-package symbols, 3760 external symbols
81968 liveness data
```

### 交叉编译选项

现在我已经解释了 Go 程序的编译过程，接下来，我将演示 Go 如何通过在实际的 `build` 命令之前提供 `GOOS` 和 `GOARCH` 这两个环境变量，来允许你构建针对不同硬件架构和操作系统的可执行文件。

这有什么用呢？举个例子，你会发现为 ARM（arch64）架构制作的可执行文件不能在英特尔（x86_64）架构上运行，而且会产生一个 Exec 格式错误。

下面的这些选项使得生成跨平台的二进制文件变得小菜一碟：

```
$ GOOS=linux GOARCH=arm64 go build hello.go

$ file ./hello
./hello: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, not stripped

$ ./hello
bash: ./hello: cannot execute binary file: Exec format error

$ uname -m
x86_64
```

你可以阅读我之前的博文，以更多了解我在 [使用 Go 进行交叉编译][3] 方面的经验。

### 查看底层汇编指令

源代码并不会直接转换为可执行文件，尽管它生成了一种中间汇编格式，然后最终被组装为可执行文件。在 Go 中，这被映射为一种中间汇编格式，而不是底层硬件汇编指令。

要查看这个中间汇编格式，请在使用 `build` 命令时，提供 `-gcflags` 选项，后面跟着 `-S`。这个命令将会显示使用到的汇编指令：

```
$ go build -gcflags="-S" hello.go
# command-line-arguments
"".main STEXT size=138 args=0x0 locals=0x58 funcid=0x0
        0x0000 00000 (/test/hello.go:5) TEXT    "".main(SB), ABIInternal, $88-0
        0x0000 00000 (/test/hello.go:5) MOVQ    (TLS), CX
        0x0009 00009 (/test/hello.go:5) CMPQ    SP, 16(CX)
        0x000d 00013 (/test/hello.go:5) PCDATA  $0, $-2
        0x000d 00013 (/test/hello.go:5) JLS     128

<< snip >>
```

你也可以使用 `objdump -s` 选项，来查看已经编译好的可执行程序的汇编指令，就像下面这样：

```
$ ls
hello  hello.go

$ go tool objdump -s main.main hello
TEXT main.main(SB) /test/hello.go
  hello.go:5            0x4975a0                64488b0c25f8ffffff      MOVQ FS:0xfffffff8, CX                  
  hello.go:5            0x4975a9                483b6110                CMPQ 0x10(CX), SP                       
  hello.go:5            0x4975ad                7671                    JBE 0x497620                            
  hello.go:5            0x4975af                4883ec58                SUBQ $0x58, SP                          
  hello.go:6            0x4975d8                4889442448              MOVQ AX, 0x48(SP)                       

<< snip >>
```

### 分离二进制文件以减少其大小

Go 的二进制文件通常比较大。例如, 一个简单的 “Hello World” 程序将会产生一个 1.9M 大小的二进制文件。

```
$ go build hello.go
$
$ du -sh hello
1.9M    hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
$
```

为了减少生成的二进制文件的大小，你可以分离执行过程中不需要的信息。使用 `-ldflags` 和 `-s -w` 选项可以使生成的二进制文件略微变小为 1.3M。

```
$ go build -ldflags="-s -w" hello.go
$
$ du -sh hello
1.3M    hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
$
```

### 总结

我希望这篇文章向你介绍了一些方便的 Go 编译选项，同时帮助了你更好地理解 Go 编译过程。关于构建过程的其他信息和其他有趣的选项，请参考 Go 命令帮助：

```
$ go help build
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/4/go-build-options

作者：[Gaurav Kamathe][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/build_structure_tech_program_code_construction.png
[2]: https://go.dev/doc/install
[3]: https://opensource.com/article/21/1/go-cross-compiling
